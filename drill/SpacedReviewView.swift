import SwiftUI
import Firebase

/// itQuizの苦手克服ホームを小学クエストの問題・教科に接続。
struct SpacedReviewHomeView: View {
    @Binding var isPresenting: Bool
    @ObservedObject private var authManager = AuthManager.shared
    @StateObject private var courseStore: WeaknessCourseStore
    @Environment(\.scenePhase) private var scenePhase
    @State private var dueReviews: [ScheduledReviewQuestion] = []
    @State private var scheduledReviews: [ScheduledReviewQuestion] = []
    @State private var activeQuizList: [QuizQuestion] = []
    @State private var isDataLoaded = false
    @State private var loadErrorMessage: String?
    @State private var isRunningQuiz = false
    @State private var presentedSheet: ReviewHomeSheet?
    @State private var selectedTopic: WeaknessCourseTopic?
    @State private var pendingTopic: WeaknessCourseTopic?
    @State private var requestID = UUID()
    @State private var now = Date()
    @State private var todayActivities: [ReviewDailyActivity] = []
    @State private var summary = ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil)
    @StateObject private var sharedInterstitial = Interstitial()
    private let questionIdPrefix: String?
    private let previewSummary: ReviewScheduleSummary?

    init(isPresenting: Binding<Bool>, questionIdPrefix: String? = nil,
         previewSummary: ReviewScheduleSummary? = nil, previewReviews: [ScheduledReviewQuestion] = []) {
        _isPresenting = isPresenting
        self.questionIdPrefix = questionIdPrefix
        self.previewSummary = previewSummary
        _courseStore = StateObject(wrappedValue: previewSummary == nil ? .shared : WeaknessCourseStore(
            defaults: UserDefaults(suiteName: "elementary-course-preview-\(UUID().uuidString)")!, syncEnabled: false))
        _summary = State(initialValue: previewSummary ?? ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil))
        _dueReviews = State(initialValue: previewReviews)
        _isDataLoaded = State(initialValue: previewSummary != nil)
    }

    var body: some View {
        ZStack {
            if isRunningQuiz {
                QuizView(quizzes: activeQuizList, quizLevel: .incorrectAnswer,
                    authManager: authManager, audioManager: AudioManager.shared,
                    isPresenting: $isRunningQuiz, interstitial: sharedInterstitial)
            } else {
                NavigationStack {
                    reviewHome
                        .navigationTitle("苦手分野克服")
                        .navigationDestination(for: ReviewHomeRoute.self) { route in
                            switch route {
                            case .topics:
                                WeaknessTopicListView(store: courseStore, now: now, onSelect: { selectedTopic = $0 })
                            case .focusedTraining:
                                FocusedReviewSubjectsView(reviews: dueReviews) { subject in
                                    startReviews(dueReviews.filter { $0.subject == subject }.map(\.question))
                                }
                            }
                        }
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        }
        .task(id: authManager.currentUserId) {
            if previewSummary == nil {
                requestID = UUID(); isRunningQuiz = false
                selectedTopic = nil; pendingTopic = nil; presentedSheet = nil
                dueReviews = []; scheduledReviews = []; todayActivities = []
                summary = ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil)
            }
            prepareRecovery()
        }
        .onChange(of: isRunningQuiz) { if !$0 { loadReviews() } }
        .onChange(of: scenePhase) { if $0 == .active, !isRunningQuiz, selectedTopic == nil { prepareRecovery() } }
        .sheet(item: $presentedSheet) { sheet in
            switch sheet {
            case .mastered:
                MasteredAnswersView(previewQuestions: previewSummary == nil ? nil : [], store: courseStore)
            case .guide:
                ElementaryRecoveryGuideSheet()
            }
        }
        .fullScreenCover(item: $selectedTopic, onDismiss: {
            if let pendingTopic {
                self.pendingTopic = nil
                selectedTopic = pendingTopic
            } else { loadReviews() }
        }) { topic in
            WeaknessCourseFlow(topic: topic, store: courseStore) { pendingTopic = $0 }
        }
    }

    private var reviewHome: some View {
        ZStack {
            RecoveryStyle.background
            VStack(spacing: 0) {
                HStack {
                    Button { generateHapticFeedback(); isPresenting = false } label: {
                        Label("戻る", systemImage: "chevron.left")
                    }
                    .accessibilityIdentifier("review.close")
                    Spacer()
                    Text("苦手分野克服").font(.headline)
                    Spacer()
                    Button { presentedSheet = .guide } label: { Image(systemName: "questionmark.circle") }
                        .accessibilityLabel("苦手克服のしくみ")
                        .accessibilityIdentifier("review.guide")
                }
                .font(.body.bold()).foregroundStyle(RecoveryTint.review.main)
                .padding(.horizontal, 18).padding(.vertical, 14).background(.ultraThinMaterial)
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        if !isDataLoaded { ProgressView("復習状況を確認中…").frame(maxWidth: .infinity).padding(40) }
                        else {
                            if let loadErrorMessage {
                                RecoveryCard {
                                    Label("問題の復習状況を読み込めませんでした", systemImage: "exclamationmark.triangle")
                                        .font(.headline)
                                    Text(loadErrorMessage).font(.subheadline)
                                    Button("もう一度試す", action: loadReviews)
                                        .buttonStyle(RecoveryOutlineButtonStyle(tint: .review))
                                }
                            }
                        }
                        WeaknessReviewHomeContent(plan: homePlan, context: homeContext, onAction: handle, now: now)
                        if let message = courseStore.syncMessage {
                            HStack(alignment: .top) {
                                Text(message).font(.caption).foregroundStyle(RecoveryStyle.secondaryText)
                                Spacer()
                                Button("再試行") { courseStore.sync() }.font(.caption.bold()).disabled(courseStore.isSyncing)
                            }
                        }
                    }
                    .padding(16).frame(maxWidth: 640).frame(maxWidth: .infinity)
                }
                .refreshable { prepareRecovery() }
            }
        }
    }

    private var homePlan: ReviewHomePlan {
        let cloud = courseStore.state.cloud
        let active = courseStore.state.activeSession.map { session in
            ReviewThemeResume(topicID: session.topicID,
                step: session.kind == .practice ? .practice : .checkup(session.confirmedCountAtStart + 1),
                questionIndex: session.questionIndex, questionCount: session.questions.count)
        }
        let dueThemes = WeaknessRecoveryOverview(state: cloud, now: now).dueTopicIDs.map {
            ReviewDueTheme(topicID: $0, checkupNumber: (cloud.progress[$0]?.confirmedCount ?? 0) + 1)
        }
        let upcoming = ReviewUpcomingItem.make(reviewDates: scheduledReviews.map(\.nextReviewAt),
            themes: cloud.progress.compactMap { id, progress in
                guard progress.stage == .waiting, let date = progress.nextReviewAt else { return nil }
                return (id, progress.confirmedCount + 1, date)
            }, now: now)
        let availableReviews = isDataLoaded ? dueReviews : []
        return ReviewHomeResolver.resolve(ReviewHomeInput(subscribed: true, activeSession: active,
            dueReviewCount: availableReviews.count, availableReviewCount: availableReviews.count,
            availableFinalStageCount: summary.finalReviewCount, freeRemaining: Int.max,
            dueThemes: dueThemes, hasReviewHistory: summary.totalCount > 0 || summary.masteredCount > 0,
            hasThemeProgress: !cloud.progress.isEmpty, todayActivities: todayActivities, upcoming: upcoming))
    }

    private var homeContext: ReviewHomeContext {
        let learning = courseStore.recommendedTopics.first
        return ReviewHomeContext(subscribed: true, freeRemaining: Int.max, freeClaimTopicID: nil,
            masteredQuestionCount: summary.masteredCount, masteredTopicCount: courseStore.masteredTopics.count,
            learningTopicID: learning?.id,
            learningTopicNearMastery: learning.flatMap { courseStore.state.cloud.progress[$0.id] }?.confirmedCount == 1,
            reviewStreak: summary.reviewStreak,
            todayMasteredCount: todayActivities.filter { $0.kind == .review }.reduce(0) { $0 + $1.masteredCount })
    }

    private func handle(_ action: ReviewHomeAction) {
        switch action {
        case .startReview: startReviews(dueReviews.map(\.question))
        case .openTopic(let id): selectedTopic = WeaknessCourseCatalog.topic(id)
        case .openMastered: presentedSheet = .mastered
        case .openGuide: presentedSheet = .guide
        case .close: isPresenting = false
        case .openPremium: break
        }
    }

    private func prepareRecovery() {
        if previewSummary == nil { courseStore.configure(userID: authManager.currentUserId) }
        else { courseStore.configure(userID: "elementary-course-preview") }
        loadReviews()
    }

    private func loadReviews() {
        now = Date()
        guard previewSummary == nil else { return }
        let request = UUID(); requestID = request
        guard let userId = authManager.currentUserId else {
            dueReviews = []; scheduledReviews = []; activeQuizList = []; todayActivities = []
            summary = ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil)
            loadErrorMessage = "ログイン状態を確認して、もう一度お試しください。"
            isDataLoaded = true
            return
        }
        todayActivities = ReviewDailyActivityLog.today(userID: userId)
        isDataLoaded = false; loadErrorMessage = nil
        ReviewScheduleService.fetchSummary(userId: userId, questionIdPrefix: questionIdPrefix) { fetchedSummary in
            guard requestID == request, authManager.currentUserId == userId else { return }
            summary = fetchedSummary
            ReviewScheduleService.fetchDueReviews(userId: userId, questionIdPrefix: questionIdPrefix, dueOnly: false) { result in
                guard requestID == request, authManager.currentUserId == userId else { return }
                switch result {
                case .success(let reviews):
                    scheduledReviews = reviews
                    dueReviews = reviews.filter { $0.nextReviewAt <= now }
                    if questionIdPrefix == nil { courseStore.importQuestions(reviews.map(\.question)) }
                case .failure:
                    dueReviews = []; scheduledReviews = []
                    loadErrorMessage = "通信環境を確認してください。テーマの学習は続けられます。"
                }
                isDataLoaded = true
            }
        }
    }

    private func startReviews(_ questions: [QuizQuestion]) {
        guard previewSummary == nil, !questions.isEmpty else { return }
        activeQuizList = questions.shuffled(); isRunningQuiz = true
    }
}

private enum ReviewHomeSheet: String, Identifiable {
    case mastered, guide
    var id: String { rawValue }
}

private struct ElementaryRecoveryGuideSheet: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    RecoveryCard {
                        Label("まちがえた問題の解き直し", systemImage: "arrow.counterclockwise").font(.headline)
                        Text("クイズでまちがえた問題を、忘れかけたころにもう一度解きます。3回正解すると克服図鑑に記録されます。")
                        RecoveryVerticalSteps(steps: [.init(title: "翌日に復習"), .init(title: "正解から3日後"),
                            .init(title: "正解から7日後"), .init(title: "克服！", isGoal: true)], tint: .review)
                    }
                    RecoveryCard {
                        Label("小学クエストのテーマ学習", systemImage: "book").font(.headline)
                        Text("国語・算数・理科・社会の10テーマ。学年の目安を見て、学びたいテーマを選びましょう。")
                        RecoveryVerticalSteps(steps: [.init(title: "説明を読む"), .init(title: "3問を練習"),
                            .init(title: "全問正解の翌日に2問のおさらい"), .init(title: "さらに3日後に2問のおさらい"),
                            .init(title: "マスター！", isGoal: true)], tint: .theme)
                        Text("まちがえたときは説明からもう一度。あとで続けるときは、回答と続きの場所が保存されます。")
                    }
                }.font(.subheadline).foregroundStyle(RecoveryStyle.text).padding(16)
            }
            .background(RecoveryStyle.background).navigationTitle("苦手克服のしくみ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .confirmationAction) { Button("閉じる") { dismiss() } } }
        }
    }
}

private struct FocusedReviewSubjectsView: View {
    @Environment(\.dismiss) private var dismiss
    let reviews: [ScheduledReviewQuestion]
    let onStart: (ReviewSubject) -> Void

    var body: some View {
        List {
                Section {
                    Text("今日の復習から、選んだ教科の問題だけを出題します。正解すると次の復習に進み、3回の復習で克服図鑑に記録されます。")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Section("教科を選ぶ") {
                    ForEach(ReviewSubject.allCases) { subject in
                        let count = reviews.filter { $0.subject == subject }.count
                        Button {
                            onStart(subject)
                        } label: {
                            HStack {
                                Text(subject.title).font(.headline)
                                Spacer()
                                Text(count > 0 ? "\(count)問を復習" : "今日の復習はありません")
                                    .font(.subheadline)
                                Image(systemName: "chevron.right")
                            }
                            .padding(.vertical, 8)
                        }
                        .disabled(count == 0)
                        .accessibilityIdentifier("review.subject.\(subject.rawValue)")
                    }
                }
                if reviews.contains(where: { $0.subject == nil }) {
                    Section {
                        Text("教科が記録されていない問題は、苦手分野克服の「解き直す」から復習できます。")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .toolbar(.visible, for: .navigationBar)
            .navigationTitle("教科別の集中特訓")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("閉じる") { dismiss() }
                }
            }
    }
}

private struct MasteredAnswersView: View {
    @Environment(\.dismiss) private var dismiss
    let previewQuestions: [MasteredReviewQuestion]?
    @ObservedObject var store: WeaknessCourseStore
    @State private var questions: [MasteredReviewQuestion] = []
    @State private var isLoading = true
    @State private var loadFailed = false
    private let authManager = AuthManager.shared

    var body: some View {
        NavigationView {
            Group {
                if isLoading && store.masteredTopics.isEmpty {
                    ProgressView("克服した問題を読み込み中…")
                } else if loadFailed && store.masteredTopics.isEmpty {
                    VStack(spacing: 14) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text("克服図鑑を読み込めませんでした")
                    }
                } else if questions.isEmpty && store.masteredTopics.isEmpty {
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
                    List {
                        if isLoading { ProgressView("克服した問題を読み込み中…") }
                        if loadFailed {
                            Text("問題の記録を読み込めませんでした。端末に保存されたテーマの成果を表示しています。")
                                .font(.caption).foregroundStyle(.secondary)
                            Button("もう一度試す", action: load)
                        }
                        if !store.masteredTopics.isEmpty {
                            Section("マスターしたテーマ \(store.masteredTopics.count)テーマ") {
                                ForEach(store.masteredTopics) { topic in
                                    DisclosureGroup(topic.title) {
                                        Text(topic.lesson).font(.subheadline).lineSpacing(5)
                                    }
                                }
                            }
                        }
                        Section("克服した問題 \(questions.count)問") {
                            ForEach(questions) { question in
                        VStack(alignment: .leading, spacing: 8) {
                            DisclosureGroup {
                                Text(question.explanation)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            } label: {
                                Text(question.question)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            HStack {
                                Label(question.masteredAt.formatted(date: .abbreviated, time: .omitted), systemImage: "checkmark.seal.fill")
                                if let subject = ReviewSubject.resolve(sourceQuizLevel: question.sourceQuizLevel) {
                                    Text("・\(subject.title)")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 6)
                            }
                        }
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
        isLoading = true; loadFailed = false
        if let previewQuestions {
            questions = previewQuestions
            isLoading = false
            return
        }
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
struct WeaknessReviewPreviewHost: View {
    @State private var isPresenting = true

    var body: some View {
        if isPresenting {
            SpacedReviewHomeView(isPresenting: $isPresenting,
                previewSummary: ReviewScheduleSummary(
                    dueCount: 3, totalCount: 5, nextReviewDate: nil,
                    firstReviewCount: 1, secondReviewCount: 1, finalReviewCount: 1,
                    masteredCount: 0, reviewStreak: 3),
                previewReviews: [
                    sample("sansu-1", subject: .sansu),
                    sample("sansu-2", subject: .sansu),
                    sample("kokugo-1", subject: .kokugo)
                ])
        } else {
            Text("苦手分野克服を閉じました")
        }
    }

    private func sample(_ id: String, subject: ReviewSubject) -> ScheduledReviewQuestion {
        ScheduledReviewQuestion(question: QuizQuestion(id: id, question: "確認用の問題",
            choices: ["答え1", "答え2"], correctAnswerIndex: 0, explanation: "確認用の解説"), subject: subject)
    }
}

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
        Group {
            SpacedReviewHomeView(isPresenting: .constant(true), previewSummary:
                ReviewScheduleSummary(dueCount: 6, totalCount: 10, nextReviewDate: nil,
                                      firstReviewCount: 3, secondReviewCount: 2, finalReviewCount: 1,
                                      masteredCount: 12, reviewStreak: 3))
                .previewDisplayName("今日の復習あり")
            SpacedReviewHomeView(isPresenting: .constant(true), previewSummary:
                ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil))
                .previewDisplayName("初回")
        }
    }
}
