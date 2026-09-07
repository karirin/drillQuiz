//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Sansu2ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "4 × 3 はいくつですか？",
            choices: [
                "9",
                "12",
                "16",
                "18"
            ],
            correctAnswerIndex: 1,
            explanation: "4 × 3 は 12 です。"
        ),

        QuizQuestion(
            question: "りんごが5個ありました。さらに3個買いました。りんごは全部で何個ですか？",
            choices: [
                "7個",
                "8個",
                "9個",
                "10個"
            ],
            correctAnswerIndex: 1,
            explanation: "5個と3個を足すと8個になります。"
        ),

        // 修正開始: 正解は「5時」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "時計が3時を指しています。あと2時間後は何時ですか？",
            choices: [
                "4時",
                "5時",
                "6時",
                "7時"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "3時に2時間足すと5時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "6 × 2 はいくつですか？",
            choices: [
                "8",
                "10",
                "12",
                "14"
            ],
            correctAnswerIndex: 2,
            explanation: "6 × 2 は 12 です。"
        ),

        QuizQuestion(
            question: "みかんが3個ありました。友達から4個もらいました。みかんは全部で何個ですか？",
            choices: [
                "6個",
                "7個",
                "8個",
                "9個"
            ],
            correctAnswerIndex: 1,
            explanation: "3個と4個を足すと7個になります。"
        ),

        // 修正開始: 正解は「8時」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "時計が5時を指しています。あと3時間後は何時ですか？",
            choices: [
                "7時",
                "8時",
                "9時",
                "10時"
            ],
            correctAnswerIndex: 1, // 修正: 元は3でしたが、正解は1
            explanation: "5時に3時間足すと8時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "7 × 3 はいくつですか？",
            choices: [
                "21",
                "24",
                "18",
                "28"
            ],
            correctAnswerIndex: 0,
            explanation: "7 × 3 は 21 です。"
        ),

        QuizQuestion(
            question: "9 × 4 はいくつですか？",
            choices: [
                "35",
                "36",
                "34",
                "30"
            ],
            correctAnswerIndex: 1,
            explanation: "9 × 4 は 36 です。"
        ),

        QuizQuestion(
            question: "ケーキが10個あります。友達が2個食べました。残りは何個ですか？",
            choices: [
                "6個",
                "7個",
                "8個",
                "9個"
            ],
            correctAnswerIndex: 2,
            explanation: "10個から2個を引くと8個残ります。"
        ),

        QuizQuestion(
            question: "たまごが6個ありました。さらに5個買いました。たまごは全部で何個ですか？",
            choices: [
                "9個",
                "10個",
                "11個",
                "12個"
            ],
            correctAnswerIndex: 2,
            explanation: "6個と5個を足すと11個になります。"
        ),

        QuizQuestion(
            question: "時計が9時を指しています。あと4時間後は何時ですか？",
            choices: [
                "12時",
                "1時",
                "2時",
                "3時"
            ],
            correctAnswerIndex: 1,
            explanation: "9時に4時間足すと1時になります。"
        ),

        QuizQuestion(
            question: "時計が6時を指しています。あと3時間後は何時ですか？",
            choices: [
                "7時",
                "8時",
                "9時",
                "10時"
            ],
            correctAnswerIndex: 2,
            explanation: "6時に3時間足すと9時になります。"
        ),

        QuizQuestion(
            question: "りんごが7個あります。3個食べました。残りは何個ですか？",
            choices: [
                "3個",
                "4個",
                "5個",
                "6個"
            ],
            correctAnswerIndex: 1,
            explanation: "7個から3個を引くと4個残ります。"
        ),
        QuizQuestion(
            question: "5 × 4 はいくつですか？",
            choices: [
                "15",
                "20",
                "25",
                "30"
            ],
            correctAnswerIndex: 1,
            explanation: "5 × 4 は 20 です。"
        ),

        QuizQuestion(
            question: "8 × 3 はいくつですか？",
            choices: [
                "24",
                "18",
                "21",
                "28"
            ],
            correctAnswerIndex: 0,
            explanation: "8 × 3 は 24 です。"
        ),

        // 修正開始: 正解は「8冊」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "ノートが6冊ありました。さらに2冊買いました。ノートは全部で何冊ですか？",
            choices: [
                "7冊",
                "8冊",
                "9冊",
                "10冊"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "6冊と2冊を足すと8冊になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "みかんが12個ありました。4個食べました。残りは何個ですか？",
            choices: [
                "6個",
                "7個",
                "8個",
                "9個"
            ],
            correctAnswerIndex: 2,
            explanation: "12個から4個を引くと8個残ります。"
        ),

        // 修正開始: 正解は「12時」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "時計が7時を指しています。あと5時間後は何時ですか？",
            choices: [
                "10時",
                "11時",
                "12時",
                "1時"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "7時に5時間足すと12時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "時計が11時を指しています。あと3時間後は何時ですか？",
            choices: [
                "12時",
                "1時",
                "2時",
                "3時"
            ],
            correctAnswerIndex: 2,
            explanation: "11時に3時間足すと2時になります。"
        ),

        QuizQuestion(
            question: "おはじきが20個ありました。友達に5個あげました。残りは何個ですか？",
            choices: [
                "10個",
                "15個",
                "18個",
                "20個"
            ],
            correctAnswerIndex: 1,
            explanation: "20個から5個を引くと15個残ります。"
        ),

        QuizQuestion(
            question: "8 × 5 はいくつですか？",
            choices: [
                "35",
                "40",
                "45",
                "50"
            ],
            correctAnswerIndex: 1,
            explanation: "8 × 5 は 40 です。"
        ),
        QuizQuestion(
            question: "6 × 7 はいくつですか？",
            choices: [
                "36",
                "42",
                "48",
                "56"
            ],
            correctAnswerIndex: 1,
            explanation: "6 × 7 は 42 です。"
        ),

        QuizQuestion(
            question: "9 × 2 はいくつですか？",
            choices: [
                "16",
                "18",
                "20",
                "22"
            ],
            correctAnswerIndex: 1,
            explanation: "9 × 2 は 18 です。"
        ),

        QuizQuestion(
            question: "お菓子が15個ありました。友達に3個あげました。残りは何個ですか？",
            choices: [
                "10個",
                "12個",
                "13個",
                "15個"
            ],
            correctAnswerIndex: 1,
            explanation: "15個から3個を引くと12個残ります。"
        ),

        QuizQuestion(
            question: "ペンが8本ありました。さらに4本もらいました。ペンは全部で何本ですか？",
            choices: [
                "10本",
                "11本",
                "12本",
                "13本"
            ],
            correctAnswerIndex: 2,
            explanation: "8本と4本を足すと12本になります。"
        ),

        QuizQuestion(
            question: "時計が8時を指しています。あと6時間後は何時ですか？",
            choices: [
                "12時",
                "1時",
                "2時",
                "3時"
            ],
            correctAnswerIndex: 2,
            explanation: "8時に6時間足すと2時になります。"
        ),

        QuizQuestion(
            question: "時計が2時を指しています。あと4時間後は何時ですか？",
            choices: [
                "5時",
                "6時",
                "7時",
                "8時"
            ],
            correctAnswerIndex: 1,
            explanation: "2時に4時間足すと6時になります。"
        ),

        QuizQuestion(
            question: "ジュースが12本ありました。5本飲みました。残りは何本ですか？",
            choices: [
                "6本",
                "7本",
                "8本",
                "9本"
            ],
            correctAnswerIndex: 1,
            explanation: "12本から5本を引くと7本残ります。"
        ),

        QuizQuestion(
            question: "7 × 6 はいくつですか？",
            choices: [
                "36",
                "40",
                "42",
                "44"
            ],
            correctAnswerIndex: 2,
            explanation: "7 × 6 は 42 です。"
        ),
        QuizQuestion(
            question: "5 × 9 はいくつですか？",
            choices: [
                "40",
                "45",
                "50",
                "55"
            ],
            correctAnswerIndex: 1,
            explanation: "5 × 9 は 45 です。"
        ),

        QuizQuestion(
            question: "6 × 4 はいくつですか？",
            choices: [
                "20",
                "22",
                "24",
                "26"
            ],
            correctAnswerIndex: 2,
            explanation: "6 × 4 は 24 です。"
        ),

        QuizQuestion(
            question: "おもちゃが18個ありました。友達に6個あげました。残りは何個ですか？",
            choices: [
                "10個",
                "12個",
                "14個",
                "15個"
            ],
            correctAnswerIndex: 1,
            explanation: "18個から6個を引くと12個残ります。"
        ),

        QuizQuestion(
            question: "えんぴつが7本ありました。さらに5本買いました。えんぴつは全部で何本ですか？",
            choices: [
                "10本",
                "11本",
                "12本",
                "13本"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "7本と5本を足すと12本になります。"
        ),

        // 修正開始: 正解は「7時」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "時計が4時を指しています。あと3時間後は何時ですか？",
            choices: [
                "6時",
                "7時",
                "8時",
                "9時"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "4時に3時間足すと7時になります。"
        ),
        // 修正終了

        // 修正開始: 正解は「3時」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "時計が10時を指しています。あと5時間後は何時ですか？",
            choices: [
                "1時",
                "2時",
                "3時",
                "4時"
            ],
            correctAnswerIndex: 2, // 修正: 元は1でしたが、正解は2
            explanation: "10時に5時間足すと3時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "ぶどうが20粒ありました。8粒食べました。残りは何粒ですか？",
            choices: [
                "10粒",
                "11粒",
                "12粒",
                "13粒"
            ],
            correctAnswerIndex: 2,
            explanation: "20粒から8粒を引くと12粒残ります。"
        ),

        QuizQuestion(
            question: "4 × 7 はいくつですか？",
            choices: [
                "28",
                "32",
                "36",
                "40"
            ],
            correctAnswerIndex: 0,
            explanation: "4 × 7 は 28 です。"
        ),
        QuizQuestion(
            question: "3 × 8 はいくつですか？",
            choices: [
                "21",
                "24",
                "27",
                "30"
            ],
            correctAnswerIndex: 1,
            explanation: "3 × 8 は 24 です。"
        ),

        QuizQuestion(
            question: "4 × 9 はいくつですか？",
            choices: [
                "32",
                "35",
                "36",
                "40"
            ],
            correctAnswerIndex: 2,
            explanation: "4 × 9 は 36 です。"
        ),

        QuizQuestion(
            question: "お菓子が16個あります。友達に7個あげました。残りは何個ですか？",
            choices: [
                "8個",
                "9個",
                "10個",
                "11個"
            ],
            correctAnswerIndex: 1,
            explanation: "16個から7個を引くと9個残ります。"
        ),

        QuizQuestion(
            question: "キャンディが10個あります。さらに6個買いました。キャンディは全部で何個ですか？",
            choices: [
                "14個",
                "15個",
                "16個",
                "17個"
            ],
            correctAnswerIndex: 2,
            explanation: "10個と6個を足すと16個になります。"
        ),

        QuizQuestion(
            question: "時計が11時を指しています。あと2時間後は何時ですか？",
            choices: [
                "12時",
                "1時",
                "2時",
                "3時"
            ],
            correctAnswerIndex: 1,
            explanation: "11時に2時間足すと1時になります。"
        ),

        QuizQuestion(
            question: "時計が6時を指しています。あと5時間後は何時ですか？",
            choices: [
                "10時",
                "11時",
                "12時",
                "1時"
            ],
            correctAnswerIndex: 1,
            explanation: "6時に5時間足すと11時になります。"
        ),

        QuizQuestion(
            question: "ボールが25個ありました。5個使いました。残りは何個ですか？",
            choices: [
                "15個",
                "18個",
                "20個",
                "22個"
            ],
            correctAnswerIndex: 2,
            explanation: "25個から5個を引くと20個残ります。"
        ),

        QuizQuestion(
            question: "6 × 5 はいくつですか？",
            choices: [
                "25",
                "30",
                "35",
                "40"
            ],
            correctAnswerIndex: 1,
            explanation: "6 × 5 は 30 です。"
        ),
        QuizQuestion(
            question: "7 × 8 はいくつですか？",
            choices: [
                "54",
                "56",
                "58",
                "60"
            ],
            correctAnswerIndex: 1,
            explanation: "7 × 8 は 56 です。"
        ),

        QuizQuestion(
            question: "9 × 3 はいくつですか？",
            choices: [
                "26",
                "27",
                "28",
                "29"
            ],
            correctAnswerIndex: 1,
            explanation: "9 × 3 は 27 です。"
        ),

        // 修正開始: 正解は「14個」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "りんごが18個ありました。4個食べました。残りは何個ですか？",
            choices: [
                "13個",
                "14個",
                "15個",
                "16個"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "18個から4個を引くと14個残ります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "本が8冊あります。さらに6冊買いました。ノートは全部で何冊ですか？",
            choices: [
                "12冊",
                "13冊",
                "14冊",
                "15冊"
            ],
            correctAnswerIndex: 2,
            explanation: "8冊と6冊を足すと14冊になります。"
        ),

        // 修正開始: 正解は「5時」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "時計が2時を指しています。あと3時間後は何時ですか？",
            choices: [
                "4時",
                "5時",
                "6時",
                "7時"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "2時に3時間足すと5時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "時計が12時を指しています。あと4時間後は何時ですか？",
            choices: [
                "2時",
                "3時",
                "4時",
                "5時"
            ],
            correctAnswerIndex: 2,
            explanation: "12時に4時間足すと4時になります。"
        ),

        QuizQuestion(
            question: "おにぎりが30個ありました。10個食べました。残りは何個ですか？",
            choices: [
                "15個",
                "18個",
                "20個",
                "22個"
            ],
            correctAnswerIndex: 2,
            explanation: "30個から10個を引くと20個残ります。"
        ),

        QuizQuestion(
            question: "8 × 7 はいくつですか？",
            choices: [
                "54",
                "55",
                "56",
                "57"
            ],
            correctAnswerIndex: 2,
            explanation: "8 × 7 は 56 です。"
        ),
        QuizQuestion(
            question: "3 × 7 はいくつですか？",
            choices: [
                "18",
                "19",
                "20",
                "21"
            ],
            correctAnswerIndex: 3,
            explanation: "3 × 7 は 21 です。"
        ),

        QuizQuestion(
            question: "5 × 6 はいくつですか？",
            choices: [
                "25",
                "30",
                "35",
                "40"
            ],
            correctAnswerIndex: 1,
            explanation: "5 × 6 は 30 です。"
        ),

        // 修正開始: 正解は「13個」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "おはじきが20個ありました。7個使いました。残りは何個ですか？",
            choices: [
                "11個",
                "12個",
                "13個",
                "14個"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "20個から7個を引くと13個残ります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "クレヨンが15本ありました。さらに5本もらいました。クレヨンは全部で何本ですか？",
            choices: [
                "18本",
                "19本",
                "20本",
                "21本"
            ],
            correctAnswerIndex: 2,
            explanation: "15本と5本を足すと20本になります。"
        ),

        // 修正開始: 正解は「11時」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "時計が7時を指しています。あと4時間後は何時ですか？",
            choices: [
                "9時",
                "10時",
                "11時",
                "12時"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "7時に4時間足すと11時になります。"
        ),
        // 修正終了

        // 修正開始: 正解は「12時」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "時計が10時を指しています。あと2時間後は何時ですか？",
            choices: [
                "11時",
                "12時",
                "1時",
                "2時"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "10時に2時間足すと12時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "アイスクリームが25個ありました。8個食べました。残りは何個ですか？",
            choices: [
                "14個",
                "15個",
                "16個",
                "17個"
            ],
            correctAnswerIndex: 3,
            explanation: "25個から8個を引くと17個残ります。"
        ),

        QuizQuestion(
            question: "9 × 4 はいくつですか？",
            choices: [
                "32",
                "33",
                "34",
                "36"
            ],
            correctAnswerIndex: 3,
            explanation: "9 × 4 は 36 です。"
        ),
        QuizQuestion(
            question: "4 × 6 はいくつですか？",
            choices: [
                "20",
                "22",
                "24",
                "26"
            ],
            correctAnswerIndex: 2,
            explanation: "4 × 6 は 24 です。"
        ),

        QuizQuestion(
            question: "8 × 9 はいくつですか？",
            choices: [
                "72",
                "74",
                "76",
                "78"
            ],
            correctAnswerIndex: 0,
            explanation: "8 × 9 は 72 です。"
        ),

        QuizQuestion(
            question: "飴が12個ありました。友達に5個あげました。残りは何個ですか？",
            choices: [
                "5個",
                "6個",
                "7個",
                "8個"
            ],
            correctAnswerIndex: 2,
            explanation: "12個から5個を引くと7個残ります。"
        ),

        QuizQuestion(
            question: "ノートが9冊ありました。さらに4冊買いました。ノートは全部で何冊ですか？",
            choices: [
                "12冊",
                "13冊",
                "14冊",
                "15冊"
            ],
            correctAnswerIndex: 1,
            explanation: "9冊と4冊を足すと13冊になります。"
        ),

        QuizQuestion(
            question: "時計が8時を指しています。あと3時間後は何時ですか？",
            choices: [
                "10時",
                "11時",
                "12時",
                "1時"
            ],
            correctAnswerIndex: 1,
            explanation: "8時に3時間足すと11時になります。"
        ),

        QuizQuestion(
            question: "時計が9時を指しています。あと4時間後は何時ですか？",
            choices: [
                "11時",
                "12時",
                "1時",
                "2時"
            ],
            correctAnswerIndex: 2,
            explanation: "9時に4時間足すと1時になります。"
        ),

        QuizQuestion(
            question: "ボールが18個ありました。友達に7個あげました。残りは何個ですか？",
            choices: [
                "9個",
                "10個",
                "11個",
                "12個"
            ],
            correctAnswerIndex: 2,
            explanation: "18個から7個を引くと11個残ります。"
        ),

        QuizQuestion(
            question: "6 × 9 はいくつですか？",
            choices: [
                "52",
                "53",
                "54",
                "55"
            ],
            correctAnswerIndex: 2,
            explanation: "6 × 9 は 54 です。"
        ),
        QuizQuestion(
            question: "3 × 5 はいくつですか？",
            choices: [
                "10",
                "12",
                "15",
                "18"
            ],
            correctAnswerIndex: 2,
            explanation: "3 × 5 は 15 です。"
        ),

        QuizQuestion(
            question: "7 × 4 はいくつですか？",
            choices: [
                "21",
                "24",
                "28",
                "32"
            ],
            correctAnswerIndex: 2,
            explanation: "7 × 4 は 28 です。"
        ),

        QuizQuestion(
            question: "クッキーが20個ありました。友達に9個あげました。残りは何個ですか？",
            choices: [
                "9個",
                "10個",
                "11個",
                "12個"
            ],
            correctAnswerIndex: 2, // 修正: 元は1でしたが、正解は2
            explanation: "20個から9個を引くと11個残ります。"
        ),

        QuizQuestion(
            question: "えんぴつが10本あります。さらに6本買いました。えんぴつは全部で何本ですか？",
            choices: [
                "14本",
                "15本",
                "16本",
                "17本"
            ],
            correctAnswerIndex: 2,
            explanation: "10本と6本を足すと16本になります。"
        ),

        // 修正開始: 正解は「7時」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "時計が3時を指しています。あと4時間後は何時ですか？",
            choices: [
                "6時",
                "7時",
                "8時",
                "9時"
            ],
            correctAnswerIndex: 1, // 修正: 元は2でしたが、正解は1
            explanation: "3時に4時間足すと7時になります。"
        ),
        // 修正終了

        // 修正開始: 正解は「12時」なのでcorrectAnswerIndexを1に変更
        QuizQuestion(
            question: "時計が5時を指しています。あと7時間後は何時ですか？",
            choices: [
                "10時",
                "11時",
                "12時",
                "1時"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "5時に7時間足すと12時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "ボールが14個ありました。3個使いました。残りは何個ですか？",
            choices: [
                "10個",
                "11個",
                "12個",
                "13個"
            ],
            correctAnswerIndex: 1,
            explanation: "14個から3個を引くと11個残ります。"
        ),

        QuizQuestion(
            question: "8 × 3 はいくつですか？",
            choices: [
                "20",
                "22",
                "24",
                "26"
            ],
            correctAnswerIndex: 2,
            explanation: "8 × 3 は 24 です。"
        ),
        QuizQuestion(
            question: "6 × 8 はいくつですか？",
            choices: [
                "46",
                "48",
                "50",
                "52"
            ],
            correctAnswerIndex: 1,
            explanation: "6 × 8 は 48 です。"
        ),

        QuizQuestion(
            question: "9 × 5 はいくつですか？",
            choices: [
                "40",
                "42",
                "45",
                "47"
            ],
            correctAnswerIndex: 2,
            explanation: "9 × 5 は 45 です。"
        ),

        // 修正開始: 正解は「16個」なのでcorrectAnswerIndexを3に変更
        QuizQuestion(
            question: "お菓子が22個ありました。友達に6個あげました。残りは何個ですか？",
            choices: [
                "14個",
                "15個",
                "16個",
                "17個"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "22個から6個を引くと16個残ります。"
        ),
        // 修正終了

        // 修正開始: 正解は「12本」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "消しゴムが5個ありました。さらに7個買いました。消しゴムは全部で何個ですか？",
            choices: [
                "10個",
                "11個",
                "12個",
                "13個"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "5個と7個を足すと12個になります。"
        ),
        // 修正終了

        // 修正開始: 正解は「11時」なのでcorrectAnswerIndexを2に変更
        QuizQuestion(
            question: "時計が6時を指しています。あと5時間後は何時ですか？",
            choices: [
                "9時",
                "10時",
                "11時",
                "12時"
            ],
            correctAnswerIndex: 2, // 修正: 元は3でしたが、正解は2
            explanation: "6時に5時間足すと11時になります。"
        ),
        // 修正終了

        QuizQuestion(
            question: "時計が1時を指しています。あと6時間後は何時ですか？",
            choices: [
                "5時",
                "6時",
                "7時",
                "8時"
            ],
            correctAnswerIndex: 2,
            explanation: "1時に6時間足すと7時になります。"
        ),

        QuizQuestion(
            question: "風船が30個ありました。12個使いました。残りは何個ですか？",
            choices: [
                "17個",
                "18個",
                "19個",
                "20個"
            ],
            correctAnswerIndex: 1,
            explanation: "30個から12個を引くと18個残ります。"
        ),

        QuizQuestion(
            question: "7 × 6 はいくつですか？",
            choices: [
                "40",
                "42",
                "44",
                "46"
            ],
            correctAnswerIndex: 1,
            explanation: "7 × 6 は 42 です。"
        ),

        QuizQuestion(
        question: "36 + 27 はいくつですか？",
        choices: [
        "62",
        "73",
        "63",
        "53"
        ],
        correctAnswerIndex: 2,
        explanation: "36 + 27 は 63 です。"
        ),

        QuizQuestion(
        question: "74 - 32 はいくつですか？",
        choices: [
        "42",
        "46",
        "44",
        "40"
        ],
        correctAnswerIndex: 0,
        explanation: "74 - 32 は 42 です。"
        ),

        QuizQuestion(
        question: "7 × 7 はいくつですか？",
        choices: [
        "49",
        "56",
        "48",
        "42"
        ],
        correctAnswerIndex: 0,
        explanation: "7 × 7 は 49 です。"
        ),

        QuizQuestion(
        question: "シールが1まいの台紙に5まいずつはってあります。台紙が2まいあると、シールは全部で何まいですか？",
        choices: [
        "7まい",
        "8まい",
        "9まい",
        "10まい"
        ],
        correctAnswerIndex: 3,
        explanation: "5まいずつの台紙が2まいあるので、5 × 2 = 10で、全部で10まいです。"
        ),

        QuizQuestion(
        question: "4時10分から20分後は何時何分ですか？",
        choices: [
        "4時20分",
        "5時10分",
        "4時30分",
        "4時40分"
        ],
        correctAnswerIndex: 2,
        explanation: "4時10分から20分後は4時30分です。"
        ),

        QuizQuestion(
        question: "1mは何cmですか？",
        choices: [
        "1000cm",
        "110cm",
        "100cm",
        "10cm"
        ],
        correctAnswerIndex: 2,
        explanation: "1mは100cmです。"
        ),

        QuizQuestion(
        question: "1dLは何mLですか？",
        choices: [
        "50mL",
        "1000mL",
        "10mL",
        "100mL"
        ],
        correctAnswerIndex: 3,
        explanation: "1dLは100mLです。"
        ),

        QuizQuestion(
        question: "辺が3本、頂点が3つある図形はどれですか？",
        choices: [
        "三角形",
        "正方形",
        "四角形",
        "長方形"
        ],
        correctAnswerIndex: 0,
        explanation: "辺が3本、頂点が3つある図形は三角形です。"
        ),

        QuizQuestion(
        question: "好きな遊びを表にまとめました。\nおにごっこ：8人\nなわとび：5人\nドッジボール：7人\n人数がいちばん多い遊びはどれですか？",
        choices: [
        "なわとび",
        "どれも同じ",
        "ドッジボール",
        "おにごっこ"
        ],
        correctAnswerIndex: 3,
        explanation: "いちばん多いのは8人のおにごっこです。"
        ),

        QuizQuestion(
        question: "赤い色紙が28まい、青い色紙が36まいあります。合わせて何まいですか？",
        choices: [
        "54まい",
        "74まい",
        "84まい",
        "64まい"
        ],
        correctAnswerIndex: 3,
        explanation: "28 + 36 = 64なので、合わせて64まいです。"
        ),

        QuizQuestion(
        question: "91 - 46 はいくつですか？",
        choices: [
        "45",
        "35",
        "44",
        "55"
        ],
        correctAnswerIndex: 0,
        explanation: "91 - 46 は 45 です。"
        ),

        QuizQuestion(
        question: "□ × 8 = 16 の □ に入る数はいくつですか？",
        choices: [
        "8",
        "2",
        "4",
        "3"
        ],
        correctAnswerIndex: 1,
        explanation: "2 × 8 = 16なので、□に入る数は2です。"
        ),

        QuizQuestion(
        question: "8 + 8 + 8 + 8 の答えはいくつですか？",
        choices: [
        "28",
        "36",
        "32",
        "24"
        ],
        correctAnswerIndex: 2,
        explanation: "8が4つあるので、8 × 4 = 32です。"
        ),

        QuizQuestion(
        question: "9時50分から10時25分までの時間は何分ですか？",
        choices: [
        "35分",
        "55分",
        "45分",
        "25分"
        ],
        correctAnswerIndex: 0,
        explanation: "9時50分から10時までは10分、10時から10時25分までは25分なので、合わせて35分です。"
        ),

        QuizQuestion(
        question: "次のうち、いちばん長いものはどれですか？",
        choices: [
        "98cm",
        "1m",
        "105cm",
        "1m2cm"
        ],
        correctAnswerIndex: 2,
        explanation: "1m2cmは102cm、1mは100cmなので、いちばん長いのは105cmです。"
        ),

        QuizQuestion(
        question: "1L5dLの水から8dL使いました。残りは何dLですか？",
        choices: [
        "5dL",
        "8dL",
        "6dL",
        "7dL"
        ],
        correctAnswerIndex: 3,
        explanation: "1L5dLは15dLです。15 - 8 = 7なので、残りは7dLです。"
        ),

        QuizQuestion(
        question: "三角形や四角形について、正しいものはどれですか？",
        choices: [
        "三角形には頂点が4つあります。",
        "長方形の4辺はいつもすべて同じ長さです。",
        "正方形には直角が3つあります。",
        "四角形には辺が4本あります。"
        ],
        correctAnswerIndex: 3,
        explanation: "四角形には辺が4本あります。三角形の頂点は3つ、正方形の直角は4つです。"
        ),

        QuizQuestion(
        question: "空きかんを集めた数を表にまとめました。\n月曜日：6個\n火曜日：9個\n水曜日：4個\n木曜日：8個\n火曜日と木曜日に集めた空きかんは、合わせて何個ですか？",
        choices: [
        "17個",
        "15個",
        "19個",
        "18個"
        ],
        correctAnswerIndex: 0,
        explanation: "火曜日の9個と木曜日の8個を合わせると、9 + 8 = 17で17個です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】46 + 37 = ＿＿",
        answer: "83",
        acceptableAnswers: ["８３"],
        explanation: "46 + 37 は 83 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】68 - 24 = ＿＿",
        answer: "44",
        acceptableAnswers: ["４４"],
        explanation: "68 - 24 は 44 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】2 × 7 = ＿＿",
        answer: "14",
        acceptableAnswers: ["１４"],
        explanation: "2 × 7 は 14 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1時45分から15分後は ＿＿ 時です。",
        answer: "2",
        acceptableAnswers: ["２"],
        explanation: "1時45分から15分後は2時です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】76cmと24cmを合わせると ＿＿ mです。",
        answer: "1",
        acceptableAnswers: ["１"],
        explanation: "76cm + 24cm = 100cmで、100cmは1mです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】6dL + 9dL = ＿＿ dL",
        answer: "15",
        acceptableAnswers: ["１５"],
        explanation: "6dL + 9dL = 15dLで、15dLは1L5dLです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】58 + 27 の計算が正しくなるように並べましょう。",
        choices: ["= 85", "27", "+", "58"],
        orderedChoices: ["58", "+", "27", "= 85"],
        explanation: "『58 + 27 = 85』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】2 × 3 の計算が正しくなるように並べましょう。",
        choices: ["= 6", "3", "×", "2"],
        orderedChoices: ["2", "×", "3", "= 6"],
        explanation: "『2 × 3 = 6』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】83 - 27 の計算が正しくなるように並べましょう。",
        choices: ["27", "= 56", "83", "-"],
        orderedChoices: ["83", "-", "27", "= 56"],
        explanation: "『83 - 27 = 56』の順に並べます。"
        ),
        QuizQuestion(
        question: "27 + 41 はいくつですか？",
        choices: [
        "69",
        "68",
        "78",
        "66"
        ],
        correctAnswerIndex: 1,
        explanation: "27 + 41 は 68 です。"
        ),

        QuizQuestion(
        question: "赤いビーズが38個、青いビーズが45個あります。合わせて何個ですか？",
        choices: [
        "93個",
        "82個",
        "73個",
        "83個"
        ],
        correctAnswerIndex: 3,
        explanation: "38 + 45 = 83なので、合わせて83個です。"
        ),

        QuizQuestion(
        question: "86 - 34 はいくつですか？",
        choices: [
        "62",
        "50",
        "42",
        "52"
        ],
        correctAnswerIndex: 3,
        explanation: "86 - 34 は 52 です。"
        ),

        QuizQuestion(
        question: "シールが73まいあります。28まい使うと、残りは何まいですか？",
        choices: [
        "44まい",
        "41まい",
        "45まい",
        "35まい"
        ],
        correctAnswerIndex: 2,
        explanation: "73 - 28 = 45なので、残りは45まいです。"
        ),

        QuizQuestion(
        question: "九九で、答えが24になる式はどれですか？",
        choices: [
        "3 × 8",
        "6 × 5",
        "4 × 8",
        "7 × 3"
        ],
        correctAnswerIndex: 0,
        explanation: "3 × 8 = 24なので、答えが24になる式は『3 × 8』です。"
        ),

        QuizQuestion(
        question: "7 × □ = 63 の □ に入る数はいくつですか？",
        choices: [
        "6",
        "9",
        "7",
        "8"
        ],
        correctAnswerIndex: 1,
        explanation: "7 × 9 = 63なので、□に入る数は9です。"
        ),

        QuizQuestion(
        question: "かごが8こあります。どのかごにもみかんが3個ずつ入っています。みかんは全部で何個ですか？",
        choices: [
        "24個",
        "32個",
        "11個",
        "21個"
        ],
        correctAnswerIndex: 0,
        explanation: "3個ずつ入ったかごが8こあるので、3 × 8 = 24で、全部で24個です。"
        ),

        QuizQuestion(
        question: "1箱に色えんぴつが9本ずつ入っています。6箱では、色えんぴつは全部で何本ですか？",
        choices: [
        "54本",
        "48本",
        "45本",
        "52本"
        ],
        correctAnswerIndex: 0,
        explanation: "9本ずつ入った箱が6箱あるので、9 × 6 = 54で、全部で54本です。"
        ),

        QuizQuestion(
        question: "8時15分から25分後は何時何分ですか？",
        choices: [
        "8時50分",
        "8時40分",
        "9時40分",
        "8時30分"
        ],
        correctAnswerIndex: 1,
        explanation: "8時15分から25分後は8時40分です。"
        ),

        QuizQuestion(
        question: "3時45分から4時30分までの時間は何分ですか？",
        choices: [
        "55分",
        "35分",
        "1時間5分",
        "45分"
        ],
        correctAnswerIndex: 3,
        explanation: "3時45分から4時までは15分、4時から4時30分までは30分なので、合わせて45分です。"
        ),

        QuizQuestion(
        question: "42cmのリボンと36cmのリボンをつなぐと、全部で何cmですか？",
        choices: [
        "68cm",
        "78cm",
        "88cm",
        "76cm"
        ],
        correctAnswerIndex: 1,
        explanation: "42 + 36 = 78なので、全部で78cmです。"
        ),

        QuizQuestion(
        question: "2mのひもから65cm切りました。残りは何cmですか？",
        choices: [
        "135cm",
        "125cm",
        "145cm",
        "130cm"
        ],
        correctAnswerIndex: 0,
        explanation: "2mは200cmです。200 - 65 = 135なので、残りは135cmです。"
        ),

        QuizQuestion(
        question: "7dLの牛乳と2dLの牛乳を合わせると、何dLですか？",
        choices: [
        "10dL",
        "1L",
        "9dL",
        "8dL"
        ],
        correctAnswerIndex: 2,
        explanation: "7 + 2 = 9なので、合わせると9dLです。"
        ),

        QuizQuestion(
        question: "1L8dLの水から9dL使いました。残りは何dLですか？",
        choices: [
        "8dL",
        "9dL",
        "1L",
        "1L9dL"
        ],
        correctAnswerIndex: 1,
        explanation: "1L8dLは18dLです。18 - 9 = 9なので、残りは9dLです。"
        ),

        QuizQuestion(
        question: "四角形の頂点はいくつありますか？",
        choices: [
        "2つ",
        "5つ",
        "4つ",
        "3つ"
        ],
        correctAnswerIndex: 2,
        explanation: "四角形には頂点が4つあります。"
        ),

        QuizQuestion(
        question: "正方形について、正しいものはどれですか？",
        choices: [
        "辺は3本です。",
        "向かい合う2辺だけが同じ長さです。",
        "直角は2つです。",
        "4本の辺の長さがすべて同じで、4つの角が直角です。"
        ],
        correctAnswerIndex: 3,
        explanation: "正方形は、4本の辺の長さがすべて同じで、4つの角が直角です。"
        ),

        QuizQuestion(
        question: "花だんにさいた花の数を表にまとめました。\nチューリップ：5本\nひまわり：8本\nあさがお：6本\nばら：4本\nいちばん多い花はどれですか？",
        choices: [
        "チューリップ",
        "あさがお",
        "ひまわり",
        "ばら"
        ],
        correctAnswerIndex: 2,
        explanation: "いちばん多いのは8本のひまわりです。"
        ),

        QuizQuestion(
        question: "休み時間にした遊びをぼうグラフにしました。\n■1こは2人です。\nサッカー：■■■■■■\nドッジボール：■■■■\nおにごっこ：■■■■■\nなわとび：■■■\nサッカーとおにごっこは、合わせて何人ですか？",
        choices: [
        "24人",
        "22人",
        "20人",
        "26人"
        ],
        correctAnswerIndex: 1,
        explanation: "サッカーは12人、おにごっこは10人なので、12 + 10 = 22で、合わせて22人です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】54 + 29 = ＿＿",
        answer: "83",
        acceptableAnswers: ["８３"],
        explanation: "54 + 29 は 83 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】82 - 37 = ＿＿",
        answer: "45",
        acceptableAnswers: ["４５"],
        explanation: "82 - 37 は 45 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】8 × ＿＿ = 40",
        answer: "5",
        acceptableAnswers: ["５"],
        explanation: "8 × 5 = 40なので、＿＿に入る数は5です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】10時35分から35分後は、11時 ＿＿ 分です。",
        answer: "10",
        acceptableAnswers: ["１０"],
        explanation: "10時35分から35分後は11時10分です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1m20cmのテープから50cm切ると、残りは ＿＿ cmです。",
        answer: "70",
        acceptableAnswers: ["７０"],
        explanation: "1m20cmは120cmです。120 - 50 = 70なので、残りは70cmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】9dL + 7dL = ＿＿ dL",
        answer: "16",
        acceptableAnswers: ["１６"],
        explanation: "9dL + 7dL = 16dLで、16dLは1L6dLです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】39 + 48 の計算が正しくなるように並べましょう。",
        choices: ["= 87", "48", "39", "+"],
        orderedChoices: ["39", "+", "48", "= 87"],
        explanation: "『39 + 48 = 87』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】95 - 38 の計算が正しくなるように並べましょう。",
        choices: ["38", "= 57", "-", "95"],
        orderedChoices: ["95", "-", "38", "= 57"],
        explanation: "『95 - 38 = 57』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】1ふくろにえんぴつが2本ずつ入っています。9ふくろで18本になる式を、正しい順に並べましょう。",
        choices: ["9", "= 18", "2", "×"],
        orderedChoices: ["2", "×", "9", "= 18"],
        explanation: "『2 × 9 = 18』の順に並べます。"
        ),
        QuizQuestion(
        question: "24 + 53 はいくつですか？",
        choices: [
        "87",
        "77",
        "76",
        "67"
        ],
        correctAnswerIndex: 1,
        explanation: "24 + 53 は 77 です。"
        ),

        QuizQuestion(
        question: "図書室に絵本が37冊、図鑑が48冊あります。合わせて何冊ですか？",
        choices: [
        "95冊",
        "84冊",
        "85冊",
        "75冊"
        ],
        correctAnswerIndex: 2,
        explanation: "37 + 48 = 85なので、合わせて85冊です。"
        ),

        QuizQuestion(
        question: "79 - 26 はいくつですか？",
        choices: [
        "53",
        "63",
        "43",
        "51"
        ],
        correctAnswerIndex: 0,
        explanation: "79 - 26 は 53 です。"
        ),

        QuizQuestion(
        question: "折り紙が93まいあります。58まい使うと、残りは何まいですか？",
        choices: [
        "35まい",
        "25まい",
        "36まい",
        "34まい"
        ],
        correctAnswerIndex: 0,
        explanation: "93 - 58 = 35なので、残りは35まいです。"
        ),

        QuizQuestion(
        question: "9 × 8 はいくつですか？",
        choices: [
        "64",
        "81",
        "72",
        "63"
        ],
        correctAnswerIndex: 2,
        explanation: "9 × 8 は 72 です。"
        ),

        QuizQuestion(
        question: "3 × □ = 27 の □ に入る数はいくつですか？",
        choices: [
        "9",
        "6",
        "8",
        "7"
        ],
        correctAnswerIndex: 0,
        explanation: "3 × 9 = 27なので、□に入る数は9です。"
        ),

        QuizQuestion(
        question: "花びんが8こあります。どの花びんにも花が2本ずつ入っています。花は全部で何本ですか？",
        choices: [
        "18本",
        "10本",
        "16本",
        "14本"
        ],
        correctAnswerIndex: 2,
        explanation: "2本ずつ入った花びんが8こあるので、2 × 8 = 16で、全部で16本です。"
        ),

        QuizQuestion(
        question: "1箱にボールが8個ずつ入っています。3箱分のボールに、さらに5個を加えると、全部で何個ですか？",
        choices: [
        "29個",
        "27個",
        "24個",
        "28個"
        ],
        correctAnswerIndex: 0,
        explanation: "8 × 3 = 24で、24 + 5 = 29なので、全部で29個です。"
        ),

        QuizQuestion(
        question: "5時20分から25分後は何時何分ですか？",
        choices: [
        "5時45分",
        "5時35分",
        "5時55分",
        "6時5分"
        ],
        correctAnswerIndex: 0,
        explanation: "5時20分から25分後は5時45分です。"
        ),

        QuizQuestion(
        question: "10時40分から11時15分までの時間は何分ですか？",
        choices: [
        "45分",
        "25分",
        "55分",
        "35分"
        ],
        correctAnswerIndex: 3,
        explanation: "10時40分から11時までは20分、11時から11時15分までは15分なので、合わせて35分です。"
        ),

        QuizQuestion(
        question: "1m4cmは何cmですか？",
        choices: [
        "100cm",
        "104cm",
        "14cm",
        "140cm"
        ],
        correctAnswerIndex: 1,
        explanation: "1mは100cmなので、1m4cmは104cmです。"
        ),

        QuizQuestion(
        question: "1m65cmのリボンから78cm切りました。残りは何cmですか？",
        choices: [
        "87cm",
        "83cm",
        "77cm",
        "97cm"
        ],
        correctAnswerIndex: 0,
        explanation: "1m65cmは165cmです。165 - 78 = 87なので、残りは87cmです。"
        ),

        QuizQuestion(
        question: "3dLの水と5dLの水を合わせると、何dLですか？",
        choices: [
        "9dL",
        "7dL",
        "10dL",
        "8dL"
        ],
        correctAnswerIndex: 3,
        explanation: "3 + 5 = 8なので、合わせると8dLです。"
        ),

        QuizQuestion(
        question: "2L4dLの水から8dL使いました。残りは何dLですか？",
        choices: [
        "18dL",
        "16dL",
        "20dL",
        "14dL"
        ],
        correctAnswerIndex: 1,
        explanation: "2L4dLは24dLです。24 - 8 = 16なので、残りは16dLです。"
        ),

        QuizQuestion(
        question: "辺が4本ある形のなかま全体を何といいますか？",
        choices: [
        "正方形",
        "四角形",
        "長方形",
        "三角形"
        ],
        correctAnswerIndex: 1,
        explanation: "辺が4本ある形のなかま全体を四角形といいます。"
        ),

        QuizQuestion(
        question: "ある図形には4本の辺があり、4つの角はどれも直角ではありません。この図形は次のどのなかまですか？",
        choices: [
        "四角形",
        "長方形",
        "三角形",
        "正方形"
        ],
        correctAnswerIndex: 0,
        explanation: "辺が4本あるので四角形です。直角がないため、正方形や長方形ではありません。"
        ),

        QuizQuestion(
        question: "ペットボトルのふたを集めた数を表にまとめました。\n1班：9個\n2班：13個\n3班：7個\n4班：11個\nいちばん多く集めた班はどこですか？",
        choices: [
        "3班",
        "2班",
        "1班",
        "4班"
        ],
        correctAnswerIndex: 1,
        explanation: "いちばん多いのは13個を集めた2班です。"
        ),

        QuizQuestion(
        question: "公園で見つけた虫の数を表にまとめました。\n月曜日：15ひき\n火曜日：8ひき\n水曜日：12ひき\n木曜日：10ぴき\nいちばん多い日といちばん少ない日の差は何びきですか？",
        choices: [
        "5ひき",
        "23びき",
        "8ひき",
        "7ひき"
        ],
        correctAnswerIndex: 3,
        explanation: "いちばん多い月曜日は15ひき、いちばん少ない火曜日は8ひきなので、15 - 8 = 7で、差は7ひきです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】67 + 18 = ＿＿",
        answer: "85",
        acceptableAnswers: ["８５"],
        explanation: "67 + 18 は 85 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】90 - 47 = ＿＿",
        answer: "43",
        acceptableAnswers: ["４３"],
        explanation: "90 - 47 は 43 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】9 × 1 = ＿＿",
        answer: "9",
        acceptableAnswers: ["９"],
        explanation: "9 × 1 は 9 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】7時50分から20分後は、8時 ＿＿ 分です。",
        answer: "10",
        acceptableAnswers: ["１０"],
        explanation: "7時50分から20分後は8時10分です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】58cmと42cmを合わせると ＿＿ cmです。",
        answer: "100",
        acceptableAnswers: ["１００"],
        explanation: "58cm + 42cm = 100cmで、100cmは1mです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】14dLは、1L ＿＿ dLです。",
        answer: "4",
        acceptableAnswers: ["４"],
        explanation: "10dLは1Lなので、14dLは1L4dLです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】31 + 46 の計算が正しくなるように並べましょう。",
        choices: ["= 77", "46", "+", "31"],
        orderedChoices: ["31", "+", "46", "= 77"],
        explanation: "『31 + 46 = 77』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】88 - 39 の計算が正しくなるように並べましょう。",
        choices: ["39", "= 49", "88", "-"],
        orderedChoices: ["88", "-", "39", "= 49"],
        explanation: "『88 - 39 = 49』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】1まいのおさらに、おにぎりが4こずつあります。7まいのおさらで28こになる式を、正しい順に並べましょう。",
        choices: ["7", "= 28", "4", "×"],
        orderedChoices: ["4", "×", "7", "= 28"],
        explanation: "『4 × 7 = 28』の順に並べます。"
        ),
        QuizQuestion(
        question: "35 + 42 はいくつですか？",
        choices: [
        "77",
        "76",
        "87",
        "67"
        ],
        correctAnswerIndex: 0,
        explanation: "35 + 42 は 77 です。"
        ),

        QuizQuestion(
        question: "どんぐりを56個ひろいました。そのあと27個ひろいました。合わせて何個ですか？",
        choices: [
        "93個",
        "73個",
        "82個",
        "83個"
        ],
        correctAnswerIndex: 3,
        explanation: "56 + 27 = 83なので、合わせて83個です。"
        ),

        QuizQuestion(
        question: "84 - 31 はいくつですか？",
        choices: [
        "53",
        "63",
        "43",
        "51"
        ],
        correctAnswerIndex: 0,
        explanation: "84 - 31 は 53 です。"
        ),

        QuizQuestion(
        question: "カードが72まいあります。39まい友達にあげると、残りは何まいですか？",
        choices: [
        "23まい",
        "34まい",
        "33まい",
        "31まい"
        ],
        correctAnswerIndex: 2,
        explanation: "72 - 39 = 33なので、残りは33まいです。"
        ),

        QuizQuestion(
        question: "6のだんで、答えが42になる式はどれですか？",
        choices: [
        "6 × 9",
        "6 × 6",
        "6 × 7",
        "6 × 8"
        ],
        correctAnswerIndex: 2,
        explanation: "6 × 7 = 42なので、答えが42になる式は『6 × 7』です。"
        ),

        QuizQuestion(
        question: "□ × 7 = 35 の □ に入る数はいくつですか？",
        choices: [
        "5",
        "7",
        "4",
        "6"
        ],
        correctAnswerIndex: 0,
        explanation: "5 × 7 = 35なので、□に入る数は5です。"
        ),

        QuizQuestion(
        question: "おさらにクッキーが4まいずつのっています。おさらが6まいあると、クッキーは全部で何まいですか？",
        choices: [
        "28まい",
        "24まい",
        "20まい",
        "10まい"
        ],
        correctAnswerIndex: 1,
        explanation: "4まいずつのったおさらが6まいあるので、4 × 6 = 24で、全部で24まいです。"
        ),

        QuizQuestion(
        question: "1ふくろにビー玉が5個ずつ入っています。7ふくろ分と、ふくろに入っていないビー玉3個を合わせると、全部で何個ですか？",
        choices: [
        "32個",
        "38個",
        "37個",
        "35個"
        ],
        correctAnswerIndex: 1,
        explanation: "5 × 7 = 35で、35 + 3 = 38なので、全部で38個です。"
        ),

        QuizQuestion(
        question: "6時40分から15分後は何時何分ですか？",
        choices: [
        "7時15分",
        "7時5分",
        "6時45分",
        "6時55分"
        ],
        correctAnswerIndex: 3,
        explanation: "6時40分から15分後は6時55分です。"
        ),

        QuizQuestion(
        question: "1時25分から2時10分までの時間は何分ですか？",
        choices: [
        "55分",
        "45分",
        "1時間5分",
        "35分"
        ],
        correctAnswerIndex: 1,
        explanation: "1時25分から2時までは35分、2時から2時10分までは10分なので、合わせて45分です。"
        ),

        QuizQuestion(
        question: "64cmのテープと25cmのテープをつなぐと、全部で何cmですか？",
        choices: [
        "87cm",
        "99cm",
        "89cm",
        "79cm"
        ],
        correctAnswerIndex: 2,
        explanation: "64 + 25 = 89なので、全部で89cmです。"
        ),

        QuizQuestion(
        question: "4つの長さをくらべたとき、もっとも長いものはどれですか？",
        choices: [
        "1m8cm",
        "1m5cm",
        "107cm",
        "109cm"
        ],
        correctAnswerIndex: 3,
        explanation: "1m8cmは108cm、1m5cmは105cmです。いちばん長いのは109cmです。"
        ),

        QuizQuestion(
        question: "5dLの水と4dLの水を合わせると、何dLですか？",
        choices: [
        "11dL",
        "9dL",
        "8dL",
        "1L2dL"
        ],
        correctAnswerIndex: 1,
        explanation: "5 + 4 = 9なので、合わせると9dLです。"
        ),

        QuizQuestion(
        question: "2L1dLの水から7dL使いました。残りは何dLですか？",
        choices: [
        "16dL",
        "18dL",
        "12dL",
        "14dL"
        ],
        correctAnswerIndex: 3,
        explanation: "2L1dLは21dLです。21 - 7 = 14なので、残りは14dLです。"
        ),

        QuizQuestion(
        question: "三角形の辺と頂点の数の組み合わせで、正しいものはどれですか？",
        choices: [
        "辺が3本、頂点が3つ",
        "辺が4本、頂点が4つ",
        "辺が2本、頂点が3つ",
        "辺が3本、頂点が2つ"
        ],
        correctAnswerIndex: 0,
        explanation: "三角形には辺が3本、頂点が3つあります。"
        ),

        QuizQuestion(
        question: "たてが4cm、横が7cmで、4つの角がすべて直角の図形があります。いちばんくわしい名前はどれですか？",
        choices: [
        "正方形",
        "長方形",
        "三角形",
        "四角形"
        ],
        correctAnswerIndex: 1,
        explanation: "4つの角がすべて直角で、たてと横の長さがちがうので、長方形です。"
        ),

        QuizQuestion(
        question: "文ぼう具を買った人数を表にまとめました。\nえんぴつ：9人\n消しゴム：6人\nものさし：4人\nノート：7人\n人数がいちばん少ない文ぼう具はどれですか？",
        choices: [
        "消しゴム",
        "ものさし",
        "ノート",
        "えんぴつ"
        ],
        correctAnswerIndex: 1,
        explanation: "いちばん少ないのは4人のものさしです。"
        ),

        QuizQuestion(
        question: "読んだ本の数をぼうグラフにしました。\n■1こは2冊です。\nえほん：■■■■■■\nずかん：■■■\nものがたり：■■■■■\nまんが：■■■■\nえほんは、ずかんより何冊多いですか？",
        choices: [
        "18冊",
        "4冊",
        "8冊",
        "6冊"
        ],
        correctAnswerIndex: 3,
        explanation: "えほんは12冊、ずかんは6冊なので、12 - 6 = 6で、えほんのほうが6冊多いです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】58 + 24 = ＿＿",
        answer: "82",
        acceptableAnswers: ["８２"],
        explanation: "58 + 24 は 82 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】97 - 53 = ＿＿",
        answer: "44",
        acceptableAnswers: ["４４"],
        explanation: "97 - 53 は 44 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】7 × ＿＿ = 56",
        answer: "8",
        acceptableAnswers: ["８"],
        explanation: "7 × 8 = 56なので、＿＿に入る数は8です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】9時45分から50分後は、10時 ＿＿ 分です。",
        answer: "35",
        acceptableAnswers: ["３５"],
        explanation: "9時45分から50分後は10時35分です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1m45cmのひもから68cm切ると、残りは ＿＿ cmです。",
        answer: "77",
        acceptableAnswers: ["７７"],
        explanation: "1m45cmは145cmです。145 - 68 = 77なので、残りは77cmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】18dLは、1L ＿＿ dLです。",
        answer: "8",
        acceptableAnswers: ["８"],
        explanation: "10dLは1Lなので、18dLは1L8dLです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】52 + 36 の計算が正しくなるように並べましょう。",
        choices: ["36", "= 88", "52", "+"],
        orderedChoices: ["52", "+", "36", "= 88"],
        explanation: "『52 + 36 = 88』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】93 - 46 の計算が正しくなるように並べましょう。",
        choices: ["-", "= 47", "46", "93"],
        orderedChoices: ["93", "-", "46", "= 47"],
        explanation: "『93 - 46 = 47』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】3 + 3 + 3 + 3 を、かけ算の式で表して正しい順に並べましょう。",
        choices: ["4", "= 12", "×", "3"],
        orderedChoices: ["3", "×", "4", "= 12"],
        explanation: "3が4つあるので、『3 × 4 = 12』の順に並べます。"
        ),
        QuizQuestion(
        question: "26 + 47 はいくつですか？",
        choices: [
        "72",
        "73",
        "63",
        "83"
        ],
        correctAnswerIndex: 1,
        explanation: "26 + 47 は 73 です。"
        ),

        QuizQuestion(
        question: "赤いおはじきが49個、青いおはじきが34個あります。合わせて何個ですか？",
        choices: [
        "73個",
        "82個",
        "83個",
        "93個"
        ],
        correctAnswerIndex: 2,
        explanation: "49 + 34 = 83なので、合わせて83個です。"
        ),

        QuizQuestion(
        question: "96 - 42 はいくつですか？",
        choices: [
        "52",
        "56",
        "54",
        "44"
        ],
        correctAnswerIndex: 2,
        explanation: "96 - 42 は 54 です。"
        ),

        QuizQuestion(
        question: "色紙が81まいあります。36まい使うと、残りは何まいですか？",
        choices: [
        "45まい",
        "47まい",
        "35まい",
        "55まい"
        ],
        correctAnswerIndex: 0,
        explanation: "81 - 36 = 45なので、残りは45まいです。"
        ),

        QuizQuestion(
        question: "5のだんを『5、10、15、20、25、30』ととなえました。30の次の答えはどれですか？",
        choices: [
        "35",
        "30",
        "45",
        "40"
        ],
        correctAnswerIndex: 0,
        explanation: "5のだんは5ずつ大きくなるので、30の次は35です。"
        ),

        QuizQuestion(
        question: "答えが同じになる2つの九九はどれですか？",
        choices: [
        "2 × 9 と 3 × 5",
        "7 × 7 と 8 × 6",
        "4 × 7 と 6 × 5",
        "3 × 8 と 4 × 6"
        ],
        correctAnswerIndex: 3,
        explanation: "3 × 8も4 × 6も答えは24です。ほかの組み合わせは答えが同じになりません。"
        ),

        QuizQuestion(
        question: "6 + 6 + 6 + 6 + 6 を、かけ算の式で表したものはどれですか？",
        choices: [
        "5 × 5",
        "6 × 6",
        "5 × 4",
        "6 × 5"
        ],
        correctAnswerIndex: 3,
        explanation: "6が5つあるので、かけ算の式は6 × 5です。"
        ),

        QuizQuestion(
        question: "りんごは1皿に6個ずつ7皿、みかんは1皿に4個ずつ8皿あります。りんごはみかんより何個多いですか？",
        choices: [
        "8個",
        "11個",
        "10個",
        "9個"
        ],
        correctAnswerIndex: 2,
        explanation: "りんごは6 × 7 = 42個、みかんは4 × 8 = 32個です。42 - 32 = 10なので、りんごは10個多いです。"
        ),

        QuizQuestion(
        question: "3時35分から20分後は何時何分ですか？",
        choices: [
        "4時55分",
        "4時5分",
        "3時55分",
        "3時45分"
        ],
        correctAnswerIndex: 2,
        explanation: "3時35分から20分後は3時55分です。"
        ),

        QuizQuestion(
        question: "11時25分から12時10分までの時間は何分ですか？",
        choices: [
        "40分",
        "45分",
        "35分",
        "55分"
        ],
        correctAnswerIndex: 1,
        explanation: "11時25分から12時までは35分、12時から12時10分までは10分なので、合わせて45分です。"
        ),

        QuizQuestion(
        question: "63cmのリボンと29cmのリボンをつなぐと、全部で何cmですか？",
        choices: [
        "93cm",
        "92cm",
        "89cm",
        "82cm"
        ],
        correctAnswerIndex: 1,
        explanation: "63 + 29 = 92なので、全部で92cmです。"
        ),

        QuizQuestion(
        question: "1m72cmのひもから86cm切りました。残りは何cmですか？",
        choices: [
        "76cm",
        "96cm",
        "86cm",
        "84cm"
        ],
        correctAnswerIndex: 2,
        explanation: "1m72cmは172cmです。172 - 86 = 86なので、残りは86cmです。"
        ),

        QuizQuestion(
        question: "4dL入りのびんが2本あります。水は全部で何dLですか？",
        choices: [
        "6dL",
        "8dL",
        "10dL",
        "12dL"
        ],
        correctAnswerIndex: 1,
        explanation: "4dLが2本分あるので、4 × 2 = 8で、全部で8dLです。"
        ),

        QuizQuestion(
        question: "3L2dLの水から9dL使いました。残りは何dLですか？",
        choices: [
        "24dL",
        "25dL",
        "23dL",
        "22dL"
        ],
        correctAnswerIndex: 2,
        explanation: "3L2dLは32dLです。32 - 9 = 23なので、残りは23dLです。"
        ),

        QuizQuestion(
        question: "三角形を作っている辺は何本ですか？",
        choices: [
        "2本",
        "3本",
        "5本",
        "4本"
        ],
        correctAnswerIndex: 1,
        explanation: "三角形は3本の辺で囲まれています。"
        ),

        QuizQuestion(
        question: "4つの角がすべて直角で、辺の長さが5cm、3cm、5cm、3cmの図形があります。いちばんくわしい名前はどれですか？",
        choices: [
        "正方形",
        "四角形",
        "三角形",
        "長方形"
        ],
        correctAnswerIndex: 3,
        explanation: "4つの角がすべて直角で、たてと横の長さがちがうので、長方形です。"
        ),

        QuizQuestion(
        question: "花のたねをまいた人数を表にまとめました。\nあさがお：8人\nひまわり：12人\nほうせんか：5人\nコスモス：9人\n人数がいちばん少ない花はどれですか？",
        choices: [
        "あさがお",
        "ひまわり",
        "ほうせんか",
        "コスモス"
        ],
        correctAnswerIndex: 2,
        explanation: "いちばん少ないのは5人のほうせんかです。"
        ),

        QuizQuestion(
        question: "休み時間にしたことをぼうグラフにしました。\n●1こは3人です。\n読書：●●●●\n外遊び：●●●●●●\nお絵かき：●●●\n音楽：●●●●●\n外遊びをした人は、お絵かきをした人より何人多いですか？",
        choices: [
        "27人",
        "12人",
        "6人",
        "9人"
        ],
        correctAnswerIndex: 3,
        explanation: "外遊びは18人、お絵かきは9人です。18 - 9 = 9なので、外遊びをした人は9人多いです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】44 + 39 = ＿＿",
        answer: "83",
        acceptableAnswers: ["８３"],
        explanation: "44 + 39 は 83 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】75 - 48 = ＿＿",
        answer: "27",
        acceptableAnswers: ["２７"],
        explanation: "75 - 48 は 27 です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】6のだんの答えです。6、12、18、24、＿＿",
        answer: "30",
        acceptableAnswers: ["３０"],
        explanation: "6のだんは6ずつ大きくなるので、24の次は30です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】4時50分から25分後は、5時 ＿＿ 分です。",
        answer: "15",
        acceptableAnswers: ["１５"],
        explanation: "4時50分から25分後は5時15分です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1m38cmは ＿＿ cmです。",
        answer: "138",
        acceptableAnswers: ["１３８"],
        explanation: "1mは100cmなので、1m38cmは138cmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】17dLは、1L ＿＿ dLです。",
        answer: "7",
        acceptableAnswers: ["７"],
        explanation: "10dLは1Lなので、17dLは1L7dLです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】48 + 35 の計算が正しくなるように並べましょう。",
        choices: ["35", "+", "= 83", "48"],
        orderedChoices: ["48", "+", "35", "= 83"],
        explanation: "『48 + 35 = 83』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】87 - 29 の計算が正しくなるように並べましょう。",
        choices: ["= 58", "29", "87", "-"],
        orderedChoices: ["87", "-", "29", "= 58"],
        explanation: "『87 - 29 = 58』の順に並べます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】8 + 8 + 8 を、かけ算の式で表して正しい順に並べましょう。",
        choices: ["3", "= 24", "×", "8"],
        orderedChoices: ["8", "×", "3", "= 24"],
        explanation: "8が3つあるので、『8 × 3 = 24』の順に並べます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .sansu2, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu2ListView(isPresenting: .constant(false))
    }
}
