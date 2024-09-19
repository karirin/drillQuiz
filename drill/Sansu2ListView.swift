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
                "7",
                "8",
                "9",
                "10"
            ],
            correctAnswerIndex: 1,
            explanation: "5個と3個を足すと8個になります。"
        ),

        QuizQuestion(
            question: "時計が3時を指しています。あと2時間後は何時ですか？",
            choices: [
                "4時",
                "5時",
                "6時",
                "7時"
            ],
            correctAnswerIndex: 2,
            explanation: "3時に2時間足すと6時になります。"
        ),
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

        QuizQuestion(
            question: "時計が5時を指しています。あと3時間後は何時ですか？",
            choices: [
                "7時",
                "8時",
                "9時",
                "10時"
            ],
            correctAnswerIndex: 3,
            explanation: "5時に3時間足すと8時になります。"
        ),
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
            correctAnswerIndex: 2,
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

        QuizQuestion(
            question: "ノートが6冊ありました。さらに2冊買いました。ノートは全部で何冊ですか？",
            choices: [
                "7冊",
                "8冊",
                "9冊",
                "10冊"
            ],
            correctAnswerIndex: 2,
            explanation: "6冊と2冊を足すと8冊になります。"
        ),

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

        QuizQuestion(
            question: "時計が7時を指しています。あと5時間後は何時ですか？",
            choices: [
                "10時",
                "11時",
                "12時",
                "1時"
            ],
            correctAnswerIndex: 3,
            explanation: "7時に5時間足すと12時になります。"
        ),

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
            correctAnswerIndex: 3,
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
            correctAnswerIndex: 2,
            explanation: "12本から5本を引くと7本残ります。"
        ),

        QuizQuestion(
            question: "7 × 6 はいくつですか？",
            choices: [
                "36",
                "40",
                "42",
                "48"
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
            correctAnswerIndex: 3,
            explanation: "7本と5本を足すと12本になります。"
        ),

        QuizQuestion(
            question: "時計が4時を指しています。あと3時間後は何時ですか？",
            choices: [
                "6時",
                "7時",
                "8時",
                "9時"
            ],
            correctAnswerIndex: 2,
            explanation: "4時に3時間足すと7時になります。"
        ),

        QuizQuestion(
            question: "時計が10時を指しています。あと5時間後は何時ですか？",
            choices: [
                "1時",
                "2時",
                "3時",
                "4時"
            ],
            correctAnswerIndex: 1,
            explanation: "10時に5時間足すと3時になります。"
        ),

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

        QuizQuestion(
            question: "りんごが18個ありました。4個食べました。残りは何個ですか？",
            choices: [
                "13個",
                "14個",
                "15個",
                "16個"
            ],
            correctAnswerIndex: 2,
            explanation: "18個から4個を引くと14個残ります。"
        ),

        QuizQuestion(
            question: "本が8冊あります。さらに6冊買いました。本は全部で何冊ですか？",
            choices: [
                "12冊",
                "13冊",
                "14冊",
                "15冊"
            ],
            correctAnswerIndex: 2,
            explanation: "8冊と6冊を足すと14冊になります。"
        ),

        QuizQuestion(
            question: "時計が2時を指しています。あと3時間後は何時ですか？",
            choices: [
                "4時",
                "5時",
                "6時",
                "7時"
            ],
            correctAnswerIndex: 2,
            explanation: "2時に3時間足すと5時になります。"
        ),

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

        QuizQuestion(
            question: "おはじきが20個ありました。7個使いました。残りは何個ですか？",
            choices: [
                "11個",
                "12個",
                "13個",
                "14個"
            ],
            correctAnswerIndex: 3,
            explanation: "20個から7個を引くと13個残ります。"
        ),

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

        QuizQuestion(
            question: "時計が7時を指しています。あと4時間後は何時ですか？",
            choices: [
                "9時",
                "10時",
                "11時",
                "12時"
            ],
            correctAnswerIndex: 3,
            explanation: "7時に4時間足すと11時になります。"
        ),

        QuizQuestion(
            question: "時計が10時を指しています。あと2時間後は何時ですか？",
            choices: [
                "11時",
                "12時",
                "1時",
                "2時"
            ],
            correctAnswerIndex: 2,
            explanation: "10時に2時間足すと12時になります。"
        ),

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
            correctAnswerIndex: 2,
            explanation: "9冊と4冊を足すと14冊になります。"
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
            correctAnswerIndex: 3,
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
            correctAnswerIndex: 1,
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

        QuizQuestion(
            question: "時計が3時を指しています。あと4時間後は何時ですか？",
            choices: [
                "6時",
                "7時",
                "8時",
                "9時"
            ],
            correctAnswerIndex: 2,
            explanation: "3時に4時間足すと7時になります。"
        ),

        QuizQuestion(
            question: "時計が5時を指しています。あと7時間後は何時ですか？",
            choices: [
                "10時",
                "11時",
                "12時",
                "1時"
            ],
            correctAnswerIndex: 3,
            explanation: "5時に7時間足すと12時になります。"
        ),

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

        QuizQuestion(
            question: "お菓子が22個ありました。友達に6個あげました。残りは何個ですか？",
            choices: [
                "14個",
                "15個",
                "16個",
                "17個"
            ],
            correctAnswerIndex: 3,
            explanation: "22個から6個を引くと16個残ります。"
        ),

        QuizQuestion(
            question: "消しゴムが5個ありました。さらに7個買いました。消しゴムは全部で何個ですか？",
            choices: [
                "10個",
                "11個",
                "12個",
                "13個"
            ],
            correctAnswerIndex: 3,
            explanation: "5個と7個を足すと12個になります。"
        ),

        QuizQuestion(
            question: "時計が6時を指しています。あと5時間後は何時ですか？",
            choices: [
                "9時",
                "10時",
                "11時",
                "12時"
            ],
            correctAnswerIndex: 3,
            explanation: "6時に5時間足すと11時になります。"
        ),

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
