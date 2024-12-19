//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo1ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『雲』",
            choices: [
                "くも",
                "うみ",
                "ほし",
                "やま"
            ],
            correctAnswerIndex: 0,
            explanation: "『雲』の正しい読みは「くも」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『山』",
            choices: [
                "かわ",
                "もり",
                "やま",
                "うみ"
            ],
            correctAnswerIndex: 2,
            explanation: "『山』の正しい読みは「やま」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『風』",
            choices: [
                "から",
                "かぜ",
                "そら",
                "はな"
            ],
            correctAnswerIndex: 1,
            explanation: "『風』の正しい読みは「かぜ」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『石』",
            choices: [
                "いし",
                "ほし",
                "き",
                "かわ"
            ],
            correctAnswerIndex: 0,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『空』",
            choices: [
                "おり",
                "こん",
                "そら",
                "ほし"
            ],
            correctAnswerIndex: 2,
            explanation: "『空』の正しい読みは「そら」です。"
        ),
        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『山＿＿登ります』",
            choices: [
                "が",
                "た",
                "と",
                "を"
            ],
            correctAnswerIndex: 3,
            explanation: "『山を登ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『星』",
            choices: [
                "ひし",
                "ほし",
                "はな",
                "ほう"
            ],
            correctAnswerIndex: 1,
            explanation: "『星』の正しい読みは「ほし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『川＿＿泳ぎます』",
            choices: [
                "で",
                "ぱ",
                "に",
                "が"
            ],
            correctAnswerIndex: 0,
            explanation: "『川で泳ぎます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『花』",
            choices: [
                "はな",
                "かき",
                "は",
                "なし"
            ],
            correctAnswerIndex: 0,
            explanation: "『花』の正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『友だち＿＿遊びます』",
            choices: [
                "と",
                "に",
                "を",
                "へ"
            ],
            correctAnswerIndex: 0,
            explanation: "『友だちと遊びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『月』",
            choices: [
                "かつ",
                "つき",
                "ひ",
                "ほし"
            ],
            correctAnswerIndex: 1,
            explanation: "『月』の正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『鳥＿＿飛んでいます』",
            choices: [
                "に",
                "が",
                "を",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『鳥が飛んでいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『川』",
            choices: [
                "かわ",
                "か",
                "かわら",
                "せん"
            ],
            correctAnswerIndex: 0,
            explanation: "『川』の正しい読みは「かわ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『空＿＿見上げます』",
            choices: [
                "が",
                "を",
                "に",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『空を見上げます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『石』",
            choices: [
                "らん",
                "いし",
                "こいし",
                "もり"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『犬＿＿散歩します』",
            choices: [
                "に",
                "を",
                "で",
                "が"
            ],
            correctAnswerIndex: 1,
            explanation: "『犬を散歩します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『木』",
            choices: [
                "き",
                "くう",
                "こ",
                "はやし"
            ],
            correctAnswerIndex: 0,
            explanation: "『木』の正しい読みは「き」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『ねこ＿＿います』",
            choices: [
                "に",
                "を",
                "が",
                "へ"
            ],
            correctAnswerIndex: 2,
            explanation: "『ねこがいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『火』",
            choices: [
                "あか",
                "き",
                "ひ",
                "ほ"
            ],
            correctAnswerIndex: 2,
            explanation: "『火』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『本＿＿読みます』",
            choices: [
                "に",
                "を",
                "が",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『本を読みます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『月』",
            choices: [
                "ほし",
                "つき",
                "ひ",
                "ほ"
            ],
            correctAnswerIndex: 1,
            explanation: "『月』の正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『友だち＿＿話します』",
            choices: [
                "を",
                "な",
                "か",
                "と"
            ],
            correctAnswerIndex: 3,
            explanation: "『友だちと話します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『花』",
            choices: [
                "はな",
                "かき",
                "ばな",
                "は"
            ],
            correctAnswerIndex: 0,
            explanation: "『花』の正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『学校＿＿行きます』",
            choices: [
                "を",
                "で",
                "に",
                "が"
            ],
            correctAnswerIndex: 2,
            explanation: "『学校に行きます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『風』",
            choices: [
                "はやし",
                "おり",
                "かぜ",
                "ふ"
            ],
            correctAnswerIndex: 2,
            explanation: "『風』の正しい読みは「かぜ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『花＿＿咲いています』",
            choices: [
                "が",
                "を",
                "で",
                "へ"
            ],
            correctAnswerIndex: 0,
            explanation: "『花が咲いています』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『空』",
            choices: [
                "そら",
                "けい",
                "さん",
                "あお"
            ],
            correctAnswerIndex: 0,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『家＿＿帰ります』",
            choices: [
                "を",
                "が",
                "で",
                "へ"
            ],
            correctAnswerIndex: 3,
            explanation: "『家へ帰ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『木』",
            choices: [
                "かき",
                "き",
                "はやし",
                "こ"
            ],
            correctAnswerIndex: 1,
            explanation: "『木』の正しい読みは「き」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『山＿＿登ります』",
            choices: [
                "や",
                "は",
                "が",
                "に"
            ],
            correctAnswerIndex: 3,
            explanation: "『山に登ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『雨』",
            choices: [
                "はれ",
                "かん",
                "あめ",
                "あお"
            ],
            correctAnswerIndex: 2,
            explanation: "『雨』の正しい読みは「あめ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『空＿＿飛びます』",
            choices: [
                "を",
                "が",
                "ぽ",
                "ぬ"
            ],
            correctAnswerIndex: 0,
            explanation: "『空を飛びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『火』",
            choices: [
                "ひ",
                "な",
                "ほ",
                "あか"
            ],
            correctAnswerIndex: 0,
            explanation: "『火』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『川＿＿泳ぎます』",
            choices: [
                "は",
                "に",
                "で",
                "な"
            ],
            correctAnswerIndex: 2,
            explanation: "『川で泳ぎます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『石』",
            choices: [
                "こいし",
                "いし",
                "かん",
                "いわ"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『犬＿＿走ります』",
            choices: [
                "を",
                "が",
                "で",
                "に"
            ],
            correctAnswerIndex: 1,
            explanation: "『犬が走ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『山』",
            choices: [
                "やま",
                "かん",
                "もり",
                "かわ"
            ],
            correctAnswerIndex: 0,
            explanation: "『山』の正しい読みは「やま」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『お母さん＿＿話します』",
            choices: [
                "と",
                "を",
                "が",
                "じ"
            ],
            correctAnswerIndex: 0,
            explanation: "『お母さんと話します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『空』",
            choices: [
                "たま",
                "みず",
                "そら",
                "あお"
            ],
            correctAnswerIndex: 2,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『先生＿＿会います』",
            choices: [
                "ぽ",
                "を",
                "に",
                "で"
            ],
            correctAnswerIndex: 2,
            explanation: "『先生に会います』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『月』",
            choices: [
                "つき",
                "ほし",
                "ひ",
                "かげ"
            ],
            correctAnswerIndex: 0,
            explanation: "『月』の正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『ねこ＿＿います』",
            choices: [
                "に",
                "が",
                "を",
                "へ"
            ],
            correctAnswerIndex: 1,
            explanation: "『ねこがいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『木』",
            choices: [
                "き",
                "こ",
                "りん",
                "はやし"
            ],
            correctAnswerIndex: 0,
            explanation: "『木』の正しい読みは「き」です。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo1, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo1ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo1ListView(isPresenting: .constant(false))
    }
}

