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
        QuizQuestion(
            question: "72 ÷ 8 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "72 ÷ 8 は 9 です。"
        ),

        QuizQuestion(
            question: "6.1 + 2.9 はいくつですか？",
            choices: [
                "9.0",
                "8.9",
                "9.1",
                "8.8"
            ],
            correctAnswerIndex: 2,
            explanation: "6.1 + 2.9 は 9.0 です。"
        ),

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
                "3メートル",
                "30メートル",
                "0.3メートル",
                "300メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "300センチメートルは 3メートルです。"
        ),

        QuizQuestion(
            question: "56 ÷ 7 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "56 ÷ 7 は 8 です。"
        ),

        QuizQuestion(
            question: "3.3 + 1.9 はいくつですか？",
            choices: [
                "5.2",
                "5.3",
                "5.1",
                "5.0"
            ],
            correctAnswerIndex: 0,
            explanation: "3.3 + 1.9 は 5.2 です。"
        ),

        QuizQuestion(
            question: "500ミリメートルは何センチメートルですか？",
            choices: [
                "50センチメートル",
                "5センチメートル",
                "500センチメートル",
                "0.5センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "500ミリメートルは 50センチメートルです。"
        ),
        QuizQuestion(
            question: "63 ÷ 7 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "63 ÷ 7 は 9 です。"
        ),

        QuizQuestion(
            question: "4.4 + 2.6 はいくつですか？",
            choices: [
                "7.0",
                "6.8",
                "6.9",
                "7.1"
            ],
            correctAnswerIndex: 0,
            explanation: "4.4 + 2.6 は 7.0 です。"
        ),

        QuizQuestion(
            question: "400センチメートルは何メートルですか？",
            choices: [
                "0.4メートル",
                "4メートル",
                "40メートル",
                "400メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "400センチメートルは 4メートルです。"
        ),

        QuizQuestion(
            question: "81 ÷ 9 はいくつですか？",
            choices: [
                "10",
                "8",
                "9",
                "7"
            ],
            correctAnswerIndex: 2,
            explanation: "81 ÷ 9 は 9 です。"
        ),

        QuizQuestion(
            question: "3.6 + 1.4 はいくつですか？",
            choices: [
                "5.0",
                "4.9",
                "5.1",
                "4.8"
            ],
            correctAnswerIndex: 0,
            explanation: "3.6 + 1.4 は 5.0 です。"
        ),

        QuizQuestion(
            question: "1000ミリメートルは何センチメートルですか？",
            choices: [
                "10センチメートル",
                "100センチメートル",
                "1000センチメートル",
                "1センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "1000ミリメートルは 100センチメートルです。"
        ),

        QuizQuestion(
            question: "32 ÷ 4 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 2,
            explanation: "32 ÷ 4 は 8 です。"
        ),

        QuizQuestion(
            question: "5.5 - 2.1 はいくつですか？",
            choices: [
                "3.5",
                "3.3",
                "3.4",
                "3.2"
            ],
            correctAnswerIndex: 1,
            explanation: "5.5 - 2.1 は 3.4 です。"
        ),

        QuizQuestion(
            question: "50ミリメートルは何センチメートルですか？",
            choices: [
                "0.5センチメートル",
                "5センチメートル",
                "50センチメートル",
                "500センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "50ミリメートルは 5センチメートルです。"
        ),
        QuizQuestion(
            question: "28 ÷ 4 はいくつですか？",
            choices: [
                "7",
                "6",
                "8",
                "5"
            ],
            correctAnswerIndex: 0,
            explanation: "28 ÷ 4 は 7 です。"
        ),

        QuizQuestion(
            question: "6.2 + 3.3 はいくつですか？",
            choices: [
                "9.4",
                "9.5",
                "9.6",
                "9.3"
            ],
            correctAnswerIndex: 1,
            explanation: "6.2 + 3.3 は 9.5 です。"
        ),

        QuizQuestion(
            question: "600センチメートルは何メートルですか？",
            choices: [
                "6メートル",
                "60メートル",
                "0.6メートル",
                "600メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "600センチメートルは 6メートルです。"
        ),

        QuizQuestion(
            question: "36 ÷ 6 はいくつですか？",
            choices: [
                "5",
                "6",
                "7",
                "8"
            ],
            correctAnswerIndex: 1,
            explanation: "36 ÷ 6 は 6 です。"
        ),

        QuizQuestion(
            question: "2.8 + 4.1 はいくつですか？",
            choices: [
                "6.9",
                "6.8",
                "6.7",
                "7.0"
            ],
            correctAnswerIndex: 0,
            explanation: "2.8 + 4.1 は 6.9 です。"
        ),

        QuizQuestion(
            question: "750センチメートルは何メートルですか？",
            choices: [
                "7.5メートル",
                "75メートル",
                "0.75メートル",
                "750メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "750センチメートルは 7.5メートルです。"
        ),

        QuizQuestion(
            question: "64 ÷ 8 はいくつですか？",
            choices: [
                "9",
                "8",
                "7",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "64 ÷ 8 は 8 です。"
        ),

        QuizQuestion(
            question: "7.3 + 1.8 はいくつですか？",
            choices: [
                "9.0",
                "9.1",
                "9.2",
                "9.3"
            ],
            correctAnswerIndex: 1,
            explanation: "7.3 + 1.8 は 9.1 です。"
        ),

        QuizQuestion(
            question: "20ミリメートルは何センチメートルですか？",
            choices: [
                "2センチメートル",
                "0.2センチメートル",
                "20センチメートル",
                "200センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "20ミリメートルは 2センチメートルです。"
        ),
        QuizQuestion(
            question: "54 ÷ 6 はいくつですか？",
            choices: [
                "9",
                "8",
                "7",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "54 ÷ 6 は 9 です。"
        ),

        QuizQuestion(
            question: "5.6 + 3.9 はいくつですか？",
            choices: [
                "9.3",
                "9.5",
                "9.2",
                "9.1"
            ],
            correctAnswerIndex: 1,
            explanation: "5.6 + 3.9 は 9.5 です。"
        ),

        QuizQuestion(
            question: "900センチメートルは何メートルですか？",
            choices: [
                "90メートル",
                "9メートル",
                "0.9メートル",
                "900メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "900センチメートルは 9メートルです。"
        ),

        QuizQuestion(
            question: "48 ÷ 8 はいくつですか？",
            choices: [
                "6",
                "5",
                "7",
                "8"
            ],
            correctAnswerIndex: 0,
            explanation: "48 ÷ 8 は 6 です。"
        ),

        QuizQuestion(
            question: "3.7 + 2.6 はいくつですか？",
            choices: [
                "6.1",
                "6.2",
                "6.3",
                "6.0"
            ],
            correctAnswerIndex: 1,
            explanation: "3.7 + 2.6 は 6.3 です。"
        ),

        QuizQuestion(
            question: "1,000センチメートルは何メートルですか？",
            choices: [
                "10メートル",
                "100メートル",
                "0.1メートル",
                "1メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "1,000センチメートルは 10メートルです。"
        ),

        QuizQuestion(
            question: "27 ÷ 3 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "10"
            ],
            correctAnswerIndex: 2,
            explanation: "27 ÷ 3 は 9 です。"
        ),

        QuizQuestion(
            question: "4.8 + 1.7 はいくつですか？",
            choices: [
                "6.4",
                "6.5",
                "6.3",
                "6.6"
            ],
            correctAnswerIndex: 1,
            explanation: "4.8 + 1.7 は 6.5 です。"
        ),

        QuizQuestion(
            question: "30ミリメートルは何センチメートルですか？",
            choices: [
                "0.3センチメートル",
                "3センチメートル",
                "30センチメートル",
                "300センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "30ミリメートルは 3センチメートルです。"
        ),
        QuizQuestion(
            question: "36 ÷ 4 はいくつですか？",
            choices: [
                "9",
                "8",
                "7",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "36 ÷ 4 は 9 です。"
        ),

        QuizQuestion(
            question: "2.5 + 3.7 はいくつですか？",
            choices: [
                "6.1",
                "6.2",
                "6.3",
                "6.4"
            ],
            correctAnswerIndex: 1,
            explanation: "2.5 + 3.7 は 6.2 です。"
        ),

        QuizQuestion(
            question: "1500センチメートルは何メートルですか？",
            choices: [
                "1.5メートル",
                "15メートル",
                "0.15メートル",
                "150メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "1500センチメートルは 15メートルです。"
        ),

        QuizQuestion(
            question: "24 ÷ 3 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "24 ÷ 3 は 8 です。"
        ),

        QuizQuestion(
            question: "5.7 - 2.4 はいくつですか？",
            choices: [
                "3.3",
                "3.2",
                "3.4",
                "3.1"
            ],
            correctAnswerIndex: 0,
            explanation: "5.7 - 2.4 は 3.3 です。"
        ),

        QuizQuestion(
            question: "4000ミリメートルは何メートルですか？",
            choices: [
                "0.4メートル",
                "4メートル",
                "40メートル",
                "400メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "4000ミリメートルは 4メートルです。"
        ),

        QuizQuestion(
            question: "18 ÷ 2 はいくつですか？",
            choices: [
                "9",
                "8",
                "7",
                "6"
            ],
            correctAnswerIndex: 0,
            explanation: "18 ÷ 2 は 9 です。"
        ),

        QuizQuestion(
            question: "3.9 + 4.2 はいくつですか？",
            choices: [
                "7.9",
                "8.0",
                "8.1",
                "8.2"
            ],
            correctAnswerIndex: 2,
            explanation: "3.9 + 4.2 は 8.1 です。"
        ),

        QuizQuestion(
            question: "5ミリメートルは何センチメートルですか？",
            choices: [
                "0.5センチメートル",
                "5センチメートル",
                "0.05センチメートル",
                "50センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "5ミリメートルは 0.5センチメートルです。"
        ),
        QuizQuestion(
            question: "16 ÷ 2 はいくつですか？",
            choices: [
                "8",
                "7",
                "6",
                "9"
            ],
            correctAnswerIndex: 0,
            explanation: "16 ÷ 2 は 8 です。"
        ),

        QuizQuestion(
            question: "7.4 + 2.3 はいくつですか？",
            choices: [
                "9.5",
                "9.7",
                "9.8",
                "9.6"
            ],
            correctAnswerIndex: 1,
            explanation: "7.4 + 2.3 は 9.7 です。"
        ),

        QuizQuestion(
            question: "2,000センチメートルは何メートルですか？",
            choices: [
                "20メートル",
                "2メートル",
                "0.2メートル",
                "200メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "2,000センチメートルは 2メートルです。"
        ),

        QuizQuestion(
            question: "72 ÷ 9 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "72 ÷ 9 は 8 です。"
        ),

        QuizQuestion(
            question: "5.8 - 3.4 はいくつですか？",
            choices: [
                "2.4",
                "2.3",
                "2.5",
                "2.6"
            ],
            correctAnswerIndex: 0,
            explanation: "5.8 - 3.4 は 2.4 です。"
        ),

        QuizQuestion(
            question: "350センチメートルは何メートルですか？",
            choices: [
                "0.35メートル",
                "3.5メートル",
                "35メートル",
                "350メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "350センチメートルは 3.5メートルです。"
        ),

        QuizQuestion(
            question: "40 ÷ 5 はいくつですか？",
            choices: [
                "6",
                "8",
                "7",
                "9"
            ],
            correctAnswerIndex: 1,
            explanation: "40 ÷ 5 は 8 です。"
        ),

        QuizQuestion(
            question: "4.9 + 2.1 はいくつですか？",
            choices: [
                "7.0",
                "7.1",
                "7.2",
                "7.3"
            ],
            correctAnswerIndex: 0,
            explanation: "4.9 + 2.1 は 7.0 です。"
        ),

        QuizQuestion(
            question: "60ミリメートルは何センチメートルですか？",
            choices: [
                "0.6センチメートル",
                "6センチメートル",
                "60センチメートル",
                "600センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "60ミリメートルは 6センチメートルです。"
        ),
        QuizQuestion(
            question: "48 ÷ 6 はいくつですか？",
            choices: [
                "7",
                "6",
                "8",
                "9"
            ],
            correctAnswerIndex: 2,
            explanation: "48 ÷ 6 は 8 です。"
        ),

        QuizQuestion(
            question: "3.2 + 5.5 はいくつですか？",
            choices: [
                "8.7",
                "8.6",
                "8.8",
                "8.5"
            ],
            correctAnswerIndex: 0,
            explanation: "3.2 + 5.5 は 8.7 です。"
        ),

        QuizQuestion(
            question: "1,200センチメートルは何メートルですか？",
            choices: [
                "12メートル",
                "1.2メートル",
                "120メートル",
                "0.12メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "1,200センチメートルは 1.2メートルです。"
        ),

        QuizQuestion(
            question: "25 ÷ 5 はいくつですか？",
            choices: [
                "5",
                "4",
                "6",
                "7"
            ],
            correctAnswerIndex: 0,
            explanation: "25 ÷ 5 は 5 です。"
        ),

        QuizQuestion(
            question: "6.3 - 2.7 はいくつですか？",
            choices: [
                "3.5",
                "3.6",
                "3.7",
                "3.4"
            ],
            correctAnswerIndex: 1,
            explanation: "6.3 - 2.7 は 3.6 です。"
        ),

        QuizQuestion(
            question: "5,000ミリメートルは何メートルですか？",
            choices: [
                "50メートル",
                "5メートル",
                "0.5メートル",
                "500メートル"
            ],
            correctAnswerIndex: 1,
            explanation: "5,000ミリメートルは 5メートルです。"
        ),

        QuizQuestion(
            question: "27 ÷ 9 はいくつですか？",
            choices: [
                "4",
                "3",
                "2",
                "5"
            ],
            correctAnswerIndex: 1,
            explanation: "27 ÷ 9 は 3 です。"
        ),

        QuizQuestion(
            question: "7.8 + 1.9 はいくつですか？",
            choices: [
                "9.6",
                "9.5",
                "9.7",
                "9.4"
            ],
            correctAnswerIndex: 2,
            explanation: "7.8 + 1.9 は 9.7 です。"
        ),

        QuizQuestion(
            question: "90ミリメートルは何センチメートルですか？",
            choices: [
                "0.9センチメートル",
                "9センチメートル",
                "90センチメートル",
                "0.09センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "90ミリメートルは 9センチメートルです。"
        ),
        QuizQuestion(
            question: "64 ÷ 8 はいくつですか？",
            choices: [
                "7",
                "6",
                "8",
                "9"
            ],
            correctAnswerIndex: 2,
            explanation: "64 ÷ 8 は 8 です。"
        ),

        QuizQuestion(
            question: "2.9 + 6.4 はいくつですか？",
            choices: [
                "9.2",
                "9.1",
                "9.3",
                "9.4"
            ],
            correctAnswerIndex: 1,
            explanation: "2.9 + 6.4 は 9.3 です。"
        ),

        QuizQuestion(
            question: "3,500センチメートルは何メートルですか？",
            choices: [
                "3.5メートル",
                "35メートル",
                "0.35メートル",
                "350メートル"
            ],
            correctAnswerIndex: 0,
            explanation: "3,500センチメートルは 3.5メートルです。"
        ),

        QuizQuestion(
            question: "81 ÷ 9 はいくつですか？",
            choices: [
                "8",
                "9",
                "7",
                "10"
            ],
            correctAnswerIndex: 1,
            explanation: "81 ÷ 9 は 9 です。"
        ),

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
            correctAnswerIndex: 1,
            explanation: "4.7 + 3.2 は 8.0 です。"
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
