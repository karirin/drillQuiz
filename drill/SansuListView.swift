//
//  SansuListView.swift
//  it
//
//  Created by Apple on 2024/03/09.
//  Updated with Modern UI/UX
//

import SwiftUI
import AVFoundation
import Firebase

struct SansuListView: View {
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
    @State private var bubbleHeight: CGFloat = 0.0
    @State private var tutorialPulse: Bool = false
    
    private let theme = SubjectTheme.sansu
    
    // Grade Data
    private let grades: [(grade: Int, title: String, subtitle: String)] = [
        (1, "足し算・引き算", "基本の計算を学ぼう"),
        (2, "かけ算・時計", "九九をマスター"),
        (3, "わり算・分数", "割り算の基礎"),
        (4, "小数・面積", "小数点の計算"),
        (5, "割合・体積", "割合を理解しよう"),
        (6, "比・速さ", "中学準備の算数")
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
            
            // Tutorial Overlay
            if tutorialNum == 2 {
                tutorialOverlay
            }
        }
        .onAppear(perform: setupView)
        .fullScreenCover(isPresented: $preFlag) {
            PreView(audioManager: audioManager, source: .review)
        }
        .fullScreenCover(isPresented: $isPresentingQuizIncorrectAnswer) {
            IncorrectSansuListView(isPresenting: $isPresentingQuizIncorrectAnswer)
        }
        .fullScreenCover(isPresented: $isPresentingQuizBeginner) {
            Sansu1ListView(isPresenting: $isPresentingQuizBeginner)
        }
        .fullScreenCover(isPresented: $isPresentingQuizIntermediate) {
            Sansu2ListView(isPresenting: $isPresentingQuizIntermediate)
        }
        .fullScreenCover(isPresented: $isPresentingQuizGod) {
            Sansu3ListView(isPresenting: $isPresentingQuizGod)
        }
        .fullScreenCover(isPresented: $isPresentingQuizAdvanced) {
            Sansu4ListView(isPresenting: $isPresentingQuizAdvanced)
        }
        .fullScreenCover(isPresented: $isPresentingQuizNetwork) {
            Sansu5ListView(isPresenting: $isPresentingQuizNetwork)
        }
        .fullScreenCover(isPresented: $isPresentingQuizSecurity) {
            Sansu6ListView(isPresenting: $isPresentingQuizSecurity)
        }
        .onChange(of: isPresentingQuizBeginner) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizIntermediate) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizAdvanced) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizNetwork) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizSecurity) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizGod) { _ in refreshIncorrectAnswers() }
        .onChange(of: isPresentingQuizIncorrectAnswer) { _ in refreshIncorrectAnswers() }
        .onChange(of: tutorialNum) { num in
            if num == 2 {
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    tutorialPulse = true
                }
            } else {
                tutorialPulse = false
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Review Section
    private var reviewSection: some View {
        VStack(spacing: 12) {
            SectionHeader(title: "復習問題", icon: "arrow.counterclockwise", colors: [QuizColors.reviewStart, QuizColors.reviewEnd])
            
            ReviewCard(
                subjectName: "算数",
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
                .background(
                    index == 0 ?
                    GeometryReader { geometry in
                        Color.clear.preference(key: ViewPositionKey.self, value: [geometry.frame(in: .global)])
                    } : nil
                )
            }
        }
        .onPreferenceChange(ViewPositionKey.self) { positions in
            self.buttonRect = positions.first ?? .zero
        }
    }
    
    // MARK: - Tutorial Overlay
    private var tutorialOverlay: some View {
        GeometryReader { geometry in
            let origin = geometry.frame(in: .global).origin
            let localX = buttonRect.midX - origin.x
            let localY = buttonRect.midY - origin.y
            let cutoutWidth = max(buttonRect.width, 0)
            let cutoutHeight = max(buttonRect.height, 0)

            ZStack {
                Color.black.opacity(0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .frame(width: cutoutWidth, height: cutoutHeight)
                            .position(x: localX, y: localY)
                            .blendMode(.destinationOut)
                    )
                    .compositingGroup()

                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(Color(hex: "667eea"), lineWidth: 3)
                    .frame(width: cutoutWidth, height: cutoutHeight)
                    .position(x: localX, y: localY)
                    .scaleEffect(tutorialPulse ? 1.05 : 1.0)
                    .opacity(tutorialPulse ? 0.6 : 1.0)

                VStack {
                    Spacer()
                        .frame(height: localY + cutoutHeight / 2 + 16)

                    VStack(spacing: 10) {
                        HStack(spacing: 4) {
                            Text("STEP 2")
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(
                                    LinearGradient(
                                        colors: [Color(hex: "667eea"), Color(hex: "764ba2")],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .clipShape(Capsule())
                        }

                        Image(systemName: "hand.tap.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color(hex: "667eea"), Color(hex: "764ba2")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )

                        Text("「1年生 足し算・引き算」をタップ")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color("fontGray"))

                        Text("まずは最初の学年から始めてみましょう")
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 22)
                    .background(Color("Color2"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.2), radius: 15, y: 8)
                    .background(GeometryReader { messageGeometry in
                        Color.clear
                            .onAppear {
                                bubbleHeight = messageGeometry.size.height
                            }
                    })

                    Spacer()
                }
                .padding(.horizontal, 20)

                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            generateHapticFeedback()
                            tutorialNum = 0
                            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { _ in }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "forward.fill")
                                    .font(.system(size: 12))
                                Text("スキップ")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Capsule())
                        }
                        .padding(.leading, 20)
                        .padding(.bottom, 40)

                        Spacer()
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onTapGesture {
            audioManager.playSound()
            tutorialNum = 0
            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 3) { _ in }
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
        let ref = Database.database().reference().child("IncorrectSansuAnswers").child(userId)
        ref.observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.childrenCount
            completion(Int(count))
            self.isIncorrectAnswersEmpty = (count == 0)
        }
    }
    
    private func isSmallDevice() -> Bool {
        UIScreen.main.bounds.width < 390
    }
}

// MARK: - Tutorial Components
struct TutorialBubble: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.system(size: 15, weight: .medium))
            .padding(16)
            .background(Color("Color2"))
            .foregroundColor(Color("fontGray"))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
            )
            .shadow(radius: 10)
            .padding(.horizontal, 20)
    }
}

struct SkipTutorialButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 6) {
                Image(systemName: "forward.fill")
                    .font(.system(size: 12))
                Text("スキップ")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .fill(Color.black.opacity(0.6))
            )
        }
        .padding(.leading, 16)
    }
}

#Preview {
    SansuListView(isPresenting: .constant(false))
}
