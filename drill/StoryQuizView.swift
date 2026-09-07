//
//  QuizView.swift main
//  it
//
//  Created by hashimo ryoya on 2023/09/16.
//

import SwiftUI
import AVFoundation
import Firebase

//struct IncorrectAnswer {
//var userId: String
//var quizQuestion: String
//var choices: [String]
//var correctAnswerIndex: Int
//var explanation: String
//}
//
//struct ViewPositionKey1: PreferenceKey {
//static var defaultValue: [CGRect] = []
//static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
//    value.append(contentsOf: nextValue())
//}
//}
//
//struct ViewPositionKey2: PreferenceKey {
//static var defaultValue: [CGRect] = []
//static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
//    value.append(contentsOf: nextValue())
//}
//}
//
//struct ViewPositionKey3: PreferenceKey {
//static var defaultValue: [CGRect] = []
//static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
//    value.append(contentsOf: nextValue())
//}
//}
//
//struct TimerArc: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: false)
//        return path
//    }
//}

struct Monster: Codable {
    let name: String
    let playerExperience: Int
    let playerMoney: Int
    let monsterHP: Int
    let monsterUnderHP: Int
    let monsterAttack: Int
}

let storyMonstersById: [Int: Monster] = [
    1: Monster(name: "モンスター1", playerExperience: 30, playerMoney: 30, monsterHP: 160, monsterUnderHP: 160, monsterAttack: 30),
    2: Monster(name: "モンスター2", playerExperience: 20, playerMoney: 20, monsterHP: 100, monsterUnderHP: 100, monsterAttack: 10),
    3: Monster(name: "モンスター3", playerExperience: 15, playerMoney: 15, monsterHP: 120, monsterUnderHP: 120, monsterAttack: 15),
    4: Monster(name: "モンスター4", playerExperience: 25, playerMoney: 25, monsterHP: 110, monsterUnderHP: 110, monsterAttack: 12),
    5: Monster(name: "モンスター5", playerExperience: 22, playerMoney: 22, monsterHP: 115, monsterUnderHP: 115, monsterAttack: 14),
    6: Monster(name: "モンスター6", playerExperience: 28, playerMoney: 28, monsterHP: 125, monsterUnderHP: 125, monsterAttack: 18),
    7: Monster(name: "モンスター7", playerExperience: 35, playerMoney: 35, monsterHP: 150, monsterUnderHP: 150, monsterAttack: 25),
    8: Monster(name: "モンスター8", playerExperience: 18, playerMoney: 18, monsterHP: 95, monsterUnderHP: 95, monsterAttack: 9),
    9: Monster(name: "モンスター9", playerExperience: 40, playerMoney: 40, monsterHP: 160, monsterUnderHP: 160, monsterAttack: 28),
    10: Monster(name: "モンスター10", playerExperience: 45, playerMoney: 45, monsterHP: 170, monsterUnderHP: 170, monsterAttack: 30),
    11: Monster(name: "モンスター11", playerExperience: 50, playerMoney: 50, monsterHP: 180, monsterUnderHP: 180, monsterAttack: 32),
    12: Monster(name: "モンスター12", playerExperience: 55, playerMoney: 55, monsterHP: 190, monsterUnderHP: 190, monsterAttack: 35),
    13: Monster(name: "モンスター13", playerExperience: 60, playerMoney: 60, monsterHP: 200, monsterUnderHP: 200, monsterAttack: 38),
    14: Monster(name: "モンスター14", playerExperience: 65, playerMoney: 65, monsterHP: 210, monsterUnderHP: 210, monsterAttack: 40),
    15: Monster(name: "ボス15", playerExperience: 500, playerMoney: 1000, monsterHP: 2000, monsterUnderHP: 2000, monsterAttack: 200),
    16: Monster(name: "ボス16", playerExperience: 200, playerMoney: 300, monsterHP: 500, monsterUnderHP: 500, monsterAttack: 200),
    17: Monster(name: "モンスター17", playerExperience: 80, playerMoney: 80, monsterHP: 240, monsterUnderHP: 240, monsterAttack: 48),
    18: Monster(name: "モンスター18", playerExperience: 85, playerMoney: 85, monsterHP: 250, monsterUnderHP: 250, monsterAttack: 50),
    19: Monster(name: "モンスター19", playerExperience: 90, playerMoney: 90, monsterHP: 260, monsterUnderHP: 260, monsterAttack: 52),
    20: Monster(name: "モンスター20", playerExperience: 95, playerMoney: 95, monsterHP: 270, monsterUnderHP: 270, monsterAttack: 55),
    21: Monster(name: "モンスター21", playerExperience: 100, playerMoney: 100, monsterHP: 280, monsterUnderHP: 280, monsterAttack: 58),
    22: Monster(name: "モンスター22", playerExperience: 105, playerMoney: 105, monsterHP: 290, monsterUnderHP: 290, monsterAttack: 60),
    23: Monster(name: "モンスター23", playerExperience: 110, playerMoney: 110, monsterHP: 300, monsterUnderHP: 300, monsterAttack: 62),
    24: Monster(name: "モンスター24", playerExperience: 115, playerMoney: 115, monsterHP: 310, monsterUnderHP: 310, monsterAttack: 65),
    25: Monster(name: "モンスター25", playerExperience: 120, playerMoney: 120, monsterHP: 320, monsterUnderHP: 320, monsterAttack: 68),
    26: Monster(name: "モンスター26", playerExperience: 125, playerMoney: 125, monsterHP: 330, monsterUnderHP: 330, monsterAttack: 70),
    27: Monster(name: "モンスター27", playerExperience: 130, playerMoney: 130, monsterHP: 340, monsterUnderHP: 340, monsterAttack: 72),
    28: Monster(name: "モンスター28", playerExperience: 135, playerMoney: 135, monsterHP: 350, monsterUnderHP: 350, monsterAttack: 75),
    29: Monster(name: "モンスター29", playerExperience: 140, playerMoney: 140, monsterHP: 360, monsterUnderHP: 360, monsterAttack: 78),
    30: Monster(name: "モンスター30", playerExperience: 145, playerMoney: 145, monsterHP: 370, monsterUnderHP: 370, monsterAttack: 80),
    31: Monster(name: "モンスター31", playerExperience: 150, playerMoney: 150, monsterHP: 380, monsterUnderHP: 380, monsterAttack: 82),
    32: Monster(name: "モンスター32", playerExperience: 155, playerMoney: 155, monsterHP: 390, monsterUnderHP: 390, monsterAttack: 85),
    150: Monster(name: "ボス150", playerExperience: 1500, playerMoney: 3000, monsterHP: 6000, monsterUnderHP: 6000, monsterAttack: 750)
]

let monsters: [String: Monster] = Dictionary(
    uniqueKeysWithValues: storyMonstersById.map { ($0.value.name, $0.value) }
)

struct StoryQuizView: View {
    @ObservedObject var viewModel: PositionViewModel
    let quizzes: [QuizQuestion]
    let quizLevel: QuizLevel
    let monsterName: String
    let backgroundName: String
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
    @State private var answerCount: Int = 0
    @State private var incorrectCount: Int = 0
    @State private var incorrectAnswerCount: Int = 0
    @State private var correctAnswerCount: Int = 0
    @State private var countdownValue: Int = 3
    @State private var showCountdown: Bool = false
    @State private var playerHP: Int = 100
    @State private var playerMaxHP: Int = 100
    @State private var monsterHP: Int = 100
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
    @State private var victoryFlag = false
    @ObservedObject var interstitial: Interstitial
//        @EnvironmentObject var appState: AppState
    @ObservedObject var appState = AppState.shared
    @State private var rewardFlag: Int = 0
    @State private var comboCount: Int = 0
    @State private var comboPulse: Bool = false
    @Environment(\.presentationMode) var presentationMode
//    var user: User // ここでユーザー情報全体を受け取る
//    var userName2: String
//    var user: User

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
                        storyResultNavigationLink
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 2)
            } else {
                ScrollView{
                    VStack(spacing: 0){
                        answerInputContent

                        if showCompletionMessage {
                            storyResultNavigationLink
                        }
                    }
                }
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .padding(.bottom, 12)
            }
        }
    }

    private var storyResultNavigationLink: some View {
        NavigationLink(
            "",
            destination: StoryQuizResultView(
                results: quizResults,
                authManager: authManager,
                isPresenting: $isPresenting,
                navigateToQuizResultView: $navigateToQuizResultView,
                playerExperience: playerExperience,
                playerMoney: playerMoney,
                elapsedTime: 0,
                quizLevel: quizLevel,
                victoryFlag: $victoryFlag,
                isUserStoryFlag: .constant(true),
                viewModel: viewModel,
                interstitial: interstitial
            )
            .navigationBarBackButtonHidden(true),
            isActive: $navigateToQuizResultView
        )
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
        if isDeveloperMode {
            currentQuizIndex = (currentQuizIndex + 1) % quizzes.count
        } else if currentQuizIndex + 1 < quizzes.count {
            currentQuizIndex += 1
        } else {
            showCompletionMessage = true
            timer?.invalidate()
            navigateToQuizResultView = true
        }
    }

    // 次の問題へ移る処理
    func moveToNextQuiz() {
        if monsterHP <= 0 {
            showCompletionMessage = true
            timer?.invalidate()
            RateManager.shared.updateQuizData(userId: authManager.currentUserId!, quizType: quizLevel, newCorrectAnswers: correctAnswerCount, newTotalAnswers: answerCount)
            RateManager.shared.updateAnswerData(userId: authManager.currentUserId!, quizType: quizLevel,  newTotalAnswers: answerCount)
            navigateToQuizResultView = true //ここで結果画面への遷移フラグをtrueに
        } else if playerHP <= 0 {
            showCompletionMessage = true
            timer?.invalidate()
            playerExperience = 5
            playerMoney = 5
            navigateToQuizResultView = true  //ここで結果画面への遷移フラグをtrueに
            RateManager.shared.updateQuizData(userId: authManager.currentUserId!, quizType: quizLevel, newCorrectAnswers: correctAnswerCount, newTotalAnswers: answerCount)
            RateManager.shared.updateAnswerData(userId: authManager.currentUserId!, quizType: quizLevel, newTotalAnswers: answerCount)
        } else if self.remainingSeconds == 0 {
            currentQuizIndex += 1
           selectedAnswerIndex = nil
            startTimer()
            hasAnswered = false
        } else if currentQuizIndex + 1 < quizzes.count {
            if userFlag == 0 {
                showExplanationModal = true
            } else {
                currentQuizIndex += 1
               selectedAnswerIndex = nil
                startTimer()
            }
            hasAnswered = false
        } else {
            // すべての問題が終了した場合、結果画面へ遷移
            showCompletionMessage = true
            timer?.invalidate()
            navigateToQuizResultView = true  // ここで結果画面への遷移フラグをtrueに
        }
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
                            monsterType += 1
                        }
                    } else if playerHP <= 0 {
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
        if PositionViewModel.isDeveloperMode {
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
      // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectTangoAnswer(_ answer: IncorrectAnswer) {
    // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectTangoAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectJukugoAnswer(_ answer: IncorrectAnswer) {
    // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectJukugoAnswers").child(answer.userId).childByAutoId()
        ref.setValue(answer.databasePayload)
    }

    func saveIncorrectBunpouAnswer(_ answer: IncorrectAnswer) {
        // ユーザーIDを親ノードとして設定
        let ref = Database.database().reference().child("IncorrectBunpouAnswers").child(answer.userId).childByAutoId()
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
            Image("\(backgroundName)")
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
                                    Image("\(monsterName)")
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
                                        //                                    Image("\(quizLevel)MonsterAttack\(monsterType)")
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
	            if showSubFlag {
	                ZStack {
	                    Color.black.opacity(0.7)
	                        .edgesIgnoringSafeArea(.all)
	                    SubModalView(isSoundOn: $isSoundOn, isPresented: $showSubFlag, isPresenting: $isPresenting, audioManager: audioManager, showHomeModal: $showHomeModal,pauseTimer:pauseTimer,resumeTimer: resumeTimer, userFlag: $userFlag)
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
            if tutorialNum == 4 && showTutorial == true {
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
            if tutorialNum == 5 && showTutorial == true {
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
            if tutorialNum == 6 && showTutorial == true {
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
        .onChange(of: showCompletionMessage) { newValue in
            navigateToQuizResultView = true
        }
        .onAppear {
            // 結果画面のインタースティシャルを先読みしておく（表示直前ロードだと表示機会を落とす）
            if !appState.isSubscribed {
                interstitial.preloadIfNeeded()
            }
            if let monster = monsters[monsterName] ?? storyMonstersById[viewModel.monster] {
                playerExperience = monster.playerExperience
                playerMoney = monster.playerMoney
                monsterHP = monster.monsterHP
                monsterUnderHP = monster.monsterUnderHP
                monsterAttack = monster.monsterAttack
            } else {
                // 未定義のモンスターの場合のデフォルト値
                print("未知のモンスター: \(monsterName), id: \(viewModel.monster)")
                playerExperience = 0
                playerMoney = 0
                monsterHP = 30
                monsterUnderHP = 30
                monsterAttack = 0
            }
            self.monsterType = 1 // すぐに1に戻す
            authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                self.userName = name ?? ""
                self.avator = avatar ?? [[String: Any]]()
                self.userMoney = money ?? 0
                self.userHp = hp ?? 100
                self.userAttack = attack ?? 20
                self.tutorialNum = tutorialNum ?? 0
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
            if playerExperience != 5 && playerMoney != 5 {
                self.endTime = Date()
                self.elapsedTime = self.endTime?.timeIntervalSince(self.startTime)
                // QuizResultViewへの遷移フラグを設定
                self.navigateToQuizResult = true
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
//                victoryFlag = false
//                authManager.addRankMatchPoints(for: user.id, points: 10, onSuccess: {
//                    print("@@@@@@@@@@@@@@@@@@@@@@@1")
//                }, onFailure: { error in
//                })
//                authManager.subtractRankMatchPoints(for: authManager.currentUserId!, points: 10, onSuccess: {
//                    print("@@@@@@@@@@@@@@@@@@@@@@@2")
//                    }, onFailure: { error in
//                    })
//                DispatchQueue.global(qos: .background).async {
//                    authManager.addExperience(points: 5, onSuccess: {
//                        // 成功した時の処理をここに書きます
//                    }, onFailure: { error in
//                        // 失敗した時の処理をここに書きます。`error`は失敗の原因を示す情報が含まれている可能性があります。
//                    })
//                    authManager.addMoney(amount: 5)
//
//                    DispatchQueue.main.async {
//                    }
//                }
            } else {
                victoryFlag = true
                DispatchQueue.global(qos: .background).async {
//                    print("userId:\(user.id)")
//                    authManager.addRankMatchPoints(for: authManager.currentUserId!, points: 10, onSuccess: {
//                        print("@@@@@@@@@@@@@@@@@@@@@@@3")
//                    }, onFailure: { error in
//
//                    })
//                authManager.subtractRankMatchPoints(for: user.id, points: 10, onSuccess: {
//                    print("@@@@@@@@@@@@@@@@@@@@@@@4")
//                    }, onFailure: { error in
//                    })
//                    authManager.addExperience(points: playerExperience * authManager.rewardFlag, onSuccess: {
////                            print("addExperience \(authManager.rewardFlag)")
//                    }, onFailure: { error in
//                        // 失敗した時の処理をここに書きます。`error`は失敗の原因を示す情報が含まれている可能性があります。
//                    })
//                    authManager.addMoney(amount: playerMoney * authManager.rewardFlag)
//                    DispatchQueue.main.async {
//                        // ここでUIの更新を行います。
//                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                showModal = false
                navigateToQuizResultView = true
            }
        }
    }
//            .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)

}
}

//struct RankMatchQuizView_Previews: PreviewProvider {
//static var previews: some View {
////    QuizIntermediateList(isPresenting: .constant(false))
////        QuizIncorrectAnswerListView(isPresenting: .constant(false))
//    RankMatchListView(viewModel: RankingViewModel())
//}
//}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedUser = User(id: "1", userName: "SampleUser", level: 1, experience: 100, avatars: [], userMoney: 1000, userHp: 100, userAttack: 20, userFlag: 0,adminFlag: 1, rankMatchPoint: 100, rank: 1)

        StorySansuListView(isPresenting: .constant(false), monsterName: "モンスター2", backgroundName: "ダンジョン背景1", viewModel: PositionViewModel.shared)
    }
}
