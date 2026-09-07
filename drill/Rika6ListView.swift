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
        QuizQuestion.fillInBlank(
            question: "【穴うめ】ものが 燃えるときに 必要な 気体を答えましょう。",
            answer: "酸素",
            acceptableAnswers: ["さんそ"],
            explanation: "ものが 燃えるときには 『酸素』が 必要です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】火山から 流れ出る どろどろした 岩を答えましょう。",
            answer: "溶岩",
            acceptableAnswers: ["ようがん"],
            explanation: "火山から 流れ出る 高温の 岩を『溶岩』といいます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】体の 器官と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "肺", match: "酸素を 取り入れる"),
                QuizMatchingPair(prompt: "胃", match: "食べ物を 消化する"),
                QuizMatchingPair(prompt: "心臓", match: "血液を 送る")
            ],
            choices: ["血液を 送る", "食べ物を 消化する", "酸素を 取り入れる"],
            explanation: "肺は 呼吸、胃は 消化、心臓は 血液を送る はたらきをします。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】わく星と 特ちょうが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "水星", match: "太陽に いちばん近い"),
                QuizMatchingPair(prompt: "地球", match: "水と 空気が ある"),
                QuizMatchingPair(prompt: "木星", match: "いちばん大きい")
            ],
            choices: ["水と 空気が ある", "いちばん大きい", "太陽に いちばん近い"],
            explanation: "水星は 太陽に近く、地球には 水と空気があり、木星は とても大きい わく星です。"
        ),

        QuizQuestion.classification(
            question: "【分類】岩石を 『火成岩』『堆積岩』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "花こう岩", match: "火成岩"),
                QuizMatchingPair(prompt: "砂岩", match: "堆積岩"),
                QuizMatchingPair(prompt: "れき岩", match: "堆積岩")
            ],
            categories: ["火成岩", "堆積岩"],
            explanation: "花こう岩は 火成岩、砂岩と れき岩は 堆積岩です。"
        ),

        QuizQuestion.classification(
            question: "【分類】体の はたらきを 『呼吸』『消化』『循環』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "肺", match: "呼吸"),
                QuizMatchingPair(prompt: "胃", match: "消化"),
                QuizMatchingPair(prompt: "心臓", match: "循環")
            ],
            categories: ["呼吸", "消化", "循環"],
            explanation: "肺は 呼吸、胃は 消化、心臓は 循環に 関係します。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】食べ物の 通り道を じゅんに ならべましょう。",
            choices: ["小腸", "口", "胃"],
            orderedChoices: ["口", "胃", "小腸"],
            explanation: "食べ物は 口から入り、胃を通って 小腸へ 進みます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】わく星を 大きいじゅんに ならべましょう。",
            choices: ["地球", "木星", "火星"],
            rankedChoices: ["木星", "地球", "火星"],
            explanation: "大きさをくらべると、木星、地球、火星の順です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】てこで 力を 加える 点を答えましょう。",
            answer: "力点",
            acceptableAnswers: ["りきてん"],
            explanation: "てこで 人が力を加える点を『力点』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】食べ物の 養分を 体じゅうに 運ぶ 液体を答えましょう。",
            answer: "血液",
            acceptableAnswers: ["けつえき"],
            explanation: "血液は 養分や 酸素を 体じゅうに運びます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】てこの 三点と 役目が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "支点", match: "てこを 支える"),
                QuizMatchingPair(prompt: "力点", match: "力を 加える"),
                QuizMatchingPair(prompt: "作用点", match: "ものを 動かす")
            ],
            choices: ["ものを 動かす", "てこを 支える", "力を 加える"],
            explanation: "支点は 支える点、力点は 力を加える点、作用点は ものを動かす点です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】水よう液と 性質が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "塩酸", match: "金属を とかす"),
                QuizMatchingPair(prompt: "石灰水", match: "二酸化炭素で 白くにごる"),
                QuizMatchingPair(prompt: "炭酸水", match: "あわが 出る")
            ],
            choices: ["あわが 出る", "金属を とかす", "二酸化炭素で 白くにごる"],
            explanation: "塩酸、石灰水、炭酸水には それぞれ ちがう性質があります。"
        ),

        QuizQuestion.classification(
            question: "【分類】水よう液を 『酸性』『中性』『アルカリ性』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "塩酸", match: "酸性"),
                QuizMatchingPair(prompt: "食塩水", match: "中性"),
                QuizMatchingPair(prompt: "石灰水", match: "アルカリ性")
            ],
            categories: ["酸性", "中性", "アルカリ性"],
            explanation: "塩酸は 酸性、食塩水は 中性、石灰水は アルカリ性です。"
        ),

        QuizQuestion.classification(
            question: "【分類】体の 器官を 『運動』『消化』『呼吸』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "筋肉", match: "運動"),
                QuizMatchingPair(prompt: "小腸", match: "消化"),
                QuizMatchingPair(prompt: "肺", match: "呼吸")
            ],
            categories: ["運動", "消化", "呼吸"],
            explanation: "筋肉は 運動、小腸は 消化、肺は 呼吸に 関係します。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】だ液の はたらきを 調べる 実験の 手順を じゅんに ならべましょう。",
            choices: ["ヨウ素液を 入れる", "でんぷんを 入れる", "だ液を 混ぜる"],
            orderedChoices: ["でんぷんを 入れる", "だ液を 混ぜる", "ヨウ素液を 入れる"],
            explanation: "でんぷんに だ液を混ぜてから、ヨウ素液で 変化を調べます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】惑星を 太陽に 近いじゅんに ならべましょう。",
            choices: ["土星", "地球", "水星"],
            rankedChoices: ["水星", "地球", "土星"],
            explanation: "太陽に近い順に 並べると、水星、地球、土星です。"
        ),

        QuizQuestion(
            question: "植物が光合成を行うために必要な物質の組み合わせはどれですか？",
            choices: [
                "酸素と窒素",
                "水と窒素",
                "二酸化炭素と水",
                "酸素と炭素"
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
                "溶岩",
                "岩石"
            ],
            correctAnswerIndex: 2,
            explanation: "地下のマグマが地表に出たものを溶岩といいます。"
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 0,
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
            correctAnswerIndex: 0,
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
            correctAnswerIndex: 0,
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

        QuizQuestion(
        question: "木炭は、炎を出さずに赤く光りながら燃えることがあります。このことから分かることはどれですか？",
        choices: [
        "炎が見えなくても、酸素と結びついて熱を出していれば燃焼している",
        "炎が見えない物質は、燃焼することがない",
        "木炭は酸素を使わずに燃える",
        "赤く光る物質は、すべて電気で光っている"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「炎が見えなくても、酸素と結びついて熱を出していれば燃焼している」です。燃焼では必ずしも炎が出るとは限らず、木炭のように赤く光りながら燃える物質もあります。"
        ),

        QuizQuestion(
        question: "木片を燃やす前と燃やした後の空気を比べたとき、割合の変化が最も小さい気体はどれですか？",
        choices: [
        "酸素",
        "窒素",
        "二酸化炭素",
        "水蒸気"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「窒素」です。木片の燃焼では主に酸素が使われ、二酸化炭素や水ができますが、窒素の割合はほとんど変わりません。"
        ),

        QuizQuestion.related(
        question: "【関連付け】気体と、その性質を確かめる方法や結果を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "酸素", match: "火の消えかかった線香を入れると、再び激しく燃える"),
        QuizMatchingPair(prompt: "二酸化炭素", match: "石灰水に通すと、白くにごる"),
        QuizMatchingPair(prompt: "窒素", match: "線香の火が消え、石灰水はにごらない"),
        QuizMatchingPair(prompt: "水蒸気", match: "冷たい物に触れると、水滴になる")
        ],
        choices: [
        "石灰水に通すと、白くにごる",
        "冷たい物に触れると、水滴になる",
        "火の消えかかった線香を入れると、再び激しく燃える",
        "線香の火が消え、石灰水はにごらない"
        ],
        explanation: "酸素は「火の消えかかった線香を入れると、再び激しく燃える」、二酸化炭素は「石灰水に通すと、白くにごる」、窒素は「線香の火が消え、石灰水はにごらない」、水蒸気は「冷たい物に触れると、水滴になる」と組み合わせます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ろうそくを燃やす前後の空気の変化を調べる実験の手順を順番に並べましょう。",
        choices: [
        "火が消えた後、装置を十分に冷ます",
        "燃やす前の空気に含まれる気体の割合を調べる",
        "ろうそくに火をつけ、集気びんをかぶせる",
        "燃やした後の気体の割合を調べ、燃やす前と比べる"
        ],
        orderedChoices: [
        "燃やす前の空気に含まれる気体の割合を調べる",
        "ろうそくに火をつけ、集気びんをかぶせる",
        "火が消えた後、装置を十分に冷ます",
        "燃やした後の気体の割合を調べ、燃やす前と比べる"
        ],
        explanation: "「燃やす前の空気に含まれる気体の割合を調べる」「ろうそくに火をつけ、集気びんをかぶせる」「火が消えた後、装置を十分に冷ます」「燃やした後の気体の割合を調べ、燃やす前と比べる」の順です。"
        ),

        QuizQuestion(
        question: "大腸の主なはたらきとして正しいものはどれですか？",
        choices: [
        "空気中から酸素を取り入れる",
        "血液を全身へ送り出す",
        "食べ物の残りから水分を吸収し、便をつくる",
        "尿を一時的にたくわえる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「食べ物の残りから水分を吸収し、便をつくる」です。大腸では、消化・吸収された後の食べ物の残りから水分が吸収されます。"
        ),

        QuizQuestion(
        question: "食べ物をよくかんでから飲み込むと、消化されやすくなる主な理由はどれですか？",
        choices: [
        "食べ物が肺へ入りやすくなるから",
        "食べ物に含まれる水がすべてなくなるから",
        "胃や小腸がはたらかなくてもよくなるから",
        "食べ物が細かくなり、だ液とよく混ざるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「食べ物が細かくなり、だ液とよく混ざるから」です。よくかむと食べ物の表面積が広くなり、消化液がはたらきやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】全身から心臓へ戻る血液が通る血管を答えましょう。",
        answer: "静脈",
        acceptableAnswers: ["じょうみゃく"],
        explanation: "全身から心臓へ戻る血液が通る血管は「静脈」です。"
        ),

        QuizQuestion.classification(
        question: "【分類】血液が運ぶものを、主に運ばれる先に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "肺で取り入れた酸素", match: "全身の細胞へ"),
        QuizMatchingPair(prompt: "小腸で吸収した養分", match: "全身の細胞へ"),
        QuizMatchingPair(prompt: "全身の細胞でできた二酸化炭素", match: "肺へ"),
        QuizMatchingPair(prompt: "血液中の不要な物質", match: "腎臓へ")
        ],
        categories: ["全身の細胞へ", "肺へ", "腎臓へ"],
        explanation: "「肺で取り入れた酸素」と「小腸で吸収した養分」は「全身の細胞へ」、「全身の細胞でできた二酸化炭素」は「肺へ」、「血液中の不要な物質」は「腎臓へ」運ばれます。"
        ),

        QuizQuestion(
        question: "同じ大きさの葉を透明な袋に入れ、一方には日光を当て、もう一方は暗くしました。光合成が行われたことを確かめる結果として最も適切なものはどれですか？",
        choices: [
        "日光を当てた袋の中で、二酸化炭素が減る",
        "日光を当てた袋の中で、酸素がすべてなくなる",
        "暗くした袋の中で、でんぷんが急に増える",
        "どちらの袋でも、気体の割合が必ず同じになる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「日光を当てた袋の中で、二酸化炭素が減る」です。光合成では二酸化炭素が使われ、酸素がつくられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】葉のでんぷんを調べる実験の条件と、確かめられることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "葉の一部をアルミ箔でおおう", match: "日光が必要かを確かめる"),
        QuizMatchingPair(prompt: "斑入りの葉の緑色部分と白色部分を比べる", match: "緑色の部分が必要かを確かめる"),
        QuizMatchingPair(prompt: "二酸化炭素のある場合とない場合を比べる", match: "二酸化炭素が必要かを確かめる"),
        QuizMatchingPair(prompt: "実験前に植物を暗い場所へ置く", match: "葉にすでにあるでんぷんを減らす")
        ],
        choices: [
        "二酸化炭素が必要かを確かめる",
        "葉にすでにあるでんぷんを減らす",
        "日光が必要かを確かめる",
        "緑色の部分が必要かを確かめる"
        ],
        explanation: "葉の一部をアルミ箔でおおうと「日光が必要か」、斑入りの葉を使うと「緑色の部分が必要か」、二酸化炭素の有無を変えると「二酸化炭素が必要か」を確かめられます。実験前に暗い場所へ置くのは「葉にすでにあるでんぷんを減らす」ためです。"
        ),

        QuizQuestion.classification(
        question: "【分類】植物のはたらきについて、「光合成」と「呼吸」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "光のエネルギーを使って養分をつくる", match: "光合成"),
        QuizMatchingPair(prompt: "二酸化炭素を取り入れて酸素を出す", match: "光合成"),
        QuizMatchingPair(prompt: "養分と酸素を使って活動に必要なエネルギーを得る", match: "呼吸"),
        QuizMatchingPair(prompt: "昼も夜も行われる", match: "呼吸")
        ],
        categories: ["光合成", "呼吸"],
        explanation: "「光のエネルギーを使って養分をつくる」と「二酸化炭素を取り入れて酸素を出す」は「光合成」、「養分と酸素を使ってエネルギーを得る」と「昼も夜も行われる」は「呼吸」に分類します。"
        ),

        QuizQuestion(
        question: "川が湖へ流れ込む場所では、れき・砂・泥はどのように積もりやすいですか？",
        choices: [
        "泥が河口近くに積もり、れきが最も遠くまで運ばれる",
        "れきや砂は河口に近い所、泥はより遠い所に積もりやすい",
        "れき・砂・泥は、必ず同じ場所に同じ厚さで積もる",
        "粒の大きさに関係なく、すべて水面に浮き続ける"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「れきや砂は河口に近い所、泥はより遠い所に積もりやすい」です。流れが弱くなると大きく重い粒から先に沈み、細かい泥は遠くまで運ばれます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地下の地層を調べるため、地面を深く掘って筒状に取り出した試料を何といいますか？",
        answer: "ボーリング試料",
        acceptableAnswers: ["ボーリングしりょう", "ぼーりんぐしりょう"],
        explanation: "地下の地層を調べるために筒状に取り出した試料を「ボーリング試料」といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】海にすむ生物の体が化石になり、地表で見つかるまでを順番に並べましょう。",
        choices: [
        "地層が持ち上がり、風化や侵食によって化石が地表に現れる",
        "生物の死がいが海底に沈む",
        "上から砂や泥が積もり、死がいが埋まる",
        "堆積物が固まり、硬い部分が地層の中に残る"
        ],
        orderedChoices: [
        "生物の死がいが海底に沈む",
        "上から砂や泥が積もり、死がいが埋まる",
        "堆積物が固まり、硬い部分が地層の中に残る",
        "地層が持ち上がり、風化や侵食によって化石が地表に現れる"
        ],
        explanation: "「生物の死がいが海底に沈む」「上から砂や泥が積もり、死がいが埋まる」「堆積物が固まり、硬い部分が地層の中に残る」「地層が持ち上がり、風化や侵食によって化石が地表に現れる」の順です。"
        ),

        QuizQuestion(
        question: "ねばりけの弱いマグマからできやすい火山の形として、最も適切なものはどれですか？",
        choices: [
        "頂上だけが針のように細い形",
        "必ず地下にだけ広がり、地表には山をつくらない形",
        "溶岩が遠くまで流れ、傾斜がゆるやかに広がる形",
        "噴火するたびに山全体が消える形"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「溶岩が遠くまで流れ、傾斜がゆるやかに広がる形」です。ねばりけの弱いマグマは流れやすいため、すそ野の広い火山をつくりやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】火山の地下で、マグマがたまっている場所を何といいますか？",
        answer: "マグマだまり",
        acceptableAnswers: ["まぐまだまり"],
        explanation: "火山の地下でマグマがたまっている場所を「マグマだまり」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】火山から出るものを、その状態に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "火山灰", match: "固体の粒"),
        QuizMatchingPair(prompt: "火山れき", match: "固体の粒"),
        QuizMatchingPair(prompt: "溶岩", match: "液体状"),
        QuizMatchingPair(prompt: "火山ガス", match: "気体")
        ],
        categories: ["固体の粒", "液体状", "気体"],
        explanation: "「火山灰」と「火山れき」は「固体の粒」、「溶岩」は「液体状」、「火山ガス」は「気体」に分類します。"
        ),

        QuizQuestion(
        question: "大きな地震の後、同じ地域で続いて起こることがある地震を何といいますか？",
        choices: [
        "本震",
        "津波",
        "液状化",
        "余震"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「余震」です。大きな地震の後には余震が続くことがあるため、倒れかけた建物などに近づかず、引き続き安全を確保する必要があります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地震のときに注意する場所と、起こりやすい災害を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "海岸や河口の近く", match: "津波"),
        QuizMatchingPair(prompt: "急な崖や山の斜面", match: "崖崩れや土砂崩れ"),
        QuizMatchingPair(prompt: "水を多く含むやわらかい地盤", match: "液状化"),
        QuizMatchingPair(prompt: "建物が密集する市街地", match: "火災の広がり")
        ],
        choices: [
        "液状化",
        "火災の広がり",
        "津波",
        "崖崩れや土砂崩れ"
        ],
        explanation: "海岸や河口の近くでは「津波」、急な崖や山の斜面では「崖崩れや土砂崩れ」、水を多く含むやわらかい地盤では「液状化」、建物が密集する市街地では「火災の広がり」に注意します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】海岸近くの学校で強い地震が起きたときの行動を順番に並べましょう。",
        choices: [
        "津波警報などが解除されるまで安全な場所にとどまる",
        "揺れが収まるまで机の下などで頭を守る",
        "先生の指示を聞き、避難経路を確認する",
        "海から離れた高い場所へ避難する"
        ],
        orderedChoices: [
        "揺れが収まるまで机の下などで頭を守る",
        "先生の指示を聞き、避難経路を確認する",
        "海から離れた高い場所へ避難する",
        "津波警報などが解除されるまで安全な場所にとどまる"
        ],
        explanation: "「揺れが収まるまで机の下などで頭を守る」「先生の指示を聞き、避難経路を確認する」「海から離れた高い場所へ避難する」「津波警報などが解除されるまで安全な場所にとどまる」の順です。"
        ),

        QuizQuestion(
        question: "日本で上弦の月を夕方に観察すると、明るく見えるのは主に月のどちら側ですか？",
        choices: [
        "右側",
        "左側",
        "上側だけ",
        "下側だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「右側」です。日本で夕方に見える上弦の月は、太陽のある西側を向いた右半分が明るく見えます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】月の形と、見つけやすい時刻・方角を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "三日月", match: "日没後の西の低い空"),
        QuizMatchingPair(prompt: "上弦の月", match: "夕方の南の空"),
        QuizMatchingPair(prompt: "満月", match: "日没ごろの東の空"),
        QuizMatchingPair(prompt: "下弦の月", match: "明け方の南の空")
        ],
        choices: [
        "明け方の南の空",
        "日没ごろの東の空",
        "日没後の西の低い空",
        "夕方の南の空"
        ],
        explanation: "三日月は「日没後の西の低い空」、上弦の月は「夕方の南の空」、満月は「日没ごろの東の空」、下弦の月は「明け方の南の空」で見つけやすくなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】新月の後に現れる月を、新月からの日数が短い順に並べましょう。",
        choices: [
        "下弦の月",
        "三日月",
        "満月",
        "上弦の月"
        ],
        rankedChoices: [
        "三日月",
        "上弦の月",
        "満月",
        "下弦の月"
        ],
        explanation: "新月の後は「三日月」「上弦の月」「満月」「下弦の月」の順に見え方が変わります。"
        ),

        QuizQuestion(
        question: "二つの手回し発電機を導線でつなぎ、一方のハンドルを回すと、もう一方のハンドルも回りました。回している発電機の向きを反対にすると、もう一方はどうなりますか？",
        choices: [
        "必ず回らなくなる",
        "回る向きが反対になる",
        "回る速さだけが必ず2倍になる",
        "導線を外しても同じように回り続ける"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「回る向きが反対になる」です。手回し発電機を反対向きに回すと電流の向きが変わるため、もう一方の発電機も反対向きに回ります。"
        ),

        QuizQuestion(
        question: "同じ明るさを得るために、白熱電球の代わりに発光ダイオードを使う利点として最も適切なものはどれですか？",
        choices: [
        "電気を全く使わずに光る",
        "どちら向きにつないでも必ず同じように光る",
        "少ない電気で光り、熱として失われるエネルギーも少ない",
        "使うほど電気をつくり出す"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「少ない電気で光り、熱として失われるエネルギーも少ない」です。発光ダイオードは、白熱電球より効率よく電気を光に変えられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】少ない電気で明るく光り、電流を流す向きが決まっている部品を何といいますか？",
        answer: "発光ダイオード",
        acceptableAnswers: ["LED", "エルイーディー", "はっこうダイオード"],
        explanation: "少ない電気で明るく光り、電流を流す向きが決まっている部品は「発光ダイオード」です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】コンデンサーが満充電にならない範囲で、同じ手回し発電機を同じ速さで回して電気をためました。モーターが長く回る順に並べましょう。",
        choices: [
        "20回回して充電したコンデンサー",
        "50回回して充電したコンデンサー",
        "10回回して充電したコンデンサー",
        "30回回して充電したコンデンサー"
        ],
        rankedChoices: [
        "50回回して充電したコンデンサー",
        "30回回して充電したコンデンサー",
        "20回回して充電したコンデンサー",
        "10回回して充電したコンデンサー"
        ],
        explanation: "同じ速さで回す場合、回す回数が多いほどコンデンサーに多くの電気がたまり、モーターが長く回ります。したがって「50回」「30回」「20回」「10回」の順です。"
        ),

        QuizQuestion(
        question: "外国から持ち込まれた生物が野外で増えると、もともといた生物にどのような影響を与えることがありますか？",
        choices: [
        "すべての生物の種類が必ず増える",
        "もともといた生物と全く関わらない",
        "その地域の気温だけを必ず下げる",
        "えさやすみかを奪い、生態系のつり合いを変える"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「えさやすみかを奪い、生態系のつり合いを変える」です。外来種が増えると、在来種と競争したり、在来種を食べたりして、生態系に影響を与えることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】もともとその地域に生息している生物を何といいますか？",
        answer: "在来種",
        acceptableAnswers: ["ざいらいしゅ"],
        explanation: "もともとその地域に生息している生物を「在来種」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】生物多様性を守る行動と、損なうおそれのある行動に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "地域の湿地を保全する", match: "生物多様性を守る行動"),
        QuizMatchingPair(prompt: "川に魚道をつくる", match: "生物多様性を守る行動"),
        QuizMatchingPair(prompt: "飼えなくなった外国産の生物を野外へ放す", match: "生物多様性を損なうおそれのある行動"),
        QuizMatchingPair(prompt: "多くの生物がすむ干潟を埋め立てる", match: "生物多様性を損なうおそれのある行動")
        ],
        categories: ["生物多様性を守る行動", "生物多様性を損なうおそれのある行動"],
        explanation: "「地域の湿地を保全する」と「川に魚道をつくる」は「生物多様性を守る行動」、「外国産の生物を野外へ放す」と「干潟を埋め立てる」は「生物多様性を損なうおそれのある行動」に分類します。"
        ),

        QuizQuestion(
        question: "密閉したフラスコの中でスチールウールを燃やし、十分に冷めてから装置全体の質量を量りました。燃やす前と比べてどうなりますか？",
        choices: [
        "ほとんど変わらない",
        "スチールウールが燃えた分だけ軽くなる",
        "空気中の酸素が消えるため、必ず半分になる",
        "燃焼で物質が増え続けるため、必ず2倍になる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「ほとんど変わらない」です。密閉した装置では物質が外へ出入りしないため、スチールウールが酸素と結びついても装置全体の質量はほとんど変わりません。"
        ),

        QuizQuestion(
        question: "ガスバーナーの空気調節ねじを開き、空気を十分に取り入れると、炎が青くなりました。この燃え方について正しい説明はどれですか？",
        choices: [
        "酸素が不足し、すすができやすい燃え方である",
        "酸素が十分にあり、すすができにくい燃え方である",
        "燃料が全く燃えていない状態である",
        "二酸化炭素だけが燃えている状態である"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「酸素が十分にあり、すすができにくい燃え方である」です。空気を十分に取り入れると燃料が燃えやすくなり、青い炎になります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】酸素が不足した状態で燃えたとき、器具などにつく黒い粉を何といいますか？",
        answer: "すす",
        acceptableAnswers: [],
        explanation: "酸素が不足した状態で燃えたときにつく黒い粉を「すす」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】ガスバーナーの炎や燃え方の様子を「酸素が十分」と「酸素が不足」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "青い炎になる", match: "酸素が十分"),
        QuizMatchingPair(prompt: "すすがほとんどつかない", match: "酸素が十分"),
        QuizMatchingPair(prompt: "黄色く明るい炎になる", match: "酸素が不足"),
        QuizMatchingPair(prompt: "器具の底にすすがつく", match: "酸素が不足")
        ],
        categories: ["酸素が十分", "酸素が不足"],
        explanation: "「青い炎になる」と「すすがほとんどつかない」は「酸素が十分」、「黄色く明るい炎になる」と「器具の底にすすがつく」は「酸素が不足」に分類します。"
        ),

        QuizQuestion(
        question: "血液の中で、肺から取り入れた酸素を全身へ運ぶはたらきを主にするものはどれですか？",
        choices: [
        "血小板",
        "白血球",
        "赤血球",
        "消化液"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「赤血球」です。赤血球は肺で受け取った酸素を、血液の流れによって全身へ運びます。"
        ),

        QuizQuestion(
        question: "小腸で吸収された養分の多くは、血液によってまずどの器官へ運ばれ、たくわえられたり調整されたりしますか？",
        choices: [
        "肺",
        "腎臓",
        "気管",
        "肝臓"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「肝臓」です。小腸で吸収された養分の多くは血液によって肝臓へ運ばれ、たくわえられたり量を調整されたりします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】血液の成分と、主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "赤血球", match: "酸素を運ぶ"),
        QuizMatchingPair(prompt: "白血球", match: "体内に入った病原体などから体を守る"),
        QuizMatchingPair(prompt: "血小板", match: "出血したときに血を固める"),
        QuizMatchingPair(prompt: "血しょう", match: "養分や不要な物質などを運ぶ")
        ],
        choices: [
        "出血したときに血を固める",
        "養分や不要な物質などを運ぶ",
        "酸素を運ぶ",
        "体内に入った病原体などから体を守る"
        ],
        explanation: "赤血球は「酸素を運ぶ」、白血球は「体内に入った病原体などから体を守る」、血小板は「出血したときに血を固める」、血しょうは「養分や不要な物質などを運ぶ」と組み合わせます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】体の細胞でできた二酸化炭素が、息として体外へ出るまでを順番に並べましょう。",
        choices: [
        "二酸化炭素が肺の中へ移る",
        "体の細胞から二酸化炭素が出る",
        "二酸化炭素を含む血液が肺へ運ばれる",
        "二酸化炭素が息とともに体外へ出る"
        ],
        orderedChoices: [
        "体の細胞から二酸化炭素が出る",
        "二酸化炭素を含む血液が肺へ運ばれる",
        "二酸化炭素が肺の中へ移る",
        "二酸化炭素が息とともに体外へ出る"
        ],
        explanation: "「体の細胞から二酸化炭素が出る」「二酸化炭素を含む血液が肺へ運ばれる」「二酸化炭素が肺の中へ移る」「二酸化炭素が息とともに体外へ出る」の順です。"
        ),

        QuizQuestion(
        question: "鉢植えの植物を暗い場所に置いても、しばらくの間、呼吸は続きます。暗い場所での植物の気体の出入りとして正しいものはどれですか？",
        choices: [
        "酸素を取り入れ、二酸化炭素を出す",
        "二酸化炭素だけを取り入れ、気体を全く出さない",
        "酸素も二酸化炭素も全く出入りしない",
        "酸素をつくるだけで、酸素を使わない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「酸素を取り入れ、二酸化炭素を出す」です。暗い場所では光合成はできませんが、植物は呼吸を続けます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】葉のでんぷんを調べる実験で使うものと、その目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "熱湯", match: "葉のはたらきを止め、やわらかくする"),
        QuizMatchingPair(prompt: "温めたエタノール", match: "葉の緑色を取り除く"),
        QuizMatchingPair(prompt: "水", match: "脱色した葉を洗い、やわらかくする"),
        QuizMatchingPair(prompt: "ヨウ素液", match: "でんぷんがあるかを確かめる")
        ],
        choices: [
        "でんぷんがあるかを確かめる",
        "葉の緑色を取り除く",
        "葉のはたらきを止め、やわらかくする",
        "脱色した葉を洗い、やわらかくする"
        ],
        explanation: "熱湯は「葉のはたらきを止め、やわらかくする」、温めたエタノールは「葉の緑色を取り除く」、水は「脱色した葉を洗い、やわらかくする」、ヨウ素液は「でんぷんがあるかを確かめる」と組み合わせます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】土の中の水が植物に取り入れられ、水蒸気として空気中へ出るまでを順番に並べましょう。",
        choices: [
        "水が葉に届く",
        "根毛が土の中の水を取り入れる",
        "水が気孔から水蒸気として出る",
        "水が道管を通って上へ運ばれる"
        ],
        orderedChoices: [
        "根毛が土の中の水を取り入れる",
        "水が道管を通って上へ運ばれる",
        "水が葉に届く",
        "水が気孔から水蒸気として出る"
        ],
        explanation: "「根毛が土の中の水を取り入れる」「水が道管を通って上へ運ばれる」「水が葉に届く」「水が気孔から水蒸気として出る」の順です。"
        ),

        QuizQuestion(
        question: "地層Aと、その上に重なる地層Bを一本の断層が切っていました。地層や断層が逆転していないとき、できた時期について正しいものはどれですか？",
        choices: [
        "断層が最も古く、その後に地層Aと地層Bができた",
        "地層Aと地層Bができた後に、断層ができた",
        "地層B、地層A、断層の順にできた",
        "地層と断層は必ず同時にできた"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「地層Aと地層Bができた後に、断層ができた」です。断層が二つの地層を切っているため、断層はそれらの地層より後にできたと考えられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地層が崖や道路の切り通しなどに現れ、直接観察できる場所を何といいますか？",
        answer: "露頭",
        acceptableAnswers: ["ろとう"],
        explanation: "地層が地表に現れ、直接観察できる場所を「露頭」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】岩石や土地が変化する例を「風化」と「侵食」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "昼夜の温度差で岩にひびが入る", match: "風化"),
        QuizMatchingPair(prompt: "植物の根が岩の割れ目を広げる", match: "風化"),
        QuizMatchingPair(prompt: "川の流れが岸をけずる", match: "侵食"),
        QuizMatchingPair(prompt: "波が海岸の崖をけずる", match: "侵食")
        ],
        categories: ["風化", "侵食"],
        explanation: "「昼夜の温度差で岩にひびが入る」と「植物の根が岩の割れ目を広げる」は「風化」、「川の流れが岸をけずる」と「波が海岸の崖をけずる」は「侵食」に分類します。"
        ),

        QuizQuestion(
        question: "マグマが冷え固まってできる岩石では、冷える速さと結晶の大きさにどのような関係がありますか？",
        choices: [
        "速く冷えるほど、結晶は必ず大きくなる",
        "冷える速さと結晶の大きさには関係がない",
        "ゆっくり冷えるほど、結晶は大きくなりやすい",
        "ゆっくり冷えると、結晶は全くできない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「ゆっくり冷えるほど、結晶は大きくなりやすい」です。地下深くなどでマグマがゆっくり冷えると、結晶が成長する時間が長くなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】高温の火山灰・岩石・火山ガスなどが混ざり合い、山の斜面を高速で流れ下る現象を何といいますか？",
        answer: "火砕流",
        acceptableAnswers: ["かさいりゅう"],
        explanation: "高温の火山灰・岩石・火山ガスなどが混ざり合って高速で流れ下る現象を「火砕流」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】火山と人々の生活との関わりを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "温泉", match: "地下の熱で温められた水を利用する"),
        QuizMatchingPair(prompt: "地熱発電", match: "地下の熱や蒸気で発電する"),
        QuizMatchingPair(prompt: "火山灰を含む土", match: "性質に合う作物の栽培に利用される"),
        QuizMatchingPair(prompt: "火山岩", match: "建物や庭などの石材に利用される")
        ],
        choices: [
        "建物や庭などの石材に利用される",
        "地下の熱や蒸気で発電する",
        "性質に合う作物の栽培に利用される",
        "地下の熱で温められた水を利用する"
        ],
        explanation: "温泉は「地下の熱で温められた水を利用する」、地熱発電は「地下の熱や蒸気で発電する」、火山灰を含む土は「性質に合う作物の栽培に利用される」、火山岩は「建物や庭などの石材に利用される」と組み合わせます。"
        ),

        QuizQuestion(
        question: "地震が起こると、初めの小さな揺れの後に大きな揺れが届きます。このことから分かる地震の波の性質はどれですか？",
        choices: [
        "大きな揺れを伝える波だけが存在する",
        "二つの波は常に同じ速さで伝わる",
        "大きな揺れを伝える波の方が速く伝わる",
        "初めの小さな揺れを伝える波の方が速く伝わる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「初めの小さな揺れを伝える波の方が速く伝わる」です。速い波が先に届いて初めの小さな揺れを起こし、遅い波が後から届いて大きな揺れを起こします。"
        ),

        QuizQuestion.classification(
        question: "【分類】地震への備えや揺れているときの行動を「安全を高める行動」と「危険を高める行動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "背の高い家具を壁に固定する", match: "安全を高める行動"),
        QuizMatchingPair(prompt: "窓ガラスに飛散防止フィルムを貼る", match: "安全を高める行動"),
        QuizMatchingPair(prompt: "重い物を棚の最上段に置く", match: "危険を高める行動"),
        QuizMatchingPair(prompt: "揺れている最中にあわてて外へ飛び出す", match: "危険を高める行動")
        ],
        categories: ["安全を高める行動", "危険を高める行動"],
        explanation: "「家具を壁に固定する」と「飛散防止フィルムを貼る」は「安全を高める行動」、「重い物を棚の最上段に置く」と「揺れている最中に外へ飛び出す」は「危険を高める行動」に分類します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ地震を四つの地点で観測しました。初めの小さな揺れが続いた時間をもとに、震源に近い順に並べましょう。",
        choices: [
        "地点C：8秒",
        "地点A：2秒",
        "地点D：12秒",
        "地点B：5秒"
        ],
        rankedChoices: [
        "地点A：2秒",
        "地点B：5秒",
        "地点C：8秒",
        "地点D：12秒"
        ],
        explanation: "初めの小さな揺れが続く時間が短いほど震源に近いと考えられるため、「地点A：2秒」「地点B：5秒」「地点C：8秒」「地点D：12秒」の順です。"
        ),

        QuizQuestion(
        question: "地球から月を見ると、ほぼいつも同じ面が見えます。主な理由はどれですか？",
        choices: [
        "月の自転にかかる時間と、地球を一周する時間がほぼ同じだから",
        "月が全く自転していないから",
        "月の裏側には太陽の光が一度も当たらないから",
        "地球が月より速く公転しているから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「月の自転にかかる時間と、地球を一周する時間がほぼ同じだから」です。そのため、月は地球にほぼ同じ面を向け続けます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】月の表面に多く見られる、隕石などの衝突によってできた丸いくぼみを何といいますか？",
        answer: "クレーター",
        acceptableAnswers: ["くれーたー"],
        explanation: "月の表面に多く見られる丸いくぼみを「クレーター」といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】皆既月食が始まってから終わるまでの月の見え方を順番に並べましょう。",
        choices: [
        "月全体が地球の本影に入り、暗く見える",
        "月が地球の本影から抜け、元の丸い形に戻る",
        "月が地球の本影に入り始める",
        "月の一部が暗く欠けて見える"
        ],
        orderedChoices: [
        "月が地球の本影に入り始める",
        "月の一部が暗く欠けて見える",
        "月全体が地球の本影に入り、暗く見える",
        "月が地球の本影から抜け、元の丸い形に戻る"
        ],
        explanation: "「月が地球の本影に入り始める」「月の一部が暗く欠けて見える」「月全体が地球の本影に入り、暗く見える」「月が地球の本影から抜け、元の丸い形に戻る」の順です。"
        ),

        QuizQuestion(
        question: "乾電池につないだ同じモーターで、乾電池の向きだけを反対にしました。モーターの回り方はどうなりますか？",
        choices: [
        "回る速さだけが必ず2倍になる",
        "回転する向きが反対になる",
        "どちらの向きにも回らなくなる",
        "モーターが電気をためる器具に変わる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「回転する向きが反対になる」です。乾電池の向きを反対にすると電流の向きが変わり、モーターの回転方向も反対になります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】モーターを使った回路の操作と、起こる変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "スイッチを開く", match: "モーターが止まる"),
        QuizMatchingPair(prompt: "乾電池を直列にもう1個つなぐ", match: "モーターがより速く回る"),
        QuizMatchingPair(prompt: "乾電池の向きを反対にする", match: "モーターが反対向きに回る"),
        QuizMatchingPair(prompt: "充電したコンデンサーにつなぐ", match: "モーターがしばらく回る")
        ],
        choices: [
        "モーターが反対向きに回る",
        "モーターがしばらく回る",
        "モーターが止まる",
        "モーターがより速く回る"
        ],
        explanation: "スイッチを開くと「モーターが止まる」、乾電池を直列にもう1個つなぐと「モーターがより速く回る」、乾電池の向きを反対にすると「モーターが反対向きに回る」、充電したコンデンサーにつなぐと「モーターがしばらく回る」と組み合わせます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ光電池とライトを使ったとき、発電する電気が多い順に並べましょう。",
        choices: [
        "受光面を光に対して大きく傾ける",
        "受光面を黒い紙で完全におおう",
        "受光面を光に正面から向ける",
        "受光面を光に対して少し傾ける"
        ],
        rankedChoices: [
        "受光面を光に正面から向ける",
        "受光面を光に対して少し傾ける",
        "受光面を光に対して大きく傾ける",
        "受光面を黒い紙で完全におおう"
        ],
        explanation: "光電池に当たる光が多いほど発電する電気も多くなるため、「正面から向ける」「少し傾ける」「大きく傾ける」「黒い紙で完全におおう」の順です。"
        ),

        QuizQuestion(
        question: "家庭の生ごみを堆肥にして畑で利用することには、どのようなよさがありますか？",
        choices: [
        "生ごみを燃やす量が増え、土の養分が減る",
        "生ごみが分解されず、永久に同じ形で残る",
        "ごみを減らし、含まれる養分を土へ戻せる",
        "畑の生物をすべて取り除ける"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「ごみを減らし、含まれる養分を土へ戻せる」です。生ごみを堆肥として利用すると、焼却するごみを減らし、物質を循環させられます。"
        ),

        QuizQuestion(
        question: "分解されにくい有害な物質が、食物連鎖を通して生物の体内にたまる場合、最も濃い濃度になりやすいのはどの生物ですか？",
        choices: [
        "光合成をする植物だけ",
        "食物連鎖の途中にいる生物だけ",
        "分解者だけで、ほかの生物にはたまらない",
        "多くの生物を食べる食物連鎖の上位の生物"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「多くの生物を食べる食物連鎖の上位の生物」です。分解されにくい有害な物質は、食べる・食べられる関係を通して上位の生物ほど高い濃度でたまりやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】生息する数が少なくなり、将来、絶滅するおそれがある生物を何といいますか？",
        answer: "絶滅危惧種",
        acceptableAnswers: ["ぜつめつきぐしゅ"],
        explanation: "将来、絶滅するおそれがある生物を「絶滅危惧種」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】家庭での行動を「水を汚しにくい行動」と「水を汚しやすい行動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "皿の油汚れを紙で拭いてから洗う", match: "水を汚しにくい行動"),
        QuizMatchingPair(prompt: "洗剤を決められた量だけ使う", match: "水を汚しにくい行動"),
        QuizMatchingPair(prompt: "残った食用油を流しへ捨てる", match: "水を汚しやすい行動"),
        QuizMatchingPair(prompt: "必要以上に多くの洗剤を使う", match: "水を汚しやすい行動")
        ],
        categories: ["水を汚しにくい行動", "水を汚しやすい行動"],
        explanation: "「皿の油汚れを紙で拭いてから洗う」と「洗剤を決められた量だけ使う」は「水を汚しにくい行動」、「残った食用油を流しへ捨てる」と「必要以上に多くの洗剤を使う」は「水を汚しやすい行動」に分類します。"
        ),

        QuizQuestion(
        question: "スチールウールを十分に燃やしてから質量を量ると、燃やす前より重くなりました。主な理由はどれですか？",
        choices: [
        "鉄が空気中の酸素と結びついたから",
        "鉄から酸素が抜け出したから",
        "燃えると鉄の量が自然に増えるから",
        "空気中の窒素がすべて鉄に変わったから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「鉄が空気中の酸素と結びついたから」です。スチールウールの鉄が酸素と結びつくため、その分だけ質量が増えます。"
        ),

        QuizQuestion(
        question: "同じ長さのろうそくに、容積の異なる二つの集気びんをかぶせました。大きい集気びんの中のろうそくの方が長く燃えたのはなぜですか？",
        choices: [
        "大きい集気びんの中では、ろうが燃えなくなるから",
        "大きい集気びんの中には、燃焼に使える酸素がより多くあるから",
        "大きい集気びんの中では、二酸化炭素が酸素に変わるから",
        "大きい集気びんは、ろうそくの温度を必ず低くするから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「大きい集気びんの中には、燃焼に使える酸素がより多くあるから」です。容積が大きいほど中の空気も多く、燃焼に使える酸素の量も多くなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】燃えているろうそくの炎の上に冷たいガラス板を近づけると、ガラス板に液体の粒がつきました。この液体を答えましょう。",
        answer: "水",
        acceptableAnswers: ["みず"],
        explanation: "ガラス板についた液体は「水」です。ろうそくが燃えると水ができ、その水蒸気が冷やされて液体になります。"
        ),

        QuizQuestion.classification(
        question: "【分類】火を消す方法を、主に利用しているしくみに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ガス栓を閉めて、燃料の供給を止める", match: "燃えるものをなくす"),
        QuizMatchingPair(prompt: "火の周りにある枯れ草を取り除く", match: "燃えるものをなくす"),
        QuizMatchingPair(prompt: "水をかけて、燃えている物を十分に冷やす", match: "温度を下げる"),
        QuizMatchingPair(prompt: "鍋にふたをして、空気が入らないようにする", match: "酸素を遮る")
        ],
        categories: ["燃えるものをなくす", "温度を下げる", "酸素を遮る"],
        explanation: "「ガス栓を閉める」と「枯れ草を取り除く」は「燃えるものをなくす」、「水をかけて冷やす」は「温度を下げる」、「鍋にふたをする」は「酸素を遮る」に分類します。"
        ),

        QuizQuestion(
        question: "運動をすると、安静にしているときより脈拍や呼吸の回数が増えます。主な理由はどれですか？",
        choices: [
        "胃で食べ物を消化する必要がなくなるから",
        "体内の血液をすべて新しくつくり直すから",
        "筋肉へ多くの酸素を運び、二酸化炭素を運び出す必要があるから",
        "肺に入る空気を完全に止める必要があるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「筋肉へ多くの酸素を運び、二酸化炭素を運び出す必要があるから」です。運動中の筋肉は多くの酸素を使うため、呼吸や血液の循環が活発になります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】動脈と静脈の間をつなぎ、体の各部分に細かく広がっている血管を答えましょう。",
        answer: "毛細血管",
        acceptableAnswers: ["もうさいけっかん"],
        explanation: "動脈と静脈の間をつなぎ、体の各部分に細かく広がっている血管は「毛細血管」です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】消化に関係する液と、主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "だ液", match: "でんぷんの消化を始める"),
        QuizMatchingPair(prompt: "胃液", match: "主にたんぱく質を消化する"),
        QuizMatchingPair(prompt: "胆汁", match: "脂肪を細かい粒にする"),
        QuizMatchingPair(prompt: "すい液", match: "でんぷん・たんぱく質・脂肪の消化に関わる")
        ],
        choices: [
        "脂肪を細かい粒にする",
        "でんぷん・たんぱく質・脂肪の消化に関わる",
        "でんぷんの消化を始める",
        "主にたんぱく質を消化する"
        ],
        explanation: "だ液は「でんぷんの消化を始める」、胃液は「主にたんぱく質を消化する」、胆汁は「脂肪を細かい粒にする」、すい液は「でんぷん・たんぱく質・脂肪の消化に関わる」と組み合わせます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】全身から戻った血液が肺で酸素を受け取り、再び全身へ送られるまでを順番に並べましょう。",
        choices: [
        "肺で血液が酸素を受け取る",
        "血液が全身から心臓へ戻る",
        "血液が心臓から肺へ送られる",
        "酸素を多く含む血液が心臓を経て全身へ送られる"
        ],
        orderedChoices: [
        "血液が全身から心臓へ戻る",
        "血液が心臓から肺へ送られる",
        "肺で血液が酸素を受け取る",
        "酸素を多く含む血液が心臓を経て全身へ送られる"
        ],
        explanation: "「血液が全身から心臓へ戻る」「血液が心臓から肺へ送られる」「肺で血液が酸素を受け取る」「酸素を多く含む血液が心臓を経て全身へ送られる」の順です。"
        ),

        QuizQuestion(
        question: "晴れた昼、光合成が呼吸より盛んに行われている葉の周りでは、気体の割合はどのように変化しますか？",
        choices: [
        "酸素も二酸化炭素も減る",
        "酸素も二酸化炭素も増える",
        "酸素が減り、二酸化炭素が増える",
        "酸素が増え、二酸化炭素が減る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「酸素が増え、二酸化炭素が減る」です。光合成が呼吸より盛んなときは、二酸化炭素が多く使われ、酸素が多く出されます。"
        ),

        QuizQuestion(
        question: "同じ大きさのオオカナダモを同じ温度の水に入れ、ライトからの距離だけを変えました。ライトに近い方で気泡が多く出た理由はどれですか？",
        choices: [
        "強い光を受け、光合成がより盛んになったから",
        "ライトに近いと、水中の酸素がすべてなくなるから",
        "ライトの光が気泡そのものに変わったから",
        "根から吸収する水の量が必ずゼロになるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「強い光を受け、光合成がより盛んになったから」です。ほかの条件が同じなら、受ける光が強い方が光合成が盛んになり、酸素の気泡が多く出ます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】光合成に関係する物質と、その主な動きを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水", match: "根から取り入れられ、葉へ運ばれる"),
        QuizMatchingPair(prompt: "二酸化炭素", match: "気孔から葉の中へ取り入れられる"),
        QuizMatchingPair(prompt: "酸素", match: "光合成ででき、葉から空気中へ出る"),
        QuizMatchingPair(prompt: "でんぷん", match: "光合成でできた養分として葉にたくわえられる")
        ],
        choices: [
        "光合成ででき、葉から空気中へ出る",
        "根から取り入れられ、葉へ運ばれる",
        "光合成でできた養分として葉にたくわえられる",
        "気孔から葉の中へ取り入れられる"
        ],
        explanation: "水は「根から取り入れられ、葉へ運ばれる」、二酸化炭素は「気孔から葉の中へ取り入れられる」、酸素は「光合成ででき、葉から空気中へ出る」、でんぷんは「光合成でできた養分として葉にたくわえられる」と組み合わせます。"
        ),

        QuizQuestion(
        question: "川原で見つけたれきの多くが丸みを帯びていました。この形になった主な理由はどれですか？",
        choices: [
        "地中で急に溶けて丸くなったから",
        "流水に運ばれる間に、れきどうしや川底にぶつかって角がけずられたから",
        "日光を受けると必ず球の形になるから",
        "火山灰がれきの角だけを付け足したから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「流水に運ばれる間に、れきどうしや川底にぶつかって角がけずられたから」です。れきは川に運ばれる間にぶつかり合い、しだいに丸みを帯びます。"
        ),

        QuizQuestion.classification(
        question: "【分類】化石を「生物の体の一部」と「生物の生活のあと」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "貝殻の化石", match: "生物の体の一部"),
        QuizMatchingPair(prompt: "魚の骨の化石", match: "生物の体の一部"),
        QuizMatchingPair(prompt: "恐竜の足あとの化石", match: "生物の生活のあと"),
        QuizMatchingPair(prompt: "昔の生物が掘った巣穴の化石", match: "生物の生活のあと")
        ],
        categories: ["生物の体の一部", "生物の生活のあと"],
        explanation: "「貝殻の化石」と「魚の骨の化石」は「生物の体の一部」、「恐竜の足あとの化石」と「昔の生物が掘った巣穴の化石」は「生物の生活のあと」に分類します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】乱れのない地層を観察すると、下から順に砂岩層、泥岩層、火山灰層、れき岩層が重なっていました。古い順に並べましょう。",
        choices: [
        "火山灰層",
        "れき岩層",
        "砂岩層",
        "泥岩層"
        ],
        rankedChoices: [
        "砂岩層",
        "泥岩層",
        "火山灰層",
        "れき岩層"
        ],
        explanation: "地層が乱れていない場合、下の地層ほど古いため、「砂岩層」「泥岩層」「火山灰層」「れき岩層」の順です。"
        ),

        QuizQuestion(
        question: "ねばりけの強いマグマによる噴火の特徴として、最も適切なものはどれですか？",
        choices: [
        "気体が抜けやすく、必ず静かな噴火になる",
        "マグマが水に変わり、噴火しなくなる",
        "気体が抜けにくく、爆発的な噴火になりやすい",
        "火山灰が全く出ず、溶岩も固まらない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「気体が抜けにくく、爆発的な噴火になりやすい」です。ねばりけの強いマグマでは気体が逃げにくく、圧力が高まりやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】マグマが地下深くでゆっくり冷え固まってできた火成岩を何といいますか？",
        answer: "深成岩",
        acceptableAnswers: ["しんせいがん"],
        explanation: "マグマが地下深くでゆっくり冷え固まってできた火成岩を「深成岩」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】火山による災害や情報と、安全のための行動を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "火山灰が降っている", match: "マスクや保護眼鏡を使い、目や口を守る"),
        QuizMatchingPair(prompt: "溶岩流が近づくおそれがある", match: "予想される流路から早めに離れる"),
        QuizMatchingPair(prompt: "火山ガスの危険がある", match: "立入規制に従い、くぼ地へ近づかない"),
        QuizMatchingPair(prompt: "噴火警報が発表された", match: "自治体の指示を確認し、必要なら避難する")
        ],
        choices: [
        "立入規制に従い、くぼ地へ近づかない",
        "自治体の指示を確認し、必要なら避難する",
        "マスクや保護眼鏡を使い、目や口を守る",
        "予想される流路から早めに離れる"
        ],
        explanation: "火山灰には「マスクや保護眼鏡を使う」、溶岩流には「予想される流路から早めに離れる」、火山ガスには「規制に従い、くぼ地へ近づかない」、噴火警報には「自治体の指示を確認し、必要なら避難する」と組み合わせます。"
        ),

        QuizQuestion(
        question: "地震について、「マグニチュード」と「震度」の説明として正しいものはどれですか？",
        choices: [
        "どちらも各地の気温を表す数値である",
        "マグニチュードは場所ごとの揺れ、震度は地震そのものの規模を表す",
        "一つの地震では、すべての場所の震度が同じになる",
        "マグニチュードは地震そのものの規模、震度はそれぞれの場所の揺れの強さを表す"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「マグニチュードは地震そのものの規模、震度はそれぞれの場所の揺れの強さを表す」です。一つの地震でも、場所によって震度は異なります。"
        ),

        QuizQuestion(
        question: "屋外にいるときに強い地震の揺れを感じました。最も適切な行動はどれですか？",
        choices: [
        "かばんなどで頭を守り、ブロック塀や建物から離れる",
        "倒れそうな自動販売機のすぐ横へ移動する",
        "揺れている間に狭い路地へ走り込む",
        "電柱につかまり、揺れが止まるまで離れない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「かばんなどで頭を守り、ブロック塀や建物から離れる」です。屋外では、倒れたり落ちたりする物から離れて身を守ります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】海底で大きな地震が起こり、津波が海岸へ届くまでを順番に並べましょう。",
        choices: [
        "波が海岸に近づき、高くなる",
        "海底が急に持ち上がったり沈んだりする",
        "動かされた海水が波となって広がる",
        "津波が海岸へ押し寄せる"
        ],
        orderedChoices: [
        "海底が急に持ち上がったり沈んだりする",
        "動かされた海水が波となって広がる",
        "波が海岸に近づき、高くなる",
        "津波が海岸へ押し寄せる"
        ],
        explanation: "「海底が急に持ち上がったり沈んだりする」「動かされた海水が波となって広がる」「波が海岸に近づき、高くなる」「津波が海岸へ押し寄せる」の順です。"
        ),

        QuizQuestion(
        question: "ある日の夜、月を数時間おきに観察しました。月は空をおよそどちらからどちらへ動いて見えますか？",
        choices: [
        "西から東へ",
        "東から西へ",
        "北から南へ",
        "南から北へ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「東から西へ」です。地球が西から東へ自転しているため、月は一晩の間には東から西へ動いて見えます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】月が地球のまわりを回る運動を何といいますか？",
        answer: "公転",
        acceptableAnswers: ["こうてん"],
        explanation: "月が地球のまわりを回る運動を「公転」といいます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】朝6時から翌朝6時までの間に、月が東から昇る時刻が早い順に並べましょう。",
        choices: [
        "満月",
        "下弦の月",
        "新月",
        "上弦の月"
        ],
        rankedChoices: [
        "新月",
        "上弦の月",
        "満月",
        "下弦の月"
        ],
        explanation: "およその月の出は、新月が朝6時ごろ、上弦の月が正午ごろ、満月が夕方6時ごろ、下弦の月が夜中0時ごろです。そのため「新月」「上弦の月」「満月」「下弦の月」の順です。"
        ),

        QuizQuestion(
        question: "手回し発電機でつくった電気をコンデンサーにためた後、モーターにつなぐとモーターが回りました。コンデンサーのはたらきはどれですか？",
        choices: [
        "電気を光だけに変える",
        "電流を永久に流れなくする",
        "電気を一時的にたくわえる",
        "モーターを磁石ではない物に変える"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「電気を一時的にたくわえる」です。コンデンサーにためた電気を使うことで、後からモーターを回せます。"
        ),

        QuizQuestion.classification(
        question: "【分類】電磁石について、操作によって主に起こる変化を分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乾電池を1個から直列2個にする", match: "電磁石を強くする"),
        QuizMatchingPair(prompt: "コイルの巻き数を増やす", match: "電磁石を強くする"),
        QuizMatchingPair(prompt: "乾電池の向きを反対にする", match: "N極とS極を入れ替える"),
        QuizMatchingPair(prompt: "同じ電流で、コイルを巻く向きを反対にする", match: "N極とS極を入れ替える")
        ],
        categories: ["電磁石を強くする", "N極とS極を入れ替える"],
        explanation: "「乾電池を直列2個にする」と「コイルの巻き数を増やす」は「電磁石を強くする」に分類します。「乾電池の向きを反対にする」と「コイルを巻く向きを反対にする」は「N極とS極を入れ替える」に分類します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】発電の方法と、もとになるエネルギーを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "光電池", match: "太陽の光"),
        QuizMatchingPair(prompt: "風力発電", match: "風の運動"),
        QuizMatchingPair(prompt: "水力発電", match: "流れ落ちる水の運動"),
        QuizMatchingPair(prompt: "手回し発電機", match: "人がハンドルを回す運動")
        ],
        choices: [
        "人がハンドルを回す運動",
        "流れ落ちる水の運動",
        "太陽の光",
        "風の運動"
        ],
        explanation: "光電池は「太陽の光」、風力発電は「風の運動」、水力発電は「流れ落ちる水の運動」、手回し発電機は「人がハンドルを回す運動」と組み合わせます。"
        ),

        QuizQuestion(
        question: "山の森林が広い範囲で失われると、大雨の後に川や川辺の生物へどのような影響が起こりやすくなりますか？",
        choices: [
        "土が流れにくくなり、川の水が必ず透明になる",
        "川の水がすべて蒸発し、生物だけが残る",
        "川の流れが止まり、海水に変わる",
        "土が川へ流れ込みやすくなり、生物のすみかが損なわれる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「土が川へ流れ込みやすくなり、生物のすみかが損なわれる」です。森林には雨水をたくわえ、土が流れ出るのを抑えるはたらきがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】さまざまな種類の生物が、それぞれ関わり合いながら生きている豊かさを何といいますか？",
        answer: "生物多様性",
        acceptableAnswers: ["せいぶつたようせい"],
        explanation: "さまざまな種類の生物が関わり合いながら生きている豊かさを「生物多様性」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】池の環境をつくるものを「生物」と「生物ではない環境」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水草", match: "生物"),
        QuizMatchingPair(prompt: "メダカ", match: "生物"),
        QuizMatchingPair(prompt: "水温", match: "生物ではない環境"),
        QuizMatchingPair(prompt: "日光", match: "生物ではない環境")
        ],
        categories: ["生物", "生物ではない環境"],
        explanation: "「水草」と「メダカ」は「生物」、「水温」と「日光」は「生物ではない環境」に分類します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】家庭から出た汚水が下水処理場で処理され、川や海へ戻されるまでを順番に並べましょう。",
        choices: [
        "消毒した水を川や海へ流す",
        "家庭から出た汚水を下水管で集める",
        "沈みやすいごみや泥を取り除く",
        "微生物のはたらきで水中の汚れを分解する"
        ],
        orderedChoices: [
        "家庭から出た汚水を下水管で集める",
        "沈みやすいごみや泥を取り除く",
        "微生物のはたらきで水中の汚れを分解する",
        "消毒した水を川や海へ流す"
        ],
        explanation: "「家庭から出た汚水を下水管で集める」「沈みやすいごみや泥を取り除く」「微生物のはたらきで水中の汚れを分解する」「消毒した水を川や海へ流す」の順です。"
        ),

        QuizQuestion(
        question: "火のついた線香を、酸素を多く入れた集気びんに入れるとどうなりますか？",
        choices: [
        "空気中より激しく燃える",
        "すぐに火が消える",
        "燃え方は必ず空気中と同じになる",
        "線香が燃えずに凍る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「空気中より激しく燃える」です。酸素にはものを燃やすはたらきがあり、酸素が多いほど線香は激しく燃えます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ものが酸素と結びつき、光や熱を出しながら燃えることを何といいますか？",
        answer: "燃焼",
        acceptableAnswers: ["ねんしょう"],
        explanation: "ものが酸素と結びつき、光や熱を出しながら燃えることを「燃焼」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】火のついた同じ大きさのろうそくを、それぞれの気体で満たした集気びんに入れます。結果を分類しましょう。",
        pairs: [
        QuizMatchingPair(prompt: "酸素を多く含む気体に入れる", match: "燃え続けやすい"),
        QuizMatchingPair(prompt: "新しい空気が十分にある所に置く", match: "燃え続けやすい"),
        QuizMatchingPair(prompt: "二酸化炭素で満たしたびんに入れる", match: "すぐに消える"),
        QuizMatchingPair(prompt: "窒素で満たしたびんに入れる", match: "すぐに消える")
        ],
        categories: ["燃え続けやすい", "すぐに消える"],
        explanation: "酸素を多く含む気体と新しい空気が十分にある所では「燃え続けやすい」に分類します。二酸化炭素や窒素で満たしたびんでは、燃焼を続けるための酸素がないため「すぐに消える」に分類します。"
        ),

        QuizQuestion(
        question: "割りばしを燃やす前と、燃やして灰になった後を比べました。正しい説明はどれですか？",
        choices: [
        "灰は冷やすと必ず元の割りばしに戻る",
        "燃焼によって、元とは異なる物質に変化した",
        "形だけが変わり、物質の性質は全く変わらない",
        "燃焼中は酸素が全く使われていない"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「燃焼によって、元とは異なる物質に変化した」です。燃えた後にできた灰は、元の割りばしとは性質の異なる物質です。"
        ),

        QuizQuestion(
        question: "吸う空気と比べたとき、吐く息の特徴として正しいものはどれですか？",
        choices: [
        "酸素が増え、二酸化炭素が減っている",
        "酸素も二酸化炭素も全く含まれていない",
        "酸素が減り、二酸化炭素が増えている",
        "窒素だけでできている"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「酸素が減り、二酸化炭素が増えている」です。体内では酸素が使われ、できた二酸化炭素が吐く息によって外へ出されます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】心臓の動きに合わせて、手首などの血管で感じられる規則正しい動きを何といいますか？",
        answer: "脈拍",
        acceptableAnswers: ["みゃくはく"],
        explanation: "心臓の動きに合わせて、手首などの血管で感じられる規則正しい動きを「脈拍」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】息を吸うとき・吐くときの体の変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "息を吸うときの横隔膜", match: "下がる"),
        QuizMatchingPair(prompt: "息を吸うときの胸", match: "広がる"),
        QuizMatchingPair(prompt: "息を吐くときの横隔膜", match: "上がる"),
        QuizMatchingPair(prompt: "息を吐くときの胸", match: "せまくなる")
        ],
        choices: [
        "広がる",
        "上がる",
        "せまくなる",
        "下がる"
        ],
        explanation: "息を吸うときは横隔膜が「下がる」、胸が「広がる」と組み合わせます。息を吐くときは横隔膜が「上がる」、胸が「せまくなる」と組み合わせます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】血液中の不要な物質が尿として体外へ出されるまでを順番に並べましょう。",
        choices: [
        "尿が体外へ出される",
        "血液が腎臓へ運ばれる",
        "尿が膀胱にたくわえられる",
        "腎臓で不要な物質がこし取られ、尿ができる"
        ],
        orderedChoices: [
        "血液が腎臓へ運ばれる",
        "腎臓で不要な物質がこし取られ、尿ができる",
        "尿が膀胱にたくわえられる",
        "尿が体外へ出される"
        ],
        explanation: "「血液が腎臓へ運ばれる」「腎臓で不要な物質がこし取られ、尿ができる」「尿が膀胱にたくわえられる」「尿が体外へ出される」の順です。"
        ),

        QuizQuestion(
        question: "でんぷんをなくした同じ種類の葉を二つ用意し、どちらにも日光を当てました。一方だけを二酸化炭素のない空気に入れたところ、その葉にはでんぷんができませんでした。この結果から分かることはどれですか？",
        choices: [
        "光合成には酸素だけが必要である",
        "光合成は根だけで行われる",
        "日光が当たると二酸化炭素は必要なくなる",
        "でんぷんができるためには二酸化炭素が必要である"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「でんぷんができるためには二酸化炭素が必要である」です。日光などの条件をそろえ、二酸化炭素の有無だけを変えた結果から判断できます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】葉の気孔から水が水蒸気となって出ていく現象を答えましょう。",
        answer: "蒸散",
        acceptableAnswers: ["じょうさん"],
        explanation: "葉の気孔から水が水蒸気となって出ていく現象を「蒸散」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】植物の体の部分と、光合成や水の移動に関係するはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "根毛", match: "土の中の水を取り入れる"),
        QuizMatchingPair(prompt: "道管", match: "根から吸収した水を葉まで運ぶ"),
        QuizMatchingPair(prompt: "気孔", match: "気体や水蒸気の出入り口になる"),
        QuizMatchingPair(prompt: "葉緑体", match: "光を受けて光合成を行う")
        ],
        choices: [
        "光を受けて光合成を行う",
        "気体や水蒸気の出入り口になる",
        "土の中の水を取り入れる",
        "根から吸収した水を葉まで運ぶ"
        ],
        explanation: "根毛は「土の中の水を取り入れる」、道管は「根から吸収した水を葉まで運ぶ」、気孔は「気体や水蒸気の出入り口になる」、葉緑体は「光を受けて光合成を行う」と組み合わせます。"
        ),

        QuizQuestion(
        question: "山の地層から海にすむ貝の化石が見つかりました。このことから最も適切に考えられることはどれですか？",
        choices: [
        "その場所は昔、海の底だった時期がある",
        "その山は一度も水におおわれたことがない",
        "貝は必ず空を飛んで山まで来た",
        "化石は現在生きている貝が作った"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「その場所は昔、海の底だった時期がある」です。海にすむ貝の化石は、その地層が海の底でできたことを考える手がかりになります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地層の中に残された、昔の生物の体や生活のあとを何といいますか？",
        answer: "化石",
        acceptableAnswers: ["かせき"],
        explanation: "地層の中に残された昔の生物の体や生活のあとを「化石」といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】岩石がけずられてできた粒が地層になるまでを順番に並べましょう。",
        choices: [
        "積もった粒が長い時間をかけて固まる",
        "流水によって粒が運ばれる",
        "岩石が風化や侵食によって細かくなる",
        "流れが弱い場所で粒が積もる"
        ],
        orderedChoices: [
        "岩石が風化や侵食によって細かくなる",
        "流水によって粒が運ばれる",
        "流れが弱い場所で粒が積もる",
        "積もった粒が長い時間をかけて固まる"
        ],
        explanation: "「岩石が風化や侵食によって細かくなる」「流水によって粒が運ばれる」「流れが弱い場所で粒が積もる」「積もった粒が長い時間をかけて固まる」の順です。"
        ),

        QuizQuestion(
        question: "離れた二つの場所の地層に、同じ特徴をもつ火山灰の層が見つかりました。この火山灰の層が地層を比べる手がかりになる主な理由はどれですか？",
        choices: [
        "火山灰は必ず海の中だけに積もるから",
        "一度の噴火で広い範囲にほぼ同じ時期に積もることがあるから",
        "火山灰の層はほかの地層より必ず厚いから",
        "火山灰は積もった直後にすべて化石になるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「一度の噴火で広い範囲にほぼ同じ時期に積もることがあるから」です。同じ火山灰の層を目印にすると、離れた場所の地層を対応させられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】火山に関係するものを「噴火のときに地表へ出るもの」と「冷えたり固まったりしてできた岩石」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "溶岩", match: "噴火のときに地表へ出るもの"),
        QuizMatchingPair(prompt: "火山灰", match: "噴火のときに地表へ出るもの"),
        QuizMatchingPair(prompt: "玄武岩", match: "冷えたり固まったりしてできた岩石"),
        QuizMatchingPair(prompt: "凝灰岩", match: "冷えたり固まったりしてできた岩石")
        ],
        categories: ["噴火のときに地表へ出るもの", "冷えたり固まったりしてできた岩石"],
        explanation: "溶岩と火山灰は「噴火のときに地表へ出るもの」に分類します。玄武岩はマグマや溶岩が冷えてでき、凝灰岩は火山灰などが固まってできるため「冷えたり固まったりしてできた岩石」に分類します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】火山から出るものと、その特徴を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "火山灰", match: "非常に細かい粒として広く降る"),
        QuizMatchingPair(prompt: "火山弾", match: "大きなかたまりとなって飛び出す"),
        QuizMatchingPair(prompt: "溶岩", match: "高温で地表を流れる"),
        QuizMatchingPair(prompt: "軽石", match: "穴が多く、水に浮くことがある")
        ],
        choices: [
        "高温で地表を流れる",
        "穴が多く、水に浮くことがある",
        "大きなかたまりとなって飛び出す",
        "非常に細かい粒として広く降る"
        ],
        explanation: "火山灰は「非常に細かい粒として広く降る」、火山弾は「大きなかたまりとなって飛び出す」、溶岩は「高温で地表を流れる」、軽石は「穴が多く、水に浮くことがある」と組み合わせます。"
        ),

        QuizQuestion(
        question: "同じ地震を観測したところ、地点Aより地点Bの方が、初めの小さな揺れが始まってから大きな揺れが始まるまでの時間が長くなりました。震源からより遠いと考えられるのはどちらですか？",
        choices: [
        "地点Aだけで、地点Bは震源の真上である",
        "二地点は必ず震源から同じ距離にある",
        "地点B",
        "この時間差と震源からの距離には関係がない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「地点B」です。一般に、初めの小さな揺れから大きな揺れまでの時間が長いほど、震源から遠いと考えられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地下で地震が起こり始めた場所を何といいますか？",
        answer: "震源",
        acceptableAnswers: ["しんげん"],
        explanation: "地下で地震が起こり始めた場所を「震源」といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】緊急地震速報が出されてから強い揺れが届くまでのしくみを順番に並べましょう。",
        choices: [
        "各地に緊急地震速報が伝えられる",
        "震源に近い観測点が初めの小さな揺れをとらえる",
        "後から伝わる大きな揺れが到着する",
        "観測データから震源や強い揺れを予測する"
        ],
        orderedChoices: [
        "震源に近い観測点が初めの小さな揺れをとらえる",
        "観測データから震源や強い揺れを予測する",
        "各地に緊急地震速報が伝えられる",
        "後から伝わる大きな揺れが到着する"
        ],
        explanation: "「震源に近い観測点が初めの小さな揺れをとらえる」「観測データから震源や強い揺れを予測する」「各地に緊急地震速報が伝えられる」「後から伝わる大きな揺れが到着する」の順です。"
        ),

        QuizQuestion(
        question: "月を毎日同じ時刻に観察すると、星座を目印にした月の位置は、前の日と比べておよそどちらへ移って見えますか？",
        choices: [
        "北へ移って見える",
        "南へ移って見える",
        "西へ移って見える",
        "東へ移って見える"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「東へ移って見える」です。月は地球のまわりを公転しているため、同じ時刻に見ると星座に対して少しずつ東へ移って見えます。"
        ),

        QuizQuestion(
        question: "日食が起こるときの太陽・月・地球の並び方として正しいものはどれですか？",
        choices: [
        "太陽―月―地球の順にほぼ一直線に並ぶ",
        "月―太陽―地球の順にほぼ一直線に並ぶ",
        "太陽―地球―月の順にほぼ一直線に並ぶ",
        "太陽と月と地球が直角三角形に並ぶ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「太陽―月―地球の順にほぼ一直線に並ぶ」です。月が太陽と地球の間に入り、月の影が地球に届くと日食が起こります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】月の形と、その月が南中するおよその時刻を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新月", match: "正午ごろ"),
        QuizMatchingPair(prompt: "上弦の月", match: "日没ごろ"),
        QuizMatchingPair(prompt: "満月", match: "真夜中ごろ"),
        QuizMatchingPair(prompt: "下弦の月", match: "日の出ごろ")
        ],
        choices: [
        "真夜中ごろ",
        "日の出ごろ",
        "正午ごろ",
        "日没ごろ"
        ],
        explanation: "新月は「正午ごろ」、上弦の月は「日没ごろ」、満月は「真夜中ごろ」、下弦の月は「日の出ごろ」に南中します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】地球から見える月の明るい部分が広い順に並べましょう。",
        choices: [
        "三日月",
        "新月",
        "満月",
        "半月"
        ],
        rankedChoices: [
        "満月",
        "半月",
        "三日月",
        "新月"
        ],
        explanation: "明るい部分が広い順は「満月」「半月」「三日月」「新月」です。"
        ),

        QuizQuestion(
        question: "電磁石につないだ乾電池の向きを反対にすると、電磁石の極はどうなりますか？",
        choices: [
        "N極だけがなくなる",
        "N極とS極が入れ替わる",
        "極は変わらず、必ず強さだけが2倍になる",
        "電磁石が永久磁石に変わる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「N極とS極が入れ替わる」です。乾電池の向きを反対にすると電流の向きが変わり、電磁石の極も入れ替わります。"
        ),

        QuizQuestion(
        question: "手回し発電機に同じ豆電球をつなぎ、ハンドルをゆっくり回した後、速く回しました。速く回したときの変化として正しいものはどれですか？",
        choices: [
        "豆電球は必ず消える",
        "発電する電気がなくなる",
        "豆電球がより明るく光る",
        "豆電球が磁石になる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「豆電球がより明るく光る」です。手回し発電機を速く回すと、一般に発電される電気が大きくなり、豆電球はより明るく光ります。"
        ),

        QuizQuestion.classification(
        question: "【分類】次の器具を「電気をつくる器具」と「電気を使う器具」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "光電池", match: "電気をつくる器具"),
        QuizMatchingPair(prompt: "手回し発電機", match: "電気をつくる器具"),
        QuizMatchingPair(prompt: "モーター", match: "電気を使う器具"),
        QuizMatchingPair(prompt: "電熱線", match: "電気を使う器具")
        ],
        categories: ["電気をつくる器具", "電気を使う器具"],
        explanation: "光電池と手回し発電機は「電気をつくる器具」に分類します。モーターと電熱線は「電気を使う器具」に分類します。"
        ),

        QuizQuestion(
        question: "養分を多く含む生活排水が池へ流れ込み、植物プランクトンが増えた後、多くの魚が死ぬことがあります。主な理由として最も適切なものはどれですか？",
        choices: [
        "池の水がすべて真水ではなくなるから",
        "植物プランクトンが魚を直接食べるから",
        "池の底の土がすべて火山灰に変わるから",
        "死んだプランクトンなどを分解する生物が酸素を多く使い、水中の酸素が不足するから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「死んだプランクトンなどを分解する生物が酸素を多く使い、水中の酸素が不足するから」です。水中の酸素が不足すると、魚は呼吸しにくくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】池のまわりにいる生物を「生産者」「消費者」「分解者」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水草", match: "生産者"),
        QuizMatchingPair(prompt: "タニシ", match: "消費者"),
        QuizMatchingPair(prompt: "コイ", match: "消費者"),
        QuizMatchingPair(prompt: "水中の細菌", match: "分解者")
        ],
        categories: ["生産者", "消費者", "分解者"],
        explanation: "水草は自分で養分をつくるため「生産者」です。タニシとコイはほかの生物を食べるため「消費者」です。水中の細菌は生物の死がいや排出物などを分解するため「分解者」です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】草から始まる食べる・食べられる関係を、食べられる側から順に並べましょう。",
        choices: [
        "カエル",
        "タカ",
        "草",
        "バッタ"
        ],
        rankedChoices: [
        "草",
        "バッタ",
        "カエル",
        "タカ"
        ],
        explanation: "食べられる側から順に並べると「草」「バッタ」「カエル」「タカ」です。"
        ),

        QuizQuestion(
        question: "集気びんの中で木片を燃やし、火が消えた後の空気を燃やす前と比べました。燃えた後の変化として正しいものはどれですか？",
        choices: [
        "酸素の割合が減り、二酸化炭素の割合が増える",
        "酸素と二酸化炭素の割合がどちらも増える",
        "酸素の割合が増え、二酸化炭素の割合が減る",
        "窒素がすべてなくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「酸素の割合が減り、二酸化炭素の割合が増える」です。木片が燃えると酸素が使われ、二酸化炭素ができます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】木を燃やした後の気体を石灰水に通すと、石灰水が白くにごりました。燃焼によって増えた気体を答えましょう。",
        answer: "二酸化炭素",
        acceptableAnswers: ["にさんかたんそ"],
        explanation: "燃焼によって増え、石灰水を白くにごらせた気体は「二酸化炭素」です。"
        ),

        QuizQuestion(
        question: "燃えているろうそくに上下が開いた筒をかぶせ、筒の下にすき間をあけると、火が燃え続けやすくなりました。主な理由はどれですか？",
        choices: [
        "ろうそくの温度が急に下がるから",
        "下から新しい空気が入り、上から温められた空気が出るから",
        "びんの中の二酸化炭素が酸素に変わるから",
        "ろうが水に変わって燃料が増えるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「下から新しい空気が入り、上から温められた空気が出るから」です。空気が入れ替わることで、燃焼に必要な酸素が供給されます。"
        ),

        QuizQuestion.classification(
        question: "【分類】次の変化を「燃焼による変化」と「燃焼ではない変化」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "紙が炎を出して燃え、灰になる", match: "燃焼による変化"),
        QuizMatchingPair(prompt: "氷が溶けて水になる", match: "燃焼ではない変化"),
        QuizMatchingPair(prompt: "木炭が赤くなって熱を出す", match: "燃焼による変化"),
        QuizMatchingPair(prompt: "食塩が水に溶ける", match: "燃焼ではない変化")
        ],
        categories: ["燃焼による変化", "燃焼ではない変化"],
        explanation: "「紙が炎を出して燃え、灰になる」と「木炭が赤くなって熱を出す」は燃焼による変化です。「氷が溶けて水になる」と「食塩が水に溶ける」は燃焼ではない変化です。"
        ),

        QuizQuestion(
        question: "小腸の内側にたくさんのひだがあることの主な利点はどれですか？",
        choices: [
        "食べ物を口へ押し戻しやすくなる",
        "空気中の酸素を直接取り込みやすくなる",
        "養分を吸収する面積が広くなる",
        "血液を新しくつくりやすくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「養分を吸収する面積が広くなる」です。小腸のひだによって内側の表面積が広くなり、消化された養分を効率よく吸収できます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】心臓から送り出された血液が通る血管を答えましょう。",
        answer: "動脈",
        acceptableAnswers: ["どうみゃく"],
        explanation: "心臓から送り出された血液が通る血管は「動脈」です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】器官と主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "肝臓", match: "養分をたくわえ、有害な物質を処理する"),
        QuizMatchingPair(prompt: "腎臓", match: "血液から不要な物質をこし取る"),
        QuizMatchingPair(prompt: "小腸", match: "消化された養分を吸収する"),
        QuizMatchingPair(prompt: "肺", match: "酸素を血液に取り入れ、二酸化炭素を出す")
        ],
        choices: [
        "血液から不要な物質をこし取る",
        "酸素を血液に取り入れ、二酸化炭素を出す",
        "養分をたくわえ、有害な物質を処理する",
        "消化された養分を吸収する"
        ],
        explanation: "肝臓は「養分をたくわえ、有害な物質を処理する」、腎臓は「血液から不要な物質をこし取る」、小腸は「消化された養分を吸収する」、肺は「酸素を血液に取り入れ、二酸化炭素を出す」と組み合わせます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】吸い込んだ酸素が全身へ運ばれるまでを順番に並べましょう。",
        choices: [
        "酸素が血液に取り込まれる",
        "空気が鼻や口から入る",
        "空気が気管を通る",
        "空気が肺に届く"
        ],
        orderedChoices: [
        "空気が鼻や口から入る",
        "空気が気管を通る",
        "空気が肺に届く",
        "酸素が血液に取り込まれる"
        ],
        explanation: "「空気が鼻や口から入る」「空気が気管を通る」「空気が肺に届く」「酸素が血液に取り込まれる」の順です。"
        ),

        QuizQuestion(
        question: "日光に当てた葉を脱色してヨウ素液をつけると、葉が青紫色になりました。このことから分かることはどれですか？",
        choices: [
        "葉に酸素だけがたまっていた",
        "葉の中の水が凍っていた",
        "葉緑体がすべてなくなっていた",
        "葉にでんぷんができていた"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「葉にでんぷんができていた」です。ヨウ素液は、でんぷんがあると青紫色に変化します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】オオカナダモに光を当てると、葉から気泡が出ました。この気泡に多く含まれる気体を答えましょう。",
        answer: "酸素",
        acceptableAnswers: ["さんそ"],
        explanation: "光合成によってオオカナダモから出た気泡に多く含まれる気体は「酸素」です。"
        ),

        QuizQuestion.classification(
        question: "【分類】暗い場所に置いてでんぷんをなくした斑入り（ふいり）の葉を使い、一部をアルミ箔でおおって日光に当てました。ヨウ素液をつけたときの結果を分類しましょう。",
        pairs: [
        QuizMatchingPair(prompt: "日光が当たった緑色の部分", match: "青紫色になる"),
        QuizMatchingPair(prompt: "日光が当たった白色の部分", match: "青紫色にならない"),
        QuizMatchingPair(prompt: "アルミ箔でおおった緑色の部分", match: "青紫色にならない"),
        QuizMatchingPair(prompt: "アルミ箔でおおわず日光に当てた別の緑色の部分", match: "青紫色になる")
        ],
        categories: ["青紫色になる", "青紫色にならない"],
        explanation: "「日光が当たった緑色の部分」と「アルミ箔でおおわず日光に当てた別の緑色の部分」は「青紫色になる」に分類します。「日光が当たった白色の部分」と「アルミ箔でおおった緑色の部分」は「青紫色にならない」に分類します。"
        ),

        QuizQuestion(
        question: "地層が大きく曲がったり逆転したりしていない場所では、地層の上下とできた時期にどのような関係がありますか？",
        choices: [
        "下の地層ほど古く、上の地層ほど新しい",
        "上の地層ほど古く、下の地層ほど新しい",
        "上と下の地層は必ず同じ時期にできる",
        "地層の上下からできた時期は全く分からない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「下の地層ほど古く、上の地層ほど新しい」です。地層は一般に、先に積もったものの上へ新しいものが重なります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】岩石と、そのもとになった堆積物を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "れき岩", match: "れきが固まってできる"),
        QuizMatchingPair(prompt: "砂岩", match: "砂が固まってできる"),
        QuizMatchingPair(prompt: "泥岩", match: "泥が固まってできる"),
        QuizMatchingPair(prompt: "凝灰岩", match: "火山灰が固まってできる")
        ],
        choices: [
        "泥が固まってできる",
        "火山灰が固まってできる",
        "れきが固まってできる",
        "砂が固まってできる"
        ],
        explanation: "れき岩は「れきが固まってできる」、砂岩は「砂が固まってできる」、泥岩は「泥が固まってできる」、凝灰岩は「火山灰が固まってできる」と組み合わせます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】地層をつくる粒を、大きい順に並べましょう。",
        choices: [
        "泥",
        "小さなれき",
        "砂",
        "大きなれき"
        ],
        rankedChoices: [
        "大きなれき",
        "小さなれき",
        "砂",
        "泥"
        ],
        explanation: "粒の大きい順は「大きなれき」「小さなれき」「砂」「泥」です。"
        ),

        QuizQuestion(
        question: "軽石に小さな穴がたくさんある主な理由はどれですか？",
        choices: [
        "雨水が石の中を溶かしたから",
        "マグマに含まれていた気体が抜けたあとが残ったから",
        "植物の根が石の中を通ったから",
        "地震の揺れだけで細かな穴が開いたから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「マグマに含まれていた気体が抜けたあとが残ったから」です。軽石ができるとき、マグマの中の気体が抜けて多くの穴が残ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地下から上がってきたマグマや火山灰などが、地表へ出る出口を答えましょう。",
        answer: "火口",
        acceptableAnswers: ["かこう"],
        explanation: "マグマや火山灰などが地表へ出る出口は「火口」です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】火山の噴火によって、溶岩から岩石ができるまでを順番に並べましょう。",
        choices: [
        "溶岩が冷え固まって岩石になる",
        "地下のマグマが上昇する",
        "火口から溶岩が流れ出る",
        "溶岩が空気や地面に熱をうばわれる"
        ],
        orderedChoices: [
        "地下のマグマが上昇する",
        "火口から溶岩が流れ出る",
        "溶岩が空気や地面に熱をうばわれる",
        "溶岩が冷え固まって岩石になる"
        ],
        explanation: "「地下のマグマが上昇する」「火口から溶岩が流れ出る」「溶岩が空気や地面に熱をうばわれる」「溶岩が冷え固まって岩石になる」の順です。"
        ),

        QuizQuestion(
        question: "同じ地震で、震源からほぼ同じ距離にある二つの場所でも揺れの大きさが違いました。主な原因として考えられるものはどれですか？",
        choices: [
        "地震を観測した時計の種類",
        "その日の月の満ち欠け",
        "地盤のかたさや土地のつくり",
        "観測した人の身長"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「地盤のかたさや土地のつくり」です。震源からの距離がほぼ同じでも、地盤の性質によって揺れの大きさが変わることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地層や岩盤が大きな力を受けて割れ、ずれた部分を答えましょう。",
        answer: "断層",
        acceptableAnswers: ["だんそう"],
        explanation: "地層や岩盤が割れてずれた部分を「断層」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地震によって起こる土地の変化や現象と、その説明を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "隆起", match: "土地が広い範囲で持ち上がる"),
        QuizMatchingPair(prompt: "沈降", match: "土地が広い範囲で下がる"),
        QuizMatchingPair(prompt: "地割れ", match: "地面に割れ目ができる"),
        QuizMatchingPair(prompt: "液状化", match: "水を多く含む地盤が液体のようになる")
        ],
        choices: [
        "地面に割れ目ができる",
        "水を多く含む地盤が液体のようになる",
        "土地が広い範囲で下がる",
        "土地が広い範囲で持ち上がる"
        ],
        explanation: "隆起は「土地が広い範囲で持ち上がる」、沈降は「土地が広い範囲で下がる」、地割れは「地面に割れ目ができる」、液状化は「水を多く含む地盤が液体のようになる」と組み合わせます。"
        ),

        QuizQuestion(
        question: "満月が見える日の夕方、月はおよそどの方角から昇りますか？",
        choices: [
        "北",
        "南",
        "西",
        "東"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「東」です。満月は太陽と反対側に見えるため、太陽が西に沈むころ東から昇ります。"
        ),

        QuizQuestion(
        question: "夕方に南の空で見え、これから数日かけて満月に近づいていく半月はどれですか？",
        choices: [
        "上弦の月",
        "下弦の月",
        "新月",
        "満月"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「上弦の月」です。上弦の月は夕方に見やすく、その後、明るく見える部分が増えて満月に近づきます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】新月の後、満月になるまでの月の見え方を順番に並べましょう。",
        choices: [
        "上弦の月",
        "満月",
        "三日月",
        "新月"
        ],
        orderedChoices: [
        "新月",
        "三日月",
        "上弦の月",
        "満月"
        ],
        explanation: "「新月」「三日月」「上弦の月」「満月」の順に、明るく見える部分が増えていきます。"
        ),

        QuizQuestion(
        question: "乾電池と鉄心を同じにした電磁石を、より強くする方法はどれですか？",
        choices: [
        "コイルの巻き数を少なくする",
        "コイルの巻き数を多くする",
        "鉄心を木の棒に取り替える",
        "回路を切って電流を流さない"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「コイルの巻き数を多くする」です。ほかの条件が同じなら、コイルの巻き数を多くすると電磁石は強くなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電気を使う器具と、主に変わるエネルギーを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "豆電球", match: "光のエネルギー"),
        QuizMatchingPair(prompt: "モーター", match: "運動のエネルギー"),
        QuizMatchingPair(prompt: "電熱線", match: "熱のエネルギー"),
        QuizMatchingPair(prompt: "ブザー", match: "音のエネルギー")
        ],
        choices: [
        "熱のエネルギー",
        "運動のエネルギー",
        "音のエネルギー",
        "光のエネルギー"
        ],
        explanation: "豆電球は「光のエネルギー」、モーターは「運動のエネルギー」、電熱線は「熱のエネルギー」、ブザーは「音のエネルギー」と組み合わせます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】コイルを流れる電流の大きさと鉄心を同じにしたとき、電磁石が強い順に並べましょう。",
        choices: [
        "50回巻きのコイル",
        "200回巻きのコイル",
        "100回巻きのコイル",
        "150回巻きのコイル"
        ],
        rankedChoices: [
        "200回巻きのコイル",
        "150回巻きのコイル",
        "100回巻きのコイル",
        "50回巻きのコイル"
        ],
        explanation: "電流の大きさと鉄心が同じなら、強い順は「200回巻きのコイル」「150回巻きのコイル」「100回巻きのコイル」「50回巻きのコイル」です。"
        ),

        QuizQuestion(
        question: "落ち葉や生物の死がいを分解し、土の中の物質へ戻す主な生物はどれですか？",
        choices: [
        "草食動物",
        "緑色の植物",
        "菌類や細菌",
        "鳥類"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「菌類や細菌」です。菌類や細菌などの分解者は、落ち葉や死がいを分解して環境へ戻します。"
        ),

        QuizQuestion(
        question: "池の水草が大きく減り、ほかの条件は変わらない状態が続きました。最も起こりやすい変化はどれですか？",
        choices: [
        "肉食魚だけがすぐに増え続ける",
        "分解者がその日のうちにすべていなくなる",
        "池に当たる日光が必ず強くなる",
        "水草を食べる小動物のえさが減り、数も減る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「水草を食べる小動物のえさが減り、数も減る」です。食べ物となる水草が減ると、それを食べる小動物も減りやすくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】発電に使われるエネルギー源を「再生可能なエネルギー」と「量に限りがあるエネルギー」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "太陽光", match: "再生可能なエネルギー"),
        QuizMatchingPair(prompt: "風", match: "再生可能なエネルギー"),
        QuizMatchingPair(prompt: "石油", match: "量に限りがあるエネルギー"),
        QuizMatchingPair(prompt: "石炭", match: "量に限りがあるエネルギー")
        ],
        categories: ["再生可能なエネルギー", "量に限りがあるエネルギー"],
        explanation: "太陽光と風は繰り返し利用できる再生可能なエネルギーです。石油と石炭は、使える量に限りがあるエネルギーです。"
        ),

        QuizQuestion.classification(
        question: "【分類】次の行動を「再使用（リユース）」と「再生利用（リサイクル）」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ガラスびんを洗って繰り返し使う", match: "再使用（リユース）"),
        QuizMatchingPair(prompt: "古紙を原料にして再生紙を作る", match: "再生利用（リサイクル）"),
        QuizMatchingPair(prompt: "服を修理して長く着る", match: "再使用（リユース）"),
        QuizMatchingPair(prompt: "ペットボトルを原料にして繊維を作る", match: "再生利用（リサイクル）")
        ],
        categories: ["再使用（リユース）", "再生利用（リサイクル）"],
        explanation: "「ガラスびんを洗って繰り返し使う」と「服を修理して長く着る」は「再使用（リユース）」に分類します。「古紙を原料にして再生紙を作る」と「ペットボトルを原料にして繊維を作る」は「再生利用（リサイクル）」に分類します。"
        ),

        QuizQuestion(
        question: "水溶液とは、どのような液体ですか？",
        choices: [
        "水に物質が溶けて全体が一様になった液体",
        "水と砂が分かれて見える液体",
        "必ず色がついている液体",
        "水だけでできた氷"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水に物質が溶けて全体が一様になった液体」です。水に物質が溶け、見た目が一様になっている液体を水溶液といいます。"
        ),

        QuizQuestion(
        question: "青色リトマス紙を赤色に変える水溶液の性質はどれですか？",
        choices: [
        "酸性",
        "中性",
        "アルカリ性",
        "必ず無色"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「酸性」です。酸性の水溶液は青色リトマス紙を赤色に変えます。"
        ),

        QuizQuestion(
        question: "赤色リトマス紙を青色に変える水溶液の性質はどれですか？",
        choices: [
        "アルカリ性",
        "酸性",
        "中性",
        "気体"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「アルカリ性」です。アルカリ性の水溶液は赤色リトマス紙を青色に変えます。"
        ),

        QuizQuestion(
        question: "赤色と青色のリトマス紙のどちらの色も変えない水溶液は、一般にどの性質ですか？",
        choices: [
        "中性",
        "酸性",
        "アルカリ性",
        "必ず有毒"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「中性」です。中性の水溶液では、赤色・青色のリトマス紙の色はどちらも変わりません。"
        ),

        QuizQuestion(
        question: "炭酸水の栓を開けると泡が出ます。この泡に多く含まれる気体はどれですか？",
        choices: [
        "二酸化炭素",
        "酸素",
        "窒素だけ",
        "水素"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「二酸化炭素」です。炭酸水には二酸化炭素が溶けています。"
        ),

        QuizQuestion(
        question: "食塩水を少量とり、水だけを蒸発させるとどうなりますか？",
        choices: [
        "食塩が残る",
        "何も残らない",
        "酸素だけが残る",
        "水が金属に変わる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「食塩が残る」です。食塩は水に溶けていますが、水を蒸発させると固体の食塩が残ります。"
        ),

        QuizQuestion(
        question: "炭酸水を加熱せずにしばらく置いたとき、二酸化炭素が少しずつ抜けることがあります。このことから分かることはどれですか？",
        choices: [
        "水溶液には気体が溶けているものがある",
        "気体は水に絶対に溶けない",
        "水溶液はすべて固体だけが溶けている",
        "二酸化炭素は金属である"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水溶液には気体が溶けているものがある」です。炭酸水のように、気体が水に溶けている水溶液もあります。"
        ),

        QuizQuestion(
        question: "うすい塩酸にアルミニウムを入れる実験で、アルミニウムが見えなくなっていきました。最も適切な説明はどれですか？",
        choices: [
        "アルミニウムが塩酸と反応して別の物質に変化した",
        "アルミニウムが水に変わった",
        "アルミニウムが蒸発して空気になった",
        "塩酸がアルミニウムを透明にしただけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「アルミニウムが塩酸と反応して別の物質に変化した」です。金属が塩酸と反応すると、元の金属とは性質の異なる物質ができます。"
        ),

        QuizQuestion(
        question: "塩酸に金属を入れる実験を学校で行うとき、最も大切なことはどれですか？",
        choices: [
        "先生の指示に従い保護眼鏡などを使う",
        "味を確かめる",
        "顔を近づけてにおいを直接かぐ",
        "手につけて反応を見る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「先生の指示に従い保護眼鏡などを使う」です。薬品を扱う実験では、安全のため決められた方法を守ります。"
        ),

        QuizQuestion(
        question: "同じ水溶液が酸性・中性・アルカリ性のどれかを確かめるのに適したものはどれですか？",
        choices: [
        "リトマス紙",
        "方位磁針",
        "乾電池",
        "ばねばかり"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「リトマス紙」です。リトマス紙の色の変化を使うと、水溶液の性質を調べられます。"
        ),

        QuizQuestion(
        question: "水溶液を見た目だけで安全かどうか判断してはいけない主な理由はどれですか？",
        choices: [
        "無色透明でも性質の異なる水溶液があるから",
        "透明な液体はすべて水だから",
        "色のある液体だけが水溶液だから",
        "においがない液体はすべて中性だから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「無色透明でも性質の異なる水溶液があるから」です。見た目だけでは水溶液の性質や安全性は判断できません。"
        ),

        QuizQuestion(
        question: "塩酸に溶けた金属を含む液を蒸発させて固体が残ったとします。この固体について正しい考えはどれですか？",
        choices: [
        "元の金属と同じ性質とは限らない",
        "必ず元の金属そのものである",
        "必ず食塩である",
        "必ず水である"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「元の金属と同じ性質とは限らない」です。塩酸と反応した金属は別の物質に変化しているため、残った固体は元の金属とは異なる性質を示します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】青色リトマス紙を赤色に変える水溶液の性質を何といいますか。",
        answer: "酸性",
        acceptableAnswers: ["さんせい"],
        explanation: "青色リトマス紙を赤色に変える性質を「酸性」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】赤色と青色のリトマス紙のどちらも変化させない水溶液の性質を何といいますか。",
        answer: "中性",
        acceptableAnswers: ["ちゅうせい"],
        explanation: "赤色・青色のリトマス紙の色を変えない性質を「中性」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】赤色リトマス紙を青色に変える水溶液の性質を何といいますか。",
        answer: "アルカリ性",
        acceptableAnswers: ["あるかり性", "あるかりせい"],
        explanation: "赤色リトマス紙を青色に変える性質を「アルカリ性」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】炭酸水に溶けている気体を答えましょう。",
        answer: "二酸化炭素",
        acceptableAnswers: ["にさんかたんそ"],
        explanation: "炭酸水には「二酸化炭素」が溶けています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】水溶液の酸性・中性・アルカリ性を調べるときに使う紙を何といいますか。",
        answer: "リトマス紙",
        acceptableAnswers: ["りとます紙", "りとますし"],
        explanation: "水溶液の性質を調べる代表的な試験紙が「リトマス紙」です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水溶液と、代表的な性質を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "うすい塩酸", match: "酸性"),
        QuizMatchingPair(prompt: "食塩水", match: "中性"),
        QuizMatchingPair(prompt: "石灰水", match: "アルカリ性"),
        QuizMatchingPair(prompt: "炭酸水", match: "酸性")
        ],
        choices: [
        "中性",
        "アルカリ性",
        "酸性"
        ],
        explanation: "うすい塩酸と炭酸水は酸性、食塩水は中性、石灰水はアルカリ性です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水溶液を調べる方法と、分かることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "リトマス紙を使う", match: "酸性・中性・アルカリ性を調べる"),
        QuizMatchingPair(prompt: "水を蒸発させる", match: "溶けている固体が残るか調べる"),
        QuizMatchingPair(prompt: "炭酸水の泡を集める", match: "溶けていた気体を調べる"),
        QuizMatchingPair(prompt: "金属を入れた前後を比べる", match: "金属が変化するか調べる")
        ],
        choices: [
        "金属が変化するか調べる",
        "溶けていた気体を調べる",
        "酸性・中性・アルカリ性を調べる",
        "溶けている固体が残るか調べる"
        ],
        explanation: "調べたい性質に応じて、試験紙、蒸発、気体の確認、金属との反応などの方法を使い分けます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】リトマス紙の変化と、水溶液の性質を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "青色が赤色になる", match: "酸性"),
        QuizMatchingPair(prompt: "赤色が青色になる", match: "アルカリ性"),
        QuizMatchingPair(prompt: "赤色が変わらない・青色も変わらない", match: "中性"),
        QuizMatchingPair(prompt: "青色が変わらず赤色も変わらない", match: "中性")
        ],
        choices: [
        "中性",
        "アルカリ性",
        "酸性"
        ],
        explanation: "酸性は青色を赤色に、アルカリ性は赤色を青色に変えます。中性ではどちらも変わりません。"
        ),

        QuizQuestion.related(
        question: "【関連付け】実験の安全上の注意と、その理由を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "保護眼鏡をつける", match: "薬品が目に入るのを防ぐ"),
        QuizMatchingPair(prompt: "薬品を直接なめない", match: "体に害がある可能性を避ける"),
        QuizMatchingPair(prompt: "においは手であおいで確かめる", match: "気体を直接吸い込まないようにする"),
        QuizMatchingPair(prompt: "こぼしたときは先生に知らせる", match: "決められた方法で安全に処理する")
        ],
        choices: [
        "決められた方法で安全に処理する",
        "薬品が目に入るのを防ぐ",
        "気体を直接吸い込まないようにする",
        "体に害がある可能性を避ける"
        ],
        explanation: "薬品を使う実験では、目や皮膚への接触や吸い込みを避け、先生の指示に従って扱います。"
        ),

        QuizQuestion.classification(
        question: "【分類】水溶液を「酸性」「中性」「アルカリ性」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "うすい塩酸", match: "酸性"),
        QuizMatchingPair(prompt: "炭酸水", match: "酸性"),
        QuizMatchingPair(prompt: "食塩水", match: "中性"),
        QuizMatchingPair(prompt: "石灰水", match: "アルカリ性")
        ],
        categories: ["酸性", "中性", "アルカリ性"],
        explanation: "うすい塩酸と炭酸水は酸性、食塩水は中性、石灰水はアルカリ性です。"
        ),

        QuizQuestion.classification(
        question: "【分類】水に溶けているものを、「主に固体が溶けている」「気体が溶けている」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "食塩水", match: "主に固体が溶けている"),
        QuizMatchingPair(prompt: "砂糖水", match: "主に固体が溶けている"),
        QuizMatchingPair(prompt: "炭酸水", match: "気体が溶けている"),
        QuizMatchingPair(prompt: "二酸化炭素を溶かした水", match: "気体が溶けている")
        ],
        categories: ["主に固体が溶けている", "気体が溶けている"],
        explanation: "食塩や砂糖は固体、炭酸水には二酸化炭素という気体が溶けています。"
        ),

        QuizQuestion.classification(
        question: "【分類】次の行動を、「安全な方法」「危険なのでしてはいけない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "保護眼鏡をつける", match: "安全な方法"),
        QuizMatchingPair(prompt: "先生の指示どおり少量の薬品を使う", match: "安全な方法"),
        QuizMatchingPair(prompt: "薬品をなめる", match: "危険なのでしてはいけない"),
        QuizMatchingPair(prompt: "試験管の口を人に向ける", match: "危険なのでしてはいけない")
        ],
        categories: ["安全な方法", "危険なのでしてはいけない"],
        explanation: "薬品を扱うときは保護具を使い、指示に従います。なめたり、試験管の口を人に向けたりしてはいけません。"
        ),

        QuizQuestion.classification(
        question: "【分類】水溶液を蒸発させた結果を、「固体が残る」「固体が残らないことがある」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "食塩水", match: "固体が残る"),
        QuizMatchingPair(prompt: "砂糖水", match: "固体が残る"),
        QuizMatchingPair(prompt: "炭酸水", match: "固体が残らないことがある"),
        QuizMatchingPair(prompt: "二酸化炭素だけを溶かした水", match: "固体が残らないことがある")
        ],
        categories: ["固体が残る", "固体が残らないことがある"],
        explanation: "固体が溶けている水溶液は水を蒸発させると固体が残ります。気体だけが溶けている場合は固体が残らないことがあります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】リトマス紙で水溶液の性質を調べる手順を、正しい順に並べましょう。",
        choices: [
        "色の変化から性質を判断する",
        "調べる水溶液を少量用意する",
        "使った器具を決められた方法で片づける",
        "赤色と青色のリトマス紙につける"
        ],
        orderedChoices: [
        "調べる水溶液を少量用意する",
        "赤色と青色のリトマス紙につける",
        "色の変化から性質を判断する",
        "使った器具を決められた方法で片づける"
        ],
        explanation: "少量の水溶液を試験紙につけ、色の変化を観察して性質を判断し、安全に片づけます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】食塩水に溶けている物質を確かめる実験の流れを、正しい順に並べましょう。",
        choices: [
        "蒸発皿に少量の食塩水を入れる",
        "残った固体を観察する",
        "安全に注意して水を蒸発させる",
        "食塩水を用意する"
        ],
        orderedChoices: [
        "食塩水を用意する",
        "蒸発皿に少量の食塩水を入れる",
        "安全に注意して水を蒸発させる",
        "残った固体を観察する"
        ],
        explanation: "食塩水から水を蒸発させ、残った固体を観察すると、溶けていた食塩を確かめられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】塩酸と金属の反応を学校で調べるときの流れを、正しい順に並べましょう。",
        choices: [
        "先生の指示で金属を少量入れる",
        "保護眼鏡をつける",
        "反応後のようすを記録する",
        "うすい塩酸を決められた量用意する"
        ],
        orderedChoices: [
        "保護眼鏡をつける",
        "うすい塩酸を決められた量用意する",
        "先生の指示で金属を少量入れる",
        "反応後のようすを記録する"
        ],
        explanation: "薬品と金属を使う実験では安全を最優先し、先生の指示に従って少量で観察します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ量の食塩水を蒸発させたときに残った食塩の質量を、多い順に並べましょう。",
        choices: [
        "A：2.5 g",
        "B：4.0 g",
        "C：1.0 g",
        "D：3.2 g"
        ],
        rankedChoices: [
        "B：4.0 g",
        "D：3.2 g",
        "A：2.5 g",
        "C：1.0 g"
        ],
        explanation: "残った食塩の質量は4.0 g、3.2 g、2.5 g、1.0 gの順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ量の水に溶けている食塩の量を、多い順に並べましょう。",
        choices: [
        "記録A：5 g",
        "記録B：12 g",
        "記録C：8 g",
        "記録D：3 g"
        ],
        rankedChoices: [
        "記録B：12 g",
        "記録C：8 g",
        "記録A：5 g",
        "記録D：3 g"
        ],
        explanation: "数値を比べると、12 g、8 g、5 g、3 gの順です。"
        ),

        QuizQuestion(
        question: "てこで棒が回転するときの中心となる点を何といいますか？",
        choices: [
        "支点",
        "力点",
        "作用点",
        "重心だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「支点」です。てこが回転するときの中心になる点を支点といいます。"
        ),

        QuizQuestion(
        question: "てこで人が力を加える点を何といいますか？",
        choices: [
        "力点",
        "支点",
        "作用点",
        "接点"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「力点」です。人などがてこに力を加える点を力点といいます。"
        ),

        QuizQuestion(
        question: "てこが物に力をはたらかせる点を何といいますか？",
        choices: [
        "作用点",
        "支点",
        "力点",
        "中点"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「作用点」です。てこが持ち上げる物などに力をはたらかせる点を作用点といいます。"
        ),

        QuizQuestion(
        question: "同じ重さの物をてこで持ち上げるとき、一般に小さい力ですませる方法はどれですか？",
        choices: [
        "力点を支点から遠くする",
        "力点を支点に近づける",
        "作用点を支点から遠くするだけ",
        "棒を必ず短くする"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「力点を支点から遠くする」です。支点から力点までの距離を長くすると、小さい力で物を動かしやすくなります。"
        ),

        QuizQuestion(
        question: "てこが水平につり合う条件を表す考え方として正しいものはどれですか？",
        choices: [
        "左右の「力×支点からの距離」が等しい",
        "左右の力だけが必ず等しい",
        "左右の距離だけが必ず等しい",
        "棒の色が左右で同じ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「左右の「力×支点からの距離」が等しい」です。てこのつり合いは、力の大きさと支点からの距離の両方で決まります。"
        ),

        QuizQuestion(
        question: "左側で2 Nの力を支点から30 cmの位置に加えます。右側で支点から20 cmの位置につり合わせるには何Nの力が必要ですか？",
        choices: [
        "3 N",
        "2 N",
        "1 N",
        "6 N"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「3 N」です。左は2×30＝60、右も60にするので、60÷20＝3 Nです。"
        ),

        QuizQuestion(
        question: "同じ力を加えるなら、てこを大きく回しやすいのはどちらですか？",
        choices: [
        "支点から遠い位置に力を加える",
        "支点のすぐ近くに力を加える",
        "どこでも必ず同じ",
        "作用点をなくす"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「支点から遠い位置に力を加える」です。同じ力なら、支点から遠いほどてこを回すはたらきが大きくなります。"
        ),

        QuizQuestion(
        question: "シーソーで体重の軽い人が重い人とつり合いやすくするには、どうするとよいですか？",
        choices: [
        "軽い人が支点から遠くに座る",
        "軽い人が支点のすぐ近くに座る",
        "重い人だけさらに遠くに座る",
        "二人とも支点に座る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「軽い人が支点から遠くに座る」です。小さい力でも支点からの距離を長くすると、つり合わせることができます。"
        ),

        QuizQuestion(
        question: "くぎ抜きでくぎを抜くとき、てこの支点にあたるのはどこですか？",
        choices: [
        "道具が板に触れて回転の中心になるところ",
        "手で持って力を加えるところ",
        "くぎをはさんで引くところ",
        "くぎの先端だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「道具が板に触れて回転の中心になるところ」です。そこを中心に道具が回転します。"
        ),

        QuizQuestion(
        question: "はさみをてことして見たとき、支点にあたる部分はどこですか？",
        choices: [
        "二枚の刃をつないでいる軸",
        "指を入れる持ち手の端",
        "切られる紙の端",
        "刃の先だけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「二枚の刃をつないでいる軸」です。はさみは軸を支点として開閉します。"
        ),

        QuizQuestion(
        question: "てこの実験で、支点からの距離を正しく比べるにはどこから測りますか？",
        choices: [
        "支点から力を加える位置まで",
        "棒の端から机の端まで",
        "床から棒まで",
        "おもりの大きさだけ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「支点から力を加える位置まで」です。てこの規則性では、支点から力点・作用点までの距離が重要です。"
        ),

        QuizQuestion(
        question: "てこを使う道具のよさとして最も適切なものはどれですか？",
        choices: [
        "力の大きさや向きを利用しやすくできる",
        "必ず電気をつくれる",
        "物の重さを0にできる",
        "どんな物でも浮かせ続けられる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「力の大きさや向きを利用しやすくできる」です。てこの仕組みを利用すると、小さい力で動かしたり力の向きを変えたりできます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】てこが回転するときの中心となる点を何といいますか。",
        answer: "支点",
        acceptableAnswers: ["してん"],
        explanation: "てこが回転するときの中心になる点を「支点」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】てこに人が力を加える点を何といいますか。",
        answer: "力点",
        acceptableAnswers: ["りきてん"],
        explanation: "人などが力を加える点を「力点」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】てこが物に力をはたらかせる点を何といいますか。",
        answer: "作用点",
        acceptableAnswers: ["さようてん"],
        explanation: "てこが物に力をはたらかせる点を「作用点」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】棒を使い、支点を中心にして小さい力で物を動かすしくみを何といいますか。",
        answer: "てこ",
        acceptableAnswers: ["梃子"],
        explanation: "このようなしくみを「てこ」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】てこのつり合いでは、力の大きさと支点からの ＿＿ が関係します。",
        answer: "距離",
        acceptableAnswers: ["きょり"],
        explanation: "てこのつり合いは、力の大きさと支点からの「距離」の両方に関係します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】てこの三つの点と、その説明を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "支点", match: "てこが回転する中心"),
        QuizMatchingPair(prompt: "力点", match: "人が力を加える点"),
        QuizMatchingPair(prompt: "作用点", match: "てこが物に力をはたらかせる点"),
        QuizMatchingPair(prompt: "支点からの距離", match: "てこの回しやすさに関係する長さ")
        ],
        choices: [
        "人が力を加える点",
        "てこの回しやすさに関係する長さ",
        "てこが物に力をはたらかせる点",
        "てこが回転する中心"
        ],
        explanation: "支点・力点・作用点の位置と、支点からそれぞれの点までの距離がてこのはたらきに関係します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】てこを利用した道具と、支点にあたる部分を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "はさみ", match: "二枚をつなぐ軸"),
        QuizMatchingPair(prompt: "ペンチ", match: "二本をつなぐ軸"),
        QuizMatchingPair(prompt: "くぎ抜き", match: "板に触れて回転の中心になる部分"),
        QuizMatchingPair(prompt: "シーソー", match: "中央の支え")
        ],
        choices: [
        "二本をつなぐ軸",
        "中央の支え",
        "二枚をつなぐ軸",
        "板に触れて回転の中心になる部分"
        ],
        explanation: "どの道具も、回転の中心になる部分が支点です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】てこの条件の変え方と、起こりやすいことを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "力点を支点から遠くする", match: "小さい力で動かしやすくなる"),
        QuizMatchingPair(prompt: "力点を支点に近づける", match: "同じ物を動かすのに大きい力が必要になりやすい"),
        QuizMatchingPair(prompt: "作用点を支点に近づける", match: "小さい力で持ち上げやすくなる"),
        QuizMatchingPair(prompt: "同じ力で距離を長くする", match: "てこを回すはたらきが大きくなる")
        ],
        choices: [
        "小さい力で持ち上げやすくなる",
        "てこを回すはたらきが大きくなる",
        "小さい力で動かしやすくなる",
        "同じ物を動かすのに大きい力が必要になりやすい"
        ],
        explanation: "てこのはたらきは、力の大きさだけでなく支点からの距離によって変わります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】てこの計算と、力×距離の値を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "2 N×30 cm", match: "60 N・cm"),
        QuizMatchingPair(prompt: "3 N×20 cm", match: "60 N・cm"),
        QuizMatchingPair(prompt: "4 N×10 cm", match: "40 N・cm"),
        QuizMatchingPair(prompt: "1 N×50 cm", match: "50 N・cm")
        ],
        choices: [
        "40 N・cm",
        "50 N・cm",
        "60 N・cm"
        ],
        explanation: "力と支点からの距離を掛けると、てこを回すはたらきを比べられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】てこの点を「支点」「力点」「作用点」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "シーソー中央の支え", match: "支点"),
        QuizMatchingPair(prompt: "シーソーで人が座って力を加える場所", match: "力点"),
        QuizMatchingPair(prompt: "くぎ抜きが板に触れて回る場所", match: "支点"),
        QuizMatchingPair(prompt: "くぎ抜きがくぎを引く場所", match: "作用点")
        ],
        categories: ["支点", "力点", "作用点"],
        explanation: "回転の中心が支点、力を加えるところが力点、物に力をはたらかせるところが作用点です。"
        ),

        QuizQuestion.classification(
        question: "【分類】同じ物を持ち上げるときの条件を、「小さい力で動かしやすい」「大きい力が必要になりやすい」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "力点を支点から遠くする", match: "小さい力で動かしやすい"),
        QuizMatchingPair(prompt: "作用点を支点に近づける", match: "小さい力で動かしやすい"),
        QuizMatchingPair(prompt: "力点を支点に近づける", match: "大きい力が必要になりやすい"),
        QuizMatchingPair(prompt: "作用点を支点から遠くする", match: "大きい力が必要になりやすい")
        ],
        categories: ["小さい力で動かしやすい", "大きい力が必要になりやすい"],
        explanation: "支点から力点までを長く、作用点までを短くすると、小さい力で動かしやすくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】左右の「力×距離」を比べ、てこを「つり合う」「つり合わない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "左2 N×30 cm、右3 N×20 cm", match: "つり合う"),
        QuizMatchingPair(prompt: "左4 N×10 cm、右2 N×20 cm", match: "つり合う"),
        QuizMatchingPair(prompt: "左2 N×20 cm、右3 N×20 cm", match: "つり合わない"),
        QuizMatchingPair(prompt: "左1 N×30 cm、右2 N×20 cm", match: "つり合わない")
        ],
        categories: ["つり合う", "つり合わない"],
        explanation: "左右の「力×支点からの距離」が等しいとき、てこはつり合います。"
        ),

        QuizQuestion.classification(
        question: "【分類】道具を「てこのしくみを利用している」「主にてこのしくみではない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "はさみ", match: "てこのしくみを利用している"),
        QuizMatchingPair(prompt: "ペンチ", match: "てこのしくみを利用している"),
        QuizMatchingPair(prompt: "くぎ抜き", match: "てこのしくみを利用している"),
        QuizMatchingPair(prompt: "方位磁針", match: "主にてこのしくみではない")
        ],
        categories: ["てこのしくみを利用している", "主にてこのしくみではない"],
        explanation: "はさみ、ペンチ、くぎ抜きは支点を中心に動くてこのしくみを利用しています。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】てこのつり合いを調べる実験の手順を、正しい順に並べましょう。",
        choices: [
        "左右のおもりの位置と重さを記録する",
        "てこ実験器の支点を確認する",
        "おもりを左右にかける",
        "水平につり合う位置を探す"
        ],
        orderedChoices: [
        "てこ実験器の支点を確認する",
        "おもりを左右にかける",
        "水平につり合う位置を探す",
        "左右のおもりの位置と重さを記録する"
        ],
        explanation: "支点を確認しておもりをかけ、つり合う位置を探して、力と距離の関係を記録します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】てこの規則性を確かめる流れを、正しい順に並べましょう。",
        choices: [
        "左右の力×距離を計算する",
        "一方の力と距離を決める",
        "結果から規則性を考える",
        "反対側をつり合わせる"
        ],
        orderedChoices: [
        "一方の力と距離を決める",
        "反対側をつり合わせる",
        "左右の力×距離を計算する",
        "結果から規則性を考える"
        ],
        explanation: "条件を決めてつり合わせ、左右の力と距離を計算して比べると、てこの規則性を見つけられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】くぎ抜きをてことして調べる手順を、正しい順に並べましょう。",
        choices: [
        "手で力を加える場所を力点として確認する",
        "回転の中心になる場所を支点として確認する",
        "くぎに力が伝わる場所を作用点として確認する",
        "支点・力点・作用点の位置関係を図にまとめる"
        ],
        orderedChoices: [
        "回転の中心になる場所を支点として確認する",
        "手で力を加える場所を力点として確認する",
        "くぎに力が伝わる場所を作用点として確認する",
        "支点・力点・作用点の位置関係を図にまとめる"
        ],
        explanation: "道具の回転の中心、力を加える場所、物に力がはたらく場所を順に確かめると、てこの三つの点を整理できます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ2 Nの力を加えるとき、てこを回すはたらきが大きい順に並べましょう。",
        choices: [
        "A：支点から10 cm",
        "B：支点から40 cm",
        "C：支点から20 cm",
        "D：支点から30 cm"
        ],
        rankedChoices: [
        "B：支点から40 cm",
        "D：支点から30 cm",
        "C：支点から20 cm",
        "A：支点から10 cm"
        ],
        explanation: "力が同じなら、支点からの距離が長いほどてこを回すはたらきは大きくなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】「力×支点からの距離」の値が大きい順に並べましょう。",
        choices: [
        "A：2 N×20 cm",
        "B：3 N×30 cm",
        "C：3 N×10 cm",
        "D：1 N×50 cm"
        ],
        rankedChoices: [
        "B：3 N×30 cm",
        "D：1 N×50 cm",
        "A：2 N×20 cm",
        "C：3 N×10 cm"
        ],
        explanation: "値はBが90、Dが50、Aが40、Cが30なので、この順になります。"
        ),

    ]
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: balancedShuffledQuizList(quizBeginnerList))
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
