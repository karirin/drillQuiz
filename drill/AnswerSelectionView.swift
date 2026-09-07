//
//  AnswerSelectionView.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/29.
//

import SwiftUI
import Foundation
import StoreKit
import UIKit

private let calculatorAnswerPattern = #"^\s*([+-]?(?:\d{1,3}(?:,\d{3})+|\d+)(?:\.\d+)?)\s*[^0-9+\-./]*\s*$"#

extension QuizQuestion {
    var isKanjiReadingQuestion: Bool {
        question.contains("漢字") && question.contains("読み")
    }

    var usesCalculatorKeypadForFillInBlank: Bool {
        guard format == .fillInBlank, numericInputSymbols.isEmpty else {
            return false
        }

        switch textInputKeyboardType {
        case .numberPad, .decimalPad:
            return true
        default:
            return false
        }
    }

    var answerPresentationMode: QuizAnswerPresentationMode {
        switch format {
        case .multipleChoice:
            if supportsCalculatorInput {
                return .calculator
            }
            if isKanjiReadingQuestion {
                return .textInput
            }
            return .multipleChoice
        case .fillInBlank:
            return usesCalculatorKeypadForFillInBlank ? .calculator : .textInput
        case .extractText, .dataReading:
            return .textInput
        case .reorder, .chronological, .ranking:
            return .reorder
        case .matching, .related, .classification:
            return .matching
        case .mapSelection:
            return .mapSelection
        }
    }

    var correctAnswerText: String {
        switch format {
        case .multipleChoice:
            guard choices.indices.contains(correctAnswerIndex) else {
                return ""
            }
            return choices[correctAnswerIndex]
        case .fillInBlank, .extractText, .dataReading:
            return acceptableAnswers.first ?? ""
        case .reorder, .chronological, .ranking:
            return orderedChoices.joined(separator: " -> ")
        case .matching, .related, .classification:
            return matchingPairs
                .map { "\($0.prompt)=\($0.match)" }
                .joined(separator: " / ")
        case .mapSelection:
            guard mapRegions.indices.contains(correctAnswerIndex) else {
                return ""
            }
            return mapRegions[correctAnswerIndex].label
        }
    }

    var usesTextInput: Bool {
        answerPresentationMode == .textInput
    }

    var usesReorderInput: Bool {
        answerPresentationMode == .reorder
    }

    var usesMatchingInput: Bool {
        answerPresentationMode == .matching
    }

    var usesMapSelectionInput: Bool {
        answerPresentationMode == .mapSelection
    }

    var usesCompactAnswerLayout: Bool {
        answerPresentationMode != .multipleChoice
    }

    var textInputPlaceholder: String {
        if format == .multipleChoice && isKanjiReadingQuestion {
            return "よみがなを入力"
        }
        if usesNumericKeyboard {
            return "数字を入力"
        }
        return inputPlaceholder
    }

    var usesNumericKeyboard: Bool {
        textInputKeyboardType != .default
    }

    var textInputKeyboardType: UIKeyboardType {
        guard format == .fillInBlank || format == .dataReading else {
            return .default
        }

        let answer = correctAnswerText.trimmingCharacters(in: .whitespacesAndNewlines)
        if answer.range(of: #"^[+-]?[0-9０-９]+$"#, options: .regularExpression) != nil {
            return .numberPad
        }
        if answer.range(of: #"^[+-]?[0-9０-９]+[.．][0-9０-９]+$"#, options: .regularExpression) != nil {
            return .decimalPad
        }
        if answer.range(of: #"^[0-9０-９]+と[0-9０-９]+[/／][0-9０-９]+$"#, options: .regularExpression) != nil {
            return .numberPad
        }
        if answer.range(of: #"^[0-9０-９]+[/／:：][0-9０-９]+$"#, options: .regularExpression) != nil {
            return .numberPad
        }
        if answer.range(of: #"^[0-9０-９,，.．/／:：+\- ]+$"#, options: .regularExpression) != nil {
            return .numbersAndPunctuation
        }
        return .default
    }

    var numericInputSymbols: [String] {
        guard format == .fillInBlank || format == .dataReading else { return [] }

        let answer = correctAnswerText
        var symbols: [String] = []
        if answer.contains("と") {
            symbols.append("と")
        }
        if answer.contains("/") || answer.contains("／") {
            symbols.append("/")
        }
        if answer.contains(":") || answer.contains("：") {
            symbols.append(":")
        }
        return symbols
    }

    var acceptedTextAnswers: [String] {
        switch format {
        case .multipleChoice:
            guard isKanjiReadingQuestion else {
                return []
            }
            return correctAnswerText.isEmpty ? [] : [correctAnswerText]
        case .fillInBlank, .extractText, .dataReading:
            return acceptableAnswers
        case .reorder, .matching, .chronological, .classification, .ranking, .related, .mapSelection:
            return []
        }
    }

    var tutorialInstruction: String {
        switch answerPresentationMode {
        case .multipleChoice:
            return "選択肢の中から正解と思うものをタップしてください。"
        case .calculator:
            return "数字を入力して答えてください。"
        case .textInput:
            if isKanjiReadingQuestion {
                return "漢字の読みを入力してください。"
            }
            if format == .fillInBlank {
                return usesNumericKeyboard
                    ? "空らんに入る数字を入力して答えてください。"
                    : "空らんに入る言葉を入力して答えてください。"
            }
            if format == .dataReading {
                return usesNumericKeyboard
                    ? "資料を読んで数字を入力してください。"
                    : "資料を読んで答えを入力してください。"
            }
            return "本文から見つけた言葉をそのまま入力してください。"
        case .reorder:
            switch format {
            case .chronological:
                return "できごとを古い順に並べてください。"
            case .ranking:
                return "条件に合わせて順位どおりに並べてください。"
            default:
                return "ことばを順番にタップして文を作ってください。"
            }
        case .matching:
            switch format {
            case .classification:
                return "ことばを正しいグループに分類してください。"
            case .related:
                return "関連するものどうしを結びつけてください。"
            default:
                return "左右が合うように組み合わせを選んでください。"
            }
        case .mapSelection:
            return "地図を見て、あてはまる場所をタップしてください。"
        }
    }

    var tutorialStepStyle: QuizTutorialStepStyle {
        switch answerPresentationMode {
        case .multipleChoice:
            return QuizTutorialStepStyle(
                icon: "hand.tap.fill",
                title: "選択肢をタップ",
                description: "正解と思うものを選んでください",
                accentColors: [Color(hex: "11998e"), Color(hex: "38ef7d")],
                cornerRadius: 20,
                messagePlacement: .above
            )
        case .calculator:
            return QuizTutorialStepStyle(
                icon: "plus.forwardslash.minus",
                title: "数字を入力",
                description: "キーパッドで答えを入力してください",
                accentColors: [Color(hex: "36d1dc"), Color(hex: "5b86e5")],
                cornerRadius: 20,
                messagePlacement: .above
            )
        case .textInput:
            let title: String
            let description: String

            if isKanjiReadingQuestion {
                title = "読みを入力"
                description = "キーボードで漢字の読みを入力してください"
            } else if format == .fillInBlank {
                title = usesNumericKeyboard ? "数字を入力" : "答えを入力"
                description = usesNumericKeyboard
                    ? "空らんに入る数字を入力してください"
                    : "空らんに入る言葉を入力してください"
            } else if format == .dataReading {
                title = usesNumericKeyboard ? "資料から数字を入力" : "資料を見て入力"
                description = usesNumericKeyboard
                    ? "資料を読み取って数字を入力してください"
                    : "資料を読み取って答えを入力してください"
            } else {
                title = "本文から入力"
                description = "見つけた言葉をそのまま入力してください"
            }

            return QuizTutorialStepStyle(
                icon: "keyboard.fill",
                title: title,
                description: description,
                accentColors: [Color(hex: "36d1dc"), Color(hex: "5b86e5")],
                cornerRadius: 20,
                messagePlacement: .above
            )
        case .reorder:
            switch format {
            case .chronological:
                return QuizTutorialStepStyle(
                    icon: "clock.arrow.circlepath",
                    title: "年代順に並べる",
                    description: "古い順になるようにタップしてください",
                    accentColors: [Color(hex: "f6d365"), Color(hex: "fda085")],
                    cornerRadius: 20,
                    messagePlacement: .above
                )
            case .ranking:
                return QuizTutorialStepStyle(
                    icon: "list.number",
                    title: "順位をつける",
                    description: "条件に合う順番でタップしてください",
                    accentColors: [Color(hex: "f6d365"), Color(hex: "fda085")],
                    cornerRadius: 20,
                    messagePlacement: .above
                )
            default:
                return QuizTutorialStepStyle(
                    icon: "text.line.first.and.arrowtriangle.forward",
                    title: "順番に並べる",
                    description: "語句を順番にタップして答えてください",
                    accentColors: [Color(hex: "f6d365"), Color(hex: "fda085")],
                    cornerRadius: 20,
                    messagePlacement: .above
                )
            }
        case .matching:
            switch format {
            case .classification:
                return QuizTutorialStepStyle(
                    icon: "square.grid.2x2.fill",
                    title: "分類を選ぶ",
                    description: "各項目を正しい分類に分けてください",
                    accentColors: [Color(hex: "f7971e"), Color(hex: "ffd200")],
                    cornerRadius: 22,
                    messagePlacement: .above
                )
            case .related:
                return QuizTutorialStepStyle(
                    icon: "link.circle.fill",
                    title: "関連するものを選ぶ",
                    description: "つながる組み合わせを選んでください",
                    accentColors: [Color(hex: "56ab2f"), Color(hex: "a8e063")],
                    cornerRadius: 22,
                    messagePlacement: .above
                )
            default:
                return QuizTutorialStepStyle(
                    icon: "rectangle.3.group.bubble.left.fill",
                    title: "組み合わせを選ぶ",
                    description: "左右が合うように選んでください",
                    accentColors: [Color(hex: "56ab2f"), Color(hex: "a8e063")],
                    cornerRadius: 22,
                    messagePlacement: .above
                )
            }
        case .mapSelection:
            return QuizTutorialStepStyle(
                icon: "map.fill",
                title: "地図をタップ",
                description: "あてはまる場所を選んでください",
                accentColors: [Color(hex: "36d1dc"), Color(hex: "5b86e5")],
                cornerRadius: 20,
                messagePlacement: .above
            )
        }
    }

    var reorderSelectedLabel: String {
        switch format {
        case .chronological:
            return "えらんだ年代順"
        case .ranking:
            return "えらんだ順位"
        default:
            return "えらんだ順番"
        }
    }

    var reorderChoicesLabel: String {
        switch format {
        case .chronological:
            return "ならべるできごと"
        case .ranking:
            return "順位をつける項目"
        default:
            return "ことばをタップ"
        }
    }

    var reorderInstructionText: String {
        switch format {
        case .chronological:
            return "古いものから順番にタップしてください"
        case .ranking:
            return "上から順番にタップしてください"
        default:
            return "下のことばを順番にタップしてください"
        }
    }

    var matchingChoicesLabel: String {
        switch format {
        case .classification:
            return "分類の名前"
        case .related:
            return "えらべることば"
        default:
            return "えらべる言葉"
        }
    }

    var matchingSelectionPlaceholder: String {
        switch format {
        case .classification:
            return "分類を選ぶ"
        case .related:
            return "対応を選ぶ"
        default:
            return "選ぶ"
        }
    }

    var questionCardCompactMode: Bool {
        switch answerPresentationMode {
        case .multipleChoice:
            return false
        case .calculator, .textInput, .reorder, .matching, .mapSelection:
            return true
        }
    }

    var monsterCompactMode: Bool {
        questionCardCompactMode
    }

    func matchesTextAnswer(_ input: String) -> Bool {
        let normalizedInput = input.quizNormalizedText
        guard !normalizedInput.isEmpty else {
            return false
        }

        if acceptedTextAnswers.contains(where: { $0.quizNormalizedText == normalizedInput }) {
            return true
        }

        guard let inputValue = input.quizComparableNumericAnswer else {
            return false
        }

        return acceptedTextAnswers.contains { answer in
            guard let answerValue = answer.quizComparableNumericAnswer else {
                return false
            }
            return answerValue == inputValue
        }
    }
}

enum QuizAnswerPresentationMode {
    case multipleChoice
    case calculator
    case textInput
    case reorder
    case matching
    case mapSelection
}

private extension String {
    var quizNormalizedText: String {
        let folded = folding(
            options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive],
            locale: Locale(identifier: "ja_JP")
        )
        let ignoredCharacters = CharacterSet.whitespacesAndNewlines.union(
            CharacterSet(charactersIn: "　「」『』\"'。、，．・！？!?,（）()【】")
        )

        return folded.unicodeScalars
            .filter { !ignoredCharacters.contains($0) }
            .map(String.init)
            .joined()
    }

    var quizComparableNumericAnswer: Decimal? {
        let folded = folding(
            options: [.widthInsensitive],
            locale: Locale(identifier: "ja_JP")
        )
        .replacingOccurrences(of: "，", with: ",")

        guard
            let regex = try? NSRegularExpression(pattern: calculatorAnswerPattern),
            let match = regex.firstMatch(in: folded, range: NSRange(folded.startIndex..., in: folded)),
            let numberRange = Range(match.range(at: 1), in: folded)
        else {
            return nil
        }

        let normalized = String(folded[numberRange]).replacingOccurrences(of: ",", with: "")
        return Decimal(string: normalized, locale: Locale(identifier: "en_US_POSIX"))
    }
}

extension QuizQuestion {
    var supportsCalculatorInput: Bool {
        if usesCalculatorKeypadForFillInBlank {
            return true
        }

        guard format == .multipleChoice else {
            return false
        }
        guard !question.contains("次の中で") else {
            return false
        }
        if question.contains("並べ替え") {
            return choices.allSatisfy { $0.calculatorDigitSequence != nil }
        }
        return choices.allSatisfy { $0.calculatorComparableValue != nil }
    }

    var allowsDecimalCalculatorInput: Bool {
        if usesCalculatorKeypadForFillInBlank {
            return textInputKeyboardType == .decimalPad
        }

        guard format == .multipleChoice else {
            return false
        }
        if question.contains("並べ替え") {
            return false
        }
        return choices.contains { ($0.calculatorRawNumericText ?? "").contains(".") }
    }

    func matchesCalculatorAnswer(_ input: String) -> Bool {
        if format == .fillInBlank {
            return matchesTextAnswer(input)
        }

        if question.contains("並べ替え") {
            guard
                let userSequence = input.calculatorDigitSequence,
                let correctSequence = correctAnswerText.calculatorDigitSequence
            else {
                return false
            }

            return userSequence == correctSequence
        }

        guard
            let userValue = input.calculatorComparableValue,
            let correctValue = correctAnswerText.calculatorComparableValue
        else {
            return false
        }

        return userValue == correctValue
    }

    func matchesReorderedChoices(_ selections: [String]) -> Bool {
        selections == orderedChoices
    }

    func matchesMatchingPairs(_ selections: [String: String]) -> Bool {
        matchingPairs.allSatisfy { pair in
            selections[pair.prompt] == pair.match
        }
    }

    func formattedReorderedAnswer(_ selections: [String]) -> String {
        selections.joined(separator: " -> ")
    }

    func formattedMatchingAnswer(_ selections: [String: String]) -> String {
        matchingPairs
            .map { pair in
                "\(pair.prompt)=\(selections[pair.prompt] ?? "未選択")"
            }
            .joined(separator: " / ")
    }

    func matchesMapSelection(_ regionID: String) -> Bool {
        guard mapRegions.indices.contains(correctAnswerIndex) else {
            return false
        }
        return mapRegions[correctAnswerIndex].id == regionID
    }

    func formattedMapSelectionAnswer(_ regionID: String) -> String {
        mapRegions.first(where: { $0.id == regionID })?.label ?? "未選択"
    }
}

private extension String {
    var calculatorDigitSequence: String? {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return nil
        }

        let separators = CharacterSet(charactersIn: ",、 　\n\t")
        let invalidScalars = trimmed.unicodeScalars.filter {
            !CharacterSet.decimalDigits.contains($0) && !separators.contains($0)
        }

        guard invalidScalars.isEmpty else {
            return nil
        }

        let normalized = trimmed.unicodeScalars
            .filter { CharacterSet.decimalDigits.contains($0) }
            .map(String.init)
            .joined()

        return normalized.isEmpty ? nil : normalized
    }

    var calculatorRawNumericText: String? {
        guard !contains("/") else {
            return nil
        }

        guard
            let regex = try? NSRegularExpression(pattern: calculatorAnswerPattern),
            let match = regex.firstMatch(in: self, range: NSRange(startIndex..., in: self)),
            let numberRange = Range(match.range(at: 1), in: self)
        else {
            return nil
        }

        return String(self[numberRange])
    }

    var calculatorComparableValue: Decimal? {
        guard let rawNumber = calculatorRawNumericText else {
            return nil
        }

        let normalized = rawNumber.replacingOccurrences(of: ",", with: "")
        return Decimal(string: normalized, locale: Locale(identifier: "en_US_POSIX"))
    }
}

// 現在のデバイスがiPadかどうかを判定する関数
func isIPad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}

struct AnswerSelectionView: View {
    let choices: [String]
    var action: (Int) -> Void
    var correctAnswerIndex: Int?
    @State private var tappedIndex: Int? = nil
    @State private var appearAnimation: [Bool] = []

    init(choices: [String], correctAnswerIndex: Int?, action: @escaping (Int) -> Void) {
        self.choices = choices
        self.correctAnswerIndex = correctAnswerIndex
        self.action = action
        self._appearAnimation = State(initialValue: Array(repeating: false, count: choices.count))
    }

    var body: some View {
        VStack(spacing: isIPad() ? 16 : 12) {
            ForEach(0..<choices.count, id: \.self) { index in
                AnswerButton(
                    text: choices[index],
                    index: index,
                    isCorrect: index == correctAnswerIndex,
                    isTapped: tappedIndex == index,
                    hasAnswered: correctAnswerIndex != nil,
                    isVisible: appearAnimation.indices.contains(index) ? appearAnimation[index] : false
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        tappedIndex = index
                    }
                    
                    if index == correctAnswerIndex {
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.success)
                    }
                    generateHapticFeedback()
                    self.action(index)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.spring()) {
                            tappedIndex = nil
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .onAppear {
            // スタガードアニメーション
            for index in 0..<choices.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.08) {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        if appearAnimation.indices.contains(index) {
                            appearAnimation[index] = true
                        }
                    }
                }
            }
        }
    }
}

struct CalculatorAnswerInputView: View {
    let questionKey: String
    let allowsDecimalInput: Bool
    let isAnswered: Bool
    let onSubmit: (String) -> Void

    @State private var input: String = ""

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)

    private var isCompactLayout: Bool {
        isSmallDevice()
    }

    private var displayText: String {
        input.isEmpty ? "0" : input
    }

    private var canSubmit: Bool {
        !isAnswered && !input.isEmpty && input != "." && !input.hasSuffix(".")
    }

    private var buttonRows: [[String]] {
        [
            ["7", "8", "9"],
            ["4", "5", "6"],
            ["1", "2", "3"],
            [".", "0", "←"]
        ]
    }

    var body: some View {
        VStack(spacing: isCompactLayout ? 6 : 10) {
            HStack(spacing: 12) {
                Text("数字で答える")
                    .font(.system(size: isCompactLayout ? 12 : 14, weight: .semibold))
                    .foregroundColor(Color("fontGray"))

                Spacer()

                Text(displayText)
                    .font(.system(size: isCompactLayout ? 24 : 30, weight: .bold, design: .rounded))
                    .foregroundColor(Color("fontGray"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.horizontal, isCompactLayout ? 14 : 16)
            .padding(.vertical, isCompactLayout ? 10 : 12)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: isCompactLayout ? 18 : 20, style: .continuous)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: isCompactLayout ? 18 : 20, style: .continuous)
                    .stroke(Color.gray.opacity(0.12), lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 3)

            LazyVGrid(columns: columns, spacing: isCompactLayout ? 6 : 8) {
                ForEach(buttonRows.flatMap { $0 }, id: \.self) { symbol in
                    calculatorButton(symbol)
                }
            }

            HStack(spacing: isCompactLayout ? 6 : 8) {
                Button(action: clearInput) {
                    Text("クリア")
                        .font(.system(size: isCompactLayout ? 13 : 15, weight: .semibold))
                        .foregroundColor(Color("fontGray"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(Color.white.opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered || input.isEmpty)

                Button(action: submitInput) {
                    Text("答える")
                        .font(.system(size: isCompactLayout ? 14 : 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(
                            LinearGradient(
                                colors: canSubmit
                                    ? [Color(red: 0.12, green: 0.72, blue: 0.38), Color(red: 0.08, green: 0.58, blue: 0.30)]
                                    : [Color.gray.opacity(0.45), Color.gray.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .buttonStyle(.plain)
                .disabled(!canSubmit)
            }
        }
        .padding(.horizontal, isCompactLayout ? 10 : 14)
        .padding(.vertical, isCompactLayout ? 2 : 6)
        .onAppear {
            input = ""
        }
        .onChange(of: questionKey) { _ in
            input = ""
        }
    }

    @ViewBuilder
    private func calculatorButton(_ symbol: String) -> some View {
        let isDotButton = symbol == "."
        let isBackspaceButton = symbol == "←"
        let isEnabled = !isAnswered && (!isDotButton || allowsDecimalInput)

        Button(action: {
            handleTap(symbol)
        }) {
            Text(symbol)
                .font(.system(size: isCompactLayout ? (isBackspaceButton ? 18 : 20) : (isBackspaceButton ? 22 : 24), weight: .bold, design: .rounded))
                .foregroundColor(isEnabled ? Color("fontGray") : Color.gray.opacity(0.45))
                .frame(maxWidth: .infinity)
                .frame(height: isCompactLayout ? 42 : 50)
                .background(
                    RoundedRectangle(cornerRadius: isCompactLayout ? 14 : 16, style: .continuous)
                        .fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: isCompactLayout ? 14 : 16, style: .continuous)
                        .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }

    private func handleTap(_ symbol: String) {
        guard !isAnswered else {
            return
        }

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

        switch symbol {
        case ".":
            guard allowsDecimalInput, !input.contains(".") else {
                return
            }
            input = input.isEmpty ? "0." : input + "."
        case "←":
            guard !input.isEmpty else {
                return
            }
            input.removeLast()
        default:
            if input == "0" {
                input = symbol
            } else {
                input.append(symbol)
            }
        }
    }

    private func clearInput() {
        guard !isAnswered else {
            return
        }
        input = ""
    }

    private func submitInput() {
        guard canSubmit else {
            return
        }
        onSubmit(input)
    }
}

struct TextAnswerInputView: View {
    let questionKey: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let inputSymbols: [String]
    let isAnswered: Bool
    let onSubmit: (String) -> Void

    @State private var input: String = ""
    @FocusState private var isInputFocused: Bool
    private let focusRetryDelays: [Double] = [0.0, 0.12, 0.28]

    private var isCompactLayout: Bool {
        isSmallDevice()
    }

    private var trimmedInput: String {
        input.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var canSubmit: Bool {
        !isAnswered && !trimmedInput.isEmpty
    }

    var body: some View {
        VStack(spacing: isCompactLayout ? 8 : 10) {
            VStack(alignment: .leading, spacing: 8) {
                Text(keyboardType == .default ? "文字で答える" : "数字で答える")
                    .font(.system(size: isCompactLayout ? 13 : 15, weight: .semibold))
                    .foregroundColor(Color.black.opacity(0.72))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.92))
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color.white.opacity(0.65), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)

                TextField(placeholder, text: $input)
                    .font(.system(size: isCompactLayout ? 16 : 18, weight: .medium))
                    .foregroundColor(Color("fontGray"))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
                    .focused($isInputFocused)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .submitLabel(.done)
                    .onSubmit(submitInput)
                    .disabled(isAnswered)

                if !inputSymbols.isEmpty {
                    HStack(spacing: 8) {
                        Text("入力記号")
                            .font(.system(size: isCompactLayout ? 12 : 13, weight: .semibold))
                            .foregroundColor(Color.black.opacity(0.62))

                        ForEach(inputSymbols, id: \.self) { symbol in
                            Button {
                                appendInputSymbol(symbol)
                            } label: {
                                Text(symbol)
                                    .font(.system(size: isCompactLayout ? 16 : 18, weight: .bold))
                                    .foregroundColor(Color("fontGray"))
                                    .frame(minWidth: 42)
                                    .padding(.vertical, 7)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .stroke(Color.gray.opacity(0.18), lineWidth: 1)
                                    )
                            }
                            .buttonStyle(.plain)
                            .disabled(isAnswered || input.contains(symbol))
                        }

                        Spacer()
                    }
                }
            }

            HStack(spacing: isCompactLayout ? 6 : 8) {
                Button(action: clearInput) {
                    Text("クリア")
                        .font(.system(size: isCompactLayout ? 13 : 15, weight: .semibold))
                        .foregroundColor(Color("fontGray"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(Color.white.opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered || input.isEmpty)

                Button(action: submitInput) {
                    Text("答える")
                        .font(.system(size: isCompactLayout ? 14 : 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(
                            LinearGradient(
                                colors: canSubmit
                                    ? [Color(red: 0.12, green: 0.72, blue: 0.38), Color(red: 0.08, green: 0.58, blue: 0.30)]
                                    : [Color.gray.opacity(0.45), Color.gray.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .buttonStyle(.plain)
                .disabled(!canSubmit)
            }
        }
        .padding(.horizontal, isCompactLayout ? 10 : 14)
        .padding(.vertical, isCompactLayout ? 2 : 6)
        .onAppear {
            input = ""
            scheduleFocus()
        }
        .onChange(of: questionKey) { _ in
            input = ""
            scheduleFocus()
        }
        .onChange(of: isAnswered) { newValue in
            if newValue {
                isInputFocused = false
            } else {
                scheduleFocus()
            }
        }
        .onChange(of: isInputFocused) { newValue in
            if !newValue {
                scheduleFocus()
            }
        }
    }

    private func appendInputSymbol(_ symbol: String) {
        guard !isAnswered, !input.contains(symbol) else { return }
        input.append(symbol)
        isInputFocused = true
    }

    private func clearInput() {
        guard !isAnswered else {
            return
        }
        input = ""
        scheduleFocus()
    }

    private func submitInput() {
        guard canSubmit else {
            return
        }
        onSubmit(trimmedInput)
    }

    private func scheduleFocus() {
        guard !isAnswered else {
            return
        }
        for delay in focusRetryDelays {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                guard !isAnswered else {
                    return
                }
                isInputFocused = true
            }
        }
    }
}

private struct ReferenceMaterialCard: View {
    let title: String
    let rows: [QuizReferenceRow]
    var compact: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ReadableOverlayLabel(
                text: "資料",
                compact: compact
            )

            VStack(alignment: .leading, spacing: 0) {
                if !title.isEmpty {
                    Text(title)
                        .font(.system(size: compact ? 14 : 16, weight: .bold))
                        .foregroundColor(Color("fontGray"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 14)
                        .padding(.top, 14)
                        .padding(.bottom, rows.isEmpty ? 14 : 10)
                }

                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    HStack(alignment: .top, spacing: 10) {
                        Text(row.label)
                            .font(.system(size: compact ? 13 : 14, weight: .semibold))
                            .foregroundColor(Color("fontGray"))

                        Spacer(minLength: 12)

                        Text(row.value)
                            .font(.system(size: compact ? 13 : 14, weight: .medium))
                            .foregroundColor(Color("fontGray"))
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)

                    if index < rows.count - 1 {
                        Divider()
                            .padding(.horizontal, 14)
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.white.opacity(0.96))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.gray.opacity(0.14), lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 3)
        }
    }
}

private struct OrderedChoiceItem: Identifiable, Hashable {
    let id: Int
    let text: String
}

private struct ReadableOverlayLabel: View {
    let text: String
    var compact: Bool = false

    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(Color(red: 1.0, green: 0.82, blue: 0.48))
                .frame(width: compact ? 8 : 9, height: compact ? 8 : 9)

            Text(text)
                .font(.system(size: compact ? 13 : 15, weight: .semibold))
                .foregroundColor(Color.white.opacity(0.96))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.black.opacity(0.34))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.white.opacity(0.14), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.12), radius: 6, x: 0, y: 2)
    }
}

private struct InstructionCallout: View {
    let text: String
    var compact: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "hand.tap.fill")
                .font(.system(size: compact ? 14 : 15, weight: .bold))
                .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.52))

            Text(text)
                .font(.system(size: compact ? 13 : 14, weight: .semibold))
                .foregroundColor(Color.white.opacity(0.95))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.black.opacity(0.32))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.white.opacity(0.14), lineWidth: 1)
        )
    }
}

private struct ReferenceChoiceChip: View {
    let text: String
    var compact: Bool = false

    var body: some View {
        Text(text)
            .font(.system(size: compact ? 13 : 14, weight: .semibold))
            .foregroundColor(Color.white.opacity(0.96))
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.black.opacity(0.26))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color.white.opacity(0.14), lineWidth: 1)
            )
    }
}

private struct ReadablePromptBadge: View {
    let text: String
    var compact: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(Color(red: 1.0, green: 0.82, blue: 0.48))
                .frame(width: 6)

            Text(text)
                .font(.system(size: compact ? 14 : 16, weight: .semibold))
                .foregroundColor(Color.white.opacity(0.96))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.black.opacity(0.32))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.white.opacity(0.14), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.12), radius: 6, x: 0, y: 2)
    }
}

struct ReorderAnswerInputView: View {
    let questionKey: String
    let choices: [String]
    let selectedLabel: String
    let choicesLabel: String
    let instructionText: String
    let isAnswered: Bool
    let onSubmit: ([String]) -> Void

    @State private var availableChoices: [OrderedChoiceItem] = []
    @State private var selectedChoices: [OrderedChoiceItem] = []

    private let columns = [GridItem(.adaptive(minimum: 88), spacing: 8)]

    private var isCompactLayout: Bool {
        isSmallDevice()
    }

    private var canSubmit: Bool {
        !isAnswered && !selectedChoices.isEmpty && availableChoices.isEmpty
    }

    var body: some View {
        VStack(spacing: isCompactLayout ? 8 : 10) {
            VStack(alignment: .leading, spacing: 8) {
                ReadableOverlayLabel(
                    text: selectedLabel,
                    compact: isCompactLayout
                )

                if selectedChoices.isEmpty {
                    InstructionCallout(
                        text: instructionText,
                        compact: isCompactLayout
                    )
                } else {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                        ForEach(selectedChoices) { item in
                            ChoiceChipButton(
                                text: item.text,
                                tintColor: Color(red: 0.10, green: 0.62, blue: 0.95),
                                isDisabled: isAnswered
                            ) {
                                removeSelectedChoice(item)
                            }
                        }
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                ReadableOverlayLabel(
                    text: choicesLabel,
                    compact: isCompactLayout
                )

                LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                    ForEach(availableChoices) { item in
                        ChoiceChipButton(
                            text: item.text,
                            tintColor: Color(red: 0.97, green: 0.98, blue: 1.0),
                            foregroundColor: Color("fontGray"),
                            borderColor: Color.gray.opacity(0.16),
                            showsBorder: true,
                            isDisabled: isAnswered
                        ) {
                            selectChoice(item)
                        }
                    }
                }
            }

            HStack(spacing: isCompactLayout ? 6 : 8) {
                Button(action: resetChoices) {
                    Text("やり直す")
                        .font(.system(size: isCompactLayout ? 13 : 15, weight: .semibold))
                        .foregroundColor(Color("fontGray"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(Color.white.opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered || selectedChoices.isEmpty)

                Button(action: submitAnswer) {
                    Text("答える")
                        .font(.system(size: isCompactLayout ? 14 : 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(
                            LinearGradient(
                                colors: canSubmit
                                    ? [Color(red: 0.12, green: 0.72, blue: 0.38), Color(red: 0.08, green: 0.58, blue: 0.30)]
                                    : [Color.gray.opacity(0.45), Color.gray.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .buttonStyle(.plain)
                .disabled(!canSubmit)
            }
        }
        .padding(.horizontal, isCompactLayout ? 10 : 14)
        .padding(.vertical, isCompactLayout ? 2 : 6)
        .onAppear(perform: resetChoices)
        .onChange(of: questionKey) { _ in
            resetChoices()
        }
    }

    private func resetChoices() {
        let baseChoices = choices.enumerated().map { OrderedChoiceItem(id: $0.offset, text: $0.element) }
        availableChoices = baseChoices
        selectedChoices = []
    }

    private func selectChoice(_ item: OrderedChoiceItem) {
        guard !isAnswered else {
            return
        }
        generateHapticFeedback()
        availableChoices.removeAll { $0.id == item.id }
        selectedChoices.append(item)
    }

    private func removeSelectedChoice(_ item: OrderedChoiceItem) {
        guard !isAnswered else {
            return
        }
        generateHapticFeedback()
        selectedChoices.removeAll { $0.id == item.id }
        availableChoices.append(item)
        availableChoices.sort { $0.id < $1.id }
    }

    private func submitAnswer() {
        guard canSubmit else {
            return
        }
        onSubmit(selectedChoices.map(\.text))
    }
}

struct MatchingAnswerInputView: View {
    let questionKey: String
    let pairs: [QuizMatchingPair]
    let choices: [String]
    let choicesLabel: String
    let selectionPlaceholder: String
    let allowsDuplicateSelections: Bool
    let isAnswered: Bool
    let onSubmit: ([String: String]) -> Void

    @State private var selections: [String: String] = [:]

    private var isCompactLayout: Bool {
        isSmallDevice()
    }

    private var canSubmit: Bool {
        !isAnswered && pairs.allSatisfy { selections[$0.prompt] != nil }
    }

    var body: some View {
        VStack(spacing: isCompactLayout ? 8 : 10) {
            VStack(alignment: .leading, spacing: 8) {
                ReadableOverlayLabel(
                    text: choicesLabel,
                    compact: isCompactLayout
                )

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 88), spacing: 8)], alignment: .leading, spacing: 8) {
                    ForEach(choices, id: \.self) { choice in
                        ReferenceChoiceChip(
                            text: choice,
                            compact: isCompactLayout
                        )
                    }
                }
            }

            VStack(spacing: 10) {
                ForEach(pairs, id: \.prompt) { pair in
                    HStack(spacing: 10) {
                        ReadablePromptBadge(
                            text: pair.prompt,
                            compact: isCompactLayout
                        )

                        Menu {
                            if selections[pair.prompt] != nil {
                                Button("クリア") {
                                    clearSelection(for: pair.prompt)
                                }
                            }

                            ForEach(choices, id: \.self) { choice in
                                Button(choice) {
                                    select(choice, for: pair.prompt)
                                }
                                .disabled(!allowsDuplicateSelections && isChoiceTaken(choice, excluding: pair.prompt))
                            }
                        } label: {
                            HStack {
                                Text(selections[pair.prompt] ?? selectionPlaceholder)
                                    .font(.system(size: isCompactLayout ? 13 : 15, weight: .medium))
                                    .foregroundColor(selections[pair.prompt] == nil ? Color.gray : Color("fontGray"))

                                Spacer()

                                Image(systemName: "chevron.down")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.04), radius: 5, x: 0, y: 2)
                        }
                        .disabled(isAnswered)
                    }
                }
            }

            HStack(spacing: isCompactLayout ? 6 : 8) {
                Button(action: resetSelections) {
                    Text("やり直す")
                        .font(.system(size: isCompactLayout ? 13 : 15, weight: .semibold))
                        .foregroundColor(Color("fontGray"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(Color.white.opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered || selections.isEmpty)

                Button(action: submitAnswer) {
                    Text("答える")
                        .font(.system(size: isCompactLayout ? 14 : 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(
                            LinearGradient(
                                colors: canSubmit
                                    ? [Color(red: 0.12, green: 0.72, blue: 0.38), Color(red: 0.08, green: 0.58, blue: 0.30)]
                                    : [Color.gray.opacity(0.45), Color.gray.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .buttonStyle(.plain)
                .disabled(!canSubmit)
            }
        }
        .padding(.horizontal, isCompactLayout ? 10 : 14)
        .padding(.vertical, isCompactLayout ? 2 : 6)
        .onAppear(perform: resetSelections)
        .onChange(of: questionKey) { _ in
            resetSelections()
        }
    }

    private func select(_ choice: String, for prompt: String) {
        guard !isAnswered else {
            return
        }
        generateHapticFeedback()
        selections[prompt] = choice
    }

    private func clearSelection(for prompt: String) {
        guard !isAnswered else {
            return
        }
        selections.removeValue(forKey: prompt)
    }

    private func isChoiceTaken(_ choice: String, excluding prompt: String) -> Bool {
        selections.contains(where: { entry in
            entry.key != prompt && entry.value == choice
        })
    }

    private func resetSelections() {
        selections = [:]
    }

    private func submitAnswer() {
        guard canSubmit else {
            return
        }
        onSubmit(selections)
    }
}

struct MapSelectionAnswerInputView: View {
    let questionKey: String
    let question: QuizQuestion
    let isAnswered: Bool
    let onSubmit: (String) -> Void

    @State private var selectedRegionID: String? = nil

    private var isCompactLayout: Bool {
        isSmallDevice()
    }

    private var maxRow: Int {
        question.mapRegions.map(\.row).max() ?? 0
    }

    private var maxColumn: Int {
        question.mapRegions.map(\.column).max() ?? 0
    }

    private var canSubmit: Bool {
        !isAnswered && selectedRegionID != nil
    }

    var body: some View {
        VStack(spacing: isCompactLayout ? 8 : 10) {
            VStack(alignment: .leading, spacing: 8) {
                ReadableOverlayLabel(
                    text: "地図で答える",
                    compact: isCompactLayout
                )

                if !question.referenceTitle.isEmpty {
                    InstructionCallout(
                        text: question.referenceTitle,
                        compact: isCompactLayout
                    )
                }

                VStack(spacing: 8) {
                    ForEach(0...maxRow, id: \.self) { row in
                        HStack(spacing: 8) {
                            ForEach(0...maxColumn, id: \.self) { column in
                                if let region = regionAt(row: row, column: column) {
                                    mapRegionButton(region)
                                } else {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.clear)
                                        .frame(maxWidth: .infinity, minHeight: isCompactLayout ? 54 : 62)
                                }
                            }
                        }
                    }
                }
            }

            if let selectedRegionLabel {
                ReadablePromptBadge(
                    text: "えらんだ場所: \(selectedRegionLabel)",
                    compact: isCompactLayout
                )
            }

            HStack(spacing: isCompactLayout ? 6 : 8) {
                Button(action: resetSelection) {
                    Text("やり直す")
                        .font(.system(size: isCompactLayout ? 13 : 15, weight: .semibold))
                        .foregroundColor(Color("fontGray"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(Color.white.opacity(0.95))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Color.gray.opacity(0.14), lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered || selectedRegionID == nil)

                Button(action: submitSelection) {
                    Text("答える")
                        .font(.system(size: isCompactLayout ? 14 : 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isCompactLayout ? 8 : 10)
                        .background(
                            LinearGradient(
                                colors: canSubmit
                                    ? [Color(red: 0.12, green: 0.72, blue: 0.38), Color(red: 0.08, green: 0.58, blue: 0.30)]
                                    : [Color.gray.opacity(0.45), Color.gray.opacity(0.55)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .buttonStyle(.plain)
                .disabled(!canSubmit)
            }
        }
        .padding(.horizontal, isCompactLayout ? 10 : 14)
        .padding(.vertical, isCompactLayout ? 2 : 6)
        .onAppear(perform: resetSelection)
        .onChange(of: questionKey) { _ in
            resetSelection()
        }
    }

    private var selectedRegionLabel: String? {
        guard let selectedRegionID else {
            return nil
        }
        return question.mapRegions.first(where: { $0.id == selectedRegionID })?.label
    }

    @ViewBuilder
    private func mapRegionButton(_ region: QuizMapRegion) -> some View {
        let isSelected = selectedRegionID == region.id

        Button(action: {
            guard !isAnswered else {
                return
            }
            generateHapticFeedback()
            selectedRegionID = region.id
        }) {
            Text(region.label)
                .font(.system(size: isCompactLayout ? 13 : 14, weight: .semibold))
                .foregroundColor(isSelected ? .white : Color("fontGray"))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: isCompactLayout ? 54 : 62)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            isSelected
                                ? Color(red: 0.10, green: 0.62, blue: 0.95)
                                : Color.white.opacity(0.96)
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(
                            isSelected
                                ? Color.white.opacity(0.25)
                                : Color.gray.opacity(0.14),
                            lineWidth: 1
                        )
                )
                .shadow(color: Color.black.opacity(isSelected ? 0.12 : 0.05), radius: 6, x: 0, y: 3)
        }
        .buttonStyle(.plain)
        .disabled(isAnswered)
    }

    private func regionAt(row: Int, column: Int) -> QuizMapRegion? {
        question.mapRegions.first { $0.row == row && $0.column == column }
    }

    private func resetSelection() {
        selectedRegionID = nil
    }

    private func submitSelection() {
        guard let selectedRegionID, canSubmit else {
            return
        }
        onSubmit(selectedRegionID)
    }
}

private struct ChoiceChipButton: View {
    let text: String
    var tintColor: Color
    var foregroundColor: Color = .white
    var borderColor: Color = Color.clear
    var showsBorder: Bool = false
    var isDisabled: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: isSmallDevice() ? 13 : 14, weight: .semibold))
                .foregroundColor(foregroundColor)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(tintColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(borderColor, lineWidth: showsBorder ? 1 : 0)
                )
                .shadow(color: Color.black.opacity(isDisabled ? 0.0 : 0.10), radius: 7, x: 0, y: 3)
        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.6 : 1.0)
    }
}

struct QuestionAnswerInputView: View {
    let questionKey: String
    let question: QuizQuestion
    let isAnswered: Bool
    let correctAnswerIndex: Int?
    let onChoiceSelected: (Int) -> Void
    let onTextSubmitted: (String) -> Void
    let onReorderSubmitted: ([String]) -> Void
    let onMatchingSubmitted: ([String: String]) -> Void
    let onMapSelectionSubmitted: (String) -> Void

    var body: some View {
        Group {
            switch question.answerPresentationMode {
            case .multipleChoice:
                AnswerSelectionView(
                    choices: question.choices,
                    correctAnswerIndex: correctAnswerIndex,
                    action: onChoiceSelected
                )
            case .calculator:
                CalculatorAnswerInputView(
                    questionKey: questionKey,
                    allowsDecimalInput: question.allowsDecimalCalculatorInput,
                    isAnswered: isAnswered,
                    onSubmit: onTextSubmitted
                )
            case .textInput:
                if question.format == .dataReading {
                    VStack(spacing: isSmallDevice() ? 8 : 10) {
                        ReferenceMaterialCard(
                            title: question.referenceTitle,
                            rows: question.referenceRows,
                            compact: isSmallDevice()
                        )

                        TextAnswerInputView(
                            questionKey: questionKey,
                            placeholder: question.textInputPlaceholder,
                            keyboardType: question.textInputKeyboardType,
                            inputSymbols: question.numericInputSymbols,
                            isAnswered: isAnswered,
                            onSubmit: onTextSubmitted
                        )
                    }
                    .id(questionKey)
                } else {
                    TextAnswerInputView(
                        questionKey: questionKey,
                        placeholder: question.textInputPlaceholder,
                        keyboardType: question.textInputKeyboardType,
                        inputSymbols: question.numericInputSymbols,
                        isAnswered: isAnswered,
                        onSubmit: onTextSubmitted
                    )
                    .id(questionKey)
                }
            case .reorder:
                ReorderAnswerInputView(
                    questionKey: questionKey,
                    choices: question.choices,
                    selectedLabel: question.reorderSelectedLabel,
                    choicesLabel: question.reorderChoicesLabel,
                    instructionText: question.reorderInstructionText,
                    isAnswered: isAnswered,
                    onSubmit: onReorderSubmitted
                )
            case .matching:
                MatchingAnswerInputView(
                    questionKey: questionKey,
                    pairs: question.matchingPairs,
                    choices: question.choices,
                    choicesLabel: question.matchingChoicesLabel,
                    selectionPlaceholder: question.matchingSelectionPlaceholder,
                    allowsDuplicateSelections: question.format == .classification,
                    isAnswered: isAnswered,
                    onSubmit: onMatchingSubmitted
                )
            case .mapSelection:
                MapSelectionAnswerInputView(
                    questionKey: questionKey,
                    question: question,
                    isAnswered: isAnswered,
                    onSubmit: onMapSelectionSubmitted
                )
            }
        }
    }
}

struct AnswerButton: View {
    let text: String
    let index: Int
    let isCorrect: Bool
    let isTapped: Bool
    let hasAnswered: Bool
    let isVisible: Bool
    let action: () -> Void
    
    private var buttonBackground: some View {
        Group {
            if hasAnswered {
                if isCorrect {
                    // 正解の選択肢 - グリーングラデーション
                    LinearGradient(
                        colors: [
                            Color(red: 0.2, green: 0.8, blue: 0.4),
                            Color(red: 0.1, green: 0.7, blue: 0.3)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                } else {
                    // 不正解後の通常選択肢
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.95),
                            Color(red: 0.98, green: 0.98, blue: 1.0)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                }
            } else {
                // 未回答時
                LinearGradient(
                    colors: [
                        Color.white,
                        Color(red: 0.98, green: 0.98, blue: 1.0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
    }
    
    private var borderColor: Color {
        if hasAnswered && isCorrect {
            return Color(red: 0.1, green: 0.7, blue: 0.3)
        }
        return Color.gray.opacity(0.15)
    }
    
    private var textColor: Color {
        if hasAnswered && isCorrect {
            return .white
        }
        return Color("fontGray")
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                
                // 選択肢テキスト
                Text(text)
                    .font(.system(size: fontSize(for: text, isIPad: isIPad()), weight: .medium))
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                
                Spacer()
                
                // 正解アイコン
                if hasAnswered && isCorrect {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(buttonBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: hasAnswered && isCorrect ? 2 : 1)
            )
            .shadow(
                color: hasAnswered && isCorrect
                    ? Color.green.opacity(0.3)
                    : Color.black.opacity(0.06),
                radius: hasAnswered && isCorrect ? 12 : 8,
                x: 0,
                y: hasAnswered && isCorrect ? 6 : 4
            )
            .scaleEffect(isTapped ? 0.96 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .opacity(isVisible ? 1 : 0)
        .offset(y: isVisible ? 0 : 20)
    }
}

// テキストサイズを決定する関数
func fontSize(for text: String, isIPad: Bool) -> CGFloat {
    let baseFontSize: CGFloat = isIPad ? 22 : 16

    let englishAlphabet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let textCharacterSet = CharacterSet(charactersIn: text)

    if englishAlphabet.isSuperset(of: textCharacterSet) {
        return baseFontSize
    } else {
        if text.count >= 25 {
            return baseFontSize - 4
        } else if text.count >= 21 {
            return baseFontSize - 3
        } else if text.count >= 17 {
            return baseFontSize - 2
        } else {
            return baseFontSize
        }
    }
}

struct AnswerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(red: 0.95, green: 0.95, blue: 0.98)
                .ignoresSafeArea()
            
            VStack {
                AnswerSelectionView(
                    choices: ["選択肢A: これは最初の選択肢です", "選択肢B: 二番目の選択肢", "選択肢C: 三番目", "選択肢D: 最後の選択肢"],
                    correctAnswerIndex: 1
                ) { index in
                    print("選択肢 \(index + 1) がタップされました")
                }
            }
        }
    }
}
