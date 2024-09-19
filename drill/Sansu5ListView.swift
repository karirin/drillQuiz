//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai5ListView: View {
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
                "1260円",
                "1260円"
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
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。6×6×5=180立方センチメートルです。"
        ),

        QuizQuestion(
            question: "1個210円の桃を3個買うといくらですか？",
            choices: [
                "620円",
                "630円",
                "630円",
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
                "960円"
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 3,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
            explanation: "直方体の体積は、縦×横×高さで計算します。4×8×4=144立方センチメートルです。"
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
                "850円",
                "910円"
            ],
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 1,
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

struct Shakai5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai5ListView(isPresenting: .constant(false))
    }
}
