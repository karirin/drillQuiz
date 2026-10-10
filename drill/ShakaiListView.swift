//
//  ShakaiListView.swift
//  it
//
//  Created by Apple on 2024/03/09.
//  Updated with Modern UI/UX
//

import SwiftUI
import AVFoundation
import Firebase

struct ShakaiListView: View {
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
    @ObservedObject private var appState = AppState.shared
    @State private var tutorialNum: Int = 0
    @State private var buttonRect: CGRect = .zero
    
    private let theme = SubjectTheme.shakai
    
    // Grade Data
    private let grades: [(grade: Int, title: String, subtitle: String)] = [
        (1, "身近な地域", "まわりを見てみよう"),
        (2, "地図の読み方", "地図を使おう"),
        (3, "日本の地理", "日本を知ろう"),
        (4, "日本の歴史", "歴史を学ぼう"),
        (5, "世界の国々", "世界を知ろう"),
        (6, "政治・経済", "中学準備の社会")
    ]
    
    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
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
            PreView(audioManager: audioManager, source: .review)
        }
        .fullScreenCover(isPresented: $isPresentingQuizIncorrectAnswer) {
            IncorrectShakaiListView(isPresenting: $isPresentingQuizIncorrectAnswer)
        }
        .fullScreenCover(isPresented: $isPresentingQuizBeginner) {
            Shakai1ListView(isPresenting: $isPresentingQuizBeginner)
        }
        .fullScreenCover(isPresented: $isPresentingQuizIntermediate) {
            Shakai2ListView(isPresenting: $isPresentingQuizIntermediate)
        }
        .fullScreenCover(isPresented: $isPresentingQuizGod) {
            Shakai3ListView(isPresenting: $isPresentingQuizGod)
        }
        .fullScreenCover(isPresented: $isPresentingQuizAdvanced) {
            Shakai4ListView(isPresenting: $isPresentingQuizAdvanced)
        }
        .fullScreenCover(isPresented: $isPresentingQuizNetwork) {
            Shakai5ListView(isPresenting: $isPresentingQuizNetwork)
        }
        .fullScreenCover(isPresented: $isPresentingQuizSecurity) {
            Shakai6ListView(isPresenting: $isPresentingQuizSecurity)
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
            SectionHeader(title: "復習問題", icon: "arrow.counterclockwise", colors: [QuizColors.reviewStart, QuizColors.reviewEnd])
            
            ReviewCard(
                subjectName: "社会",
                theme: theme,
                hasIncorrectAnswers: !isIncorrectAnswersEmpty,
                isLoading: isLoading,
                isLocked: !appState.isSubscribed
            ) {
                audioManager.playKetteiSound()
                if !appState.isSubscribed {
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
            SectionHeader(title: "学年を選択", icon: "folder.fill", colors: theme.gradientColors)
            
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
            isLoading = false
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
        let ref = Database.database().reference().child("IncorrectShakaiAnswers").child(userId)
        ref.observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.childrenCount
            completion(Int(count))
            self.isIncorrectAnswersEmpty = (count == 0)
        }
    }
}

#Preview {
    ShakaiListView(isPresenting: .constant(false))
}
