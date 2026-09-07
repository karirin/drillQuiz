//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Sansu4ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "次の中で、2/7より大きい分数はどれですか？",
            choices: [
                "1/8",
                "3/7",
                "1/9",
                "1/10"
            ],
            correctAnswerIndex: 1,
            explanation: "3/7は2/7より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦7cm、横8cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "54平方センチメートル",
                "56平方センチメートル",
                "60平方センチメートル",
                "64平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。7×8=56平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個50円のりんごを5個買いました。全部でいくらになりますか？",
            choices: [
                "250円",
                "300円",
                "350円",
                "400円"
            ],
            correctAnswerIndex: 0,
            explanation: "50円×5個で250円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/8より小さい分数はどれですか？",
            choices: [
                "4/8",
                "2/8",
                "5/8",
                "6/8"
            ],
            correctAnswerIndex: 1,
            explanation: "2/8は3/8より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦6cm、横10cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "50平方センチメートル",
                "55平方センチメートル",
                "60平方センチメートル",
                "65平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。6×10=60平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、4/9より大きい分数はどれですか？",
            choices: [
                "5/9",
                "3/9",
                "2/9",
                "1/9"
            ],
            correctAnswerIndex: 0,
            explanation: "5/9は4/9より大きい分数です。"
        ),
        QuizQuestion(
            question: "1個70円のみかんを4個買いました。全部でいくらですか？",
            choices: [
                "240円",
                "280円",
                "320円",
                "350円"
            ],
            correctAnswerIndex: 1,
            explanation: "70円×4個で280円です。"
        ),
        QuizQuestion(
            question: "縦13cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "24平方センチメートル",
                "26平方センチメートル",
                "28平方センチメートル",
                "30平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。13×2=26平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個100円のパンを4個買いました。全部でいくらですか？",
            choices: [
                "300円",
                "400円",
                "450円",
                "500円"
            ],
            correctAnswerIndex: 1,
            explanation: "100円×4個で400円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/5より大きい分数はどれですか？",
            choices: [
                "1/2",
                "2/5",
                "4/5",
                "3/8"
            ],
            correctAnswerIndex: 2,
            explanation: "4/5は3/5より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦9cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "40平方センチメートル",
                "45平方センチメートル",
                "50平方センチメートル",
                "55平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。9×5=45平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個60円のクッキーを6個買いました。全部でいくらになりますか？",
            choices: [
                "320円",
                "340円",
                "360円",
                "380円"
            ],
            correctAnswerIndex: 2,
            explanation: "60円×6個で360円です。"
        ),
        QuizQuestion(
            question: "次の中で、5/8より小さい分数はどれですか？",
            choices: [
                "6/8",
                "7/8",
                "4/8",
                "8/8"
            ],
            correctAnswerIndex: 2,
            explanation: "4/8は5/8より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦12cm、横7cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "74平方センチメートル",
                "84平方センチメートル",
                "94平方センチメートル",
                "104平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。12×7=84平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、1/4より大きい分数はどれですか？",
            choices: [
                "1/8",
                "2/4",
                "1/5",
                "1/6"
            ],
            correctAnswerIndex: 1,
            explanation: "2/4は1/4より大きい分数です。"
        ),
        QuizQuestion(
            question: "リンゴが1個120円で、4個買いました。全部でいくらですか？",
            choices: [
                "460円",
                "480円",
                "500円",
                "520円"
            ],
            correctAnswerIndex: 1,
            explanation: "120円×4個で480円です。"
        ),
        QuizQuestion(
            question: "縦15cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "40平方センチメートル",
                "45平方センチメートル",
                "50平方センチメートル",
                "55平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。15×3=45平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個90円のチョコレートを3個買いました。全部でいくらですか？",
            choices: [
                "250円",
                "270円",
                "290円",
                "300円"
            ],
            correctAnswerIndex: 1,
            explanation: "90円×3個で270円です。"
        ),
        QuizQuestion(
            question: "次の中で、2/3より小さい分数はどれですか？",
            choices: [
                "3/4",
                "1/2",
                "5/6",
                "4/5"
            ],
            correctAnswerIndex: 1,
            explanation: "1/2は2/3より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦8cm、横6cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "42平方センチメートル",
                "44平方センチメートル",
                "46平方センチメートル",
                "48平方センチメートル"
            ],
            correctAnswerIndex: 3,
            explanation: "長方形の面積は縦×横で求めます。8×6=48平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個90円のリンゴを5個買いました。全部でいくらになりますか？",
            choices: [
                "400円",
                "450円",
                "500円",
                "550円"
            ],
            correctAnswerIndex: 1,
            explanation: "90円×5個で450円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/8より大きい分数はどれですか？",
            choices: [
                "2/8",
                "3/8",
                "1/8",
                "5/8"
            ],
            correctAnswerIndex: 3,
            explanation: "5/8は3/8より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦11cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "55平方センチメートル",
                "50平方センチメートル",
                "60平方センチメートル",
                "65平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "長方形の面積は縦×横で求めます。11×5=55平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、1/6より大きい分数はどれですか？",
            choices: [
                "1/7",
                "1/9",
                "1/8",
                "1/5"
            ],
            correctAnswerIndex: 3,
            explanation: "1/5は1/6より大きい分数です。"
        ),
        QuizQuestion(
            question: "みかんが1個100円で、3個買いました。全部でいくらですか？",
            choices: [
                "200円",
                "300円",
                "400円",
                "500円"
            ],
            correctAnswerIndex: 1,
            explanation: "100円×3個で300円です。"
        ),
        QuizQuestion(
            question: "縦7cm、横9cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "55平方センチメートル",
                "60平方センチメートル",
                "63平方センチメートル",
                "65平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。7×9=63平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個70円のパンを4個買いました。全部でいくらですか？",
            choices: [
                "280円",
                "300円",
                "320円",
                "350円"
            ],
            correctAnswerIndex: 0,
            explanation: "70円×4個で280円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/7より大きい分数はどれですか？",
            choices: [
                "1/2",
                "2/7",
                "1/3",
                "3/9"
            ],
            correctAnswerIndex: 0,
            explanation: "1/2は3/7より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦9cm、横6cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "45平方センチメートル",
                "54平方センチメートル",
                "60平方センチメートル",
                "66平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。9×6=54平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個120円のジュースを4本買いました。全部でいくらになりますか？",
            choices: [
                "400円",
                "450円",
                "480円",
                "500円"
            ],
            correctAnswerIndex: 2,
            explanation: "120円×4本で480円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/8より小さい分数はどれですか？",
            choices: [
                "2/8",
                "1/10",
                "3/8",
                "4/8"
            ],
            correctAnswerIndex: 1,
            explanation: "1/10は1/8より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦12cm、横8cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "80平方センチメートル",
                "90平方センチメートル",
                "96平方センチメートル",
                "100平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。12×8=96平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、4/6より大きい分数はどれですか？",
            choices: [
                "2/6",
                "5/6",
                "3/6",
                "1/6"
            ],
            correctAnswerIndex: 1,
            explanation: "5/6は4/6より大きい分数です。"
        ),
        QuizQuestion(
            question: "リンゴが1個150円で、3個買いました。全部でいくらですか？",
            choices: [
                "450円",
                "400円",
                "500円",
                "350円"
            ],
            correctAnswerIndex: 0,
            explanation: "150円×3個で450円です。"
        ),
        QuizQuestion(
            question: "縦10cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "45平方センチメートル",
                "50平方センチメートル",
                "55平方センチメートル",
                "60平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。10×5=50平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個75円のチョコを6個買いました。全部でいくらですか？",
            choices: [
                "400円",
                "450円",
                "500円",
                "550円"
            ],
            correctAnswerIndex: 1,
            explanation: "75円×6個で450円です。"
        ),
        QuizQuestion(
            question: "次の中で、2/9より大きい分数はどれですか？",
            choices: [
                "1/10",
                "1/4",
                "1/8",
                "1/12"
            ],
            correctAnswerIndex: 1,
            explanation: "1/4は2/9より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦12cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "55平方センチメートル",
                "50平方センチメートル",
                "60平方センチメートル",
                "65平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。12×5=60平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個80円のお菓子を4個買いました。全部でいくらになりますか？",
            choices: [
                "300円",
                "320円",
                "340円",
                "360円"
            ],
            correctAnswerIndex: 1,
            explanation: "80円×4個で320円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/3より小さい分数はどれですか？",
            choices: [
                "2/3",
                "1/2",
                "1/4",
                "3/4"
            ],
            correctAnswerIndex: 2,
            explanation: "1/4は1/3より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦7cm、横6cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "40平方センチメートル",
                "42平方センチメートル",
                "44平方センチメートル",
                "46平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。7×6=42平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、5/9より大きい分数はどれですか？",
            choices: [
                "4/9",
                "3/9",
                "6/9",
                "1/9"
            ],
            correctAnswerIndex: 2,
            explanation: "6/9は5/9より大きい分数です。"
        ),
        QuizQuestion(
            question: "ノートが1冊120円で、2冊買いました。全部でいくらですか？",
            choices: [
                "240円",
                "260円",
                "280円",
                "300円"
            ],
            correctAnswerIndex: 0,
            explanation: "120円×2冊で240円です。"
        ),
        QuizQuestion(
            question: "縦6cm、横11cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "60平方センチメートル",
                "66平方センチメートル",
                "72平方センチメートル",
                "78平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。6×11=66平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個90円のバナナを3個買いました。全部でいくらですか？",
            choices: [
                "250円",
                "270円",
                "280円",
                "300円"
            ],
            correctAnswerIndex: 1,
            explanation: "90円×3個で270円です。"
        ),
        QuizQuestion(
            question: "次の中で、4/7より大きい分数はどれですか？",
            choices: [
                "3/7",
                "5/7",
                "2/7",
                "1/7"
            ],
            correctAnswerIndex: 1,
            explanation: "5/7は4/7より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦5cm、横8cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "35平方センチメートル",
                "40平方センチメートル",
                "45平方センチメートル",
                "50平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。5×8=40平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個75円のりんごを4個買いました。全部でいくらになりますか？",
            choices: [
                "250円",
                "300円",
                "400円",
                "450円"
            ],
            correctAnswerIndex: 1,
            explanation: "75円×4個で300円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/5より小さい分数はどれですか？",
            choices: [
                "3/5",
                "2/5",
                "1/6",
                "4/5"
            ],
            correctAnswerIndex: 2,
            explanation: "1/6は1/5より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦10cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "25平方センチメートル",
                "30平方センチメートル",
                "35平方センチメートル",
                "40平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。10×3=30平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、3/8より大きい分数はどれですか？",
            choices: [
                "1/8",
                "3/8",
                "2/8",
                "5/8"
            ],
            correctAnswerIndex: 3,
            explanation: "5/8は3/8より大きい分数です。"
        ),
        QuizQuestion(
            question: "みかんが1個60円で、5個買いました。全部でいくらですか？",
            choices: [
                "250円",
                "300円",
                "350円",
                "400円"
            ],
            correctAnswerIndex: 1,
            explanation: "60円×5個で300円です。"
        ),
        QuizQuestion(
            question: "縦4cm、横12cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "44平方センチメートル",
                "48平方センチメートル",
                "52平方センチメートル",
                "56平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。4×12=48平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個90円のパンを5個買いました。全部でいくらですか？",
            choices: [
                "350円",
                "400円",
                "450円",
                "500円"
            ],
            correctAnswerIndex: 2,
            explanation: "90円×5個で450円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/4より大きい分数はどれですか？",
            choices: [
                "1/5",
                "1/3",
                "1/6",
                "1/7"
            ],
            correctAnswerIndex: 1,
            explanation: "1/3は1/4より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦9cm、横4cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "32平方センチメートル",
                "34平方センチメートル",
                "36平方センチメートル",
                "38平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。9×4=36平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個110円のパンを3つ買いました。全部でいくらになりますか？",
            choices: [
                "300円",
                "320円",
                "330円",
                "340円"
            ],
            correctAnswerIndex: 2,
            explanation: "110円×3つで330円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/7より大きい分数はどれですか？",
            choices: [
                "2/7",
                "1/7",
                "3/7",
                "5/7"
            ],
            correctAnswerIndex: 3,
            explanation: "5/7は3/7より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦6cm、横9cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "45平方センチメートル",
                "50平方センチメートル",
                "54平方センチメートル",
                "60平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。6×9=54平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、2/5より小さい分数はどれですか？",
            choices: [
                "3/5",
                "1/3",
                "4/5",
                "5/6"
            ],
            correctAnswerIndex: 1,
            explanation: "1/3は2/5より小さい分数です。"
        ),
        QuizQuestion(
            question: "バナナが1房120円で、3房買いました。全部でいくらですか？",
            choices: [
                "360円",
                "320円",
                "300円",
                "340円"
            ],
            correctAnswerIndex: 0,
            explanation: "120円×3房で360円です。"
        ),
        QuizQuestion(
            question: "縦7cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "32平方センチメートル",
                "35平方センチメートル",
                "40平方センチメートル",
                "45平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。7×5=35平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個150円のアイスクリームを4つ買いました。全部でいくらですか？",
            choices: [
                "500円",
                "550円",
                "600円",
                "450円"
            ],
            correctAnswerIndex: 2,
            explanation: "150円×4つで600円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/5より大きい分数はどれですか？",
            choices: [
                "2/5",
                "1/3",
                "4/5",
                "1/2"
            ],
            correctAnswerIndex: 2,
            explanation: "4/5は3/5より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦8cm、横7cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "48平方センチメートル",
                "54平方センチメートル",
                "56平方センチメートル",
                "60平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。8×7=56平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個85円のチョコを5個買いました。全部でいくらになりますか？",
            choices: [
                "400円",
                "425円",
                "450円",
                "475円"
            ],
            correctAnswerIndex: 1,
            explanation: "85円×5個で425円です。"
        ),
        QuizQuestion(
            question: "次の中で、2/3より小さい分数はどれですか？",
            choices: [
                "3/4",
                "5/6",
                "1/2",
                "4/5"
            ],
            correctAnswerIndex: 2,
            explanation: "1/2は2/3より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦5cm、横10cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "45平方センチメートル",
                "50平方センチメートル",
                "55平方センチメートル",
                "60平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。5×10=50平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、6/8より大きい分数はどれですか？",
            choices: [
                "4/8",
                "7/8",
                "5/8",
                "3/8"
            ],
            correctAnswerIndex: 1,
            explanation: "7/8は6/8より大きい分数です。"
        ),
        QuizQuestion(
            question: "りんごが1つ120円で、3つ買いました。全部でいくらですか？",
            choices: [
                "340円",
                "360円",
                "380円",
                "400円"
            ],
            correctAnswerIndex: 1,
            explanation: "120円×3つで360円です。"
        ),
        QuizQuestion(
            question: "縦14cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "24平方センチメートル",
                "26平方センチメートル",
                "28平方センチメートル",
                "30平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。14×2=28平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個75円のキャンディを4つ買いました。全部でいくらですか？",
            choices: [
                "300円",
                "350円",
                "250円",
                "280円"
            ],
            correctAnswerIndex: 0,
            explanation: "75円×4つで300円です。"
        ),
        QuizQuestion(
            question: "次の中で、2/7より大きい分数はどれですか？",
            choices: [
                "1/8",
                "3/7",
                "1/9",
                "1/6"
            ],
            correctAnswerIndex: 1,
            explanation: "3/7は2/7より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦9cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "27平方センチメートル",
                "25平方センチメートル",
                "30平方センチメートル",
                "28平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "長方形の面積は縦×横で求めます。9×3=27平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個70円のりんごを6個買いました。全部でいくらになりますか？",
            choices: [
                "350円",
                "400円",
                "420円",
                "450円"
            ],
            correctAnswerIndex: 2,
            explanation: "70円×6個で420円です。"
        ),
        QuizQuestion(
            question: "次の中で、5/8より小さい分数はどれですか？",
            choices: [
                "3/4",
                "7/8",
                "1/2",
                "6/8"
            ],
            correctAnswerIndex: 2,
            explanation: "1/2は5/8より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦11cm、横4cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "40平方センチメートル",
                "44平方センチメートル",
                "46平方センチメートル",
                "48平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。11×4=44平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、4/9より大きい分数はどれですか？",
            choices: [
                "5/9",
                "3/9",
                "2/9",
                "1/9"
            ],
            correctAnswerIndex: 0,
            explanation: "5/9は4/9より大きい分数です。"
        ),
        QuizQuestion(
            question: "お菓子が4個入った袋が5袋あります。お菓子は全部で何個ですか？",
            choices: [
                "20個",
                "22個",
                "18個",
                "24個"
            ],
            correctAnswerIndex: 0,
            explanation: "4個×5袋で20個です。"
        ),
        QuizQuestion(
            question: "縦13cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "36平方センチメートル",
                "39平方センチメートル",
                "42平方センチメートル",
                "45平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。13×3=39平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個90円のパンを4個買いました。全部でいくらですか？",
            choices: [
                "320円",
                "360円",
                "400円",
                "450円"
            ],
            correctAnswerIndex: 1,
            explanation: "90円×4個で360円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/8より大きい分数はどれですか？",
            choices: [
                "1/4",
                "2/5",
                "1/6",
                "1/7"
            ],
            correctAnswerIndex: 1,
            explanation: "2/5は3/8より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦8cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "35平方センチメートル",
                "40平方センチメートル",
                "45平方センチメートル",
                "50平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。8×5=40平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個120円のジュースを3本買いました。全部でいくらになりますか？",
            choices: [
                "320円",
                "360円",
                "400円",
                "420円"
            ],
            correctAnswerIndex: 1,
            explanation: "120円×3本で360円です。"
        ),
        QuizQuestion(
            question: "次の中で、4/9より小さい分数はどれですか？",
            choices: [
                "5/9",
                "1/3",
                "3/4",
                "1/2"
            ],
            correctAnswerIndex: 1,
            explanation: "1/3は4/9より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦6cm、横7cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "40平方センチメートル",
                "42平方センチメートル",
                "44平方センチメートル",
                "46平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。6×7=42平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、5/7より大きい分数はどれですか？",
            choices: [
                "4/7",
                "3/7",
                "6/7",
                "2/7"
            ],
            correctAnswerIndex: 2,
            explanation: "6/7は5/7より大きい分数です。"
        ),
        QuizQuestion(
            question: "お菓子が1つ150円で、2つ買いました。全部でいくらですか？",
            choices: [
                "200円",
                "300円",
                "250円",
                "350円"
            ],
            correctAnswerIndex: 1,
            explanation: "150円×2つで300円です。"
        ),
        QuizQuestion(
            question: "縦12cm、横4cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "48平方センチメートル",
                "50平方センチメートル",
                "60平方センチメートル",
                "72平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "長方形の面積は縦×横で求めます。12×4=48平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ80円のクッキーを5つ買いました。全部でいくらですか？",
            choices: [
                "300円",
                "350円",
                "400円",
                "450円"
            ],
            correctAnswerIndex: 2,
            explanation: "80円×5つで400円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/8より大きい分数はどれですか？",
            choices: [
                "1/10",
                "1/12",
                "1/4",
                "1/16"
            ],
            correctAnswerIndex: 2,
            explanation: "1/4は1/8より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦7cm、横6cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "35平方センチメートル",
                "42平方センチメートル",
                "45平方センチメートル",
                "48平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。7×6=42平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個90円のペンを4本買いました。全部でいくらになりますか？",
            choices: [
                "320円",
                "360円",
                "400円",
                "450円"
            ],
            correctAnswerIndex: 1,
            explanation: "90円×4本で360円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/6より小さい分数はどれですか？",
            choices: [
                "1/4",
                "1/3",
                "1/8",
                "1/2"
            ],
            correctAnswerIndex: 2,
            explanation: "1/8は1/6より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦4cm、横10cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "40平方センチメートル",
                "44平方センチメートル",
                "48平方センチメートル",
                "50平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "長方形の面積は縦×横で求めます。4×10=40平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、5/6より小さい分数はどれですか？",
            choices: [
                "2/3",
                "5/6",
                "6/5",
                "1"
            ],
            correctAnswerIndex: 0,
            explanation: "2/3は5/6より小さい分数です。"
        ),
        QuizQuestion(
            question: "お菓子が3個入った袋が4袋あります。お菓子は全部で何個ですか？",
            choices: [
                "10個",
                "11個",
                "12個",
                "13個"
            ],
            correctAnswerIndex: 2,
            explanation: "3個×4袋で12個です。"
        ),
        QuizQuestion(
            question: "縦15cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "20平方センチメートル",
                "25平方センチメートル",
                "30平方センチメートル",
                "40平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。15×2=30平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個100円のりんごを3個買いました。全部でいくらですか？",
            choices: [
                "250円",
                "300円",
                "350円",
                "400円"
            ],
            correctAnswerIndex: 1,
            explanation: "100円×3個で300円です。"
        ),
        QuizQuestion(
            question: "次の中で、2/3より小さい分数はどれですか？",
            choices: [
                "3/4",
                "5/6",
                "1/2",
                "7/8"
            ],
            correctAnswerIndex: 2,
            explanation: "1/2は2/3より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦11cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "20平方センチメートル",
                "22平方センチメートル",
                "24平方センチメートル",
                "26平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。11×2=22平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ60円のキャンディを5個買いました。全部でいくらになりますか？",
            choices: [
                "200円",
                "300円",
                "240円",
                "320円"
            ],
            correctAnswerIndex: 1,
            explanation: "60円×5個で300円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/5より大きい分数はどれですか？",
            choices: [
                "2/5",
                "4/5",
                "1/3",
                "1/2"
            ],
            correctAnswerIndex: 1,
            explanation: "4/5は3/5より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦8cm、横5cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "35平方センチメートル",
                "40平方センチメートル",
                "42平方センチメートル",
                "48平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。8×5=40平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、7/8より小さい分数はどれですか？",
            choices: [
                "5/6",
                "7/8",
                "1",
                "9/8"
            ],
            correctAnswerIndex: 0,
            explanation: "5/6は7/8より小さい分数です。"
        ),
        QuizQuestion(
            question: "りんごが2個入った袋が5袋あります。りんごは全部で何個ですか？",
            choices: [
                "7個",
                "8個",
                "9個",
                "10個"
            ],
            correctAnswerIndex: 3,
            explanation: "2個×5袋で10個です。"
        ),
        QuizQuestion(
            question: "縦9cm、横4cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "32平方センチメートル",
                "36平方センチメートル",
                "40平方センチメートル",
                "44平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。9×4=36平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1個80円のリンゴを5個買いました。全部でいくらですか？",
            choices: [
                "400円",
                "500円",
                "480円",
                "560円"
            ],
            correctAnswerIndex: 0,
            explanation: "80円×5個で400円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/6より大きい分数はどれですか？",
            choices: [
                "1/8",
                "1/10",
                "1/4",
                "1/12"
            ],
            correctAnswerIndex: 2,
            explanation: "1/4は1/6より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦4cm、横9cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "36平方センチメートル",
                "32平方センチメートル",
                "40平方センチメートル",
                "45平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "長方形の面積は縦×横で求めます。4×9=36平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ50円のボールを6個買いました。全部でいくらになりますか？",
            choices: [
                "200円",
                "250円",
                "300円",
                "350円"
            ],
            correctAnswerIndex: 2,
            explanation: "50円×6個で300円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/3より大きい分数はどれですか？",
            choices: [
                "2/5",
                "1/6",
                "1/8",
                "1/7"
            ],
            correctAnswerIndex: 0,
            explanation: "2/5は1/3より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦12cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "20平方センチメートル",
                "24平方センチメートル",
                "26平方センチメートル",
                "30平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。12×2=24平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、4/7より小さい分数はどれですか？",
            choices: [
                "5/7",
                "6/7",
                "3/7",
                "7/7"
            ],
            correctAnswerIndex: 2,
            explanation: "3/7は4/7より小さい分数です。"
        ),
        QuizQuestion(
            question: "ノートが3冊入った袋が4袋あります。ノートは全部で何冊ですか？",
            choices: [
                "12冊",
                "15冊",
                "9冊",
                "10冊"
            ],
            correctAnswerIndex: 0,
            explanation: "3冊×4袋で12冊です。"
        ),
        QuizQuestion(
            question: "縦10cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "25平方センチメートル",
                "30平方センチメートル",
                "35平方センチメートル",
                "40平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。10×3=30平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ150円のノートを2冊買いました。全部でいくらになりますか？",
            choices: [
                "200円",
                "250円",
                "300円",
                "350円"
            ],
            correctAnswerIndex: 2,
            explanation: "150円×2冊で300円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/5より大きい分数はどれですか？",
            choices: [
                "1/6",
                "1/4",
                "1/7",
                "1/8"
            ],
            correctAnswerIndex: 1,
            explanation: "1/4は1/5より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦8cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "24平方センチメートル",
                "21平方センチメートル",
                "26平方センチメートル",
                "20平方センチメートル"
            ],
            correctAnswerIndex: 0,
            explanation: "長方形の面積は縦×横で求めます。8×3=24平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1本120円のジュースを3本買いました。全部でいくらになりますか？",
            choices: [
                "360円",
                "400円",
                "500円",
                "600円"
            ],
            correctAnswerIndex: 0,
            explanation: "120円×3本で360円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/4より小さい分数はどれですか？",
            choices: [
                "1/2",
                "7/8",
                "5/6",
                "4/5"
            ],
            correctAnswerIndex: 0,
            explanation: "1/2は3/4より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦9cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "16平方センチメートル",
                "18平方センチメートル",
                "20平方センチメートル",
                "22平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。9×2=18平方センチメートルです。"
        ),
        QuizQuestion(
            question: "次の中で、5/8より大きい分数はどれですか？",
            choices: [
                "3/8",
                "4/8",
                "6/8",
                "1/8"
            ],
            correctAnswerIndex: 2,
            explanation: "6/8は5/8より大きい分数です。"
        ),
        QuizQuestion(
            question: "お菓子が1つ150円で、2つ買いました。全部でいくらですか？",
            choices: [
                "200円",
                "300円",
                "250円",
                "350円"
            ],
            correctAnswerIndex: 1,
            explanation: "150円×2つで300円です。"
        ),
        QuizQuestion(
            question: "縦5cm、横7cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "32平方センチメートル",
                "35平方センチメートル",
                "28平方センチメートル",
                "40平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。5×7=35平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ80円のリンゴを4つ買いました。全部でいくらですか？",
            choices: [
                "240円",
                "320円",
                "400円",
                "280円"
            ],
            correctAnswerIndex: 1,
            explanation: "80円×4つで320円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/4より小さい分数はどれですか？",
            choices: [
                "1/2",
                "1/3",
                "1/6",
                "3/4"
            ],
            correctAnswerIndex: 2,
            explanation: "1/6は1/4より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦6cm、横4cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "20平方センチメートル",
                "24平方センチメートル",
                "28平方センチメートル",
                "30平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。6×4=24平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ100円のお菓子を5個買いました。全部でいくらになりますか？",
            choices: [
                "300円",
                "400円",
                "500円",
                "600円"
            ],
            correctAnswerIndex: 2,
            explanation: "100円×5個で500円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/3より大きい分数はどれですか？",
            choices: [
                "1/4",
                "1/5",
                "2/3",
                "1/6"
            ],
            correctAnswerIndex: 2,
            explanation: "2/3は1/3より大きい分数です。"
        ),
        QuizQuestion(
            question: "正方形の一辺が5cmの場合、面積は何平方センチメートルですか？",
            choices: [
                "20平方センチメートル",
                "25平方センチメートル",
                "30平方センチメートル",
                "35平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "正方形の面積は一辺×一辺で求めます。5×5=25平方センチメートルです。"
        ),
        QuizQuestion(
            question: "リンゴが2個入った袋が5袋あります。リンゴは全部で何個ですか？",
            choices: [
                "7個",
                "8個",
                "9個",
                "10個"
            ],
            correctAnswerIndex: 3,
            explanation: "2個×5袋で10個です。"
        ),
        QuizQuestion(
            question: "次の中で、2/5より小さい分数はどれですか？",
            choices: [
                "3/5",
                "4/5",
                "1/5",
                "5/6"
            ],
            correctAnswerIndex: 2,
            explanation: "1/5は2/5より小さい分数です。"
        ),
        QuizQuestion(
            question: "縦7cm、横2cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "12平方センチメートル",
                "14平方センチメートル",
                "16平方センチメートル",
                "18平方センチメートル"
            ],
            correctAnswerIndex: 1,
            explanation: "長方形の面積は縦×横で求めます。7×2=14平方センチメートルです。"
        ),
        QuizQuestion(
            question: "1つ200円の本を3冊買いました。全部でいくらになりますか？",
            choices: [
                "500円",
                "600円",
                "700円",
                "800円"
            ],
            correctAnswerIndex: 1,
            explanation: "200円×3冊で600円です。"
        ),
        QuizQuestion(
            question: "次の中で、1/2より大きい分数はどれですか？",
            choices: [
                "1/3",
                "1/4",
                "3/4",
                "1/6"
            ],
            correctAnswerIndex: 2,
            explanation: "3/4は1/2より大きい分数です。"
        ),
        QuizQuestion(
            question: "縦5cm、横3cmの長方形の面積は何平方センチメートルですか？",
            choices: [
                "8平方センチメートル",
                "10平方センチメートル",
                "15平方センチメートル",
                "20平方センチメートル"
            ],
            correctAnswerIndex: 2,
            explanation: "長方形の面積は縦×横で求めます。5×3=15平方センチメートルです。"
        ),
        QuizQuestion(
            question: "お菓子が4個入った袋が3袋あります。お菓子は全部で何個ですか？",
            choices: [
                "7個",
                "10個",
                "12個",
                "15個"
            ],
            correctAnswerIndex: 2,
            explanation: "4個×3袋で12個です。"
        ),

        QuizQuestion(
        question: "604,090,218の中で、数字の4が表す数はどれですか？",
        choices: [
        "40,000,000",
        "40,000",
        "4,000,000",
        "400,000"
        ],
        correctAnswerIndex: 2,
        explanation: "4は百万の位にあるので、表す数は4,000,000です。"
        ),
        QuizQuestion(
        question: "3億を4個、1,000万を2個、10万を7個合わせた数はどれですか？",
        choices: [
        "1,220,700,000",
        "1,200,270,000",
        "1,220,070,000",
        "1,207,200,000"
        ],
        correctAnswerIndex: 0,
        explanation: "3億を4個で1,200,000,000、1,000万を2個で20,000,000、10万を7個で700,000です。合わせると1,220,700,000です。"
        ),
        QuizQuestion(
        question: "7,560 ÷ 18の答えはどれですか？",
        choices: [
        "410",
        "418",
        "420",
        "430"
        ],
        correctAnswerIndex: 2,
        explanation: "7,560 ÷ 18 = 420です。18 × 420 = 7,560になります。"
        ),
        QuizQuestion(
        question: "6,217本の鉛筆を、1箱に28本ずつ入れます。28本入りの箱はいくつでき、何本あまりますか？",
        choices: [
        "222箱できて、2本あまる",
        "222箱できて、1本あまる",
        "223箱できて、1本あまる",
        "221箱できて、9本あまる"
        ],
        correctAnswerIndex: 1,
        explanation: "6,217 ÷ 28 = 222あまり1です。したがって、28本入りの箱は222箱でき、1本あまります。"
        ),
        QuizQuestion(
        question: "16.08 + 7.95の答えはどれですか？",
        choices: [
        "24.13",
        "23.93",
        "23.03",
        "24.03"
        ],
        correctAnswerIndex: 3,
        explanation: "小数点をそろえて計算すると、16.08 + 7.95 = 24.03です。"
        ),
        QuizQuestion(
        question: "25 - 9.728の答えはどれですか？",
        choices: [
        "15.272",
        "15.172",
        "16.272",
        "15.282"
        ],
        correctAnswerIndex: 0,
        explanation: "25を25.000と考えて計算すると、25.000 - 9.728 = 15.272です。"
        ),
        QuizQuestion(
        question: "2と3/11 - 7/11の答えはどれですか？",
        choices: [
        "1と6/11",
        "2と7/11",
        "1と7/11",
        "1と8/11"
        ],
        correctAnswerIndex: 2,
        explanation: "2と3/11を1と14/11と考えると、1と14/11 - 7/11 = 1と7/11です。"
        ),
        QuizQuestion(
        question: "1と4/13 + 8/13の答えはどれですか？",
        choices: [
        "1と11/13",
        "2と12/13",
        "1と12/13",
        "12/26"
        ],
        correctAnswerIndex: 2,
        explanation: "分母が同じなので分子を足します。1と4/13 + 8/13 = 1と12/13です。"
        ),
        QuizQuestion(
        question: "1回転の角度を12等分すると、1つ分の角度は何度ですか？",
        choices: [
        "45度",
        "24度",
        "36度",
        "30度"
        ],
        correctAnswerIndex: 3,
        explanation: "1回転は360度です。360 ÷ 12 = 30なので、1つ分の角度は30度です。"
        ),
        QuizQuestion(
        question: "直角2つ分の角度に35度を足すと、何度になりますか？",
        choices: [
        "225度",
        "215度",
        "235度",
        "205度"
        ],
        correctAnswerIndex: 1,
        explanation: "直角は90度なので、90 × 2 + 35 = 215度です。"
        ),
        QuizQuestion(
        question: "面積が288平方センチメートルで、横が16cmの長方形があります。縦は何cmですか？",
        choices: [
        "19cm",
        "18cm",
        "17cm",
        "16cm"
        ],
        correctAnswerIndex: 1,
        explanation: "縦の長さは、面積 ÷ 横で求めます。288 ÷ 16 = 18なので、縦は18cmです。"
        ),
        QuizQuestion(
        question: "縦23cm、横14cmの長方形から、縦8cm、横6cmの長方形を切り取りました。残りの面積は何平方センチメートルですか？",
        choices: [
        "268平方センチメートル",
        "264平方センチメートル",
        "274平方センチメートル",
        "272平方センチメートル"
        ],
        correctAnswerIndex: 2,
        explanation: "全体の面積は23 × 14 = 322平方センチメートル、切り取る部分は8 × 6 = 48平方センチメートルです。322 - 48 = 274平方センチメートルです。"
        ),
        QuizQuestion(
        question: "台形について、必ず成り立つことはどれですか？",
        choices: [
        "向かい合う辺のうち、1組は平行で、もう1組は平行ではない",
        "向かい合う2組の辺がそれぞれ平行である",
        "4つの角がすべて直角である",
        "4つの辺の長さがすべて等しい"
        ],
        correctAnswerIndex: 0,
        explanation: "台形は、向かい合う辺のうち、1組は平行で、もう1組は平行ではない四角形です。"
        ),
        QuizQuestion(
        question: "平行四辺形の1つの角が61度です。その角と向かい合う角は何度ですか？",
        choices: [
        "61度",
        "180度",
        "29度",
        "119度"
        ],
        correctAnswerIndex: 0,
        explanation: "平行四辺形では、向かい合う角の大きさは等しいので、答えは61度です。"
        ),
        QuizQuestion(
        question: "8時から12時までの気温が、10度、14度、9度、17度、15度でした。前の時刻からの変わり方が最も大きいのは、どの時刻の間ですか？",
        choices: [
        "9時と10時の間",
        "11時と12時の間",
        "8時と9時の間",
        "10時と11時の間"
        ],
        correctAnswerIndex: 3,
        explanation: "変化は順に4度上昇、5度下降、8度上昇、2度下降です。変わり方が最も大きいのは、10時と11時の間です。"
        ),
        QuizQuestion(
        question: "6,949,501を十万の位までの概数にすると、どれですか？",
        choices: [
        "6,900,000",
        "6,950,000",
        "7,000,000",
        "6,940,000"
        ],
        correctAnswerIndex: 0,
        explanation: "十万の位までの概数にするので、一万の位の4を見ます。4は5未満なので切り捨てて6,900,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】9億、500万、6千、40を合わせた数を、数字で入力しましょう。",
        answer: "905006040",
        acceptableAnswers: ["905,006,040", "９０５，００６，０４０", "９０５００６０４０"],
        explanation: "900,000,000 + 5,000,000 + 6,000 + 40 = 905,006,040です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】8,064 ÷ 32の答えを入力しましょう。",
        answer: "252",
        acceptableAnswers: ["２５２"],
        explanation: "8,064 ÷ 32 = 252です。32 × 252 = 8,064になります。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】4.7 + 0.86の答えを入力しましょう。",
        answer: "5.56",
        acceptableAnswers: ["5.560", "５．５６"],
        explanation: "4.7を4.70と考えて計算すると、4.70 + 0.86 = 5.56です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】4 - 17/15の答えを、分母が15の仮分数で入力しましょう。",
        answer: "43/15",
        acceptableAnswers: ["15分の43", "４３／１５", "43／15"],
        explanation: "4を60/15と考えると、60/15 - 17/15 = 43/15です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】5平方メートルは ＿＿ 平方センチメートルです。",
        answer: "50000",
        acceptableAnswers: ["50,000", "５０，０００", "５００００"],
        explanation: "1平方メートルは10,000平方センチメートルです。10,000 × 5 = 50,000平方センチメートルです。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】一万の位までの概数にすると460,000になる整数のうち、最も大きい数を入力しましょう。",
        answer: "464999",
        acceptableAnswers: ["464,999", "４６４，９９９", "４６４９９９"],
        explanation: "一万の位までの概数が460,000になる整数は455,000から464,999までです。最も大きい数は464,999です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】9,000万台の次の数を小さい順に並べましょう。",
        choices: ["90,090,900", "90,900,090", "90,009,900", "90,099,000"],
        orderedChoices: ["90,009,900", "90,090,900", "90,099,000", "90,900,090"],
        explanation: "小さい順は、90,009,900、90,090,900、90,099,000、90,900,090です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】5以上6未満の次の小数を大きい順に並べましょう。",
        choices: ["5.055", "5.505", "5.005", "5.55"],
        orderedChoices: ["5.55", "5.505", "5.055", "5.005"],
        explanation: "位をそろえると、5.550、5.505、5.055、5.005です。大きい順は5.55、5.505、5.055、5.005です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】月曜日から木曜日までの気温を折れ線グラフに表します。点を左から右へ結ぶ順に並べましょう。",
        choices: ["水曜日・13度", "月曜日・11度", "木曜日・15度", "火曜日・14度"],
        orderedChoices: ["月曜日・11度", "火曜日・14度", "水曜日・13度", "木曜日・15度"],
        explanation: "時間の順に点を結ぶので、月曜日・11度、火曜日・14度、水曜日・13度、木曜日・15度の順です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】回転や直角を使った表し方と、角度を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1回転の1/5", match: "72度"),
        QuizMatchingPair(prompt: "半回転より28度小さい角", match: "152度"),
        QuizMatchingPair(prompt: "直角の3倍", match: "270度"),
        QuizMatchingPair(prompt: "1回転より115度小さい角", match: "245度")
        ],
        choices: ["245度", "72度", "270度", "152度"],
        explanation: "360 ÷ 5 = 72度、180 - 28 = 152度、90 × 3 = 270度、360 - 115 = 245度です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】それぞれの四角形について、辺の長さの条件と周りの長さを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "一辺が9cmの正方形", match: "36cm"),
        QuizMatchingPair(prompt: "縦12cm、横7cmの長方形", match: "38cm"),
        QuizMatchingPair(prompt: "一辺が11cmのひし形", match: "44cm"),
        QuizMatchingPair(prompt: "隣り合う辺が13cmと8cmの平行四辺形", match: "42cm")
        ],
        choices: ["44cm", "36cm", "42cm", "38cm"],
        explanation: "正方形は9 × 4 = 36cm、長方形は(12 + 7) × 2 = 38cm、ひし形は11 × 4 = 44cm、平行四辺形は(13 + 8) × 2 = 42cmです。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】3種類のノートを18の班に同じ冊数ずつ分けます。1班が受け取るノートは、3種類合わせて何冊ですか？",
        answer: "210",
        acceptableAnswers: ["２１０"],
        referenceTitle: "種類別のノートの冊数",
        referenceRows: [
        QuizReferenceRow(label: "国語ノート", value: "1,134冊"),
        QuizReferenceRow(label: "算数ノート", value: "1,296冊"),
        QuizReferenceRow(label: "理科ノート", value: "1,350冊")
        ],
        explanation: "ノートは全部で1,134 + 1,296 + 1,350 = 3,780冊です。3,780 ÷ 18 = 210なので、1班が受け取るノートは210冊です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の時刻から気温が上がった温度の合計は何度ですか？",
        answer: "10",
        acceptableAnswers: ["１０"],
        referenceTitle: "ある日の気温の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "9時", value: "14度"),
        QuizReferenceRow(label: "10時", value: "18度"),
        QuizReferenceRow(label: "11時", value: "17度"),
        QuizReferenceRow(label: "12時", value: "23度"),
        QuizReferenceRow(label: "13時", value: "20度")
        ],
        explanation: "9時から10時に4度、11時から12時に6度上がっています。上がった温度の合計は4 + 6 = 10度です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】3つの地区の人数をそれぞれ千の位までの概数にして合計すると、何人ですか？",
        answer: "83000",
        acceptableAnswers: ["83,000", "８３，０００", "８３０００"],
        referenceTitle: "地区別の参加者数",
        referenceRows: [
        QuizReferenceRow(label: "北地区", value: "38,470人"),
        QuizReferenceRow(label: "中央地区", value: "27,650人"),
        QuizReferenceRow(label: "南地区", value: "16,920人")
        ],
        explanation: "38,470人は38,000人、27,650人は28,000人、16,920人は17,000人です。合計は83,000人です。"
        ),
        QuizQuestion(
        question: "806,304,570の中で、数字の3が表す数はどれですか？",
        choices: [
        "300,000",
        "30,000",
        "3,000,000",
        "300,000,000"
        ],
        correctAnswerIndex: 0,
        explanation: "3は十万の位にあるので、表す数は300,000です。"
        ),
        QuizQuestion(
        question: "1億は1万の何倍ですか？",
        choices: [
        "1,000倍",
        "10,000倍",
        "100,000倍",
        "1,000,000倍"
        ],
        correctAnswerIndex: 1,
        explanation: "1億は100,000,000、1万は10,000です。100,000,000 ÷ 10,000 = 10,000なので、1億は1万の10,000倍です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】7,000万、500万、8万、4千、2を合わせた数を、数字で入力しましょう。",
        answer: "75084002",
        acceptableAnswers: ["75,084,002", "７５，０８４，００２", "７５０８４００２"],
        explanation: "70,000,000 + 5,000,000 + 80,000 + 4,000 + 2 = 75,084,002です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】4億台を中心とした次の数を、大きい順に並べましょう。",
        choices: ["409,080,000", "490,008,000", "409,008,000", "409,800,000"],
        orderedChoices: ["490,008,000", "409,800,000", "409,080,000", "409,008,000"],
        explanation: "大きい順は、490,008,000、409,800,000、409,080,000、409,008,000です。"
        ),
        QuizQuestion(
        question: "8,736 ÷ 16の答えはどれですか？",
        choices: [
        "546",
        "544",
        "556",
        "536"
        ],
        correctAnswerIndex: 0,
        explanation: "8,736 ÷ 16 = 546です。16 × 546 = 8,736になります。"
        ),
        QuizQuestion(
        question: "6,749 ÷ 32の商とあまりはどれですか？",
        choices: [
        "210あまり19",
        "211あまり7",
        "209あまり29",
        "210あまり29"
        ],
        correctAnswerIndex: 3,
        explanation: "32 × 210 = 6,720で、6,749 - 6,720 = 29です。したがって、商は210、あまりは29です。"
        ),
        QuizQuestion(
        question: "5,987枚のカードを14枚ずつ束にします。14枚の束はいくつでき、何枚あまりますか？",
        choices: [
        "427束できて、11枚あまる",
        "427束できて、9枚あまる",
        "428束できて、5枚あまる",
        "426束できて、13枚あまる"
        ],
        correctAnswerIndex: 1,
        explanation: "5,987 ÷ 14 = 427あまり9です。したがって、14枚の束は427束でき、9枚あまります。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】9,408 ÷ 24の答えを入力しましょう。",
        answer: "392",
        acceptableAnswers: ["３９２"],
        explanation: "9,408 ÷ 24 = 392です。24 × 392 = 9,408になります。"
        ),
        QuizQuestion(
        question: "13.47 + 8.6の答えはどれですか？",
        choices: [
        "21.07",
        "22.67",
        "22.13",
        "22.07"
        ],
        correctAnswerIndex: 3,
        explanation: "8.6を8.60と考えて小数点をそろえると、13.47 + 8.60 = 22.07です。"
        ),
        QuizQuestion(
        question: "30.5 - 12.86の答えはどれですか？",
        choices: [
        "18.36",
        "17.64",
        "17.54",
        "18.64"
        ],
        correctAnswerIndex: 1,
        explanation: "30.5を30.50と考えて計算すると、30.50 - 12.86 = 17.64です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.001を6,304個集めた数を入力しましょう。",
        answer: "6.304",
        acceptableAnswers: ["6.3040", "６．３０４"],
        explanation: "0.001を6,304個集めると、0.001 × 6,304 = 6.304です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】9以上10未満の次の小数を、小さい順に並べましょう。",
        choices: ["9.099", "9.9", "9.009", "9.09"],
        orderedChoices: ["9.009", "9.09", "9.099", "9.9"],
        explanation: "位をそろえると、9.009、9.090、9.099、9.900です。小さい順は9.009、9.09、9.099、9.9です。"
        ),
        QuizQuestion(
        question: "1と5/9 + 2/9の答えはどれですか？",
        choices: [
        "7/9",
        "2と7/9",
        "1と6/9",
        "1と7/9"
        ],
        correctAnswerIndex: 3,
        explanation: "分母が同じなので分子を足します。1と5/9 + 2/9 = 1と7/9です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】3 - 11/12の答えを、分母が12の仮分数で入力しましょう。",
        answer: "25/12",
        acceptableAnswers: ["12分の25", "２５／１２", "25／12"],
        explanation: "3を36/12と考えると、36/12 - 11/12 = 25/12です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】分数の計算と、その答えを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "2/13 + 6/13", match: "8/13"),
        QuizMatchingPair(prompt: "11/15 - 4/15", match: "7/15"),
        QuizMatchingPair(prompt: "1 - 5/12", match: "7/12"),
        QuizMatchingPair(prompt: "1と3/10 + 4/10", match: "1と7/10")
        ],
        choices: ["7/12", "8/13", "1と7/10", "7/15"],
        explanation: "2/13 + 6/13は8/13、11/15 - 4/15は7/15、1 - 5/12は7/12、1と3/10 + 4/10は1と7/10です。"
        ),
        QuizQuestion(
        question: "1回転の3/4にあたる角度は何度ですか？",
        choices: [
        "180度",
        "360度",
        "270度",
        "90度"
        ],
        correctAnswerIndex: 2,
        explanation: "1回転は360度です。360 ÷ 4 × 3 = 270なので、1回転の3/4は270度です。"
        ),
        QuizQuestion(
        question: "2本の直線が交わってできる隣り合う角の一方が47度です。もう一方の角は何度ですか？",
        choices: [
        "133度",
        "227度",
        "47度",
        "143度"
        ],
        correctAnswerIndex: 0,
        explanation: "隣り合う2つの角の和は180度です。180 - 47 = 133なので、もう一方の角は133度です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】時計の長い針を2から7まで時計回りに動かしました。文字盤の中心を頂点として動いた角度は ＿＿ 度です。",
        answer: "150",
        acceptableAnswers: ["１５０"],
        explanation: "時計のとなり合う数字の間は30度です。2から7までは5区間なので、30 × 5 = 150度です。"
        ),
        QuizQuestion(
        question: "縦24m、横17mの長方形の面積は何平方メートルですか？",
        choices: [
        "408平方メートル",
        "418平方メートル",
        "401平方メートル",
        "398平方メートル"
        ],
        correctAnswerIndex: 0,
        explanation: "長方形の面積は縦 × 横で求めます。24 × 17 = 408平方メートルです。"
        ),
        QuizQuestion(
        question: "縦20cm、横15cmの長方形の紙のすみから、一辺6cmの正方形を切り取りました。残りの面積は何平方センチメートルですか？",
        choices: [
        "260平方センチメートル",
        "252平方センチメートル",
        "264平方センチメートル",
        "240平方センチメートル"
        ],
        correctAnswerIndex: 2,
        explanation: "長方形の面積は20 × 15 = 300平方センチメートル、切り取った正方形の面積は6 × 6 = 36平方センチメートルです。300 - 36 = 264平方センチメートルです。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】面積が240平方メートル以上の広場は何か所ありますか？",
        answer: "2",
        acceptableAnswers: ["２"],
        referenceTitle: "広場の縦と横の長さ",
        referenceRows: [
        QuizReferenceRow(label: "A広場", value: "縦18m・横13m"),
        QuizReferenceRow(label: "B広場", value: "縦16m・横15m"),
        QuizReferenceRow(label: "C広場", value: "縦22m・横11m"),
        QuizReferenceRow(label: "D広場", value: "縦19m・横12m")
        ],
        explanation: "A広場は234平方メートル、B広場は240平方メートル、C広場は242平方メートル、D広場は228平方メートルです。240平方メートル以上なのはB広場とC広場の2か所です。"
        ),
        QuizQuestion(
        question: "ひし形について、必ず成り立つことはどれですか？",
        choices: [
        "2本の対角線の長さが必ず等しい",
        "4つの角がすべて直角である",
        "向かい合う辺のうち、1組は平行で、もう1組は平行ではない",
        "4つの辺の長さがすべて等しい"
        ],
        correctAnswerIndex: 3,
        explanation: "ひし形は、4つの辺の長さがすべて等しい四角形です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】正方形・長方形・平行四辺形・台形を、それぞれの特徴と正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "4つの辺が等しく、4つの角が直角", match: "正方形"),
        QuizMatchingPair(prompt: "4つの角が直角で、隣り合う辺の長さが異なる", match: "長方形"),
        QuizMatchingPair(prompt: "向かい合う2組の辺が平行で、隣り合う辺の長さが異なり、直角がない", match: "平行四辺形"),
        QuizMatchingPair(prompt: "向かい合う辺のうち、1組は平行で、もう1組は平行ではない", match: "台形")
        ],
        choices: ["台形", "正方形", "平行四辺形", "長方形"],
        explanation: "4辺が等しく4角が直角なら正方形、4角が直角で隣り合う辺の長さが異なるなら長方形、向かい合う2組の辺が平行で直角がないなら平行四辺形、向かい合う辺のうち、1組は平行で、もう1組は平行ではないなら台形です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】周りの長さが68cmのひし形の一辺を求める手順を、正しい順に並べましょう。",
        choices: [
        "68 ÷ 4 = 17を計算する",
        "一辺は17cmと答える",
        "ひし形の4つの辺はすべて同じ長さだと考える",
        "周りの長さ68cmを4等分する式を立てる"
        ],
        orderedChoices: [
        "ひし形の4つの辺はすべて同じ長さだと考える",
        "周りの長さ68cmを4等分する式を立てる",
        "68 ÷ 4 = 17を計算する",
        "一辺は17cmと答える"
        ],
        explanation: "ひし形は4つの辺の長さが等しいので、周りの長さを4等分します。68 ÷ 4 = 17より、一辺は17cmです。"
        ),
        QuizQuestion(
        question: "折れ線グラフの縦の軸で、0から10までが5つの等しい間隔に分けられています。小さい目盛り1つ分はいくつですか？",
        choices: [
        "10",
        "5",
        "2",
        "1"
        ],
        correctAnswerIndex: 2,
        explanation: "0から10までを5つの等しい間隔に分けるので、10 ÷ 5 = 2です。小さい目盛り1つ分は2です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の時刻から乗客が最も大きく減ったとき、何人減りましたか？",
        answer: "29",
        acceptableAnswers: ["２９"],
        referenceTitle: "バスの乗客数の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "8時", value: "45人"),
        QuizReferenceRow(label: "9時", value: "72人"),
        QuizReferenceRow(label: "10時", value: "68人"),
        QuizReferenceRow(label: "11時", value: "90人"),
        QuizReferenceRow(label: "12時", value: "61人")
        ],
        explanation: "9時から10時に4人減り、11時から12時に29人減っています。最も大きく減ったのは12時で、29人です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の時刻から水位が上がった高さの合計は何cmですか？",
        answer: "13",
        acceptableAnswers: ["１３"],
        referenceTitle: "水そうの水位の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "9時", value: "12cm"),
        QuizReferenceRow(label: "10時", value: "15cm"),
        QuizReferenceRow(label: "11時", value: "19cm"),
        QuizReferenceRow(label: "12時", value: "18cm"),
        QuizReferenceRow(label: "13時", value: "24cm")
        ],
        explanation: "9時から10時に3cm、10時から11時に4cm、12時から13時に6cm上がっています。上がった高さの合計は3 + 4 + 6 = 13cmです。"
        ),
        QuizQuestion(
        question: "3,549,800を十万の位までの概数にすると、どれですか？",
        choices: [
        "3,500,000",
        "3,550,000",
        "3,600,000",
        "3,540,000"
        ],
        correctAnswerIndex: 0,
        explanation: "十万の位までの概数にするので、一万の位の4を見ます。4は5未満なので切り捨てて3,500,000です。"
        ),
        QuizQuestion(
        question: "627,400と284,600をそれぞれ一万の位までの概数にして、その差を見積もるとどれですか？",
        choices: [
        "330,000",
        "340,000",
        "350,000",
        "360,000"
        ],
        correctAnswerIndex: 2,
        explanation: "627,400は630,000、284,600は280,000です。630,000 - 280,000 = 350,000なので、見積もりは350,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】千の位までの概数にすると73,000になる整数のうち、最も大きい数を入力しましょう。",
        answer: "73499",
        acceptableAnswers: ["73,499", "７３，４９９", "７３４９９"],
        explanation: "千の位までの概数が73,000になる整数は72,500から73,499までです。そのうち最も大きい数は73,499です。"
        ),
        QuizQuestion(
        question: "5,000万を6個、100万を2個、1万を9個合わせた数はどれですか？",
        choices: [
        "302,900,000",
        "300,290,000",
        "302,090,000",
        "320,090,000"
        ],
        correctAnswerIndex: 2,
        explanation: "5,000万を6個で300,000,000、100万を2個で2,000,000、1万を9個で90,000です。合わせると302,090,000です。"
        ),
        QuizQuestion(
        question: "417,286,305の中で、数字の7が表す数はどれですか？",
        choices: [
        "70,000,000",
        "70,000",
        "700,000",
        "7,000,000"
        ],
        correctAnswerIndex: 3,
        explanation: "7は百万の位にあるので、表す数は7,000,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】99,999,999に1を足した数を、数字で入力しましょう。",
        answer: "100000000",
        acceptableAnswers: ["100,000,000", "１００，０００，０００", "１００００００００"],
        explanation: "99,999,999に1を足すと、100,000,000です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の数を小さい順に並べましょう。",
        choices: ["70,500,080", "70,005,800", "75,000,800", "70,050,800"],
        orderedChoices: ["70,005,800", "70,050,800", "70,500,080", "75,000,800"],
        explanation: "小さい順は、70,005,800、70,050,800、70,500,080、75,000,800です。"
        ),
        QuizQuestion(
        question: "5,472 ÷ 9の答えはどれですか？",
        choices: [
        "618",
        "598",
        "608",
        "606"
        ],
        correctAnswerIndex: 2,
        explanation: "5,472 ÷ 9 = 608です。9 × 608 = 5,472になります。"
        ),
        QuizQuestion(
        question: "4,985 ÷ 23の商とあまりはどれですか？",
        choices: [
        "217あまり4",
        "216あまり17",
        "215あまり20",
        "216あまり12"
        ],
        correctAnswerIndex: 1,
        explanation: "23 × 216 = 4,968で、4,985 - 4,968 = 17です。したがって、商は216、あまりは17です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】7,236 ÷ 12の答えを入力しましょう。",
        answer: "603",
        acceptableAnswers: ["６０３"],
        explanation: "7,236 ÷ 12 = 603です。12 × 603 = 7,236になります。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】3種類の画用紙を24の学級に同じ枚数ずつ分けます。1学級が受け取る画用紙は、3種類合わせて何枚ですか？",
        answer: "139",
        acceptableAnswers: ["１３９"],
        referenceTitle: "種類別の画用紙の枚数",
        referenceRows: [
        QuizReferenceRow(label: "白", value: "1,248枚"),
        QuizReferenceRow(label: "水色", value: "936枚"),
        QuizReferenceRow(label: "黄色", value: "1,152枚")
        ],
        explanation: "画用紙は全部で1,248 + 936 + 1,152 = 3,336枚です。3,336 ÷ 24 = 139なので、1学級が受け取る画用紙は139枚です。"
        ),
        QuizQuestion(
        question: "4.68 + 3.7の答えはどれですか？",
        choices: [
        "8.48",
        "8.28",
        "7.75",
        "8.38"
        ],
        correctAnswerIndex: 3,
        explanation: "3.7を3.70と考えて小数点をそろえると、4.68 + 3.70 = 8.38です。"
        ),
        QuizQuestion(
        question: "20 - 7.46の答えはどれですか？",
        choices: [
        "12.54",
        "12.64",
        "13.54",
        "12.44"
        ],
        correctAnswerIndex: 0,
        explanation: "20を20.00と考えて計算すると、20.00 - 7.46 = 12.54です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.01を458個集めた数を入力しましょう。",
        answer: "4.58",
        acceptableAnswers: ["4.580", "４．５８"],
        explanation: "0.01を458個集めると、0.01 × 458 = 4.58です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の小数を小さい順に並べましょう。",
        choices: ["6.6", "6.006", "6.16", "6.06"],
        orderedChoices: ["6.006", "6.06", "6.16", "6.6"],
        explanation: "位をそろえると、6.006、6.060、6.160、6.600です。小さい順は6.006、6.06、6.16、6.6です。"
        ),
        QuizQuestion(
        question: "次の分数のうち、1に最も近いものはどれですか？",
        choices: [
        "6/11",
        "10/11",
        "9/11",
        "7/11"
        ],
        correctAnswerIndex: 1,
        explanation: "分母が同じ分数では、分子が11に最も近いものが1に最も近くなります。したがって、10/11です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】2と1/6 - 5/6の答えを、分母が6の仮分数で入力しましょう。",
        answer: "8/6",
        acceptableAnswers: ["6分の8", "８／６", "8／6"],
        explanation: "2と1/6を13/6と考えると、13/6 - 5/6 = 8/6です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】分数の計算と、その答えを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "3/10 + 4/10", match: "7/10"),
        QuizMatchingPair(prompt: "9/12 - 5/12", match: "4/12"),
        QuizMatchingPair(prompt: "1 - 3/8", match: "5/8"),
        QuizMatchingPair(prompt: "1と1/5 + 3/5", match: "1と4/5")
        ],
        choices: ["5/8", "1と4/5", "7/10", "4/12"],
        explanation: "3/10 + 4/10は7/10、9/12 - 5/12は4/12、1 - 3/8は5/8、1と1/5 + 3/5は1と4/5です。"
        ),
        QuizQuestion(
        question: "半回転の角度より35度小さい角は何度ですか？",
        choices: [
        "125度",
        "135度",
        "145度",
        "140度"
        ],
        correctAnswerIndex: 2,
        explanation: "半回転は180度です。180 - 35 = 145なので、答えは145度です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】1回転の角度を8等分したとき、1つ分の角度は ＿＿ 度です。",
        answer: "45",
        acceptableAnswers: ["４５"],
        explanation: "1回転は360度です。360 ÷ 8 = 45なので、1つ分の角度は45度です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】角度の表し方と、その角度を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "直角の半分", match: "45度"),
        QuizMatchingPair(prompt: "直角より40度大きい角", match: "130度"),
        QuizMatchingPair(prompt: "半回転の2/3の角", match: "120度"),
        QuizMatchingPair(prompt: "1回転より70度小さい角", match: "290度")
        ],
        choices: ["120度", "290度", "45度", "130度"],
        explanation: "直角の半分は45度、90 + 40 = 130度、180度の2/3は120度、360 - 70 = 290度です。"
        ),
        QuizQuestion(
        question: "縦15cm、横8cmの長方形の面積は何平方センチメートルですか？",
        choices: [
        "112平方センチメートル",
        "120平方センチメートル",
        "130平方センチメートル",
        "126平方センチメートル"
        ],
        correctAnswerIndex: 1,
        explanation: "長方形の面積は縦 × 横で求めます。15 × 8 = 120平方センチメートルです。"
        ),
        QuizQuestion(
        question: "縦18cm、横12cmの長方形から、縦6cm、横5cmの長方形を切り取ります。残りの面積は何平方センチメートルですか？",
        choices: [
        "176平方センチメートル",
        "196平方センチメートル",
        "206平方センチメートル",
        "186平方センチメートル"
        ],
        correctAnswerIndex: 3,
        explanation: "全体の面積は18 × 12 = 216平方センチメートル、切り取る部分は6 × 5 = 30平方センチメートルです。216 - 30 = 186平方センチメートルです。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】面積の合計が500平方メートルをこえる2つの広場の組み合わせのうち、合計が500平方メートルに最も近い組み合わせはどれですか？",
        answer: "B広場とD広場",
        acceptableAnswers: ["BとD", "D広場とB広場", "DとB"],
        referenceTitle: "広場の縦と横の長さ",
        referenceRows: [
        QuizReferenceRow(label: "A広場", value: "縦18m・横14m"),
        QuizReferenceRow(label: "B広場", value: "縦17m・横14m"),
        QuizReferenceRow(label: "C広場", value: "縦25m・横9m"),
        QuizReferenceRow(label: "D広場", value: "縦22m・横12m")
        ],
        explanation: "A広場は252平方メートル、B広場は238平方メートル、C広場は225平方メートル、D広場は264平方メートルです。500平方メートルをこえる組み合わせはA広場とD広場の516平方メートル、B広場とD広場の502平方メートルで、500平方メートルに最も近いのはB広場とD広場です。"
        ),
        QuizQuestion(
        question: "4つの角がすべて直角で、4つの辺の長さがすべて等しい四角形はどれですか？",
        choices: [
        "平行四辺形",
        "長方形",
        "正方形",
        "台形"
        ],
        correctAnswerIndex: 2,
        explanation: "4つの角がすべて直角で、4つの辺の長さがすべて等しい四角形は正方形です。"
        ),
        QuizQuestion(
        question: "平行四辺形の1つの角が73度です。その角と向かい合う角以外の2つの角の和は何度ですか？",
        choices: [
        "206度",
        "146度",
        "180度",
        "214度"
        ],
        correctAnswerIndex: 3,
        explanation: "73度の角と隣り合う角は、180 - 73 = 107度です。求める2つの角はどちらも107度なので、107 + 107 = 214度です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】縦9cm、横14cmの長方形の周りの長さを求める手順を、正しい順に並べましょう。",
        choices: [
        "23 × 2 = 46を計算する",
        "周りの長さは46cmと答える",
        "9 + 14 = 23を計算する",
        "向かい合う辺の長さがそれぞれ等しいことを使う"
        ],
        orderedChoices: [
        "向かい合う辺の長さがそれぞれ等しいことを使う",
        "9 + 14 = 23を計算する",
        "23 × 2 = 46を計算する",
        "周りの長さは46cmと答える"
        ],
        explanation: "長方形では向かい合う辺の長さがそれぞれ等しいので、隣り合う辺を足して2倍します。9 + 14 = 23、23 × 2 = 46より、周りの長さは46cmです。"
        ),
        QuizQuestion(
        question: "折れ線グラフで、数の変わり方が最も大きい区間は、線のどのような部分ですか？",
        choices: [
        "最も左にある部分",
        "傾きが最も急な部分",
        "水平になっている部分",
        "最も右にある部分"
        ],
        correctAnswerIndex: 1,
        explanation: "折れ線グラフでは、線の傾きが急なほど数の変わり方が大きいことを表します。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の日から入館者が増えた人数の合計は何人ですか？",
        answer: "150",
        acceptableAnswers: ["１５０"],
        referenceTitle: "図書館の入館者数の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "月曜日", value: "240人"),
        QuizReferenceRow(label: "火曜日", value: "310人"),
        QuizReferenceRow(label: "水曜日", value: "280人"),
        QuizReferenceRow(label: "木曜日", value: "360人"),
        QuizReferenceRow(label: "金曜日", value: "330人")
        ],
        explanation: "月曜日から火曜日に70人増え、水曜日から木曜日に80人増えています。増えた人数の合計は70 + 80 = 150人です。"
        ),
        QuizQuestion(
        question: "午前8時から午後1時までの気温が、12度、15度、14度、18度、16度、16度でした。折れ線グラフにすると、線が下がる区間はいくつありますか？",
        choices: [
        "1つ",
        "4つ",
        "3つ",
        "2つ"
        ],
        correctAnswerIndex: 3,
        explanation: "15度から14度になる区間と、18度から16度になる区間で線が下がります。したがって、2つです。"
        ),
        QuizQuestion(
        question: "4,764,281を十万の位までの概数にすると、どれですか？",
        choices: [
        "5,000,000",
        "4,700,000",
        "4,760,000",
        "4,800,000"
        ],
        correctAnswerIndex: 3,
        explanation: "十万の位までの概数にするので、一万の位の6を見ます。6は5以上なので切り上げて4,800,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】63,449を千の位までの概数にした数を、数字で入力しましょう。",
        answer: "63000",
        acceptableAnswers: ["63,000", "６３，０００", "６３０００"],
        explanation: "千の位までの概数にするので百の位の4を見ます。4は5未満なので切り捨てて63,000です。"
        ),
        QuizQuestion(
        question: "一万の位までの概数にすると820,000になる整数は、全部で何個ありますか？",
        choices: [
        "10,001個",
        "10,000個",
        "9,000個",
        "9,999個"
        ],
        correctAnswerIndex: 1,
        explanation: "一万の位までの概数にすると820,000になる整数は、815,000から824,999までです。824,999 - 815,000 + 1 = 10,000なので、全部で10,000個あります。"
        ),
        QuizQuestion(
        question: "72,406,913の百万の位の数字が表す数はどれですか？",
        choices: [
        "20,000,000",
        "2,000,000",
        "20,000",
        "200,000"
        ],
        correctAnswerIndex: 1,
        explanation: "百万の位の数字は2なので、表す数は2,000,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】4,000万を2個、100万を3個、1万を6個、100を5個合わせた数を、数字で入力しましょう。",
        answer: "83060500",
        acceptableAnswers: ["83,060,500", "８３，０６０，５００", "８３０６０５００"],
        explanation: "4,000万を2個で80,000,000、100万を3個で3,000,000、1万を6個で60,000、100を5個で500です。合わせると83,060,500です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の4つの大きな数を小さい順に並べましょう。",
        choices: ["8,070,500", "8,700,050", "8,007,500", "8,075,000"],
        orderedChoices: ["8,007,500", "8,070,500", "8,075,000", "8,700,050"],
        explanation: "小さい順は、8,007,500、8,070,500、8,075,000、8,700,050です。"
        ),
        QuizQuestion(
        question: "ある数から1,250,000を引くと38,750,000になりました。ある数はどれですか？",
        choices: [
        "40,100,000",
        "41,000,000",
        "39,900,000",
        "40,000,000"
        ],
        correctAnswerIndex: 3,
        explanation: "38,750,000 + 1,250,000 = 40,000,000なので、ある数は40,000,000です。"
        ),
        QuizQuestion(
        question: "4,536 ÷ 8の答えはどれですか？",
        choices: [
        "567",
        "577",
        "657",
        "557"
        ],
        correctAnswerIndex: 0,
        explanation: "4,536 ÷ 8 = 567です。8 × 567 = 4,536になります。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】6,825 ÷ 7の答えを入力しましょう。",
        answer: "975",
        acceptableAnswers: ["９７５"],
        explanation: "6,825 ÷ 7 = 975です。7 × 975 = 6,825になります。"
        ),
        QuizQuestion(
        question: "3,284 ÷ 15の商とあまりはどれですか？",
        choices: [
        "218あまり4",
        "217あまり14",
        "219あまり9",
        "218あまり14"
        ],
        correctAnswerIndex: 3,
        explanation: "15 × 218 = 3,270で、3,284 - 3,270 = 14です。したがって、商は218、あまりは14です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】3種類の折り紙をそれぞれ9組に同じ枚数ずつ分けます。1組が受け取る折り紙は、3種類合わせて何枚ですか？",
        answer: "280",
        acceptableAnswers: ["２８０"],
        referenceTitle: "種類別の折り紙の枚数",
        referenceRows: [
        QuizReferenceRow(label: "赤", value: "864枚"),
        QuizReferenceRow(label: "青", value: "738枚"),
        QuizReferenceRow(label: "黄", value: "918枚")
        ],
        explanation: "折り紙は全部で864 + 738 + 918 = 2,520枚です。2,520 ÷ 9 = 280なので、1組が受け取るのは280枚です。"
        ),
        QuizQuestion(
        question: "5.73 + 1.9の答えはどれですか？",
        choices: [
        "7.73",
        "6.63",
        "7.63",
        "7.53"
        ],
        correctAnswerIndex: 2,
        explanation: "小数点をそろえて計算すると、5.73 + 1.90 = 7.63です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】12.06 - 7.8の答えを入力しましょう。",
        answer: "4.26",
        acceptableAnswers: ["4.260", "４．２６"],
        explanation: "7.8を7.80と考えて計算すると、12.06 - 7.80 = 4.26です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の小数を大きい順に並べましょう。",
        choices: ["3.405", "3.054", "3.504", "3.45"],
        orderedChoices: ["3.504", "3.45", "3.405", "3.054"],
        explanation: "位をそろえると、3.504、3.450、3.405、3.054です。大きい順は3.504、3.45、3.405、3.054です。"
        ),
        QuizQuestion(
        question: "2.4L入りのジュースが3本あります。そこから1.75L飲むと、残りは何Lですか？",
        choices: [
        "5.55L",
        "5.35L",
        "5.45L",
        "5.65L"
        ],
        correctAnswerIndex: 2,
        explanation: "ジュースは全部で2.4 × 3 = 7.2Lです。7.2 - 1.75 = 5.45Lなので、残りは5.45Lです。"
        ),
        QuizQuestion(
        question: "5/12 + 4/12の答えを、分母を12のまま表すとどれですか？",
        choices: [
        "9/12",
        "10/12",
        "8/12",
        "11/12"
        ],
        correctAnswerIndex: 0,
        explanation: "分母が同じなので分子を足します。5/12 + 4/12 = 9/12です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】2 - 7/9の答えを、分母が9の仮分数で入力しましょう。",
        answer: "11/9",
        acceptableAnswers: ["9分の11", "１１／９", "11／9"],
        explanation: "2を18/9と考えると、18/9 - 7/9 = 11/9です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】分数と、その大きさの説明を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "7/8", match: "1より小さい"),
        QuizMatchingPair(prompt: "8/8", match: "1と等しい"),
        QuizMatchingPair(prompt: "11/8", match: "1より大きく2より小さい"),
        QuizMatchingPair(prompt: "16/8", match: "2と等しい")
        ],
        choices: ["2と等しい", "1より小さい", "1より大きく2より小さい", "1と等しい"],
        explanation: "7/8は1より小さく、8/8は1と等しく、11/8は1より大きく2より小さく、16/8は2と等しい分数です。"
        ),
        QuizQuestion(
        question: "一直線になる2つの角のうち、一方が74度です。もう一方の角は何度ですか？",
        choices: [
        "104度",
        "106度",
        "74度",
        "96度"
        ],
        correctAnswerIndex: 1,
        explanation: "一直線になる2つの角の和は180度です。180 - 74 = 106なので、もう一方の角は106度です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】1回転の角度から145度を引いた角度は ＿＿ 度です。",
        answer: "215",
        acceptableAnswers: ["２１５"],
        explanation: "1回転は360度です。360 - 145 = 215なので、答えは215度です。"
        ),
        QuizQuestion(
        question: "2本の直線が交わってできる向かい合う角の一方が128度です。もう一方の角は何度ですか？",
        choices: [
        "90度",
        "128度",
        "52度",
        "232度"
        ],
        correctAnswerIndex: 1,
        explanation: "2本の直線が交わってできる向かい合う角の大きさは等しいので、もう一方も128度です。"
        ),
        QuizQuestion(
        question: "縦17cm、横9cmの長方形の面積は何平方センチメートルですか？",
        choices: [
        "171平方センチメートル",
        "144平方センチメートル",
        "162平方センチメートル",
        "153平方センチメートル"
        ],
        correctAnswerIndex: 3,
        explanation: "長方形の面積は縦 × 横で求めます。17 × 9 = 153平方センチメートルです。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】周りの長さが44cmの正方形があります。この正方形の面積は ＿＿ 平方センチメートルです。",
        answer: "121",
        acceptableAnswers: ["１２１"],
        explanation: "一辺は44 ÷ 4 = 11cmです。面積は11 × 11 = 121平方センチメートルです。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】AとBの畑の面積の合計は、Cの畑の面積より何平方メートル大きいですか？",
        answer: "125",
        acceptableAnswers: ["１２５"],
        referenceTitle: "畑の縦と横の長さ",
        referenceRows: [
        QuizReferenceRow(label: "Aの畑", value: "縦16m・横8m"),
        QuizReferenceRow(label: "Bの畑", value: "縦12m・横11m"),
        QuizReferenceRow(label: "Cの畑", value: "縦15m・横9m")
        ],
        explanation: "Aは16 × 8 = 128平方メートル、Bは12 × 11 = 132平方メートル、Cは15 × 9 = 135平方メートルです。128 + 132 - 135 = 125なので、125平方メートル大きいです。"
        ),
        QuizQuestion(
        question: "長方形を1本の対角線で切ると、できる2つの三角形にはどのような関係がありますか？",
        choices: [
        "形は同じだが大きさが異なる",
        "必ず正三角形になる",
        "形も大きさも同じ",
        "面積だけが異なる"
        ],
        correctAnswerIndex: 2,
        explanation: "長方形を対角線で切ると、形も大きさも同じ2つの直角三角形ができます。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】四角形の辺の長さと、周りの長さを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "一辺が6cmの正方形", match: "24cm"),
        QuizMatchingPair(prompt: "縦8cm、横5cmの長方形", match: "26cm"),
        QuizMatchingPair(prompt: "一辺が7cmのひし形", match: "28cm"),
        QuizMatchingPair(prompt: "隣り合う辺が10cmと6cmの平行四辺形", match: "32cm")
        ],
        choices: ["28cm", "24cm", "32cm", "26cm"],
        explanation: "正方形は6 × 4 = 24cm、長方形は(8 + 5) × 2 = 26cm、ひし形は7 × 4 = 28cm、平行四辺形は(10 + 6) × 2 = 32cmです。"
        ),
        QuizQuestion(
        question: "平行四辺形の周りの長さは46cmです。一辺が15cmのとき、その辺と隣り合う辺の長さは何cmですか？",
        choices: [
        "8cm",
        "7cm",
        "9cm",
        "10cm"
        ],
        correctAnswerIndex: 0,
        explanation: "向かい合う辺の長さは等しいので、15cmの辺2本で30cmです。残りは46 - 30 = 16cmで、同じ長さの辺が2本あるため、16 ÷ 2 = 8cmです。"
        ),
        QuizQuestion(
        question: "折れ線グラフの線が右下がりになっている部分は、何を表していますか？",
        choices: [
        "数を比べられない",
        "数が減っている",
        "数が増えている",
        "数が変わっていない"
        ],
        correctAnswerIndex: 1,
        explanation: "折れ線グラフの線が右下がりの部分は、数が減っていることを表します。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の時刻から人数が最も大きく増えたとき、何人増えましたか？",
        answer: "60",
        acceptableAnswers: ["６０"],
        referenceTitle: "見学者数の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "9時", value: "120人"),
        QuizReferenceRow(label: "10時", value: "180人"),
        QuizReferenceRow(label: "11時", value: "165人"),
        QuizReferenceRow(label: "12時", value: "210人"),
        QuizReferenceRow(label: "13時", value: "190人")
        ],
        explanation: "9時から10時は60人増え、10時から11時は15人減り、11時から12時は45人増え、12時から13時は20人減っています。最も大きく増えたのは10時で、60人です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の資料を折れ線グラフにするとき、点を左から右へ結ぶ順に並べましょう。",
        choices: ["木曜日・17度", "火曜日・13度", "金曜日・19度", "水曜日・15度"],
        orderedChoices: ["火曜日・13度", "水曜日・15度", "木曜日・17度", "金曜日・19度"],
        explanation: "曜日の順に点を結ぶので、火曜日・13度、水曜日・15度、木曜日・17度、金曜日・19度の順です。"
        ),
        QuizQuestion(
        question: "284,651を一万の位までの概数にすると、どれですか？",
        choices: [
        "280,000",
        "290,000",
        "284,000",
        "285,000"
        ],
        correctAnswerIndex: 0,
        explanation: "一万の位までの概数にするので、千の位の4を見ます。4は5未満なので切り捨てて280,000です。"
        ),
        QuizQuestion(
        question: "千の位までの概数にすると5,000にならない数はどれですか？",
        choices: [
        "5,120",
        "4,501",
        "5,499",
        "4,499"
        ],
        correctAnswerIndex: 3,
        explanation: "千の位までの概数が5,000になる整数は4,500以上5,499以下です。4,499はこの範囲に入らず、千の位までの概数は4,000になります。"
        ),
        QuizQuestion(
        question: "7,842 ÷ 39の答えを、7,842を8,000、39を40とみて見積もると、どれですか？",
        choices: [
        "160",
        "200",
        "20",
        "80"
        ],
        correctAnswerIndex: 1,
        explanation: "8,000 ÷ 40 = 200なので、見積もりは200です。"
        ),
        QuizQuestion(
        question: "93,507,241の中で、5が表す数はどれですか？",
        choices: [
        "5,000,000",
        "50,000",
        "5,000",
        "500,000"
        ],
        correctAnswerIndex: 3,
        explanation: "5は十万の位にあるので、表す数は500,000です。"
        ),
        QuizQuestion(
        question: "2,000万を3個、10万を4個、1万を8個合わせた数はどれですか？",
        choices: [
        "60,480,000",
        "60,408,000",
        "6,480,000",
        "64,800,000"
        ],
        correctAnswerIndex: 0,
        explanation: "2,000万を3個で60,000,000、10万を4個で400,000、1万を8個で80,000です。合わせると60,480,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】38,999,999に1を足した数を、数字で入力しましょう。",
        answer: "39000000",
        acceptableAnswers: ["39,000,000", "３９，０００，０００", "３９００００００"],
        explanation: "38,999,999に1を足すと、39,000,000です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の数を大きい順に並べましょう。",
        choices: ["6,305,000", "6,053,000", "6,530,000", "6,350,000"],
        orderedChoices: ["6,530,000", "6,350,000", "6,305,000", "6,053,000"],
        explanation: "百万の位はすべて6なので、その下の位を順に比べます。大きい順は6,530,000、6,350,000、6,305,000、6,053,000です。"
        ),
        QuizQuestion(
        question: "2,184 ÷ 7の答えはどれですか？",
        choices: [
        "342",
        "312",
        "302",
        "322"
        ],
        correctAnswerIndex: 1,
        explanation: "2,184 ÷ 7 = 312です。7 × 312 = 2,184になります。"
        ),
        QuizQuestion(
        question: "1,457 ÷ 9の商とあまりはどれですか？",
        choices: [
        "160あまり7",
        "160あまり8",
        "161あまり7",
        "161あまり8"
        ],
        correctAnswerIndex: 3,
        explanation: "9 × 161 = 1,449で、1,457 - 1,449 = 8です。したがって、商は161、あまりは8です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】3,276 ÷ 9の答えを入力しましょう。",
        answer: "364",
        acceptableAnswers: ["３６４"],
        explanation: "3,276 ÷ 9 = 364です。9 × 364 = 3,276になります。"
        ),
        QuizQuestion(
        question: "2,503個のビー玉を6個ずつ袋に入れます。6個入りの袋はいくつでき、何個あまりますか？",
        choices: [
        "416袋できて、1個あまる",
        "417袋できて、1個あまる",
        "418袋できて、1個あまる",
        "417袋できて、あまりはない"
        ],
        correctAnswerIndex: 1,
        explanation: "2,503 ÷ 6 = 417あまり1です。したがって、6個入りの袋は417袋でき、1個あまります。"
        ),
        QuizQuestion(
        question: "7.36 + 2.8の答えはどれですか？",
        choices: [
        "10.06",
        "10.96",
        "10.16",
        "9.44"
        ],
        correctAnswerIndex: 2,
        explanation: "小数点をそろえて計算すると、7.36 + 2.80 = 10.16です。"
        ),
        QuizQuestion(
        question: "14.2 - 6.85の答えはどれですか？",
        choices: [
        "7.45",
        "8.25",
        "8.35",
        "7.35"
        ],
        correctAnswerIndex: 3,
        explanation: "14.20 - 6.85 = 7.35です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】0.1を37個集めた数を入力しましょう。",
        answer: "3.7",
        acceptableAnswers: ["3.70", "３．７"],
        explanation: "0.1が10個で1なので、0.1を37個集めた数は3.7です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の小数を小さい順に並べましょう。",
        choices: ["2.9", "2.109", "2.09", "2.19"],
        orderedChoices: ["2.09", "2.109", "2.19", "2.9"],
        explanation: "位をそろえると、2.090、2.109、2.190、2.900となります。小さい順は2.09、2.109、2.19、2.9です。"
        ),
        QuizQuestion(
        question: "4/7 + 2/7の答えはどれですか？",
        choices: [
        "6/14",
        "2/7",
        "8/7",
        "6/7"
        ],
        correctAnswerIndex: 3,
        explanation: "分母が同じなので、分子を足します。4/7 + 2/7 = 6/7です。"
        ),
        QuizQuestion(
        question: "次の分数のうち、1より大きいものはどれですか？",
        choices: [
        "11/10",
        "9/10",
        "7/8",
        "10/11"
        ],
        correctAnswerIndex: 0,
        explanation: "11/10は分子が分母より大きいので、1より大きい分数です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】1と3/8 - 5/8の答えを、分母が8の分数で入力しましょう。",
        answer: "6/8",
        acceptableAnswers: ["8分の6", "６／８", "6／8"],
        explanation: "1と3/8を11/8と考えると、11/8 - 5/8 = 6/8です。"
        ),
        QuizQuestion(
        question: "90度の角を同じ大きさの3つの角に分けました。1つ分の角度はどれですか？",
        choices: [
        "90度",
        "30度",
        "60度",
        "45度"
        ],
        correctAnswerIndex: 1,
        explanation: "90 ÷ 3 = 30なので、1つ分の角度は30度です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】180度から67度を引いた角度は ＿＿ 度です。",
        answer: "113",
        acceptableAnswers: ["１１３"],
        explanation: "180 - 67 = 113なので、角度は113度です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】角度の表し方と、当てはまる角度を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "90度より25度大きい角", match: "115度"),
        QuizMatchingPair(prompt: "180度より40度小さい角", match: "140度"),
        QuizMatchingPair(prompt: "360度の半分の角", match: "180度"),
        QuizMatchingPair(prompt: "直角の2倍より30度小さい角", match: "150度")
        ],
        choices: ["180度", "150度", "115度", "140度"],
        explanation: "90 + 25 = 115、180 - 40 = 140、360 ÷ 2 = 180、90 × 2 - 30 = 150です。"
        ),
        QuizQuestion(
        question: "縦8cm、横18cmの長方形と同じ面積の正方形があります。この正方形の一辺は何cmですか？",
        choices: [
        "12cm",
        "11cm",
        "10cm",
        "9cm"
        ],
        correctAnswerIndex: 0,
        explanation: "長方形の面積は8 × 18 = 144平方センチメートルです。12 × 12 = 144なので、正方形の一辺は12cmです。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】3平方メートルは ＿＿ 平方センチメートルです。",
        answer: "30000",
        acceptableAnswers: ["30,000", "３０，０００", "３００００"],
        explanation: "1平方メートルは10,000平方センチメートルです。10,000 × 3 = 30,000平方センチメートルです。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】最も面積が大きい花だんと最も面積が小さい花だんでは、面積が何平方メートル違いますか？",
        answer: "16",
        acceptableAnswers: ["１６"],
        referenceTitle: "花だんのたてと横の長さ",
        referenceRows: [
        QuizReferenceRow(label: "A花だん", value: "たて12m・横9m"),
        QuizReferenceRow(label: "B花だん", value: "たて15m・横7m"),
        QuizReferenceRow(label: "C花だん", value: "たて11m・横11m")
        ],
        explanation: "A花だんは108平方メートル、B花だんは105平方メートル、C花だんは121平方メートルです。最大の121から最小の105を引くと、16平方メートルです。"
        ),
        QuizQuestion(
        question: "長方形について、必ず成り立つことはどれですか？",
        choices: [
        "2本の対角線は必ず直角に交わる",
        "向かい合う辺の長さがそれぞれ等しい",
        "4つの辺の長さがすべて等しい",
        "向かい合う辺はどれも平行ではない"
        ],
        correctAnswerIndex: 1,
        explanation: "長方形では、向かい合う辺の長さがそれぞれ等しく、向かい合う辺はそれぞれ平行です。"
        ),
        QuizQuestion(
        question: "平行四辺形の1つの角が68度です。その角と隣り合う角は何度ですか？",
        choices: [
        "90度",
        "122度",
        "112度",
        "68度"
        ],
        correctAnswerIndex: 2,
        explanation: "平行四辺形の隣り合う2つの角の和は180度です。180 - 68 = 112なので、隣り合う角は112度です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】四角形の特徴と、その名前を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "4つの辺が同じ長さで、4つの角が直角", match: "正方形"),
        QuizMatchingPair(prompt: "4つの角が直角で、隣り合う辺の長さが異なる", match: "長方形"),
        QuizMatchingPair(prompt: "4つの辺が同じ長さで、直角がない", match: "ひし形"),
        QuizMatchingPair(prompt: "向かい合う辺がそれぞれ平行で、隣り合う辺の長さが異なり、直角がない", match: "平行四辺形")
        ],
        choices: ["ひし形", "平行四辺形", "正方形", "長方形"],
        explanation: "4辺が同じ長さで4角が直角なら正方形、4角が直角で隣り合う辺の長さが異なるなら長方形、4辺が同じ長さで直角がないならひし形、向かい合う辺が平行で隣り合う辺の長さが異なり直角がないなら平行四辺形です。"
        ),
        QuizQuestion(
        question: "月曜日14度、火曜日18度、水曜日16度、木曜日16度、金曜日20度の気温を折れ線グラフにします。線が水平になるのは、どの曜日とどの曜日の間ですか？",
        choices: [
        "火曜日と水曜日の間",
        "月曜日と火曜日の間",
        "水曜日と木曜日の間",
        "木曜日と金曜日の間"
        ],
        correctAnswerIndex: 2,
        explanation: "水曜日と木曜日はどちらも16度なので、その間の線は水平になります。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の時刻から気温が最も大きく下がったのは何時ですか？",
        answer: "13",
        acceptableAnswers: ["１３"],
        referenceTitle: "ある日の気温の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "9時", value: "18度"),
        QuizReferenceRow(label: "10時", value: "22度"),
        QuizReferenceRow(label: "11時", value: "21度"),
        QuizReferenceRow(label: "12時", value: "25度"),
        QuizReferenceRow(label: "13時", value: "19度")
        ],
        explanation: "12時の25度から13時の19度へ6度下がっています。これが最も大きな下がり方なので、答えは13時です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】午前8時から正午までに上がった温度と、正午から午後4時までに下がった温度を比べると、上がった温度の方が何度大きいですか？",
        answer: "2",
        acceptableAnswers: ["２"],
        referenceTitle: "気温の変化（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "午前8時", value: "6度"),
        QuizReferenceRow(label: "午前10時", value: "11度"),
        QuizReferenceRow(label: "正午", value: "15度"),
        QuizReferenceRow(label: "午後2時", value: "13度"),
        QuizReferenceRow(label: "午後4時", value: "8度")
        ],
        explanation: "午前8時から正午までは15 - 6 = 9度上がり、正午から午後4時までは15 - 8 = 7度下がっています。9 - 7 = 2なので、上がった温度の方が2度大きいです。"
        ),
        QuizQuestion(
        question: "736,482を一万の位までの概数にすると、どれですか？",
        choices: [
        "736,000",
        "740,000",
        "736,500",
        "730,000"
        ],
        correctAnswerIndex: 1,
        explanation: "一万の位までの概数にするので、千の位の6を見ます。6は5以上なので切り上げて740,000です。"
        ),
        QuizQuestion(
        question: "百の位までの概数にすると5,300になる数はどれですか？",
        choices: [
        "5,349",
        "5,249",
        "5,401",
        "5,350"
        ],
        correctAnswerIndex: 0,
        explanation: "百の位までの概数が5,300になる整数は、5,250以上5,349以下です。選択肢では5,349だけが当てはまります。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】67,492を千の位までの概数にする手順を、正しい順に並べましょう。",
        choices: [
        "千の位より下の数字を0にする",
        "百の位の数字4を見る",
        "67,000とする",
        "4は5未満なので切り捨てる"
        ],
        orderedChoices: [
        "百の位の数字4を見る",
        "4は5未満なので切り捨てる",
        "千の位より下の数字を0にする",
        "67,000とする"
        ],
        explanation: "千の位までの概数にするので百の位を見ます。百の位は4で5未満だから切り捨て、千の位より下を0にして67,000とします。"
        ),
        QuizQuestion(
        question: "6,482,315の十万の位の数字が表す数はどれですか？",
        choices: [
        "400,000",
        "4,000,000",
        "4,000",
        "40,000"
        ],
        correctAnswerIndex: 0,
        explanation: "十万の位の数字は4なので、表す数は400,000です。"
        ),
        QuizQuestion(
        question: "1,176枚の色紙を7人に同じ数ずつ分けます。1人分は何枚ですか？",
        choices: [
        "158枚",
        "176枚",
        "168枚",
        "186枚"
        ],
        correctAnswerIndex: 2,
        explanation: "1,176 ÷ 7 = 168なので、1人分は168枚です。"
        ),
        QuizQuestion(
        question: "水そうに6.4Lの水が入っています。さらに3.8L入れると、全部で何Lになりますか？",
        choices: [
        "10.3L",
        "10.2L",
        "9.2L",
        "10.1L"
        ],
        correctAnswerIndex: 1,
        explanation: "6.4 + 3.8 = 10.2なので、全部で10.2Lです。"
        ),
        QuizQuestion(
        question: "長さが7/9mのテープから2/9mを切り取りました。残りは何mですか？",
        choices: [
        "4/9m",
        "7/9m",
        "5/9m",
        "6/9m"
        ],
        correctAnswerIndex: 2,
        explanation: "分母が同じなので分子を引きます。7/9 - 2/9 = 5/9なので、残りは5/9mです。"
        ),
        QuizQuestion(
        question: "時計の長い針が12、短い針が3を指しているとき、2本の針がつくる小さい方の角は何度ですか？",
        choices: [
        "90度",
        "60度",
        "180度",
        "120度"
        ],
        correctAnswerIndex: 0,
        explanation: "時計の文字盤で12から3までは直角なので、小さい方の角は90度です。"
        ),
        QuizQuestion(
        question: "一辺が13cmの正方形のタイルがあります。このタイルの面積は何平方センチメートルですか？",
        choices: [
        "169平方センチメートル",
        "156平方センチメートル",
        "196平方センチメートル",
        "176平方センチメートル"
        ],
        correctAnswerIndex: 0,
        explanation: "正方形の面積は一辺 × 一辺で求めます。13 × 13 = 169平方センチメートルです。"
        ),
        QuizQuestion(
        question: "向かい合う2組の辺がそれぞれ平行な四角形を何といいますか？",
        choices: [
        "台形",
        "三角形",
        "五角形",
        "平行四辺形"
        ],
        correctAnswerIndex: 3,
        explanation: "向かい合う2組の辺がそれぞれ平行な四角形を平行四辺形といいます。"
        ),
        QuizQuestion(
        question: "折れ線グラフで表すのに最も適しているものはどれですか？",
        choices: [
        "本の種類ごとの冊数",
        "色別の鉛筆の本数",
        "好きな給食の人数",
        "1日の気温の変化"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「1日の気温の変化」です。折れ線グラフは、時間とともに変わる様子を表すのに適しています。"
        ),
        QuizQuestion(
        question: "48,726を千の位までの概数にすると、どれですか？",
        choices: [
        "48,000",
        "49,000",
        "50,000",
        "48,700"
        ],
        correctAnswerIndex: 1,
        explanation: "千の位までの概数にするので百の位を見ます。百の位は7だから切り上げて49,000です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】700万と4万と6を合わせた数を、数字で答えましょう。",
        answer: "7040006",
        acceptableAnswers: ["7,040,006", "７，０４０，００６", "７０４０００６"],
        explanation: "700万は7,000,000、4万は40,000なので、合わせた数は7,040,006です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】735 ÷ 5 の答えを入力しましょう。",
        answer: "147",
        acceptableAnswers: ["１４７"],
        explanation: "735 ÷ 5 = 147です。5 × 147 = 735になります。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】8.4 - 3.9 の答えを入力しましょう。",
        answer: "4.5",
        acceptableAnswers: ["４．５"],
        explanation: "小数点をそろえて引くと、8.4 - 3.9 = 4.5です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】1 - 3/10 の答えを分数で入力しましょう。",
        answer: "7/10",
        acceptableAnswers: ["10分の7", "７／１０", "7／10"],
        explanation: "1を10/10と考えると、10/10 - 3/10 = 7/10です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】1回転の角度は ＿＿ 度です。",
        answer: "360",
        acceptableAnswers: ["３６０"],
        explanation: "1回転の角度は360度です。"
        ),
        QuizQuestion.fillInBlank(
        question: "【穴うめ】縦14cm、横6cmの長方形の面積は ＿＿ 平方センチメートルです。",
        answer: "84",
        acceptableAnswers: ["８４"],
        explanation: "長方形の面積は縦 × 横で求めます。14 × 6 = 84平方センチメートルです。"
        ),
        QuizQuestion(
        question: "向かい合う辺のうち、1組は平行で、もう1組は平行ではない四角形はどれですか？",
        choices: [
        "ひし形",
        "正方形",
        "台形",
        "平行四辺形"
        ],
        correctAnswerIndex: 2,
        explanation: "向かい合う辺のうち、1組は平行で、もう1組は平行ではない四角形は台形です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】前の日からの最高気温の上がり方が最も大きいのは、何曜日ですか？",
        answer: "木曜日",
        acceptableAnswers: ["木"],
        referenceTitle: "1週間の最高気温（折れ線グラフのもとになるデータ）",
        referenceRows: [
        QuizReferenceRow(label: "月曜日", value: "18度"),
        QuizReferenceRow(label: "火曜日", value: "21度"),
        QuizReferenceRow(label: "水曜日", value: "20度"),
        QuizReferenceRow(label: "木曜日", value: "25度"),
        QuizReferenceRow(label: "金曜日", value: "23度")
        ],
        explanation: "水曜日の20度から木曜日の25度へ5度上がっており、上がり方が最も大きいのは木曜日です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】3つの会場の人数をそれぞれ千の位までの概数にして合計すると、何人ですか？",
        answer: "80000",
        acceptableAnswers: ["80,000", "８０，０００", "８００００"],
        referenceTitle: "会場ごとの来場者数",
        referenceRows: [
        QuizReferenceRow(label: "A会場", value: "24,680人"),
        QuizReferenceRow(label: "B会場", value: "35,420人"),
        QuizReferenceRow(label: "C会場", value: "19,950人")
        ],
        explanation: "24,680人は25,000人、35,420人は35,000人、19,950人は20,000人です。合計は80,000人です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の数を小さい順に並べましょう。",
        choices: ["4,500,000", "405,000", "4,050,000", "450,000"],
        orderedChoices: ["405,000", "450,000", "4,050,000", "4,500,000"],
        explanation: "小さい順は、405,000、450,000、4,050,000、4,500,000です。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】936 ÷ 6を、936を900と36に分けて計算するときの手順を正しい順に並べましょう。",
        choices: [
        "36 ÷ 6 = 6を計算する",
        "150 + 6 = 156を計算する",
        "936を900と36に分ける",
        "900 ÷ 6 = 150を計算する"
        ],
        orderedChoices: [
        "936を900と36に分ける",
        "900 ÷ 6 = 150を計算する",
        "36 ÷ 6 = 6を計算する",
        "150 + 6 = 156を計算する"
        ],
        explanation: "936を900と36に分け、900 ÷ 6 = 150、36 ÷ 6 = 6を計算し、最後に150 + 6 = 156とします。"
        ),
        QuizQuestion.reorder(
        question: "【並べ替え】次の小数を小さい順に並べましょう。",
        choices: ["0.705", "0.507", "0.75", "0.57"],
        orderedChoices: ["0.507", "0.57", "0.705", "0.75"],
        explanation: "小数点以下の位をそろえて比べると、0.507、0.57、0.705、0.75の順です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】帯分数と、それを直した仮分数を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1と2/5", match: "7/5"),
        QuizMatchingPair(prompt: "2と1/3", match: "7/3"),
        QuizMatchingPair(prompt: "1と3/4", match: "7/4"),
        QuizMatchingPair(prompt: "3と1/2", match: "7/2")
        ],
        choices: ["7/4", "7/2", "7/5", "7/3"],
        explanation: "1と2/5は7/5、2と1/3は7/3、1と3/4は7/4、3と1/2は7/2です。"
        ),
        QuizQuestion.matching(
        question: "【組み合わせ】角の大きさの説明と、当てはまる角度を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "直角より小さい角", match: "35度"),
        QuizMatchingPair(prompt: "直角", match: "90度"),
        QuizMatchingPair(prompt: "直角より大きく、180度より小さい角", match: "125度"),
        QuizMatchingPair(prompt: "一直線になる角", match: "180度")
        ],
        choices: ["125度", "35度", "180度", "90度"],
        explanation: "35度は直角より小さい角、90度は直角、125度は直角より大きく、180度より小さい角、180度は一直線になる角です。"
        ),
        QuizQuestion(
        question: "縦10cm、横14cmの長方形から、縦4cm、横3cmの長方形を切り取った残りの面積は何平方センチメートルですか？",
        choices: [
        "132平方センチメートル",
        "126平方センチメートル",
        "128平方センチメートル",
        "124平方センチメートル"
        ],
        correctAnswerIndex: 2,
        explanation: "全体は10 × 14 = 140平方センチメートル、切り取る部分は4 × 3 = 12平方センチメートルです。140 - 12 = 128平方センチメートルです。"
        ),
        QuizQuestion(
        question: "4つの辺の長さがすべて等しく、4つの角が直角ではない四角形の名前として、最も適切なものはどれですか？",
        choices: [
        "ひし形",
        "長方形",
        "平行四辺形",
        "台形"
        ],
        correctAnswerIndex: 0,
        explanation: "4つの辺の長さがすべて等しく、4つの角が直角ではない四角形はひし形です。"
        ),
        QuizQuestion(
        question: "月曜日12度、火曜日15度、水曜日14度、木曜日19度でした。前の日から気温が最も上がったのは何曜日ですか？",
        choices: [
        "月曜日",
        "水曜日",
        "火曜日",
        "木曜日"
        ],
        correctAnswerIndex: 3,
        explanation: "火曜日は3度上がり、水曜日は1度下がり、木曜日は5度上がっています。最も上がったのは木曜日です。"
        ),
        QuizQuestion(
        question: "3,846 + 5,217の答えを、2つの数をそれぞれ千の位までの概数にして見積もると、どれですか？",
        choices: [
        "8,000",
        "9,000",
        "11,000",
        "10,000"
        ],
        correctAnswerIndex: 1,
        explanation: "3,846は4,000、5,217は5,000とみるので、見積もりは4,000 + 5,000 = 9,000です。"
        ),
        QuizQuestion.dataReading(
        question: "【資料の読み取り】東地区の人数は西地区の人数より何人多いですか？",
        answer: "1234568",
        acceptableAnswers: ["1,234,568", "１，２３４，５６８", "１２３４５６８"],
        referenceTitle: "地区別の登録者数",
        referenceRows: [
        QuizReferenceRow(label: "東地区", value: "8,765,432人"),
        QuizReferenceRow(label: "西地区", value: "7,530,864人")
        ],
        explanation: "8,765,432 - 7,530,864 = 1,234,568なので、東地区は西地区より1,234,568人多いです。"
        ),
        QuizQuestion(
        question: "1箱に24本ずつ鉛筆を入れます。1,258本の鉛筆をすべて入れるには、箱は少なくとも何箱必要ですか？",
        choices: [
        "52箱",
        "54箱",
        "53箱",
        "51箱"
        ],
        correctAnswerIndex: 2,
        explanation: "1,258 ÷ 24 = 52あまり10です。52箱では10本入らないので、少なくとも53箱必要です。"
        ),
        QuizQuestion(
        question: "12.5mのリボンから3.75mと4.8mを使いました。残りは何mですか？",
        choices: [
        "3.95m",
        "4.05m",
        "4.15m",
        "3.85m"
        ],
        correctAnswerIndex: 0,
        explanation: "使った長さは3.75 + 4.8 = 8.55mです。12.5 - 8.55 = 3.95mなので、残りは3.95mです。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .sansu4, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu4ListView(isPresenting: .constant(false))
    }
}
