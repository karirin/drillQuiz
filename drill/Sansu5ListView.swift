//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Sansu5ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "6.3 × 4 はいくつですか？",
            choices: [
                "24.8",
                "25.2",
                "26.0",
                "25.6"
            ],
            correctAnswerIndex: 1,
            explanation: "6.3 × 4 = 25.2です。"
        ),

        QuizQuestion(
            question: "縦6cm、横5cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "120立方センチメートル",
                "110立方センチメートル",
                "100立方センチメートル",
                "115立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×5×4=120立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個200円の梨を6個買うといくらですか？",
            choices: [
                "1200円",
                "1100円",
                "1150円",
                "1250円"
            ],
            correctAnswerIndex: 0,
            explanation: "梨1個200円×6個=1200円です。"
        ),

        QuizQuestion(
            question: "7.4 × 3 はいくつですか？",
            choices: [
                "22.0",
                "21.6",
                "22.2",
                "21.8"
            ],
            correctAnswerIndex: 2,
            explanation: "7.4 × 3 = 22.2です。"
        ),

        QuizQuestion(
            question: "縦9cm、横4cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "100立方センチメートル",
                "110立方センチメートル",
                "108立方センチメートル",
                "105立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。9×4×3=108立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個160円のバナナを5個買うといくらですか？",
            choices: [
                "750円",
                "800円",
                "780円",
                "850円"
            ],
            correctAnswerIndex: 1,
            explanation: "バナナ1個160円×5個=800円です。"
        ),

        QuizQuestion(
            question: "5.7 × 3 はいくつですか？",
            choices: [
                "17.1",
                "16.8",
                "17.4",
                "16.5"
            ],
            correctAnswerIndex: 0,
            explanation: "5.7 × 3 = 17.1です。"
        ),

        QuizQuestion(
            question: "縦10cm、横3cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "130立方センチメートル",
                "150立方センチメートル",
                "160立方センチメートル",
                "120立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。10×3×5=150立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個230円のメロンを3個買うといくらですか？",
            choices: [
                "690円",
                "720円",
                "750円",
                "780円"
            ],
            correctAnswerIndex: 0,
            explanation: "メロン1個230円×3個=690円です。"
        ),

        QuizQuestion(
            question: "4.8 × 4 はいくつですか？",
            choices: [
                "19.2",
                "18.8",
                "20.0",
                "19.6"
            ],
            correctAnswerIndex: 0,
            explanation: "4.8 × 4 = 19.2です。"
        ),
        QuizQuestion(
            question: "3.5 × 7 はいくつですか？",
            choices: [
                "24.5",
                "25.0",
                "26.0",
                "23.5"
            ],
            correctAnswerIndex: 0,
            explanation: "3.5 × 7 = 24.5です。"
        ),

        QuizQuestion(
            question: "縦4cm、横7cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "135立方センチメートル",
                "140立方センチメートル",
                "145立方センチメートル",
                "150立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。4×7×5=140立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のイチゴを5個買うといくらですか？",
            choices: [
                "850円",
                "900円",
                "950円",
                "1000円"
            ],
            correctAnswerIndex: 1,
            explanation: "イチゴ1個180円×5個=900円です。"
        ),

        QuizQuestion(
            question: "2.9 × 6 はいくつですか？",
            choices: [
                "16.8",
                "17.4",
                "17.0",
                "18.2"
            ],
            correctAnswerIndex: 1,
            explanation: "2.9 × 6 = 17.4です。"
        ),

        QuizQuestion(
            question: "縦8cm、横3cm、高さ6cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "140立方センチメートル",
                "144立方センチメートル",
                "138立方センチメートル",
                "130立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。8×3×6=144立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個210円のリンゴを3個買うといくらですか？",
            choices: [
                "650円",
                "630円",
                "600円",
                "620円"
            ],
            correctAnswerIndex: 1,
            explanation: "リンゴ1個210円×3個=630円です。"
        ),

        QuizQuestion(
            question: "4.9 × 3 はいくつですか？",
            choices: [
                "14.7",
                "15.2",
                "14.9",
                "15.6"
            ],
            correctAnswerIndex: 0,
            explanation: "4.9 × 3 = 14.7です。"
        ),

        QuizQuestion(
            question: "縦10cm、横5cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "140立方センチメートル",
                "150立方センチメートル",
                "130立方センチメートル",
                "160立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。10×5×3=150立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個230円のマンゴーを4個買うといくらですか？",
            choices: [
                "920円",
                "940円",
                "960円",
                "980円"
            ],
            correctAnswerIndex: 0,
            explanation: "マンゴー1個230円×4個=920円です。"
        ),

        QuizQuestion(
            question: "5.5 × 4 はいくつですか？",
            choices: [
                "22.0",
                "21.5",
                "23.0",
                "20.5"
            ],
            correctAnswerIndex: 0,
            explanation: "5.5 × 4 = 22.0です。"
        ),
        QuizQuestion(
            question: "4.2 × 6 はいくつですか？",
            choices: [
                "25.2",
                "24.4",
                "26.4",
                "23.8"
            ],
            correctAnswerIndex: 0,
            explanation: "4.2 × 6 = 25.2です。"
        ),

        QuizQuestion(
            question: "縦5cm、横7cm、高さ6cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "200立方センチメートル",
                "210立方センチメートル",
                "220立方センチメートル",
                "230立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。5×7×6=210立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個140円のオレンジを8個買うといくらですか？",
            choices: [
                "1120円",
                "1080円",
                "1050円",
                "1100円"
            ],
            correctAnswerIndex: 0,
            explanation: "オレンジ1個140円×8個=1120円です。"
        ),

        QuizQuestion(
            question: "7.3 × 2 はいくつですか？",
            choices: [
                "14.8",
                "15.6",
                "14.6",
                "14.2"
            ],
            correctAnswerIndex: 2,
            explanation: "7.3 × 2 = 14.6です。"
        ),

        QuizQuestion(
            question: "縦6cm、横5cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "110立方センチメートル",
                "120立方センチメートル",
                "130立方センチメートル",
                "140立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×5×4=120立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個200円のスイカを4個買うといくらですか？",
            choices: [
                "800円",
                "900円",
                "850円",
                "750円"
            ],
            correctAnswerIndex: 0,
            explanation: "スイカ1個200円×4個=800円です。"
        ),

        QuizQuestion(
            question: "5.8 × 3 はいくつですか？",
            choices: [
                "16.8",
                "17.4",
                "18.0",
                "17.8"
            ],
            correctAnswerIndex: 1,
            explanation: "5.8 × 3 = 17.4です。"
        ),

        QuizQuestion(
            question: "縦9cm、横5cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "130立方センチメートル",
                "140立方センチメートル",
                "135立方センチメートル",
                "125立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。9×5×3=135立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個220円のメロンを3個買うといくらですか？",
            choices: [
                "660円",
                "650円",
                "700円",
                "720円"
            ],
            correctAnswerIndex: 0,
            explanation: "メロン1個220円×3個=660円です。"
        ),

        QuizQuestion(
            question: "6.7 × 4 はいくつですか？",
            choices: [
                "27.8",
                "26.8",
                "26.2",
                "28.4"
            ],
            correctAnswerIndex: 1,
            explanation: "6.7 × 4 = 26.8です。"
        ),
        QuizQuestion(
            question: "6.4 × 3 はいくつですか？",
            choices: [
                "19.2",
                "20.4",
                "18.6",
                "21.0"
            ],
            correctAnswerIndex: 0,
            explanation: "6.4 × 3 = 19.2です。"
        ),

        QuizQuestion(
            question: "縦8cm、横5cm、高さ6cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "220立方センチメートル",
                "230立方センチメートル",
                "240立方センチメートル",
                "250立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。8×5×6=240立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個160円のバナナを6個買うといくらですか？",
            choices: [
                "900円",
                "920円",
                "960円",
                "1000円"
            ],
            correctAnswerIndex: 2,
            explanation: "バナナ1個160円×6個=960円です。"
        ),

        QuizQuestion(
            question: "5.3 × 4 はいくつですか？",
            choices: [
                "21.2",
                "22.5",
                "20.8",
                "21.6"
            ],
            correctAnswerIndex: 0,
            explanation: "5.3 × 4 = 21.2です。"
        ),

        QuizQuestion(
            question: "縦10cm、横2cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "100立方センチメートル",
                "110立方センチメートル",
                "120立方センチメートル",
                "130立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。10×2×5=100立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個250円のリンゴを4個買うといくらですか？",
            choices: [
                "900円",
                "950円",
                "1000円",
                "1050円"
            ],
            correctAnswerIndex: 2,
            explanation: "リンゴ1個250円×4個=1000円です。"
        ),

        QuizQuestion(
            question: "4.6 × 5 はいくつですか？",
            choices: [
                "23.0",
                "22.8",
                "21.5",
                "24.0"
            ],
            correctAnswerIndex: 0,
            explanation: "4.6 × 5 = 23.0です。"
        ),

        QuizQuestion(
            question: "縦9cm、横3cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "90立方センチメートル",
                "108立方センチメートル",
                "100立方センチメートル",
                "110立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。9×3×4=108立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個220円のメロンを5個買うといくらですか？",
            choices: [
                "1100円",
                "1200円",
                "1150円",
                "1250円"
            ],
            correctAnswerIndex: 0,
            explanation: "メロン1個220円×5個=1100円です。"
        ),

        QuizQuestion(
            question: "3.9 × 4 はいくつですか？",
            choices: [
                "15.2",
                "15.6",
                "14.8",
                "16.0"
            ],
            correctAnswerIndex: 1,
            explanation: "3.9 × 4 = 15.6です。"
        ),
        QuizQuestion(
            question: "5.6 × 3 はいくつですか？",
            choices: [
                "16.8",
                "17.0",
                "15.6",
                "16.2"
            ],
            correctAnswerIndex: 0,
            explanation: "5.6 × 3 = 16.8です。"
        ),

        QuizQuestion(
            question: "縦9cm、横4cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "105立方センチメートル",
                "108立方センチメートル",
                "112立方センチメートル",
                "120立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。9×4×3=108立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個250円のパイナップルを4個買うといくらですか？",
            choices: [
                "1000円",
                "950円",
                "1100円",
                "1200円"
            ],
            correctAnswerIndex: 0,
            explanation: "パイナップル1個250円×4個=1000円です。"
        ),

        QuizQuestion(
            question: "3.8 × 4 はいくつですか？",
            choices: [
                "14.8",
                "15.2",
                "15.4",
                "13.8"
            ],
            correctAnswerIndex: 1,
            explanation: "3.8 × 4 = 15.2です。"
        ),

        QuizQuestion(
            question: "縦7cm、横3cm、高さ6cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "122立方センチメートル",
                "126立方センチメートル",
                "130立方センチメートル",
                "140立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。7×3×6=126立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のぶどうを5個買うといくらですか？",
            choices: [
                "850円",
                "900円",
                "950円",
                "1000円"
            ],
            correctAnswerIndex: 1,
            explanation: "ぶどう1個180円×5個=900円です。"
        ),
        QuizQuestion(
            question: "4.7 × 5 はいくつですか？",
            choices: [
                "23.5",
                "22.5",
                "24.0",
                "25.0"
            ],
            correctAnswerIndex: 0,
            explanation: "4.7 × 5 = 23.5です。"
        ),

        QuizQuestion(
            question: "縦8cm、横5cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "140立方センチメートル",
                "160立方センチメートル",
                "150立方センチメートル",
                "180立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。8×5×4=160立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のイチゴを7個買うといくらですか？",
            choices: [
                "1100円",
                "1260円",
                "1240円",
                "1280円"
            ],
            correctAnswerIndex: 1,
            explanation: "イチゴ1個180円×7個=1260円です。"
        ),

        QuizQuestion(
            question: "6.3 × 2 はいくつですか？",
            choices: [
                "12.4",
                "12.6",
                "12.2",
                "12.0"
            ],
            correctAnswerIndex: 1,
            explanation: "6.3 × 2 = 12.6です。"
        ),

        QuizQuestion(
            question: "縦6cm、横6cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "170立方センチメートル",
                "180立方センチメートル",
                "160立方センチメートル",
                "150立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×6×5=180立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個210円の桃を3個買うといくらですか？",
            choices: [
                "620円",
                "630円",
                "640円",
                "650円"
            ],
            correctAnswerIndex: 1,
            explanation: "桃1個210円×3個=630円です。"
        ),
        QuizQuestion(
            question: "3.6 × 4 はいくつですか？",
            choices: [
                "14.4",
                "13.6",
                "15.2",
                "14.8"
            ],
            correctAnswerIndex: 0,
            explanation: "3.6 × 4 = 14.4です。"
        ),

        QuizQuestion(
            question: "縦10cm、横3cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "120立方センチメートル",
                "130立方センチメートル",
                "150立方センチメートル",
                "160立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。10×3×5=150立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個120円のオレンジを8個買うといくらですか？",
            choices: [
                "950円",
                "960円",
                "880円",
                "980円"
            ],
            correctAnswerIndex: 1,
            explanation: "オレンジ1個120円×8個=960円です。"
        ),

        QuizQuestion(
            question: "7.8 × 3 はいくつですか？",
            choices: [
                "22.4",
                "23.4",
                "24.6",
                "23.8"
            ],
            correctAnswerIndex: 1,
            explanation: "7.8 × 3 = 23.4です。"
        ),

        QuizQuestion(
            question: "縦4cm、横5cm、高さ7cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "130立方センチメートル",
                "140立方センチメートル",
                "150立方センチメートル",
                "160立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。4×5×7=140立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個220円のスイカを3個買うといくらですか？",
            choices: [
                "600円",
                "650円",
                "660円",
                "670円"
            ],
            correctAnswerIndex: 2,
            explanation: "スイカ1個220円×3個=660円です。"
        ),
        QuizQuestion(
            question: "2.5 × 7 はいくつですか？",
            choices: [
                "16.0",
                "17.5",
                "18.5",
                "17.0"
            ],
            correctAnswerIndex: 1,
            explanation: "2.5 × 7 = 17.5です。"
        ),

        QuizQuestion(
            question: "縦7cm、横5cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "120立方センチメートル",
                "130立方センチメートル",
                "140立方センチメートル",
                "150立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。7×5×4=140立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個240円のメロンを3個買うといくらですか？",
            choices: [
                "700円",
                "720円",
                "750円",
                "780円"
            ],
            correctAnswerIndex: 1,
            explanation: "メロン1個240円×3個=720円です。"
        ),

        QuizQuestion(
            question: "6.5 × 3 はいくつですか？",
            choices: [
                "19.0",
                "18.5",
                "19.5",
                "20.0"
            ],
            correctAnswerIndex: 2,
            explanation: "6.5 × 3 = 19.5です。"
        ),

        QuizQuestion(
            question: "縦6cm、横4cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "110立方センチメートル",
                "120立方センチメートル",
                "130立方センチメートル",
                "140立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×4×5=120立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のナシを5個買うといくらですか？",
            choices: [
                "900円",
                "850円",
                "800円",
                "950円"
            ],
            correctAnswerIndex: 0,
            explanation: "ナシ1個180円×5個=900円です。"
        ),
        QuizQuestion(
            question: "3.2 × 6 はいくつですか？",
            choices: [
                "19.2",
                "18.4",
                "20.0",
                "19.8"
            ],
            correctAnswerIndex: 0,
            explanation: "3.2 × 6 = 19.2です。"
        ),

        QuizQuestion(
            question: "縦9cm、横2cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "80立方センチメートル",
                "90立方センチメートル",
                "100立方センチメートル",
                "110立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。9×2×5=90立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個170円のイチゴを6個買うといくらですか？",
            choices: [
                "1020円",
                "960円",
                "1080円",
                "1140円"
            ],
            correctAnswerIndex: 0,
            explanation: "イチゴ1個170円×6個=1020円です。"
        ),

        QuizQuestion(
            question: "7.6 × 2 はいくつですか？",
            choices: [
                "14.8",
                "15.2",
                "16.0",
                "15.6"
            ],
            correctAnswerIndex: 1,
            explanation: "7.6 × 2 = 15.2です。"
        ),

        QuizQuestion(
            question: "縦4cm、横8cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "128立方センチメートル",
                "136立方センチメートル",
                "144立方センチメートル",
                "120立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。4×8×4=128立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個200円のスイカを3個買うといくらですか？",
            choices: [
                "550円",
                "500円",
                "600円",
                "650円"
            ],
            correctAnswerIndex: 2,
            explanation: "スイカ1個200円×3個=600円です。"
        ),
        QuizQuestion(
            question: "4.8 × 3 はいくつですか？",
            choices: [
                "14.4",
                "15.6",
                "14.8",
                "13.6"
            ],
            correctAnswerIndex: 0,
            explanation: "4.8 × 3 = 14.4です。"
        ),

        QuizQuestion(
            question: "縦8cm、横3cm、高さ6cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "144立方センチメートル",
                "136立方センチメートル",
                "128立方センチメートル",
                "138立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。8×3×6=144立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個150円のりんごを4個買うといくらですか？",
            choices: [
                "600円",
                "650円",
                "700円",
                "750円"
            ],
            correctAnswerIndex: 0,
            explanation: "りんご1個150円×4個=600円です。"
        ),

        QuizQuestion(
            question: "5.9 × 2 はいくつですか？",
            choices: [
                "11.6",
                "12.0",
                "11.8",
                "12.2"
            ],
            correctAnswerIndex: 2,
            explanation: "5.9 × 2 = 11.8です。"
        ),

        QuizQuestion(
            question: "縦5cm、横6cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "140立方センチメートル",
                "130立方センチメートル",
                "150立方センチメートル",
                "160立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。5×6×5=150立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のマンゴーを5個買うといくらですか？",
            choices: [
                "900円",
                "850円",
                "950円",
                "1000円"
            ],
            correctAnswerIndex: 0,
            explanation: "マンゴー1個180円×5個=900円です。"
        ),
        QuizQuestion(
            question: "3.9 × 4 はいくつですか？",
            choices: [
                "15.6",
                "14.8",
                "16.2",
                "15.2"
            ],
            correctAnswerIndex: 0,
            explanation: "3.9 × 4 = 15.6です。"
        ),

        QuizQuestion(
            question: "縦7cm、横3cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "84立方センチメートル",
                "90立方センチメートル",
                "100立方センチメートル",
                "80立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。7×3×4=84立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個130円のバナナを7個買うといくらですか？",
            choices: [
                "860円",
                "910円",
                "900円",
                "920円"
            ],
            correctAnswerIndex: 1,
            explanation: "バナナ1個130円×7個=910円です。"
        ),

        QuizQuestion(
            question: "6.7 × 2 はいくつですか？",
            choices: [
                "13.0",
                "13.4",
                "12.8",
                "14.0"
            ],
            correctAnswerIndex: 1,
            explanation: "6.7 × 2 = 13.4です。"
        ),

        QuizQuestion(
            question: "縦4cm、横7cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "130立方センチメートル",
                "140立方センチメートル",
                "150立方センチメートル",
                "120立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。4×7×5=140立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個200円のぶどうを5個買うといくらですか？",
            choices: [
                "800円",
                "1000円",
                "900円",
                "850円"
            ],
            correctAnswerIndex: 1,
            explanation: "ぶどう1個200円×5個=1000円です。"
        ),
        QuizQuestion(
            question: "5.4 × 3 はいくつですか？",
            choices: [
                "16.2",
                "15.0",
                "14.8",
                "16.5"
            ],
            correctAnswerIndex: 0,
            explanation: "5.4 × 3 = 16.2です。"
        ),

        QuizQuestion(
            question: "縦5cm、横5cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "100立方センチメートル",
                "110立方センチメートル",
                "120立方センチメートル",
                "130立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。5×5×4=100立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個160円のキウイを6個買うといくらですか？",
            choices: [
                "940円",
                "960円",
                "1000円",
                "1020円"
            ],
            correctAnswerIndex: 1,
            explanation: "キウイ1個160円×6個=960円です。"
        ),

        QuizQuestion(
            question: "4.3 × 5 はいくつですか？",
            choices: [
                "21.5",
                "22.0",
                "23.5",
                "20.5"
            ],
            correctAnswerIndex: 0,
            explanation: "4.3 × 5 = 21.5です。"
        ),

        QuizQuestion(
            question: "縦6cm、横4cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "110立方センチメートル",
                "115立方センチメートル",
                "120立方センチメートル",
                "130立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×4×5=120立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個250円のマンゴーを4個買うといくらですか？",
            choices: [
                "900円",
                "950円",
                "1000円",
                "1100円"
            ],
            correctAnswerIndex: 2,
            explanation: "マンゴー1個250円×4個=1000円です。"
        ),
        QuizQuestion(
            question: "2.7 × 5 はいくつですか？",
            choices: [
                "12.5",
                "13.5",
                "13.0",
                "14.0"
            ],
            correctAnswerIndex: 1,
            explanation: "2.7 × 5 = 13.5です。"
        ),

        QuizQuestion(
            question: "縦8cm、横4cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "96立方センチメートル",
                "90立方センチメートル",
                "100立方センチメートル",
                "104立方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "直方体の体積は、縦×横×高さで計算します。8×4×3=96立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のパイナップルを4個買うといくらですか？",
            choices: [
                "720円",
                "700円",
                "750円",
                "800円"
            ],
            correctAnswerIndex: 0,
            explanation: "パイナップル1個180円×4個=720円です。"
        ),

        QuizQuestion(
            question: "3.2 × 4 はいくつですか？",
            choices: [
                "12.8",
                "13.2",
                "11.8",
                "14.0"
            ],
            correctAnswerIndex: 0,
            explanation: "3.2 × 4 = 12.8です。"
        ),

        QuizQuestion(
            question: "縦6cm、横3cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "60立方センチメートル",
                "72立方センチメートル",
                "74立方センチメートル",
                "68立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×3×4=72立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個220円のマンゴーを3個買うといくらですか？",
            choices: [
                "650円",
                "660円",
                "700円",
                "770円"
            ],
            correctAnswerIndex: 1,
            explanation: "マンゴー1個220円×3個=660円です。"
        ),
        QuizQuestion(
            question: "6.3 × 2 はいくつですか？",
            choices: [
                "12.6",
                "13.2",
                "11.8",
                "12.0"
            ],
            correctAnswerIndex: 0,
            explanation: "6.3 × 2 = 12.6です。"
        ),

        QuizQuestion(
            question: "縦7cm、横2cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "40立方センチメートル",
                "42立方センチメートル",
                "45立方センチメートル",
                "50立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。7×2×3=42立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個120円のメロンを5個買うといくらですか？",
            choices: [
                "600円",
                "500円",
                "550円",
                "700円"
            ],
            correctAnswerIndex: 0,
            explanation: "メロン1個120円×5個=600円です。"
        ),

        QuizQuestion(
            question: "4.7 × 3 はいくつですか？",
            choices: [
                "13.9",
                "14.1",
                "14.3",
                "15.0"
            ],
            correctAnswerIndex: 1,
            explanation: "4.7 × 3 = 14.1です。"
        ),

        QuizQuestion(
            question: "縦5cm、横5cm、高さ2cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "45立方センチメートル",
                "50立方センチメートル",
                "55立方センチメートル",
                "60立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。5×5×2=50立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個250円の桃を3個買うといくらですか？",
            choices: [
                "650円",
                "700円",
                "750円",
                "800円"
            ],
            correctAnswerIndex: 2,
            explanation: "桃1個250円×3個=750円です。"
        ),
        QuizQuestion(
            question: "5.2 × 3 はいくつですか？",
            choices: [
                "15.6",
                "14.8",
                "16.2",
                "17.0"
            ],
            correctAnswerIndex: 0,
            explanation: "5.2 × 3 = 15.6です。"
        ),

        QuizQuestion(
            question: "縦4cm、横3cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "50立方センチメートル",
                "60立方センチメートル",
                "70立方センチメートル",
                "80立方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "直方体の体積は、縦×横×高さで計算します。4×3×5=60立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個200円のぶどうを4個買うといくらですか？",
            choices: [
                "800円",
                "700円",
                "900円",
                "1000円"
            ],
            correctAnswerIndex: 0,
            explanation: "ぶどう1個200円×4個=800円です。"
        ),

        QuizQuestion(
            question: "7.4 × 2 はいくつですか？",
            choices: [
                "14.8",
                "15.4",
                "13.6",
                "12.8"
            ],
            correctAnswerIndex: 0,
            explanation: "7.4 × 2 = 14.8です。"
        ),

        QuizQuestion(
            question: "縦3cm、横6cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "80立方センチメートル",
                "70立方センチメートル",
                "90立方センチメートル",
                "100立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。3×6×5=90立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個180円のりんごを5個買うといくらですか？",
            choices: [
                "800円",
                "850円",
                "900円",
                "950円"
            ],
            correctAnswerIndex: 2,
            explanation: "りんご1個180円×5個=900円です。"
        ),
        QuizQuestion(
            question: "3.6 × 2 はいくつですか？",
            choices: [
                "6.8",
                "7.2",
                "7.6",
                "8.0"
            ],
            correctAnswerIndex: 1,
            explanation: "3.6 × 2 = 7.2です。"
        ),

        QuizQuestion(
            question: "縦5cm、横4cm、高さ3cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "50立方センチメートル",
                "55立方センチメートル",
                "60立方センチメートル",
                "65立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。5×4×3=60立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個150円のオレンジを3個買うといくらですか？",
            choices: [
                "350円",
                "400円",
                "450円",
                "500円"
            ],
            correctAnswerIndex: 2,
            explanation: "オレンジ1個150円×3個=450円です。"
        ),

        QuizQuestion(
            question: "4.5 × 3 はいくつですか？",
            choices: [
                "12.5",
                "13.5",
                "14.0",
                "15.5"
            ],
            correctAnswerIndex: 1,
            explanation: "4.5 × 3 = 13.5です。"
        ),

        QuizQuestion(
            question: "縦6cm、横2cm、高さ5cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "50立方センチメートル",
                "55立方センチメートル",
                "60立方センチメートル",
                "65立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×2×5=60立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個120円のバナナを4個買うといくらですか？",
            choices: [
                "420円",
                "440円",
                "480円",
                "500円"
            ],
            correctAnswerIndex: 2,
            explanation: "バナナ1個120円×4個=480円です。"
        ),
        QuizQuestion(
            question: "2.5 × 4 はいくつですか？",
            choices: [
                "6.5",
                "8.0",
                "9.5",
                "10.0"
            ],
            correctAnswerIndex: 3,
            explanation: "2.5 × 4 = 10.0です。"
        ),

        QuizQuestion(
            question: "縦2cm、横3cm、高さ4cmの直方体の体積は何立方センチメートルですか？",
            choices: [
                "18立方センチメートル",
                "20立方センチメートル",
                "24立方センチメートル",
                "30立方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。2×3×4=24立方センチメートルです。"
        ),

        QuizQuestion(
            question: "リンゴ1個が100円です。5個買うといくらですか？",
            choices: [
                "400円",
                "500円",
                "600円",
                "700円"
            ],
            correctAnswerIndex: 1,
            explanation: "リンゴ1個100円×5個=500円です。"
        ),

        QuizQuestion(
        question: "5.28 × 1.5 はいくつですか？",
        choices: [
        "0.792",
        "6.78",
        "79.2",
        "7.92"
        ],
        correctAnswerIndex: 3,
        explanation: "5.28 × 1.5 = 7.92です。"
        ),

        QuizQuestion(
        question: "16.38 ÷ 1.3 はいくつですか？",
        choices: [
        "12.6",
        "126",
        "21.6",
        "1.26"
        ],
        correctAnswerIndex: 0,
        explanation: "わる数とわられる数を10倍すると、163.8 ÷ 13になります。163.8 ÷ 13 = 12.6なので、答えは12.6です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】2.016 ÷ 0.32 = ＿＿ に入る数を答えましょう。",
        answer: "6.3",
        acceptableAnswers: ["6.30", "６．３"],
        explanation: "わる数とわられる数を100倍すると、201.6 ÷ 32 = 6.3です。したがって、＿＿に入る数は6.3です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】1.25 × 3.2を、1.25 × 32を利用して求める手順を正しい順に並べましょう。",
        choices: [
        "40 ÷ 10 = 4を計算する",
        "1.25 × 32 = 40を求める",
        "1.25 × 3.2 = 4と答える",
        "3.2は32を10でわった数だと考える"
        ],
        orderedChoices: [
        "3.2は32を10でわった数だと考える",
        "1.25 × 32 = 40を求める",
        "40 ÷ 10 = 4を計算する",
        "1.25 × 3.2 = 4と答える"
        ],
        explanation: "3.2は32を10でわった数です。まず1.25 × 32 = 40を求め、40を10でわると4になるので、1.25 × 3.2 = 4です。"
        ),

        QuizQuestion(
        question: "5/14 + 3/7 はいくつですか？",
        choices: [
        "11/14",
        "10/14",
        "8/21",
        "4/7"
        ],
        correctAnswerIndex: 0,
        explanation: "3/7を6/14に直すと、5/14 + 6/14 = 11/14です。"
        ),

        QuizQuestion(
        question: "4と1/5 - 2と7/12 はいくつですか？",
        choices: [
        "1と7/12",
        "1と23/60",
        "2と37/60",
        "1と37/60"
        ],
        correctAnswerIndex: 3,
        explanation: "1/5を12/60、7/12を35/60に直します。4と12/60から1をくずして3と72/60と考えると、3と72/60 - 2と35/60 = 1と37/60です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】7/9 - 5/12 = ＿＿ に入る分数を答えましょう。",
        answer: "13/36",
        acceptableAnswers: ["１３／３６", "13／36", "36分の13"],
        explanation: "7/9を28/36、5/12を15/36に直すと、28/36 - 15/36 = 13/36です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】左の分数と大きさが等しい分数を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "6/11", match: "30/55"),
        QuizMatchingPair(prompt: "7/16", match: "21/48"),
        QuizMatchingPair(prompt: "9/20", match: "36/80"),
        QuizMatchingPair(prompt: "13/18", match: "39/54")
        ],
        choices: ["36/80", "30/55", "39/54", "21/48"],
        explanation: "6/11は30/55、7/16は21/48、9/20は36/80、13/18は39/54と大きさが等しいです。"
        ),

        QuizQuestion(
        question: "120mの道のうち96mを歩きました。道全体をもとにした、歩いた長さの割合を小数で表すといくつですか？",
        choices: [
        "0.2",
        "0.8",
        "1.25",
        "0.75"
        ],
        correctAnswerIndex: 1,
        explanation: "歩いた長さ96mを、道全体の長さ120mでわります。96 ÷ 120 = 0.8なので、割合は0.8です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】7.2Lをもとにすると、9.9Lは ＿＿ 倍です。",
        answer: "1.375",
        acceptableAnswers: ["１．３７５"],
        explanation: "比べる量9.9Lを、もとにする量7.2Lでわります。9.9 ÷ 7.2 = 1.375なので、1.375倍です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】予定した距離に対する実際に走った距離の割合が最も大きいコースを答えましょう。",
        answer: "南コース",
        acceptableAnswers: ["南"],
        referenceTitle: "マラソン練習の予定と実際の距離",
        referenceRows: [
        QuizReferenceRow(label: "東コース", value: "予定70km・実際56km"),
        QuizReferenceRow(label: "西コース", value: "予定75km・実際63km"),
        QuizReferenceRow(label: "南コース", value: "予定88km・実際77km")
        ],
        explanation: "予定した距離に対する実際の距離の割合は、東コースが56 ÷ 70 = 0.8、西コースが63 ÷ 75 = 0.84、南コースが77 ÷ 88 = 0.875です。最も大きいのは南コースです。"
        ),

        QuizQuestion(
        question: "860の35%はいくつですか？",
        choices: [
        "301",
        "1161",
        "258",
        "30.1"
        ],
        correctAnswerIndex: 0,
        explanation: "35%を小数で表すと0.35です。860 × 0.35 = 301なので、答えは301です。"
        ),

        QuizQuestion(
        question: "ある町の人口が前年より12%増えて504人になりました。前年の人口は何人ですか？",
        choices: [
        "440人",
        "564人",
        "450人",
        "448人"
        ],
        correctAnswerIndex: 2,
        explanation: "504人は前年の112%にあたります。504 ÷ 1.12 = 450なので、前年の人口は450人です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】もとの価格に対する値下げ額の割合が最も大きい商品を答えましょう。",
        answer: "B商品",
        acceptableAnswers: ["B"],
        referenceTitle: "商品の値下げ前と値下げ後の価格",
        referenceRows: [
        QuizReferenceRow(label: "A商品", value: "2400円から2040円"),
        QuizReferenceRow(label: "B商品", value: "3500円から2870円"),
        QuizReferenceRow(label: "C商品", value: "4200円から3486円")
        ],
        explanation: "値下げ額の割合は、A商品が360 ÷ 2400 = 0.15で15%、B商品が630 ÷ 3500 = 0.18で18%、C商品が714 ÷ 4200 = 0.17で17%です。最も大きいのはB商品です。"
        ),

        QuizQuestion(
        question: "5回のボール投げの記録が13.5m、14.2m、12.8m、15.1m、14.4mでした。平均は何mですか？",
        choices: [
        "14.0m",
        "13.8m",
        "14.2m",
        "70.0m"
        ],
        correctAnswerIndex: 0,
        explanation: "5回の合計は13.5 + 14.2 + 12.8 + 15.1 + 14.4 = 70.0mです。70.0 ÷ 5 = 14.0なので、平均は14.0mです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】6日間に集めた落ち葉の平均は42袋でした。はじめの5日間が38袋、45袋、41袋、39袋、44袋のとき、6日目は ＿＿ 袋です。",
        answer: "45",
        acceptableAnswers: ["４５"],
        explanation: "6日間の合計は42 × 6 = 252袋です。はじめの5日間の合計は38 + 45 + 41 + 39 + 44 = 207袋なので、6日目は252 - 207 = 45袋です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】平均が2.6Lの容器5個に、3.8L入った容器を1個加えたときの平均を求める手順を正しい順に並べましょう。",
        choices: [
        "16.8 ÷ 6 = 2.8を計算する",
        "新しい平均は2.8Lと答える",
        "13 + 3.8 = 16.8Lを求める",
        "2.6 × 5 = 13Lで、はじめの5個の合計を求める"
        ],
        orderedChoices: [
        "2.6 × 5 = 13Lで、はじめの5個の合計を求める",
        "13 + 3.8 = 16.8Lを求める",
        "16.8 ÷ 6 = 2.8を計算する",
        "新しい平均は2.8Lと答える"
        ],
        explanation: "はじめの5個の合計は2.6 × 5 = 13Lです。3.8Lを加えると16.8Lになり、16.8 ÷ 6 = 2.8なので、新しい平均は2.8Lです。"
        ),

        QuizQuestion(
        question: "7.5分で180枚を印刷する機械があります。1分あたり何枚印刷しますか？",
        choices: [
        "18枚",
        "25枚",
        "24枚",
        "22.5枚"
        ],
        correctAnswerIndex: 2,
        explanation: "180 ÷ 7.5 = 24なので、1分あたり24枚印刷します。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】それぞれの場面から求められる1あたりの量を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "9kgで1350円のじゃがいも", match: "1kg150円"),
        QuizMatchingPair(prompt: "1.6時間で22.4km進む自転車", match: "1時間で14km"),
        QuizMatchingPair(prompt: "18.9Lの水を7個の容器に同じ量ずつ分ける", match: "1個2.7L"),
        QuizMatchingPair(prompt: "4.5mで3.15kgの棒", match: "1mで0.7kg")
        ],
        choices: ["1個2.7L", "1mで0.7kg", "1kg150円", "1時間で14km"],
        explanation: "1350 ÷ 9 = 150、22.4 ÷ 1.6 = 14、18.9 ÷ 7 = 2.7、3.15 ÷ 4.5 = 0.7なので、それぞれ1kg150円、1時間で14km、1個2.7L、1mで0.7kgです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】米1kgあたりの値段が最も安い店を答えましょう。",
        answer: "B店",
        acceptableAnswers: ["B"],
        referenceTitle: "米の重さと値段",
        referenceRows: [
        QuizReferenceRow(label: "A店", value: "1.2kgで840円"),
        QuizReferenceRow(label: "B店", value: "1.5kgで990円"),
        QuizReferenceRow(label: "C店", value: "2kgで1360円")
        ],
        explanation: "1kgあたりの値段は、A店が840 ÷ 1.2 = 700円、B店が990 ÷ 1.5 = 660円、C店が1360 ÷ 2 = 680円です。最も安いのはB店です。"
        ),

        QuizQuestion(
        question: "縦4.8cm、横2.5cm、体積90立方センチメートルの直方体があります。高さは何cmですか？",
        choices: [
        "108cm",
        "7.5cm",
        "6cm",
        "12cm"
        ],
        correctAnswerIndex: 1,
        explanation: "底面積は4.8 × 2.5 = 12平方センチメートルです。90 ÷ 12 = 7.5なので、高さは7.5cmです。"
        ),

        QuizQuestion(
        question: "底面の内のりが縦60cm、横40cmの水そうに72Lの水が入っています。水の深さは何cmですか？",
        choices: [
        "3cm",
        "300cm",
        "30cm",
        "24cm"
        ],
        correctAnswerIndex: 2,
        explanation: "72Lは72000立方センチメートルです。底面積は60 × 40 = 2400平方センチメートルなので、72000 ÷ 2400 = 30です。水の深さは30cmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】58.5Lは ＿＿ 立方センチメートルです。",
        answer: "58500",
        acceptableAnswers: ["５８５００"],
        explanation: "1Lは1000立方センチメートルです。58.5 × 1000 = 58500なので、58.5Lは58500立方センチメートルです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】水そうの空いている部分の体積をLで答えましょう。",
        answer: "21.6",
        acceptableAnswers: ["２１．６"],
        referenceTitle: "直方体の水そう",
        referenceRows: [
        QuizReferenceRow(label: "水そうの内のり", value: "縦50cm・横36cm・高さ40cm"),
        QuizReferenceRow(label: "水の深さ", value: "28cm")
        ],
        explanation: "空いている部分の高さは40 - 28 = 12cmです。50 × 36 × 12 = 21600立方センチメートルで、21600立方センチメートルは21.6Lです。"
        ),

        QuizQuestion(
        question: "四角形ABCDと四角形EFGHは合同で、AとG、BとH、CとE、DとFが対応しています。辺HEに対応する辺はどれですか？",
        choices: [
        "辺AB",
        "辺BC",
        "辺DA",
        "辺CD"
        ],
        correctAnswerIndex: 1,
        explanation: "HはBに、EはCに対応しています。したがって、辺HEに対応する辺は辺BCです。"
        ),

        QuizQuestion(
        question: "三角形ABCと三角形PQRは合同で、AとR、BとP、CとQが対応しています。角Rが58°、角Qが47°のとき、角Pは何度ですか？",
        choices: [
        "75°",
        "58°",
        "47°",
        "65°"
        ],
        correctAnswerIndex: 0,
        explanation: "角Aは角Rと対応するので58°、角Cは角Qと対応するので47°です。三角形の内角の和から、角Bは180° - 58° - 47° = 75°です。角Bと角Pが対応するので、角Pは75°です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】辺DEが6.5cm、角Dが50°、角Eが70°の三角形DEFをかく手順を正しい順に並べましょう。",
        choices: [
        "2本の半直線の交点をFとする",
        "点Eで、辺EDとの角が70°になる半直線をかく",
        "6.5cmの線分DEをかく",
        "点Dで、辺DEとの角が50°になる半直線をかく"
        ],
        orderedChoices: [
        "6.5cmの線分DEをかく",
        "点Dで、辺DEとの角が50°になる半直線をかく",
        "点Eで、辺EDとの角が70°になる半直線をかく",
        "2本の半直線の交点をFとする"
        ],
        explanation: "まず6.5cmの線分DEをかきます。次に、線分DEの同じ側に、点Dで50°、点Eで70°の半直線をかき、2本の半直線の交点をFとします。"
        ),

        QuizQuestion(
        question: "1つの内角が150°である正多角形は、何角形ですか？",
        choices: [
        "正二十角形",
        "正十角形",
        "正十二角形",
        "正十五角形"
        ],
        correctAnswerIndex: 2,
        explanation: "1つの外角は180° - 150° = 30°です。正多角形の外角の和は360°なので、360 ÷ 30 = 12です。したがって、正十二角形です。"
        ),

        QuizQuestion(
        question: "十一角形の内角の和は、八角形の内角の和より何度大きいですか？",
        choices: [
        "540°",
        "360°",
        "720°",
        "900°"
        ],
        correctAnswerIndex: 0,
        explanation: "十一角形の内角の和は180 × 9 = 1620°、八角形の内角の和は180 × 6 = 1080°です。1620 - 1080 = 540なので、540°大きいです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】十二角形に引ける対角線は、全部で ＿＿ 本です。",
        answer: "54",
        acceptableAnswers: ["５４"],
        explanation: "1つの頂点から引ける対角線は12 - 3 = 9本です。12個の頂点で数えると12 × 9 = 108本ですが、同じ対角線を2回ずつ数えているので、108 ÷ 2 = 54本です。"
        ),
        QuizQuestion(
        question: "2.64 × 1.25 はいくつですか？",
        choices: [
        "0.33",
        "3.3",
        "33",
        "3.89"
        ],
        correctAnswerIndex: 1,
        explanation: "2.64 × 1.25 = 3.3です。"
        ),

        QuizQuestion(
        question: "14.56 ÷ 0.8 はいくつですか？",
        choices: [
        "11.648",
        "182",
        "1.82",
        "18.2"
        ],
        correctAnswerIndex: 3,
        explanation: "わる数とわられる数を10倍すると、145.6 ÷ 8になります。145.6 ÷ 8 = 18.2なので、答えは18.2です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.945 ÷ 0.15 = ＿＿ に入る数を答えましょう。",
        answer: "6.3",
        acceptableAnswers: ["6.30", "６．３"],
        explanation: "わる数とわられる数を100倍すると、94.5 ÷ 15 = 6.3です。したがって、＿＿に入る数は6.3です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】0.72 × 3.5を筆算で求める手順を正しい順に並べましょう。",
        choices: [
        "2520の右から3けた分を小数部分として、2.520とする",
        "0.72 × 3.5 = 2.52と答える",
        "小数点を取って72 × 35を計算する",
        "72 × 35 = 2520を求める"
        ],
        orderedChoices: [
        "小数点を取って72 × 35を計算する",
        "72 × 35 = 2520を求める",
        "2520の右から3けた分を小数部分として、2.520とする",
        "0.72 × 3.5 = 2.52と答える"
        ],
        explanation: "72 × 35 = 2520を計算します。もとの2つの数の小数部分は合わせて3けたなので、積を2.520とし、答えは2.52です。"
        ),

        QuizQuestion(
        question: "11/15 - 2/9 はいくつですか？",
        choices: [
        "7/15",
        "9/45",
        "23/45",
        "13/45"
        ],
        correctAnswerIndex: 2,
        explanation: "11/15を33/45、2/9を10/45に直すと、33/45 - 10/45 = 23/45です。"
        ),

        QuizQuestion(
        question: "1と7/12 + 2と5/18 はいくつですか？",
        choices: [
        "3と31/36",
        "4と1/36",
        "3と12/30",
        "3と17/36"
        ],
        correctAnswerIndex: 0,
        explanation: "7/12を21/36、5/18を10/36に直すと、1と21/36 + 2と10/36 = 3と31/36です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】4/7 + 5/14 = ＿＿ に入る分数を答えましょう。",
        answer: "13/14",
        acceptableAnswers: ["１３／１４", "13／14", "14分の13"],
        explanation: "4/7を8/14に直すと、8/14 + 5/14 = 13/14です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】左の分数と等しい大きさの分数を、右の選択肢から選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "3/8", match: "15/40"),
        QuizMatchingPair(prompt: "7/12", match: "35/60"),
        QuizMatchingPair(prompt: "5/14", match: "20/56"),
        QuizMatchingPair(prompt: "11/16", match: "33/48")
        ],
        choices: ["20/56", "33/48", "15/40", "35/60"],
        explanation: "3/8は15/40、7/12は35/60、5/14は20/56、11/16は33/48と大きさが等しいです。"
        ),

        QuizQuestion(
        question: "120個のうち84個が合格品でした。全体の個数をもとにした合格品の割合を、小数で表すといくつですか？",
        choices: [
        "0.84",
        "1.4",
        "1.2",
        "0.7"
        ],
        correctAnswerIndex: 3,
        explanation: "合格品の個数84を、全体の個数120でわります。84 ÷ 120 = 0.7なので、割合は0.7です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】4.5mをもとにすると、5.85mは ＿＿ 倍です。",
        answer: "1.3",
        acceptableAnswers: ["１．３"],
        explanation: "比べる量5.85mを、もとにする量4.5mでわります。5.85 ÷ 4.5 = 1.3なので、1.3倍です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】予定数に対する完成数の割合が最も大きいグループを答えましょう。",
        answer: "Bグループ",
        acceptableAnswers: ["B"],
        referenceTitle: "工作の予定数と完成数",
        referenceRows: [
        QuizReferenceRow(label: "Aグループ", value: "予定90個・完成72個"),
        QuizReferenceRow(label: "Bグループ", value: "予定80個・完成68個"),
        QuizReferenceRow(label: "Cグループ", value: "予定100個・完成81個")
        ],
        explanation: "完成数の割合は、Aグループが72 ÷ 90 = 0.8、Bグループが68 ÷ 80 = 0.85、Cグループが81 ÷ 100 = 0.81です。最も大きいのはBグループです。"
        ),

        QuizQuestion(
        question: "750の16%はいくつですか？",
        choices: [
        "160",
        "120",
        "1200",
        "75"
        ],
        correctAnswerIndex: 1,
        explanation: "16%を小数で表すと0.16です。750 × 0.16 = 120なので、答えは120です。"
        ),

        QuizQuestion(
        question: "ある商品を20%引きで買ったところ、代金は6400円でした。この商品の定価はいくらですか？",
        choices: [
        "9600円",
        "7200円",
        "8000円",
        "7680円"
        ],
        correctAnswerIndex: 2,
        explanation: "20%引きの代金は定価の80%です。定価を□円とすると、□ × 0.8 = 6400なので、6400 ÷ 0.8 = 8000です。定価は8000円です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】先月をもとにした今月の増加率が最も大きい色を答えましょう。",
        answer: "黄",
        acceptableAnswers: ["黄色"],
        referenceTitle: "色別カードの使用枚数",
        referenceRows: [
        QuizReferenceRow(label: "赤", value: "先月200枚・今月230枚"),
        QuizReferenceRow(label: "青", value: "先月320枚・今月352枚"),
        QuizReferenceRow(label: "黄", value: "先月150枚・今月180枚")
        ],
        explanation: "増加率は、赤が30 ÷ 200 = 0.15で15%、青が32 ÷ 320 = 0.1で10%、黄が30 ÷ 150 = 0.2で20%です。最も大きいのは黄です。"
        ),

        QuizQuestion(
        question: "6回の記録が24点、19点、27点、21点、26点、15点でした。平均は何点ですか？",
        choices: [
        "23点",
        "21点",
        "20点",
        "22点"
        ],
        correctAnswerIndex: 3,
        explanation: "6回の合計は24 + 19 + 27 + 21 + 26 + 15 = 132点です。132 ÷ 6 = 22なので、平均は22点です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】5日間に集めた空き缶の平均は28個でした。はじめの4日間が25個、31個、27個、30個のとき、5日目は ＿＿ 個です。",
        answer: "27",
        acceptableAnswers: ["２７"],
        explanation: "5日間の合計は28 × 5 = 140個です。はじめの4日間の合計は25 + 31 + 27 + 30 = 113個なので、5日目は140 - 113 = 27個です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】平均が18gの品物4個に、22gの品物を1個加えたときの平均を求める手順を正しい順に並べましょう。",
        choices: [
        "94 ÷ 5 = 18.8を計算する",
        "新しい平均は18.8gと答える",
        "72 + 22 = 94gを求める",
        "18 × 4 = 72gで、はじめの4個の合計を求める"
        ],
        orderedChoices: [
        "18 × 4 = 72gで、はじめの4個の合計を求める",
        "72 + 22 = 94gを求める",
        "94 ÷ 5 = 18.8を計算する",
        "新しい平均は18.8gと答える"
        ],
        explanation: "はじめの4個の合計は18 × 4 = 72gです。22gを加えると94gになり、94 ÷ 5 = 18.8なので、新しい平均は18.8gです。"
        ),

        QuizQuestion(
        question: "2.4kgで1800円の米があります。100gあたりの値段はいくらですか？",
        choices: [
        "432円",
        "75円",
        "180円",
        "750円"
        ],
        correctAnswerIndex: 1,
        explanation: "2.4kgは100gが24個分です。1800 ÷ 24 = 75なので、100gあたりの値段は75円です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】各場面から求められる単位量を、正しい答えと組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1040円で8冊のノート", match: "1冊130円"),
        QuizMatchingPair(prompt: "15mで12kgのロープ", match: "1mで0.8kg"),
        QuizMatchingPair(prompt: "2.5時間で95km進む", match: "1時間で38km"),
        QuizMatchingPair(prompt: "21.6Lの水を6人で同じ量ずつ分ける", match: "1人3.6L")
        ],
        choices: ["1時間で38km", "1人3.6L", "1冊130円", "1mで0.8kg"],
        explanation: "1040 ÷ 8 = 130、12 ÷ 15 = 0.8、95 ÷ 2.5 = 38、21.6 ÷ 6 = 3.6なので、それぞれ1冊130円、1mで0.8kg、1時間で38km、1人3.6Lです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】ノート1冊あたりの値段が最も安い店を答えましょう。",
        answer: "B店",
        acceptableAnswers: ["B"],
        referenceTitle: "ノートのセット販売",
        referenceRows: [
        QuizReferenceRow(label: "A店", value: "5冊で650円"),
        QuizReferenceRow(label: "B店", value: "8冊で960円"),
        QuizReferenceRow(label: "C店", value: "12冊で1500円")
        ],
        explanation: "1冊あたりの値段は、A店が650 ÷ 5 = 130円、B店が960 ÷ 8 = 120円、C店が1500 ÷ 12 = 125円です。最も安いのはB店です。"
        ),

        QuizQuestion(
        question: "1辺が5.5cmの立方体の体積は何立方センチメートルですか？",
        choices: [
        "166.375立方センチメートル",
        "302.5立方センチメートル",
        "90.75立方センチメートル",
        "30.25立方センチメートル"
        ],
        correctAnswerIndex: 0,
        explanation: "立方体の体積は、1辺 × 1辺 × 1辺で求めます。5.5 × 5.5 × 5.5 = 166.375なので、166.375立方センチメートルです。"
        ),

        QuizQuestion(
        question: "底面の内のりが縦48cm、横25cmの水そうに30Lの水が入っています。水の深さは何cmですか？",
        choices: [
        "30cm",
        "25cm",
        "20cm",
        "24cm"
        ],
        correctAnswerIndex: 1,
        explanation: "30Lは30000立方センチメートルです。底面積は48 × 25 = 1200平方センチメートルなので、30000 ÷ 1200 = 25です。水の深さは25cmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】縦7.2cm、横3.5cm、高さ4cmの直方体の体積は ＿＿ 立方センチメートルです。",
        answer: "100.8",
        acceptableAnswers: ["１００．８"],
        explanation: "直方体の体積は、縦 × 横 × 高さで求めます。7.2 × 3.5 × 4 = 100.8なので、体積は100.8立方センチメートルです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】水の量を計算し、最も多く水が入っている水そうを答えましょう。",
        answer: "Bの水そう",
        acceptableAnswers: ["B", "B水そう"],
        referenceTitle: "水そうの内のりと水面の高さ",
        referenceRows: [
        QuizReferenceRow(label: "Aの水そう", value: "縦40cm・横25cm・高さ30cmの70%まで"),
        QuizReferenceRow(label: "Bの水そう", value: "縦36cm・横30cm・高さ28cmの75%まで"),
        QuizReferenceRow(label: "Cの水そう", value: "縦45cm・横24cm・高さ25cmの80%まで")
        ],
        explanation: "水の体積は、Aが40 × 25 × 21 = 21000立方センチメートル、Bが36 × 30 × 21 = 22680立方センチメートル、Cが45 × 24 × 20 = 21600立方センチメートルです。最も大きいのはBの水そうです。"
        ),

        QuizQuestion(
        question: "五角形ABCDEと五角形PQRSTは合同で、AとR、BとS、CとT、DとP、EとQが対応しています。辺PQに対応する辺はどれですか？",
        choices: [
        "辺DE",
        "辺CD",
        "辺BC",
        "辺AB"
        ],
        correctAnswerIndex: 0,
        explanation: "PはDに、QはEに対応しています。したがって、辺PQに対応する辺は辺DEです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】三角形LMNと三角形XYZは合同で、LとZ、MとX、NとYが対応しています。角Xが74°のとき、角Mは ＿＿ 度です。",
        answer: "74",
        acceptableAnswers: ["７４"],
        explanation: "合同な図形では、対応する角の大きさは等しくなります。角Mと角Xが対応するので、角Mは74°です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】辺ABが8cm、角Aが45°、角Bが60°の三角形ABCをかく手順を正しい順に並べましょう。",
        choices: [
        "2本の半直線の交点をCとする",
        "8cmの線分ABをかく",
        "点Bで、辺BAとの角が60°になる半直線をかく",
        "点Aで、辺ABとの角が45°になる半直線をかく"
        ],
        orderedChoices: [
        "8cmの線分ABをかく",
        "点Aで、辺ABとの角が45°になる半直線をかく",
        "点Bで、辺BAとの角が60°になる半直線をかく",
        "2本の半直線の交点をCとする"
        ],
        explanation: "まず8cmの線分ABをかきます。次に、線分ABの同じ側に、点Aで45°、点Bで60°の半直線をかき、2本の半直線の交点をCとします。"
        ),

        QuizQuestion(
        question: "十八角形の内角の和は何度ですか？",
        choices: [
        "3240°",
        "2880°",
        "3060°",
        "2700°"
        ],
        correctAnswerIndex: 1,
        explanation: "十八角形は1つの頂点から16個の三角形に分けられます。180 × 16 = 2880なので、内角の和は2880°です。"
        ),

        QuizQuestion(
        question: "正十二角形の1つの外角は何度ですか？",
        choices: [
        "30°",
        "144°",
        "150°",
        "24°"
        ],
        correctAnswerIndex: 0,
        explanation: "正多角形の外角の和は360°です。正十二角形では12個の外角が等しいので、360 ÷ 12 = 30°です。"
        ),

        QuizQuestion(
        question: "十一角形に引ける対角線は全部で何本ですか？",
        choices: [
        "36本",
        "40本",
        "44本",
        "55本"
        ],
        correctAnswerIndex: 2,
        explanation: "1つの頂点から引ける対角線は11 - 3 = 8本です。11個の頂点で数えると11 × 8 = 88本ですが、同じ対角線を2回ずつ数えているので、88 ÷ 2 = 44本です。"
        ),
        QuizQuestion(
        question: "3.75 × 0.4 はいくつですか？",
        choices: [
        "4.15",
        "15",
        "1.5",
        "0.15"
        ],
        correctAnswerIndex: 2,
        explanation: "3.75 × 0.4 = 1.5です。"
        ),

        QuizQuestion(
        question: "18.9 ÷ 0.45 はいくつですか？",
        choices: [
        "420",
        "42",
        "8.505",
        "4.2"
        ],
        correctAnswerIndex: 1,
        explanation: "わる数とわられる数を100倍すると、1890 ÷ 45になります。1890 ÷ 45 = 42なので、答えは42です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.672 ÷ 0.16 = ＿＿ に入る数を答えましょう。",
        answer: "4.2",
        acceptableAnswers: ["4.20", "４．２"],
        explanation: "わる数とわられる数を100倍すると、67.2 ÷ 16 = 4.2です。したがって、＿＿に入る数は4.2です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】4.08 ÷ 1.2を計算して確かめる手順を正しい順に並べましょう。",
        choices: [
        "1.2 × 3.4 = 4.08で確かめる",
        "4.08 ÷ 1.2 = 3.4と答える",
        "わる数とわられる数を10倍して、40.8 ÷ 12にする",
        "40.8 ÷ 12 = 3.4を計算する"
        ],
        orderedChoices: [
        "わる数とわられる数を10倍して、40.8 ÷ 12にする",
        "40.8 ÷ 12 = 3.4を計算する",
        "4.08 ÷ 1.2 = 3.4と答える",
        "1.2 × 3.4 = 4.08で確かめる"
        ],
        explanation: "わる数を整数にするため、両方の数を10倍して40.8 ÷ 12を計算します。答えは3.4で、1.2 × 3.4 = 4.08となるので正しいと確かめられます。"
        ),

        QuizQuestion(
        question: "3/4 + 5/12 はいくつですか？",
        choices: [
        "8/16",
        "1と1/6",
        "2/3",
        "1と5/12"
        ],
        correctAnswerIndex: 1,
        explanation: "3/4を9/12に直すと、9/12 + 5/12 = 14/12 = 1と1/6です。"
        ),

        QuizQuestion(
        question: "3と2/5 - 1と7/10 はいくつですか？",
        choices: [
        "2と3/10",
        "2と1/10",
        "1と7/10",
        "1と3/10"
        ],
        correctAnswerIndex: 2,
        explanation: "2/5を4/10に直すと、3と4/10 - 1と7/10です。1をくずして2と14/10と考えると、2と14/10 - 1と7/10 = 1と7/10です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】5/8 + 7/20 = ＿＿ に入る分数を答えましょう。",
        answer: "39/40",
        acceptableAnswers: ["３９／４０", "39／40", "40分の39"],
        explanation: "5/8を25/40、7/20を14/40に直すと、25/40 + 14/40 = 39/40です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】左の分数と同じ大きさの分数を右から選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "2/7", match: "10/35"),
        QuizMatchingPair(prompt: "5/9", match: "20/36"),
        QuizMatchingPair(prompt: "7/12", match: "28/48"),
        QuizMatchingPair(prompt: "9/13", match: "27/39")
        ],
        choices: ["28/48", "10/35", "27/39", "20/36"],
        explanation: "2/7は10/35、5/9は20/36、7/12は28/48、9/13は27/39と大きさが等しいです。"
        ),

        QuizQuestion(
        question: "72枚の色紙のうち45枚が青色です。色紙全体をもとにした青い色紙の割合を小数で表すといくつですか？",
        choices: [
        "1.6",
        "0.45",
        "0.72",
        "0.625"
        ],
        correctAnswerIndex: 3,
        explanation: "青い色紙45枚を、色紙全体の72枚でわります。45 ÷ 72 = 0.625なので、割合は0.625です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】6.3kgをもとにすると、8.82kgは ＿＿ 倍です。",
        answer: "1.4",
        acceptableAnswers: ["１．４"],
        explanation: "比べる量8.82kgを、もとにする量6.3kgでわります。8.82 ÷ 6.3 = 1.4なので、1.4倍です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】予定数に対する植えた苗の数の割合が最も大きい班を答えましょう。",
        answer: "C班",
        acceptableAnswers: ["C"],
        referenceTitle: "花壇に植える苗の予定数と実際の数",
        referenceRows: [
        QuizReferenceRow(label: "A班", value: "予定64本・実際52本"),
        QuizReferenceRow(label: "B班", value: "予定90本・実際72本"),
        QuizReferenceRow(label: "C班", value: "予定75本・実際63本")
        ],
        explanation: "予定数に対する実際の数の割合は、A班が52 ÷ 64 = 0.8125、B班が72 ÷ 90 = 0.8、C班が63 ÷ 75 = 0.84です。最も大きいのはC班です。"
        ),

        QuizQuestion(
        question: "250人の38%は何人ですか？",
        choices: [
        "88人",
        "100人",
        "125人",
        "95人"
        ],
        correctAnswerIndex: 3,
        explanation: "38%を小数で表すと0.38です。250 × 0.38 = 95なので、95人です。"
        ),

        QuizQuestion(
        question: "今年の児童数は840人で、昨年より12%増えました。昨年の児童数は何人ですか？",
        choices: [
        "672人",
        "740人",
        "750人",
        "940人"
        ],
        correctAnswerIndex: 2,
        explanation: "今年の児童数840人は、昨年の112%にあたります。840 ÷ 1.12 = 750なので、昨年の児童数は750人です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】同じ品物を最も安く買える店を答えましょう。",
        answer: "A店",
        acceptableAnswers: ["A"],
        referenceTitle: "定価4800円の品物の割引方法",
        referenceRows: [
        QuizReferenceRow(label: "A店", value: "定価の25%引き"),
        QuizReferenceRow(label: "B店", value: "定価から1000円引き"),
        QuizReferenceRow(label: "C店", value: "定価の20%引き後、さらに200円引き")
        ],
        explanation: "支払う金額は、A店が4800 × 0.75 = 3600円、B店が4800 - 1000 = 3800円、C店が4800 × 0.8 - 200 = 3640円です。最も安いのはA店です。"
        ),

        QuizQuestion(
        question: "6日間に歩いた距離が18km、22km、27km、25km、20km、32kmでした。1日あたりの平均は何kmですか？",
        choices: [
        "24km",
        "22km",
        "25km",
        "23km"
        ],
        correctAnswerIndex: 0,
        explanation: "6日間の合計は18 + 22 + 27 + 25 + 20 + 32 = 144kmです。144 ÷ 6 = 24なので、平均は24kmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】5日間に読んだページ数の平均は32ページでした。はじめの4日間が29ページ、31ページ、34ページ、27ページのとき、5日目は ＿＿ ページです。",
        answer: "39",
        acceptableAnswers: ["３９"],
        explanation: "5日間の合計は32 × 5 = 160ページです。はじめの4日間の合計は29 + 31 + 34 + 27 = 121ページなので、5日目は160 - 121 = 39ページです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】9.8cm、10.1cm、10.4cm、9.7cm、10.0cmの平均を、10.0cmを基準にして求める手順を正しい順に並べましょう。",
        choices: [
        "基準より多い量と少ない量が同じなので、その差を0cmとする",
        "10.0cmに0 ÷ 5を加えて、平均を10.0cmと求める",
        "10.0cmを基準の長さにする",
        "基準より多い量の合計0.5cmと、少ない量の合計0.5cmを求める"
        ],
        orderedChoices: [
        "10.0cmを基準の長さにする",
        "基準より多い量の合計0.5cmと、少ない量の合計0.5cmを求める",
        "基準より多い量と少ない量が同じなので、その差を0cmとする",
        "10.0cmに0 ÷ 5を加えて、平均を10.0cmと求める"
        ],
        explanation: "10.0cmより多い量は0.1 + 0.4 = 0.5cm、少ない量は0.2 + 0.3 = 0.5cmです。増えた分と減った分が同じなので、平均は10.0cmです。"
        ),

        QuizQuestion(
        question: "長さ18mで重さ13.5kgのケーブルがあります。1mあたりの重さは何kgですか？",
        choices: [
        "0.75kg",
        "1.33kg",
        "243kg",
        "4.5kg"
        ],
        correctAnswerIndex: 0,
        explanation: "13.5 ÷ 18 = 0.75なので、1mあたりの重さは0.75kgです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】それぞれの場面で求められる単位量を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "6mで1050円のリボン", match: "1m175円"),
        QuizMatchingPair(prompt: "12袋で7.2kgの豆", match: "1袋0.6kg"),
        QuizMatchingPair(prompt: "18Lで234km走る車", match: "1Lで13km"),
        QuizMatchingPair(prompt: "1.5時間で42ページ読む", match: "1時間で28ページ")
        ],
        choices: ["1時間で28ページ", "1袋0.6kg", "1m175円", "1Lで13km"],
        explanation: "1050 ÷ 6 = 175、7.2 ÷ 12 = 0.6、234 ÷ 18 = 13、42 ÷ 1.5 = 28なので、それぞれ1m175円、1袋0.6kg、1Lで13km、1時間で28ページです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】1分あたりに包んだ個数が最も多いチームを答えましょう。",
        answer: "Aチーム",
        acceptableAnswers: ["A"],
        referenceTitle: "品物を包んだ時間と個数",
        referenceRows: [
        QuizReferenceRow(label: "Aチーム", value: "6分で84個"),
        QuizReferenceRow(label: "Bチーム", value: "8分で104個"),
        QuizReferenceRow(label: "Cチーム", value: "9分で117個")
        ],
        explanation: "1分あたりの個数は、Aチームが84 ÷ 6 = 14個、Bチームが104 ÷ 8 = 13個、Cチームが117 ÷ 9 = 13個です。最も多いのはAチームです。"
        ),

        QuizQuestion(
        question: "0.045立方メートルは何Lですか？",
        choices: [
        "4500L",
        "45L",
        "4.5L",
        "450L"
        ],
        correctAnswerIndex: 1,
        explanation: "1立方メートルは1000Lです。0.045 × 1000 = 45なので、0.045立方メートルは45Lです。"
        ),

        QuizQuestion(
        question: "縦2.4cm、横3.5cm、体積33.6立方センチメートルの直方体があります。高さは何cmですか？",
        choices: [
        "2cm",
        "8cm",
        "3cm",
        "4cm"
        ],
        correctAnswerIndex: 3,
        explanation: "高さは、体積÷縦÷横で求めます。33.6 ÷ 2.4 ÷ 3.5 = 4なので、高さは4cmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】底面が縦80cm、横35cmの水そうに63Lの水が入っています。水の深さは ＿＿ cmです。",
        answer: "22.5",
        acceptableAnswers: ["２２．５"],
        explanation: "63Lは63000立方センチメートルです。63000 ÷ 80 ÷ 35 = 22.5なので、水の深さは22.5cmです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】入っている水の体積が最も大きい水そうを答えましょう。",
        answer: "Aの水そう",
        acceptableAnswers: ["A", "A水そう"],
        referenceTitle: "水そうの底面と水の深さ",
        referenceRows: [
        QuizReferenceRow(label: "Aの水そう", value: "縦40cm・横30cm・深さ18cm"),
        QuizReferenceRow(label: "Bの水そう", value: "縦50cm・横24cm・深さ17cm"),
        QuizReferenceRow(label: "Cの水そう", value: "縦45cm・横28cm・深さ16cm")
        ],
        explanation: "水の体積は、Aが40 × 30 × 18 = 21600立方センチメートル、Bが50 × 24 × 17 = 20400立方センチメートル、Cが45 × 28 × 16 = 20160立方センチメートルです。最も大きいのはAの水そうです。"
        ),

        QuizQuestion(
        question: "四角形WXYZと四角形KLMNは合同で、WとM、XとN、YとK、ZとLが対応しています。辺KLに対応する辺はどれですか？",
        choices: [
        "辺XY",
        "辺WX",
        "辺YZ",
        "辺ZW"
        ],
        correctAnswerIndex: 2,
        explanation: "KはYに、LはZに対応しています。したがって、辺KLに対応する辺は辺YZです。"
        ),

        QuizQuestion(
        question: "三角形ABCと三角形PQRは合同で、AとQ、BとR、CとPが対応しています。角Aが64°、角Cが53°のとき、角Rは何度ですか？",
        choices: [
        "64°",
        "117°",
        "53°",
        "63°"
        ],
        correctAnswerIndex: 3,
        explanation: "三角形ABCの角Bは180° - 64° - 53° = 63°です。角Bと角Rが対応するので、角Rは63°です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】三角形ABCと三角形DEFは合同です。辺ABと辺DE、辺BCと辺EFが対応するとき、角Cに対応する角を決める手順を正しい順に並べましょう。",
        choices: [
        "残る頂点CとFが対応すると決める",
        "角Cに対応する角は角Fだと答える",
        "辺ABと辺DEの対応を確認する",
        "2組の辺に共通する頂点BとEが対応すると決める"
        ],
        orderedChoices: [
        "辺ABと辺DEの対応を確認する",
        "2組の辺に共通する頂点BとEが対応すると決める",
        "残る頂点CとFが対応すると決める",
        "角Cに対応する角は角Fだと答える"
        ],
        explanation: "辺ABと辺DE、辺BCと辺EFに共通する頂点はそれぞれBとEなので、BとEが対応します。すると残るCとFが対応するため、角Cに対応する角は角Fです。"
        ),

        QuizQuestion(
        question: "十五角形の内角の和は何度ですか？",
        choices: [
        "2520°",
        "2340°",
        "2160°",
        "2700°"
        ],
        correctAnswerIndex: 1,
        explanation: "十五角形は1つの頂点から13個の三角形に分けられます。180 × 13 = 2340なので、内角の和は2340°です。"
        ),

        QuizQuestion(
        question: "正十角形の1つの内角は何度ですか？",
        choices: [
        "144°",
        "135°",
        "150°",
        "126°"
        ],
        correctAnswerIndex: 0,
        explanation: "十角形の内角の和は180 × 8 = 1440°です。正十角形では10個の角が等しいので、1440 ÷ 10 = 144°です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】十四角形の1つの頂点から引ける対角線は ＿＿ 本です。",
        answer: "11",
        acceptableAnswers: ["１１"],
        explanation: "1つの頂点からは、その頂点自身と両となりの頂点には対角線を引きません。14 - 3 = 11なので、11本です。"
        ),
        QuizQuestion(
        question: "6.48 × 0.25 はいくつですか？",
        choices: [
        "6.73",
        "16.2",
        "1.62",
        "0.162"
        ],
        correctAnswerIndex: 2,
        explanation: "6.48 × 0.25 = 1.62です。"
        ),

        QuizQuestion(
        question: "9.24 ÷ 1.4 はいくつですか？",
        choices: [
        "66",
        "0.66",
        "5.6",
        "6.6"
        ],
        correctAnswerIndex: 3,
        explanation: "わる数とわられる数を10倍すると、92.4 ÷ 14になります。92.4 ÷ 14 = 6.6なので、答えは6.6です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】5.04 ÷ 0.08 = ＿＿ に入る数を答えましょう。",
        answer: "63",
        acceptableAnswers: ["63.0", "６３"],
        explanation: "わる数とわられる数を100倍すると、504 ÷ 8 = 63です。したがって、＿＿に入る数は63です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】1.75 × 2.4を筆算で求める手順を正しい順に並べましょう。",
        choices: [
        "175 × 24 = 4200を求める",
        "小数点を取って175 × 24を計算する",
        "1.75 × 2.4 = 4.2と答える",
        "4200の右から3けた目に小数点を付けて4.200とする"
        ],
        orderedChoices: [
        "小数点を取って175 × 24を計算する",
        "175 × 24 = 4200を求める",
        "4200の右から3けた目に小数点を付けて4.200とする",
        "1.75 × 2.4 = 4.2と答える"
        ],
        explanation: "175 × 24 = 4200を計算します。もとの2つの数の小数部分は合わせて3けたなので、積を4.200とし、答えは4.2です。"
        ),

        QuizQuestion(
        question: "7/12 + 5/18 はいくつですか？",
        choices: [
        "29/36",
        "12/30",
        "31/36",
        "17/30"
        ],
        correctAnswerIndex: 2,
        explanation: "7/12を21/36、5/18を10/36に直すと、21/36 + 10/36 = 31/36です。"
        ),

        QuizQuestion(
        question: "2と3/4 - 1と5/6 はいくつですか？",
        choices: [
        "1と11/12",
        "5/12",
        "1と1/12",
        "11/12"
        ],
        correctAnswerIndex: 3,
        explanation: "2と3/4を11/4、1と5/6を11/6に直します。11/4を33/12、11/6を22/12に直すと、33/12 - 22/12 = 11/12です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】4と1/6 - 2と3/4 = ＿＿ に入る数を答えましょう。",
        answer: "1と5/12",
        acceptableAnswers: ["17/12", "１と５／１２", "１７／１２"],
        explanation: "4と1/6を25/6、2と3/4を11/4に直します。25/6を50/12、11/4を33/12に直すと、50/12 - 33/12 = 17/12 = 1と5/12です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】大きさの等しい分数を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "5/12", match: "15/36"),
        QuizMatchingPair(prompt: "7/10", match: "21/30"),
        QuizMatchingPair(prompt: "8/15", match: "24/45"),
        QuizMatchingPair(prompt: "11/14", match: "33/42")
        ],
        choices: ["24/45", "33/42", "15/36", "21/30"],
        explanation: "5/12は15/36、7/10は21/30、8/15は24/45、11/14は33/42と大きさが等しいです。"
        ),

        QuizQuestion(
        question: "80ページの本のうち56ページを読みました。本全体をもとにした、読んだページ数の割合を小数で表すといくつですか？",
        choices: [
        "0.65",
        "0.56",
        "1.4",
        "0.7"
        ],
        correctAnswerIndex: 3,
        explanation: "読んだページ数56を、本全体のページ数80でわります。56 ÷ 80 = 0.7なので、割合は0.7です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】2.8kgをもとにすると、3.5kgは ＿＿ 倍です。",
        answer: "1.25",
        acceptableAnswers: ["１．２５"],
        explanation: "比べる量3.5kgを、もとにする量2.8kgでわります。3.5 ÷ 2.8 = 1.25なので、1.25倍です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】目標に対する達成数の割合が最も大きいチームを答えましょう。",
        answer: "白チーム",
        acceptableAnswers: ["白"],
        referenceTitle: "ボール運びの目標と達成数",
        referenceRows: [
        QuizReferenceRow(label: "赤チーム", value: "目標48個・達成42個"),
        QuizReferenceRow(label: "青チーム", value: "目標75個・達成60個"),
        QuizReferenceRow(label: "白チーム", value: "目標60個・達成54個")
        ],
        explanation: "目標に対する達成数の割合は、赤チームが42 ÷ 48 = 0.875、青チームが60 ÷ 75 = 0.8、白チームが54 ÷ 60 = 0.9です。最も大きいのは白チームです。"
        ),

        QuizQuestion(
        question: "640の7.5%はいくつですか？",
        choices: [
        "48",
        "47.5",
        "40",
        "4.8"
        ],
        correctAnswerIndex: 0,
        explanation: "7.5%を小数で表すと0.075です。640 × 0.075 = 48なので、答えは48です。"
        ),

        QuizQuestion(
        question: "6800円の商品を30%引きで買うと、代金はいくらですか？",
        choices: [
        "8840円",
        "2040円",
        "6500円",
        "4760円"
        ],
        correctAnswerIndex: 3,
        explanation: "30%引きでは、もとの価格の70%を支払います。6800 × 0.7 = 4760なので、代金は4760円です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】先月の個数をもとにした今月の増加率が最も大きい商品を答えましょう。",
        answer: "B商品",
        acceptableAnswers: ["B"],
        referenceTitle: "先月と今月の販売個数",
        referenceRows: [
        QuizReferenceRow(label: "A商品", value: "先月240個・今月270個"),
        QuizReferenceRow(label: "B商品", value: "先月180個・今月207個"),
        QuizReferenceRow(label: "C商品", value: "先月320個・今月352個")
        ],
        explanation: "増加率は、A商品が30 ÷ 240 = 0.125で12.5%、B商品が27 ÷ 180 = 0.15で15%、C商品が32 ÷ 320 = 0.1で10%です。最も大きいのはB商品です。"
        ),

        QuizQuestion(
        question: "5回の計算練習で解いた問題数が13問、17問、21問、19問、15問でした。1回あたりの平均は何問ですか？",
        choices: [
        "16問",
        "18問",
        "85問",
        "17問"
        ],
        correctAnswerIndex: 3,
        explanation: "5回の合計は13 + 17 + 21 + 19 + 15 = 85問です。85 ÷ 5 = 17なので、平均は17問です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】4日間に読んだページ数の平均は26ページでした。5日目に34ページ読むと、5日間の平均は ＿＿ ページです。",
        answer: "27.6",
        acceptableAnswers: ["２７．６"],
        explanation: "はじめの4日間の合計は26 × 4 = 104ページです。34ページを加えると138ページなので、138 ÷ 5 = 27.6ページです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】1.7kg、1.4kg、1.8kg、1.5kgの平均を、1.5kgを基準にして求める手順を正しい順に並べましょう。",
        choices: [
        "1.5kgに0.1kgを足して、平均を1.6kgと求める",
        "基準より多い量の合計0.5kgから、少ない量0.1kgを引いて0.4kgと求める",
        "0.4kg ÷ 4 = 0.1kgを求める",
        "1.5kgを基準の重さにする"
        ],
        orderedChoices: [
        "1.5kgを基準の重さにする",
        "基準より多い量の合計0.5kgから、少ない量0.1kgを引いて0.4kgと求める",
        "0.4kg ÷ 4 = 0.1kgを求める",
        "1.5kgに0.1kgを足して、平均を1.6kgと求める"
        ],
        explanation: "基準の1.5kgより多い量は合計0.5kg、少ない量は0.1kgなので、その差は0.4kgです。0.4 ÷ 4 = 0.1より、平均は1.5 + 0.1 = 1.6kgです。"
        ),

        QuizQuestion(
        question: "4.8mで1680円の布があります。1mあたりの値段はいくらですか？",
        choices: [
        "336円",
        "350円",
        "280円",
        "8064円"
        ],
        correctAnswerIndex: 1,
        explanation: "1680 ÷ 4.8 = 350なので、1mあたりの値段は350円です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】それぞれの1つ分、または1あたりの量を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1260円で9冊のノート", match: "1冊140円"),
        QuizMatchingPair(prompt: "16kgで20袋の米", match: "1袋0.8kg"),
        QuizMatchingPair(prompt: "21Lで273km走る車", match: "1Lで13km"),
        QuizMatchingPair(prompt: "14.4Lの水を6人で同じ量ずつ分ける", match: "1人2.4L")
        ],
        choices: ["1人2.4L", "1Lで13km", "1冊140円", "1袋0.8kg"],
        explanation: "1260 ÷ 9 = 140、16 ÷ 20 = 0.8、273 ÷ 21 = 13、14.4 ÷ 6 = 2.4なので、それぞれ1冊140円、1袋0.8kg、1Lで13km、1人2.4Lです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】1平方メートルあたりの人数が最も多い教室を答えましょう。",
        answer: "B教室",
        acceptableAnswers: ["B"],
        referenceTitle: "教室の広さと人数",
        referenceRows: [
        QuizReferenceRow(label: "A教室", value: "48平方メートル・24人"),
        QuizReferenceRow(label: "B教室", value: "50平方メートル・28人"),
        QuizReferenceRow(label: "C教室", value: "60平方メートル・33人")
        ],
        explanation: "1平方メートルあたりの人数は、A教室が24 ÷ 48 = 0.5人、B教室が28 ÷ 50 = 0.56人、C教室が33 ÷ 60 = 0.55人です。最も多いのはB教室です。"
        ),

        QuizQuestion(
        question: "縦3.2cm、横5cm、高さ7.5cmの直方体の体積は何立方センチメートルですか？",
        choices: [
        "15.7立方センチメートル",
        "78.75立方センチメートル",
        "120立方センチメートル",
        "112.5立方センチメートル"
        ],
        correctAnswerIndex: 2,
        explanation: "直方体の体積は、縦×横×高さで求めます。3.2 × 5 × 7.5 = 120なので、120立方センチメートルです。"
        ),

        QuizQuestion(
        question: "1辺が3.5cmの立方体の体積は何立方センチメートルですか？",
        choices: [
        "36.75立方センチメートル",
        "12.25立方センチメートル",
        "122.5立方センチメートル",
        "42.875立方センチメートル"
        ],
        correctAnswerIndex: 3,
        explanation: "立方体の体積は、1辺×1辺×1辺で求めます。3.5 × 3.5 × 3.5 = 42.875なので、42.875立方センチメートルです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】底面が縦45cm、横30cmの水そうに、深さ12cmまで水を入れました。水の体積は ＿＿ Lです。",
        answer: "16.2",
        acceptableAnswers: ["１６．２"],
        explanation: "水の体積は45 × 30 × 12 = 16200立方センチメートルです。1000立方センチメートルは1Lなので、16.2Lです。"
        ),

        QuizQuestion(
        question: "次のうち、内のりの体積が最も大きい水そうはどれですか？",
        choices: [
        "縦50cm・横20cm・高さ28cmの水そう",
        "縦40cm・横25cm・高さ30cmの水そう",
        "縦45cm・横20cm・高さ30cmの水そう",
        "縦35cm・横30cm・高さ27cmの水そう"
        ],
        correctAnswerIndex: 1,
        explanation: "体積は順に30000、28000、28350、27000立方センチメートルです。最も大きいのは、縦40cm・横25cm・高さ30cmの水そうです。"
        ),

        QuizQuestion(
        question: "三角形KLMと三角形NOPは合同で、KとO、LとP、MとNが対応しています。辺PNに対応する辺はどれですか？",
        choices: [
        "辺OP",
        "辺KL",
        "辺MK",
        "辺LM"
        ],
        correctAnswerIndex: 3,
        explanation: "PはLに、NはMに対応しています。したがって、辺PNに対応する辺は辺LMです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】四角形ABCDと四角形JKLMは合同で、AとJ、BとK、CとL、DとMが対応しています。角Dが112°のとき、角Mは ＿＿ 度です。",
        answer: "112",
        acceptableAnswers: ["１１２"],
        explanation: "合同な図形では、対応する角の大きさは等しくなります。角Dと角Mが対応するので、角Mは112°です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】辺ABが7cm、角Aが55°、辺ACが5cmの三角形ABCをかく手順を正しい順に並べましょう。",
        choices: [
        "Aから出る半直線上に、Aから5cmの点Cを取る",
        "点Bと点Cを結ぶ",
        "7cmの線分ABをかく",
        "点Aで、辺ABとの角が55°になる半直線をかく"
        ],
        orderedChoices: [
        "7cmの線分ABをかく",
        "点Aで、辺ABとの角が55°になる半直線をかく",
        "Aから出る半直線上に、Aから5cmの点Cを取る",
        "点Bと点Cを結ぶ"
        ],
        explanation: "まず7cmの線分ABをかきます。次に点Aで55°の半直線をかき、その上にAから5cmの点Cを取って、最後にBとCを結びます。"
        ),

        QuizQuestion(
        question: "正八角形の1つの内角は何度ですか？",
        choices: [
        "120°",
        "135°",
        "108°",
        "144°"
        ],
        correctAnswerIndex: 1,
        explanation: "八角形の内角の和は180 × 6 = 1080°です。正八角形では8つの角が等しいので、1080 ÷ 8 = 135°です。"
        ),

        QuizQuestion(
        question: "十角形の1つの頂点から引ける対角線は何本ですか？",
        choices: [
        "6本",
        "10本",
        "8本",
        "7本"
        ],
        correctAnswerIndex: 3,
        explanation: "1つの頂点からは、その頂点自身と両となりの頂点には対角線を引きません。10 - 3 = 7なので、7本です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】五角形の内角の和と八角形の内角の和を合わせると何度ですか？",
        answer: "1620",
        acceptableAnswers: ["１６２０"],
        referenceTitle: "多角形と分けられる三角形の数",
        referenceRows: [
        QuizReferenceRow(label: "五角形", value: "3つ"),
        QuizReferenceRow(label: "八角形", value: "6つ"),
        QuizReferenceRow(label: "十角形", value: "8つ")
        ],
        explanation: "五角形の内角の和は180 × 3 = 540°、八角形の内角の和は180 × 6 = 1080°です。合わせると540 + 1080 = 1620°です。"
        ),
        QuizQuestion(
        question: "4.25 × 0.8 はいくつですか？",
        choices: [
        "3.4",
        "34",
        "0.34",
        "5.05"
        ],
        correctAnswerIndex: 0,
        explanation: "4.25 × 0.8 = 3.4です。"
        ),

        QuizQuestion(
        question: "7.56 ÷ 0.6 はいくつですか？",
        choices: [
        "1.26",
        "12.6",
        "126",
        "7.0"
        ],
        correctAnswerIndex: 1,
        explanation: "わる数とわられる数を10倍すると、75.6 ÷ 6になります。75.6 ÷ 6 = 12.6なので、答えは12.6です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.84 ÷ 0.07 = ＿＿ に入る数を答えましょう。",
        answer: "12",
        acceptableAnswers: ["12.0", "１２"],
        explanation: "わる数とわられる数を100倍すると、84 ÷ 7 = 12です。したがって、＿＿に入る数は12です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】3.24 × 1.5を筆算で求める手順を正しい順に並べましょう。",
        choices: [
        "4860の右から3けた目に小数点を付けて4.860とする",
        "小数点を取って324 × 15を計算する",
        "3.24 × 1.5 = 4.86と答える",
        "324 × 15 = 4860を求める"
        ],
        orderedChoices: [
        "小数点を取って324 × 15を計算する",
        "324 × 15 = 4860を求める",
        "4860の右から3けた目に小数点を付けて4.860とする",
        "3.24 × 1.5 = 4.86と答える"
        ],
        explanation: "324 × 15 = 4860を計算します。もとの2つの数の小数部分は合わせて3けたなので、積を4.860とし、答えは4.86です。"
        ),

        QuizQuestion(
        question: "5/6 - 3/10 はいくつですか？",
        choices: [
        "8/15",
        "4/5",
        "2/5",
        "7/15"
        ],
        correctAnswerIndex: 0,
        explanation: "5/6を25/30、3/10を9/30に直すと、25/30 - 9/30 = 16/30 = 8/15です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】2と1/3 + 1と5/8 = ＿＿ に入る数を答えましょう。",
        answer: "3と23/24",
        acceptableAnswers: ["95/24", "３と２３／２４", "９５／２４"],
        explanation: "1/3を8/24、5/8を15/24に直すと、2と8/24 + 1と15/24 = 3と23/24です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】左の分数と同じ大きさになる分数を選んで組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "3/5", match: "12/20"),
        QuizMatchingPair(prompt: "5/8", match: "15/24"),
        QuizMatchingPair(prompt: "7/9", match: "21/27"),
        QuizMatchingPair(prompt: "4/11", match: "16/44")
        ],
        choices: ["21/27", "16/44", "12/20", "15/24"],
        explanation: "3/5は12/20、5/8は15/24、7/9は21/27、4/11は16/44と大きさが等しいです。"
        ),

        QuizQuestion(
        question: "1.6mをもとにすると、2.4mは何倍ですか？",
        choices: [
        "0.8倍",
        "1.5倍",
        "0.67倍",
        "1.2倍"
        ],
        correctAnswerIndex: 1,
        explanation: "比べる量2.4mを、もとにする量1.6mでわります。2.4 ÷ 1.6 = 1.5なので、1.5倍です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】45本のうち18本を使いました。全体の本数をもとにした、使った本数の割合は ＿＿ です。小数で答えましょう。",
        answer: "0.4",
        acceptableAnswers: ["0.40", "０．４"],
        explanation: "18 ÷ 45 = 0.4なので、使った本数の割合は0.4です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】クラスの人数をもとにした参加者数の割合が最も大きいのは何組ですか？",
        answer: "2",
        acceptableAnswers: ["２"],
        referenceTitle: "清掃活動への参加者数",
        referenceRows: [
        QuizReferenceRow(label: "1組", value: "クラス30人・参加18人"),
        QuizReferenceRow(label: "2組", value: "クラス32人・参加20人"),
        QuizReferenceRow(label: "3組", value: "クラス35人・参加21人")
        ],
        explanation: "参加者数の割合は、1組が18 ÷ 30 = 0.6、2組が20 ÷ 32 = 0.625、3組が21 ÷ 35 = 0.6です。最も大きいのは2組です。"
        ),

        QuizQuestion(
        question: "360の12%はいくつですか？",
        choices: [
        "43.2",
        "48",
        "30",
        "432"
        ],
        correctAnswerIndex: 0,
        explanation: "12%を小数で表すと0.12です。360 × 0.12 = 43.2なので、答えは43.2です。"
        ),

        QuizQuestion(
        question: "4800円の商品を15%値上げすると、値上げ後の価格はいくらですか？",
        choices: [
        "4080円",
        "6240円",
        "5520円",
        "5500円"
        ],
        correctAnswerIndex: 2,
        explanation: "15%値上げした価格は、もとの価格の115%です。4800 × 1.15 = 5520なので、値上げ後の価格は5520円です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1250円の商品を20%引きで買います。代金は ＿＿ 円です。",
        answer: "1000",
        acceptableAnswers: ["１０００"],
        explanation: "20%引きでは、もとの価格の80%を支払います。1250 × 0.8 = 1000なので、代金は1000円です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】割引後の価格が最も安い店を答えましょう。",
        answer: "B店",
        acceptableAnswers: ["B"],
        referenceTitle: "同じかばんの価格と割引率",
        referenceRows: [
        QuizReferenceRow(label: "A店", value: "定価3000円・10%引き"),
        QuizReferenceRow(label: "B店", value: "定価3200円・20%引き"),
        QuizReferenceRow(label: "C店", value: "定価2800円・5%引き")
        ],
        explanation: "割引後の価格は、A店が3000 × 0.9 = 2700円、B店が3200 × 0.8 = 2560円、C店が2800 × 0.95 = 2660円です。最も安いのはB店です。"
        ),

        QuizQuestion(
        question: "5日間に読んだ本のページ数が18ページ、22ページ、25ページ、17ページ、23ページでした。1日あたりの平均は何ページですか？",
        choices: [
        "20ページ",
        "22ページ",
        "21ページ",
        "20.5ページ"
        ],
        correctAnswerIndex: 2,
        explanation: "5日間の合計は18 + 22 + 25 + 17 + 23 = 105ページです。105 ÷ 5 = 21なので、平均は21ページです。"
        ),

        QuizQuestion(
        question: "6回のテストの平均が74点でした。7回目に88点を取ると、7回の平均は何点になりますか？",
        choices: [
        "76点",
        "75点",
        "75.5点",
        "74点"
        ],
        correctAnswerIndex: 0,
        explanation: "はじめの6回の合計は74 × 6 = 444点です。88点を加えると532点なので、532 ÷ 7 = 76点です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】4つの荷物の重さ1.8kg、2.1kg、1.9kg、2.2kgの平均を求める手順を正しい順に並べましょう。",
        choices: [
        "8.0 ÷ 4を計算する",
        "4つの重さをすべて足す",
        "平均は2.0kgと求める",
        "合計は8.0kgと求める"
        ],
        orderedChoices: [
        "4つの重さをすべて足す",
        "合計は8.0kgと求める",
        "8.0 ÷ 4を計算する",
        "平均は2.0kgと求める"
        ],
        explanation: "4つの重さの合計は8.0kgです。8.0 ÷ 4 = 2.0なので、平均は2.0kgです。"
        ),

        QuizQuestion(
        question: "7.5Lのガソリンで90km走る車があります。1Lあたり何km走りますか？",
        choices: [
        "10km",
        "675km",
        "12km",
        "13.5km"
        ],
        correctAnswerIndex: 2,
        explanation: "90 ÷ 7.5 = 12なので、1Lあたり12km走ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】7袋で4.2kgになる小麦粉があります。1袋の重さがすべて同じとき、12袋では ＿＿ kgになります。",
        answer: "7.2",
        acceptableAnswers: ["７．２"],
        explanation: "1袋あたりの重さは4.2 ÷ 7 = 0.6kgです。0.6 × 12 = 7.2なので、12袋では7.2kgです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】場面ごとに求められる単位量を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "960円で8本のペン", match: "1本120円"),
        QuizMatchingPair(prompt: "14mで9.8kgのロープ", match: "1mで0.7kg"),
        QuizMatchingPair(prompt: "24Lで360km走る車", match: "1Lで15km"),
        QuizMatchingPair(prompt: "5人で17.5Lの水を同じ量ずつ分ける", match: "1人3.5L")
        ],
        choices: ["1Lで15km", "1本120円", "1人3.5L", "1mで0.7kg"],
        explanation: "960 ÷ 8 = 120、9.8 ÷ 14 = 0.7、360 ÷ 24 = 15、17.5 ÷ 5 = 3.5なので、それぞれ1本120円、1mで0.7kg、1Lで15km、1人3.5Lです。"
        ),

        QuizQuestion(
        question: "1辺が4.5cmの立方体の体積は何立方センチメートルですか？",
        choices: [
        "60.75立方センチメートル",
        "91.125立方センチメートル",
        "20.25立方センチメートル",
        "911.25立方センチメートル"
        ],
        correctAnswerIndex: 1,
        explanation: "立方体の体積は、1辺×1辺×1辺で求めます。4.5 × 4.5 × 4.5 = 91.125なので、91.125立方センチメートルです。"
        ),

        QuizQuestion(
        question: "内のりが縦60cm、横25cmの水そうに、深さ18cmまで水が入っています。水の体積は何Lですか？",
        choices: [
        "15L",
        "2.7L",
        "27L",
        "270L"
        ],
        correctAnswerIndex: 2,
        explanation: "水の体積は60 × 25 × 18 = 27000立方センチメートルです。1000立方センチメートルは1Lなので、27Lです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.036立方メートルは ＿＿ Lです。",
        answer: "36",
        acceptableAnswers: ["３６"],
        explanation: "1立方メートルは1000Lです。0.036 × 1000 = 36なので、0.036立方メートルは36Lです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】内のりの体積が最も小さい箱を答えましょう。",
        answer: "緑の箱",
        acceptableAnswers: ["緑", "緑の"],
        referenceTitle: "荷物を入れる箱の内のり",
        referenceRows: [
        QuizReferenceRow(label: "赤の箱", value: "縦36cm・横20cm・高さ15cm"),
        QuizReferenceRow(label: "青の箱", value: "縦30cm・横24cm・高さ16cm"),
        QuizReferenceRow(label: "緑の箱", value: "縦40cm・横18cm・高さ14cm")
        ],
        explanation: "赤の箱は10800立方センチメートル、青の箱は11520立方センチメートル、緑の箱は10080立方センチメートルです。最も体積が小さいのは緑の箱です。"
        ),

        QuizQuestion(
        question: "三角形PQRと三角形XYZは合同で、PとY、QとZ、RとXが対応しています。辺XYに対応する辺はどれですか？",
        choices: [
        "辺PQ",
        "辺XZ",
        "辺RP",
        "辺QR"
        ],
        correctAnswerIndex: 2,
        explanation: "XはRに、YはPに対応しています。したがって、辺XYに対応する辺は辺RPです。"
        ),

        QuizQuestion(
        question: "三角形ABCと三角形DEFは合同で、AとD、BとE、CとFが対応しています。角Aが52°、角Bが71°のとき、角Fは何度ですか？",
        choices: [
        "71°",
        "57°",
        "52°",
        "109°"
        ],
        correctAnswerIndex: 1,
        explanation: "三角形ABCの角Cは180° - 52° - 71° = 57°です。角Cと角Fが対応するので、角Fは57°です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】辺ABが6cm、辺ACが4cm、辺BCが5cmの三角形ABCと合同な三角形をかく手順を正しい順に並べましょう。辺ABからかき始めます。",
        choices: [
        "2つの弧の交点をCとして、A、Bと結ぶ",
        "コンパスを5cmに開き、Bを中心に弧をかく",
        "6cmの線分ABをかく",
        "コンパスを4cmに開き、Aを中心に弧をかく"
        ],
        orderedChoices: [
        "6cmの線分ABをかく",
        "コンパスを4cmに開き、Aを中心に弧をかく",
        "コンパスを5cmに開き、Bを中心に弧をかく",
        "2つの弧の交点をCとして、A、Bと結ぶ"
        ],
        explanation: "まず6cmの線分ABをかきます。次にAを中心に半径4cmの弧、Bを中心に半径5cmの弧をかき、その交点をCとしてA、Bと結びます。"
        ),

        QuizQuestion(
        question: "正五角形を中心から5つの合同な三角形に分けるとき、中心に集まる1つの角は何度ですか？",
        choices: [
        "108°",
        "360°",
        "60°",
        "72°"
        ],
        correctAnswerIndex: 3,
        explanation: "中心のまわりの角360°を5等分します。360 ÷ 5 = 72なので、1つの角は72°です。"
        ),

        QuizQuestion(
        question: "十二角形を1つの頂点から対角線を引いて三角形に分けると、いくつの三角形に分けられますか？",
        choices: [
        "9つ",
        "12つ",
        "11つ",
        "10つ"
        ],
        correctAnswerIndex: 3,
        explanation: "十二角形は、1つの頂点から対角線を引くと、辺の数より2少ない10つの三角形に分けられます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】九角形の内角の和と六角形の内角の和の差は何度ですか？",
        answer: "540",
        acceptableAnswers: ["５４０"],
        referenceTitle: "1つの頂点から分けられる三角形の数",
        referenceRows: [
        QuizReferenceRow(label: "六角形", value: "4つ"),
        QuizReferenceRow(label: "七角形", value: "5つ"),
        QuizReferenceRow(label: "八角形", value: "6つ"),
        QuizReferenceRow(label: "九角形", value: "7つ")
        ],
        explanation: "九角形の内角の和は180 × 7 = 1260°、六角形の内角の和は180 × 4 = 720°です。差は1260 - 720 = 540°です。"
        ),
        QuizQuestion(
        question: "3.6 × 0.4 はいくつですか？",
        choices: [
        "0.144",
        "1.44",
        "14.4",
        "4.0"
        ],
        correctAnswerIndex: 1,
        explanation: "3.6 × 0.4 = 1.44です。"
        ),

        QuizQuestion(
        question: "12.6 ÷ 0.35 はいくつですか？",
        choices: [
        "35",
        "3.6",
        "30",
        "36"
        ],
        correctAnswerIndex: 3,
        explanation: "わる数とわられる数を100倍すると、1260 ÷ 35になります。1260 ÷ 35 = 36なので、答えは36です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】8.4 ÷ 1.2 = ＿＿ に入る数を答えましょう。",
        answer: "7",
        acceptableAnswers: ["7.0", "７"],
        explanation: "8.4 ÷ 1.2 = 7なので、＿＿に入る数は7です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】2.75 × 1.6を計算する手順を正しい順に並べましょう。",
        choices: [
        "積は小数第3位までになるように、4400を4.400とする",
        "小数点を取って、275 × 16を計算する",
        "2.75 × 1.6 = 4.4と答える",
        "275 × 16 = 4400を求める"
        ],
        orderedChoices: [
        "小数点を取って、275 × 16を計算する",
        "275 × 16 = 4400を求める",
        "積は小数第3位までになるように、4400を4.400とする",
        "2.75 × 1.6 = 4.4と答える"
        ],
        explanation: "275 × 16 = 4400を計算し、もとの2つの数の小数部分が合わせて3けたなので4.400とします。したがって、2.75 × 1.6 = 4.4です。"
        ),

        QuizQuestion(
        question: "2/3 + 1/6 はいくつですか？",
        choices: [
        "3/6",
        "1",
        "5/6",
        "2/9"
        ],
        correctAnswerIndex: 2,
        explanation: "2/3を4/6に直すと、4/6 + 1/6 = 5/6です。"
        ),

        QuizQuestion(
        question: "7/8 - 2/3 はいくつですか？",
        choices: [
        "5/8",
        "19/24",
        "5/5",
        "5/24"
        ],
        correctAnswerIndex: 3,
        explanation: "7/8を21/24、2/3を16/24に直すと、21/24 - 16/24 = 5/24です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】1と3/5 + 2と1/4 = ＿＿ に入る数を答えましょう。",
        answer: "3と17/20",
        acceptableAnswers: ["77/20", "３と１７／２０", "７７／２０"],
        explanation: "3/5を12/20、1/4を5/20に直すと、1と12/20 + 2と5/20 = 3と17/20です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】大きさの等しい分数を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1/2", match: "3/6"),
        QuizMatchingPair(prompt: "2/5", match: "6/15"),
        QuizMatchingPair(prompt: "3/4", match: "9/12"),
        QuizMatchingPair(prompt: "4/7", match: "12/21")
        ],
        choices: ["9/12", "12/21", "3/6", "6/15"],
        explanation: "1/2は3/6、2/5は6/15、3/4は9/12、4/7は12/21と大きさが等しいです。"
        ),

        QuizQuestion(
        question: "30人のうち12人が図書委員です。全体の人数をもとにした図書委員の人数の割合を、小数で表すといくつですか？",
        choices: [
        "0.4",
        "0.3",
        "0.25",
        "0.6"
        ],
        correctAnswerIndex: 0,
        explanation: "比べる量12人を、もとにする量30人でわります。12 ÷ 30 = 0.4なので、割合は0.4です。"
        ),

        QuizQuestion(
        question: "1.5kgをもとにすると、1.8kgは何倍ですか？",
        choices: [
        "1.2倍",
        "3.3倍",
        "0.8倍",
        "1.5倍"
        ],
        correctAnswerIndex: 0,
        explanation: "比べる量1.8kgを、もとにする量1.5kgでわります。1.8 ÷ 1.5 = 1.2なので、1.2倍です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】目標の50mに対して35m進みました。目標をもとにした進んだ長さの割合は ＿＿ です。小数で答えましょう。",
        answer: "0.7",
        acceptableAnswers: ["０．７"],
        explanation: "35 ÷ 50 = 0.7なので、進んだ長さの割合は0.7です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】目標に対する実績の割合が最も大きい商品を答えましょう。",
        answer: "C商品",
        acceptableAnswers: ["C"],
        referenceTitle: "商品の販売目標と実績",
        referenceRows: [
        QuizReferenceRow(label: "A商品", value: "目標80個・実績68個"),
        QuizReferenceRow(label: "B商品", value: "目標120個・実績96個"),
        QuizReferenceRow(label: "C商品", value: "目標150個・実績135個")
        ],
        explanation: "目標に対する実績の割合は、A商品が68 ÷ 80 = 0.85、B商品が96 ÷ 120 = 0.8、C商品が135 ÷ 150 = 0.9です。最も大きいのはC商品です。"
        ),

        QuizQuestion(
        question: "240の15%はいくつですか？",
        choices: [
        "40",
        "36",
        "30",
        "24"
        ],
        correctAnswerIndex: 1,
        explanation: "15%を小数で表すと0.15です。240 × 0.15 = 36なので、答えは36です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】3200円の商品を25%引きで買います。代金は ＿＿ 円です。",
        answer: "2400",
        acceptableAnswers: ["２４００"],
        explanation: "25%引きでは、もとの代金の75%を支払います。3200 × 0.75 = 2400なので、代金は2400円です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】割引後の代金に送料を加えた支払額を答えましょう。",
        answer: "3500",
        acceptableAnswers: ["３５００"],
        referenceTitle: "通信販売の代金",
        referenceRows: [
        QuizReferenceRow(label: "商品の定価", value: "4000円"),
        QuizReferenceRow(label: "割引率", value: "20%"),
        QuizReferenceRow(label: "送料", value: "300円")
        ],
        explanation: "割引後の代金は4000 × 0.8 = 3200円です。送料300円を加えると、支払額は3500円です。"
        ),

        QuizQuestion(
        question: "4回の計算テストの点数が14点、18点、16点、12点でした。平均は何点ですか？",
        choices: [
        "15点",
        "16点",
        "14点",
        "60点"
        ],
        correctAnswerIndex: 0,
        explanation: "4回の合計は14 + 18 + 16 + 12 = 60点です。60 ÷ 4 = 15なので、平均は15点です。"
        ),

        QuizQuestion(
        question: "4回のテストの平均が78点でした。5回目に88点を取ると、5回の平均は何点になりますか？",
        choices: [
        "83点",
        "79点",
        "80点",
        "81点"
        ],
        correctAnswerIndex: 2,
        explanation: "はじめの4回の合計は78 × 4 = 312点です。88点を加えると400点なので、400 ÷ 5 = 80点です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】6人の身長142cm、145cm、150cm、148cm、147cm、144cmの平均を求める手順を正しい順に並べましょう。",
        choices: [
        "876 ÷ 6を計算する",
        "平均は146cmと求める",
        "6人の身長をすべて足す",
        "合計は876cmと求める"
        ],
        orderedChoices: [
        "6人の身長をすべて足す",
        "合計は876cmと求める",
        "876 ÷ 6を計算する",
        "平均は146cmと求める"
        ],
        explanation: "6人の身長の合計は876cmです。876 ÷ 6 = 146なので、平均は146cmです。"
        ),

        QuizQuestion(
        question: "長さ5mで重さ650gのロープがあります。1mあたりの重さは何gですか？",
        choices: [
        "135g",
        "130g",
        "125g",
        "120g"
        ],
        correctAnswerIndex: 1,
        explanation: "650 ÷ 5 = 130なので、1mあたりの重さは130gです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】8箱で6.4kgになる荷物があります。1箱の重さがすべて同じとき、15箱では ＿＿ kgになります。",
        answer: "12",
        acceptableAnswers: ["１２"],
        explanation: "1箱あたりの重さは6.4 ÷ 8 = 0.8kgです。0.8 × 15 = 12なので、15箱では12kgです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】それぞれの1つ分、または1あたりの量を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "840円で7冊のノート", match: "1冊120円"),
        QuizMatchingPair(prompt: "15Lで180km走る車", match: "1Lで12km"),
        QuizMatchingPair(prompt: "6mで4.8kgの棒", match: "1mで0.8kg"),
        QuizMatchingPair(prompt: "9人で63個を同じ数ずつ分ける", match: "1人7個")
        ],
        choices: ["1人7個", "1mで0.8kg", "1冊120円", "1Lで12km"],
        explanation: "840 ÷ 7 = 120、180 ÷ 15 = 12、4.8 ÷ 6 = 0.8、63 ÷ 9 = 7なので、それぞれ1冊120円、1Lで12km、1mで0.8kg、1人7個です。"
        ),

        QuizQuestion(
        question: "縦2.5cm、横4cm、高さ6cmの直方体の体積は何立方センチメートルですか？",
        choices: [
        "75立方センチメートル",
        "65立方センチメートル",
        "50立方センチメートル",
        "60立方センチメートル"
        ],
        correctAnswerIndex: 3,
        explanation: "直方体の体積は、縦×横×高さで求めます。2.5 × 4 × 6 = 60なので、60立方センチメートルです。"
        ),

        QuizQuestion(
        question: "内のりが縦50cm、横32cm、高さ40cmの水そうがあります。高さの75%まで水を入れると、水の体積は何Lですか？",
        choices: [
        "30L",
        "64L",
        "48L",
        "120L"
        ],
        correctAnswerIndex: 2,
        explanation: "水の深さは40 × 0.75 = 30cmです。50 × 32 × 30 = 48000立方センチメートルで、1000立方センチメートルは1Lなので、48Lです。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】体積が最も大きい箱を答えましょう。",
        answer: "Bの箱",
        acceptableAnswers: ["B", "B箱", "Bの"],
        referenceTitle: "3つの直方体の箱",
        referenceRows: [
        QuizReferenceRow(label: "Aの箱", value: "縦30cm・横20cm・高さ15cm"),
        QuizReferenceRow(label: "Bの箱", value: "縦25cm・横24cm・高さ16cm"),
        QuizReferenceRow(label: "Cの箱", value: "縦40cm・横15cm・高さ14cm")
        ],
        explanation: "Aの箱は9000立方センチメートル、Bの箱は9600立方センチメートル、Cの箱は8400立方センチメートルです。最も体積が大きいのはBの箱です。"
        ),

        QuizQuestion(
        question: "三角形ABCと三角形DEFは合同で、AとD、BとE、CとFが対応しています。角Bが68°のとき、角Eは何度ですか？",
        choices: [
        "68°",
        "112°",
        "52°",
        "62°"
        ],
        correctAnswerIndex: 0,
        explanation: "合同な図形では、対応する角の大きさは等しくなります。角Bと角Eが対応するので、角Eは68°です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】四角形ABCDと四角形EFGHは合同で、AとE、BとF、CとG、DとHが対応しています。辺BCが7.2cmのとき、辺FGは ＿＿ cmです。",
        answer: "7.2",
        acceptableAnswers: ["７．２"],
        explanation: "合同な図形では、対応する辺の長さは等しくなります。辺BCと辺FGが対応するので、辺FGは7.2cmです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】三角形ABCと三角形DEFは合同で、AとD、BとE、CとFが対応しています。角Aが47°、角Eが68°のとき、角Fを求める手順を正しい順に並べましょう。",
        choices: [
        "対応する角なので、角F = 65°とする",
        "三角形ABCで、角C = 180° - 47° - 68°とする",
        "合同なので、角B = 角E = 68°とする",
        "角C = 65°を求める"
        ],
        orderedChoices: [
        "合同なので、角B = 角E = 68°とする",
        "三角形ABCで、角C = 180° - 47° - 68°とする",
        "角C = 65°を求める",
        "対応する角なので、角F = 65°とする"
        ],
        explanation: "合同なので角Bは角Eと等しく68°です。三角形の内角の和から角Cは180° - 47° - 68° = 65°となり、角Cと対応する角Fも65°です。"
        ),

        QuizQuestion(
        question: "辺が8本ある多角形を何といいますか？",
        choices: [
        "八角形",
        "七角形",
        "十角形",
        "九角形"
        ],
        correctAnswerIndex: 0,
        explanation: "辺が8本ある多角形は八角形です。"
        ),

        QuizQuestion(
        question: "六角形の5つの角が105°、115°、130°、125°、110°です。残りの1つの角は何度ですか？",
        choices: [
        "155°",
        "135°",
        "145°",
        "125°"
        ],
        correctAnswerIndex: 1,
        explanation: "六角形の内角の和は720°です。5つの角の和は105 + 115 + 130 + 125 + 110 = 585°なので、残りの角は720 - 585 = 135°です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】1つの頂点から対角線を引くと5つの三角形に分けられる多角形の、内角の和を答えましょう。",
        answer: "900",
        acceptableAnswers: ["９００"],
        referenceTitle: "多角形と分けられる三角形の数",
        referenceRows: [
        QuizReferenceRow(label: "五角形", value: "3つ"),
        QuizReferenceRow(label: "六角形", value: "4つ"),
        QuizReferenceRow(label: "七角形", value: "5つ"),
        QuizReferenceRow(label: "八角形", value: "6つ")
        ],
        explanation: "5つの三角形に分けられるのは七角形です。三角形5つ分の角の和なので、180 × 5 = 900°です。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .sansu5, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu5ListView(isPresenting: .constant(false))
    }
}
