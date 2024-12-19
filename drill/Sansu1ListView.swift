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
            correctAnswerIndex: 2, // 修正: 元は0でしたが、正解は1
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
