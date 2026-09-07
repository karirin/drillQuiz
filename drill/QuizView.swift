//
//  QuizView.swift main
//  it
//
//  Created by hashimo ryoya on 2023/09/16.
//

import SwiftUI
import AVFoundation
import Firebase

extension QuizITLevel: CaseIterable {
    static var allCases: [QuizITLevel] {
        return [.itBasic, .itStrategy, .itTechnology, .itManagement]
        // 除外したいケースをここで除外
    }
}

enum QuizITLevel {
    case beginner
    case beginnerStory1
    case beginnerStory2
    case beginnerStory3
    case intermediate
    case advanced
    case network
    case security
    case database
    case daily
    case god
    case incorrectAnswer
    case timeBeginner
    case timeIntermediate
    case timeAdvanced
    case itBasic
    case infoBasic
    case appliedBasic
    case itStrategy
    case infoStrategy
    case appliedStrategy
    case itTechnology
    case infoTechnology
    case appliedTechnology
    case itManagement
    case infoManagement
    case appliedManagement
    
    var description: String {
        switch self {
        case .beginner:
            return "beginner"
        case .intermediate:
            return "intermediate"
        case .advanced:
            return "advanced"
        case .network:
            return "network"
        case .security:
            return "security"
        case .database:
            return "database"
        case .daily:
            return "daily"
        case .god:
            return "god"
        case .incorrectAnswer:
            return "incorrectAnswer"
        case .timeBeginner:
            return "timeBeginner"
        case .timeIntermediate:
            return "timeIntermediate"
        case .timeAdvanced:
            return "timeAdvanced"
        case .beginnerStory1:
            return "beginnerStory1"
        case .beginnerStory2:
            return "beginnerStory2"
        case .beginnerStory3:
            return "beginnerStory3"
        case .itStrategy:
            return "itStrategy"
        case .infoStrategy:
            return "infoStrategy"
        case .appliedStrategy:
            return "appliedStrategy"
        case .itTechnology:
            return "itTechnology"
        case .infoTechnology:
            return "infoTechnology"
        case .appliedTechnology:
            return "appliedTechnology"
        case .itManagement:
            return "itManagement"
        case .infoManagement:
            return "infoManagement"
        case .appliedManagement:
            return "appliedManagement"
        case .itBasic:
            return "itBasic"
        case .infoBasic:
            return "infoBasic"
        case .appliedBasic:
            return "appliedBasic"
        }
    }
}

struct QuizQuestion {
    var id: String?
    var question: String
    var choices: [String]
    var correctAnswerIndex: Int
    var explanation: String
    var format: QuizQuestionFormat
    var acceptableAnswers: [String]
    var orderedChoices: [String]
    var matchingPairs: [QuizMatchingPair]
    var referenceTitle: String
    var referenceRows: [QuizReferenceRow]
    var mapRegions: [QuizMapRegion]
    var inputPlaceholder: String

    init(
        id: String? = nil,
        question: String,
        choices: [String],
        correctAnswerIndex: Int,
        explanation: String,
        format: QuizQuestionFormat = .multipleChoice,
        acceptableAnswers: [String] = [],
        orderedChoices: [String] = [],
        matchingPairs: [QuizMatchingPair] = [],
        referenceTitle: String = "",
        referenceRows: [QuizReferenceRow] = [],
        mapRegions: [QuizMapRegion] = [],
        inputPlaceholder: String = "答えを入力"
    ) {
        self.id = id
        self.question = question
        self.choices = choices
        self.correctAnswerIndex = correctAnswerIndex
        self.explanation = explanation
        self.format = format
        self.acceptableAnswers = acceptableAnswers
        self.orderedChoices = orderedChoices
        self.matchingPairs = matchingPairs
        self.referenceTitle = referenceTitle
        self.referenceRows = referenceRows
        self.mapRegions = mapRegions
        self.inputPlaceholder = inputPlaceholder
    }

    static func fillInBlank(
        id: String? = nil,
        question: String,
        answer: String,
        acceptableAnswers: [String] = [],
        explanation: String,
        inputPlaceholder: String = "答えを入力"
    ) -> QuizQuestion {
        let normalizedAnswers = [answer] + acceptableAnswers.filter { $0 != answer }
        return QuizQuestion(
            id: id,
            question: question,
            choices: [],
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .fillInBlank,
            acceptableAnswers: normalizedAnswers,
            inputPlaceholder: inputPlaceholder
        )
    }

    static func extractText(
        id: String? = nil,
        question: String,
        answer: String,
        acceptableAnswers: [String] = [],
        explanation: String,
        inputPlaceholder: String = "本文からそのまま入力"
    ) -> QuizQuestion {
        let normalizedAnswers = [answer] + acceptableAnswers.filter { $0 != answer }
        return QuizQuestion(
            id: id,
            question: question,
            choices: [],
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .extractText,
            acceptableAnswers: normalizedAnswers,
            inputPlaceholder: inputPlaceholder
        )
    }

    static func reorder(
        id: String? = nil,
        question: String,
        choices: [String],
        orderedChoices: [String],
        explanation: String
    ) -> QuizQuestion {
        QuizQuestion(
            id: id,
            question: question,
            choices: choices,
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .reorder,
            orderedChoices: orderedChoices
        )
    }

    static func matching(
        id: String? = nil,
        question: String,
        pairs: [QuizMatchingPair],
        choices: [String]? = nil,
        explanation: String
    ) -> QuizQuestion {
        QuizQuestion(
            id: id,
            question: question,
            choices: choices ?? pairs.map(\.match).shuffled(),
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .matching,
            matchingPairs: pairs
        )
    }

    static func related(
        id: String? = nil,
        question: String,
        pairs: [QuizMatchingPair],
        choices: [String]? = nil,
        explanation: String
    ) -> QuizQuestion {
        QuizQuestion(
            id: id,
            question: question,
            choices: choices ?? pairs.map(\.match).shuffled(),
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .related,
            matchingPairs: pairs
        )
    }

    static func chronological(
        id: String? = nil,
        question: String,
        choices: [String],
        orderedChoices: [String],
        explanation: String
    ) -> QuizQuestion {
        QuizQuestion(
            id: id,
            question: question,
            choices: choices,
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .chronological,
            orderedChoices: orderedChoices
        )
    }

    static func classification(
        id: String? = nil,
        question: String,
        pairs: [QuizMatchingPair],
        categories: [String]? = nil,
        explanation: String
    ) -> QuizQuestion {
        QuizQuestion(
            id: id,
            question: question,
            choices: categories ?? Array(NSOrderedSet(array: pairs.map(\.match))).compactMap { $0 as? String },
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .classification,
            matchingPairs: pairs
        )
    }

    static func ranking(
        id: String? = nil,
        question: String,
        choices: [String],
        rankedChoices: [String],
        explanation: String
    ) -> QuizQuestion {
        QuizQuestion(
            id: id,
            question: question,
            choices: choices,
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .ranking,
            orderedChoices: rankedChoices
        )
    }

    static func dataReading(
        id: String? = nil,
        question: String,
        answer: String,
        acceptableAnswers: [String] = [],
        referenceTitle: String,
        referenceRows: [QuizReferenceRow],
        explanation: String,
        inputPlaceholder: String = "資料を見て答えを入力"
    ) -> QuizQuestion {
        let normalizedAnswers = [answer] + acceptableAnswers.filter { $0 != answer }
        return QuizQuestion(
            id: id,
            question: question,
            choices: [],
            correctAnswerIndex: 0,
            explanation: explanation,
            format: .dataReading,
            acceptableAnswers: normalizedAnswers,
            referenceTitle: referenceTitle,
            referenceRows: referenceRows,
            inputPlaceholder: inputPlaceholder
        )
    }

    static func mapSelection(
        id: String? = nil,
        question: String,
        regions: [QuizMapRegion],
        correctRegionID: String,
        explanation: String,
        referenceTitle: String = "地図を見て答えましょう"
    ) -> QuizQuestion {
        let correctIndex = regions.firstIndex(where: { $0.id == correctRegionID }) ?? 0
        return QuizQuestion(
            id: id,
            question: question,
            choices: regions.map(\.label),
            correctAnswerIndex: correctIndex,
            explanation: explanation,
            format: .mapSelection,
            referenceTitle: referenceTitle,
            mapRegions: regions
        )
    }
}

enum QuizQuestionFormat: String {
    case multipleChoice
    case fillInBlank
    case extractText
    case reorder
    case matching
    case related
    case chronological
    case classification
    case ranking
    case dataReading
    case mapSelection
}

struct QuizMatchingPair: Hashable {
    var prompt: String
    var match: String
}

struct QuizReferenceRow: Hashable {
    var label: String
    var value: String
}

struct QuizMapRegion: Hashable {
    var id: String
    var label: String
    var row: Int
    var column: Int
}

struct IncorrectAnswer {
    var userId: String
    var quizQuestion: String
    var choices: [String]
    var correctAnswerIndex: Int
    var explanation: String
    var format: QuizQuestionFormat
    var acceptableAnswers: [String]
    var orderedChoices: [String]
    var matchingPairs: [QuizMatchingPair]
    var referenceTitle: String
    var referenceRows: [QuizReferenceRow]
    var mapRegions: [QuizMapRegion]
    var inputPlaceholder: String

    init(
        userId: String,
        quizQuestion: String,
        choices: [String],
        correctAnswerIndex: Int,
        explanation: String,
        format: QuizQuestionFormat = .multipleChoice,
        acceptableAnswers: [String] = [],
        orderedChoices: [String] = [],
        matchingPairs: [QuizMatchingPair] = [],
        referenceTitle: String = "",
        referenceRows: [QuizReferenceRow] = [],
        mapRegions: [QuizMapRegion] = [],
        inputPlaceholder: String = "答えを入力"
    ) {
        self.userId = userId
        self.quizQuestion = quizQuestion
        self.choices = choices
        self.correctAnswerIndex = correctAnswerIndex
        self.explanation = explanation
        self.format = format
        self.acceptableAnswers = acceptableAnswers
        self.orderedChoices = orderedChoices
        self.matchingPairs = matchingPairs
        self.referenceTitle = referenceTitle
        self.referenceRows = referenceRows
        self.mapRegions = mapRegions
        self.inputPlaceholder = inputPlaceholder
    }

    init(userId: String, quiz: QuizQuestion) {
        self.init(
            userId: userId,
            quizQuestion: quiz.question,
            choices: quiz.choices,
            correctAnswerIndex: quiz.correctAnswerIndex,
            explanation: quiz.explanation,
            format: quiz.format,
            acceptableAnswers: quiz.acceptableAnswers,
            orderedChoices: quiz.orderedChoices,
            matchingPairs: quiz.matchingPairs,
            referenceTitle: quiz.referenceTitle,
            referenceRows: quiz.referenceRows,
            mapRegions: quiz.mapRegions,
            inputPlaceholder: quiz.inputPlaceholder
        )
    }

    var databasePayload: [String: Any] {
        [
            "quizQuestion": quizQuestion,
            "choices": choices,
            "correctAnswerIndex": correctAnswerIndex,
            "explanation": explanation,
            "format": format.rawValue,
            "acceptableAnswers": acceptableAnswers,
            "orderedChoices": orderedChoices,
            "matchingPairs": matchingPairs.map {
                [
                    "prompt": $0.prompt,
                    "match": $0.match
                ]
            },
            "referenceTitle": referenceTitle,
            "referenceRows": referenceRows.map {
                [
                    "label": $0.label,
                    "value": $0.value
                ]
            },
            "mapRegions": mapRegions.map {
                [
                    "id": $0.id,
                    "label": $0.label,
                    "row": $0.row,
                    "column": $0.column
                ]
            },
            "inputPlaceholder": inputPlaceholder
        ]
    }
}

func quizQuestion(fromIncorrectAnswerDict dict: [String: Any], quizId: String) -> QuizQuestion? {
    guard
        let question = dict["quizQuestion"] as? String,
        let choices = dict["choices"] as? [String],
        let explanation = dict["explanation"] as? String
    else {
        return nil
    }

    let correctAnswerIndex: Int
    if let index = dict["correctAnswerIndex"] as? Int {
        correctAnswerIndex = index
    } else if let number = dict["correctAnswerIndex"] as? NSNumber {
        correctAnswerIndex = number.intValue
    } else {
        return nil
    }

    let format = QuizQuestionFormat(rawValue: dict["format"] as? String ?? "") ?? .multipleChoice
    let acceptableAnswers = dict["acceptableAnswers"] as? [String] ?? []
    let orderedChoices = dict["orderedChoices"] as? [String] ?? []
    let inputPlaceholder = dict["inputPlaceholder"] as? String ?? "答えを入力"

    let matchingPairs: [QuizMatchingPair] = (dict["matchingPairs"] as? [[String: Any]] ?? []).compactMap { pairDict in
        guard
            let prompt = pairDict["prompt"] as? String,
            let match = pairDict["match"] as? String
        else {
            return nil
        }
        return QuizMatchingPair(prompt: prompt, match: match)
    }

    let referenceTitle = dict["referenceTitle"] as? String ?? ""
    let referenceRows: [QuizReferenceRow] = (dict["referenceRows"] as? [[String: Any]] ?? []).compactMap { rowDict in
        guard
            let label = rowDict["label"] as? String,
            let value = rowDict["value"] as? String
        else {
            return nil
        }
        return QuizReferenceRow(label: label, value: value)
    }

    let mapRegions: [QuizMapRegion] = (dict["mapRegions"] as? [[String: Any]] ?? []).compactMap { regionDict in
        guard
            let id = regionDict["id"] as? String,
            let label = regionDict["label"] as? String
        else {
            return nil
        }

        let row: Int
        if let intRow = regionDict["row"] as? Int {
            row = intRow
        } else if let numberRow = regionDict["row"] as? NSNumber {
            row = numberRow.intValue
        } else {
            return nil
        }

        let column: Int
        if let intColumn = regionDict["column"] as? Int {
            column = intColumn
        } else if let numberColumn = regionDict["column"] as? NSNumber {
            column = numberColumn.intValue
        } else {
            return nil
        }

        return QuizMapRegion(id: id, label: label, row: row, column: column)
    }

    return QuizQuestion(
        id: quizId,
        question: question,
        choices: choices,
        correctAnswerIndex: correctAnswerIndex,
        explanation: explanation,
        format: format,
        acceptableAnswers: acceptableAnswers,
        orderedChoices: orderedChoices,
        matchingPairs: matchingPairs,
        referenceTitle: referenceTitle,
        referenceRows: referenceRows,
        mapRegions: mapRegions,
        inputPlaceholder: inputPlaceholder
    )
}

func balancedShuffledQuizList(_ quizzes: [QuizQuestion]) -> [QuizQuestion] {
    let specialFormatQuizzes = quizzes.filter { $0.format != .multipleChoice }.shuffled()
    let multipleChoiceQuizzes = quizzes.filter { $0.format == .multipleChoice }.shuffled()

    var mixedQuizzes: [QuizQuestion] = []
    var specialIndex = 0
    var multipleChoiceIndex = 0

    while specialIndex < specialFormatQuizzes.count || multipleChoiceIndex < multipleChoiceQuizzes.count {
        if specialIndex < specialFormatQuizzes.count {
            mixedQuizzes.append(specialFormatQuizzes[specialIndex])
            specialIndex += 1
        }

        if multipleChoiceIndex < multipleChoiceQuizzes.count {
            mixedQuizzes.append(multipleChoiceQuizzes[multipleChoiceIndex])
            multipleChoiceIndex += 1
        }
    }

    return mixedQuizzes
}

func sociallyBalancedShuffledQuizList(_ quizzes: [QuizQuestion]) -> [QuizQuestion] {
    balancedShuffledQuizList(quizzes)
}

struct QuizResult {
    var question: String
    var userAnswer: String
    var correctAnswer: String
    var explanation: String
    var isCorrect: Bool  // 正解か不正解かを示すプロパティ
    var showExplanation: Bool = false
}

struct ViewPositionKey1: PreferenceKey {
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct ViewPositionKey2: PreferenceKey {
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct ViewPositionKey3: PreferenceKey {
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

enum QuizTutorialMessagePlacement {
    case above
    case below
}

struct QuizTutorialStepStyle {
    let icon: String
    let title: String
    let description: String
    let accentColors: [Color]
    let cornerRadius: CGFloat
    let messagePlacement: QuizTutorialMessagePlacement
}

struct QuizTutorialOverlayView: View {
    let spotlightRect: CGRect
    let cornerRadius: CGFloat
    let stepNumber: Int
    let icon: String
    let title: String
    let description: String
    let accentColors: [Color]
    let messagePlacement: QuizTutorialMessagePlacement
    let onSkip: () -> Void

    var body: some View {
        let cutoutWidth = max(spotlightRect.width, 0)
        let cutoutHeight = max(spotlightRect.height, 0)

        GeometryReader { geometry in
            let origin = geometry.frame(in: .global).origin
            let localMidX = spotlightRect.midX - origin.x
            let localMidY = spotlightRect.midY - origin.y
            let idealCardY = messagePlacement == .below
                ? (spotlightRect.maxY - origin.y) + 100
                : (spotlightRect.minY - origin.y) - 100
            let cardY = min(max(idealCardY, 120), geometry.size.height - 120)

            ZStack {
                Color.black.opacity(0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .frame(width: cutoutWidth, height: cutoutHeight)
                            .position(x: localMidX, y: localMidY)
                            .blendMode(.destinationOut)
                    )
                    .compositingGroup()

                VStack(spacing: 10) {
                    Text("STEP \(stepNumber)")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            LinearGradient(
                                colors: accentColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(Capsule())

                    Image(systemName: icon)
                        .font(.system(size: 28))
                        .foregroundStyle(
                            LinearGradient(
                                colors: accentColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    Text(title)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color("fontGray"))

                    Text(description)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 22)
                .background(Color("Color2"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.2), radius: 15, y: 8)
                .frame(maxWidth: .infinity)
                .position(x: geometry.size.width / 2, y: cardY)

                VStack {
                    Spacer()
                    HStack {
                        Button(action: onSkip) {
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
        }
        .ignoresSafeArea()
    }
}

struct TimerArc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
}

struct BattleComboTier {
    let requiredStreak: Int
    let multiplier: Double
    let colors: [Color]
}

enum MonsterComboSystem {
    static let tiers: [BattleComboTier] = [
        BattleComboTier(requiredStreak: 8, multiplier: 2.0, colors: [Color.red, Color.orange]),
        BattleComboTier(requiredStreak: 5, multiplier: 1.5, colors: [Color.orange, Color.yellow]),
        BattleComboTier(requiredStreak: 2, multiplier: 1.2, colors: [Color.blue, Color.cyan])
    ]

    static func tier(for comboCount: Int) -> BattleComboTier? {
        tiers.first { comboCount >= $0.requiredStreak }
    }

    static func multiplier(for comboCount: Int) -> Double {
        tier(for: comboCount)?.multiplier ?? 1.0
    }

    static func reducedComboCountAfterTimeout(from comboCount: Int) -> Int {
        comboCount / 2
    }
}

struct MonsterComboBadgeView: View {
    let comboCount: Int
    let multiplier: Double
    let isPulsing: Bool

    private var colors: [Color] {
        MonsterComboSystem.tier(for: comboCount)?.colors ?? [Color.gray.opacity(0.9), Color.gray.opacity(0.7)]
    }

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "flame.fill")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, .yellow],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: colors.first?.opacity(0.8) ?? .clear, radius: 6)

            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 3) {
                    Text("\(comboCount)")
                        .font(.system(size: 20, weight: .black, design: .rounded))
                    Text("COMBO")
                        .font(.system(size: 11, weight: .heavy, design: .rounded))
                        .offset(y: 2)
                }

                Text(String(format: "ATK x%.1f", multiplier))
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.85))
            }
        }
        .foregroundColor(.white)
        .padding(.leading, 10)
        .padding(.trailing, 14)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(
                    LinearGradient(
                        colors: colors + [colors.first?.opacity(0.8) ?? .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        )
        .overlay(
            Capsule()
                .stroke(
                    LinearGradient(
                        colors: [.white.opacity(0.6), .white.opacity(0.15)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(color: colors.first?.opacity(0.5) ?? .clear, radius: isPulsing ? 16 : 10, x: 0, y: 4)
        .scaleEffect(isPulsing ? 1.1 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPulsing)
    }
}

struct QuizView: View {
    let quizzes: [QuizQuestion]
    let quizLevel: QuizLevel
    @State private var selectedAnswerIndex: Int? = nil
    @State private var currentQuizIndex: Int = 0
    @State private var showCompletionMessage: Bool = false
    @State private var showSubFlag: Bool = false
    @State private var remainingSeconds: Int = 30
    @State private var timer: Timer? = nil
    @State private var navigateToQuizResultView: Bool = false
    @ObservedObject var authManager : AuthManager
    @ObservedObject var audioManager : AudioManager
    @State private var showModal: Bool = false
    @State private var showTutorial: Bool = false
    @State private var quizResults: [QuizResult] = []
    @State private var leagueSessionId: String = UUID().uuidString
    @State private var answerCount: Int = 0
    @State private var incorrectCount: Int = 0
    @State private var incorrectAnswerCount: Int = 0
    @State private var correctAnswerCount: Int = 0
    @State private var countdownValue: Int = 3
    @State private var showCountdown: Bool = false
    @State private var playerHP: Int = 1000
    @State private var playerMaxHP: Int = 1000
    @State private var monsterHP: Int = 3000
    @State private var monsterUnderHP: Int = 30
    @State private var monsterAttack: Int = 30
    @State var showAlert: Bool = false
    @State private var userName: String = ""
    @State private var avator: [[String: Any]] = []
    @State private var monsterBackground: String = ""
    @State private var userMoney: Int = 0
    @State private var userHp: Int = 100
    @State private var userMaxHp: Int = 100
    @State private var userFlag: Int = 0
    @State private var userPreFlag: Int = 0
    @State private var avatarHp: Int = 100
    @State private var userAttack: Int = 30
    @State private var tutorialNum: Int = 0
    @State private var monsterType: Int = 0
    @State private var playerExperience: Int = 0
    @State private var playerMoney: Int = 0
    @State private var shakeEffect: Bool = false
    @State private var showAttackImage: Bool = false
    @State var showExplanationModal: Bool = false
    @State private var showMonsterDownImage: Bool = false
    @State private var showIncorrectBackground: Bool = false
    @State private var hasAnswered: Bool = false
    @Binding var isPresenting: Bool
    @State var showHomeModal: Bool = false
    @State private var isSoundOn: Bool = true
    @State private var showTutorial1 = true
    @State private var showTutorial2 = false
    @State private var showTutorial3 = false
    @State private var showTutorial4 = false
    @State private var buttonRect: CGRect = .zero
    @State private var buttonRect1: CGRect = .zero
    @State private var buttonRect2: CGRect = .zero
    @State private var buttonRect3: CGRect = .zero
    @State private var bubbleHeight: CGFloat = 0.0
    @State private var startTime = Date()
    @State private var endTime: Date?
    @State private var elapsedTime: TimeInterval?
    @State private var navigateToQuizResult = false
    @ObservedObject var interstitial: Interstitial
    @ObservedObject var appState = AppState.shared
    @State private var rewardFlag: Int = 0
    @State private var comboCount: Int = 0
    @State private var comboPulse: Bool = false

    private var isDeveloperMode: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    
    var currentQuiz: QuizQuestion {
        quizzes[currentQuizIndex]
    }

    var isCalculatorQuiz: Bool {
        currentQuiz.supportsCalculatorInput
    }

    var isCompactAnswerQuiz: Bool {
        currentQuiz.usesCompactAnswerLayout
    }

    @ViewBuilder
    private var topContentSpacer: some View {
        if isCompactAnswerQuiz {
            Color.clear.frame(height: 2)
        } else {
            Spacer()
        }
    }

    @ViewBuilder
    private var answerContentSpacer: some View {
        if isCompactAnswerQuiz {
            Color.clear.frame(height: 2)
        } else {
            Spacer()
        }
    }

    @ViewBuilder
    private var answerInputSection: some View {
        Group {
            if isCalculatorQuiz {
                VStack(spacing: 6) {
                    answerInputContent

                    if showCompletionMessage {
                        NavigationLink("", destination: QuizResultView(results: quizResults, authManager: authManager, isPresenting: $isPresenting, navigateToQuizResultView: $navigateToQuizResultView, playerExperience: playerExperience, playerMoney: playerMoney, elapsedTime: 0,quizLevel: quizLevel).navigationBarBackButtonHidden(true), isActive: $navigateToQuizResultView)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 2)
            } else {
                ScrollView{
                    VStack(spacing: 0){
                        answerInputContent

                        if showCompletionMessage {
                            NavigationLink("", destination: QuizResultView(results: quizResults, authManager: authManager, isPresenting: $isPresenting, navigateToQuizResultView: $navigateToQuizResultView, playerExperience: playerExperience, playerMoney: playerMoney, elapsedTime: 0,quizLevel: quizLevel).navigationBarBackButtonHidden(true), isActive: $navigateToQuizResultView)
                        }
                    }
                }
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .padding(.bottom, 12)
            }
        }
    }

    private var answerInputContent: some View {
        QuestionAnswerInputView(
            questionKey: currentQuiz.id ?? "\(currentQuizIndex)-\(currentQuiz.question)",
            question: currentQuiz,
            isAnswered: hasAnswered,
            correctAnswerIndex: hasAnswered ? currentQuiz.correctAnswerIndex : nil,
            onChoiceSelected: answerSelectionAction,
            onTextSubmitted: answerSubmissionAction,
            onReorderSubmitted: reorderSubmissionAction,
            onMatchingSubmitted: matchingSubmissionAction,
            onMapSelectionSubmitted: mapSelectionSubmissionAction
        )
        .onAppear{
            showTutorial = true
        }
        .frame(maxWidth: .infinity)
        .shadow(radius: 1)
        .background(GeometryReader { geometry in
            Color.clear.preference(key: ViewPositionKey1.self, value: [geometry.frame(in: .global)])
        })
    }
    
    func pauseTimer() {
        timer?.invalidate()
    }
    
    func resumeTimer() {
        // 現在のタイマーを止める
        self.timer?.invalidate()
        
        // ここではremainingSecondsをリセットしない
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                timer.invalidate()
                applyTimeoutComboPenalty()
                playerHP -= monsterAttack
                self.moveToNextQuiz()
            }
        }
    }
    
    func startCountdown() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if countdownValue > 1 {
                    countdownValue -= 1
                } else {
                    timer.invalidate()
                    showCountdown = false
                    if !(3...6).contains(tutorialNum) {
                        startTimer()
                    }
                }
            }
        }
    }
    
    
    func fetchNumberOfIncorrectAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
    }
    }
    func fetchNumberOfIncorrectSansuAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectSansuAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
    }
    }
    func fetchNumberOfIncorrectRikaAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectRikaAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
    }
    }
    func fetchNumberOfIncorrectShakaiAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectShakaiAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
    }
    }
    func fetchNumberOfIncorrectKokugoAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectKokugoAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
    }
    }
    func fetchNumberOfIncorrectITStrategyAnswers(userId: String, completion: @escaping (Int) -> Void) {
    let ref = Database.database().reference().child("IncorrectITStrategyAnswers").child(userId)
    ref.observeSingleEvent(of: .value) { snapshot in
    let count = snapshot.childrenCount // 子ノードの数を取得
    completion(Int(count))
    }
    }

    func startTimer() {
        // 現在のタイマーを止める
        self.timer?.invalidate()
        
        // 3秒後に以下のコードブロックを実行
        self.remainingSeconds = 30
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                timer.invalidate()
                applyTimeoutComboPenalty()
                playerHP -= monsterAttack
                self.moveToNextQuiz()
            }
        }
    }

    private func advanceQuizIndex() {
        guard !quizzes.isEmpty else { return }

        if isDeveloperMode {
            currentQuizIndex = (currentQuizIndex + 1) % quizzes.count
        } else {
            currentQuizIndex += 1
        }
    }

    private func prepareForNextDeveloperQuiz() {
        if monsterHP <= 0 {
            monsterType = 1
            monsterHP = max(monsterUnderHP, 1)
        }

        if playerHP <= 0 {
            playerHP = max(userMaxHp, 1)
        }

        showCompletionMessage = false
        navigateToQuizResultView = false
    }

    // 次の問題へ移る処理
    func moveToNextQuiz() {
        if isDeveloperMode {
            prepareForNextDeveloperQuiz()

            if remainingSeconds == 0 {
                advanceQuizIndex()
                selectedAnswerIndex = nil
                startTimer()
            } else if userFlag == 0 {
                showExplanationModal = true
            } else {
                advanceQuizIndex()
                selectedAnswerIndex = nil
                startTimer()
            }

            hasAnswered = false
            return
        }

        if monsterType == 2 && monsterHP <= 0 {
            // 最後のモンスターが倒された場合、結果画面へ遷移
            showCompletionMessage = true
            timer?.invalidate()
            RateManager.shared.updateQuizData(userId: authManager.currentUserId!, quizType: quizLevel, newCorrectAnswers: correctAnswerCount, newTotalAnswers: answerCount)
            RateManager.shared.updateAnswerData(userId: authManager.currentUserId!, quizType: quizLevel,  newTotalAnswers: answerCount)
            recordWeeklyLeagueResultIfPossible(didClear: true)
            navigateToQuizResultView = true //ここで結果画面への遷移フラグをtrueに
        } else if playerHP <= 0 {
            showCompletionMessage = true
            timer?.invalidate()
            playerExperience = 5
            playerMoney = 5
            RateManager.shared.updateQuizData(userId: authManager.currentUserId!, quizType: quizLevel, newCorrectAnswers: correctAnswerCount, newTotalAnswers: answerCount)
            RateManager.shared.updateAnswerData(userId: authManager.currentUserId!, quizType: quizLevel,  newTotalAnswers: answerCount)
            recordWeeklyLeagueResultIfPossible(didClear: false)
            navigateToQuizResultView = true  //ここで結果画面への遷移フラグをtrueに

        } else if self.remainingSeconds == 0 {
            advanceQuizIndex()
            selectedAnswerIndex = nil
            startTimer()
            hasAnswered = false
        } else if currentQuizIndex + 1 < quizzes.count {
            if userFlag == 0 {
                showExplanationModal = true
            } else {
                advanceQuizIndex()
                selectedAnswerIndex = nil
                startTimer()
            }
            hasAnswered = false
        } else {
            // すべての問題が終了した場合、結果画面へ遷移
            showCompletionMessage = true
            timer?.invalidate()
            recordWeeklyLeagueResultIfPossible(didClear: true)
            navigateToQuizResultView = true  // ここで結果画面への遷移フラグをtrueに
        }
    }

    private func recordWeeklyLeagueResultIfPossible(didClear: Bool) {
        guard let userId = authManager.currentUserId else { return }
        WeeklyLeagueService.shared.recordQuizResult(
            userId: userId,
            context: WeeklyLeagueQuizContext(
                results: quizResults,
                quizLevel: quizLevel,
                didClear: didClear
            ),
            sessionId: leagueSessionId
        )
    }
    
    func answerSelectionAction(index: Int) {
        submitAnswer(selectionIndex: index, userAnswer: currentQuiz.choices[index], isAnswerCorrect: index == currentQuiz.correctAnswerIndex)
    }

    func answerSubmissionAction(userAnswer: String) {
        let isAnswerCorrect = isCalculatorQuiz
            ? currentQuiz.matchesCalculatorAnswer(userAnswer)
            : currentQuiz.matchesTextAnswer(userAnswer)
        let selectionIndex = isAnswerCorrect ? currentQuiz.correctAnswerIndex : -1
        submitAnswer(selectionIndex: selectionIndex, userAnswer: userAnswer, isAnswerCorrect: isAnswerCorrect)
    }

    func reorderSubmissionAction(selections: [String]) {
        let isAnswerCorrect = currentQuiz.matchesReorderedChoices(selections)
        let selectionIndex = isAnswerCorrect ? currentQuiz.correctAnswerIndex : -1
        submitAnswer(
            selectionIndex: selectionIndex,
            userAnswer: currentQuiz.formattedReorderedAnswer(selections),
            isAnswerCorrect: isAnswerCorrect
        )
    }

    func matchingSubmissionAction(selections: [String: String]) {
        let isAnswerCorrect = currentQuiz.matchesMatchingPairs(selections)
        let selectionIndex = isAnswerCorrect ? currentQuiz.correctAnswerIndex : -1
        submitAnswer(
            selectionIndex: selectionIndex,
            userAnswer: currentQuiz.formattedMatchingAnswer(selections),
            isAnswerCorrect: isAnswerCorrect
        )
    }

    func mapSelectionSubmissionAction(regionID: String) {
        let isAnswerCorrect = currentQuiz.matchesMapSelection(regionID)
        let selectionIndex = isAnswerCorrect ? currentQuiz.correctAnswerIndex : -1
        submitAnswer(
            selectionIndex: selectionIndex,
            userAnswer: currentQuiz.formattedMapSelectionAnswer(regionID),
            isAnswerCorrect: isAnswerCorrect
        )
    }

    private func submitAnswer(selectionIndex: Int, userAnswer: String, isAnswerCorrect: Bool) {
        if !hasAnswered {
            self.selectedAnswerIndex = selectionIndex
            self.timer?.invalidate() // 回答を選択したらタイマーを止める

            if isAnswerCorrect {
                let damage = comboAdjustedDamage()
                GuildManager.shared.attackRaidBossIfPossible(damage: damage)
                audioManager.playCorrectSound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    audioManager.playAttackSound()

                    self.showAttackImage = true
                    registerSuccessfulCombo()
                    correctAnswerCount += 1 // 正解の場合、正解数をインクリメント
                    incorrectCount -= 1
                    answerCount += 1
                    if quizLevel != .incorrectAnswer && quizLevel != .incorrectSansuAnswer && quizLevel != .incorrectShakaiAnswer && quizLevel != .incorrectRikaAnswer && quizLevel != .incorrectKokugoAnswer && quizLevel != .incorrectITStrategyAnswer {
                        monsterHP -= damage
                    }
                    if monsterHP <= 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            audioManager.playDownSound()
                            self.showMonsterDownImage = true
                        }
                        // モンスターのHPが0以下になった場合の処理
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.showMonsterDownImage = false
                            if isDeveloperMode {
                                monsterType = monsterType >= 3 ? 1 : monsterType + 1
                            } else {
                                monsterType += 1
                            }
                        }
                    } else if !isDeveloperMode && playerHP <= 0 {
                        // プレイヤーのHPが0以下になった場合の処理
                        showCompletionMessage = true
                        timer?.invalidate()
                    }
                }
                if quizLevel == .incorrectSansuAnswer{
                    removeCorrectSansuAnswer(for: authManager.currentUserId!, questionId: currentQuiz.id!)
                }else if quizLevel == .incorrectShakaiAnswer {
                    removeCorrectShakaiAnswer(for: authManager.currentUserId!, questionId: currentQuiz.id!)
                }else if quizLevel == .incorrectRikaAnswer {
                removeCorrectRikaAnswer(for: authManager.currentUserId!, questionId: currentQuiz.id!)
                }else if quizLevel == .incorrectKokugoAnswer {
                    removeCorrectKokugoAnswer(for: authManager.currentUserId!, questionId: currentQuiz.id!)
                }else if quizLevel == .incorrectESAnswer {
                    removeCorrectAnswer(for: authManager.currentUserId!, questionId: currentQuiz.id!)
                }else if quizLevel == .incorrectITStrategyAnswer {
                    removeCorrectAnswer(for: authManager.currentUserId!, questionId: currentQuiz.id!)
                }else if quizLevel == .incorrectAnswer, let userId = authManager.currentUserId, let questionId = currentQuiz.id {
                    // 苦手克服(間隔反復)の復習セッション中に正解した場合
                    ReviewScheduleService.recordCorrectReview(userId: userId, questionId: questionId)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    moveToNextQuiz()
                }
            } else {
                resetCombo()
                let incorrectAnswer = IncorrectAnswer(
                    userId: authManager.currentUserId!,
                    quiz: currentQuiz
                )
                // incorrectAnswer以外のクイズなら不正解の問題をincorrectAnswerテーブルに保存する
                if quizLevel != .incorrectAnswer && quizLevel != .incorrectSansuAnswer && quizLevel != .incorrectShakaiAnswer && quizLevel != .incorrectRikaAnswer && quizLevel != .incorrectKokugoAnswer && quizLevel != .incorrectITStrategyAnswer {
                    switch quizLevel {
                    case .itBasic,.itStrategy,.itTechnology,.itManagement:
                        saveIncorrectITAnswer(incorrectAnswer)
                        break
                    case .infoBasic,.infoStrategy,.infoTechnology,.infoManagement:
                        saveIncorrectInfoAnswer(incorrectAnswer)
                        break

                    case .appliedBasic,.appliedStrategy,.appliedTechnology,.appliedManagement:
                        saveIncorrectAppliedAnswer(incorrectAnswer)
                        break
                    case .sansu1,.sansu2,.sansu3,.sansu4,.sansu5,.sansu6:
                        saveIncorrectSansuAnswer(incorrectAnswer)
                        break
                    case .shakai1,.shakai2,.shakai3,.shakai4,.shakai5,.shakai6:
                        saveIncorrectShakaiAnswer(incorrectAnswer)
                        break

                    case .rika1,.rika2,.rika3,.rika4,.rika5,.rika6:
                        saveIncorrectRikaAnswer(incorrectAnswer)
                        break

                    case .kokugo1,.kokugo2,.kokugo3,.kokugo4,.kokugo5,.kokugo6:
                        saveIncorrectKokugoAnswer(incorrectAnswer)
                        break
                    case
                            .computerSystem,.softHard,.netwarkTusin,.ESsecurity:
                        saveIncorrectESAnswer(incorrectAnswer)
                        break
                    case .kikaku,.sekkei,.kaihatu,.unyouhoshu:
                        saveIncorrectITStrategyAnswer(incorrectAnswer)
                        break
                    default:
                        saveIncorrectAnswer(incorrectAnswer)
                        break
                    }
                    // 苦手克服(間隔反復)の復習キューにも並行して登録する
                    if let userId = authManager.currentUserId {
                        ReviewScheduleService.saveIncorrectAnswer(
                            userId: userId,
                            quizQuestion: currentQuiz.question,
                            choices: currentQuiz.choices,
                            correctAnswerIndex: currentQuiz.correctAnswerIndex,
                            explanation: currentQuiz.explanation,
                            sourceQuizLevel: quizLevel.description
                        )
                    }
                } else if quizLevel == .incorrectAnswer, let userId = authManager.currentUserId, let questionId = currentQuiz.id {
                    // 苦手克服(間隔反復)の復習セッション中に不正解だった場合、次回を1日後にリセットする
                    ReviewScheduleService.recordIncorrectReview(userId: userId, questionId: questionId)
                }
                answerCount += 1
                audioManager.playUnCorrectSound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    audioManager.playMonsterAttackSound()
                    playerHP -= monsterAttack
                    self.showAttackImage = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    moveToNextQuiz()
                }
            }
            let result = QuizResult(
                question: currentQuiz.question,
                userAnswer: userAnswer,
                correctAnswer: currentQuiz.correctAnswerText,
                explanation: currentQuiz.explanation,
                isCorrect: isAnswerCorrect
            )
            quizResults.append(result)
            self.showAttackImage = false
            hasAnswered = true
        }
    }

    private func comboAdjustedDamage() -> Int {
        if isDeveloperMode {
            return max(monsterHP, 1)
        }
        let multiplier = MonsterComboSystem.multiplier(for: comboCount + 1)
        return max(Int((Double(userAttack) * multiplier).rounded()), userAttack)
    }

    private func registerSuccessfulCombo() {
        comboCount += 1
        triggerComboPulse()
    }

    private func applyTimeoutComboPenalty() {
        guard comboCount > 0 else { return }
        comboCount = MonsterComboSystem.reducedComboCountAfterTimeout(from: comboCount)
        comboPulse = false
    }

    private func resetCombo() {
        guard comboCount > 0 else { return }
        comboCount = 0
        comboPulse = false
    }

    private func triggerComboPulse() {
        comboPulse = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.28) {
            comboPulse = false
        }
    }

    func saveIncorrectAnswer(_ answer: IncorrectAnswer) {
    let ref = Database.database().reference().child("IncorrectAnswers").child(answer.userId).childByAutoId()
    ref.setValue(answer.databasePayload)
    }

    func saveIncorrectITAnswer(_ answer: IncorrectAnswer) {
        // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectITAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectInfoAnswer(_ answer: IncorrectAnswer) {
        // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectInfoAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectAppliedAnswer(_ answer: IncorrectAnswer) {
        // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectAppliedAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectESAnswer(_ answer: IncorrectAnswer) {
    // ユーザーIDを親ノードとして設定
    let ref = Database.database().reference().child("IncorrectESAnswers").child(answer.userId).childByAutoId()
    ref.setValue(answer.databasePayload)
    }

    func saveIncorrectITStrategyAnswer(_ answer: IncorrectAnswer) {
    // ユーザーIDを親ノードとして設定
    let ref = Database.database().reference().child("IncorrectITStrategyAnswers").child(answer.userId).childByAutoId()
    ref.setValue(answer.databasePayload)
    }

    func saveIncorrectSansuAnswer(_ answer: IncorrectAnswer) {
        let ref = Database.database().reference().child("IncorrectSansuAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectShakaiAnswer(_ answer: IncorrectAnswer) {
        let ref = Database.database().reference().child("IncorrectShakaiAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectRikaAnswer(_ answer: IncorrectAnswer) {
        let ref = Database.database().reference().child("IncorrectRikaAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }
    
    func saveIncorrectKokugoAnswer(_ answer: IncorrectAnswer) {
        let ref = Database.database().reference().child("IncorrectKokugoAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }
    
    func removeCorrectAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    func removeCorrectITAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectITAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    func removeCorrectInfoAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectInfoAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    func removeCorrectAppliedAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectAppliedAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    func removeCorrectESAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectESAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    func removeCorrectITStrategyAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectITStrategyAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    
    func removeCorrectSansuAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectSansuAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    
    func removeCorrectShakaiAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectShakaiAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    
    func removeCorrectRikaAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectRikaAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    
    func removeCorrectKokugoAnswer(for userId: String, questionId: String) {
        let ref = Database.database().reference().child("IncorrectKokugoAnswers").child(userId).child(questionId)
        ref.removeValue { error, _ in
            if let error = error {
                print("Error removing correct answer: \(error.localizedDescription)")
            } else {
                print("Correct answer removed successfully.")
            }
        }
    }
    
    @ViewBuilder
    var body: some View {
        if quizzes.isEmpty {
            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 52))
                    .foregroundColor(.green)
                Text("出題できる問題がありません")
                    .font(.headline)
                Button("戻る") { isPresenting = false }
            }
            .padding()
        } else {
            quizContent
        }
    }

    private var quizContent: some View {
        NavigationView{
            ZStack{
                Image("\(monsterBackground)")
                     .resizable()
                     .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack{
                        Button(action: {
                        generateHapticFeedback()
                            showHomeModal.toggle()
                            audioManager.playSound()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 52, height: 52)
                                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                                
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundColor(Color("fontGray"))
                            }
                        }
                        .padding(.leading)
                        .foregroundColor(.gray)
                        Spacer()
                        Spacer()
                        TimerView(remainingSeconds: $remainingSeconds)
                            .background(GeometryReader { geometry in
                                Color.clear.preference(key: ViewPositionKey3.self, value: [geometry.frame(in: .global)])
                            })

                        if isDeveloperMode {
                            Button(action: {
                                generateHapticFeedback()
                                advanceQuizIndex()
                                selectedAnswerIndex = nil
                                hasAnswered = false
                                showExplanationModal = false
                                startTimer()
                            }) {
                                Text("Next")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                            }
                            .padding(.leading, 8)
                        }
                    }
                    .padding(.trailing)
                    //                    .padding(.top,40)
                    topContentSpacer
                    // 正解の場合の赤い円
                    if let selected = selectedAnswerIndex, selected == currentQuiz.correctAnswerIndex {
                    }
                    VStack{
                        QuestionCardView(
                            question: currentQuiz.question,
                            selectedAnswerIndex: selectedAnswerIndex,
                            correctAnswerIndex: currentQuiz.correctAnswerIndex,
                            compactMode: isCompactAnswerQuiz
                        )
                        .background(GeometryReader { geometry in
                            Color.clear.preference(key: ViewPositionKey.self, value: [geometry.frame(in: .global)])
                        })
                        .padding(.horizontal, 16)

                        ZStack{
                                        Image("\(quizLevel)Monster\(monsterType)")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .scaleEffect(comboPulse ? 1.04 : 1.0)
                                .animation(.spring(response: 0.32, dampingFraction: 0.55), value: comboPulse)
                                .frame(width: isCompactAnswerQuiz ? (isSmallDevice() ? 82 : 130) : (isSmallDevice() ? 100 : 160))
                            
                            
                            // 問題に正解して敵キャラにダメージ
                            if let selected = selectedAnswerIndex {
                                if selected == currentQuiz.correctAnswerIndex {
                                    if showAttackImage {
                                        Image("attack1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:isCompactAnswerQuiz ? (isSmallDevice() ? 58 : 92) : (isSmallDevice() ? 80 : 130))
                                    }
                                }
                            }
                                        // 敵キャラを倒した
                                        if showMonsterDownImage && monsterHP <= 0 {
                                            Image("倒す")
                                                .resizable()
                                                 .scaledToFit()
                                                 .frame(height:80)
                                        }

                            if comboCount >= 2 {
                                MonsterComboBadgeView(
                                    comboCount: comboCount,
                                    multiplier: MonsterComboSystem.multiplier(for: comboCount),
                                    isPulsing: comboPulse
                                )
                                .offset(
                                    x: isCompactAnswerQuiz ? (isSmallDevice() ? 72 : 98) : (isSmallDevice() ? 90 : 120),
                                    y: 40
                                )
                                .transition(.scale.combined(with: .opacity))
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: comboCount)
                            }
                        }
                        if quizLevel != .incorrectAnswer && quizLevel != .incorrectITAnswer && quizLevel != .incorrectInfoAnswer && quizLevel != .incorrectAppliedAnswer && quizLevel != .incorrectESAnswer && quizLevel != .incorrectITStrategyAnswer && quizLevel != .incorrectSansuAnswer && quizLevel != .incorrectKokugoAnswer && quizLevel != .incorrectShakaiAnswer && quizLevel != .incorrectRikaAnswer {
                            ZStack{
                                VStack{
                                    HStack{
                                        ProgressBar3(value: Double(monsterHP), maxValue: Double(monsterUnderHP), color: Color("hpMonsterColor"))
                                            .frame(height: 20)
                                        Text("\(monsterHP)/\(monsterUnderHP)")
                                            .padding(.horizontal,10)
                                            .padding(.vertical, 3)
                                            .foregroundColor(Color(.white))
                                            .background(Color.black.opacity(0.5))
                                            .cornerRadius(30)
                                    }
                                    .padding(.horizontal)
                                    // 味方キャラのHP
                                    HStack{
                                        Image(avator.isEmpty ? "defaultIcon" : (avator.first?["name"] as? String) ?? "")
                                            .resizable()
                                            .frame(width: 30,height:30)
                                        ProgressBar3(value: Double(playerHP), maxValue: Double(self.userMaxHp), color: Color("hpUserColor"))
                                            .frame(height: 20)
                                        Text("\(playerHP)/\(self.userMaxHp)")
                                            .padding(.horizontal,10)
                                            .padding(.vertical, 3)
                                            .foregroundColor(Color(.white))
                                            .background(Color.black.opacity(0.5))
                                            .cornerRadius(30)
                                    }
                                    .padding(.horizontal)
                                }
                                    // 味方がダメージをくらう
                                    if let selected = selectedAnswerIndex, selected != currentQuiz.correctAnswerIndex {
                                        if showAttackImage{
                                            Image("beginnerMonsterAttack\(monsterType)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height:90)
                                                .padding(.bottom, -30)
                                        }
                                    }
                                }
                            .background(GeometryReader { geometry in
                                Color.clear.preference(key: ViewPositionKey2.self, value: [geometry.frame(in: .global)])
                            })
                        } else {
                            HStack {
                                VStack{
                                    Text("問題数")
                                    Text("\(incorrectCount)")
                                        .font(.system(size: 24))
                                }
                                .foregroundColor(Color("fontGray"))
                                ProgressBar3(value: Double(incorrectCount), maxValue: Double(self.incorrectAnswerCount), color: Color("loading"))
                                    .frame(height: 20)
                            }
                            .padding()
                        }
                    }
                    answerContentSpacer
                    answerInputSection
                    
                    .sheet(isPresented: $showModal) {
                        ExperienceModalView(showModal: $showModal, addedExperience: 10, addedMoney: 10, authManager: authManager)
                    }
                }.background(showIncorrectBackground ? Color(.red).opacity(0.1) : Color(.white).opacity(0))
                    .onPreferenceChange(ViewPositionKey.self) { positions in
                        self.buttonRect = positions.first ?? .zero
                    }
                    .onPreferenceChange(ViewPositionKey1.self) { positions in
                        self.buttonRect1 = positions.first ?? .zero
                    }
                    .onPreferenceChange(ViewPositionKey2.self) { positions in
                        self.buttonRect2 = positions.first ?? .zero
                    }
                    .onPreferenceChange(ViewPositionKey3.self) { positions in
                        self.buttonRect3 = positions.first ?? .zero
                    }
                if showExplanationModal {
                    ZStack {
                        Color.black.opacity(0.7)
                            .ignoresSafeArea()
                        if let latestResult = quizResults.last {
                            ModalExplanationView(
                                isPresented: $showExplanationModal,
                                selectedAnswerIndex: $selectedAnswerIndex,
                                showAlert: $showAlert,
                                audioManager: audioManager,
                                question: latestResult.question,
                                userAnswer: latestResult.userAnswer,
                                correctAnswer: latestResult.correctAnswer,
                                explanation: latestResult.explanation,
                                currentQuizIndex: $currentQuizIndex,
                                userFlag: $userFlag,
                                pauseTimer: pauseTimer,
                                startTimer: startTimer,
                                advanceToNextQuestion: advanceQuizIndex
                            )
                        } else {
                            ModalReturnView(
                                isPresented: $showExplanationModal,
                                pauseTimer: pauseTimer,
                                startTimer: startTimer
                            )
                        }
                    }
                }
                if showHomeModal {
                    ZStack {
                        Color.black.opacity(0.7)
                            .edgesIgnoringSafeArea(.all)
                        ModalView(isSoundOn: $isSoundOn, isPresented: $showHomeModal, isPresenting: $isPresenting, audioManager: audioManager, showHomeModal: $showHomeModal,tutorialNum: $tutorialNum,pauseTimer:pauseTimer,resumeTimer: resumeTimer, userFlag: $userFlag)
                    }
                }
                if tutorialNum == 3 && showTutorial == true {
                    QuizTutorialOverlayView(
                        spotlightRect: buttonRect,
                        cornerRadius: 20,
                        stepNumber: 1,
                        icon: "doc.text.fill",
                        title: "問題が表示されます",
                        description: "ここに問題文が出るので、まずは内容を読みましょう",
                        accentColors: [Color(hex: "667eea"), Color(hex: "764ba2")],
                        messagePlacement: .below,
                        onSkip: {
                            generateHapticFeedback()
                            tutorialNum = 0
                            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { _ in }
                        }
                    )
                }
                if tutorialNum == 4 && showTutorial == true{
                    QuizTutorialOverlayView(
                        spotlightRect: buttonRect1,
                        cornerRadius: currentQuiz.tutorialStepStyle.cornerRadius,
                        stepNumber: 2,
                        icon: currentQuiz.tutorialStepStyle.icon,
                        title: currentQuiz.tutorialStepStyle.title,
                        description: currentQuiz.tutorialStepStyle.description,
                        accentColors: currentQuiz.tutorialStepStyle.accentColors,
                        messagePlacement: currentQuiz.tutorialStepStyle.messagePlacement,
                        onSkip: {
                            generateHapticFeedback()
                            tutorialNum = 0
                            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { _ in }
                        }
                    )
                }
                if tutorialNum == 5 && showTutorial == true{
                    QuizTutorialOverlayView(
                        spotlightRect: buttonRect2,
                        cornerRadius: 16,
                        stepNumber: 3,
                        icon: "heart.fill",
                        title: "バトルのルール",
                        description: "正解で敵にダメージ、不正解で自分がダメージ\nHPが0になるとゲームオーバーです",
                        accentColors: [Color(hex: "fa709a"), Color(hex: "fee140")],
                        messagePlacement: .below,
                        onSkip: {
                            generateHapticFeedback()
                            tutorialNum = 0
                            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { _ in }
                        }
                    )
                }
                if tutorialNum == 6 && showTutorial == true{
                    QuizTutorialOverlayView(
                        spotlightRect: buttonRect3,
                        cornerRadius: 30,
                        stepNumber: 4,
                        icon: "timer",
                        title: "制限時間に注意",
                        description: "30秒経つと自分がダメージを受けます",
                        accentColors: [Color(hex: "f093fb"), Color(hex: "f5576c")],
                        messagePlacement: .below,
                        onSkip: {
                            generateHapticFeedback()
                            tutorialNum = 0
                            authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { _ in }
                        }
                    )
                }
                if showCountdown {
                    ZStack {
                        // 背景
                        Color.black.opacity(0.7)
                            .edgesIgnoringSafeArea(.all)
                        // カウントダウンの数字
                        Text("\(countdownValue)")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            .fontWeight(.bold)
            .onTapGesture {
                //                audioManager.playSound()
                if showCountdown == false {
                    if tutorialNum == 3 {
                        tutorialNum = 4
                        authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 4) { success in
                        }
                    } else if tutorialNum == 4 {
                        tutorialNum = 5
                        authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 5) { success in
                        }
                    } else if tutorialNum == 5 {
                        tutorialNum = 6
                        authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 6) { success in
                        }
                    } else if tutorialNum == 6 {
                        resumeTimer()
                        tutorialNum = 0
                        authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { success in
                        }
                    }
                }
            }
            .onAppear {
                startCountdown()
                self.monsterType = 1 // すぐに1に戻す
                authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                    self.userName = name ?? ""
                    self.avator = avatar ?? [[String: Any]]()
                    print("avator:\(avator)")
                    self.userMoney = money ?? 0
                    self.userHp = hp ?? 100
                    self.userAttack = attack ?? 20
                    self.tutorialNum = tutorialNum ?? 0
                    print("authManager.fetchUserInfo1    :\(self.tutorialNum)")
                    if let additionalAttack = self.avator.first?["attack"] as? Int {
                        self.userAttack = self.userAttack + additionalAttack
                    }
                    if let additionalHealth = self.avator.first?["health"] as? Int {
                        self.userMaxHp = self.userHp + additionalHealth
                    }
                    if let additionalHealth = self.avator.first?["health"] as? Int {
                        self.playerHP = self.userHp + additionalHealth
                    } else {
                        self.playerHP = self.userHp
                    }
                    if self.tutorialNum == 0 {
                        //                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        startTimer() // Viewが表示されたときにタイマーを開始
                        //                        }
                    }
                    if self.tutorialNum == 2 {
                        authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { success in
                            // データベースのアップデートが成功したかどうかをハンドリング
                        }
                    }
                }
                self.startTime = Date()
                authManager.fetchUserRewardFlag()
                if quizLevel == .incorrectITAnswer{
                    fetchNumberOfIncorrectSansuAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectITAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectInfoAnswer {
                    fetchNumberOfIncorrectShakaiAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectInfoAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectAppliedAnswer {
                    fetchNumberOfIncorrectRikaAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectAppliedAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectESAnswer {
                    fetchNumberOfIncorrectKokugoAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectAppliedAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectITStrategyAnswer {
                    fetchNumberOfIncorrectITStrategyAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectAppliedAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectSansuAnswer {
                    fetchNumberOfIncorrectSansuAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectSansuAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectKokugoAnswer {
                    fetchNumberOfIncorrectKokugoAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectKokugoAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectRikaAnswer {
                    fetchNumberOfIncorrectRikaAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectRikaAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectShakaiAnswer {
                    fetchNumberOfIncorrectShakaiAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectShakaiAnswer {
                        userAttack = 0
                    }
                }else if quizLevel == .incorrectAnswer {
                    fetchNumberOfIncorrectAnswers(userId: authManager.currentUserId!) { count in
                        self.incorrectAnswerCount = count
                        incorrectCount = count
                    }
                    if quizLevel == .incorrectAnswer {
                        userAttack = 0
                    }
                }
                
                if quizLevel == .incorrectAnswer {
                    userAttack = 0
                }
                authManager.fetchPreFlag()
                authManager.fetchUserFlag()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    userFlag = authManager.userFlag
                    userPreFlag = authManager.userPreFlag
                }
            }
            .onDisappear {
                // QuizViewが閉じるときの時刻を記録する
                // ただし、playerExperienceとplayerMoneyが5以外の時だけ
                // ここで条件を確認してください
                if playerExperience != 5 && playerMoney != 5 {
                    self.endTime = Date()
                    self.elapsedTime = self.endTime?.timeIntervalSince(self.startTime)
                    // QuizResultViewへの遷移フラグを設定
                    self.navigateToQuizResult = true
                    // ここで経過時間を表示または保存する
                    //                    print("経過時間: \(self.elapsedTime!) 秒")
                    //                    authManager.saveElapsedTime(category: quizLevel.description, elapsedTime: elapsedTime!) { success in
                    //                        if success {
                    //                            print("経過時間を保存しました。")
                    //                        } else {
                    //                            print("経過時間の保存に失敗しました。")
                    //                        }
                    //                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("通知"),
                    message: Text("設定画面で切り替える事ができます"),
                    dismissButton: .default(Text("OK"), action: {
                        //                        isPresented = false
                        startTimer()
                        selectedAnswerIndex = nil
                    })
                )
            }
            .onChange(of: userFlag) { flag in
                //                          print("onchange userFlag:\(userFlag)")
                //                userFlag = authManager.userFlag
            }
            .onChange(of: selectedAnswerIndex) { newValue in
                if let selected = newValue, selected != currentQuiz.correctAnswerIndex {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showIncorrectBackground = true
                    }
                } else {
                    self.showIncorrectBackground = false
                }
            }
            .onChange(of: showCompletionMessage) { newValue in
                // 味方のHPが０以下のとき
                if newValue && playerHP <= 0 {
                    DispatchQueue.global(qos: .background).async {
                        authManager.addExperience(points: 5, onSuccess: {
                            // 成功した時の処理をここに書きます
                        }, onFailure: { error in
                            // 失敗した時の処理をここに書きます。`error`は失敗の原因を示す情報が含まれている可能性があります。
                        })
                        authManager.addMoney(amount: 5)
                        
                        DispatchQueue.main.async {
                        }
                    }
                } else {
                    DispatchQueue.global(qos: .background).async {
                        authManager.addExperience(points: playerExperience * authManager.rewardFlag, onSuccess: {
                            //                            print("addExperience \(authManager.rewardFlag)")
                        }, onFailure: { error in
                            // 失敗した時の処理をここに書きます。`error`は失敗の原因を示す情報が含まれている可能性があります。
                        })
                        authManager.addMoney(amount: playerMoney * authManager.rewardFlag)
                        DispatchQueue.main.async {
                            // ここでUIの更新を行います。
                        }
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    showModal = false
                    navigateToQuizResultView = true
                }
            }
            .onChange(of: monsterType) { newMonsterType in
                switch quizLevel {
                case .beginner:
                    monsterBackground = "beginnerBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 10
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 15
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 20
                    default:
                        monsterHP = 30
                    }
                case .intermediate:
                    monsterBackground = "intermediateBackground"
                    playerExperience = 30
                    playerMoney = 20
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 15
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    default:
                        monsterHP = 50
                    }
                case .advanced:
                    monsterBackground = "advancedBackground"
                    playerExperience = 40
                    playerMoney = 30
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 2:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    case 3:
                        monsterHP = 200
                        monsterUnderHP = 200
                        monsterAttack = 30
                    default:
                        monsterHP = 80
                    }
                case .network:
                    monsterBackground = "networkBackground"
                    playerExperience = 40
                    playerMoney = 30
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 2:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    case 3:
                        monsterHP = 200
                        monsterUnderHP = 200
                        monsterAttack = 30
                    default:
                        monsterHP = 80
                    }
                case .security:
                    monsterBackground = "securityBackground"
                    playerExperience = 40
                    playerMoney = 30
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 15
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    default:
                        monsterHP = 50
                    }
                case .database:
                    monsterBackground = "databaseBackground"
                    playerExperience = 40
                    playerMoney = 30
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 15
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    default:
                        monsterHP = 50
                    }
                case .daily:
                    monsterBackground = "dailyBackground"
                    playerExperience = 60
                    playerMoney = 60
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 50
                        monsterUnderHP = 50
                        monsterAttack = 20
                    case 2:
                        monsterHP = 60
                        monsterUnderHP = 60
                        monsterAttack = 30
                    case 3:
                        monsterHP = 70
                        monsterUnderHP = 70
                        monsterAttack = 40
                    default:
                        monsterHP = 50
                    }
                case .god:
                    monsterBackground = "godBackground"
                    playerExperience = 200
                    playerMoney = 200
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 500
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 1000
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 1500
                    default:
                        monsterHP = 1000
                    }
                    
                case .timeBeginner:
                    monsterBackground = "timeBeginnerBackground"
                    playerExperience = 20
                    playerMoney = 20
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 20
                        monsterUnderHP = 20
                        monsterAttack = 20
                    case 2:
                        monsterHP = 30
                        monsterUnderHP = 30
                        monsterAttack = 30
                    case 3:
                        monsterHP = 40
                        monsterUnderHP = 40
                        monsterAttack = 40
                    default:
                        monsterHP = 1000
                    }
                case .timeIntermediate:
                    monsterBackground = "timeIntermediateBackground"
                    playerExperience = 30
                    playerMoney = 30
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 40
                        monsterUnderHP = 40
                        monsterAttack = 40
                    case 2:
                        monsterHP = 50
                        monsterUnderHP = 50
                        monsterAttack = 50
                    case 3:
                        monsterHP = 60
                        monsterUnderHP = 60
                        monsterAttack = 60
                    default:
                        monsterHP = 1000
                    }
                case .timeAdvanced:
                    monsterBackground = "timeAdvancedBackground"
                    playerExperience = 40
                    playerMoney = 40
                    if userHp <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 50
                        monsterUnderHP = 50
                        monsterAttack = 50
                    case 2:
                        monsterHP = 60
                        monsterUnderHP = 60
                        monsterAttack = 60
                    case 3:
                        monsterHP = 70
                        monsterUnderHP = 70
                        monsterAttack = 70
                    default:
                        monsterHP = 1000
                    }
                case .incorrectAnswer,.incorrectITAnswer,.incorrectInfoAnswer,.incorrectAppliedAnswer,.incorrectESAnswer,.incorrectITStrategyAnswer,.incorrectRikaAnswer,.incorrectSansuAnswer,.incorrectKokugoAnswer,.incorrectShakaiAnswer:
                    monsterBackground = "incorrectAnswerBackground"
                    playerExperience = 0
                    playerMoney = 0
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 10
                        monsterUnderHP = 10
                        monsterAttack = 0
                    case 2:
                        monsterHP = 10
                        monsterUnderHP = 10
                        monsterAttack = 0
                    case 3:
                        monsterHP = 10
                        monsterUnderHP = 10
                        monsterAttack = 0
                    default:
                        monsterHP = 10
                    }
                case .beginnerStory1:
                    monsterBackground = "beginnerBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .beginnerStory2:
                    monsterBackground = "beginnerBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .beginnerStory3:
                    monsterBackground = "beginnerBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .itStrategy:
                    monsterBackground = "itStrategyBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 15
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    default:
                        monsterHP = 30
                    }
                case .infoStrategy:
                    monsterBackground = "infoStrategyBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 15
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 20
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 25
                    default:
                        monsterHP = 30
                    }
                case .appliedStrategy:
                    monsterBackground = "appliedStrategyBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .itTechnology:
                    monsterBackground = "itTechnologyBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 25
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 30
                    default:
                        monsterHP = 30
                    }
                case .infoTechnology:
                    monsterBackground = "infoTechnologyBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 25
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 30
                    default:
                        monsterHP = 30
                    }
                case .appliedTechnology:
                    monsterBackground = "appliedTechnologyBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 25
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 30
                    default:
                        monsterHP = 30
                    }
                case .itManagement:
                    monsterBackground = "itManagementBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 25
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 35
                    default:
                        monsterHP = 30
                    }
                case .infoManagement:
                    monsterBackground = "infoManagementBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 25
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 35
                    default:
                        monsterHP = 30
                    }
                case .appliedManagement:
                    monsterBackground = "appliedManagementBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 25
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 35
                    default:
                        monsterHP = 30
                    }
                case .itBasic:
                    monsterBackground = "itBasicBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 10
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 15
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 20
                    default:
                        monsterHP = 30
                    }
                case .infoBasic:
                    monsterBackground = "infoBasicBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 10
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 15
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 20
                    default:
                        monsterHP = 30
                    }
                case .appliedBasic:
                    monsterBackground = "appliedBasicBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 10
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 15
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 20
                    default:
                        monsterHP = 30
                    }
                case .mugen:
                    monsterBackground = "appliedBasicBackground"
                    playerExperience = 20
                    playerMoney = 10
                    // print(playerExperience)
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .computerSystem:
                    monsterBackground = "computerSystemBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 25
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 30
                    default:
                        monsterHP = 30
                    }
                case .softHard:
                    monsterBackground = "softHardBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 25
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 30
                    default:
                        monsterHP = 30
                    }
                case .netwarkTusin:
                    monsterBackground = "netwarkTusinBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 25
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 35
                    default:
                        monsterHP = 30
                    }
                case .ESsecurity:
                    monsterBackground = "ESsecurityBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 30
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 35
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .kikaku:
                    monsterBackground = "kikakuBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 20
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack = 25
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 30
                    default:
                        monsterHP = 30
                    }
                case .sekkei:
                    monsterBackground = "sekkeiBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 25
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack =  30
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 35
                    default:
                        monsterHP = 30
                    }
                case .kaihatu:
                    monsterBackground = "kaihatuBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 30
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack =  35
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 40
                    default:
                        monsterHP = 30
                    }
                case .unyouhoshu:
                    monsterBackground = "unyouHoshuBackground"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                    case 1:
                        monsterHP = 80
                        monsterUnderHP = 80
                        monsterAttack = 35
                    case 2:
                        monsterHP = 120
                        monsterUnderHP = 120
                        monsterAttack =  40
                    case 3:
                        monsterHP = 160
                        monsterUnderHP = 160
                        monsterAttack = 45
                    default:
                        monsterHP = 30
                    }
                case .sansu1:
                    monsterBackground = "sansu1Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 80
                            monsterUnderHP = 80
                            monsterAttack = 20
                        case 2:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 3:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        default:
                            monsterHP = 30
                    }

                case .sansu2:
                    monsterBackground = "sansu2Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 100
                            monsterUnderHP = 100
                            monsterAttack = 25
                        case 2:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 3:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        default:
                            monsterHP = 30
                    }

                case .sansu3:
                    monsterBackground = "sansu3Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 2:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .sansu4:
                    monsterBackground = "sansu4Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 2:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .sansu5:
                    monsterBackground = "sansu5Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .sansu6:
                    monsterBackground = "sansu6Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .shakai1:
                    monsterBackground = "shakai1Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 80
                            monsterUnderHP = 80
                            monsterAttack = 20
                        case 2:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 3:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        default:
                            monsterHP = 30
                    }

                case .shakai2:
                    monsterBackground = "shakai2Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 100
                            monsterUnderHP = 100
                            monsterAttack = 25
                        case 2:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 3:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        default:
                            monsterHP = 30
                    }

                case .shakai3:
                    monsterBackground = "shakai3Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 2:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .shakai4:
                    monsterBackground = "shakai4Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 2:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .shakai5:
                    monsterBackground = "shakai5Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .shakai6:
                    monsterBackground = "shakai6Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .rika1:
                    monsterBackground = "rika1Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 80
                            monsterUnderHP = 80
                            monsterAttack = 20
                        case 2:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 3:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        default:
                            monsterHP = 30
                    }

                case .rika2:
                    monsterBackground = "rika2Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 100
                            monsterUnderHP = 100
                            monsterAttack = 25
                        case 2:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 3:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        default:
                            monsterHP = 30
                    }

                case .rika3:
                    monsterBackground = "rika3Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 2:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .rika4:
                    monsterBackground = "rika4Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 2:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .rika5:
                    monsterBackground = "rika5Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .rika6:
                    monsterBackground = "rika6Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .kokugo1:
                    monsterBackground = "kokugo1Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 80
                            monsterUnderHP = 80
                            monsterAttack = 20
                        case 2:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 3:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        default:
                            monsterHP = 30
                    }

                case .kokugo2:
                    monsterBackground = "kokugo2Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 100
                            monsterUnderHP = 100
                            monsterAttack = 25
                        case 2:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 3:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        default:
                            monsterHP = 30
                    }

                case .kokugo3:
                    monsterBackground = "kokugo3Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 120
                            monsterUnderHP = 120
                            monsterAttack = 30
                        case 2:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .kokugo4:
                    monsterBackground = "kokugo4Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 140
                            monsterUnderHP = 140
                            monsterAttack = 35
                        case 2:
                            monsterHP = 180
                            monsterUnderHP = 180
                            monsterAttack = 45
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .kokugo5:
                    monsterBackground = "kokugo5Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 160
                            monsterUnderHP = 160
                            monsterAttack = 40
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                case .kokugo6:
                    monsterBackground = "kokugo6Background"
                    playerExperience = 20
                    playerMoney = 10
                    if playerHP <= 0 {
                        playerExperience = 5
                        playerMoney = 5
                    }
                    switch newMonsterType {
                        case 1:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 2:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        case 3:
                            monsterHP = 200
                            monsterUnderHP = 200
                            monsterAttack = 50
                        default:
                            monsterHP = 30
                    }

                // 必要に応じて他のカテゴリがあれば追加してください

                default:
                    // デフォルトの処理が必要な場合はここに記述
                    break
            }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

struct QuestionCardView: View {
    let question: String
    let selectedAnswerIndex: Int?
    let correctAnswerIndex: Int
    var compactMode: Bool = false
    @State private var appearAnimation = false
    
    var body: some View {
        ZStack {
            // カード背景
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 8)
            
            // 問題テキスト
            VStack(spacing: 0) {
                Text(question)
                    .font(.system(size: compactMode ? (isSmallDevice() ? 13 : 15) : (isSmallDevice() ? 15 : 17), weight: .semibold))
                    .foregroundColor(Color("fontGray"))
                    .lineSpacing(4)
                    .padding(.horizontal, compactMode ? 16 : 20)
                    .padding(.vertical, compactMode ? 12 : 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(minHeight: compactMode ? 72 : nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.75)
            }
            
            // 正解/不正解マーク
            if let selected = selectedAnswerIndex {
                if selected == correctAnswerIndex {
                    Circle()
                        .stroke(Color.red, lineWidth: 8)
                        .frame(width: 80, height: 80)
                        .opacity(0.8)
                        .transition(.scale.combined(with: .opacity))
                } else {
                    Image(systemName: "xmark")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.blue)
                        .opacity(0.8)
                        .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .scaleEffect(appearAnimation ? 1.0 : 0.95)
        .opacity(appearAnimation ? 1.0 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                appearAnimation = true
            }
        }
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu1ListView(isPresenting: .constant(false))
//        QuizIncorrectAnswerListView(isPresenting: .constant(false))
//        TopView()
    }
}
