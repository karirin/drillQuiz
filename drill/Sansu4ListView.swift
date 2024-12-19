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
            correctAnswerIndex: 0,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
            explanation: "90円×5個で450円です。"
        ),
        QuizQuestion(
            question: "次の中で、3/8より大きい分数はどれですか？",
            choices: [
                "2/8",
                "4/8",
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
                "4/8",
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
                "4/7",
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
                "2/5"
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
            correctAnswerIndex: 3,
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
                "3/4",
                "1/2",
                "全て"
            ],
            correctAnswerIndex: 3,
            explanation: "全ての選択肢は5/6より小さい分数です。"
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
                "5/6"
            ],
            correctAnswerIndex: 2,
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
                "1/2",
                "3/4",
                "全て"
            ],
            correctAnswerIndex: 3,
            explanation: "全ての選択肢は7/8より小さい分数です。"
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
            correctAnswerIndex: 2,
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
