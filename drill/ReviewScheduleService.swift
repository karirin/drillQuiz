//
//  ReviewScheduleService.swift
//  drill
//
//  忘却曲線ベースの復習スケジュールを管理します。itQuizから移植。
//
//  既存の教科別「誤答リスト」(IncorrectSansuAnswers など)とは別の仕組みとして追加しており、
//  Firebase上のノードも "ReviewQueue" / "ReviewMastered" / "ReviewStreakLog" という
//  新しいパスを使うため、既存データとは競合しません。
//

import Foundation
import FirebaseDatabase

enum ReviewSubject: String, CaseIterable, Identifiable {
    case sansu, kokugo, shakai, rika

    var id: String { rawValue }

    var title: String {
        switch self {
        case .sansu: return "算数"
        case .kokugo: return "国語"
        case .shakai: return "社会"
        case .rika: return "理科"
        }
    }

    static func resolve(sourceQuizLevel: String?) -> ReviewSubject? {
        guard let sourceQuizLevel else { return nil }
        return allCases.first { subject in
            sourceQuizLevel == subject.title || sourceQuizLevel == subject.rawValue
                || (1...6).contains { sourceQuizLevel == "\(subject.rawValue)\($0)" }
        }
    }
}

struct ScheduledReviewQuestion {
    let question: QuizQuestion
    let subject: ReviewSubject?
    let nextReviewAt: Date
    let reviewStage: Int

    init(question: QuizQuestion, subject: ReviewSubject?, nextReviewAt: Date = .distantPast, reviewStage: Int = 0) {
        self.question = question; self.subject = subject
        self.nextReviewAt = nextReviewAt; self.reviewStage = reviewStage
    }
}

struct ReviewScheduleSummary {
    let dueCount: Int
    let totalCount: Int
    let nextReviewDate: Date?
    let firstReviewCount: Int
    let secondReviewCount: Int
    let finalReviewCount: Int
    let masteredCount: Int
    let reviewStreak: Int

    init(
        dueCount: Int,
        totalCount: Int,
        nextReviewDate: Date?,
        firstReviewCount: Int = 0,
        secondReviewCount: Int = 0,
        finalReviewCount: Int = 0,
        masteredCount: Int = 0,
        reviewStreak: Int = 0
    ) {
        self.dueCount = dueCount
        self.totalCount = totalCount
        self.nextReviewDate = nextReviewDate
        self.firstReviewCount = firstReviewCount
        self.secondReviewCount = secondReviewCount
        self.finalReviewCount = finalReviewCount
        self.masteredCount = masteredCount
        self.reviewStreak = reviewStreak
    }
}

struct MasteredReviewQuestion: Identifiable {
    let id: String
    let question: String
    let explanation: String
    let masteredAt: Date
    let sourceQuizLevel: String?
}

enum ReviewScheduleService {
    static let incorrectAnswersPath = "ReviewQueue"
    static let masteredAnswersPath = "ReviewMastered"
    static let reviewActivityPath = "ReviewStreakLog"
    private static let testQuestionIdPrefix = "codexReview"

    private static let day: TimeInterval = 24 * 60 * 60
    private static let firstReviewInterval = day
    private static let nextIntervals: [TimeInterval] = [3 * day, 7 * day]

    /// 問題に間違えたときに呼び出します。同じ問題文がすでに登録されていれば、その節目を上書きします。
    static func saveIncorrectAnswer(
        userId: String,
        quizQuestion: String,
        choices: [String],
        correctAnswerIndex: Int,
        explanation: String,
        sourceQuizLevel: String? = nil,
        now: Date = Date(),
        completion: ((Bool) -> Void)? = nil
    ) {
        saveIncorrectAnswer(
            userId: userId,
            quiz: QuizQuestion(question: quizQuestion, choices: choices,
                               correctAnswerIndex: correctAnswerIndex, explanation: explanation),
            sourceQuizLevel: sourceQuizLevel, now: now, completion: completion
        )
    }

    static func saveIncorrectAnswer(
        userId: String,
        quiz: QuizQuestion,
        sourceQuizLevel: String? = nil,
        now: Date = Date(),
        completion: ((Bool) -> Void)? = nil
    ) {
        let answersRef = Database.database().reference()
            .child(incorrectAnswersPath)
            .child(userId)

        answersRef.observeSingleEvent(of: .value) { snapshot in
            let existing = snapshot.children.compactMap { $0 as? DataSnapshot }.first { child in
                guard let value = child.value as? [String: Any] else { return false }
                return value["quizQuestion"] as? String == quiz.question
            }
            let answerRef = existing?.ref ?? answersRef.childByAutoId()
            let nowMilliseconds = milliseconds(from: now)

            var values = IncorrectAnswer(userId: userId, quiz: quiz).databasePayload
            values["reviewStage"] = 0
            values["nextReviewAt"] = nowMilliseconds + Int64(firstReviewInterval * 1_000)
            values["lastAnsweredAt"] = nowMilliseconds
            if let sourceQuizLevel {
                values["sourceQuizLevel"] = sourceQuizLevel
            }
            if existing == nil {
                values["createdAt"] = nowMilliseconds
            }

            answerRef.updateChildValues(values) { error, _ in
                completion?(error == nil)
            }
        } withCancel: { _ in
            completion?(false)
        }
    }

    static func fetchDueQuestions(
        userId: String,
        now: Date = Date(),
        questionIdPrefix: String? = nil,
        completion: @escaping (Result<[QuizQuestion], Error>) -> Void
    ) {
        fetchDueReviews(userId: userId, now: now, questionIdPrefix: questionIdPrefix) { result in
            completion(result.map { $0.map(\.question) })
        }
    }

    static func fetchDueReviews(
        userId: String,
        now: Date = Date(),
        questionIdPrefix: String? = nil,
        dueOnly: Bool = true,
        completion: @escaping (Result<[ScheduledReviewQuestion], Error>) -> Void
    ) {
        answersReference(userId: userId).observeSingleEvent(of: .value) { snapshot in
            let nowMilliseconds = milliseconds(from: now)
            let questions = snapshot.children
                .compactMap { $0 as? DataSnapshot }
                .compactMap { snapshot -> (ScheduledReviewQuestion, Int64)? in
                    if let questionIdPrefix,
                       !snapshot.key.hasPrefix(questionIdPrefix) {
                        return nil
                    }
                    if questionIdPrefix == nil,
                       snapshot.key.hasPrefix(testQuestionIdPrefix) {
                        return nil
                    }
                    guard let value = snapshot.value as? [String: Any],
                          let question = decodedQuestion(from: value, id: snapshot.key) else {
                        return nil
                    }
                    // reviewStage/nextReviewAt がない旧データは、すぐ復習できる状態として扱う。
                    let nextReviewAt = int64(value["nextReviewAt"]) ?? 0
                    return (ScheduledReviewQuestion(
                        question: question,
                        subject: ReviewSubject.resolve(sourceQuizLevel: value["sourceQuizLevel"] as? String),
                        nextReviewAt: Date(timeIntervalSince1970: TimeInterval(nextReviewAt) / 1_000),
                        reviewStage: int(value["reviewStage"]) ?? 0
                    ), nextReviewAt)
                }
                .filter { !dueOnly || $0.1 <= nowMilliseconds }
                .sorted { $0.1 < $1.1 }
                .map(\.0)
            completion(.success(questions))
        } withCancel: { error in
            completion(.failure(error))
        }
    }

    static func fetchSummary(
        userId: String,
        now: Date = Date(),
        questionIdPrefix: String? = nil,
        completion: @escaping (ReviewScheduleSummary) -> Void
    ) {
        answersReference(userId: userId).observeSingleEvent(of: .value) { snapshot in
            let nowMilliseconds = milliseconds(from: now)
            let scheduledItems = snapshot.children.compactMap { child -> (date: Int64, stage: Int)? in
                guard let snapshot = child as? DataSnapshot,
                      let value = snapshot.value as? [String: Any],
                      decodedQuestion(from: value, id: snapshot.key) != nil else { return nil }
                if let questionIdPrefix,
                   !snapshot.key.hasPrefix(questionIdPrefix) {
                    return nil
                }
                if questionIdPrefix == nil,
                   snapshot.key.hasPrefix(testQuestionIdPrefix) {
                    return nil
                }
                return (int64(value["nextReviewAt"]) ?? 0, int(value["reviewStage"]) ?? 0)
            }
            let dueItems = scheduledItems.filter { $0.date <= nowMilliseconds }
            let nextDate = scheduledItems
                .map(\.date)
                .filter { $0 > nowMilliseconds }
                .min()
                .map { Date(timeIntervalSince1970: TimeInterval($0) / 1_000) }

            fetchMasteredCount(userId: userId, questionIdPrefix: questionIdPrefix) { masteredCount in
                fetchReviewStreak(userId: userId, now: now, includeDebugData: questionIdPrefix != nil) { streak in
                    completion(
                        ReviewScheduleSummary(
                            dueCount: dueItems.count,
                            totalCount: scheduledItems.count,
                            nextReviewDate: nextDate,
                            firstReviewCount: dueItems.filter { $0.stage <= 0 }.count,
                            secondReviewCount: dueItems.filter { $0.stage == 1 }.count,
                            finalReviewCount: dueItems.filter { $0.stage >= 2 }.count,
                            masteredCount: masteredCount,
                            reviewStreak: streak
                        )
                    )
                }
            }
        } withCancel: { _ in
            completion(ReviewScheduleSummary(dueCount: 0, totalCount: 0, nextReviewDate: nil))
        }
    }

    static func recordCorrectReview(
        userId: String,
        questionId: String,
        now: Date = Date(),
        completion: ((Bool) -> Void)? = nil
    ) {
        let answerRef = answersReference(userId: userId).child(questionId)
        let nowMilliseconds = milliseconds(from: now)
        answerRef.observeSingleEvent(of: .value) { snapshot in
            guard var value = snapshot.value as? [String: Any] else {
                completion?(false)
                return
            }

            let currentStage = int(value["reviewStage"]) ?? 0
            if currentStage >= nextIntervals.count {
                value["reviewStage"] = nextIntervals.count + 1
                value["lastAnsweredAt"] = nowMilliseconds
                value["masteredAt"] = nowMilliseconds

                let rootRef = Database.database().reference()
                rootRef.updateChildValues([
                    "\(incorrectAnswersPath)/\(userId)/\(questionId)": NSNull(),
                    "\(masteredAnswersPath)/\(userId)/\(questionId)": value
                ]) { error, _ in
                    guard error == nil else {
                        completion?(false)
                        return
                    }
                    if !questionId.hasPrefix(testQuestionIdPrefix) {
                        ReviewDailyActivityLog.record(ReviewDailyActivity(kind: .review, topicID: nil,
                            answeredCount: 1, correctCount: 1, masteredCount: 1, completedAt: now), userID: userId)
                        MissionManager.shared.updateMissionProgress(type: .review, increment: 1) { _ in }
                        GuildManager.shared.recordReviewCompleted()
                        markReviewDayIfCompleted(userId: userId, now: now)
                    }
                    completion?(true)
                }
            } else {
                let nextStage = currentStage + 1
                value["reviewStage"] = nextStage
                value["lastAnsweredAt"] = nowMilliseconds
                value["nextReviewAt"] = nowMilliseconds + Int64(nextIntervals[currentStage] * 1_000)
                answerRef.setValue(value) { error, _ in
                    if error == nil, !questionId.hasPrefix(testQuestionIdPrefix) {
                        ReviewDailyActivityLog.record(ReviewDailyActivity(kind: .review, topicID: nil,
                            answeredCount: 1, correctCount: 1, masteredCount: 0, completedAt: now), userID: userId)
                        markReviewDayIfCompleted(userId: userId, now: now)
                    }
                    completion?(error == nil)
                }
            }
        } withCancel: { _ in
            completion?(false)
        }
    }

    static func recordIncorrectReview(
        userId: String,
        questionId: String,
        now: Date = Date(),
        completion: ((Bool) -> Void)? = nil
    ) {
        let nowMilliseconds = milliseconds(from: now)
        answersReference(userId: userId).child(questionId).updateChildValues([
            "reviewStage": 0,
            "nextReviewAt": nowMilliseconds + Int64(firstReviewInterval * 1_000),
            "lastAnsweredAt": nowMilliseconds
        ]) { error, _ in
            if error == nil, !questionId.hasPrefix(testQuestionIdPrefix) {
                ReviewDailyActivityLog.record(ReviewDailyActivity(kind: .review, topicID: nil,
                    answeredCount: 1, correctCount: 0, masteredCount: 0, completedAt: now), userID: userId)
                markReviewDayIfCompleted(userId: userId, now: now)
            }
            completion?(error == nil)
        }
    }

    static func fetchMasteredQuestions(
        userId: String,
        completion: @escaping (Result<[MasteredReviewQuestion], Error>) -> Void
    ) {
        masteredAnswersReference(userId: userId).observeSingleEvent(of: .value) { snapshot in
            let questions = snapshot.children
                .compactMap { $0 as? DataSnapshot }
                .filter { !$0.key.hasPrefix(testQuestionIdPrefix) }
                .compactMap { snapshot -> MasteredReviewQuestion? in
                    guard let value = snapshot.value as? [String: Any],
                          let question = value["quizQuestion"] as? String,
                          let explanation = value["explanation"] as? String,
                          let masteredAt = int64(value["masteredAt"]) else {
                        return nil
                    }
                    return MasteredReviewQuestion(
                        id: snapshot.key,
                        question: question,
                        explanation: explanation,
                        masteredAt: Date(timeIntervalSince1970: TimeInterval(masteredAt) / 1_000),
                        sourceQuizLevel: value["sourceQuizLevel"] as? String
                    )
                }
                .sorted { $0.masteredAt > $1.masteredAt }
            completion(.success(questions))
        } withCancel: { error in
            completion(.failure(error))
        }
    }

    private static func fetchMasteredCount(
        userId: String,
        questionIdPrefix: String?,
        completion: @escaping (Int) -> Void
    ) {
        masteredAnswersReference(userId: userId).observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.children
                .compactMap { $0 as? DataSnapshot }
                .filter { child in
                    if let questionIdPrefix {
                        return child.key.hasPrefix(questionIdPrefix)
                    }
                    return !child.key.hasPrefix(testQuestionIdPrefix)
                }
                .count
            completion(count)
        } withCancel: { _ in
            completion(0)
        }
    }

    private static func markReviewDayIfCompleted(userId: String, now: Date) {
        fetchSummary(userId: userId, now: now) { summary in
            guard summary.dueCount == 0 else { return }
            reviewActivityReference(userId: userId)
                .child(activityDateKey(from: now))
                .setValue(["completedAt": milliseconds(from: now)])
        }
    }

    private static func fetchReviewStreak(
        userId: String,
        now: Date,
        includeDebugData: Bool,
        completion: @escaping (Int) -> Void
    ) {
        guard !includeDebugData else {
            completion(0)
            return
        }

        reviewActivityReference(userId: userId).observeSingleEvent(of: .value) { snapshot in
            let completedDays = Set(snapshot.children.compactMap { ($0 as? DataSnapshot)?.key })
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: now)
            var cursor = today

            if !completedDays.contains(activityDateKey(from: cursor)) {
                cursor = calendar.date(byAdding: .day, value: -1, to: cursor) ?? cursor
            }

            var streak = 0
            while completedDays.contains(activityDateKey(from: cursor)) {
                streak += 1
                guard let previousDay = calendar.date(byAdding: .day, value: -1, to: cursor) else { break }
                cursor = previousDay
            }
            completion(streak)
        } withCancel: { _ in
            completion(0)
        }
    }

    private static func activityDateKey(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

#if DEBUG
    static let debugQuestionIdPrefix = "codexReview"

    enum DebugScenario: String, CaseIterable, Identifiable {
        case allStages
        case firstReview
        case secondReview
        case finalReview
        case waiting
        case legacy
        case empty

        var id: String { rawValue }

        var title: String {
            switch self {
            case .allStages: return "全ステージ"
            case .firstReview: return "1日後の復習"
            case .secondReview: return "3日後の復習"
            case .finalReview: return "7日後・克服直前"
            case .waiting: return "次回待ち"
            case .legacy: return "旧データ"
            case .empty: return "復習問題なし"
            }
        }

        var detail: String {
            switch self {
            case .allStages: return "期限到来3問と期限前1問をまとめて確認"
            case .firstReview: return "正解で次回を3日後に更新"
            case .secondReview: return "正解で次回を7日後に更新"
            case .finalReview: return "正解で克服・ミッション達成を確認"
            case .waiting: return "今日の復習完了と次回日時を確認"
            case .legacy: return "スケジュールがない既存問題を即時出題"
            case .empty: return "まだ復習問題がない状態を確認"
            }
        }

        var systemImage: String {
            switch self {
            case .allStages: return "square.stack.3d.up.fill"
            case .firstReview: return "1.circle.fill"
            case .secondReview: return "3.circle.fill"
            case .finalReview: return "7.circle.fill"
            case .waiting: return "clock.fill"
            case .legacy: return "clock.arrow.circlepath"
            case .empty: return "checkmark.seal.fill"
            }
        }
    }

    /// 実機で復習フローを確認するためのデータを、専用IDだけに投入します。
    static func seedDebugQuestions(
        userId: String,
        now: Date = Date(),
        completion: ((Bool) -> Void)? = nil
    ) {
        applyDebugScenario(.allStages, userId: userId, now: now, completion: completion)
    }

    static func applyDebugScenario(
        _ scenario: DebugScenario,
        userId: String,
        now: Date = Date(),
        completion: ((Bool) -> Void)? = nil
    ) {
        let nowMilliseconds = milliseconds(from: now)
        let hourMilliseconds: Int64 = 60 * 60 * 1_000
        let dayMilliseconds: Int64 = 24 * hourMilliseconds

        func question(
            text: String,
            choices: [String],
            correctAnswerIndex: Int,
            explanation: String,
            reviewStage: Int,
            nextReviewAt: Int64
        ) -> [String: Any] {
            [
                "quizQuestion": text,
                "choices": choices,
                "correctAnswerIndex": correctAnswerIndex,
                "explanation": explanation,
                "sourceQuizLevel": "sansu3",
                "reviewStage": reviewStage,
                "nextReviewAt": nextReviewAt,
                "createdAt": nowMilliseconds,
                "lastAnsweredAt": nowMilliseconds
            ]
        }

        let stage0 = question(
                text: "【動作確認】12 × 8 の答えはどれ？",
                choices: ["86", "96", "106", "112"],
                correctAnswerIndex: 1,
                explanation: "12 × 8 = 96 です。正解すると次回は3日後です。",
                reviewStage: 0,
                nextReviewAt: nowMilliseconds - hourMilliseconds
            )
        let stage1 = question(
                text: "【動作確認】都道府県で一番人口が多いのはどこ？",
                choices: ["大阪府", "東京都", "神奈川県", "愛知県"],
                correctAnswerIndex: 1,
                explanation: "日本で一番人口が多いのは東京都です。正解すると次回は7日後です。",
                reviewStage: 1,
                nextReviewAt: nowMilliseconds - 2 * hourMilliseconds
            )
        let stage2 = question(
                text: "【動作確認】水が氷になる温度は何度？",
                choices: ["0度", "10度", "-10度", "100度"],
                correctAnswerIndex: 0,
                explanation: "水は0度で氷になります。正解すると苦手克服になります。",
                reviewStage: 2,
                nextReviewAt: nowMilliseconds - 3 * hourMilliseconds
            )
        let future = question(
                text: "【動作確認・期限前】「走る」の反対の意味の言葉はどれ？",
                choices: ["歩く", "止まる", "泳ぐ", "飛ぶ"],
                correctAnswerIndex: 1,
                explanation: "「走る」の反対は「止まる」です。この問題は期限表示の確認用です。",
                reviewStage: 1,
                nextReviewAt: nowMilliseconds + dayMilliseconds
            )
        let legacy: [String: Any] = [
            "quizQuestion": "【動作確認・旧データ】1メートルは何センチメートル？",
            "choices": ["10cm", "100cm", "1000cm", "1cm"],
            "correctAnswerIndex": 1,
            "explanation": "旧形式の問題は復習日時がないため、すぐに出題されます。"
        ]

        var updates: [AnyHashable: Any] = [
            "codexReviewDueStage0": NSNull(),
            "codexReviewDueStage1": NSNull(),
            "codexReviewDueStage2": NSNull(),
            "codexReviewFuture": NSNull(),
            "codexReviewLegacy": NSNull()
        ]

        switch scenario {
        case .allStages:
            updates["codexReviewDueStage0"] = stage0
            updates["codexReviewDueStage1"] = stage1
            updates["codexReviewDueStage2"] = stage2
            updates["codexReviewFuture"] = future
        case .firstReview:
            updates["codexReviewDueStage0"] = stage0
        case .secondReview:
            updates["codexReviewDueStage1"] = stage1
        case .finalReview:
            updates["codexReviewDueStage2"] = stage2
        case .waiting:
            updates["codexReviewFuture"] = future
        case .legacy:
            updates["codexReviewLegacy"] = legacy
        case .empty:
            break
        }

        answersReference(userId: userId).updateChildValues(updates) { error, _ in
            completion?(error == nil)
        }
    }
#endif

    private static func answersReference(userId: String) -> DatabaseReference {
        Database.database().reference().child(incorrectAnswersPath).child(userId)
    }

    private static func masteredAnswersReference(userId: String) -> DatabaseReference {
        Database.database().reference().child(masteredAnswersPath).child(userId)
    }

    private static func reviewActivityReference(userId: String) -> DatabaseReference {
        Database.database().reference().child(reviewActivityPath).child(userId)
    }

    private static func decodedQuestion(from value: [String: Any], id: String) -> QuizQuestion? {
        quizQuestion(fromIncorrectAnswerDict: value, quizId: id)
    }

    private static func milliseconds(from date: Date) -> Int64 {
        Int64(date.timeIntervalSince1970 * 1_000)
    }

    private static func int(_ value: Any?) -> Int? {
        if let value = value as? Int { return value }
        if let value = value as? NSNumber { return value.intValue }
        return nil
    }

    private static func int64(_ value: Any?) -> Int64? {
        if let value = value as? Int64 { return value }
        if let value = value as? Int { return Int64(value) }
        if let value = value as? NSNumber { return value.int64Value }
        return nil
    }
}
