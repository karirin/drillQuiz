//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Sansu1ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "3 + 2 はいくつですか？",
            choices: [
                "4",
                "5",
                "6",
                "7"
            ],
            correctAnswerIndex: 1,
            explanation: "3に2を足すと5になります。"
        ),
        QuizQuestion(
            question: "7 - 3 はいくつですか？",
            choices: [
                "2",
                "3",
                "4",
                "5"
            ],
            correctAnswerIndex: 2,
            explanation: "7から3を引くと4になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　5, 2, 8, 4",
            choices: [
                "2, 4, 5, 8",
                "8, 5, 4, 2",
                "5, 2, 8, 4",
                "4, 2, 8, 5"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 4, 5, 8の順に並べるのが正しいです。"
        ),

        QuizQuestion(
            question: "5 + 4 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "11"
            ],
            correctAnswerIndex: 1,
            explanation: "5に4を足すと9になります。"
        ),
        QuizQuestion(
            question: "6 - 2 はいくつですか？",
            choices: [
                "2",
                "3",
                "4",
                "5"
            ],
            correctAnswerIndex: 2,
            explanation: "6から2を引くと4になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　3, 7, 1, 9",
            choices: [
                "1, 3, 7, 9",
                "9, 7, 3, 1",
                "3, 1, 9, 7",
                "7, 9, 3, 1"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 3, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "8 + 1 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "10"
            ],
            correctAnswerIndex: 2,
            explanation: "8に1を足すと9になります。"
        ),
        QuizQuestion(
            question: "10 - 4 はいくつですか？",
            choices: [
                "5",
                "6",
                "7",
                "8"
            ],
            correctAnswerIndex: 1,
            explanation: "10から4を引くと6になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　10, 3, 6, 2",
            choices: [
                "2, 3, 6, 10",
                "10, 6, 3, 2",
                "3, 2, 10, 6",
                "6, 10, 2, 3"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 3, 6, 10の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "4 + 3 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 1,
            explanation: "4に3を足すと7になります。"
        ),
        QuizQuestion(
            question: "9 - 5 はいくつですか？",
            choices: [
                "3",
                "4",
                "5",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "9から5を引くと4になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　6, 1, 4, 8",
            choices: [
                "1, 4, 6, 8",
                "8, 6, 4, 1",
                "6, 1, 8, 4",
                "4, 6, 1, 8"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 4, 6, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "7 + 2 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "11"
            ],
            correctAnswerIndex: 1,
            explanation: "7に2を足すと9になります。"
        ),
        QuizQuestion(
            question: "8 - 3 はいくつですか？",
            choices: [
                "4",
                "5",
                "6",
                "7"
            ],
            correctAnswerIndex: 1,
            explanation: "8から3を引くと5になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　7, 2, 5, 9",
            choices: [
                "2, 5, 7, 9",
                "9, 7, 5, 2",
                "5, 2, 9, 7",
                "7, 9, 5, 2"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 5, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "6 + 2 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "10"
            ],
            correctAnswerIndex: 1,
            explanation: "6に2を足すと8になります。"
        ),
        QuizQuestion(
            question: "10 - 6 はいくつですか？",
            choices: [
                "3",
                "4",
                "5",
                "6"
            ],
            correctAnswerIndex: 1,
            explanation: "10から6を引くと4になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　9, 3, 7, 5",
            choices: [
                "3, 5, 7, 9",
                "9, 7, 5, 3",
                "5, 3, 9, 7",
                "7, 9, 3, 5"
            ],
            correctAnswerIndex: 0,
            explanation: "3, 5, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "5 + 3 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "10"
            ],
            correctAnswerIndex: 1,
            explanation: "5に3を足すと8になります。"
        ),
        QuizQuestion(
            question: "7 - 2 はいくつですか？",
            choices: [
                "3",
                "4",
                "5",
                "6"
            ],
            correctAnswerIndex: 2,
            explanation: "7から2を引くと5になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　8, 2, 6, 4",
            choices: [
                "2, 4, 6, 8",
                "8, 6, 4, 2",
                "4, 2, 8, 6",
                "6, 8, 2, 4"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 4, 6, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "8 + 3 はいくつですか？",
            choices: [
                "10",
                "11",
                "12",
                "13"
            ],
            correctAnswerIndex: 1,
            explanation: "8に3を足すと11になります。"
        ),
        QuizQuestion(
            question: "9 - 4 はいくつですか？",
            choices: [
                "4",
                "5",
                "6",
                "7"
            ],
            correctAnswerIndex: 1,
            explanation: "9から4を引くと5になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　4, 7, 1, 5",
            choices: [
                "1, 4, 5, 7",
                "7, 5, 4, 1",
                "5, 1, 7, 4",
                "4, 7, 1, 5"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 4, 5, 7の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "10 + 2 はいくつですか？",
            choices: [
                "11",
                "12",
                "13",
                "14"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "10に2を足すと12になります。"
        ),
        QuizQuestion(
            question: "6 - 1 はいくつですか？",
            choices: [
                "4",
                "5",
                "6",
                "7"
            ],
            correctAnswerIndex: 1,
            explanation: "6から1を引くと5になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　3, 6, 9, 2",
            choices: [
                "2, 3, 6, 9",
                "9, 6, 3, 2",
                "6, 9, 2, 3",
                "3, 2, 9, 6"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 3, 6, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "7 + 5 はいくつですか？",
            choices: [
                "11",
                "12",
                "13",
                "14"
            ],
            correctAnswerIndex: 1,
            explanation: "7に5を足すと12になります。"
        ),
        QuizQuestion(
            question: "8 - 2 はいくつですか？",
            choices: [
                "5",
                "6",
                "7",
                "8"
            ],
            correctAnswerIndex: 1,
            explanation: "8から2を引くと6になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　3, 9, 1, 6",
            choices: [
                "1, 3, 6, 9",
                "9, 6, 3, 1",
                "3, 6, 1, 9",
                "6, 9, 1, 3"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 3, 6, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "6 + 4 はいくつですか？",
            choices: [
                "9",
                "10",
                "11",
                "12"
            ],
            correctAnswerIndex: 1,
            explanation: "6に4を足すと10になります。"
        ),
        QuizQuestion(
            question: "5 - 3 はいくつですか？",
            choices: [
                "1",
                "2",
                "3",
                "4"
            ],
            correctAnswerIndex: 1,
            explanation: "5から3を引くと2になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　5, 7, 2, 8",
            choices: [
                "2, 5, 7, 8",
                "8, 7, 5, 2",
                "5, 2, 8, 7",
                "7, 8, 5, 2"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 5, 7, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "9 + 4 はいくつですか？",
            choices: [
                "12",
                "13",
                "14",
                "15"
            ],
            correctAnswerIndex: 1,
            explanation: "9に4を足すと13になります。"
        ),
        QuizQuestion(
            question: "10 - 7 はいくつですか？",
            choices: [
                "2",
                "3",
                "4",
                "5"
            ],
            correctAnswerIndex: 1,
            explanation: "10から7を引くと3になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　6, 4, 9, 1",
            choices: [
                "1, 4, 6, 9",
                "9, 6, 4, 1",
                "6, 1, 9, 4",
                "4, 9, 1, 6"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 4, 6, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "3 + 6 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "11"
            ],
            correctAnswerIndex: 1,
            explanation: "3に6を足すと9になります。"
        ),
        QuizQuestion(
            question: "12 - 5 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 1,
            explanation: "12から5を引くと7になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　8, 3, 7, 5",
            choices: [
                "3, 5, 7, 8",
                "8, 7, 5, 3",
                "5, 3, 8, 7",
                "7, 8, 3, 5"
            ],
            correctAnswerIndex: 0,
            explanation: "3, 5, 7, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "6 + 7 はいくつですか？",
            choices: [
                "12",
                "13",
                "14",
                "15"
            ],
            correctAnswerIndex: 1,
            explanation: "6に7を足すと13になります。"
        ),
        QuizQuestion(
            question: "15 - 8 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 1,
            explanation: "15から8を引くと7になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　2, 8, 1, 5",
            choices: [
                "1, 2, 5, 8",
                "8, 5, 2, 1",
                "2, 1, 8, 5",
                "5, 8, 1, 2"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 2, 5, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "9 + 5 はいくつですか？",
            choices: [
                "13",
                "14",
                "15",
                "16"
            ],
            correctAnswerIndex: 1,
            explanation: "9に5を足すと14になります。"
        ),
        QuizQuestion(
            question: "18 - 9 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "11"
            ],
            correctAnswerIndex: 1,
            explanation: "18から9を引くと9になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　7, 3, 6, 9",
            choices: [
                "3, 6, 7, 9",
                "9, 7, 6, 3",
                "7, 9, 3, 6",
                "6, 9, 7, 3"
            ],
            correctAnswerIndex: 0,
            explanation: "3, 6, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "5 + 6 はいくつですか？",
            choices: [
                "10",
                "11",
                "12",
                "13"
            ],
            correctAnswerIndex: 1,
            explanation: "5に6を足すと11になります。"
        ),
        QuizQuestion(
            question: "14 - 7 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 1,
            explanation: "14から7を引くと7になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　3, 7, 2, 9",
            choices: [
                "2, 3, 7, 9",
                "9, 7, 3, 2",
                "3, 9, 7, 2",
                "7, 2, 9, 3"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 3, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "12 + 4 はいくつですか？",
            choices: [
                "15",
                "16",
                "17",
                "18"
            ],
            correctAnswerIndex: 1,
            explanation: "12に4を足すと16になります。"
        ),
        QuizQuestion(
            question: "20 - 5 はいくつですか？",
            choices: [
                "14",
                "15",
                "16",
                "17"
            ],
            correctAnswerIndex: 1,
            explanation: "20から5を引くと15になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　4, 1, 6, 3",
            choices: [
                "1, 3, 4, 6",
                "6, 4, 3, 1",
                "4, 6, 1, 3",
                "3, 6, 1, 4"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 3, 4, 6の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "11 + 3 はいくつですか？",
            choices: [
                "13",
                "14",
                "15",
                "16"
            ],
            correctAnswerIndex: 1,
            explanation: "11に3を足すと14になります。"
        ),
        QuizQuestion(
            question: "16 - 8 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 2,
            explanation: "16から8を引くと8になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　5, 2, 7, 4",
            choices: [
                "2, 4, 5, 7",
                "7, 5, 4, 2",
                "5, 2, 7, 4",
                "4, 7, 2, 5"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 4, 5, 7の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "9 + 7 はいくつですか？",
            choices: [
                "15",
                "16",
                "17",
                "18"
            ],
            correctAnswerIndex: 1,
            explanation: "9に7を足すと16になります。"
        ),
        QuizQuestion(
            question: "13 - 6 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 1,
            explanation: "13から6を引くと7になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　6, 3, 8, 1",
            choices: [
                "1, 3, 6, 8",
                "8, 6, 3, 1",
                "3, 1, 8, 6",
                "6, 8, 1, 3"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 3, 6, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "4 + 7 はいくつですか？",
            choices: [
                "10",
                "11",
                "12",
                "13"
            ],
            correctAnswerIndex: 1,
            explanation: "4に7を足すと11になります。"
        ),
        QuizQuestion(
            question: "18 - 9 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 3,
            explanation: "18から9を引くと9になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　5, 3, 8, 2",
            choices: [
                "8, 5, 3, 2",
                "5, 8, 2, 3",
                "2, 3, 5, 8",
                "3, 2, 8, 5"
            ],
            correctAnswerIndex: 2,
            explanation: "2, 3, 5, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "7 + 5 はいくつですか？",
            choices: [
                "12",
                "13",
                "14",
                "11"
            ],
            correctAnswerIndex: 0,
            explanation: "7に5を足すと12になります。"
        ),
        QuizQuestion(
            question: "20 - 12 はいくつですか？",
            choices: [
                "6",
                "7",
                "8",
                "9"
            ],
            correctAnswerIndex: 2,
            explanation: "20から12を引くと8になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　9, 1, 7, 4",
            choices: [
                "1, 4, 7, 9",
                "9, 7, 4, 1",
                "4, 9, 1, 7",
                "7, 1, 4, 9"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 4, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "8 + 4 はいくつですか？",
            choices: [
                "11",
                "12",
                "13",
                "14"
            ],
            correctAnswerIndex: 1,
            explanation: "8に4を足すと12になります。"
        ),
        QuizQuestion(
            question: "17 - 8 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "11"
            ],
            correctAnswerIndex: 1,
            explanation: "17から8を引くと9になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　6, 3, 9, 1",
            choices: [
                "1, 3, 6, 9",
                "9, 6, 3, 1",
                "6, 1, 9, 3",
                "3, 9, 1, 6"
            ],
            correctAnswerIndex: 0,
            explanation: "1, 3, 6, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "5 + 6 はいくつですか？",
            choices: [
                "10",
                "11",
                "12",
                "13"
            ],
            correctAnswerIndex: 1,
            explanation: "5に6を足すと11になります。"
        ),
        QuizQuestion(
            question: "19 - 7 はいくつですか？",
            choices: [
                "11",
                "12",
                "13",
                "14"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "19から7を引くと12になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　4, 7, 2, 5",
            choices: [
                "7, 5, 4, 2",
                "2, 4, 5, 7",
                "5, 7, 2, 4",
                "4, 7, 5, 2"
            ],
            correctAnswerIndex: 1,
            explanation: "2, 4, 5, 7の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "7 + 3 はいくつですか？",
            choices: [
                "9",
                "10",
                "11",
                "12"
            ],
            correctAnswerIndex: 1,
            explanation: "7に3を足すと10になります。"
        ),
        QuizQuestion(
            question: "15 - 6 はいくつですか？",
            choices: [
                "7",
                "8",
                "9",
                "10"
            ],
            correctAnswerIndex: 2,
            explanation: "15から6を引くと9になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　8, 4, 2, 6",
            choices: [
                "4, 6, 2, 8",
                "2, 4, 6, 8",
                "8, 2, 4, 6",
                "6, 8, 2, 4"
            ],
            correctAnswerIndex: 1,
            explanation: "2, 4, 6, 8の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "12 + 5 はいくつですか？",
            choices: [
                "16",
                "17",
                "18",
                "19"
            ],
            correctAnswerIndex: 1,
            explanation: "12に5を足すと17になります。"
        ),
        QuizQuestion(
            question: "20 - 11 はいくつですか？",
            choices: [
                "8",
                "9",
                "10",
                "11"
            ],
            correctAnswerIndex: 1,
            explanation: "20から11を引くと9になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　3, 7, 5, 9",
            choices: [
                "7, 9, 5, 3",
                "5, 7, 9, 3",
                "3, 5, 7, 9",
                "9, 7, 3, 5"
            ],
            correctAnswerIndex: 2,
            explanation: "3, 5, 7, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "6 + 8 はいくつですか？",
            choices: [
                "12",
                "13",
                "14",
                "15"
            ],
            correctAnswerIndex: 2,
            explanation: "6に8を足すと14になります。"
        ),
        QuizQuestion(
            question: "18 - 7 はいくつですか？",
            choices: [
                "9",
                "10",
                "11",
                "12"
            ],
            correctAnswerIndex: 2, // 修正: 元は1でしたが、正解は2
            explanation: "18から7を引くと11になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　9, 2, 6, 3",
            choices: [
                "2, 3, 6, 9",
                "9, 6, 3, 2",
                "6, 2, 9, 3",
                "3, 9, 2, 6"
            ],
            correctAnswerIndex: 0,
            explanation: "2, 3, 6, 9の順に並べるのが正しいです。"
        ),
        QuizQuestion(
            question: "7 + 4 はいくつですか？",
            choices: [
                "11",
                "10",
                "12",
                "13"
            ],
            correctAnswerIndex: 0,
            explanation: "7に4を足すと11になります。"
        ),
        QuizQuestion(
            question: "22 - 13 はいくつですか？",
            choices: [
                "9",
                "8",
                "10",
                "11"
            ],
            correctAnswerIndex: 0,
            explanation: "22から13を引くと9になります。"
        ),
        QuizQuestion(
            question: "次の数字を順番に並べ替えましょう\n　　　　　　4, 7, 1, 5",
            choices: [
                "7, 5, 4, 1",
                "1, 4, 5, 7",
                "5, 7, 1, 4",
                "4, 1, 7, 5"
            ],
            correctAnswerIndex: 1,
            explanation: "1, 4, 5, 7の順に並べるのが正しいです。"
        ),

        QuizQuestion(
                question: "14と11では、どちらが大きいですか？",
                choices: [
                    "14",
                    "同じ大きさ",
                    "11",
                    "くらべられない"
                ],
                correctAnswerIndex: 0,
                explanation: "14は11より3大きいので、正解は『14』です。"
            ),
            QuizQuestion(
                question: "つぎのうち、いちばん小さい数はどれですか？",
                choices: [
                    "12",
                    "9",
                    "16",
                    "18"
                ],
                correctAnswerIndex: 1,
                explanation: "9は16、12、18より小さいので、いちばん小さい数は9です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】13より大きく、15より小さい数は ＿＿ です。",
                answer: "14",
                acceptableAnswers: ["１４"],
                explanation: "13と15の間にある数は14です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】数を小さい順に並べましょう。",
                choices: ["18", "7", "12", "15"],
                rankedChoices: ["7", "12", "15", "18"],
                explanation: "小さい順に並べると、7、12、15、18です。"
            ),
            QuizQuestion(
                question: "1 + 6 はいくつですか？",
                choices: [
                    "9",
                    "6",
                    "7",
                    "8"
                ],
                correctAnswerIndex: 2,
                explanation: "1に6を足すと7になります。"
            ),
            QuizQuestion(
                question: "9 + 9 はいくつですか？",
                choices: [
                    "19",
                    "18",
                    "16",
                    "17"
                ],
                correctAnswerIndex: 1,
                explanation: "9に9を足すと18になります。"
            ),
            QuizQuestion(
                question: "＿＿ + 8 = 13です。＿＿に入る数はどれですか？",
                choices: [
                    "4",
                    "7",
                    "6",
                    "5"
                ],
                correctAnswerIndex: 3,
                explanation: "5に8を足すと13になるので、＿＿に入る数は5です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】2 + 4 = ＿＿",
                answer: "6",
                acceptableAnswers: ["６"],
                explanation: "2に4を足すと6になります。"
            ),
            QuizQuestion(
                question: "11 - 2 はいくつですか？",
                choices: [
                    "9",
                    "10",
                    "8",
                    "11"
                ],
                correctAnswerIndex: 0,
                explanation: "11から2を引くと9になります。"
            ),
            QuizQuestion(
                question: "13 - 4 はいくつですか？",
                choices: [
                    "7",
                    "8",
                    "9",
                    "10"
                ],
                correctAnswerIndex: 2,
                explanation: "13から4を引くと9になります。"
            ),
            QuizQuestion(
                question: "15 - ＿＿ = 8です。＿＿に入る数はどれですか？",
                choices: [
                    "7",
                    "8",
                    "6",
                    "5"
                ],
                correctAnswerIndex: 0,
                explanation: "15から7を引くと8になるので、＿＿に入る数は7です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】9 - 6 = ＿＿",
                answer: "3",
                acceptableAnswers: ["３"],
                explanation: "9から6を引くと3になります。"
            ),
            QuizQuestion(
                question: "時計の短い針が4、長い針が12をさしています。何時ですか？",
                choices: [
                    "4時半",
                    "4時",
                    "12時",
                    "8時"
                ],
                correctAnswerIndex: 1,
                explanation: "長い針が12で、短い針が4をさしているので、4時です。"
            ),
            QuizQuestion(
                question: "時計の短い針が7と8の間、長い針が6をさしています。何時ですか？",
                choices: [
                    "8時",
                    "7時",
                    "7時半",
                    "6時半"
                ],
                correctAnswerIndex: 2,
                explanation: "長い針が6をさすと30分です。短い針が7と8の間にあるので、7時半です。"
            ),
            QuizQuestion(
                question: "2時の1時間後は何時ですか？",
                choices: [
                    "2時半",
                    "4時",
                    "1時",
                    "3時"
                ],
                correctAnswerIndex: 3,
                explanation: "2時から1時間たつと3時になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】午前9時から1時間たつと、午前 ＿＿ 時です。",
                answer: "10",
                acceptableAnswers: ["１０"],
                explanation: "午前9時から1時間たつと、午前10時です。"
            ),
            QuizQuestion(
                question: "12cmのえんぴつは、8cmのクレヨンより何cm長いですか？",
                choices: [
                    "3cm",
                    "4cm",
                    "2cm",
                    "5cm"
                ],
                correctAnswerIndex: 1,
                explanation: "12cmから8cmを引くと4cmなので、えんぴつのほうが4cm長いです。"
            ),
            QuizQuestion(
                question: "つぎのうち、いちばん長いものはどれですか？",
                choices: [
                    "6cmのひも",
                    "11cmのひも",
                    "9cmのひも",
                    "14cmのひも"
                ],
                correctAnswerIndex: 3,
                explanation: "14cmは9cm、11cm、6cmより長いので、14cmのひもがいちばん長いです。"
            ),
            QuizQuestion(
                question: "7cmのテープと6cmのテープを、重ならないようにつなぎました。ぜんぶで何cmですか？",
                choices: [
                    "14cm",
                    "15cm",
                    "13cm",
                    "12cm"
                ],
                correctAnswerIndex: 2,
                explanation: "7cmと6cmを足すと13cmなので、ぜんぶで13cmです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】ものさしの0cmから8cmまでの長さは ＿＿ cmです。",
                answer: "8",
                acceptableAnswers: ["８"],
                explanation: "0cmから8cmまでの長さは8cmです。"
            ),
            QuizQuestion(
                question: "かどが3つある形はどれですか？",
                choices: [
                    "さんかく",
                    "まる",
                    "ほし",
                    "だえん"
                ],
                correctAnswerIndex: 0,
                explanation: "さんかくには、かどが3つあります。"
            ),
            QuizQuestion(
                question: "どの向きにもころがりやすい形はどれですか？",
                choices: [
                    "はこ",
                    "つつ",
                    "ボール",
                    "さいころ"
                ],
                correctAnswerIndex: 2,
                explanation: "ボールは丸い面でできているので、どの向きにもころがりやすい形です。"
            ),
            QuizQuestion(
                question: "4つの辺がすべて同じ長さで、かどが4つある形はどれですか？",
                choices: [
                    "まる",
                    "せいほうけい",
                    "さんかく",
                    "ちょうほうけい"
                ],
                correctAnswerIndex: 1,
                explanation: "せいほうけいは、4つの辺がすべて同じ長さで、かどが4つあります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】さんかくの辺は ＿＿ 本あります。",
                answer: "3",
                acceptableAnswers: ["３"],
                explanation: "さんかくの辺は3本あります。"
            ),
            QuizQuestion(
                question: "6人が1列に並んでいます。前から4番目の人は、後ろから何番目ですか？",
                choices: [
                    "5番目",
                    "2番目",
                    "4番目",
                    "3番目"
                ],
                correctAnswerIndex: 3,
                explanation: "前から4番目の人の後ろには2人いるので、後ろから3番目です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】朝からはじまる1日の時間の順に並べましょう。",
                choices: ["夜", "朝", "夕方", "昼"],
                orderedChoices: ["朝", "昼", "夕方", "夜"],
                explanation: "朝からはじまる順に並べると、朝、昼、夕方、夜です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】月曜日からはじまるように、曜日を順に並べましょう。",
                choices: ["木曜日", "火曜日", "月曜日", "水曜日"],
                orderedChoices: ["月曜日", "火曜日", "水曜日", "木曜日"],
                explanation: "月曜日、火曜日、水曜日、木曜日の順です。"
            ),
            QuizQuestion(
                question: "赤い花が6本、白い花が3本あります。花はぜんぶで何本ありますか？",
                choices: [
                    "8本",
                    "7本",
                    "9本",
                    "10本"
                ],
                correctAnswerIndex: 2,
                explanation: "6本と3本を足すと9本なので、花はぜんぶで9本です。"
            ),
            QuizQuestion(
                question: "あめが12こあります。4こ食べました。のこりは何こですか？",
                choices: [
                    "8こ",
                    "7こ",
                    "9こ",
                    "6こ"
                ],
                correctAnswerIndex: 0,
                explanation: "12こから4こを引くと8こなので、のこりは8こです。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】みきはカードを8まい、けんは6まい、ゆうたは5まい、さきは3まい持っています。カードが多い順に名前を並べましょう。",
                choices: ["ゆうた", "みき", "さき", "けん"],
                rankedChoices: ["みき", "けん", "ゆうた", "さき"],
                explanation: "8まいのみき、6まいのけん、5まいのゆうた、3まいのさきの順です。"
            ),
            QuizQuestion(
                question: "18と16では、どちらが小さいですか？",
                choices: [
                    "16",
                    "18",
                    "同じ大きさ",
                    "くらべられない"
                ],
                correctAnswerIndex: 0,
                explanation: "16は18より2小さいので、正解は「16」です。"
            ),
            QuizQuestion(
                question: "つぎのうち、いちばん大きい数はどれですか？",
                choices: [
                    "15",
                    "20",
                    "13",
                    "17"
                ],
                correctAnswerIndex: 1,
                explanation: "20は13、17、15より大きいので、いちばん大きい数は20です。"
            ),
            QuizQuestion(
                question: "11より大きく、16より小さい数はどれですか？",
                choices: [
                    "17",
                    "10",
                    "14",
                    "16"
                ],
                correctAnswerIndex: 2,
                explanation: "14は11より大きく、16より小さい数です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】数を大きい順に並べましょう。",
                choices: ["6", "19", "11", "14"],
                rankedChoices: ["19", "14", "11", "6"],
                explanation: "大きい順に並べると、19、14、11、6です。"
            ),
            QuizQuestion(
                question: "2 + 5 はいくつですか？",
                choices: [
                    "7",
                    "6",
                    "8",
                    "5"
                ],
                correctAnswerIndex: 0,
                explanation: "2に5を足すと7になります。"
            ),
            QuizQuestion(
                question: "4 + 4 はいくつですか？",
                choices: [
                    "9",
                    "8",
                    "6",
                    "7"
                ],
                correctAnswerIndex: 1,
                explanation: "4に4を足すと8になります。"
            ),
            QuizQuestion(
                question: "6 + ＿＿ = 15です。＿＿に入る数はどれですか？",
                choices: [
                    "8",
                    "7",
                    "10",
                    "9"
                ],
                correctAnswerIndex: 3,
                explanation: "6に9を足すと15になるので、＿＿に入る数は9です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】7 + 7 = ＿＿",
                answer: "14",
                acceptableAnswers: ["１４"],
                explanation: "7に7を足すと14になります。"
            ),
            QuizQuestion(
                question: "18 - 6 はいくつですか？",
                choices: [
                    "11",
                    "13",
                    "12",
                    "10"
                ],
                correctAnswerIndex: 2,
                explanation: "18から6を引くと12になります。"
            ),
            QuizQuestion(
                question: "17 - ＿＿ = 10です。＿＿に入る数はどれですか？",
                choices: [
                    "7",
                    "5",
                    "8",
                    "6"
                ],
                correctAnswerIndex: 0,
                explanation: "17から7を引くと10になるので、＿＿に入る数は7です。"
            ),
            QuizQuestion(
                question: "14 - 5 はいくつですか？",
                choices: [
                    "10",
                    "8",
                    "7",
                    "9"
                ],
                correctAnswerIndex: 3,
                explanation: "14から5を引くと9になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】16 - 9 = ＿＿",
                answer: "7",
                acceptableAnswers: ["７"],
                explanation: "16から9を引くと7になります。"
            ),
            QuizQuestion(
                question: "時計の短い針が10、長い針が12をさしています。何時ですか？",
                choices: [
                    "12時",
                    "2時",
                    "10時",
                    "10時半"
                ],
                correctAnswerIndex: 2,
                explanation: "長い針が12で、短い針が10をさしているので、10時です。"
            ),
            QuizQuestion(
                question: "時計の短い針が1と2の間、長い針が6をさしています。何時ですか？",
                choices: [
                    "1時",
                    "1時半",
                    "2時半",
                    "6時"
                ],
                correctAnswerIndex: 1,
                explanation: "長い針が6をさすと30分です。短い針が1と2の間にあるので、1時半です。"
            ),
            QuizQuestion(
                question: "6時の1時間前は何時ですか？",
                choices: [
                    "4時",
                    "5時",
                    "7時",
                    "6時半"
                ],
                correctAnswerIndex: 1,
                explanation: "6時より1時間前は5時です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】長い針が6、短い針が2と3の間をさす時刻は ＿＿ 時半です。",
                answer: "2",
                acceptableAnswers: ["２"],
                explanation: "長い針が6をさすと30分です。短い針が2と3の間にあるので、2時半です。"
            ),
            QuizQuestion(
                question: "6cmより3cm長いリボンの長さは何cmですか？",
                choices: [
                    "8cm",
                    "10cm",
                    "9cm",
                    "3cm"
                ],
                correctAnswerIndex: 2,
                explanation: "6cmに3cmを足すと9cmなので、リボンの長さは9cmです。"
            ),
            QuizQuestion(
                question: "つぎのうち、いちばん短いものはどれですか？",
                choices: [
                    "16cmのひも",
                    "14cmのひも",
                    "11cmのひも",
                    "7cmのひも"
                ],
                correctAnswerIndex: 3,
                explanation: "7cmは11cm、16cm、14cmより短いので、7cmのひもがいちばん短いです。"
            ),
            QuizQuestion(
                question: "ものさしの2cmのところから13cmのところまでの長さは何cmですか？",
                choices: [
                    "9cm",
                    "11cm",
                    "15cm",
                    "10cm"
                ],
                correctAnswerIndex: 1,
                explanation: "13cmから2cmを引くと11cmなので、長さは11cmです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】20cmのテープから6cm切ると、のこりは ＿＿ cmです。",
                answer: "14",
                acceptableAnswers: ["１４"],
                explanation: "20cmから6cmを引くと14cmなので、のこりは14cmです。"
            ),
            QuizQuestion(
                question: "まるい平らな面が2つあり、曲がった面が1つある形はどれですか？",
                choices: [
                    "はこ",
                    "ボール",
                    "つつ",
                    "さいころ"
                ],
                correctAnswerIndex: 2,
                explanation: "つつには、まるい平らな面が2つと、曲がった面が1つあります。"
            ),
            QuizQuestion(
                question: "かどが4つあり、たてとよこの長さがちがう四角い形はどれですか？",
                choices: [
                    "まる",
                    "さんかく",
                    "せいほうけい",
                    "ちょうほうけい"
                ],
                correctAnswerIndex: 3,
                explanation: "ちょうほうけいは、かどが4つあり、たてとよこの長さがちがう四角い形です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】まるのかどは ＿＿ こです。",
                answer: "0",
                acceptableAnswers: ["０"],
                explanation: "まるにはかどがないので、かどは0こです。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】かどの数が少ない順に並べましょう。",
                choices: ["しかく", "ごかくけい", "まる", "さんかく"],
                orderedChoices: ["まる", "さんかく", "しかく", "ごかくけい"],
                explanation: "かどの数は、まるが0こ、さんかくが3こ、しかくが4こ、ごかくけいが5こです。"
            ),
            QuizQuestion(
                question: "8人が1列に並んでいます。前から3番目の人は、後ろから何番目ですか？",
                choices: [
                    "7番目",
                    "5番目",
                    "4番目",
                    "6番目"
                ],
                correctAnswerIndex: 3,
                explanation: "前から3番目の人の後ろには5人いるので、後ろから6番目です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】赤は1番目、黄は2番目、白は3番目、青は4番目です。1番目から順に並べましょう。",
                choices: ["白", "青", "赤", "黄"],
                orderedChoices: ["赤", "黄", "白", "青"],
                explanation: "1番目から順に並べると、赤、黄、白、青です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】かけっこで、りくは1着、ゆいは2着、そらは3着、はなは4着でした。早くゴールした順に並べましょう。",
                choices: ["そら", "はな", "りく", "ゆい"],
                rankedChoices: ["りく", "ゆい", "そら", "はな"],
                explanation: "早くゴールした順に並べると、りく、ゆい、そら、はなです。"
            ),
            QuizQuestion(
                question: "赤いボールが13こ、青いボールが9こあります。赤いボールは青いボールより何こ多いですか？",
                choices: [
                    "4こ",
                    "3こ",
                    "5こ",
                    "2こ"
                ],
                correctAnswerIndex: 0,
                explanation: "13こから9こを引くと4こなので、赤いボールは青いボールより4こ多いです。"
            ),
            QuizQuestion(
                question: "シールが18まいあります。6まい使い、そのあと3まい使いました。のこりは何まいですか？",
                choices: [
                    "12まい",
                    "9まい",
                    "10まい",
                    "8まい"
                ],
                correctAnswerIndex: 1,
                explanation: "18まいから6まいを引くと12まいです。さらに3まいを引くと9まいなので、のこりは9まいです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】いすが7こ、子どもが10人います。みんなが1こずつすわるには、いすがあと ＿＿ こいります。",
                answer: "3",
                acceptableAnswers: ["３"],
                explanation: "10人からいす7こを引くと3なので、いすはあと3こいります。"
            ),
            QuizQuestion(
                question: "8、15、4、12のうち、10より大きい数はいくつありますか？",
                choices: [
                    "3こ",
                    "1こ",
                    "4こ",
                    "2こ"
                ],
                correctAnswerIndex: 3,
                explanation: "10より大きい数は15と12の2つなので、正解は「2こ」です。"
            ),
            QuizQuestion(
                question: "17より1小さい数はどれですか？",
                choices: [
                    "16",
                    "15",
                    "18",
                    "17"
                ],
                correctAnswerIndex: 0,
                explanation: "17から1を引くと16なので、正解は「16」です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】12より3大きい数は ＿＿ です。",
                answer: "15",
                acceptableAnswers: ["１５"],
                explanation: "12に3を足すと15なので、12より3大きい数は15です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】数を小さい順に並べましょう。",
                choices: ["13", "2", "17", "10"],
                rankedChoices: ["2", "10", "13", "17"],
                explanation: "小さい順に並べると、2、10、13、17です。"
            ),
            QuizQuestion(
                question: "2 + 8 はいくつですか？",
                choices: [
                    "8",
                    "11",
                    "9",
                    "10"
                ],
                correctAnswerIndex: 3,
                explanation: "2に8を足すと10になります。"
            ),
            QuizQuestion(
                question: "5 + 5 はいくつですか？",
                choices: [
                    "9",
                    "11",
                    "10",
                    "7"
                ],
                correctAnswerIndex: 2,
                explanation: "5に5を足すと10になります。"
            ),
            QuizQuestion(
                question: "4 + ＿＿ = 13です。＿＿に入る数はどれですか？",
                choices: [
                    "9",
                    "10",
                    "8",
                    "7"
                ],
                correctAnswerIndex: 0,
                explanation: "4に9を足すと13になるので、＿＿に入る数は9です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】10 + 7 = ＿＿",
                answer: "17",
                acceptableAnswers: ["１７"],
                explanation: "10に7を足すと17になります。"
            ),
            QuizQuestion(
                question: "10 - 3 はいくつですか？",
                choices: [
                    "7",
                    "6",
                    "9",
                    "8"
                ],
                correctAnswerIndex: 0,
                explanation: "10から3を引くと7になります。"
            ),
            QuizQuestion(
                question: "12 - 8 はいくつですか？",
                choices: [
                    "2",
                    "3",
                    "4",
                    "5"
                ],
                correctAnswerIndex: 2,
                explanation: "12から8を引くと4になります。"
            ),
            QuizQuestion(
                question: "19 - 9 はいくつですか？",
                choices: [
                    "10",
                    "9",
                    "8",
                    "7"
                ],
                correctAnswerIndex: 0,
                explanation: "19から9を引くと10になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】13 - 8 = ＿＿",
                answer: "5",
                acceptableAnswers: ["５"],
                explanation: "13から8を引くと5になります。"
            ),
            QuizQuestion(
                question: "時計の短い針が5、長い針が12をさしています。何時ですか？",
                choices: [
                    "5時半",
                    "12時",
                    "5時",
                    "7時"
                ],
                correctAnswerIndex: 2,
                explanation: "長い針が12で、短い針が5をさしているので、5時です。"
            ),
            QuizQuestion(
                question: "時計の短い針が8と9の間、長い針が6をさしています。何時ですか？",
                choices: [
                    "8時",
                    "8時半",
                    "9時半",
                    "6時"
                ],
                correctAnswerIndex: 1,
                explanation: "長い針が6をさすと30分です。短い針が8と9の間にあるので、8時半です。"
            ),
            QuizQuestion(
                question: "3時半の30分後は何時ですか？",
                choices: [
                    "3時半",
                    "3時",
                    "4時",
                    "4時半"
                ],
                correctAnswerIndex: 2,
                explanation: "3時半から30分たつと4時になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】午後1時から2時間たつと、午後 ＿＿ 時です。",
                answer: "3",
                acceptableAnswers: ["３"],
                explanation: "午後1時から2時間たつと、午後3時です。"
            ),
            QuizQuestion(
                question: "15cmのえんぴつは、9cmのクレヨンより何cm長いですか？",
                choices: [
                    "3cm",
                    "6cm",
                    "5cm",
                    "4cm"
                ],
                correctAnswerIndex: 1,
                explanation: "15cmから9cmを引くと6cmなので、えんぴつのほうが6cm長いです。"
            ),
            QuizQuestion(
                question: "5cmのテープと8cmのテープを、重ならないようにつなぎました。ぜんぶで何cmですか？",
                choices: [
                    "12cm",
                    "14cm",
                    "15cm",
                    "13cm"
                ],
                correctAnswerIndex: 3,
                explanation: "5cmと8cmを足すと13cmなので、ぜんぶで13cmです。"
            ),
            QuizQuestion(
                question: "ものさしの4cmのところから12cmのところまでの長さは何cmですか？",
                choices: [
                    "8cm",
                    "16cm",
                    "7cm",
                    "12cm"
                ],
                correctAnswerIndex: 0,
                explanation: "12cmから4cmを引くと8cmなので、長さは8cmです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】11cmのリボンに4cmのリボンをつなぐと、ぜんぶで ＿＿ cmです。",
                answer: "15",
                acceptableAnswers: ["１５"],
                explanation: "11cmと4cmを足すと15cmなので、ぜんぶで15cmです。"
            ),
            QuizQuestion(
                question: "ボールの平らな面は、いくつありますか？",
                choices: [
                    "2つ",
                    "1つ",
                    "ありません",
                    "3つ"
                ],
                correctAnswerIndex: 2,
                explanation: "ボールには平らな面がないので、正解は「ありません」です。"
            ),
            QuizQuestion(
                question: "細長いつつを立てて真横から見ると、どの形に見えますか？",
                choices: [
                    "さんかく",
                    "まる",
                    "せいほうけい",
                    "ちょうほうけい"
                ],
                correctAnswerIndex: 3,
                explanation: "細長いつつを立てて真横から見ると、ちょうほうけいに見えます。"
            ),
            QuizQuestion(
                question: "辺が4本ある形はどれですか？",
                choices: [
                    "しかく",
                    "さんかく",
                    "ボール",
                    "まる"
                ],
                correctAnswerIndex: 0,
                explanation: "しかくには辺が4本あります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】さいころのかどは ＿＿ こあります。",
                answer: "8",
                acceptableAnswers: ["８"],
                explanation: "さいころには、かどが8こあります。"
            ),
            QuizQuestion(
                question: "9人が1列に並んでいます。前から6番目の人は、後ろから何番目ですか？",
                choices: [
                    "6番目",
                    "4番目",
                    "3番目",
                    "5番目"
                ],
                correctAnswerIndex: 1,
                explanation: "前から6番目の人の後ろには3人いるので、後ろから4番目です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】旗は左から、白、青、赤、黄の順です。左から順に並べましょう。",
                choices: ["赤", "白", "黄", "青"],
                orderedChoices: ["白", "青", "赤", "黄"],
                explanation: "左から順に並べると、白、青、赤、黄です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】はじめに本を出し、つぎにページを開き、そのあと本を読み、さいごに本をしまいます。行う順に並べましょう。",
                choices: ["本をしまう", "ページを開く", "本を出す", "本を読む"],
                orderedChoices: ["本を出す", "ページを開く", "本を読む", "本をしまう"],
                explanation: "行う順に並べると、本を出す、ページを開く、本を読む、本をしまうです。"
            ),
            QuizQuestion(
                question: "ひよこが7わいます。あとから8わやってきました。ひよこはぜんぶで何わになりましたか？",
                choices: [
                    "14わ",
                    "16わ",
                    "15わ",
                    "13わ"
                ],
                correctAnswerIndex: 2,
                explanation: "7わと8わを足すと15わなので、ひよこはぜんぶで15わです。"
            ),
            QuizQuestion(
                question: "どんぐりが17こあります。5こ使ったあと、2こもらいました。どんぐりは今、何こありますか？",
                choices: [
                    "11こ",
                    "13こ",
                    "12こ",
                    "14こ"
                ],
                correctAnswerIndex: 3,
                explanation: "17こから5こを引くと12こです。そこに2こを足すと14こなので、今は14こあります。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】みほは9さつ、なおは11さつ、あきらは12さつ、けいは15さつの本を読みました。読んだ本が少ない順に名前を並べましょう。",
                choices: ["あきら", "みほ", "けい", "なお"],
                rankedChoices: ["みほ", "なお", "あきら", "けい"],
                explanation: "9さつのみほ、11さつのなお、12さつのあきら、15さつのけいの順です。"
            ),
            QuizQuestion(
                question: "0と6では、どちらが大きいですか？",
                choices: [
                    "同じ大きさ",
                    "6",
                    "くらべられない",
                    "0"
                ],
                correctAnswerIndex: 1,
                explanation: "6は0より大きいので、正解は「6」です。"
            ),
            QuizQuestion(
                question: "10と20のちょうどまんなかの数はどれですか？",
                choices: [
                    "16",
                    "14",
                    "15",
                    "20"
                ],
                correctAnswerIndex: 2,
                explanation: "10から15までは5、15から20までも5なので、ちょうどまんなかの数は15です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】18のつぎの数は ＿＿ です。",
                answer: "19",
                acceptableAnswers: ["１９"],
                explanation: "18のつぎの数は19です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】数を大きい順に並べましょう。",
                choices: ["16", "4", "20", "9"],
                rankedChoices: ["20", "16", "9", "4"],
                explanation: "大きい順に並べると、20、16、9、4です。"
            ),
            QuizQuestion(
                question: "6 + 0 はいくつですか？",
                choices: [
                    "7",
                    "0",
                    "6",
                    "5"
                ],
                correctAnswerIndex: 2,
                explanation: "6に0を足しても数は変わらないので、答えは6です。"
            ),
            QuizQuestion(
                question: "10 + 5 はいくつですか？",
                choices: [
                    "14",
                    "15",
                    "13",
                    "16"
                ],
                correctAnswerIndex: 1,
                explanation: "10に5を足すと15になります。"
            ),
            QuizQuestion(
                question: "7 + ＿＿ = 16です。＿＿に入る数はどれですか？",
                choices: [
                    "8",
                    "7",
                    "9",
                    "10"
                ],
                correctAnswerIndex: 2,
                explanation: "7に9を足すと16になるので、＿＿に入る数は9です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】8 + 8 = ＿＿",
                answer: "16",
                acceptableAnswers: ["１６"],
                explanation: "8に8を足すと16になります。"
            ),
            QuizQuestion(
                question: "8 - 1 はいくつですか？",
                choices: [
                    "9",
                    "7",
                    "8",
                    "6"
                ],
                correctAnswerIndex: 1,
                explanation: "8から1を引くと7になります。"
            ),
            QuizQuestion(
                question: "18 - 5 はいくつですか？",
                choices: [
                    "14",
                    "12",
                    "13",
                    "11"
                ],
                correctAnswerIndex: 2,
                explanation: "18から5を引くと13になります。"
            ),
            QuizQuestion(
                question: "＿＿ - 6 = 8です。＿＿に入る数はどれですか？",
                choices: [
                    "13",
                    "12",
                    "15",
                    "14"
                ],
                correctAnswerIndex: 3,
                explanation: "14から6を引くと8になるので、＿＿に入る数は14です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】20 - 3 = ＿＿",
                answer: "17",
                acceptableAnswers: ["１７"],
                explanation: "20から3を引くと17になります。"
            ),
            QuizQuestion(
                question: "時計の短い針が11、長い針が12をさしています。何時ですか？",
                choices: [
                    "11時半",
                    "12時",
                    "1時",
                    "11時"
                ],
                correctAnswerIndex: 3,
                explanation: "長い針が12で、短い針が11をさしているので、11時です。"
            ),
            QuizQuestion(
                question: "時計の短い針が6と7の間、長い針が6をさしています。何時ですか？",
                choices: [
                    "6時半",
                    "6時",
                    "12時半",
                    "7時半"
                ],
                correctAnswerIndex: 0,
                explanation: "長い針が6をさすと30分です。短い針が6と7の間にあるので、6時半です。"
            ),
            QuizQuestion(
                question: "午前8時半の30分前は何時ですか？",
                choices: [
                    "午前8時半",
                    "午前9時",
                    "午前8時",
                    "午前7時半"
                ],
                correctAnswerIndex: 2,
                explanation: "午前8時半から30分もどると、午前8時です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】午後4時から3時間たつと、午後 ＿＿ 時です。",
                answer: "7",
                acceptableAnswers: ["７"],
                explanation: "午後4時から3時間たつと、午後7時です。"
            ),
            QuizQuestion(
                question: "10cmより2cm短いリボンの長さは何cmですか？",
                choices: [
                    "8cm",
                    "10cm",
                    "2cm",
                    "12cm"
                ],
                correctAnswerIndex: 0,
                explanation: "10cmから2cmを引くと8cmなので、リボンの長さは8cmです。"
            ),
            QuizQuestion(
                question: "6cmのひもを2本、重ならないようにつなぎました。ぜんぶで何cmですか？",
                choices: [
                    "12cm",
                    "14cm",
                    "8cm",
                    "10cm"
                ],
                correctAnswerIndex: 0,
                explanation: "6cmと6cmを足すと12cmなので、ぜんぶで12cmです。"
            ),
            QuizQuestion(
                question: "18cmのテープから7cmと5cmを切りました。のこりは何cmですか？",
                choices: [
                    "7cm",
                    "5cm",
                    "8cm",
                    "6cm"
                ],
                correctAnswerIndex: 3,
                explanation: "18cmから7cmを引くと11cmです。さらに5cmを引くと6cmなので、のこりは6cmです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】9cmより5cm長いひもの長さは ＿＿ cmです。",
                answer: "14",
                acceptableAnswers: ["１４"],
                explanation: "9cmに5cmを足すと14cmなので、ひもの長さは14cmです。"
            ),
            QuizQuestion(
                question: "さいころの平らな面は、いくつありますか？",
                choices: [
                    "6つ",
                    "4つ",
                    "5つ",
                    "8つ"
                ],
                correctAnswerIndex: 0,
                explanation: "さいころには平らな面が6つあります。"
            ),
            QuizQuestion(
                question: "ちょうほうけいの向かい合う辺の長さは、どうなっていますか？",
                choices: [
                    "いつも長い",
                    "長さは決まらない",
                    "いつも短い",
                    "同じ長さ"
                ],
                correctAnswerIndex: 3,
                explanation: "ちょうほうけいでは、向かい合う辺の長さは同じです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】まる、さんかく、しかく、まるの中で、かどがある形は ＿＿ こです。",
                answer: "2",
                acceptableAnswers: ["２"],
                explanation: "かどがある形は、さんかくとしかくの2こです。"
            ),
            QuizQuestion(
                question: "左から、ねこ、いぬ、うさぎ、くまの順に並んでいます。右から2番目はどれですか？",
                choices: [
                    "いぬ",
                    "うさぎ",
                    "くま",
                    "ねこ"
                ],
                correctAnswerIndex: 1,
                explanation: "右から数えると、くまが1番目、うさぎが2番目なので、正解は「うさぎ」です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】手を洗うときの順に並べましょう。",
                choices: ["手をこする", "水で流す", "手を水でぬらす", "せっけんをつける"],
                orderedChoices: ["手を水でぬらす", "せっけんをつける", "手をこする", "水で流す"],
                explanation: "手を水でぬらす、せっけんをつける、手をこする、水で流すの順です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】あおは2こ、あかは5こ、きいろは1こ、みどりは4このつみきを積みました。つみきが少ない順に色を並べましょう。",
                choices: ["あか", "あお", "みどり", "きいろ"],
                rankedChoices: ["きいろ", "あお", "みどり", "あか"],
                explanation: "1このきいろ、2このあお、4このみどり、5このあかの順です。"
            ),
            QuizQuestion(
                question: "池にあひるが5わいます。あとから7わやってきました。あひるはぜんぶで何わになりましたか？",
                choices: [
                    "12わ",
                    "11わ",
                    "14わ",
                    "13わ"
                ],
                correctAnswerIndex: 0,
                explanation: "5わと7わを足すと12わなので、あひるはぜんぶで12わです。"
            ),
            QuizQuestion(
                question: "色紙が16まいあります。7まい使いました。のこりは何まいですか？",
                choices: [
                    "9まい",
                    "8まい",
                    "7まい",
                    "10まい"
                ],
                correctAnswerIndex: 0,
                explanation: "16まいから7まいを引くと9まいなので、のこりは9まいです。"
            ),
            QuizQuestion(
                question: "赤いえんぴつが11本、青いえんぴつが6本あります。青いえんぴつは赤いえんぴつより何本少ないですか？",
                choices: [
                    "6本",
                    "3本",
                    "4本",
                    "5本"
                ],
                correctAnswerIndex: 3,
                explanation: "11本から6本を引くと5本なので、青いえんぴつは赤いえんぴつより5本少ないです。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】おはじきが7こあり、3こもらい、そのあと2こ使いました。答えを出すまでの考え方を順に並べましょう。",
                choices: ["答えは8こ", "10こから2こをひく", "7こに3こをたす", "10こになる"],
                orderedChoices: ["7こに3こをたす", "10こになる", "10こから2こをひく", "答えは8こ"],
                explanation: "7こに3こを足して10こにし、10こから2こを引くと、答えは8こです。"
            ),
            QuizQuestion(
                question: "19と12では、どちらが大きいですか？",
                choices: [
                    "19",
                    "同じ大きさ",
                    "くらべられない",
                    "12"
                ],
                correctAnswerIndex: 0,
                explanation: "19は12より大きいので、正解は「19」です。"
            ),
            QuizQuestion(
                question: "20にいちばん近い数はどれですか？",
                choices: [
                    "17",
                    "12",
                    "15",
                    "19"
                ],
                correctAnswerIndex: 3,
                explanation: "19は20より1小さい数なので、選択肢の中で20にいちばん近い数です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】20より4小さい数は ＿＿ です。",
                answer: "16",
                acceptableAnswers: ["１６"],
                explanation: "20から4を引くと16なので、20より4小さい数は16です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】数を大きい順に並べましょう。",
                choices: ["5", "17", "2", "11"],
                rankedChoices: ["17", "11", "5", "2"],
                explanation: "大きい順に並べると、17、11、5、2です。"
            ),
            QuizQuestion(
                question: "3 + 9 はいくつですか？",
                choices: [
                    "11",
                    "13",
                    "10",
                    "12"
                ],
                correctAnswerIndex: 3,
                explanation: "3に9を足すと12になります。"
            ),
            QuizQuestion(
                question: "6 + 6 はいくつですか？",
                choices: [
                    "10",
                    "13",
                    "12",
                    "11"
                ],
                correctAnswerIndex: 2,
                explanation: "6に6を足すと12になります。"
            ),
            QuizQuestion(
                question: "11 + 6 はいくつですか？",
                choices: [
                    "17",
                    "18",
                    "15",
                    "16"
                ],
                correctAnswerIndex: 0,
                explanation: "11に6を足すと17になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】12 + ＿＿ = 20",
                answer: "8",
                acceptableAnswers: ["８"],
                explanation: "12に8を足すと20になるので、＿＿に入る数は8です。"
            ),
            QuizQuestion(
                question: "14 - 8 はいくつですか？",
                choices: [
                    "5",
                    "6",
                    "7",
                    "8"
                ],
                correctAnswerIndex: 1,
                explanation: "14から8を引くと6になります。"
            ),
            QuizQuestion(
                question: "17 - 9 はいくつですか？",
                choices: [
                    "9",
                    "7",
                    "6",
                    "8"
                ],
                correctAnswerIndex: 3,
                explanation: "17から9を引くと8になります。"
            ),
            QuizQuestion(
                question: "20 - 13 はいくつですか？",
                choices: [
                    "6",
                    "4",
                    "5",
                    "7"
                ],
                correctAnswerIndex: 3,
                explanation: "20から13を引くと7になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】＿＿ - 5 = 12",
                answer: "17",
                acceptableAnswers: ["１７"],
                explanation: "17から5を引くと12になるので、＿＿に入る数は17です。"
            ),
            QuizQuestion(
                question: "時計の短い針が3と4の間、長い針が6をさしています。何時ですか？",
                choices: [
                    "4時半",
                    "3時半",
                    "3時",
                    "6時半"
                ],
                correctAnswerIndex: 1,
                explanation: "長い針が6をさすと30分です。短い針が3と4の間にあるので、3時半です。"
            ),
            QuizQuestion(
                question: "9時半の30分後は何時ですか？",
                choices: [
                    "10時",
                    "10時半",
                    "8時半",
                    "9時"
                ],
                correctAnswerIndex: 0,
                explanation: "9時半から30分たつと10時になります。"
            ),
            QuizQuestion(
                question: "12時の2時間後は何時ですか？",
                choices: [
                    "2時",
                    "1時",
                    "10時",
                    "12時半"
                ],
                correctAnswerIndex: 0,
                explanation: "12時から2時間たつと2時になります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】午前7時の1時間前は、午前 ＿＿ 時です。",
                answer: "6",
                acceptableAnswers: ["６"],
                explanation: "午前7時より1時間前は、午前6時です。"
            ),
            QuizQuestion(
                question: "16cmのひもは、13cmのひもより何cm長いですか？",
                choices: [
                    "2cm",
                    "3cm",
                    "6cm",
                    "4cm"
                ],
                correctAnswerIndex: 1,
                explanation: "16cmから13cmを引くと3cmなので、16cmのひものほうが3cm長いです。"
            ),
            QuizQuestion(
                question: "ものさしの5cmのところから14cmのところまでの長さは何cmですか？",
                choices: [
                    "9cm",
                    "14cm",
                    "19cm",
                    "8cm"
                ],
                correctAnswerIndex: 0,
                explanation: "14cmから5cmを引くと9cmなので、長さは9cmです。"
            ),
            QuizQuestion(
                question: "4cmのリボンを3本、重ならないようにつなぎました。ぜんぶで何cmですか？",
                choices: [
                    "7cm",
                    "8cm",
                    "12cm",
                    "16cm"
                ],
                correctAnswerIndex: 2,
                explanation: "4cmを3回足すと、4 + 4 + 4 = 12なので、ぜんぶで12cmです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】17cmのテープから9cm切ると、のこりは ＿＿ cmです。",
                answer: "8",
                acceptableAnswers: ["８"],
                explanation: "17cmから9cmを引くと8cmなので、のこりは8cmです。"
            ),
            QuizQuestion(
                question: "さいころを真上から見ると、どの形に見えますか？",
                choices: [
                    "まる",
                    "せいほうけい",
                    "ちょうほうけい",
                    "さんかく"
                ],
                correctAnswerIndex: 1,
                explanation: "さいころの面はせいほうけいなので、真上から見るとせいほうけいに見えます。"
            ),
            QuizQuestion(
                question: "同じ大きさのせいほうけいを横に2つ並べると、外側はどの形になりますか？",
                choices: [
                    "まる",
                    "さんかく",
                    "せいほうけい",
                    "ちょうほうけい"
                ],
                correctAnswerIndex: 3,
                explanation: "同じ大きさのせいほうけいを横に2つ並べると、外側は横長のちょうほうけいになります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】さいころの辺は ＿＿ 本あります。",
                answer: "12",
                acceptableAnswers: ["１２"],
                explanation: "さいころの辺は12本あります。"
            ),
            QuizQuestion(
                question: "7人が1列に並んでいます。前から2番目の人は、後ろから何番目ですか？",
                choices: [
                    "2番目",
                    "7番目",
                    "5番目",
                    "6番目"
                ],
                correctAnswerIndex: 3,
                explanation: "前から2番目の人の後ろには5人いるので、後ろから6番目です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】えんぴつを使って字を書くときの順に並べましょう。",
                choices: ["字を書く", "えんぴつを筆箱にもどす", "筆箱を開ける", "えんぴつを取り出す"],
                orderedChoices: ["筆箱を開ける", "えんぴつを取り出す", "字を書く", "えんぴつを筆箱にもどす"],
                explanation: "筆箱を開ける、えんぴつを取り出す、字を書く、えんぴつを筆箱にもどすの順です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】整理券の番号が、こうたは1番、れんは2番、みなは3番、さやは4番です。先に呼ばれる順に並べましょう。",
                choices: ["みな", "さや", "こうた", "れん"],
                rankedChoices: ["こうた", "れん", "みな", "さや"],
                explanation: "整理券の番号が小さい人から呼ばれるので、こうた、れん、みな、さやの順です。"
            ),
            QuizQuestion(
                question: "赤い風船が9こ、黄色い風船が6こあります。風船はぜんぶで何こありますか？",
                choices: [
                    "13こ",
                    "15こ",
                    "16こ",
                    "14こ"
                ],
                correctAnswerIndex: 1,
                explanation: "9こと6こを足すと15こなので、風船はぜんぶで15こです。"
            ),
            QuizQuestion(
                question: "クッキーが18まいあります。4まい友だちにあげました。のこりは何まいですか？",
                choices: [
                    "12まい",
                    "14まい",
                    "13まい",
                    "15まい"
                ],
                correctAnswerIndex: 1,
                explanation: "18まいから4まいを引くと14まいなので、のこりは14まいです。"
            ),
            QuizQuestion(
                question: "赤いえんぴつが13本、青いえんぴつが7本あります。赤いえんぴつは青いえんぴつより何本多いですか？",
                choices: [
                    "6本",
                    "3本",
                    "4本",
                    "5本"
                ],
                correctAnswerIndex: 0,
                explanation: "13本から7本を引くと6本なので、赤いえんぴつは青いえんぴつより6本多いです。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】かごにみかんが4こあります。3こ入れ、そのあと2こ取り出しました。みかんの数のうつり変わりを順に並べましょう。",
                choices: ["5こになる", "2こ取り出す", "4こある", "7こになる"],
                orderedChoices: ["4こある", "7こになる", "2こ取り出す", "5こになる"],
                explanation: "はじめに4こあり、3こ入れると7こになります。そのあと2こ取り出すと5こになります。"
            ),
            QuizQuestion(
                question: "13と18では、どちらが小さいですか？",
                choices: [
                    "18",
                    "同じ大きさ",
                    "くらべられない",
                    "13"
                ],
                correctAnswerIndex: 3,
                explanation: "13は18より小さいので、正解は「13」です。"
            ),
            QuizQuestion(
                question: "6、14、9、17のうち、10より小さい数はいくつありますか？",
                choices: [
                    "1こ",
                    "4こ",
                    "3こ",
                    "2こ"
                ],
                correctAnswerIndex: 3,
                explanation: "10より小さい数は6と9の2つなので、正解は「2こ」です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】9より大きく、11より小さい数は ＿＿ です。",
                answer: "10",
                acceptableAnswers: ["１０"],
                explanation: "9と11の間にある数は10です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】数を小さい順に並べましょう。",
                choices: ["14", "3", "18", "7"],
                rankedChoices: ["3", "7", "14", "18"],
                explanation: "小さい順に並べると、3、7、14、18です。"
            ),
            QuizQuestion(
                question: "1 + 7 はいくつですか？",
                choices: [
                    "7",
                    "8",
                    "10",
                    "9"
                ],
                correctAnswerIndex: 1,
                explanation: "1に7を足すと8になります。"
            ),
            QuizQuestion(
                question: "2 + 9 はいくつですか？",
                choices: [
                    "9",
                    "12",
                    "11",
                    "10"
                ],
                correctAnswerIndex: 2,
                explanation: "2に9を足すと11になります。"
            ),
            QuizQuestion(
                question: "＿＿ + 6 = 16です。＿＿に入る数はどれですか？",
                choices: [
                    "9",
                    "11",
                    "10",
                    "8"
                ],
                correctAnswerIndex: 2,
                explanation: "10に6を足すと16になるので、＿＿に入る数は10です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】1 + 9 = ＿＿",
                answer: "10",
                acceptableAnswers: ["１０"],
                explanation: "1に9を足すと10になります。"
            ),
            QuizQuestion(
                question: "9 - 2 はいくつですか？",
                choices: [
                    "6",
                    "7",
                    "9",
                    "8"
                ],
                correctAnswerIndex: 1,
                explanation: "9から2を引くと7になります。"
            ),
            QuizQuestion(
                question: "16 - 7 はいくつですか？",
                choices: [
                    "9",
                    "7",
                    "8",
                    "10"
                ],
                correctAnswerIndex: 0,
                explanation: "16から7を引くと9になります。"
            ),
            QuizQuestion(
                question: "＿＿ - 3 = 14です。＿＿に入る数はどれですか？",
                choices: [
                    "16",
                    "15",
                    "17",
                    "18"
                ],
                correctAnswerIndex: 2,
                explanation: "17から3を引くと14になるので、＿＿に入る数は17です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】18 - 8 = ＿＿",
                answer: "10",
                acceptableAnswers: ["１０"],
                explanation: "18から8を引くと10になります。"
            ),
            QuizQuestion(
                question: "時計の短い針が9、長い針が12をさしています。何時ですか？",
                choices: [
                    "12時",
                    "9時半",
                    "3時",
                    "9時"
                ],
                correctAnswerIndex: 3,
                explanation: "長い針が12で、短い針が9をさしているので、9時です。"
            ),
            QuizQuestion(
                question: "時計の短い針が11と12の間、長い針が6をさしています。何時ですか？",
                choices: [
                    "11時半",
                    "11時",
                    "6時",
                    "12時半"
                ],
                correctAnswerIndex: 0,
                explanation: "長い針が6をさすと30分です。短い針が11と12の間にあるので、11時半です。"
            ),
            QuizQuestion(
                question: "午後2時の2時間後は何時ですか？",
                choices: [
                    "午後2時半",
                    "午後5時",
                    "午後4時",
                    "午後3時"
                ],
                correctAnswerIndex: 2,
                explanation: "午後2時から2時間たつと、午後4時です。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】午前10時半の30分後は、午前 ＿＿ 時です。",
                answer: "11",
                acceptableAnswers: ["１１"],
                explanation: "午前10時半から30分たつと、午前11時です。"
            ),
            QuizQuestion(
                question: "13cmより5cm短いリボンの長さは何cmですか？",
                choices: [
                    "5cm",
                    "8cm",
                    "10cm",
                    "18cm"
                ],
                correctAnswerIndex: 1,
                explanation: "13cmから5cmを引くと8cmなので、リボンの長さは8cmです。"
            ),
            QuizQuestion(
                question: "2cmのテープと11cmのテープを、重ならないようにつなぎました。ぜんぶで何cmですか？",
                choices: [
                    "14cm",
                    "9cm",
                    "11cm",
                    "13cm"
                ],
                correctAnswerIndex: 3,
                explanation: "2cmと11cmを足すと13cmなので、ぜんぶで13cmです。"
            ),
            QuizQuestion(
                question: "ものさしの6cmのところから14cmのところまでの長さは何cmですか？",
                choices: [
                    "14cm",
                    "20cm",
                    "8cm",
                    "7cm"
                ],
                correctAnswerIndex: 2,
                explanation: "14cmから6cmを引くと8cmなので、長さは8cmです。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】19cmのひもから6cm切ると、のこりは ＿＿ cmです。",
                answer: "13",
                acceptableAnswers: ["１３"],
                explanation: "19cmから6cmを引くと13cmなので、のこりは13cmです。"
            ),
            QuizQuestion(
                question: "かどがなく、曲がった線でできている平らな形はどれですか？",
                choices: [
                    "さんかく",
                    "しかく",
                    "せいほうけい",
                    "まる"
                ],
                correctAnswerIndex: 3,
                explanation: "まるにはかどがなく、曲がった線でできています。"
            ),
            QuizQuestion(
                question: "つつを真上から見ると、どの形に見えますか？",
                choices: [
                    "さんかく",
                    "まる",
                    "ちょうほうけい",
                    "せいほうけい"
                ],
                correctAnswerIndex: 1,
                explanation: "つつの上の平らな面はまるいので、真上から見るとまるに見えます。"
            ),
            QuizQuestion(
                question: "しかくのかどは、いくつありますか？",
                choices: [
                    "0こ",
                    "5こ",
                    "4こ",
                    "3こ"
                ],
                correctAnswerIndex: 2,
                explanation: "しかくには、かどが4こあります。"
            ),
            QuizQuestion.fillInBlank(
                question: "【穴うめ】せいほうけいの辺は ＿＿ 本あります。",
                answer: "4",
                acceptableAnswers: ["４"],
                explanation: "せいほうけいの辺は4本あります。"
            ),
            QuizQuestion(
                question: "10人が1列に並んでいます。前から7番目の人は、後ろから何番目ですか？",
                choices: [
                    "4番目",
                    "7番目",
                    "3番目",
                    "5番目"
                ],
                correctAnswerIndex: 0,
                explanation: "前から7番目の人の後ろには3人いるので、後ろから4番目です。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】歯をみがくときの順に並べましょう。",
                choices: ["歯をみがく", "口をすすぐ", "歯ブラシを出す", "歯みがき粉をつける"],
                orderedChoices: ["歯ブラシを出す", "歯みがき粉をつける", "歯をみがく", "口をすすぐ"],
                explanation: "歯ブラシを出す、歯みがき粉をつける、歯をみがく、口をすすぐの順です。"
            ),
            QuizQuestion.ranking(
                question: "【ランキング】本だなで、図鑑は左から4番目、絵本は1番目、辞書は3番目、ノートは2番目です。左にある順に並べましょう。",
                choices: ["辞書", "図鑑", "絵本", "ノート"],
                rankedChoices: ["絵本", "ノート", "辞書", "図鑑"],
                explanation: "左から、絵本、ノート、辞書、図鑑の順です。"
            ),
            QuizQuestion(
                question: "バスに10人乗っています。次の停留所で3人乗りました。バスには何人乗っていますか？",
                choices: [
                    "14人",
                    "13人",
                    "11人",
                    "12人"
                ],
                correctAnswerIndex: 1,
                explanation: "10人と3人を足すと13人なので、バスには13人乗っています。"
            ),
            QuizQuestion(
                question: "赤い魚が12ひき、青い魚が3びきいます。赤い魚は青い魚より何びき多いですか？",
                choices: [
                    "8ぴき",
                    "9ひき",
                    "7ひき",
                    "6ぴき"
                ],
                correctAnswerIndex: 1,
                explanation: "12ひきから3びきを引くと9ひきなので、赤い魚は青い魚より9ひき多いです。"
            ),
            QuizQuestion.reorder(
                question: "【並べ替え】シールが16まいあります。5まい使い、そのあと4まいもらいました。答えを出すまでの考え方を順に並べましょう。",
                choices: ["11まいに4まいをたす", "答えは15まい", "16まいから5まいをひく", "11まいになる"],
                orderedChoices: ["16まいから5まいをひく", "11まいになる", "11まいに4まいをたす", "答えは15まい"],
                explanation: "16まいから5まいを引いて11まいにし、11まいに4まいを足すと、答えは15まいです。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .sansu1, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu1ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu1ListView(isPresenting: .constant(false))
    }
}
