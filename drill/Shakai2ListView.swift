//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai2ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "郵便物を送るときに使う施設はどれですか？",
            choices: [
                "郵便局",
                "駅",
                "図書館",
                "学校"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便物は郵便局から送ることができます。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "花火大会",
                "田植え",
                "運動会"
            ],
            correctAnswerIndex: 0,
            explanation: "クリスマスは冬に行われる行事の一つです。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "自転車",
                "道路",
                "船"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を借りる",
                "電車に乗る",
                "郵便物を送る",
                "ご飯を食べる"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "節分",
                "花火大会",
                "運動会"
            ],
            correctAnswerIndex: 1,
            explanation: "節分は春に行われる日本の伝統行事です。"
        ),
        QuizQuestion(
            question: "バスが通るために必要なものはどれですか？",
            choices: [
                "船",
                "線路",
                "道路",
                "飛行機"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "遊具で遊ぶ",
                "電車に乗る",
                "郵便物を送る",
                "買い物をする"
            ],
            correctAnswerIndex: 0,
            explanation: "公園では遊具で遊んだり、散歩をすることができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "お正月",
                "運動会",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏の代表的な行事です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "本を借りる",
                "手紙を送る",
                "食事をする"
            ],
            correctAnswerIndex: 2,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "学校で学ぶことはどれですか？",
            choices: [
                "泳ぎ方",
                "勉強",
                "買い物",
                "電車の乗り方"
            ],
            correctAnswerIndex: 1,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "秋に行われる行事はどれですか？",
            choices: [
                "お月見",
                "節分",
                "クリスマス",
                "花火大会"
            ],
            correctAnswerIndex: 0,
            explanation: "お月見は秋に行われる行事です。"
        ),
        QuizQuestion(
            question: "飛行機が離陸するために必要なものはどれですか？",
            choices: [
                "船",
                "道路",
                "滑走路",
                "自転車"
            ],
            correctAnswerIndex: 2,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に相談する",
                "郵便物を送る",
                "ご飯を食べる",
                "買い物をする"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、相談することができます。"
        ),
        QuizQuestion(
            question: "冬に楽しめるものはどれですか？",
            choices: [
                "スキー",
                "花火",
                "プール",
                "運動会"
            ],
            correctAnswerIndex: 0,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "電車の運行に必要なものはどれですか？",
            choices: [
                "飛行機",
                "船",
                "線路",
                "自転車"
            ],
            correctAnswerIndex: 2,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局で送れるものはどれですか？",
            choices: [
                "手紙",
                "本",
                "自転車",
                "バス"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "クリスマスローズ"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "バスが走る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "泳ぐ",
                "本を借りる",
                "電車に乗る",
                "ご飯を食べる"
            ],
            correctAnswerIndex: 1,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "秋に収穫されるものはどれですか？",
            choices: [
                "米",
                "さくらんぼ",
                "スイカ",
                "たけのこ"
            ],
            correctAnswerIndex: 0,
            explanation: "秋には稲の収穫が行われ、お米が収穫されます。"
        ),
        QuizQuestion(
            question: "自転車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "自転車は道路の上を走ります。"
        ),
        QuizQuestion(
            question: "駅でできることはどれですか？",
            choices: [
                "本を読む",
                "電車に乗る",
                "野球をする",
                "勉強する"
            ],
            correctAnswerIndex: 1,
            explanation: "駅では電車に乗ることができます。"
        ),
        QuizQuestion(
            question: "夏に楽しめるものはどれですか？",
            choices: [
                "スキー",
                "プール",
                "雪だるま作り",
                "運動会"
            ],
            correctAnswerIndex: 1,
            explanation: "プールは夏に楽しめる活動です。"
        ),
        QuizQuestion(
            question: "船が進む場所はどこですか？",
            choices: [
                "空",
                "線路",
                "川や海",
                "道路"
            ],
            correctAnswerIndex: 2,
            explanation: "船は川や海の上を進みます。"
        ),
        QuizQuestion(
            question: "警察署でできることはどれですか？",
            choices: [
                "道を聞く",
                "ご飯を食べる",
                "電車に乗る",
                "買い物をする"
            ],
            correctAnswerIndex: 0,
            explanation: "警察署では道を聞いたり、相談することができます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ひまわり",
                "コスモス",
                "パンジー"
            ],
            correctAnswerIndex: 0,
            explanation: "チューリップは春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "冬に楽しめるものはどれですか？",
            choices: [
                "プール",
                "キャンプ",
                "スキー",
                "花火大会"
            ],
            correctAnswerIndex: 2,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "自動車が走るために必要なものはどれですか？",
            choices: [
                "空",
                "線路",
                "道路",
                "川"
            ],
            correctAnswerIndex: 2,
            explanation: "自動車は道路の上を走ります。"
        ),
        QuizQuestion(
            question: "動物園で見ることができるものはどれですか？",
            choices: [
                "魚",
                "象",
                "飛行機",
                "本"
            ],
            correctAnswerIndex: 1,
            explanation: "動物園では象などの動物を見ることができます。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "りんご",
                "ぶどう",
                "スイカ",
                "みかん"
            ],
            correctAnswerIndex: 2,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "泳ぐ",
                "映画を見る",
                "本を読む",
                "電車に乗る"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "本を借りる",
                "勉強をする",
                "遊具で遊ぶ"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "ご飯を食べる",
                "遊具で遊ぶ",
                "勉強をする"
            ],
            correctAnswerIndex: 2,
            explanation: "公園では遊具で遊んだり散歩をすることができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "花火大会",
                "お月見",
                "お正月"
            ],
            correctAnswerIndex: 1,
            explanation: "花火大会は夏に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "秋に楽しめるものはどれですか？",
            choices: [
                "桜",
                "雪だるま作り",
                "紅葉狩り",
                "プール"
            ],
            correctAnswerIndex: 2,
            explanation: "紅葉狩りは秋に楽しめる行事です。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "本を読む",
                "野球をする",
                "勉強する",
                "料理をする"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "飛行機が飛ぶために必要なものはどれですか？",
            choices: [
                "道路",
                "線路",
                "滑走路",
                "自転車"
            ],
            correctAnswerIndex: 2,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "運動会",
                "節分",
                "花火大会"
            ],
            correctAnswerIndex: 0,
            explanation: "クリスマスは冬の代表的な行事です。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "遊具で遊ぶ",
                "電車に乗る",
                "手紙を送る",
                "本を借りる"
            ],
            correctAnswerIndex: 0,
            explanation: "公園では遊具で遊んだり、散歩を楽しむことができます。"
        ),
        QuizQuestion(
            question: "バスが走るために必要なものはどれですか？",
            choices: [
                "船",
                "道路",
                "線路",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に道を聞く",
                "郵便物を送る",
                "映画を見る",
                "電車に乗る"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、困ったことを相談できます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "桜",
                "コスモス",
                "チューリップ"
            ],
            correctAnswerIndex: 1,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "駅でできることはどれですか？",
            choices: [
                "電車に乗る",
                "本を借りる",
                "郵便物を送る",
                "野球をする"
            ],
            correctAnswerIndex: 0,
            explanation: "駅では電車に乗ることができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "運動会",
                "お正月",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏の代表的な行事です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "手紙を送る",
                "本を借りる",
                "野球をする"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "秋に楽しめる行事はどれですか？",
            choices: [
                "節分",
                "運動会",
                "花火大会",
                "お正月"
            ],
            correctAnswerIndex: 1,
            explanation: "運動会は秋に開催されることが多い行事です。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "映画を見る",
                "手紙を送る",
                "本を借りる",
                "食事をする"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "冬に楽しめるスポーツはどれですか？",
            choices: [
                "スキー",
                "水泳",
                "サッカー",
                "テニス"
            ],
            correctAnswerIndex: 0,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "お正月",
                "花見",
                "花火大会"
            ],
            correctAnswerIndex: 2,
            explanation: "花見は春に行われる行事です。"
        ),
        QuizQuestion(
            question: "バスが通る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "夏に収穫される果物はどれですか？",
            choices: [
                "みかん",
                "いちご",
                "スイカ",
                "ぶどう"
            ],
            correctAnswerIndex: 2,
            explanation: "スイカは夏に収穫される代表的な果物です。"
        ),
        QuizQuestion(
            question: "飛行機が飛ぶために必要なものはどれですか？",
            choices: [
                "船",
                "滑走路",
                "道路",
                "自転車"
            ],
            correctAnswerIndex: 1,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "お月見",
                "花見",
                "お正月"
            ],
            correctAnswerIndex: 0,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "運動会",
                "花火大会",
                "節分"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏の代表的な行事です。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "野球をする",
                "郵便物を送る",
                "勉強する",
                "買い物をする"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "冬に楽しめる行事はどれですか？",
            choices: [
                "花見",
                "お正月",
                "花火大会",
                "運動会"
            ],
            correctAnswerIndex: 1,
            explanation: "お正月は冬に行われる行事の一つです。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を借りる",
                "映画を見る",
                "野球をする",
                "郵便物を送る"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を借りたり、読むことができます。"
        ),
        QuizQuestion(
            question: "バスが走る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "空",
                "川"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "桜",
                "クリスマスローズ",
                "チューリップ"
            ],
            correctAnswerIndex: 1,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "飛行機が離陸するために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "滑走路",
                "船"
            ],
            correctAnswerIndex: 2,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "秋に行われる行事はどれですか？",
            choices: [
                "節分",
                "クリスマス",
                "運動会",
                "お正月"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会は秋に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "手紙を送る",
                "本を借りる",
                "運動をする"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "りんご",
                "スイカ",
                "みかん",
                "いちご"
            ],
            correctAnswerIndex: 1,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "花火大会",
                "運動会",
                "クリスマス",
                "節分"
            ],
            correctAnswerIndex: 2,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "コスモス",
                "桜",
                "チューリップ"
            ],
            correctAnswerIndex: 2,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に道を聞く",
                "本を借りる",
                "手紙を送る",
                "運動をする"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、困ったことを相談できます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "お正月",
                "花火大会",
                "クリスマス",
                "節分"
            ],
            correctAnswerIndex: 1,
            explanation: "花火大会は夏に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "道路",
                "滑走路",
                "線路",
                "川"
            ],
            correctAnswerIndex: 2,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "映画を見る",
                "手紙を送る",
                "本を借りる",
                "買い物をする"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "お正月",
                "節分",
                "運動会",
                "花火大会"
            ],
            correctAnswerIndex: 1,
            explanation: "節分は春に行われる行事の一つです。"
        ),
        QuizQuestion(
            question: "バスが走る場所はどこですか？",
            choices: [
                "線路",
                "川",
                "道路",
                "空"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "本を借りる",
                "手紙を送る",
                "電車に乗る",
                "映画を見る"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "スイカ",
                "りんご",
                "いちご",
                "みかん"
            ],
            correctAnswerIndex: 0,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "春に楽しめる行事はどれですか？",
            choices: [
                "花火大会",
                "クリスマス",
                "花見",
                "運動会"
            ],
            correctAnswerIndex: 2,
            explanation: "花見は春に楽しめる行事です。"
        ),
        QuizQuestion(
            question: "夏に収穫される果物はどれですか？",
            choices: [
                "みかん",
                "スイカ",
                "いちご",
                "りんご"
            ],
            correctAnswerIndex: 1,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "勉強する",
                "買い物をする",
                "手紙を送る",
                "映画を見る"
            ],
            correctAnswerIndex: 0,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "冬に楽しめるものはどれですか？",
            choices: [
                "スキー",
                "プール",
                "花火",
                "キャンプ"
            ],
            correctAnswerIndex: 0,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "秋に行われる行事はどれですか？",
            choices: [
                "節分",
                "花火大会",
                "運動会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会は秋に行われる行事の一つです。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "道を聞く",
                "買い物をする",
                "映画を見る",
                "本を借りる"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、相談することができます。"
        ),
        QuizQuestion(
            question: "飛行機が飛ぶために必要なものはどれですか？",
            choices: [
                "滑走路",
                "道路",
                "線路",
                "船"
            ],
            correctAnswerIndex: 0,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "本を借りる",
                "電車に乗る",
                "運動をする"
            ],
            correctAnswerIndex: 1,
            explanation: "図書館では本を借りたり、読むことができます。"
        ),
        QuizQuestion(
            question: "バスが走るために必要なものはどれですか？",
            choices: [
                "船",
                "道路",
                "線路",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局で送れるものはどれですか？",
            choices: [
                "手紙",
                "本",
                "野球道具",
                "洋服"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "秋に楽しめるものはどれですか？",
            choices: [
                "雪だるま作り",
                "花火",
                "紅葉狩り",
                "プール"
            ],
            correctAnswerIndex: 2,
            explanation: "紅葉狩りは秋に楽しめる代表的な行事です。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "花火大会",
                "クリスマス",
                "運動会",
                "花見"
            ],
            correctAnswerIndex: 1,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "スイカ",
                "りんご",
                "みかん",
                "いちご"
            ],
            correctAnswerIndex: 0,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "遊具で遊ぶ",
                "郵便物を送る",
                "電車に乗る",
                "勉強をする"
            ],
            correctAnswerIndex: 0,
            explanation: "公園では遊具で遊んだり、散歩を楽しむことができます。"
        ),
        QuizQuestion(
            question: "学校で学べることはどれですか？",
            choices: [
                "買い物",
                "勉強",
                "映画鑑賞",
                "手紙の発送"
            ],
            correctAnswerIndex: 1,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を借りる",
                "スポーツをする",
                "映画を見る",
                "郵便物を送る"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を借りたり、読むことができます。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "川",
                "道路",
                "空"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "夏に楽しめるものはどれですか？",
            choices: [
                "雪合戦",
                "花火",
                "クリスマス",
                "紅葉狩り"
            ],
            correctAnswerIndex: 1,
            explanation: "花火は夏の代表的な楽しみの一つです。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に道を聞く",
                "郵便物を送る",
                "本を借りる",
                "食事をする"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、困ったことを相談できます。"
        ),
        QuizQuestion(
            question: "バスが通る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "お正月",
                "花見",
                "クリスマス",
                "花火大会"
            ],
            correctAnswerIndex: 1,
            explanation: "花見は春に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "冬に楽しめるスポーツはどれですか？",
            choices: [
                "サッカー",
                "水泳",
                "スキー",
                "テニス"
            ],
            correctAnswerIndex: 2,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "勉強する",
                "郵便物を送る",
                "本を借りる",
                "電車に乗る"
            ],
            correctAnswerIndex: 0,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "秋に収穫されるものはどれですか？",
            choices: [
                "稲",
                "スイカ",
                "イチゴ",
                "ミカン"
            ],
            correctAnswerIndex: 0,
            explanation: "稲は秋に収穫される代表的な作物です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "郵便物を送る",
                "本を読む",
                "勉強する"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を読む",
                "郵便物を送る",
                "料理をする",
                "電車に乗る"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を読むことができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "運動会",
                "お月見",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "バスが走るために必要なものはどれですか？",
            choices: [
                "川",
                "線路",
                "道路",
                "空"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "スイセン"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "警察官に道を聞く",
                "勉強する",
                "本を借りる"
            ],
            correctAnswerIndex: 1,
            explanation: "交番では警察官に道を聞いたり、困りごとを相談できます。"
        ),
        QuizQuestion(
            question: "夏に楽しめる行事はどれですか？",
            choices: [
                "お正月",
                "節分",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏に楽しめる行事の一つです。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "滑走路",
                "川"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "映画を見る",
                "本を借りる",
                "電車に乗る"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "節分",
                "お月見",
                "クリスマス",
                "花火大会"
            ],
            correctAnswerIndex: 2,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "バスが通る場所はどこですか？",
            choices: [
                "川",
                "線路",
                "道路",
                "空"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "本を借りる",
                "郵便物を送る",
                "電車に乗る",
                "食事をする"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "パンジー"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "遊具で遊ぶ",
                "本を借りる",
                "買い物をする"
            ],
            correctAnswerIndex: 1,
            explanation: "公園では遊具で遊んだり、散歩を楽しむことができます。"
        ),
        QuizQuestion(
            question: "秋に楽しめるものはどれですか？",
            choices: [
                "雪だるま作り",
                "紅葉狩り",
                "スキー",
                "海水浴"
            ],
            correctAnswerIndex: 1,
            explanation: "紅葉狩りは秋に楽しめる代表的な活動です。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "映画を見る",
                "手紙を送る",
                "警察官に道を聞く",
                "本を借りる"
            ],
            correctAnswerIndex: 2,
            explanation: "交番では警察官に道を聞いたり、困ったときに相談できます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai2, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai2ListView(isPresenting: .constant(false))
    }
}
