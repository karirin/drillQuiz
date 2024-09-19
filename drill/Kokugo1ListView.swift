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
            question: "次のひらがなの読みはどれですか？『さくら』",
            choices: [
                "さくは",
                "さくら",
                "さきら",
                "さこら"
            ],
            correctAnswerIndex: 1,
            explanation: "『さくら』は桜と書き、正しい読みは「さくら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『山＿＿登ります』",
            choices: [
                "が",
                "に",
                "と",
                "を"
            ],
            correctAnswerIndex: 1,
            explanation: "『山に登ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『星』",
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
            question: "次のひらがなの読みはどれですか？『かぜ』",
            choices: [
                "かせ",
                "かぜ",
                "かた",
                "かや"
            ],
            correctAnswerIndex: 1,
            explanation: "『かぜ』は風と書き、正しい読みは「かぜ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『川＿＿泳ぎます』",
            choices: [
                "で",
                "を",
                "に",
                "が"
            ],
            correctAnswerIndex: 0,
            explanation: "『川で泳ぎます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『花』",
            choices: [
                "はな",
                "か",
                "は",
                "ばな"
            ],
            correctAnswerIndex: 0,
            explanation: "『花』の正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『おおきい』",
            choices: [
                "おおき",
                "おおきい",
                "おおし",
                "おおけい"
            ],
            correctAnswerIndex: 1,
            explanation: "『おおきい』は「大きい」と書き、正しい読みは「おおきい」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『友だち＿＿遊びます』",
            choices: [
                "と",
                "に",
                "を",
                "が"
            ],
            correctAnswerIndex: 0,
            explanation: "『友だちと遊びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『月』",
            choices: [
                "げつ",
                "つき",
                "ひ",
                "ほし"
            ],
            correctAnswerIndex: 1,
            explanation: "『月』の正しい読みは「つき」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ふね』",
            choices: [
                "ふみ",
                "ふね",
                "ふた",
                "ふり"
            ],
            correctAnswerIndex: 1,
            explanation: "『ふね』は船と書き、正しい読みは「ふね」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『鳥＿＿飛んでいます』",
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
            question: "次の漢字の読みはどれですか？『川』",
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
            question: "次のひらがなの読みはどれですか？『みち』",
            choices: [
                "みし",
                "みち",
                "みと",
                "みり"
            ],
            correctAnswerIndex: 1,
            explanation: "『みち』は道と書き、正しい読みは「みち」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『空＿＿見上げます』",
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
            question: "次の漢字の読みはどれですか？『石』",
            choices: [
                "せき",
                "いし",
                "こいし",
                "もり"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『つくえ』",
            choices: [
                "つくら",
                "つくえ",
                "つかえ",
                "つけ"
            ],
            correctAnswerIndex: 1,
            explanation: "『つくえ』は机と書き、正しい読みは「つくえ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『犬＿＿散歩します』",
            choices: [
                "と",
                "を",
                "で",
                "が"
            ],
            correctAnswerIndex: 1,
            explanation: "『犬を散歩します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『木』",
            choices: [
                "き",
                "もく",
                "こ",
                "はやし"
            ],
            correctAnswerIndex: 0,
            explanation: "『木』の正しい読みは「き」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『たまご』",
            choices: [
                "たまこ",
                "たまご",
                "たまさ",
                "たまき"
            ],
            correctAnswerIndex: 1,
            explanation: "『たまご』は卵と書き、正しい読みは「たまご」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『ねこ＿＿います』",
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
            question: "次の漢字の読みはどれですか？『火』",
            choices: [
                "あか",
                "か",
                "ひ",
                "ほ"
            ],
            correctAnswerIndex: 2,
            explanation: "『火』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ひる』",
            choices: [
                "ひる",
                "はる",
                "ほる",
                "ふる"
            ],
            correctAnswerIndex: 0,
            explanation: "『ひる』は昼と書き、正しい読みは「ひる」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『本＿＿読みます』",
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
            question: "次の漢字の読みはどれですか？『月』",
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
            question: "次のひらがなの読みはどれですか？『そら』",
            choices: [
                "さら",
                "そら",
                "しら",
                "そり"
            ],
            correctAnswerIndex: 1,
            explanation: "『そら』は空と書き、正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『友だち＿＿話します』",
            choices: [
                "を",
                "が",
                "に",
                "と"
            ],
            correctAnswerIndex: 3,
            explanation: "『友だちと話します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『花』",
            choices: [
                "はな",
                "か",
                "ばな",
                "は"
            ],
            correctAnswerIndex: 0,
            explanation: "『花』の正しい読みは「はな」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ほし』",
            choices: [
                "ほし",
                "はし",
                "ほしみ",
                "ほい"
            ],
            correctAnswerIndex: 0,
            explanation: "『ほし』は星と書き、正しい読みは「ほし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『学校＿＿行きます』",
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
            question: "次の漢字の読みはどれですか？『風』",
            choices: [
                "はやし",
                "ふう",
                "かぜ",
                "ふ"
            ],
            correctAnswerIndex: 2,
            explanation: "『風』の正しい読みは「かぜ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『くも』",
            choices: [
                "こも",
                "くも",
                "くぼ",
                "くい"
            ],
            correctAnswerIndex: 1,
            explanation: "『くも』は「雲」と書き、正しい読みは「くも」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『花＿＿咲いています』",
            choices: [
                "が",
                "を",
                "で",
                "に"
            ],
            correctAnswerIndex: 0,
            explanation: "『花が咲いています』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『空』",
            choices: [
                "そら",
                "くう",
                "から",
                "あお"
            ],
            correctAnswerIndex: 0,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『みず』",
            choices: [
                "みず",
                "みせ",
                "みす",
                "むず"
            ],
            correctAnswerIndex: 0,
            explanation: "『みず』は「水」と書き、正しい読みは「みず」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『家＿＿帰ります』",
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
            question: "次の漢字の読みはどれですか？『木』",
            choices: [
                "もく",
                "き",
                "はやし",
                "こ"
            ],
            correctAnswerIndex: 1,
            explanation: "『木』の正しい読みは「き」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『さかな』",
            choices: [
                "さかい",
                "さかな",
                "さかま",
                "さかなみ"
            ],
            correctAnswerIndex: 1,
            explanation: "『さかな』は魚と書き、正しい読みは「さかな」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『山＿＿登ります』",
            choices: [
                "を",
                "で",
                "が",
                "に"
            ],
            correctAnswerIndex: 3,
            explanation: "『山に登ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『雨』",
            choices: [
                "はれ",
                "あま",
                "あめ",
                "あお"
            ],
            correctAnswerIndex: 2,
            explanation: "『雨』の正しい読みは「あめ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『はし』",
            choices: [
                "はし",
                "はじ",
                "はた",
                "はく"
            ],
            correctAnswerIndex: 0,
            explanation: "『はし』は「橋」と書き、正しい読みは「はし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『空＿＿飛びます』",
            choices: [
                "を",
                "が",
                "に",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『空が飛びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『火』",
            choices: [
                "ひ",
                "か",
                "ほ",
                "あか"
            ],
            correctAnswerIndex: 0,
            explanation: "『火』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『つち』",
            choices: [
                "つつ",
                "つち",
                "つつみ",
                "つけ"
            ],
            correctAnswerIndex: 1,
            explanation: "『つち』は「土」と書き、正しい読みは「つち」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『川＿＿泳ぎます』",
            choices: [
                "を",
                "に",
                "で",
                "へ"
            ],
            correctAnswerIndex: 2,
            explanation: "『川で泳ぎます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『石』",
            choices: [
                "こいし",
                "いし",
                "せき",
                "もり"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『つき』",
            choices: [
                "ほし",
                "つき",
                "ひ",
                "そら"
            ],
            correctAnswerIndex: 1,
            explanation: "『つき』は「月」とも書き、正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『犬＿＿歩いています』",
            choices: [
                "が",
                "に",
                "と",
                "を"
            ],
            correctAnswerIndex: 0,
            explanation: "『犬が歩いています』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『水』",
            choices: [
                "すい",
                "みず",
                "なが",
                "みせ"
            ],
            correctAnswerIndex: 1,
            explanation: "『水』の正しい読みは「みず」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ふゆ』",
            choices: [
                "ふり",
                "ふゆ",
                "ふえ",
                "ふさ"
            ],
            correctAnswerIndex: 1,
            explanation: "『ふゆ』は「冬」とも書き、正しい読みは「ふゆ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『公園＿＿行きます』",
            choices: [
                "を",
                "に",
                "が",
                "へ"
            ],
            correctAnswerIndex: 3,
            explanation: "『公園へ行きます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『日』",
            choices: [
                "ひ",
                "にち",
                "ほし",
                "あさ"
            ],
            correctAnswerIndex: 0,
            explanation: "『日』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『やま』",
            choices: [
                "やま",
                "かわ",
                "そら",
                "もり"
            ],
            correctAnswerIndex: 0,
            explanation: "『やま』は「山」とも書き、正しい読みは「やま」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『花＿＿見ます』",
            choices: [
                "が",
                "を",
                "で",
                "に"
            ],
            correctAnswerIndex: 1,
            explanation: "『花を見ます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『木』",
            choices: [
                "き",
                "こ",
                "はやし",
                "もく"
            ],
            correctAnswerIndex: 0,
            explanation: "『木』の正しい読みは「き」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ねこ』",
            choices: [
                "ぬこ",
                "ねこ",
                "ねご",
                "ねお"
            ],
            correctAnswerIndex: 1,
            explanation: "『ねこ』は動物の名前で、正しい読みは「ねこ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『鳥＿＿飛んでいます』",
            choices: [
                "に",
                "が",
                "を",
                "へ"
            ],
            correctAnswerIndex: 1,
            explanation: "『鳥が飛んでいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『花』",
            choices: [
                "か",
                "ばな",
                "はな",
                "ば"
            ],
            correctAnswerIndex: 2,
            explanation: "『花』の正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『くつ』",
            choices: [
                "くち",
                "くと",
                "くつ",
                "くす"
            ],
            correctAnswerIndex: 2,
            explanation: "『くつ』は足に履くもので、正しい読みは「くつ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『雨＿＿降っています』",
            choices: [
                "に",
                "を",
                "が",
                "で"
            ],
            correctAnswerIndex: 2,
            explanation: "『雨が降っています』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『草』",
            choices: [
                "そう",
                "くさ",
                "そうしょく",
                "しば"
            ],
            correctAnswerIndex: 1,
            explanation: "『草』の正しい読みは「くさ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『そら』",
            choices: [
                "さら",
                "そら",
                "しら",
                "そや"
            ],
            correctAnswerIndex: 1,
            explanation: "『そら』は「空」とも書き、正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『友だち＿＿遊びます』",
            choices: [
                "に",
                "を",
                "と",
                "へ"
            ],
            correctAnswerIndex: 2,
            explanation: "『友だちと遊びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『月』",
            choices: [
                "つき",
                "げつ",
                "ひ",
                "ほし"
            ],
            correctAnswerIndex: 1,
            explanation: "『月』の正しい読みは「げつ」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ひ』",
            choices: [
                "ひ",
                "ひい",
                "は",
                "へ"
            ],
            correctAnswerIndex: 0,
            explanation: "『ひ』は「火」とも書き、正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『机の上＿＿本があります』",
            choices: [
                "に",
                "が",
                "を",
                "で"
            ],
            correctAnswerIndex: 0,
            explanation: "『机の上に本があります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『犬』",
            choices: [
                "いぬ",
                "けん",
                "ねこ",
                "いの"
            ],
            correctAnswerIndex: 0,
            explanation: "『犬』の正しい読みは「いぬ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『あめ』",
            choices: [
                "あけ",
                "あめ",
                "あれ",
                "あさ"
            ],
            correctAnswerIndex: 1,
            explanation: "『あめ』は「雨」とも書き、正しい読みは「あめ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『友だち＿＿手紙を書きました』",
            choices: [
                "を",
                "が",
                "に",
                "と"
            ],
            correctAnswerIndex: 2,
            explanation: "『友だちに手紙を書きました』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『空』",
            choices: [
                "そら",
                "くう",
                "から",
                "あお"
            ],
            correctAnswerIndex: 0,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『ほし』",
            choices: [
                "ほし",
                "はし",
                "ほじ",
                "ほい"
            ],
            correctAnswerIndex: 0,
            explanation: "『ほし』は「星」とも書き、正しい読みは「ほし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『本＿＿読みました』",
            choices: [
                "が",
                "を",
                "に",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『本を読みました』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『森』",
            choices: [
                "やま",
                "もり",
                "かわ",
                "はやし"
            ],
            correctAnswerIndex: 1,
            explanation: "『森』の正しい読みは「もり」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『はな』",
            choices: [
                "はは",
                "はな",
                "はね",
                "はし"
            ],
            correctAnswerIndex: 1,
            explanation: "『はな』は「花」とも書き、正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『本＿＿読みます』",
            choices: [
                "に",
                "を",
                "が",
                "へ"
            ],
            correctAnswerIndex: 1,
            explanation: "『本を読みます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『火』",
            choices: [
                "ひ",
                "か",
                "ふ",
                "あか"
            ],
            correctAnswerIndex: 1,
            explanation: "『火』の正しい読みは「か」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『かさ』",
            choices: [
                "かさ",
                "かさき",
                "かざ",
                "かしゃ"
            ],
            correctAnswerIndex: 0,
            explanation: "『かさ』は雨の日に使う道具で、正しい読みは「かさ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『花＿＿咲いています』",
            choices: [
                "を",
                "が",
                "と",
                "に"
            ],
            correctAnswerIndex: 1,
            explanation: "『花が咲いています』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『川』",
            choices: [
                "かわ",
                "かわら",
                "せん",
                "あし"
            ],
            correctAnswerIndex: 0,
            explanation: "『川』の正しい読みは「かわ」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『うみ』",
            choices: [
                "うま",
                "うみ",
                "うめ",
                "うう"
            ],
            correctAnswerIndex: 1,
            explanation: "『うみ』は「海」とも書き、正しい読みは「うみ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『友だち＿＿話しました』",
            choices: [
                "と",
                "が",
                "に",
                "を"
            ],
            correctAnswerIndex: 0,
            explanation: "『友だちと話しました』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『石』",
            choices: [
                "こいし",
                "いし",
                "せき",
                "いわ"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),
        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『あお』",
            choices: [
                "あい",
                "あお",
                "あう",
                "あか"
            ],
            correctAnswerIndex: 1,
            explanation: "『あお』は「青」とも書き、正しい読みは「あお」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『犬＿＿走ります』",
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
            question: "次の漢字の読みはどれですか？『山』",
            choices: [
                "やま",
                "さん",
                "もり",
                "かわ"
            ],
            correctAnswerIndex: 0,
            explanation: "『山』の正しい読みは「やま」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『すいか』",
            choices: [
                "すいか",
                "すきか",
                "すかい",
                "すこ"
            ],
            correctAnswerIndex: 0,
            explanation: "『すいか』は夏の果物で、正しい読みは「すいか」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『お母さん＿＿話します』",
            choices: [
                "と",
                "を",
                "が",
                "へ"
            ],
            correctAnswerIndex: 0,
            explanation: "『お母さんと話します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『空』",
            choices: [
                "くう",
                "から",
                "そら",
                "あお"
            ],
            correctAnswerIndex: 2,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次のひらがなの読みはどれですか？『たまご』",
            choices: [
                "たまこ",
                "たまご",
                "たまき",
                "たまさ"
            ],
            correctAnswerIndex: 1,
            explanation: "『たまご』の正しい読みは「たまご」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『先生＿＿会います』",
            choices: [
                "と",
                "を",
                "に",
                "で"
            ],
            correctAnswerIndex: 2,
            explanation: "『先生に会います』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『月』",
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
            question: "次のひらがなの読みはどれですか？『さくら』",
            choices: [
                "さくら",
                "さくは",
                "さきら",
                "さくら"
            ],
            correctAnswerIndex: 0,
            explanation: "『さくら』は春に咲く花で、正しい読みは「さくら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。『ねこ＿＿います』",
            choices: [
                "に",
                "が",
                "を",
                "へ"
            ],
            correctAnswerIndex: 1,
            explanation: "「が」を使うと正しい文になります。『ねこがいます』。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？『木』",
            choices: [
                "き",
                "こ",
                "もく",
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
