import SwiftUI

/// The course owns only theme progress. Normal review scheduling and RPG rewards remain in QuizView.
struct WeaknessCourseFlow: View {
    let topic: WeaknessCourseTopic
    @ObservedObject var store: WeaknessCourseStore
    let onNextTopic: (WeaknessCourseTopic) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var completion: CourseCompletion?
    @State private var sessionID: String?
    @State private var startingUserID: String?

    private var progress: CourseProgress? { store.state.cloud.progress[topic.id] }
    private var session: CourseSession? {
        guard let active = store.state.activeSession, active.id == sessionID else { return nil }
        return active
    }

    var body: some View {
        NavigationStack {
            Group {
                if completion == nil, let session, let question = session.currentQuestion {
                    ElementaryCourseExercise(session: session, question: question,
                        onAnswer: { store.answer($0, sessionID: session.id) },
                        onExit: { dismiss() },
                        onContinue: {
                            completion = store.advance(sessionID: session.id)
                            if let completion, let userID = store.userID {
                                ReviewDailyActivityLog.record(ReviewDailyActivity(
                                    kind: completion.kind == .practice ? .themePractice : .themeCheckup,
                                    topicID: completion.topicID, answeredCount: completion.questionCount,
                                    correctCount: completion.correctCount,
                                    masteredCount: completion.progress.stage == .mastered ? 1 : 0,
                                    completedAt: Date(),
                                    checkupNumber: completion.kind == .confirmation ? session.confirmedCountAtStart + 1 : nil),
                                    userID: userID)
                            }
                        })
                    .id(question.id)
                } else if let completion {
                    ThemeSessionResultScreen(completion: completion, topic: topic,
                        relatedTopics: store.recommendedTopics.filter { $0.id != topic.id }.prefix(3).map { ($0, false) },
                        isFreeTheme: false,
                        onRetry: { self.completion = nil; sessionID = nil },
                        onClose: { dismiss() },
                        onSelectTopic: { onNextTopic($0); dismiss() })
                } else {
                    ThemeIntroductionContent(topic: topic, progress: progress, canAccess: true,
                        hasActiveSession: store.state.activeSession?.topicID == topic.id,
                        subscribed: true, freeClaimTopicID: nil, subscriptionResolved: true,
                        startTitle: startTitle,
                        onStart: {
                            sessionID = store.begin(topic: topic, subscribed: true)?.id
                        }, onUnlock: {}, onClose: { dismiss() })
                }
            }
            .navigationTitle(topic.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(session != nil && completion == nil ? "あとで続ける" : "閉じる") { dismiss() }
                        .accessibilityIdentifier("courses.close")
                }
            }
            .onAppear { startingUserID = store.userID }
            .onChange(of: store.userID) { if $0 != startingUserID { dismiss() } }
        }
        .tint(RecoveryTint.theme.main)
    }

    private var startTitle: String {
        if store.state.activeSession?.topicID == topic.id { return "続きから練習する" }
        if progress?.isDue(at: Date()) == true { return "おさらいを始める" }
        return "3問を練習する"
    }
}

private struct ElementaryCourseExercise: View {
    let session: CourseSession
    let question: CourseQuestion
    let onAnswer: (Int) -> Void
    let onExit: () -> Void
    let onContinue: () -> Void
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject private var authManager = AuthManager.shared
    @State private var remainingSeconds: Int
    @State private var timedOut = false
    private var selected: Int? { session.answers[question.id] }
    private var isCorrect: Bool { selected == question.correctIndex }
    private var showsExplanation: Bool { selected != nil && (selected == -1 || authManager.userFlag == 0) }
    private var timerRunning: Bool { selected == nil && scenePhase == .active }
    private var autoContinue: Bool { selected.map { $0 >= 0 } == true && authManager.userFlag == 1 && scenePhase == .active }

    init(session: CourseSession, question: CourseQuestion, onAnswer: @escaping (Int) -> Void,
         onExit: @escaping () -> Void, onContinue: @escaping () -> Void) {
        self.session = session; self.question = question
        self.onAnswer = onAnswer; self.onExit = onExit; self.onContinue = onContinue
        _remainingSeconds = State(initialValue: min(60, max(30, 30 + (question.prompt.count - 40) / 4)))
    }

    var body: some View {
        ZStack {
            RecoveryStyle.backgroundTop.opacity(0.88).ignoresSafeArea()
                .background {
                    GeometryReader { geometry in
                        Image("ElementaryQuizBackground").resizable().scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height).clipped()
                    }
                    .ignoresSafeArea()
                }
            ScrollView {
                VStack(spacing: 18) {
                    HStack {
                        Text(session.kind == .practice ? "テーマの練習" : "テーマのおさらい").font(.headline)
                        Spacer()
                        Text("\(session.questionIndex + 1) / \(session.questions.count)問").monospacedDigit()
                    }
                    ProgressView(value: Double(session.questionIndex), total: Double(session.questions.count))
                        .tint(RecoveryTint.theme.main)
                    RecoveryMonsterAvatar(size: 90)
                    RecoveryCard(highlight: .theme) {
                        HStack {
                            Text("問題").font(.caption.bold())
                            Spacer()
                            Label("\(remainingSeconds)秒", systemImage: "timer").monospacedDigit()
                                .foregroundStyle(remainingSeconds <= 10 ? .red : RecoveryStyle.secondaryText)
                        }
                        Text(question.prompt).font(.title3.bold()).fixedSize(horizontal: false, vertical: true)
                            .accessibilityIdentifier("courses.question")
                    }
                    VStack(spacing: 10) {
                        ForEach(question.choices.indices, id: \.self) { index in
                            Button {
                                onAnswer(index)
                                if index == question.correctIndex { AudioManager.shared.playCorrectSound() }
                                else { AudioManager.shared.playUnCorrectSound() }
                            } label: {
                                HStack(spacing: 12) {
                                    Text(String(index + 1)).font(.headline).frame(width: 28)
                                    Text(question.choices[index]).font(.body.bold()).multilineTextAlignment(.leading)
                                    Spacer(minLength: 4)
                                    if selected != nil, index == question.correctIndex {
                                        Image(systemName: "checkmark.circle.fill").foregroundStyle(RecoveryStyle.done)
                                    } else if selected == index {
                                        Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                                    }
                                }
                                .padding(16).frame(maxWidth: .infinity, minHeight: 54)
                                .foregroundStyle(RecoveryStyle.text)
                                .background(.white, in: RoundedRectangle(cornerRadius: 16))
                                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(
                                    selected == index ? RecoveryTint.theme.main : RecoveryStyle.cardBorder, lineWidth: 2))
                            }
                            .buttonStyle(.plain).disabled(selected != nil)
                            .accessibilityIdentifier("courses.answer.\(index)")
                        }
                    }
                    if showsExplanation {
                        RecoveryCard(highlight: isCorrect ? .done : .theme) {
                            Text(selected == -1 ? (timedOut ? "時間切れです。解説を読もう" : "解説を読んで覚えよう") : (isCorrect ? "正解！" : "もう一度たしかめよう"))
                                .font(.headline)
                            Text("正解：\(question.choices[question.correctIndex])").font(.body.bold())
                            Text(question.explanation).font(.body).lineSpacing(5)
                            Button(action: onContinue) {
                                Text(session.questionIndex + 1 == session.questions.count ? "結果を見る" : "次の問題へ")
                            }
                            .buttonStyle(RecoveryPrimaryButtonStyle(tint: .theme))
                            .accessibilityIdentifier("courses.continue")
                        }
                    } else if selected == nil {
                        Button("わからない") { onAnswer(-1) }
                            .buttonStyle(RecoveryOutlineButtonStyle(tint: .neutral))
                            .accessibilityIdentifier("courses.unknown")
                    }
                }
                .foregroundStyle(RecoveryStyle.text)
                .padding(20).frame(maxWidth: 640).frame(maxWidth: .infinity)
            }
        }
        .task(id: timerRunning) {
            guard timerRunning else { return }
            while remainingSeconds > 0 {
                do { try await Task.sleep(nanoseconds: 1_000_000_000) } catch { return }
                guard !Task.isCancelled, timerRunning else { return }
                remainingSeconds -= 1
            }
            timedOut = true
            onAnswer(-1)
        }
        .task(id: autoContinue) {
            guard autoContinue else { return }
            do { try await Task.sleep(nanoseconds: 400_000_000) } catch { return }
            guard !Task.isCancelled, scenePhase == .active else { return }
            onContinue()
        }
    }
}
