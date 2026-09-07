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
                "0.3メートル",
                "3メートル",
                "30メートル",
                "300メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "300センチメートルは 3メートルです。"
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

        QuizQuestion(
            question: "4.5 + 3.2 はいくつですか？",
            choices: [
                "7.6",
                "7.7",
                "7.8",
                "7.9"
            ],
            correctAnswerIndex: 1,
            explanation: "4.5 + 3.2 は 7.7 です。"
        ),

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

        QuizQuestion(
            question: "4.5 + 3.2 はいくつですか？",
            choices: [
                "7.6",
                "7.7",
                "7.8",
                "7.9"
            ],
            correctAnswerIndex: 1,
            explanation: "4.5 + 3.2 は 7.7 です。"
        ),

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

        QuizQuestion(
        question: "34 × 2 はいくつですか？",
        choices: [
        "68",
        "76",
        "64",
        "72"
        ],
        correctAnswerIndex: 0,
        explanation: "34 × 2 は 68 です。"
        ),

        QuizQuestion(
        question: "63 ÷ 7 はいくつですか？",
        choices: [
        "8",
        "7",
        "6",
        "9"
        ],
        correctAnswerIndex: 3,
        explanation: "63 ÷ 7 は 9 です。"
        ),

        QuizQuestion(
        question: "507,326の千の位の数字はどれですか？",
        choices: [
        "0",
        "5",
        "3",
        "7"
        ],
        correctAnswerIndex: 3,
        explanation: "507,326の千の位の数字は「7」です。"
        ),

        QuizQuestion(
        question: "0.9 + 0.4 はいくつですか？",
        choices: [
        "1.2",
        "1.4",
        "1.3",
        "0.13"
        ],
        correctAnswerIndex: 2,
        explanation: "0.9 + 0.4 は 1.3 です。"
        ),

        QuizQuestion(
        question: "3/8 + 2/8 はいくつですか？",
        choices: [
        "5/8",
        "5/16",
        "1/8",
        "6/8"
        ],
        correctAnswerIndex: 0,
        explanation: "分母が同じなので分子を足します。3/8 + 2/8 = 5/8です。"
        ),

        QuizQuestion(
        question: "2kgは何gですか？",
        choices: [
        "200g",
        "20000g",
        "2000g",
        "20g"
        ],
        correctAnswerIndex: 2,
        explanation: "1kgは1000gなので、2kgは「2000g」です。"
        ),

        QuizQuestion(
        question: "直径が14cmの円の半径は何cmですか？",
        choices: [
        "7cm",
        "6cm",
        "14cm",
        "28cm"
        ],
        correctAnswerIndex: 0,
        explanation: "半径は直径の半分なので、14 ÷ 2 = 7より「7cm」です。"
        ),

        QuizQuestion(
        question: "1目盛りが3冊を表す棒グラフで、棒が5目盛りまでのびています。何冊を表していますか？",
        choices: [
        "18冊",
        "12冊",
        "15冊",
        "10冊"
        ],
        correctAnswerIndex: 2,
        explanation: "1目盛りが3冊で5目盛りあるので、3 × 5 = 15より「15冊」です。"
        ),

        QuizQuestion(
        question: "1束に鉛筆が7本ずつ入っています。5束では全部で何本ですか？",
        choices: [
        "30本",
        "40本",
        "35本",
        "42本"
        ],
        correctAnswerIndex: 2,
        explanation: "7 × 5 = 35なので、全部で「35本」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】26 × 4 = ＿＿ に入る数を答えましょう。",
        answer: "104",
        acceptableAnswers: ["１０４"],
        explanation: "26 × 4 は 104 なので、＿＿に入る数は「104」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】54 ÷ 9 = ＿＿ に入る数を答えましょう。",
        answer: "6",
        acceptableAnswers: ["６"],
        explanation: "54 ÷ 9 は 6 なので、＿＿に入る数は「6」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】30万より大きい4つの数を、小さい順に並べましょう。",
        choices: ["350,009", "305,900", "350,090", "305,090"],
        orderedChoices: ["305,090", "305,900", "350,009", "350,090"],
        explanation: "小さい順に「305,090、305,900、350,009、350,090」です。"
        ),

        QuizQuestion(
        question: "4.2 - 1.7 はいくつですか？",
        choices: [
        "3.5",
        "2.5",
        "2.4",
        "2.6"
        ],
        correctAnswerIndex: 1,
        explanation: "4.2 - 1.7 は 2.5 です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】分母が10の4つの分数を、小さい順に並べましょう。",
        choices: ["6/10", "1/10", "9/10", "3/10"],
        orderedChoices: ["1/10", "3/10", "6/10", "9/10"],
        explanation: "分母が同じ分数は分子が小さいほど小さいので、「1/10、3/10、6/10、9/10」の順です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】重さと、gで表した重さを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "3kg", match: "3000g"),
        QuizMatchingPair(prompt: "1kg500g", match: "1500g"),
        QuizMatchingPair(prompt: "1kg80g", match: "1080g"),
        QuizMatchingPair(prompt: "2kg50g", match: "2050g")
        ],
        choices: ["1500g", "2050g", "3000g", "1080g"],
        explanation: "3kgは3000g、1kg500gは1500g、1kg80gは1080g、2kg50gは2050gです。"
        ),

        QuizQuestion(
        question: "207 × 3 はいくつですか？",
        choices: [
        "601",
        "627",
        "621",
        "612"
        ],
        correctAnswerIndex: 2,
        explanation: "207 × 3 は 621 です。"
        ),

        QuizQuestion(
        question: "85 ÷ 6 の答えはどれですか？",
        choices: [
        "13あまり1",
        "14あまり2",
        "15あまり1",
        "14あまり1"
        ],
        correctAnswerIndex: 3,
        explanation: "6 × 14 = 84で、85 - 84 = 1なので、85 ÷ 6 は「14あまり1」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】400万と5万と600と8を合わせた数は ＿＿ です。",
        answer: "4050608",
        acceptableAnswers: ["4,050,608", "４，０５０，６０８", "４０５０６０８"],
        explanation: "4,000,000 + 50,000 + 600 + 8 = 4,050,608なので、＿＿に入る数は「4,050,608」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】0.6、0.8、1.1、1.4を小さい順に並べましょう。",
        choices: ["1.4", "0.6", "1.1", "0.8"],
        orderedChoices: ["0.6", "0.8", "1.1", "1.4"],
        explanation: "小さい順に「0.6、0.8、1.1、1.4」です。"
        ),

        QuizQuestion(
        question: "1mのリボンを同じ長さに12等分しました。その7こ分の長さはどれですか？",
        choices: [
        "5/12m",
        "7/5m",
        "7/12m",
        "12/7m"
        ],
        correctAnswerIndex: 2,
        explanation: "1mを12等分した7こ分なので、長さは「7/12m」です。"
        ),

        QuizQuestion(
        question: "1kg750gの荷物と680gの荷物を合わせると、何kg何gですか？",
        choices: [
        "3kg430g",
        "2kg530g",
        "2kg430g",
        "2kg330g"
        ],
        correctAnswerIndex: 2,
        explanation: "1kg750gは1750gです。1750 + 680 = 2430gなので、「2kg430g」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】円の半径や直径を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "直径20cmの円の半径", match: "10cm"),
        QuizMatchingPair(prompt: "半径6cmの円の直径", match: "12cm"),
        QuizMatchingPair(prompt: "直径16cmの円の半径", match: "8cm"),
        QuizMatchingPair(prompt: "半径9cmの円の直径", match: "18cm")
        ],
        choices: ["8cm", "18cm", "10cm", "12cm"],
        explanation: "直径20cmの円の半径は10cm、半径6cmの円の直径は12cm、直径16cmの円の半径は8cm、半径9cmの円の直径は18cmです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】青と黄の空き缶は、合わせて何個ですか？",
        answer: "18",
        acceptableAnswers: ["１８"],
        referenceTitle: "集めた空き缶の数（■1こ＝2個）",
        referenceRows: [
        QuizReferenceRow(label: "赤", value: "■■■■■■■"),
        QuizReferenceRow(label: "青", value: "■■■■■"),
        QuizReferenceRow(label: "緑", value: "■■■■■■■■"),
        QuizReferenceRow(label: "黄", value: "■■■■")
        ],
        explanation: "青は10個、黄は8個なので、10 + 8 = 18より「18個」です。"
        ),

        QuizQuestion(
        question: "1箱にボールが18個ずつ入っています。4箱分から9個使うと、残りは何個ですか？",
        choices: [
        "61個",
        "63個",
        "54個",
        "72個"
        ],
        correctAnswerIndex: 1,
        explanation: "18 × 4 = 72個で、72 - 9 = 63個なので、残りは「63個」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】125 × 6 = ＿＿ に入る数を答えましょう。",
        answer: "750",
        acceptableAnswers: ["７５０"],
        explanation: "125 × 6 は 750 なので、＿＿に入る数は「750」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】148 ÷ 4 = ＿＿ に入る数を答えましょう。",
        answer: "37",
        acceptableAnswers: ["３７"],
        explanation: "148 ÷ 4 は 37 なので、＿＿に入る数は「37」です。"
        ),

        QuizQuestion(
        question: "80万を7こ、1万を4こ、100を6こ合わせた数はどれですか？",
        choices: [
        "5,640,600",
        "5,646,000",
        "5,604,600",
        "5,640,060"
        ],
        correctAnswerIndex: 0,
        explanation: "800,000 × 7 + 10,000 × 4 + 100 × 6 = 5,640,600なので、正解は「5,640,600」です。"
        ),

        QuizQuestion(
        question: "半径8cmの円Aと、直径20cmの円Bがあります。半径をくらべたとき、正しいものはどれですか？",
        choices: [
        "2つの円の半径は同じ",
        "円Aのほうが2cm長い",
        "円Bのほうが12cm長い",
        "円Bのほうが2cm長い"
        ],
        correctAnswerIndex: 3,
        explanation: "円Aの半径は8cm、円Bの半径は20 ÷ 2 = 10cmです。10 - 8 = 2なので、「円Bのほうが2cm長い」が正解です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】A班とC班の合計から、B班とD班の合計を引くと何冊ですか？",
        answer: "15",
        acceptableAnswers: ["１５"],
        referenceTitle: "本棚に戻した本の数（■1こ＝3冊）",
        referenceRows: [
        QuizReferenceRow(label: "A班", value: "■■■■■■■■"),
        QuizReferenceRow(label: "B班", value: "■■■■■"),
        QuizReferenceRow(label: "C班", value: "■■■■■■"),
        QuizReferenceRow(label: "D班", value: "■■■■")
        ],
        explanation: "A班は24冊、C班は18冊で合計42冊です。B班は15冊、D班は12冊で合計27冊です。42 - 27 = 15より「15冊」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1箱にビー玉が24個ずつ入っています。3箱分を8人で同じ数ずつ分けると、1人分は ＿＿ 個です。",
        answer: "9",
        acceptableAnswers: ["９"],
        explanation: "24 × 3 = 72個で、72 ÷ 8 = 9個なので、＿＿に入る数は「9」です。"
        ),

        QuizQuestion(
        question: "43 × 3 はいくつですか？",
        choices: [
        "129",
        "126",
        "133",
        "139"
        ],
        correctAnswerIndex: 0,
        explanation: "43 × 3 は 129 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】306 × 2 = ＿＿ に入る数を答えましょう。",
        answer: "612",
        acceptableAnswers: ["６１２"],
        explanation: "306 × 2 は 612 なので、＿＿に入る数は「612」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】4つのかけ算を、それぞれの答えと正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "17 × 3", match: "51"),
        QuizMatchingPair(prompt: "24 × 4", match: "96"),
        QuizMatchingPair(prompt: "31 × 2", match: "62"),
        QuizMatchingPair(prompt: "12 × 7", match: "84")
        ],
        choices: ["62", "84", "51", "96"],
        explanation: "17 × 3は51、24 × 4は96、31 × 2は62、12 × 7は84です。"
        ),

        QuizQuestion(
        question: "118 × 5 はいくつですか？",
        choices: [
        "608",
        "580",
        "690",
        "590"
        ],
        correctAnswerIndex: 3,
        explanation: "118 × 5 は 590 です。"
        ),

        QuizQuestion(
        question: "92 ÷ 4 はいくつですか？",
        choices: [
        "23",
        "22",
        "21",
        "24"
        ],
        correctAnswerIndex: 0,
        explanation: "92 ÷ 4 は 23 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】168 ÷ 7 = ＿＿ に入る数を答えましょう。",
        answer: "24",
        acceptableAnswers: ["２４"],
        explanation: "168 ÷ 7 は 24 なので、＿＿に入る数は「24」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】4つのわり算を、答えが小さい順に並べましょう。",
        choices: ["63 ÷ 9", "32 ÷ 8", "48 ÷ 8", "40 ÷ 8"],
        orderedChoices: ["32 ÷ 8", "40 ÷ 8", "48 ÷ 8", "63 ÷ 9"],
        explanation: "答えはそれぞれ4、5、6、7なので、「32 ÷ 8、40 ÷ 8、48 ÷ 8、63 ÷ 9」の順です。"
        ),

        QuizQuestion(
        question: "127 ÷ 8 の答えはどれですか？",
        choices: [
        "15あまり7",
        "14あまり7",
        "15あまり6",
        "16あまり1"
        ],
        correctAnswerIndex: 0,
        explanation: "8 × 15 = 120で、127 - 120 = 7なので、127 ÷ 8 は「15あまり7」です。"
        ),

        QuizQuestion(
        question: "6,482,719の十万の位の数字はどれですか？",
        choices: [
        "7",
        "8",
        "2",
        "4"
        ],
        correctAnswerIndex: 3,
        explanation: "6,482,719の十万の位の数字は「4」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】900万と30万と2千と500と7を合わせた数は ＿＿ です。",
        answer: "9302507",
        acceptableAnswers: ["9,302,507", "９，３０２，５０７", "９３０２５０７"],
        explanation: "9,000,000 + 300,000 + 2,000 + 500 + 7 = 9,302,507なので、＿＿に入る数は「9,302,507」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】4つの大きな数を、小さい順に並べましょう。",
        choices: ["4,560,009", "4,506,900", "4,650,090", "4,506,090"],
        orderedChoices: ["4,506,090", "4,506,900", "4,560,009", "4,650,090"],
        explanation: "小さい順に「4,506,090、4,506,900、4,560,009、4,650,090」です。"
        ),

        QuizQuestion(
        question: "2.8 + 1.5 はいくつですか？",
        choices: [
        "3.3",
        "3.13",
        "4.2",
        "4.3"
        ],
        correctAnswerIndex: 3,
        explanation: "2.8 + 1.5 は 4.3 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】6.4 - 2.9 = ＿＿ に入る数を答えましょう。",
        answer: "3.5",
        acceptableAnswers: ["３．５"],
        explanation: "6.4 - 2.9 は 3.5 なので、＿＿に入る数は「3.5」です。"
        ),

        QuizQuestion(
        question: "次の小数のうち、いちばん大きい数はどれですか？",
        choices: [
        "3.0",
        "2.9",
        "3.1",
        "2.6"
        ],
        correctAnswerIndex: 2,
        explanation: "2.9、3.0、3.1、2.6のうち、いちばん大きい数は「3.1」です。"
        ),

        QuizQuestion(
        question: "4/7 + 2/7 はいくつですか？",
        choices: [
        "6/7",
        "6/14",
        "2/7",
        "5/7"
        ],
        correctAnswerIndex: 0,
        explanation: "分母が同じなので分子を足します。4/7 + 2/7 = 6/7です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】7/8 - 2/8 = ＿＿ に入る分数を答えましょう。",
        answer: "5/8",
        acceptableAnswers: ["8分の5", "５／８", "5／8"],
        explanation: "分母が同じなので分子を引きます。7/8 - 2/8 = 5/8なので、＿＿に入る分数は「5/8」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】分数の小さい順に並べましょう。",
        choices: ["4/6", "1/6", "5/6", "3/6"],
        orderedChoices: ["1/6", "3/6", "4/6", "5/6"],
        explanation: "分母が同じ分数は分子が小さいほど小さいので、「1/6、3/6、4/6、5/6」の順です。"
        ),

        QuizQuestion(
        question: "3kg40gは何gですか？",
        choices: [
        "3040g",
        "3004g",
        "340g",
        "3400g"
        ],
        correctAnswerIndex: 0,
        explanation: "3kgは3000gなので、3000 + 40 = 3040より「3040g」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】4つの重さを、gで表した重さと正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "5kg20g", match: "5020g"),
        QuizMatchingPair(prompt: "3kg600g", match: "3600g"),
        QuizMatchingPair(prompt: "2kg8g", match: "2008g"),
        QuizMatchingPair(prompt: "4kg450g", match: "4450g")
        ],
        choices: ["2008g", "4450g", "5020g", "3600g"],
        explanation: "5kg20gは5020g、3kg600gは3600g、2kg8gは2008g、4kg450gは4450gです。"
        ),

        QuizQuestion(
        question: "2kg480gの荷物と1kg650gの荷物を合わせると、何kg何gですか？",
        choices: [
        "4kg30g",
        "3kg230g",
        "4kg130g",
        "3kg130g"
        ],
        correctAnswerIndex: 2,
        explanation: "2kg480gは2480g、1kg650gは1650gです。2480 + 1650 = 4130gなので、「4kg130g」です。"
        ),

        QuizQuestion(
        question: "直径が26cmの円の半径は何cmですか？",
        choices: [
        "13cm",
        "52cm",
        "12cm",
        "26cm"
        ],
        correctAnswerIndex: 0,
        explanation: "半径は直径の半分なので、26 ÷ 2 = 13より「13cm」です。"
        ),

        QuizQuestion(
        question: "球の中心から表面までの長さについて、正しいものはどれですか？",
        choices: [
        "方向によって必ずちがう",
        "どの方向でも同じ",
        "上向きだけがいちばん長い",
        "横向きだけがいちばん短い"
        ],
        correctAnswerIndex: 1,
        explanation: "球の中心から表面までの長さは、どの方向でも同じです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】半径が11cmの円の直径は ＿＿ cmです。",
        answer: "22",
        acceptableAnswers: ["２２"],
        explanation: "直径は半径の2倍なので、11 × 2 = 22より、＿＿に入る数は「22」です。"
        ),

        QuizQuestion(
        question: "1目盛りが4台を表す棒グラフで、棒が7目盛りまでのびています。何台を表していますか？",
        choices: [
        "32台",
        "11台",
        "24台",
        "28台"
        ],
        correctAnswerIndex: 3,
        explanation: "1目盛りが4台で7目盛りあるので、4 × 7 = 28より「28台」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】木曜日に集めた本数は、火曜日より何本多いですか？",
        answer: "8",
        acceptableAnswers: ["８"],
        referenceTitle: "集めた紙パック（■1こ＝4本）",
        referenceRows: [
        QuizReferenceRow(label: "月曜日", value: "■■■"),
        QuizReferenceRow(label: "火曜日", value: "■■■■■"),
        QuizReferenceRow(label: "水曜日", value: "■■■■"),
        QuizReferenceRow(label: "木曜日", value: "■■■■■■■")
        ],
        explanation: "火曜日は20本、木曜日は28本なので、28 - 20 = 8より「8本」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】A組とC組が集めたボールを、1箱に6個ずつ入れます。全部で何箱になりますか？",
        answer: "9",
        acceptableAnswers: ["９"],
        referenceTitle: "集めたボールの数（■1こ＝3個）",
        referenceRows: [
        QuizReferenceRow(label: "A組", value: "■■■■■■■■"),
        QuizReferenceRow(label: "B組", value: "■■■■■"),
        QuizReferenceRow(label: "C組", value: "■■■■■■■■■■"),
        QuizReferenceRow(label: "D組", value: "■■■■■■■")
        ],
        explanation: "A組は24個、C組は30個なので、合わせて54個です。54 ÷ 6 = 9より「9箱」です。"
        ),

        QuizQuestion(
        question: "1袋にシールが8枚ずつ入っています。7袋では全部で何枚ですか？",
        choices: [
        "54枚",
        "56枚",
        "48枚",
        "64枚"
        ],
        correctAnswerIndex: 1,
        explanation: "8 × 7 = 56なので、全部で「56枚」です。"
        ),

        QuizQuestion(
        question: "90本の花を5人で同じ本数ずつ分けます。1人分は何本ですか？",
        choices: [
        "18本",
        "15本",
        "20本",
        "16本"
        ],
        correctAnswerIndex: 0,
        explanation: "90 ÷ 5 = 18なので、1人分は「18本」です。"
        ),

        QuizQuestion(
        question: "1箱にクレヨンが25本ずつ入っています。4箱分から37本使うと、残りは何本ですか？",
        choices: [
        "57本",
        "73本",
        "63本",
        "53本"
        ],
        correctAnswerIndex: 2,
        explanation: "25 × 4 = 100本で、100 - 37 = 63本なので、残りは「63本」です。"
        ),

        QuizQuestion(
        question: "176ページの本を、1日に28ページずつ5日間読みました。残りは何ページですか？",
        choices: [
        "28ページ",
        "36ページ",
        "46ページ",
        "40ページ"
        ],
        correctAnswerIndex: 1,
        explanation: "28 × 5 = 140ページ読みました。176 - 140 = 36なので、残りは「36ページ」です。"
        ),
        QuizQuestion(
        question: "37 × 4 はいくつですか？",
        choices: [
        "148",
        "144",
        "138",
        "158"
        ],
        correctAnswerIndex: 0,
        explanation: "37 × 4 は 148 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】407 × 3 = ＿＿ に入る数を答えましょう。",
        answer: "1221",
        acceptableAnswers: ["1,221", "１２２１"],
        explanation: "407 × 3 は 1221 なので、＿＿に入る数は「1221」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】かけ算と答えを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "19 × 6", match: "114"),
        QuizMatchingPair(prompt: "27 × 4", match: "108"),
        QuizMatchingPair(prompt: "34 × 3", match: "102"),
        QuizMatchingPair(prompt: "16 × 7", match: "112")
        ],
        choices: ["102", "112", "114", "108"],
        explanation: "19 × 6は114、27 × 4は108、34 × 3は102、16 × 7は112です。"
        ),

        QuizQuestion(
        question: "84 ÷ 7 はいくつですか？",
        choices: [
        "11",
        "14",
        "13",
        "12"
        ],
        correctAnswerIndex: 3,
        explanation: "84 ÷ 7 は 12 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】252 ÷ 9 = ＿＿ に入る数を答えましょう。",
        answer: "28",
        acceptableAnswers: ["２８"],
        explanation: "252 ÷ 9 は 28 なので、＿＿に入る数は「28」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】わり算を、答えが小さい順に並べましょう。",
        choices: ["153 ÷ 9", "114 ÷ 6", "128 ÷ 8", "126 ÷ 7"],
        orderedChoices: ["128 ÷ 8", "153 ÷ 9", "126 ÷ 7", "114 ÷ 6"],
        explanation: "答えは順に16、17、18、19なので、「128 ÷ 8、153 ÷ 9、126 ÷ 7、114 ÷ 6」の順です。"
        ),

        QuizQuestion(
        question: "134 ÷ 6 の答えはどれですか？",
        choices: [
        "21あまり4",
        "22あまり2",
        "22あまり1",
        "21あまり5"
        ],
        correctAnswerIndex: 1,
        explanation: "6 × 22 = 132で、134 - 132 = 2なので、134 ÷ 6 は「22あまり2」です。"
        ),

        QuizQuestion(
        question: "9,146,382の百万の位の数字はどれですか？",
        choices: [
        "1",
        "6",
        "9",
        "4"
        ],
        correctAnswerIndex: 2,
        explanation: "9,146,382の百万の位の数字は「9」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】500万と7万と300と4を合わせた数は ＿＿ です。",
        answer: "5070304",
        acceptableAnswers: ["5,070,304", "５，０７０，３０４", "５０７０３０４"],
        explanation: "5,000,000 + 70,000 + 300 + 4 = 5,070,304なので、＿＿に入る数は「5,070,304」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】大きな数を、小さい順に並べましょう。",
        choices: ["7,080,090", "7,008,900", "7,800,009", "7,080,009"],
        orderedChoices: ["7,008,900", "7,080,009", "7,080,090", "7,800,009"],
        explanation: "小さい順に「7,008,900、7,080,009、7,080,090、7,800,009」です。"
        ),

        QuizQuestion(
        question: "3.6 + 2.7 はいくつですか？",
        choices: [
        "6.2",
        "6.3",
        "5.3",
        "5.13"
        ],
        correctAnswerIndex: 1,
        explanation: "3.6 + 2.7 は 6.3 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】8.1 - 3.6 = ＿＿ に入る数を答えましょう。",
        answer: "4.5",
        acceptableAnswers: ["４．５"],
        explanation: "8.1 - 3.6 は 4.5 なので、＿＿に入る数は「4.5」です。"
        ),

        QuizQuestion(
        question: "4.8より0.3大きい数はどれですか？",
        choices: [
        "4.5",
        "5.2",
        "5.1",
        "5.0"
        ],
        correctAnswerIndex: 2,
        explanation: "4.8 + 0.3 = 5.1なので、正解は「5.1」です。"
        ),

        QuizQuestion(
        question: "4/11 + 5/11 はいくつですか？",
        choices: [
        "9/11",
        "9/22",
        "8/11",
        "1/11"
        ],
        correctAnswerIndex: 0,
        explanation: "分母が同じなので分子を足します。4/11 + 5/11 = 9/11です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】10/11 - 3/11 = ＿＿ に入る分数を答えましょう。",
        answer: "7/11",
        acceptableAnswers: ["11分の7", "７／１１", "7／11"],
        explanation: "分母が同じなので分子を引きます。10/11 - 3/11 = 7/11なので、＿＿に入る分数は「7/11」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】分数を、小さい順に並べましょう。",
        choices: ["7/12", "2/12", "11/12", "5/12"],
        orderedChoices: ["2/12", "5/12", "7/12", "11/12"],
        explanation: "分母が同じ分数は分子が小さいほど小さいので、「2/12、5/12、7/12、11/12」の順です。"
        ),

        QuizQuestion(
        question: "6kg70gは何gですか？",
        choices: [
        "6007g",
        "6700g",
        "6070g",
        "670g"
        ],
        correctAnswerIndex: 2,
        explanation: "6kgは6000gなので、6000 + 70 = 6070より「6070g」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】重さと、gで表した重さを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1kg240g", match: "1240g"),
        QuizMatchingPair(prompt: "2kg75g", match: "2075g"),
        QuizMatchingPair(prompt: "3kg900g", match: "3900g"),
        QuizMatchingPair(prompt: "5kg6g", match: "5006g")
        ],
        choices: ["3900g", "1240g", "5006g", "2075g"],
        explanation: "1kg240gは1240g、2kg75gは2075g、3kg900gは3900g、5kg6gは5006gです。"
        ),

        QuizQuestion(
        question: "3kg275gの荷物と1kg850gの荷物を合わせると、何kg何gですか？",
        choices: [
        "5kg25g",
        "4kg25g",
        "4kg225g",
        "5kg125g"
        ],
        correctAnswerIndex: 3,
        explanation: "3kg275gは3275g、1kg850gは1850gです。3275 + 1850 = 5125gなので、「5kg125g」です。"
        ),

        QuizQuestion(
        question: "直径が34cmの円の半径は何cmですか？",
        choices: [
        "68cm",
        "16cm",
        "34cm",
        "17cm"
        ],
        correctAnswerIndex: 3,
        explanation: "半径は直径の半分なので、34 ÷ 2 = 17より「17cm」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】半径が14cmの円の直径は ＿＿ cmです。",
        answer: "28",
        acceptableAnswers: ["２８"],
        explanation: "直径は半径の2倍なので、14 × 2 = 28より、＿＿に入る数は「28」です。"
        ),

        QuizQuestion(
        question: "球の中心を通り、球の表面上の2点を結ぶ線分を何といいますか？",
        choices: [
        "円周",
        "直径",
        "半径",
        "中心"
        ],
        correctAnswerIndex: 1,
        explanation: "球の中心を通り、球の表面上の2点を結ぶ線分を「直径」といいます。"
        ),

        QuizQuestion(
        question: "1目盛りが6人を表す棒グラフで、棒が7目盛りまでのびています。何人を表していますか？",
        choices: [
        "48人",
        "42人",
        "36人",
        "40人"
        ],
        correctAnswerIndex: 1,
        explanation: "1目盛りが6人で7目盛りあるので、6 × 7 = 42より「42人」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】火曜日と木曜日に読んだ本は、合わせて何冊ですか？",
        answer: "40",
        acceptableAnswers: ["４０"],
        referenceTitle: "読んだ本の数（■1こ＝5冊）",
        referenceRows: [
        QuizReferenceRow(label: "月曜日", value: "■■■"),
        QuizReferenceRow(label: "火曜日", value: "■■■■■■"),
        QuizReferenceRow(label: "水曜日", value: "■■■■■"),
        QuizReferenceRow(label: "木曜日", value: "■■")
        ],
        explanation: "火曜日は30冊、木曜日は10冊なので、30 + 10 = 40より「40冊」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】A畑とC畑でとれたじゃがいもを、1袋に8kgずつ入れます。全部で何袋になりますか？",
        answer: "8",
        acceptableAnswers: ["８"],
        referenceTitle: "とれたじゃがいもの重さ（■1こ＝4kg）",
        referenceRows: [
        QuizReferenceRow(label: "A畑", value: "■■■■■■■■■"),
        QuizReferenceRow(label: "B畑", value: "■■■■■"),
        QuizReferenceRow(label: "C畑", value: "■■■■■■■"),
        QuizReferenceRow(label: "D畑", value: "■■■■")
        ],
        explanation: "A畑は36kg、C畑は28kgなので、合わせて64kgです。64 ÷ 8 = 8より「8袋」です。"
        ),

        QuizQuestion(
        question: "1箱にマーカーが17本ずつ入っています。5箱では全部で何本ですか？",
        choices: [
        "75本",
        "90本",
        "80本",
        "85本"
        ],
        correctAnswerIndex: 3,
        explanation: "17 × 5 = 85なので、全部で「85本」です。"
        ),

        QuizQuestion(
        question: "117枚のカードを9人で同じ枚数ずつ分けます。1人分は何枚ですか？",
        choices: [
        "12枚",
        "14枚",
        "13枚",
        "11枚"
        ],
        correctAnswerIndex: 2,
        explanation: "117 ÷ 9 = 13なので、1人分は「13枚」です。"
        ),

        QuizQuestion(
        question: "1冊142円のノートを3冊と、1本65円の鉛筆を2本買い、700円を出しました。おつりはいくらですか？",
        choices: [
        "140円",
        "154円",
        "134円",
        "144円"
        ],
        correctAnswerIndex: 3,
        explanation: "ノートは142 × 3 = 426円、鉛筆は65 × 2 = 130円です。代金は426 + 130 = 556円なので、700 - 556 = 144より、おつりは「144円」です。"
        ),

        QuizQuestion(
        question: "2kg600gの小麦粉から750gずつ2回使いました。残りは何kg何gですか？",
        choices: [
        "1kg50g",
        "1kg100g",
        "1kg850g",
        "850g"
        ],
        correctAnswerIndex: 1,
        explanation: "750 × 2 = 1500g使います。2kg600gは2600gなので、2600 - 1500 = 1100gです。したがって、残りは「1kg100g」です。"
        ),

        QuizQuestion(
        question: "213 × 4 と 127 × 6 の答えの差はいくつですか？",
        choices: [
        "190",
        "90",
        "100",
        "80"
        ],
        correctAnswerIndex: 1,
        explanation: "213 × 4 = 852、127 × 6 = 762です。852 - 762 = 90なので、答えの差は「90」です。"
        ),
        QuizQuestion(
        question: "58 × 3 はいくつですか？",
        choices: [
        "168",
        "164",
        "174",
        "184"
        ],
        correctAnswerIndex: 2,
        explanation: "58 × 3 は 174 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】132 × 4 = ＿＿ に入る数を答えましょう。",
        answer: "528",
        acceptableAnswers: ["５２８"],
        explanation: "132 × 4 は 528 なので、＿＿に入る数は「528」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】それぞれのかけ算を、正しい答えと組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "22 × 4", match: "88"),
        QuizMatchingPair(prompt: "36 × 3", match: "108"),
        QuizMatchingPair(prompt: "15 × 8", match: "120"),
        QuizMatchingPair(prompt: "41 × 2", match: "82")
        ],
        choices: ["120", "82", "88", "108"],
        explanation: "22 × 4は88、36 × 3は108、15 × 8は120、41 × 2は82です。"
        ),

        QuizQuestion(
        question: "204 × 4 はいくつですか？",
        choices: [
        "824",
        "816",
        "806",
        "840"
        ],
        correctAnswerIndex: 1,
        explanation: "204 × 4 は 816 です。"
        ),

        QuizQuestion(
        question: "144 ÷ 8 はいくつですか？",
        choices: [
        "17",
        "18",
        "19",
        "16"
        ],
        correctAnswerIndex: 1,
        explanation: "144 ÷ 8 は 18 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】217 ÷ 7 = ＿＿ に入る数を答えましょう。",
        answer: "31",
        acceptableAnswers: ["３１"],
        explanation: "217 ÷ 7 は 31 なので、＿＿に入る数は「31」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】4つのわり算を、商が小さいものから順に並べましょう。",
        choices: ["162 ÷ 9", "152 ÷ 8", "144 ÷ 9", "119 ÷ 7"],
        orderedChoices: ["144 ÷ 9", "119 ÷ 7", "162 ÷ 9", "152 ÷ 8"],
        explanation: "答えはそれぞれ16、17、18、19なので、「144 ÷ 9、119 ÷ 7、162 ÷ 9、152 ÷ 8」の順です。"
        ),

        QuizQuestion(
        question: "158 ÷ 9 の答えはどれですか？",
        choices: [
        "17あまり4",
        "18あまり4",
        "16あまり5",
        "17あまり5"
        ],
        correctAnswerIndex: 3,
        explanation: "9 × 17 = 153で、158 - 153 = 5なので、158 ÷ 9 は「17あまり5」です。"
        ),

        QuizQuestion(
        question: "3,705,284の十万の位の数字はどれですか？",
        choices: [
        "7",
        "0",
        "3",
        "5"
        ],
        correctAnswerIndex: 0,
        explanation: "3,705,284の十万の位の数字は「7」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】800万と60万と2万と900と30と5を合わせた数は ＿＿ です。",
        answer: "8620935",
        acceptableAnswers: ["8,620,935", "８，６２０，９３５", "８６２０９３５"],
        explanation: "8,000,000 + 600,000 + 20,000 + 900 + 30 + 5 = 8,620,935なので、＿＿に入る数は「8,620,935」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】4つの数を、小さい順に並べましょう。",
        choices: ["2,940,080", "2,904,800", "2,940,008", "2,904,080"],
        orderedChoices: ["2,904,080", "2,904,800", "2,940,008", "2,940,080"],
        explanation: "小さい順に「2,904,080、2,904,800、2,940,008、2,940,080」です。"
        ),

        QuizQuestion(
        question: "4.7 + 1.8 はいくつですか？",
        choices: [
        "6.4",
        "6.5",
        "5.15",
        "5.5"
        ],
        correctAnswerIndex: 1,
        explanation: "4.7 + 1.8 は 6.5 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】9.0 - 4.7 = ＿＿ に入る数を答えましょう。",
        answer: "4.3",
        acceptableAnswers: ["４．３"],
        explanation: "9.0 - 4.7 は 4.3 なので、＿＿に入る数は「4.3」です。"
        ),

        QuizQuestion(
        question: "3.9より0.6小さい数はどれですか？",
        choices: [
        "3.3",
        "2.3",
        "4.5",
        "3.5"
        ],
        correctAnswerIndex: 0,
        explanation: "3.9 - 0.6 = 3.3なので、正解は「3.3」です。"
        ),

        QuizQuestion(
        question: "3/10 + 4/10 はいくつですか？",
        choices: [
        "7/20",
        "7/10",
        "1/10",
        "6/10"
        ],
        correctAnswerIndex: 1,
        explanation: "分母が同じなので分子を足します。3/10 + 4/10 = 7/10です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】8/11 - 3/11 = ＿＿ に入る分数を答えましょう。",
        answer: "5/11",
        acceptableAnswers: ["11分の5", "５／１１", "5／11"],
        explanation: "分母が同じなので分子を引きます。8/11 - 3/11 = 5/11なので、＿＿に入る分数は「5/11」です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】分母が8の分数を、小さい順に並べましょう。",
        choices: ["6/8", "1/8", "7/8", "3/8"],
        orderedChoices: ["1/8", "3/8", "6/8", "7/8"],
        explanation: "分母が同じ分数は分子が小さいほど小さいので、「1/8、3/8、6/8、7/8」の順です。"
        ),

        QuizQuestion(
        question: "7kg80gは何gですか？",
        choices: [
        "7080g",
        "7008g",
        "780g",
        "7800g"
        ],
        correctAnswerIndex: 0,
        explanation: "7kgは7000gなので、7000 + 80 = 7080より「7080g」です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】それぞれの荷物の重さを、同じ重さのg表記と組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "2kg320g", match: "2320g"),
        QuizMatchingPair(prompt: "4kg9g", match: "4009g"),
        QuizMatchingPair(prompt: "1kg700g", match: "1700g"),
        QuizMatchingPair(prompt: "3kg60g", match: "3060g")
        ],
        choices: ["4009g", "1700g", "3060g", "2320g"],
        explanation: "2kg320gは2320g、4kg9gは4009g、1kg700gは1700g、3kg60gは3060gです。"
        ),

        QuizQuestion(
        question: "4kg180gの荷物と2kg950gの荷物を合わせると、何kg何gですか？",
        choices: [
        "6kg130g",
        "7kg30g",
        "7kg130g",
        "6kg230g"
        ],
        correctAnswerIndex: 2,
        explanation: "4kg180gは4180g、2kg950gは2950gです。4180 + 2950 = 7130gなので、「7kg130g」です。"
        ),

        QuizQuestion(
        question: "直径が42cmの円の半径は何cmですか？",
        choices: [
        "84cm",
        "20cm",
        "42cm",
        "21cm"
        ],
        correctAnswerIndex: 3,
        explanation: "半径は直径の半分なので、42 ÷ 2 = 21より「21cm」です。"
        ),

        QuizQuestion(
        question: "半径が18cmの円の直径は何cmですか？",
        choices: [
        "54cm",
        "9cm",
        "36cm",
        "18cm"
        ],
        correctAnswerIndex: 2,
        explanation: "直径は半径の2倍なので、18 × 2 = 36より「36cm」です。"
        ),

        QuizQuestion(
        question: "半径が15cmの球の直径は何cmですか？",
        choices: [
        "30cm",
        "15cm",
        "7.5cm",
        "45cm"
        ],
        correctAnswerIndex: 0,
        explanation: "球の直径は半径の2倍なので、15 × 2 = 30より「30cm」です。"
        ),

        QuizQuestion(
        question: "1目盛りが7冊を表す棒グラフで、棒が8目盛りまでのびています。何冊を表していますか？",
        choices: [
        "64冊",
        "56冊",
        "15冊",
        "49冊"
        ],
        correctAnswerIndex: 1,
        explanation: "1目盛りが7冊で8目盛りあるので、7 × 8 = 56より「56冊」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】水曜日に運んだ箱は、月曜日より何箱多いですか？",
        answer: "12",
        acceptableAnswers: ["１２"],
        referenceTitle: "運んだ箱の数（■1こ＝3箱）",
        referenceRows: [
        QuizReferenceRow(label: "月曜日", value: "■■■■"),
        QuizReferenceRow(label: "火曜日", value: "■■■■■■"),
        QuizReferenceRow(label: "水曜日", value: "■■■■■■■■"),
        QuizReferenceRow(label: "木曜日", value: "■■■■■")
        ],
        explanation: "月曜日は12箱、水曜日は24箱なので、24 - 12 = 12より「12箱」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】赤組と青組が集めた空きびんを、1箱に10本ずつ入れます。全部で何箱になりますか？",
        answer: "9",
        acceptableAnswers: ["９"],
        referenceTitle: "集めた空きびん（■1こ＝5本）",
        referenceRows: [
        QuizReferenceRow(label: "赤組", value: "■■■■■■■■"),
        QuizReferenceRow(label: "青組", value: "■■■■■■■■■■"),
        QuizReferenceRow(label: "黄組", value: "■■■■■■"),
        QuizReferenceRow(label: "緑組", value: "■■■■■■■")
        ],
        explanation: "赤組は40本、青組は50本なので、合わせて90本です。90 ÷ 10 = 9より「9箱」です。"
        ),

        QuizQuestion(
        question: "1袋にビー玉が14個ずつ入っています。6袋では全部で何個ですか？",
        choices: [
        "74個",
        "96個",
        "80個",
        "84個"
        ],
        correctAnswerIndex: 3,
        explanation: "14 × 6 = 84なので、全部で「84個」です。"
        ),

        QuizQuestion(
        question: "135本の鉛筆を5人で同じ本数ずつ分けます。1人分は何本ですか？",
        choices: [
        "26本",
        "27本",
        "25本",
        "30本"
        ],
        correctAnswerIndex: 1,
        explanation: "135 ÷ 5 = 27なので、1人分は「27本」です。"
        ),

        QuizQuestion(
        question: "1台に32人乗れるバスが3台あります。78人が乗ると、空いている席は全部でいくつですか？",
        choices: [
        "16席",
        "14席",
        "20席",
        "18席"
        ],
        correctAnswerIndex: 3,
        explanation: "全部の席は32 × 3 = 96席です。96 - 78 = 18なので、空いている席は「18席」です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1冊185円のノートを2冊と、1本90円のペンを3本買い、800円を出しました。おつりは ＿＿ 円です。",
        answer: "160",
        acceptableAnswers: ["１６０"],
        explanation: "ノートは185 × 2 = 370円、ペンは90 × 3 = 270円です。代金は370 + 270 = 640円なので、800 - 640 = 160より、＿＿に入る数は「160」です。"
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
