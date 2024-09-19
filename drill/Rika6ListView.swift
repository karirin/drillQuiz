//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika6ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "植物が光合成を行うために必要な物質は何ですか？",
            choices: [
                "酸素",
                "水",
                "二酸化炭素",
                "窒素"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は光合成の際に二酸化炭素と水を使って栄養分を作り出します。"
        ),

        QuizQuestion(
            question: "雷が発生する主な原因は何ですか？",
            choices: [
                "大気の流れ",
                "地球の磁場",
                "雲の中の放電",
                "気圧の変化"
            ],
            correctAnswerIndex: 2,
            explanation: "雷は雲の中での放電現象によって発生します。"
        ),

        QuizQuestion(
            question: "地球の大気の中で最も多く含まれている気体は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "アルゴン"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の大気の約78%は窒素です。"
        ),

        QuizQuestion(
            question: "風が吹く主な原因は何ですか？",
            choices: [
                "太陽の光",
                "地球の自転",
                "気圧の差",
                "温度差"
            ],
            correctAnswerIndex: 3,
            explanation: "風は主に気圧の差によって発生しますが、温度差も風の発生に影響を与えます。"
        ),

        QuizQuestion(
            question: "地球が自転することによって生じる現象は何ですか？",
            choices: [
                "季節の変化",
                "気温の変化",
                "昼と夜の変化",
                "潮の満ち引き"
            ],
            correctAnswerIndex: 3,
            explanation: "地球の自転によって昼と夜が生じます。"
        ),

        QuizQuestion(
            question: "月が地球の影に完全に入る現象を何といいますか？",
            choices: [
                "部分月食",
                "半影月食",
                "皆既月食",
                "日食"
            ],
            correctAnswerIndex: 2,
            explanation: "月が地球の影に完全に隠れると皆既月食が発生します。"
        ),

        QuizQuestion(
            question: "海水が蒸発すると、次に何が発生しますか？",
            choices: [
                "雨",
                "雪",
                "水蒸気",
                "氷"
            ],
            correctAnswerIndex: 3,
            explanation: "海水が蒸発すると水蒸気が発生し、空に上がります。"
        ),

        QuizQuestion(
            question: "火山が噴火したときに地表に出てくるものは何ですか？",
            choices: [
                "ガス",
                "砂",
                "溶岩",
                "氷"
            ],
            correctAnswerIndex: 2,
            explanation: "火山の噴火で地表に出る溶けた岩を溶岩といいます。"
        ),

        QuizQuestion(
            question: "氷が溶けて水になる現象を何といいますか？",
            choices: [
                "蒸発",
                "凝固",
                "融解",
                "沈殿"
            ],
            correctAnswerIndex: 3,
            explanation: "氷が溶けて液体になる現象を融解といいます。"
        ),

        QuizQuestion(
            question: "太陽系で最も太陽に近い惑星はどれですか？",
            choices: [
                "火星",
                "金星",
                "水星",
                "地球"
            ],
            correctAnswerIndex: 3,
            explanation: "太陽系で最も太陽に近い惑星は水星です。"
        ),
        QuizQuestion(
            question: "植物が呼吸を行うために必要な気体は何ですか？",
            choices: [
                "窒素",
                "二酸化炭素",
                "水蒸気",
                "酸素"
            ],
            correctAnswerIndex: 3,
            explanation: "植物は酸素を取り込み、呼吸を行います。"
        ),

        QuizQuestion(
            question: "地震が発生したとき、最も揺れが大きい場所を何といいますか？",
            choices: [
                "初期微動",
                "余震",
                "震央",
                "主要動"
            ],
            correctAnswerIndex: 3,
            explanation: "地震の際、最も大きな揺れを感じる現象を主要動といいます。"
        ),

        QuizQuestion(
            question: "雲ができる過程で重要な要素は何ですか？",
            choices: [
                "温度",
                "風",
                "太陽光",
                "水蒸気"
            ],
            correctAnswerIndex: 3,
            explanation: "雲は水蒸気が冷やされて凝結し、形成されます。"
        ),

        QuizQuestion(
            question: "雷が発生する際に空で見られる光を何といいますか？",
            choices: [
                "星光",
                "日光",
                "稲妻",
                "稲光"
            ],
            correctAnswerIndex: 3,
            explanation: "雷が発生したときに見える光を稲光と呼びます。"
        ),

        QuizQuestion(
            question: "風はどのようにして発生しますか？",
            choices: [
                "気温差によって",
                "海流の変化によって",
                "太陽の光によって",
                "気圧差によって"
            ],
            correctAnswerIndex: 3,
            explanation: "風は主に気圧差によって発生します。"
        ),

        QuizQuestion(
            question: "月が地球の影に完全に隠れる現象を何といいますか？",
            choices: [
                "部分月食",
                "日食",
                "半影月食",
                "皆既月食"
            ],
            correctAnswerIndex: 3,
            explanation: "月が地球の影に完全に隠れる現象を皆既月食といいます。"
        ),

        QuizQuestion(
            question: "海水が蒸発して大気中に上がると何ができますか？",
            choices: [
                "氷",
                "雪",
                "雨",
                "雲"
            ],
            correctAnswerIndex: 3,
            explanation: "海水が蒸発して水蒸気となり、冷えると雲ができます。"
        ),

        QuizQuestion(
            question: "地震が起こった際に発生する大きな揺れを何といいますか？",
            choices: [
                "震央",
                "断層",
                "余震",
                "主要動"
            ],
            correctAnswerIndex: 3,
            explanation: "地震が発生した際の大きな揺れを主要動と呼びます。"
        ),

        QuizQuestion(
            question: "太陽系の中で、最も太陽に近い惑星はどれですか？",
            choices: [
                "地球",
                "火星",
                "木星",
                "水星"
            ],
            correctAnswerIndex: 3,
            explanation: "水星は太陽系で最も太陽に近い惑星です。"
        ),

        QuizQuestion(
            question: "氷が溶けて水になる現象を何といいますか？",
            choices: [
                "蒸発",
                "凝結",
                "固化",
                "融解"
            ],
            correctAnswerIndex: 3,
            explanation: "氷が溶けて液体の水になる現象を融解といいます。"
        ),
        QuizQuestion(
            question: "地震の揺れを最初に感じる現象を何といいますか？",
            choices: [
                "余震",
                "震央",
                "初期微動",
                "本震"
            ],
            correctAnswerIndex: 2,
            explanation: "地震の揺れを最初に感じる小さな揺れを初期微動といいます。"
        ),

        QuizQuestion(
            question: "火山が噴火したとき、地表に出る物質は何ですか？",
            choices: [
                "水",
                "石油",
                "溶岩",
                "酸素"
            ],
            correctAnswerIndex: 2,
            explanation: "火山が噴火した際に地表に出てくるのは溶岩です。"
        ),

        QuizQuestion(
            question: "植物が光合成を行う際に必要な物質はどれですか？",
            choices: [
                "酸素",
                "炭素",
                "二酸化炭素",
                "窒素"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は光合成を行うために二酸化炭素を吸収します。"
        ),

        QuizQuestion(
            question: "風が強く吹く主な原因は何ですか？",
            choices: [
                "温度の変化",
                "大気圧の変化",
                "気圧の差",
                "地球の自転"
            ],
            correctAnswerIndex: 2,
            explanation: "風は主に気圧の差によって発生します。"
        ),

        QuizQuestion(
            question: "海水が蒸発して大気中に上がると、次に何ができますか？",
            choices: [
                "雨",
                "雪",
                "雲",
                "氷"
            ],
            correctAnswerIndex: 2,
            explanation: "海水が蒸発して大気中に上がると、雲が形成されます。"
        ),

        QuizQuestion(
            question: "地震の震源から地表に最も近い場所を何といいますか？",
            choices: [
                "断層",
                "本震",
                "震央",
                "余震"
            ],
            correctAnswerIndex: 2,
            explanation: "震源の真上に位置する地表の地点を震央と呼びます。"
        ),

        QuizQuestion(
            question: "雷が鳴るときに空で発生する光を何といいますか？",
            choices: [
                "稲妻",
                "稲光",
                "閃光",
                "虹"
            ],
            correctAnswerIndex: 2,
            explanation: "雷が鳴る際に空で見える光は稲光と呼ばれます。"
        ),

        QuizQuestion(
            question: "月が地球の影に完全に隠れる現象を何といいますか？",
            choices: [
                "部分月食",
                "日食",
                "皆既月食",
                "半影月食"
            ],
            correctAnswerIndex: 2,
            explanation: "月が完全に地球の影に隠れると皆既月食が発生します。"
        ),

        QuizQuestion(
            question: "氷が溶けて液体になる現象を何といいますか？",
            choices: [
                "蒸発",
                "凝固",
                "融解",
                "沈殿"
            ],
            correctAnswerIndex: 2,
            explanation: "氷が溶けて液体になることを融解といいます。"
        ),

        QuizQuestion(
            question: "太陽系の中で、最も大きな惑星はどれですか？",
            choices: [
                "地球",
                "火星",
                "木星",
                "金星"
            ],
            correctAnswerIndex: 2,
            explanation: "木星は太陽系で最も大きな惑星です。"
        ),
        QuizQuestion(
            question: "植物が光合成を行うために必要な物質は何ですか？",
            choices: [
                "酸素と水",
                "窒素と水",
                "二酸化炭素と水",
                "炭素と酸素"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は光合成を行うために二酸化炭素と水を使用します。"
        ),

        QuizQuestion(
            question: "雷が発生するのはどのような現象によるものですか？",
            choices: [
                "大気中の気圧の変化",
                "大気中の温度の変化",
                "雲の中での放電",
                "地球の磁場の影響"
            ],
            correctAnswerIndex: 2,
            explanation: "雷は雲の中での放電によって発生します。"
        ),

        QuizQuestion(
            question: "海水が蒸発すると何が発生しますか？",
            choices: [
                "雨",
                "氷",
                "水蒸気",
                "雲"
            ],
            correctAnswerIndex: 2,
            explanation: "海水が蒸発すると水蒸気が発生します。"
        ),

        QuizQuestion(
            question: "風はどのようにして発生するのですか？",
            choices: [
                "気温差によって発生する",
                "地球の自転によって発生する",
                "気圧差によって発生する",
                "太陽の光によって発生する"
            ],
            correctAnswerIndex: 2,
            explanation: "風は主に気圧差によって発生し、高気圧から低気圧へ空気が流れます。"
        ),

        QuizQuestion(
            question: "氷が水に変わる現象を何といいますか？",
            choices: [
                "蒸発",
                "凝固",
                "融解",
                "沈殿"
            ],
            correctAnswerIndex: 2,
            explanation: "氷が溶けて水に変わることを融解といいます。"
        ),

        QuizQuestion(
            question: "大気中で最も多く含まれる気体は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水蒸気"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の大気中で最も多い気体は窒素です。"
        ),

        QuizQuestion(
            question: "地震の震源に最も近い場所を何といいますか？",
            choices: [
                "断層",
                "初期微動",
                "震央",
                "余震"
            ],
            correctAnswerIndex: 2,
            explanation: "震源の真上に位置する場所を震央といいます。"
        ),

        QuizQuestion(
            question: "地球が自転することで起こる現象は何ですか？",
            choices: [
                "季節の変化",
                "潮の満ち引き",
                "昼と夜の変化",
                "風の強さの変化"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の自転によって昼と夜が生じます。"
        ),

        QuizQuestion(
            question: "雷が鳴るときに見られる光を何といいますか？",
            choices: [
                "虹",
                "星光",
                "稲光",
                "閃光"
            ],
            correctAnswerIndex: 2,
            explanation: "雷が鳴る際に見られる光は稲光と呼ばれます。"
        ),

        QuizQuestion(
            question: "火山の噴火で溶けた岩が地表に出てくる現象を何といいますか？",
            choices: [
                "火山灰",
                "石灰岩",
                "溶岩",
                "岩盤"
            ],
            correctAnswerIndex: 2,
            explanation: "火山の噴火で地表に出てくる溶けた岩を溶岩といいます。"
        ),
        QuizQuestion(
            question: "地震が発生した際、震源に最も近い場所を何といいますか？",
            choices: [
                "断層",
                "震源地",
                "震央",
                "津波"
            ],
            correctAnswerIndex: 2,
            explanation: "震央は地震の震源の真上に位置する地表の地点です。"
        ),

        QuizQuestion(
            question: "地球の公転によって起こる現象は何ですか？",
            choices: [
                "昼と夜の変化",
                "月の満ち欠け",
                "季節の変化",
                "潮の満ち引き"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の公転によって、春夏秋冬などの季節の変化が起こります。"
        ),

        QuizQuestion(
            question: "風はどのようにして発生しますか？",
            choices: [
                "太陽の活動によって",
                "地球の自転によって",
                "気圧の差によって",
                "地球の引力によって"
            ],
            correctAnswerIndex: 2,
            explanation: "風は気圧の差によって発生し、高気圧から低気圧へ空気が流れます。"
        ),

        QuizQuestion(
            question: "雷が鳴るときに空で見られる光を何といいますか？",
            choices: [
                "稲妻",
                "虹",
                "稲光",
                "閃光"
            ],
            correctAnswerIndex: 2,
            explanation: "雷が鳴る際に空で見られる光は稲光と呼ばれます。"
        ),

        QuizQuestion(
            question: "空気中の水蒸気が冷えて水になる現象を何といいますか？",
            choices: [
                "蒸発",
                "融解",
                "凝結",
                "固化"
            ],
            correctAnswerIndex: 2,
            explanation: "空気中の水蒸気が冷えて水になる現象を凝結といいます。"
        ),

        QuizQuestion(
            question: "海水が蒸発してできるものは何ですか？",
            choices: [
                "氷",
                "雨",
                "水蒸気",
                "雪"
            ],
            correctAnswerIndex: 2,
            explanation: "海水が蒸発すると水蒸気となり、大気中に上昇します。"
        ),

        QuizQuestion(
            question: "大気中で最も多く含まれている気体は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の大気の約78%は窒素です。"
        ),

        QuizQuestion(
            question: "地震の際、初めに感じる小さな揺れを何といいますか？",
            choices: [
                "余震",
                "主要動",
                "初期微動",
                "震央"
            ],
            correctAnswerIndex: 2,
            explanation: "地震が発生したときに最初に感じる小さな揺れを初期微動といいます。"
        ),

        QuizQuestion(
            question: "火山が噴火する際に地表に出てくる物質を何といいますか？",
            choices: [
                "水",
                "石油",
                "溶岩",
                "水蒸気"
            ],
            correctAnswerIndex: 2,
            explanation: "火山の噴火によって地表に出てくる溶けた岩石を溶岩といいます。"
        ),

        QuizQuestion(
            question: "月が地球の影に完全に隠れる現象を何といいますか？",
            choices: [
                "部分月食",
                "日食",
                "皆既月食",
                "半影月食"
            ],
            correctAnswerIndex: 2,
            explanation: "月が地球の影に完全に隠れる現象を皆既月食といいます。"
        ),
        QuizQuestion(
            question: "太陽系で最も大きな惑星はどれですか？",
            choices: [
                "地球",
                "火星",
                "木星",
                "金星"
            ],
            correctAnswerIndex: 2,
            explanation: "木星は太陽系で最も大きな惑星です。"
        ),

        QuizQuestion(
            question: "台風が発生しやすい場所はどこですか？",
            choices: [
                "山岳地帯",
                "砂漠",
                "温暖な海",
                "北極"
            ],
            correctAnswerIndex: 2,
            explanation: "台風は温暖な海で発生しやすいです。"
        ),

        QuizQuestion(
            question: "雲が形成される過程で重要な要素は何ですか？",
            choices: [
                "太陽光",
                "風",
                "水蒸気の凝結",
                "酸素の供給"
            ],
            correctAnswerIndex: 2,
            explanation: "雲は水蒸気が冷やされて凝結し、微細な水滴や氷の粒が集まることで形成されます。"
        ),

        QuizQuestion(
            question: "雷が発生する主な原因は何ですか？",
            choices: [
                "太陽の光",
                "気温の低下",
                "雲の間での放電",
                "風の強さ"
            ],
            correctAnswerIndex: 2,
            explanation: "雷は雲の中での放電現象によって発生します。"
        ),

        QuizQuestion(
            question: "植物が呼吸するために必要なものは何ですか？",
            choices: [
                "光",
                "水",
                "酸素",
                "二酸化炭素"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は酸素を取り込み、呼吸を行います。"
        ),

        QuizQuestion(
            question: "海の水が蒸発してできるものは何ですか？",
            choices: [
                "雨",
                "氷",
                "水蒸気",
                "雲"
            ],
            correctAnswerIndex: 2,
            explanation: "海の水が蒸発して大気中に水蒸気となって上がります。"
        ),

        QuizQuestion(
            question: "地球の大気圏で最も多い気体は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の大気の約78%は窒素で構成されています。"
        ),

        QuizQuestion(
            question: "地震の揺れを感じる最も大きな揺れを何と呼びますか？",
            choices: [
                "初期微動",
                "震央",
                "主要動",
                "震源"
            ],
            correctAnswerIndex: 2,
            explanation: "地震の際に感じる最も大きな揺れを主要動と呼びます。"
        ),

        QuizQuestion(
            question: "火山が噴火するときに溶岩がどのようにして出てきますか？",
            choices: [
                "地殻が沈む",
                "地震が発生する",
                "マグマが地表に噴き出す",
                "海面が上昇する"
            ],
            correctAnswerIndex: 2,
            explanation: "火山が噴火すると、マグマが地表に噴き出して溶岩になります。"
        ),

        QuizQuestion(
            question: "低気圧が近づくと天気はどうなりますか？",
            choices: [
                "晴れる",
                "風が止む",
                "雨が降りやすくなる",
                "気温が下がる"
            ],
            correctAnswerIndex: 2,
            explanation: "低気圧が近づくと、空気が上昇しやすくなり、雨が降りやすくなります。"
        ),
        QuizQuestion(
            question: "地球が自転することによって生じる現象は何ですか？",
            choices: [
                "季節の変化",
                "地震",
                "昼と夜の変化",
                "月の満ち欠け"
            ],
            correctAnswerIndex: 2,
            explanation: "地球が自転することにより、昼と夜が生じます。"
        ),

        QuizQuestion(
            question: "空気が冷えると水蒸気がどうなりますか？",
            choices: [
                "蒸発する",
                "水になる",
                "凝結する",
                "固体になる"
            ],
            correctAnswerIndex: 3,
            explanation: "空気が冷えると水蒸気が凝結して水滴になります。"
        ),

        QuizQuestion(
            question: "大気中の水蒸気が凝結してできるものは何ですか？",
            choices: [
                "雪",
                "霧",
                "雲",
                "雨"
            ],
            correctAnswerIndex: 3,
            explanation: "水蒸気が冷やされて雲や霧、雨になります。"
        ),

        QuizQuestion(
            question: "風が強く吹くのはなぜですか？",
            choices: [
                "温度の変化",
                "地球の自転",
                "気圧の差",
                "月の引力"
            ],
            correctAnswerIndex: 3,
            explanation: "風は主に気圧の差によって発生します。"
        ),

        QuizQuestion(
            question: "月が地球の影に完全に入ると何が起こりますか？",
            choices: [
                "月食",
                "日食",
                "皆既月食",
                "部分月食"
            ],
            correctAnswerIndex: 2,
            explanation: "月が完全に地球の影に入ると皆既月食が起こります。"
        ),

        QuizQuestion(
            question: "氷が水になる現象を何といいますか？",
            choices: [
                "蒸発",
                "凝固",
                "融解",
                "凝結"
            ],
            correctAnswerIndex: 2,
            explanation: "氷が溶けて水になることを融解といいます。"
        ),

        QuizQuestion(
            question: "山で空気が薄くなる原因は何ですか？",
            choices: [
                "空気が上に上がるから",
                "太陽が遠いから",
                "気圧が低くなるから",
                "酸素がなくなるから"
            ],
            correctAnswerIndex: 3,
            explanation: "山では気圧が低くなり、空気が薄く感じられます。"
        ),

        QuizQuestion(
            question: "金属が錆びる主な原因は何ですか？",
            choices: [
                "日光",
                "熱",
                "酸素と水",
                "風"
            ],
            correctAnswerIndex: 2,
            explanation: "金属は酸素と水に触れると酸化して錆びます。"
        ),

        QuizQuestion(
            question: "地震が発生すると、最も揺れが大きい場所を何といいますか？",
            choices: [
                "震央",
                "震源",
                "主要動",
                "断層"
            ],
            correctAnswerIndex: 2,
            explanation: "地震の際、最も大きな揺れが発生する場所を主要動といいます。"
        ),

        QuizQuestion(
            question: "火山の噴火によって地表に出るものはどれですか？",
            choices: [
                "石油",
                "水",
                "溶岩",
                "雲"
            ],
            correctAnswerIndex: 2,
            explanation: "火山が噴火すると、溶岩が地表に出てきます。"
        ),
        QuizQuestion(
            question: "地震が発生するとき、震源から遠い場所で感じる揺れを何といいますか？",
            choices: [
                "震央",
                "初期微動",
                "主要動",
                "余震"
            ],
            correctAnswerIndex: 2,
            explanation: "震源から遠い場所で感じる大きな揺れを主要動と呼びます。"
        ),

        QuizQuestion(
            question: "大気中の水蒸気が冷えてできる現象は何ですか？",
            choices: [
                "蒸発",
                "凝固",
                "凝結",
                "沈殿"
            ],
            correctAnswerIndex: 2,
            explanation: "大気中の水蒸気が冷えて水滴になる現象を凝結といいます。"
        ),

        QuizQuestion(
            question: "火山が噴火するときに地表に出てくるものは何ですか？",
            choices: [
                "水",
                "ガス",
                "マグマ",
                "岩石"
            ],
            correctAnswerIndex: 3,
            explanation: "火山が噴火すると、溶けたマグマが冷えて岩石になります。"
        ),

        QuizQuestion(
            question: "川が上流から下流に運ぶ物質を何といいますか？",
            choices: [
                "堆積物",
                "水蒸気",
                "土砂",
                "鉱石"
            ],
            correctAnswerIndex: 2,
            explanation: "川は上流から土砂を運び、それが下流で堆積します。"
        ),

        QuizQuestion(
            question: "植物が光合成を行う場所はどこですか？",
            choices: [
                "根",
                "茎",
                "葉",
                "花"
            ],
            correctAnswerIndex: 2,
            explanation: "植物の葉は光合成を行う重要な器官です。"
        ),

        QuizQuestion(
            question: "昼と夜ができるのはなぜですか？",
            choices: [
                "月が地球を照らすから",
                "地球が公転しているから",
                "地球が自転しているから",
                "太陽が動いているから"
            ],
            correctAnswerIndex: 3,
            explanation: "地球が自転することで、昼と夜が生じます。"
        ),

        QuizQuestion(
            question: "光が水に入ると屈折するのはなぜですか？",
            choices: [
                "水が透明だから",
                "光の色が変わるから",
                "光の速度が変わるから",
                "水の温度が高いから"
            ],
            correctAnswerIndex: 3,
            explanation: "光が水に入ると、光の速度が変わるため屈折が起こります。"
        ),

        QuizQuestion(
            question: "地球の大気中で最も多く含まれる気体は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "アルゴン"
            ],
            correctAnswerIndex: 2,
            explanation: "地球の大気の約78%は窒素で構成されています。"
        ),

        QuizQuestion(
            question: "雲ができるときに必要なものは何ですか？",
            choices: [
                "光",
                "風",
                "水蒸気",
                "太陽"
            ],
            correctAnswerIndex: 3,
            explanation: "水蒸気が冷えて凝結することで雲が形成されます。"
        ),

        QuizQuestion(
            question: "気圧が低い地域で起こりやすい現象はどれですか？",
            choices: [
                "晴天",
                "雪",
                "風",
                "雨"
            ],
            correctAnswerIndex: 3,
            explanation: "気圧が低い地域では、空気が上昇し、雨が降りやすくなります。"
        ),
        QuizQuestion(
            question: "太陽系の惑星のうち、最も太陽に近いのはどれですか？",
            choices: [
                "地球",
                "火星",
                "水星",
                "木星"
            ],
            correctAnswerIndex: 2,
            explanation: "太陽系の中で最も太陽に近い惑星は水星です。"
        ),

        QuizQuestion(
            question: "植物が光合成を行うときに必要なエネルギー源は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "水",
                "太陽光"
            ],
            correctAnswerIndex: 3,
            explanation: "植物は光合成のために太陽光をエネルギー源としています。"
        ),

        QuizQuestion(
            question: "地震の際、地面に大きな揺れが生じる原因は何ですか？",
            choices: [
                "台風の影響",
                "大気圧の変化",
                "断層のずれ",
                "海流の変化"
            ],
            correctAnswerIndex: 2,
            explanation: "地震は断層のずれによって発生し、地面に大きな揺れをもたらします。"
        ),

        QuizQuestion(
            question: "太陽のエネルギー源は何ですか？",
            choices: [
                "重力",
                "核融合",
                "電磁波",
                "光"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽のエネルギー源は核融合反応で、これにより莫大なエネルギーを放出します。"
        ),

        QuizQuestion(
            question: "氷が溶けるとどうなりますか？",
            choices: [
                "水蒸気になる",
                "固体のまま変わらない",
                "液体の水になる",
                "粉々に砕ける"
            ],
            correctAnswerIndex: 2,
            explanation: "氷が溶けると液体の水に変わります。"
        ),

        QuizQuestion(
            question: "嵐のときに発生する自然現象はどれですか？",
            choices: [
                "地震",
                "津波",
                "雷",
                "火山噴火"
            ],
            correctAnswerIndex: 2,
            explanation: "嵐の際には雷が発生することがあります。"
        ),

        QuizQuestion(
            question: "山の上で空気が薄く感じられるのはなぜですか？",
            choices: [
                "空気中の酸素が減るから",
                "大気圧が低いから",
                "気温が低いから",
                "重力が弱いから"
            ],
            correctAnswerIndex: 1,
            explanation: "山の上では大気圧が低く、空気が薄く感じられます。"
        ),

        QuizQuestion(
            question: "台風が発生しやすい場所はどこですか？",
            choices: [
                "砂漠地帯",
                "温暖な海域",
                "北極",
                "山岳地帯"
            ],
            correctAnswerIndex: 1,
            explanation: "台風は温暖な海域で発生することが多いです。"
        ),

        QuizQuestion(
            question: "海の波の高さを大きくする主な原因は何ですか？",
            choices: [
                "気温",
                "風",
                "雨",
                "雲"
            ],
            correctAnswerIndex: 1,
            explanation: "風が強く吹くことで、海の波が高くなります。"
        ),

        QuizQuestion(
            question: "水蒸気が冷やされると何が発生しますか？",
            choices: [
                "氷",
                "雲",
                "水",
                "蒸気"
            ],
            correctAnswerIndex: 2,
            explanation: "水蒸気が冷やされると、凝結して水になります。"
        ),
        QuizQuestion(
            question: "光が屈折するのはどのようなときですか？",
            choices: [
                "光が空気から水に入るとき",
                "光が鏡に当たるとき",
                "光が真空中を通るとき",
                "光が白い紙に当たるとき"
            ],
            correctAnswerIndex: 1,
            explanation: "光は空気から水のような異なる物質に入るときに屈折します。"
        ),

        QuizQuestion(
            question: "雨が降った後、虹が見えるのはなぜですか？",
            choices: [
                "太陽の光が水滴に反射・屈折するから",
                "空気中の水蒸気が多いから",
                "太陽が沈むから",
                "風が強く吹くから"
            ],
            correctAnswerIndex: 1,
            explanation: "虹は太陽の光が空気中の水滴に反射・屈折することで見えます。"
        ),

        QuizQuestion(
            question: "地震が起きたときに発生する大きな波を何といいますか？",
            choices: [
                "余震",
                "津波",
                "断層",
                "震源"
            ],
            correctAnswerIndex: 1,
            explanation: "地震が海底で発生すると、津波という大きな波が生じることがあります。"
        ),

        QuizQuestion(
            question: "植物が光合成を行うために必要なものは何ですか？",
            choices: [
                "窒素と酸素",
                "水と二酸化炭素",
                "光と酸素",
                "日光と窒素"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は光合成を行うために水と二酸化炭素を使います。"
        ),

        QuizQuestion(
            question: "月が地球の影に完全に入る現象を何といいますか？",
            choices: [
                "部分月食",
                "皆既月食",
                "日食",
                "月の満ち欠け"
            ],
            correctAnswerIndex: 1,
            explanation: "月が地球の影に完全に入ると皆既月食が起こります。"
        ),

        QuizQuestion(
            question: "海の水が蒸発してできるものは何ですか？",
            choices: [
                "雨",
                "氷",
                "雲",
                "風"
            ],
            correctAnswerIndex: 2,
            explanation: "海の水が蒸発して空に上がり、冷やされることで雲ができます。"
        ),

        QuizQuestion(
            question: "電気を通す物質はどれですか？",
            choices: [
                "プラスチック",
                "ガラス",
                "銅",
                "木材"
            ],
            correctAnswerIndex: 2,
            explanation: "銅は電気をよく通す導体です。"
        ),

        QuizQuestion(
            question: "火山が噴火したときに溶岩が冷え固まるとできるものは何ですか？",
            choices: [
                "石灰岩",
                "玄武岩",
                "花崗岩",
                "砂岩"
            ],
            correctAnswerIndex: 1,
            explanation: "溶岩が冷え固まると玄武岩が形成されます。"
        ),

        QuizQuestion(
            question: "風が吹く原因は何ですか？",
            choices: [
                "太陽の光",
                "地球の自転",
                "気圧差",
                "重力"
            ],
            correctAnswerIndex: 2,
            explanation: "風は気圧の差によって発生します。"
        ),

        QuizQuestion(
            question: "雷が発生する主な原因は何ですか？",
            choices: [
                "地球の磁場",
                "大気中の電気の放電",
                "太陽の活動",
                "雲の摩擦"
            ],
            correctAnswerIndex: 1,
            explanation: "雷は大気中で電気が放電することで発生します。"
        ),
        QuizQuestion(
            question: "植物が呼吸をするために必要な気体は何ですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水蒸気"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は呼吸のために酸素を取り入れ、二酸化炭素を排出します。"
        ),

        QuizQuestion(
            question: "太陽の表面に見られる黒い斑点を何といいますか？",
            choices: [
                "黒点",
                "白斑",
                "日輪",
                "プロミネンス"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽の表面に見られる黒い斑点は「黒点」と呼ばれ、温度が低い部分です。"
        ),

        QuizQuestion(
            question: "風が強く吹くときに起こる現象はどれですか？",
            choices: [
                "波が高くなる",
                "気圧が高くなる",
                "雲が少なくなる",
                "雨が止む"
            ],
            correctAnswerIndex: 0,
            explanation: "風が強く吹くと、海では波が高くなります。"
        ),

        QuizQuestion(
            question: "光が鏡に当たるとどうなりますか？",
            choices: [
                "反射する",
                "屈折する",
                "吸収される",
                "拡散する"
            ],
            correctAnswerIndex: 0,
            explanation: "光が鏡に当たると、入射角と等しい角度で反射します。"
        ),

        QuizQuestion(
            question: "台風が発生する場所はどこですか？",
            choices: [
                "温暖な海の上",
                "山岳地帯",
                "砂漠",
                "南極"
            ],
            correctAnswerIndex: 0,
            explanation: "台風は温暖な海域で、海水が蒸発して発生します。"
        ),

        QuizQuestion(
            question: "地球の表面の大部分を覆っているものは何ですか？",
            choices: [
                "水",
                "氷",
                "砂",
                "岩"
            ],
            correctAnswerIndex: 0,
            explanation: "地球の表面の約70%は水で覆われています。"
        ),

        QuizQuestion(
            question: "金属が錆びる原因は何ですか？",
            choices: [
                "酸素と水分に触れること",
                "日光に当たること",
                "空気中の窒素と反応すること",
                "温度が下がること"
            ],
            correctAnswerIndex: 0,
            explanation: "金属が酸素と水分に触れることで酸化し、錆が発生します。"
        ),

        QuizQuestion(
            question: "電池の役割は何ですか？",
            choices: [
                "電気エネルギーを供給する",
                "光を発する",
                "音を作る",
                "温度を調整する"
            ],
            correctAnswerIndex: 0,
            explanation: "電池は化学エネルギーを電気エネルギーに変換し、電力を供給します。"
        ),

        QuizQuestion(
            question: "低気圧が近づくと、天気はどうなりますか？",
            choices: [
                "雨が降りやすくなる",
                "晴れが続く",
                "風が止む",
                "気温が上がる"
            ],
            correctAnswerIndex: 0,
            explanation: "低気圧が近づくと、空気が上昇し、雲ができて雨が降りやすくなります。"
        ),

        QuizQuestion(
            question: "地震の震源に最も近い場所を何といいますか？",
            choices: [
                "震央",
                "断層",
                "マグマ溜まり",
                "火口"
            ],
            correctAnswerIndex: 0,
            explanation: "震源に最も近い地表の地点を「震央」と呼びます。"
        ),
        QuizQuestion(
            question: "月が満ち欠けする理由は何ですか？",
            choices: [
                "地球が自転しているから",
                "月と太陽の位置関係が変わるから",
                "月が公転しているから",
                "地球の影が月にかかるから"
            ],
            correctAnswerIndex: 1,
            explanation: "月の満ち欠けは、月と太陽と地球の位置関係が変化するために起こります。"
        ),

        QuizQuestion(
            question: "雷が鳴るのはどのような現象ですか？",
            choices: [
                "雲と地面の間に電気が流れるから",
                "風が強く吹くから",
                "雲がぶつかり合うから",
                "気圧が低くなるから"
            ],
            correctAnswerIndex: 2,
            explanation: "雷は雲と地面、または雲同士の間で電気が流れることで発生します。"
        ),

        QuizQuestion(
            question: "風向きが変わる主な原因は何ですか？",
            choices: [
                "地球の公転",
                "気圧の変化",
                "季節の変化",
                "月の満ち欠け"
            ],
            correctAnswerIndex: 1,
            explanation: "風向きは気圧の変化によって主に変わります。"
        ),

        QuizQuestion(
            question: "溶岩が冷えて固まったときにできる岩石を何といいますか？",
            choices: [
                "砂岩",
                "玄武岩",
                "石灰岩",
                "チャート"
            ],
            correctAnswerIndex: 1,
            explanation: "溶岩が冷えて固まった岩石を玄武岩と呼びます。"
        ),

        QuizQuestion(
            question: "動物が冬眠する理由は何ですか？",
            choices: [
                "成長を促進するため",
                "食料不足を避けるため",
                "外敵から逃れるため",
                "気温が高くなるから"
            ],
            correctAnswerIndex: 1,
            explanation: "動物は冬眠することで、寒い季節の食料不足を避けます。"
        ),

        QuizQuestion(
            question: "雲が形成される条件は何ですか？",
            choices: [
                "風が強い",
                "空気中の水蒸気が冷えて水滴になる",
                "太陽の光が強い",
                "気圧が高い"
            ],
            correctAnswerIndex: 1,
            explanation: "雲は空気中の水蒸気が冷やされて凝結し、水滴になることで形成されます。"
        ),

        QuizQuestion(
            question: "川が上流から下流にかけて削って運んだ土や岩が積み重なる現象を何といいますか？",
            choices: [
                "侵食",
                "堆積",
                "風化",
                "溶解"
            ],
            correctAnswerIndex: 1,
            explanation: "川が削った土や岩が運ばれ、下流で積み重なる現象を堆積といいます。"
        ),

        QuizQuestion(
            question: "太陽のエネルギー源は何ですか？",
            choices: [
                "核融合",
                "燃焼",
                "放射線",
                "重力"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽のエネルギー源は水素がヘリウムに変わる核融合反応です。"
        ),

        QuizQuestion(
            question: "海が青く見えるのはなぜですか？",
            choices: [
                "空の青さを反射しているから",
                "海水が青いから",
                "海中の生物が発光しているから",
                "太陽の光が反射しているから"
            ],
            correctAnswerIndex: 0,
            explanation: "海が青く見えるのは、空の青さを反射しているためです。"
        ),

        QuizQuestion(
            question: "太陽系の惑星の中で最も大きいのはどれですか？",
            choices: [
                "金星",
                "木星",
                "土星",
                "火星"
            ],
            correctAnswerIndex: 1,
            explanation: "木星は太陽系の惑星の中で最も大きな惑星です。"
        ),
        QuizQuestion(
            question: "雨が降った後、地面が乾くのはなぜですか？",
            choices: [
                "水が蒸発するから",
                "風が吹くから",
                "太陽が当たるから",
                "水が吸収されるから"
            ],
            correctAnswerIndex: 0,
            explanation: "雨の後、地面の水分は太陽や風の影響で蒸発し、空気中に戻ります。"
        ),

        QuizQuestion(
            question: "植物が根から吸収する主な栄養素は何ですか？",
            choices: [
                "窒素",
                "酸素",
                "二酸化炭素",
                "水蒸気"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は土壌から窒素を吸収し、成長に必要な栄養を得ます。"
        ),

        QuizQuestion(
            question: "電気回路で使われる抵抗器の主な役割は何ですか？",
            choices: [
                "電流を制御する",
                "電力を増加させる",
                "電圧を供給する",
                "電流を保存する"
            ],
            correctAnswerIndex: 0,
            explanation: "抵抗器は電流の流れを制御し、回路内での電流の量を調整します。"
        ),

        QuizQuestion(
            question: "風が強く吹く原因は何ですか？",
            choices: [
                "気圧の差",
                "温度の変化",
                "地球の自転",
                "日光の強さ"
            ],
            correctAnswerIndex: 0,
            explanation: "風は高気圧から低気圧へ空気が流れることで発生します。"
        ),

        QuizQuestion(
            question: "動物が日陰に隠れる主な理由は何ですか？",
            choices: [
                "体温を下げるため",
                "食べ物を探すため",
                "外敵から身を守るため",
                "成長するため"
            ],
            correctAnswerIndex: 0,
            explanation: "日陰に隠れることで動物は体温を下げ、熱から身を守ります。"
        ),

        QuizQuestion(
            question: "宇宙空間が真空である理由は何ですか？",
            choices: [
                "空気が存在しないから",
                "太陽がないから",
                "重力がないから",
                "気圧が低いから"
            ],
            correctAnswerIndex: 0,
            explanation: "宇宙空間には空気がなく、物質がほとんど存在しないため、真空状態になります。"
        ),

        QuizQuestion(
            question: "地球が公転することによって起こる現象は何ですか？",
            choices: [
                "季節の変化",
                "昼と夜の変化",
                "月の満ち欠け",
                "風の吹き方"
            ],
            correctAnswerIndex: 0,
            explanation: "地球が太陽の周りを公転することにより、季節の変化が起こります。"
        ),

        QuizQuestion(
            question: "化石燃料が燃焼するときに発生する気体は何ですか？",
            choices: [
                "二酸化炭素",
                "酸素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 0,
            explanation: "化石燃料が燃焼すると、二酸化炭素が発生します。"
        ),

        QuizQuestion(
            question: "光が異なる物質に入るときに屈折するのはなぜですか？",
            choices: [
                "光の速度が変わるから",
                "光のエネルギーが増えるから",
                "物質が光を吸収するから",
                "光が反射するから"
            ],
            correctAnswerIndex: 0,
            explanation: "光が異なる物質に入ると、その物質内での光の速度が変わるため、屈折が起こります。"
        ),

        QuizQuestion(
            question: "地震が発生したときに生じる最初の揺れを何といいますか？",
            choices: [
                "初期微動",
                "余震",
                "本震",
                "震源"
            ],
            correctAnswerIndex: 0,
            explanation: "地震が発生したときに最初に感じる小さな揺れを「初期微動」といいます。"
        ),
        QuizQuestion(
            question: "天気予報で使われる気圧の単位は何ですか？",
            choices: [
                "ヘクトパスカル",
                "キログラム",
                "ニュートン",
                "リットル"
            ],
            correctAnswerIndex: 0,
            explanation: "気圧はヘクトパスカルという単位で表されます。"
        ),

        QuizQuestion(
            question: "植物の根はどのような役割を果たしますか？",
            choices: [
                "水と栄養を吸収する",
                "光合成を行う",
                "酸素を作り出す",
                "花を咲かせる"
            ],
            correctAnswerIndex: 0,
            explanation: "植物の根は土から水と栄養を吸収する役割を果たします。"
        ),

        QuizQuestion(
            question: "太陽が地平線の下に沈んだ後、空が赤く見えるのはなぜですか？",
            choices: [
                "大気が光を散乱するから",
                "地球が回転しているから",
                "太陽が冷えているから",
                "雲が多いから"
            ],
            correctAnswerIndex: 0,
            explanation: "大気中の塵や水蒸気が太陽光を散乱し、特に赤い光が見えやすくなります。"
        ),

        QuizQuestion(
            question: "月食はどのようにして起こりますか？",
            choices: [
                "地球の影が月にかかる",
                "月が太陽の前を通る",
                "月が自ら光を放つ",
                "地球が月を追い越す"
            ],
            correctAnswerIndex: 0,
            explanation: "月食は地球の影が月にかかることで起こります。"
        ),

        QuizQuestion(
            question: "山や高い場所で空気が薄くなるのはなぜですか？",
            choices: [
                "気圧が低くなるから",
                "気温が低いから",
                "酸素がなくなるから",
                "重力が弱くなるから"
            ],
            correctAnswerIndex: 0,
            explanation: "山や高い場所では気圧が低くなるため、空気が薄く感じられます。"
        ),

        QuizQuestion(
            question: "雲が形成されるのはどのような状況ですか？",
            choices: [
                "水蒸気が冷やされて凝結する",
                "太陽が雲を作る",
                "風が強いとき",
                "空気が温かいとき"
            ],
            correctAnswerIndex: 0,
            explanation: "雲は空気中の水蒸気が冷やされて水滴や氷の粒に変わるときに形成されます。"
        ),

        QuizQuestion(
            question: "電気を通さない物質は次のうちどれですか？",
            choices: [
                "プラスチック",
                "鉄",
                "銅",
                "アルミニウム"
            ],
            correctAnswerIndex: 0,
            explanation: "プラスチックは電気を通さない絶縁体です。"
        ),

        QuizQuestion(
            question: "星が点滅して見えるのはなぜですか？",
            choices: [
                "大気の影響で光が屈折するから",
                "星自体が点滅しているから",
                "地球が回転しているから",
                "雲が動いているから"
            ],
            correctAnswerIndex: 0,
            explanation: "星の光は大気の影響で屈折し、点滅しているように見えます。"
        ),

        QuizQuestion(
            question: "川の上流から流れてくる土や石が下流に運ばれる現象を何といいますか？",
            choices: [
                "浸食",
                "堆積",
                "侵入",
                "崩壊"
            ],
            correctAnswerIndex: 0,
            explanation: "川の上流から流れてくる土や石が運ばれる現象は「浸食」と呼ばれます。"
        ),

        QuizQuestion(
            question: "動物が冬眠をする主な理由は何ですか？",
            choices: [
                "寒さから体を守るため",
                "食べ物を探すため",
                "成長するため",
                "繁殖するため"
            ],
            correctAnswerIndex: 0,
            explanation: "動物は寒さや食料不足から体を守るために冬眠を行います。"
        ),
        QuizQuestion(
            question: "水が0度になるとどのような変化が起こりますか？",
            choices: [
                "凍る",
                "沸騰する",
                "溶ける",
                "蒸発する"
            ],
            correctAnswerIndex: 0,
            explanation: "水は0度で氷になり、固体に変化します。"
        ),

        QuizQuestion(
            question: "空気中の水蒸気が冷やされるとどうなりますか？",
            choices: [
                "雲になる",
                "蒸発する",
                "水になる",
                "雪になる"
            ],
            correctAnswerIndex: 2,
            explanation: "空気中の水蒸気が冷やされると水に戻り、液体になります。"
        ),

        QuizQuestion(
            question: "植物はどのようにして光合成を行いますか？",
            choices: [
                "酸素を取り込む",
                "水と二酸化炭素を使う",
                "土から栄養を吸収する",
                "太陽の熱を使う"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は光合成で水と二酸化炭素を使い、酸素と栄養を作り出します。"
        ),

        QuizQuestion(
            question: "嵐のとき、大気中で発生する現象はどれですか？",
            choices: [
                "雷",
                "雪",
                "地震",
                "火山噴火"
            ],
            correctAnswerIndex: 0,
            explanation: "嵐の際に雷が発生することがあります。"
        ),

        QuizQuestion(
            question: "火山が噴火したときに地表に出てくるものは何ですか？",
            choices: [
                "マグマ",
                "水蒸気",
                "地震",
                "石油"
            ],
            correctAnswerIndex: 0,
            explanation: "火山が噴火すると、マグマが地表に出てきて溶岩になります。"
        ),

        QuizQuestion(
            question: "台風が発生する場所はどこですか？",
            choices: [
                "海の上",
                "山の上",
                "砂漠",
                "北極"
            ],
            correctAnswerIndex: 0,
            explanation: "台風は海の上で暖かい水蒸気を含んだ空気が上昇することで発生します。"
        ),

        QuizQuestion(
            question: "夏の晴れた日に、地面がとても熱くなるのはなぜですか？",
            choices: [
                "太陽の光を吸収するから",
                "空気が重いから",
                "地球が自転しているから",
                "風が吹いているから"
            ],
            correctAnswerIndex: 0,
            explanation: "地面は太陽の光を吸収して熱くなります。"
        ),

        QuizQuestion(
            question: "月はどうして光って見えるのですか？",
            choices: [
                "太陽の光を反射しているから",
                "月自体が光っているから",
                "星の光を集めているから",
                "地球の影がかかっているから"
            ],
            correctAnswerIndex: 0,
            explanation: "月は太陽の光を反射して光って見えます。"
        ),

        QuizQuestion(
            question: "空気中に含まれている気体の主な成分は何ですか？",
            choices: [
                "酸素",
                "窒素",
                "二酸化炭素",
                "水蒸気"
            ],
            correctAnswerIndex: 1,
            explanation: "空気の主な成分は窒素で、約78%を占めています。"
        ),
        QuizQuestion(
            question: "水が100度になるとどうなりますか？",
            choices: [
                "蒸発する",
                "氷になる",
                "溶ける",
                "燃える"
            ],
            correctAnswerIndex: 0,
            explanation: "水は100度になると沸騰し、蒸発して水蒸気になります。"
        ),

        QuizQuestion(
            question: "低気圧が近づくと、天気はどうなりますか？",
            choices: [
                "雨が降る",
                "晴れる",
                "風が止む",
                "雪が降る"
            ],
            correctAnswerIndex: 0,
            explanation: "低気圧が近づくと空気が上昇し、雲ができやすくなり、雨が降りやすくなります。"
        ),

        QuizQuestion(
            question: "砂漠に住む動物はどのようにして水を節約しますか？",
            choices: [
                "あまり汗をかかない",
                "たくさん汗をかく",
                "水を飲まない",
                "日陰に隠れる"
            ],
            correctAnswerIndex: 0,
            explanation: "砂漠に住む動物は、汗をあまりかかずに水分を節約する適応があります。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika6, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika6ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika6ListView(isPresenting: .constant(false))
    }
}
