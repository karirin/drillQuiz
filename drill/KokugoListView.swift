//
//  KokugoListView.swift
//  it
//
//  Created by Apple on 2024/03/09.
//  Updated with Modern UI/UX
//

import SwiftUI
import AVFoundation
import Firebase

struct KokugoListView: View {
    // MARK: - Properties
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresenting: Bool
    
    // Navigation States
    @State private var isPresentingQuizBeginner: Bool = false
    @State private var isPresentingQuizIntermediate: Bool = false
    @State private var isPresentingQuizAdvanced: Bool = false
    @State private var isPresentingQuizNetwork: Bool = false
    @State private var isPresentingQuizSecurity: Bool = false
    @State private var isPresentingQuizGod: Bool = false
    @State private var isPresentingQuizIncorrectAnswer: Bool = false
    
    // UI States
    @State private var isIncorrectAnswersEmpty: Bool = true
    @State private var isLoading: Bool = true
    @State private var preFlag: Bool = false
    @State private var userPreFlag: Int = 0
    @State private var tutorialNum: Int = 0
    @State private var buttonRect: CGRect = .zero
    
    private let theme = SubjectTheme.kokugo
    
    // Grade Data
    private let grades: [(grade: Int, title: String, subtitle: String)] = [
        (1, "ひらがな・カタカナ", "文字の基本を学ぼう"),
        (2, "漢字の読み書き", "基礎漢字をマスター"),
        (3, "文章の読解", "読む力を育てよう"),
        (4, "言葉のきまり", "文法の基礎"),
        (5, "敬語・表現", "正しい日本語"),
        (6, "文学・作文", "中学準備の国語")
    ]
    
    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background
            SubjectBackgroundView(theme: theme)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    // Review Section
                    reviewSection
                    
                    // Grades Section
                    gradesSection
                    
                    Spacer(minLength: 100)
                }
                .padding(.top, 16)
            }
        }
        .onAppear(perform: setupView)
        .fullScreenCover(isPresented: $preFlag) {
            PreView(audioManager: audioManager)
        }
        .fullScreenCover(isPresented: $isPresentingQuizIncorrectAnswer) {
            IncorrectKokugoListView(isPresenting: $isPresentingQuizIncorrectAnswer)
        }
        .fullScreenCover(isPresented: $isPresentingQuizBeginner) {
            Kokugo1ListView(isPresenting: $isPresentingQuizBeginner)
        }
        .fullScreenCover(isPresented: $isPresentingQuizIntermediate) {
            Kokugo2ListView(isPresenting: $isPresentingQuizIntermediate)
        }
        .fullScreenCover(isPresented: $isPresentingQuizGod) {
            Kokugo3ListView(isPresenting: $isPresentingQuizGod)
        }
        .fullScreenCover(isPresented: $isPresentingQuizAdvanced) {
            Kokugo4ListView(isPresenting: $isPresentingQuizAdvanced)
        }
        .fullScreenCover(isPresented: $isPresentingQuizNetwork) {
            Kokugo5ListView(isPresenting: $isPresentingQuizNetwork)
        }
        .fullScreenCover(isPresented: $isPresentingQuizSecurity) {
            Kokugo6ListView(isPresenting: $isPresentingQuizSecurity)
        }
        .onChange(of: isPresentingQuizBeginner) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizIntermediate) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizAdvanced) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizNetwork) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizSecurity) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizGod) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizIncorrectAnswer) { _ in refreshIncorrectAnswers() }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Review Section
    private var reviewSection: some View {
        VStack(spacing: 12) {
            SectionHeader(title: "復習問題", theme: theme)
            
            ReviewCard(
                subjectName: "国語",
                theme: theme,
                hasIncorrectAnswers: !isIncorrectAnswersEmpty,
                isLoading: isLoading,
                isLocked: userPreFlag != 1
            ) {
                audioManager.playKetteiSound()
                if userPreFlag != 1 {
                    preFlag = true
                } else if !isIncorrectAnswersEmpty {
                    isPresentingQuizIncorrectAnswer = true
                }
            }
        }
    }
    
    // MARK: - Grades Section
    private var gradesSection: some View {
        VStack(spacing: 12) {
            SectionHeader(title: "学年を選択", theme: theme)
            
            ForEach(Array(grades.enumerated()), id: \.offset) { index, gradeData in
                GradeCard(
                    grade: gradeData.grade,
                    title: gradeData.title,
                    theme: theme
                ) {
                    audioManager.playKetteiSound()
                    navigateToGrade(index)
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    private func setupView() {
        fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { _ in
            authManager.fetchPreFlag()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                userPreFlag = authManager.userPreFlag
                isLoading = false
            }
        }
        
        authManager.fetchUserInfo { (_, _, _, _, _, tutorialNum) in
            if let fetchedTutorialNum = tutorialNum {
                self.tutorialNum = fetchedTutorialNum
            }
        }
    }
    
    private func refreshIncorrectAnswers() {
        fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { _ in }
    }
    
    private func navigateToGrade(_ index: Int) {
        switch index {
        case 0: isPresentingQuizBeginner = true
        case 1: isPresentingQuizIntermediate = true
        case 2: isPresentingQuizGod = true
        case 3: isPresentingQuizAdvanced = true
        case 4: isPresentingQuizNetwork = true
        case 5: isPresentingQuizSecurity = true
        default: break
        }
    }
    
    private func fetchNumberOfIncorrectAnswers(userId: String, completion: @escaping (Int) -> Void) {
        let ref = Database.database().reference().child("IncorrectKokugoAnswers").child(userId)
        ref.observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.childrenCount
            completion(Int(count))
            self.isIncorrectAnswersEmpty = (count == 0)
        }
    }
}

#Preview {
    KokugoListView(isPresenting: .constant(false))
}
