//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Sansu3ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "15 ÷ 3 はいくつですか？",
            choices: [
                "3",
                "4",
                "5",
                "6"
            ],
            correctAnswerIndex: 2,
            explanation: "15 ÷ 3 は 5 です。"
        ),

        QuizQuestion(
            question: "1.5 + 2.3 はいくつですか？",
            choices: [
                "3.8",
                "4.0",
                "3.5",
                "4.1"
            ],
            correctAnswerIndex: 0,
            explanation: "1.5 + 2.3 は 3.8 です。"
        ),

        QuizQuestion(
            question: "100センチメートルは何メートルですか？",
            choices: [
                "1メートル",
                "10メートル",
                "0.1メートル",
                "100メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "100センチメートルは 1メートルです。"
        ),
        QuizQuestion(
            question: "24 ÷ 6 はいくつですか？",
            choices: [
                "4",
                "5",
                "6",
                "7"
            ],
            correctAnswerIndex: 0,
            explanation: "24 ÷ 6 は 4 です。"
        ),

        QuizQuestion(
            question: "2.7 + 3.6 はいくつですか？",
            choices: [
                "6.3",
                "5.3",
                "7.3",
                "6.5"
            ],
            correctAnswerIndex: 0,
            explanation: "2.7 + 3.6 は 6.3 です。"
        ),

        QuizQuestion(
            question: "500センチメートルは何メートルですか？",
            choices: [
                "5メートル",
                "50メートル",
                "0.5メートル",
                "100メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "500センチメートルは 5メートルです。"
        ),

        QuizQuestion(
            question: "18 ÷ 2 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "12"
            ],
            correctAnswerIndex: 1,
            explanation: "18 ÷ 2 は 9 です。"
        ),

        QuizQuestion(
            question: "0.8 + 1.4 はいくつですか？",
            choices: [
                "2.0",
                "2.2",
                "1.8",
                "2.4"
            ],
            correctAnswerIndex: 1,
            explanation: "0.8 + 1.4 は 2.2 です。"
        ),

        QuizQuestion(
            question: "250センチメートルは何メートルですか？",
            choices: [
                "2.5メートル",
                "25メートル",
                "0.25メートル",
                "2メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "250センチメートルは 2.5メートルです。"
        ),
        QuizQuestion(
            question: "45 ÷ 5 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "45 ÷ 5 は 9 です。"
        ),

        QuizQuestion(
            question: "3.2 + 4.5 はいくつですか？",
            choices: [
                "7.7",
                "7.6",
                "7.8",
                "7.5"
            ],
            correctAnswerIndex: 0,
            explanation: "3.2 + 4.5 は 7.7 です。"
        ),

        QuizQuestion(
            question: "150センチメートルは何メートルですか？",
            choices: [
                "1.5メートル",
                "15メートル",
                "0.15メートル",
                "150メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "150センチメートルは 1.5メートルです。"
        ),

        QuizQuestion(
            question: "60 ÷ 4 はいくつですか？",
            choices: [
                "12",
                "15",
                "16",
                "14"
            ],
            correctAnswerIndex: 1,
            explanation: "60 ÷ 4 は 15 です。"
        ),

        QuizQuestion(
            question: "5.5 - 2.3 はいくつですか？",
            choices: [
                "3.2",
                "3.1",
                "3.3",
                "3.4"
            ],
            correctAnswerIndex: 0,
            explanation: "5.5 - 2.3 は 3.2 です。"
        ),

        QuizQuestion(
            question: "75センチメートルは何メートルですか？",
            choices: [
                "0.75メートル",
                "7.5メートル",
                "0.07メートル",
                "75メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "75センチメートルは 0.75メートルです。"
        ),

        QuizQuestion(
            question: "81 ÷ 9 はいくつですか？",
            choices: [
                "9",
                "8",
                "7",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "81 ÷ 9 は 9 です。"
        ),

        QuizQuestion(
            question: "4.4 + 3.6 はいくつですか？",
            choices: [
                "8.0",
                "7.9",
                "7.8",
                "8.1"
            ],
            correctAnswerIndex: 0,
            explanation: "4.4 + 3.6 は 8.0 です。"
        ),

        QuizQuestion(
            question: "10ミリメートルは何センチメートルですか？",
            choices: [
                "1センチメートル",
                "10センチメートル",
                "0.1センチメートル",
                "100センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "10ミリメートルは 1センチメートルです。"
        ),
        // 修正開始: 正解は「9」で選択肢「9」をインデックス1に設定
        QuizQuestion(
            question: "72 ÷ 8 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 1, // 修正: 元は0でしたが、正解は1
            explanation: "72 ÷ 8 は 9 です。"
        ),
        // 修正終了

        // 修正開始: 正解は「9.0」なのでcorrectAnswerIndexを0に変更
        QuizQuestion(
            question: "6.1 + 2.9 はいくつですか？",
            choices: [
                "9.0",
                "8.9",
                "9.1",
                "8.8"
            ],
            correctAnswerIndex: 0, // 修正: 元は2でしたが、正解は0
            explanation: "6.1 + 2.9 は 9.0 です。"
        ),
        // 修正終了

        QuizQuestion(
            question: "200センチメートルは何メートルですか？",
            choices: [
                "2メートル",
                "20メートル",
                "0.2メートル",
                "200メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "200センチメートルは 2メートルです。"
        ),

        QuizQuestion(
            question: "50 ÷ 5 はいくつですか？",
            choices: [
                "10",
                "9",
                "11",
                "12"
            ],
            correctAnswerIndex: 0,
            explanation: "50 ÷ 5 は 10 です。"
        ),

        QuizQuestion(
            question: "7.7 - 5.3 はいくつですか？",
            choices: [
                "2.4",
                "2.5",
                "2.6",
                "2.7"
            ],
            correctAnswerIndex: 0,
            explanation: "7.7 - 5.3 は 2.4 です。"
        ),

        QuizQuestion(
            question: "300センチメートルは何メートルですか？",
            choices: [
                "0.35メートル",
                "3.5メートル",
                "35メートル",
                "350メートル"
            ],
            correctAnswerIndex: 1, // 修正: 正解は「35メートル」なのでindex 2に変更
            explanation: "300センチメートルは 3メートルです。"
        ),
        // 修正終了

        QuizQuestion(
            question: "56 ÷ 7 はいくつですか？",
            choices: [
                "8",
                "7",
                "9",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "56 ÷ 7 は 8 です。"
        ),
        QuizQuestion(
            question: "5.7 + 3.8 はいくつですか？",
            choices: [
                "9.3",
                "9.5",
                "9.6",
                "9.4"
            ],
            correctAnswerIndex: 1, // 修正: 正解は「9.5」なのでindex 1に変更
            explanation: "5.7 + 3.8 は 9.5 です。"
        ),

        QuizQuestion(
            question: "4,000センチメートルは何メートルですか？",
            choices: [
                "0.4メートル",
                "4メートル",
                "40メートル",
                "400メートル"
            ],
            correctAnswerIndex: 2, // 修正: 正解は「40メートル」なのでindex 2に変更
            explanation: "4,000センチメートルは 40メートルです。"
        ),
        QuizQuestion(
            question: "18 ÷ 6 はいくつですか？",
            choices: [
                "2",
                "3",
                "4",
                "5"
            ],
            correctAnswerIndex: 1,
            explanation: "18 ÷ 6 は 3 です。"
        ),

        QuizQuestion(
            question: "2.4 + 7.5 はいくつですか？",
            choices: [
                "9.8",
                "9.9",
                "10.0",
                "9.7"
            ],
            correctAnswerIndex: 1,
            explanation: "2.4 + 7.5 は 9.9 です。"
        ),

        QuizQuestion(
            question: "2,500ミリメートルは何メートルですか？",
            choices: [
                "25メートル",
                "2.5メートル",
                "0.25メートル",
                "250メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "2,500ミリメートルは 2.5メートルです。"
        ),

        QuizQuestion(
            question: "90 ÷ 10 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "90 ÷ 10 は 9 です。"
        ),

        // 修正開始: 正解は「7.8」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "4.5 + 3.2 はいくつですか？",
            choices: [
                "7.6",
                "7.7",
                "7.8",
                "7.9"
            ],
            correctAnswerIndex: 2,
            explanation: "4.5 + 3.2 は 7.7 です。"
        ),
        // 修正終了

        QuizQuestion(
            question: "250センチメートルは何メートルですか？",
            choices: [
                "2.5メートル",
                "25メートル",
                "0.25メートル",
                "250メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "250センチメートルは 2.5メートルです。"
        ),

        QuizQuestion(
            question: "15 ÷ 3 はいくつですか？",
            choices: [
                "3",
                "4",
                "5",
                "6"
            ],
            correctAnswerIndex: 2,
            explanation: "15 ÷ 3 は 5 です。"
        ),

        QuizQuestion(
            question: "6.6 - 2.2 はいくつですか？",
            choices: [
                "4.3",
                "4.4",
                "4.5",
                "4.6"
            ],
            correctAnswerIndex: 1,
            explanation: "6.6 - 2.2 は 4.4 です。"
        ),

        QuizQuestion(
            question: "80ミリメートルは何センチメートルですか？",
            choices: [
                "0.8センチメートル",
                "8センチメートル",
                "80センチメートル",
                "0.08センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "80ミリメートルは 8センチメートルです。"
        ),
        QuizQuestion(
            question: "56 ÷ 7 はいくつですか？",
            choices: [
                "8",
                "7",
                "9",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "56 ÷ 7 は 8 です。"
        ),

        QuizQuestion(
            question: "5.7 + 3.8 はいくつですか？",
            choices: [
                "9.3",
                "9.5",
                "9.6",
                "9.4"
            ],
            correctAnswerIndex: 1,
            explanation: "5.7 + 3.8 は 9.5 です。"
        ),

        QuizQuestion(
            question: "4,000センチメートルは何メートルですか？",
            choices: [
                "0.4メートル",
                "4メートル",
                "40メートル",
                "400メートル"
            ],
            correctAnswerIndex: 2,
            explanation: "4,000センチメートルは 40メートルです。"
        ),
        QuizQuestion(
            question: "18 ÷ 6 はいくつですか？",
            choices: [
                "2",
                "3",
                "4",
                "5"
            ],
            correctAnswerIndex: 1,
            explanation: "18 ÷ 6 は 3 です。"
        ),

        QuizQuestion(
            question: "2.4 + 7.5 はいくつですか？",
            choices: [
                "9.8",
                "9.9",
                "10.0",
                "9.7"
            ],
            correctAnswerIndex: 1,
            explanation: "2.4 + 7.5 は 9.9 です。"
        ),

        QuizQuestion(
            question: "2,500ミリメートルは何メートルですか？",
            choices: [
                "25メートル",
                "2.5メートル",
                "0.25メートル",
                "250メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "2,500ミリメートルは 2.5メートルです。"
        ),

        QuizQuestion(
            question: "90 ÷ 10 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "90 ÷ 10 は 9 です。"
        ),

        // 修正開始: 正解は「7.8」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "4.5 + 3.2 はいくつですか？",
            choices: [
                "7.6",
                "7.7",
                "7.8",
                "7.9"
            ],
            correctAnswerIndex: 2, // 修正: 元は2でしたが、正解は3
            explanation: "4.5 + 3.2 は 7.7 です。"
        ),
        // 修正終了

        QuizQuestion(
            question: "250センチメートルは何メートルですか？",
            choices: [
                "2.5メートル",
                "25メートル",
                "0.25メートル",
                "250メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "250センチメートルは 2.5メートルです。"
        ),

        QuizQuestion(
            question: "15 ÷ 3 はいくつですか？",
            choices: [
                "3",
                "4",
                "5",
                "6"
            ],
            correctAnswerIndex: 2,
            explanation: "15 ÷ 3 は 5 です。"
        ),

        QuizQuestion(
            question: "6.6 - 2.2 はいくつですか？",
            choices: [
                "4.3",
                "4.4",
                "4.5",
                "4.6"
            ],
            correctAnswerIndex: 1,
            explanation: "6.6 - 2.2 は 4.4 です。"
        ),

        QuizQuestion(
            question: "80ミリメートルは何センチメートルですか？",
            choices: [
                "0.8センチメートル",
                "8センチメートル",
                "80センチメートル",
                "0.08センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "80ミリメートルは 8センチメートルです。"
        ),
        QuizQuestion(
            question: "56 ÷ 7 はいくつですか？",
            choices: [
                "8",
                "7",
                "9",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "56 ÷ 7 は 8 です。"
        ),

        QuizQuestion(
            question: "5.7 + 3.8 はいくつですか？",
            choices: [
                "9.3",
                "9.5",
                "9.6",
                "9.4"
            ],
            correctAnswerIndex: 2,
            explanation: "5.7 + 3.8 は 9.6 です。"
        ),

        QuizQuestion(
            question: "4,000センチメートルは何メートルですか？",
            choices: [
                "0.4メートル",
                "4メートル",
                "40メートル",
                "400メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "4,000センチメートルは 4メートルです。"
        ),

        QuizQuestion(
            question: "18 ÷ 6 はいくつですか？",
            choices: [
                "2",
                "3",
                "4",
                "5"
            ],
            correctAnswerIndex: 1,
            explanation: "18 ÷ 6 は 3 です。"
        ),

        QuizQuestion(
            question: "2.4 + 7.5 はいくつですか？",
            choices: [
                "9.8",
                "9.9",
                "10.0",
                "9.7"
            ],
            correctAnswerIndex: 1,
            explanation: "2.4 + 7.5 は 9.9 です。"
        ),

        QuizQuestion(
            question: "2,500ミリメートルは何メートルですか？",
            choices: [
                "25メートル",
                "2.5メートル",
                "0.25メートル",
                "250メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "2,500ミリメートルは 2.5メートルです。"
        ),

        QuizQuestion(
            question: "90 ÷ 10 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "90 ÷ 10 は 9 です。"
        ),

        QuizQuestion(
            question: "4.7 + 3.2 はいくつですか？",
            choices: [
                "7.9",
                "8.0",
                "7.8",
                "8.1"
            ],
            correctAnswerIndex: 0,
            explanation: "4.7 + 3.2 は 7.9 です。"
        ),

        QuizQuestion(
            question: "3ミリメートルは何センチメートルですか？",
            choices: [
                "0.3センチメートル",
                "3センチメートル",
                "30センチメートル",
                "0.03センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "3ミリメートルは 0.3センチメートルです。"
        ),

    ]
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: quizBeginnerList.shuffled())
    }
    @StateObject var sharedInterstitial = Interstitial()
    var body: some View {
        QuizView(quizzes: shuffledQuizList, quizLevel: .sansu3, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu3ListView(isPresenting: .constant(false))
    }
}
