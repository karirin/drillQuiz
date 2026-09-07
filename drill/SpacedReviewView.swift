//
//  SpacedReviewView.swift
//  drill
//
//  忘却曲線(間隔反復)に基づく「苦手克服」画面です。itQuizのQuizIncorrectAnswerListViewから移植。
//  既存の教科別「誤答リスト」(IncorrectKokugoListView など)とは別の新機能として追加しています。
//

import SwiftUI
import Firebase

struct SpacedReviewHomeView: View {
    @Binding var isPresenting: Bool
    @State private var shuffledQuizList: [QuizQuestion] = []
    @State private var activeQuizList: [QuizQuestion] = []
    @State private var isDataLoaded = false
    @State private var loadErrorMessage: String?
    @State private var isRunningQuiz = false
    @State private var presentedSheet: ReviewHomeSheet?
    @State private var summary = ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil)

    private var authManager = AuthManager.shared
    private var audioManager = AudioManager.shared
    @StateObject var sharedInterstitial = Interstitial()
    private let questionIdPrefix: String?

    init(isPresenting: Binding<Bool>, questionIdPrefix: String? = nil) {
        self._isPresenting = isPresenting
        self.questionIdPrefix = questionIdPrefix
    }

    var body: some View {
        ZStack {
            if isRunningQuiz {
                QuizView(
                    quizzes: activeQuizList,
                    quizLevel: .incorrectAnswer,
                    authManager: authManager,
                    audioManager: audioManager,
                    isPresenting: $isRunningQuiz,
                    interstitial: sharedInterstitial
                )
            } else {
                reviewHome
            }
        }
        .onAppear {
            if !isRunningQuiz {
                loadReviews()
            }
        }
        .onChange(of: isRunningQuiz) { isRunning in
            if !isRunning {
                loadReviews()
            }
        }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
            case .mastered:
                MasteredAnswersView()
            }
        }
    }

    private var reviewHome: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "edf5ff"), Color(hex: "f8fbff")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            if !isDataLoaded {
                ProgressView("復習状況を確認中…")
            } else if let loadErrorMessage {
                reviewStatusView(
                    icon: "exclamationmark.triangle.fill",
                    title: "復習状況を読み込めませんでした",
                    message: loadErrorMessage,
                    buttonTitle: "もう一度試す",
                    buttonAction: loadReviews
                )
            } else {
                VStack(spacing: 0) {
                    reviewNavigationBar
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            reviewHeader
                            todayReviewCard
                            stageBreakdown
                            masteredCard
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 32)
                    }
                    .refreshable {
                        loadReviews()
                    }
                }
            }
        }
    }

    private var reviewNavigationBar: some View {
        HStack {
            Button {
                generateHapticFeedback()
                isPresenting = false
            } label: {
                Label("戻る", systemImage: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
            }
            Spacer()
            Text("苦手克服")
                .font(.headline)
            Spacer()
            Color.clear.frame(width: 58, height: 1)
        }
        .foregroundColor(Color(hex: "185ca8"))
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
    }

    private var reviewHeader: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("苦手克服ホーム")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.primary)
            Spacer()
            Label("復習連続 \(summary.reviewStreak)日", systemImage: "flame.fill")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(summary.reviewStreak > 0 ? .orange : .secondary)
        }
        .padding(.top, 18)
    }

    private var todayReviewCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(summary.dueCount > 0 ? "今日の復習" : "今日の復習は完了")
                    .font(.system(size: 18, weight: .medium))
                if summary.dueCount > 0 {
                    Text("\(summary.dueCount)問")
                        .font(.system(size: 34, weight: .bold))
                } else {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
            }

            Text(todayCardMessage)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(hex: "185ca8").opacity(0.9))

            Button(action: startAllReviews) {
                Text(summary.dueCount > 0 ? "復習をはじめる" : "今日はすべて完了")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(summary.dueCount > 0 ? Color(hex: "2f7edb") : Color.gray.opacity(0.55))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .disabled(summary.dueCount == 0)
        }
        .foregroundColor(Color(hex: "14549b"))
        .padding(20)
        .background(Color(hex: "cfe4ff"))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }

    private var todayCardMessage: String {
        if summary.dueCount > 0 {
            return summary.finalReviewCount > 0
                ? "克服直前が\(summary.finalReviewCount)問。あと1回で苦手を倒せます"
                : "1日後・3日後・7日後の復習で知識を定着"
        }
        if let nextReviewDate = summary.nextReviewDate {
            return "次の復習は\(nextReviewDate.formatted(date: .abbreviated, time: .shortened))です"
        }
        return "問題を間違えると、忘れかけた頃に自動で出題します"
    }

    private var stageBreakdown: some View {
        HStack(spacing: 12) {
            stageCard(title: "1日後", count: summary.firstReviewCount, color: .primary)
            stageCard(title: "3日後", count: summary.secondReviewCount, color: .primary)
            stageCard(title: "克服直前", count: summary.finalReviewCount, color: .green)
        }
    }

    private func stageCard(title: String, count: Int, color: Color) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.secondary)
            Text("\(count)問")
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
    }

    private var masteredCard: some View {
        Button {
            presentedSheet = .mastered
        } label: {
            HStack(spacing: 14) {
                Image(systemName: "trophy.fill")
                    .font(.title2)
                    .foregroundColor(Color(hex: "d89b16"))
                VStack(alignment: .leading, spacing: 4) {
                    Text("克服図鑑")
                        .font(.system(size: 17, weight: .bold))
                    Text("これまでに \(summary.masteredCount)問を克服")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding(18)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
        }
        .buttonStyle(.plain)
    }

    private func loadReviews() {
        guard let userId = authManager.currentUserId else {
            loadErrorMessage = "ログイン状態を確認して、もう一度お試しください。"
            isDataLoaded = true
            return
        }

        isDataLoaded = false
        loadErrorMessage = nil
        ReviewScheduleService.fetchSummary(userId: userId, questionIdPrefix: questionIdPrefix) { fetchedSummary in
            summary = fetchedSummary
            ReviewScheduleService.fetchDueQuestions(userId: userId, questionIdPrefix: questionIdPrefix) { result in
                switch result {
                case .success(let questions):
                    shuffledQuizList = questions.shuffled()
                    isDataLoaded = true
                case .failure:
                    loadErrorMessage = "通信環境を確認して、もう一度お試しください。"
                    isDataLoaded = true
                }
            }
        }
    }

    private func startAllReviews() {
        guard !shuffledQuizList.isEmpty else { return }
        activeQuizList = shuffledQuizList
        isRunningQuiz = true
    }

    @ViewBuilder
    private func reviewStatusView(
        icon: String,
        title: String,
        message: String,
        buttonTitle: String,
        buttonAction: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 58, weight: .semibold))
                .foregroundStyle(Color("loading"))

            Text(title)
                .font(.title2.bold())
                .foregroundColor(Color("fontGray"))

            Text(message)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(5)

            Button(action: buttonAction) {
                Text(buttonTitle)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color("loading"))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        }
        .padding(28)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.12), radius: 16, y: 8)
        .padding(.horizontal, 28)
    }
}

private enum ReviewHomeSheet: String, Identifiable {
    case mastered
    var id: String { rawValue }
}

private struct MasteredAnswersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var questions: [MasteredReviewQuestion] = []
    @State private var isLoading = true
    @State private var loadFailed = false
    private let authManager = AuthManager.shared

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("克服した問題を読み込み中…")
                } else if loadFailed {
                    VStack(spacing: 14) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text("克服図鑑を読み込めませんでした")
                    }
                } else if questions.isEmpty {
                    VStack(spacing: 14) {
                        Image(systemName: "trophy")
                            .font(.system(size: 48))
                            .foregroundColor(.secondary)
                        Text("最初の1問を克服しよう")
                            .font(.title3.bold())
                        Text("1日後・3日後・7日後の復習をクリアすると、ここに記録されます。")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(30)
                } else {
                    List(questions) { question in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(question.question)
                                .font(.system(size: 15, weight: .semibold))
                            HStack {
                                Label(question.masteredAt.formatted(date: .abbreviated, time: .omitted), systemImage: "checkmark.seal.fill")
                                if let sourceQuizLevel = question.sourceQuizLevel {
                                    Text("・\(sourceQuizLevel)")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 6)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("克服図鑑 \(questions.count)問")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("閉じる") { dismiss() }
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear(perform: load)
    }

    private func load() {
        guard let userId = authManager.currentUserId else {
            isLoading = false
            loadFailed = true
            return
        }
        ReviewScheduleService.fetchMasteredQuestions(userId: userId) { result in
            switch result {
            case .success(let fetchedQuestions):
                questions = fetchedQuestions
                loadFailed = false
            case .failure:
                loadFailed = true
            }
            isLoading = false
        }
    }
}

#if DEBUG
struct ReviewDeveloperModeView: View {
    @Binding var isPresenting: Bool
    @ObservedObject private var authManager = AuthManager.shared
    @State private var isApplying = false
    @State private var isPresentingReview = false
    @State private var statusMessage: String?
    @State private var statusIsError = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("Color2").ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        developerHeader

                        ForEach(ReviewScheduleService.DebugScenario.allCases) { scenario in
                            scenarioCard(scenario)
                        }

                        warningCard
                    }
                    .padding(20)
                }

                if isApplying {
                    Color.black.opacity(0.2).ignoresSafeArea()
                    ProgressView("テスト状態を準備中…")
                        .padding(24)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
            }
            .navigationTitle("苦手克服・開発者モード")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("閉じる") {
                        isPresenting = false
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .fullScreenCover(isPresented: $isPresentingReview) {
            SpacedReviewHomeView(
                isPresenting: $isPresentingReview,
                questionIdPrefix: ReviewScheduleService.debugQuestionIdPrefix
            )
        }
    }

    private var developerHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("本番問題と分離した実機テスト", systemImage: "hammer.fill")
                .font(.headline)

            Text("確認したい状態を選ぶと、専用のテスト問題だけをFirebaseへ設定し、そのまま実際の復習画面を開きます。")
                .font(.subheadline)
                .foregroundColor(.secondary)

            if let statusMessage {
                Label(statusMessage, systemImage: statusIsError ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                    .font(.subheadline.bold())
                    .foregroundColor(statusIsError ? .red : .green)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }

    private func scenarioCard(_ scenario: ReviewScheduleService.DebugScenario) -> some View {
        Button {
            apply(scenario)
        } label: {
            HStack(spacing: 14) {
                Image(systemName: scenario.systemImage)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 52, height: 52)
                    .background(scenarioColor(scenario))
                    .clipShape(RoundedRectangle(cornerRadius: 14))

                VStack(alignment: .leading, spacing: 5) {
                    Text(scenario.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(scenario.detail)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding(16)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: .black.opacity(0.07), radius: 8, y: 3)
        }
        .buttonStyle(.plain)
        .disabled(isApplying)
    }

    private var warningCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("確認ポイント", systemImage: "info.circle.fill")
                .font(.subheadline.bold())
            Text("不正解・時間切れは1日後へリセットされます。テスト問題の克服は、本番の復習ストリーク・克服図鑑・ミッションには加算しません。テスト問題以外は削除しません。")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.orange.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func apply(_ scenario: ReviewScheduleService.DebugScenario) {
        guard let userId = authManager.currentUserId else {
            statusIsError = true
            statusMessage = "ログインユーザーを確認できませんでした"
            return
        }

        isApplying = true
        statusMessage = nil
        ReviewScheduleService.applyDebugScenario(scenario, userId: userId) { success in
            DispatchQueue.main.async {
                isApplying = false
                statusIsError = !success
                statusMessage = success ? "「\(scenario.title)」を設定しました" : "設定に失敗しました"
                if success {
                    isPresentingReview = true
                }
            }
        }
    }

    private func scenarioColor(_ scenario: ReviewScheduleService.DebugScenario) -> Color {
        switch scenario {
        case .allStages: return Color(hex: "667eea")
        case .firstReview: return Color(hex: "38ef7d")
        case .secondReview: return Color(hex: "4facfe")
        case .finalReview: return Color(hex: "ff6b6b")
        case .waiting: return Color(hex: "feca57")
        case .legacy: return Color(hex: "a18cd1")
        case .empty: return .gray
        }
    }
}
#endif

struct SpacedReviewHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SpacedReviewHomeView(isPresenting: .constant(false))
    }
}
