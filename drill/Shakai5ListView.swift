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
        QuizQuestion.classification(
            question: "【分類】生産されるものを 産業の 仲間で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "米", match: "農業"),
                QuizMatchingPair(prompt: "自動車", match: "工業"),
                QuizMatchingPair(prompt: "まぐろ", match: "水産業")
            ],
            categories: ["農業", "工業", "水産業"],
            explanation: "米は 農業、自動車は 工業、まぐろは 水産業に 関係します。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】米の 生産量が 多い順に 並べましょう。",
            choices: ["秋田県", "北海道", "新潟県"],
            rankedChoices: ["新潟県", "北海道", "秋田県"],
            explanation: "米づくりが 盛んな順に、新潟県、北海道、秋田県です。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】日本の 輸出品を 金額が 大きい順に 並べましょう。",
            choices: ["鉄鋼", "自動車", "半導体関連"],
            rankedChoices: ["自動車", "半導体関連", "鉄鋼"],
            explanation: "金額が 一番 大きいのは 自動車で、その次が 半導体関連です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】地域と 盛んな産業が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "北海道", match: "酪農"),
                QuizMatchingPair(prompt: "愛知県", match: "自動車工業"),
                QuizMatchingPair(prompt: "沖縄県", match: "観光業")
            ],
            choices: ["観光業", "自動車工業", "酪農"],
            explanation: "北海道は 酪農、愛知県は 自動車工業、沖縄県は 観光業が 盛んです。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】公害への 取り組みを 古い順に 並べましょう。",
            choices: ["環境省が できる", "公害対策基本法が できる", "公害が 大きな問題に なる", "環境庁が できる"],
            orderedChoices: ["公害が 大きな問題に なる", "公害対策基本法が できる", "環境庁が できる", "環境省が できる"],
            explanation: "公害が問題になったあと、法律や役所が つくられて いきました。"
        ),

        QuizQuestion.related(
            question: "【関連付け】工業地帯と 中心となる都道府県が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "京浜工業地帯", match: "神奈川県"),
                QuizMatchingPair(prompt: "中京工業地帯", match: "愛知県"),
                QuizMatchingPair(prompt: "阪神工業地帯", match: "大阪府")
            ],
            choices: ["愛知県", "大阪府", "神奈川県"],
            explanation: "京浜は 神奈川県、中京は 愛知県、阪神は 大阪府を 中心としています。"
        ),

        QuizQuestion.classification(
            question: "【分類】日本の 貿易を 『輸入』と『輸出』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "石油", match: "輸入"),
                QuizMatchingPair(prompt: "自動車", match: "輸出"),
                QuizMatchingPair(prompt: "小麦", match: "輸入")
            ],
            categories: ["輸入", "輸出"],
            explanation: "日本は 石油や小麦を 輸入し、自動車などを 輸出しています。"
        ),

        QuizQuestion.related(
            question: "【関連付け】都道府県と 盛んな農業が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "北海道", match: "じゃがいも"),
                QuizMatchingPair(prompt: "静岡県", match: "茶"),
                QuizMatchingPair(prompt: "千葉県", match: "落花生")
            ],
            choices: ["茶", "落花生", "じゃがいも"],
            explanation: "北海道は じゃがいも、静岡県は 茶、千葉県は 落花生が よく知られています。"
        ),

        QuizQuestion.related(
            question: "【関連付け】公害病と 発生地が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "水俣病", match: "熊本県"),
                QuizMatchingPair(prompt: "イタイイタイ病", match: "富山県"),
                QuizMatchingPair(prompt: "四日市ぜんそく", match: "三重県")
            ],
            choices: ["三重県", "熊本県", "富山県"],
            explanation: "水俣病は 熊本県、イタイイタイ病は 富山県、四日市ぜんそくは 三重県で 知られています。"
        ),

        QuizQuestion.classification(
            question: "【分類】発電方法を 再生可能エネルギーと 化石燃料で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "太陽光発電", match: "再生可能エネルギー"),
                QuizMatchingPair(prompt: "火力発電", match: "化石燃料"),
                QuizMatchingPair(prompt: "風力発電", match: "再生可能エネルギー")
            ],
            categories: ["再生可能エネルギー", "化石燃料"],
            explanation: "太陽光発電と 風力発電は 再生可能エネルギー、火力発電は 化石燃料を 使います。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】米作りの 流れを 並べましょう。",
            choices: ["出荷", "田植え", "稲刈り"],
            orderedChoices: ["田植え", "稲刈り", "出荷"],
            explanation: "田植えをして 育て、稲刈りをしてから 出荷します。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】工業地帯を 東から 西の 順に 並べましょう。",
            choices: ["中京工業地帯", "阪神工業地帯", "京浜工業地帯"],
            rankedChoices: ["京浜工業地帯", "中京工業地帯", "阪神工業地帯"],
            explanation: "東から見ると、京浜工業地帯、中京工業地帯、阪神工業地帯の順です。"
        ),

        QuizQuestion.related(
            question: "【関連付け】発電方法と 主なエネルギー源が 合うように 選びましょう。",
            pairs: [
                QuizMatchingPair(prompt: "火力発電", match: "石油や 石炭"),
                QuizMatchingPair(prompt: "原子力発電", match: "ウラン"),
                QuizMatchingPair(prompt: "太陽光発電", match: "太陽の光")
            ],
            choices: ["太陽の光", "石油や 石炭", "ウラン"],
            explanation: "火力は 石油や石炭、原子力は ウラン、太陽光は 太陽の光を 利用します。"
        ),

        QuizQuestion.classification(
            question: "【分類】産業を 第一次・第二次・第三次産業で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "漁業", match: "第一次産業"),
                QuizMatchingPair(prompt: "工業", match: "第二次産業"),
                QuizMatchingPair(prompt: "小売業", match: "第三次産業")
            ],
            categories: ["第一次産業", "第二次産業", "第三次産業"],
            explanation: "漁業は 第一次産業、工業は 第二次産業、小売業は 第三次産業です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】自動車が 輸出されるまでの 流れを 並べましょう。",
            choices: ["海外へ 送る", "港へ 運ぶ", "工場で 作る"],
            orderedChoices: ["工場で 作る", "港へ 運ぶ", "海外へ 送る"],
            explanation: "自動車は 工場で作られ、港へ運ばれたあと、海外へ送られます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】都道府県を 面積が 広い順に 並べましょう。",
            choices: ["長野県", "北海道", "香川県"],
            rankedChoices: ["北海道", "長野県", "香川県"],
            explanation: "面積が広い順に 北海道、長野県、香川県です。"
        ),

        QuizQuestion(
            question: "日本の農業で栽培が盛んな作物はどれですか？",
            choices: [
                "大豆",
                "米",
                "小麦",
                "コーヒー"
            ],
            correctAnswerIndex: 1,
            explanation: "日本では米が最も重要な農作物として栽培されています。"
        ),
        QuizQuestion(
            question: "温暖化に伴い増加する可能性がある自然現象はどれですか？",
            choices: [
                "竜巻",
                "地震",
                "干ばつ",
                "津波"
            ],
            correctAnswerIndex: 2,
            explanation: "温暖化により干ばつや異常気象の発生頻度が高くなると考えられています。"
        ),
        QuizQuestion(
            question: "地球温暖化の原因となるガスはどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "アルゴン"
            ],
            correctAnswerIndex: 1,
            explanation: "二酸化炭素は温室効果ガスの一つで、地球温暖化の主な原因となっています。"
        ),
        QuizQuestion(
            question: "日本が多く輸入しているエネルギー資源はどれですか？",
            choices: [
                "天然ガス",
                "石油",
                "ウラン",
                "石炭"
            ],
            correctAnswerIndex: 1,
            explanation: "日本はエネルギー供給のために多くの石油を輸入しています。"
        ),
        QuizQuestion(
            question: "日本で特に多い自然災害はどれですか？",
            choices: [
                "干ばつ",
                "地震",
                "竜巻",
                "火山噴火"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は地震が多い国であり、耐震対策が重要です。"
        ),
        QuizQuestion(
            question: "地球温暖化の影響で進行すると考えられている現象はどれですか？",
            choices: [
                "森林の増加",
                "砂漠化",
                "海面の低下",
                "台風の減少"
            ],
            correctAnswerIndex: 1,
            explanation: "温暖化により、乾燥が進み、砂漠化が進行する可能性があります。"
        ),
        QuizQuestion(
            question: "日本の産業の中で特に発展しているものはどれですか？",
            choices: [
                "漁業",
                "農業",
                "自動車工業",
                "繊維産業"
            ],
            correctAnswerIndex: 2,
            explanation: "日本の自動車工業は世界的に発展しており、重要な輸出産業です。"
        ),
        QuizQuestion(
            question: "日本が輸入している農産物はどれですか？",
            choices: [
                "りんご",
                "お米",
                "大豆",
                "とうもろこし"
            ],
            correctAnswerIndex: 2,
            explanation: "日本は大豆を多く輸入しており、食料や飼料として使用されています。"
        ),
        QuizQuestion(
            question: "地震の発生時に最も重要な行動はどれですか？",
            choices: [
                "火の元を確認する",
                "買い物に行く",
                "テレビを見る",
                "窓を開ける"
            ],
            correctAnswerIndex: 0,
            explanation: "地震発生時には、まず火の元を確認し、火災が発生しないようにすることが大切です。"
        ),
        QuizQuestion(
            question: "日本の気候に影響を与える現象はどれですか？",
            choices: [
                "台風",
                "地震",
                "火山噴火",
                "砂嵐"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は台風の影響を受けやすく、毎年多くの台風が発生します。"
        ),
        QuizQuestion(
            question: "日本で特に発展している産業はどれですか？",
            choices: [
                "自動車工業",
                "農業",
                "漁業",
                "木材産業"
            ],
            correctAnswerIndex: 0,
            explanation: "日本の自動車工業は世界的に有名で、重要な輸出産業です。"
        ),
        QuizQuestion(
            question: "温暖化が進行することで増加する自然災害はどれですか？",
            choices: [
                "竜巻",
                "洪水",
                "干ばつ",
                "地震"
            ],
            correctAnswerIndex: 1,
            explanation: "温暖化により異常気象が増え、洪水などの自然災害が発生しやすくなります。"
        ),
        QuizQuestion(
            question: "日本の主な農産物はどれですか？",
            choices: [
                "リンゴ",
                "米",
                "コーヒー",
                "小麦"
            ],
            correctAnswerIndex: 1,
            explanation: "日本では米が最も重要な農産物の一つとして栽培されています。"
        ),
        QuizQuestion(
            question: "地球温暖化によって引き起こされる可能性がある現象はどれですか？",
            choices: [
                "海面上昇",
                "地震の増加",
                "火山の噴火",
                "竜巻の減少"
            ],
            correctAnswerIndex: 0,
            explanation: "地球温暖化により、氷が溶けて海面が上昇する可能性があります。"
        ),
        QuizQuestion(
            question: "日本が輸入している農産物の一つはどれですか？",
            choices: [
                "お米",
                "大豆",
                "りんご",
                "バナナ"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は大豆を多く輸入しており、食品や飼料として使われています。"
        ),
        QuizQuestion(
            question: "日本の気候に影響を与える要因はどれですか？",
            choices: [
                "赤道に近いこと",
                "四季の変化",
                "海からの距離",
                "山が多いこと"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は四季の変化がはっきりしており、それが気候に大きく影響しています。"
        ),
        QuizQuestion(
            question: "温暖化が進行することで起こる現象はどれですか？",
            choices: [
                "砂漠の拡大",
                "山の高さの変化",
                "地震の増加",
                "洪水の減少"
            ],
            correctAnswerIndex: 0,
            explanation: "温暖化により乾燥が進み、砂漠が拡大する可能性があります。"
        ),
        QuizQuestion(
            question: "日本が多く輸入しているエネルギー資源はどれですか？",
            choices: [
                "石炭",
                "風力",
                "太陽光",
                "石油"
            ],
            correctAnswerIndex: 3,
            explanation: "日本はエネルギー源として多くの石油を輸入しています。"
        ),
        QuizQuestion(
            question: "日本の農業で最も重要な作物はどれですか？",
            choices: [
                "コーヒー",
                "米",
                "バナナ",
                "大豆"
            ],
            correctAnswerIndex: 1,
            explanation: "日本では米が主要な作物として広く栽培されています。"
        ),
        QuizQuestion(
            question: "日本の産業で発展している分野はどれですか？",
            choices: [
                "漁業",
                "農業",
                "自動車工業",
                "林業"
            ],
            correctAnswerIndex: 2,
            explanation: "日本の自動車工業は世界的に有名で、重要な輸出産業です。"
        ),
        QuizQuestion(
            question: "地震の発生に関係する現象はどれですか？",
            choices: [
                "温暖前線",
                "地殻変動",
                "気圧変化",
                "台風"
            ],
            correctAnswerIndex: 1,
            explanation: "地震は地殻変動により発生し、地震波として伝わります。"
        ),
        QuizQuestion(
            question: "日本で起こりやすい自然災害はどれですか？",
            choices: [
                "火山噴火",
                "地震",
                "竜巻",
                "洪水"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は地震が多く発生する国であり、定期的に大きな地震が起こります。"
        ),
        QuizQuestion(
            question: "地球温暖化によって影響を受ける自然現象はどれですか？",
            choices: [
                "海面上昇",
                "降雪量の増加",
                "氷河の増加",
                "台風の減少"
            ],
            correctAnswerIndex: 0,
            explanation: "地球温暖化が進むと、氷が溶け、海面が上昇します。"
        ),
        QuizQuestion(
            question: "日本が輸出している工業製品はどれですか？",
            choices: [
                "自動車",
                "小麦",
                "石炭",
                "リンゴ"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は自動車を多く輸出しており、輸出の主力製品となっています。"
        ),
        QuizQuestion(
            question: "日本の気候に大きく影響するのはどれですか？",
            choices: [
                "モンスーン",
                "北極圏",
                "アマゾン川",
                "赤道直下"
            ],
            correctAnswerIndex: 0,
            explanation: "日本はモンスーン（季節風）の影響を受け、夏は湿潤、冬は乾燥する気候です。"
        ),
        QuizQuestion(
            question: "温暖化が進むことで増加する自然災害はどれですか？",
            choices: [
                "干ばつ",
                "竜巻",
                "地震",
                "津波"
            ],
            correctAnswerIndex: 0,
            explanation: "地球温暖化によって、干ばつや異常気象が増加すると考えられています。"
        ),
        QuizQuestion(
            question: "地震の後に起こる可能性が高い現象はどれですか？",
            choices: [
                "津波",
                "火山噴火",
                "干ばつ",
                "洪水"
            ],
            correctAnswerIndex: 0,
            explanation: "大規模な地震が海底で発生すると、津波が引き起こされることがあります。"
        ),
        QuizQuestion(
            question: "日本が多く輸出している製品はどれですか？",
            choices: [
                "自動車",
                "石油",
                "コーヒー",
                "米"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は自動車を世界中に輸出しており、主な輸出品の一つです。"
        ),
        QuizQuestion(
            question: "地球温暖化の原因とされるガスはどれですか？",
            choices: [
                "酸素",
                "窒素",
                "二酸化炭素",
                "アルゴン"
            ],
            correctAnswerIndex: 2,
            explanation: "二酸化炭素は温室効果ガスの一つで、地球温暖化の主要な原因とされています。"
        ),
        QuizQuestion(
            question: "日本で特に発生しやすい自然災害はどれですか？",
            choices: [
                "竜巻",
                "地震",
                "干ばつ",
                "砂嵐"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は地震が多い国であり、耐震対策が非常に重要です。"
        ),
        QuizQuestion(
            question: "日本の主な輸入品はどれですか？",
            choices: [
                "鉄鉱石",
                "自動車",
                "石油",
                "大豆"
            ],
            correctAnswerIndex: 2,
            explanation: "日本は石油を多く輸入しており、エネルギー供給の主要な部分を占めています。"
        ),
        QuizQuestion(
            question: "地震時に最も重要な行動はどれですか？",
            choices: [
                "テレビの視聴",
                "避難場所への移動",
                "火の元の確認",
                "買い物をする"
            ],
            correctAnswerIndex: 2,
            explanation: "地震時には、まず火の元を確認し、火災を防ぐことが重要です。"
        ),
        QuizQuestion(
            question: "日本が位置しているプレートはどれですか？",
            choices: [
                "ユーラシアプレート",
                "北アメリカプレート",
                "太平洋プレート",
                "フィリピン海プレート"
            ],
            correctAnswerIndex: 0,
            explanation: "西日本は主にユーラシアプレートの上にあります（東日本は北アメリカプレート）。太平洋プレートやフィリピン海プレートはその下に沈み込むため、日本は地震が多発します。"
        ),
        QuizQuestion(
            question: "日本が主に輸入している農産物はどれですか？",
            choices: [
                "大豆",
                "リンゴ",
                "コーヒー",
                "お米"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は大豆を多く輸入しており、食品や飼料として使用されています。"
        ),
        QuizQuestion(
            question: "日本の農業で重要な産物はどれですか？",
            choices: [
                "トウモロコシ",
                "お米",
                "小麦",
                "バナナ"
            ],
            correctAnswerIndex: 1,
            explanation: "日本ではお米が最も重要な農作物として広く栽培されています。"
        ),
        QuizQuestion(
            question: "地震によって引き起こされる可能性が高い災害はどれですか？",
            choices: [
                "洪水",
                "津波",
                "竜巻",
                "干ばつ"
            ],
            correctAnswerIndex: 1,
            explanation: "地震によって海底が動くことで津波が発生することがあります。"
        ),
        QuizQuestion(
            question: "日本で重要な工業製品の一つはどれですか？",
            choices: [
                "自動車",
                "コーヒー",
                "木材",
                "綿花"
            ],
            correctAnswerIndex: 0,
            explanation: "日本の工業製品の中で自動車は非常に重要で、輸出品としても大きな割合を占めています。"
        ),
        QuizQuestion(
            question: "台風が発生する地域はどこですか？",
            choices: [
                "北極",
                "赤道付近",
                "南極",
                "高山地帯"
            ],
            correctAnswerIndex: 1,
            explanation: "台風は主に赤道付近の熱帯低気圧が発達することで発生します。"
        ),
        QuizQuestion(
            question: "温暖化が進むことで予想される影響はどれですか？",
            choices: [
                "海面の上昇",
                "気温の低下",
                "森林の増加",
                "氷河の拡大"
            ],
            correctAnswerIndex: 0,
            explanation: "地球温暖化により、海面が上昇し、沿岸部での浸水被害が増加することが懸念されています。"
        ),
        QuizQuestion(
            question: "日本の主要な輸入品はどれですか？",
            choices: [
                "自動車",
                "石油",
                "お米",
                "魚"
            ],
            correctAnswerIndex: 1,
            explanation: "日本はエネルギー源として石油を多く輸入しています。"
        ),
        QuizQuestion(
            question: "自然災害の中で日本で頻繁に発生するものはどれですか？",
            choices: [
                "津波",
                "竜巻",
                "地震",
                "山火事"
            ],
            correctAnswerIndex: 2,
            explanation: "日本では地震が頻繁に発生し、それに伴う災害も多く発生します。"
        ),
        QuizQuestion(
            question: "日本の農業で特に栽培されている作物はどれですか？",
            choices: [
                "米",
                "大豆",
                "トウモロコシ",
                "小麦"
            ],
            correctAnswerIndex: 0,
            explanation: "日本では米が主な作物として栽培されています。"
        ),
        QuizQuestion(
            question: "台風が日本に来る際に警戒すべき主な現象はどれですか？",
            choices: [
                "強風",
                "雪",
                "火災",
                "地震"
            ],
            correctAnswerIndex: 0,
            explanation: "台風は強風とともに大雨を伴うため、被害を防ぐための対策が必要です。"
        ),
        QuizQuestion(
            question: "世界で最も人口が多い国はどれですか？",
            choices: [
                "アメリカ",
                "インド",
                "中国",
                "ブラジル"
            ],
            correctAnswerIndex: 1,
            explanation: "インドは2023年に中国を抜き、世界で最も人口が多い国になりました。"
        ),
        QuizQuestion(
            question: "自然災害が発生したときに必要な行動はどれですか？",
            choices: [
                "テレビを見る",
                "非常持ち出し袋を持って避難する",
                "部屋でじっとしている",
                "車を運転する"
            ],
            correctAnswerIndex: 1,
            explanation: "自然災害時には、非常持ち出し袋を持って安全な場所に避難することが重要です。"
        ),
        QuizQuestion(
            question: "日本でよく起こる自然災害の一つはどれですか？",
            choices: [
                "竜巻",
                "地震",
                "砂嵐",
                "干ばつ"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は地震が頻繁に発生する国であり、地震に対する備えが重要です。"
        ),
        QuizQuestion(
            question: "日本が多く輸出している製品はどれですか？",
            choices: [
                "石炭",
                "自動車",
                "小麦",
                "鉄鉱石"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は自動車を世界中に輸出しており、主要な輸出品となっています。"
        ),
        QuizQuestion(
            question: "地球温暖化が進むことで増える可能性がある自然災害はどれですか？",
            choices: [
                "地震",
                "洪水",
                "台風",
                "津波"
            ],
            correctAnswerIndex: 2,
            explanation: "地球温暖化により台風の勢力が増すとされており、これが災害のリスクを高めます。"
        ),
        QuizQuestion(
            question: "日本の主要な農産物はどれですか？",
            choices: [
                "コーヒー",
                "米",
                "トウモロコシ",
                "バナナ"
            ],
            correctAnswerIndex: 1,
            explanation: "日本では米が最も重要な農産物の一つとして栽培されています。"
        ),
        QuizQuestion(
            question: "地球温暖化に対して有効な対策はどれですか？",
            choices: [
                "石炭の利用を増やす",
                "電力の節約",
                "森林伐採を増やす",
                "工場の稼働を増やす"
            ],
            correctAnswerIndex: 1,
            explanation: "電力の節約は温暖化対策の一つとして有効です。"
        ),
        QuizQuestion(
            question: "世界で最も面積が広い国はどこですか？",
            choices: [
                "カナダ",
                "中国",
                "ロシア",
                "アメリカ"
            ],
            correctAnswerIndex: 2,
            explanation: "ロシアは世界で最も面積が広い国です。"
        ),
        QuizQuestion(
            question: "日本が多く輸入しているエネルギー資源はどれですか？",
            choices: [
                "天然ガス",
                "木材",
                "石油",
                "鉄鉱石"
            ],
            correctAnswerIndex: 2,
            explanation: "日本はエネルギー源として石油を大量に輸入しています。"
        ),
        QuizQuestion(
            question: "台風の発生原因に関係する現象はどれですか？",
            choices: [
                "温暖前線",
                "寒冷前線",
                "温帯低気圧",
                "熱帯低気圧"
            ],
            correctAnswerIndex: 3,
            explanation: "台風は熱帯低気圧が発達することで発生します。"
        ),
        QuizQuestion(
            question: "日本で主に栽培されている果物はどれですか？",
            choices: [
                "リンゴ",
                "バナナ",
                "マンゴー",
                "ココナッツ"
            ],
            correctAnswerIndex: 0,
            explanation: "日本ではリンゴが主に栽培されている果物の一つです。"
        ),
        QuizQuestion(
            question: "地震発生時に最も重要な行動はどれですか？",
            choices: [
                "避難経路の確認",
                "テレビの視聴",
                "火の元の確認",
                "食料の準備"
            ],
            correctAnswerIndex: 2,
            explanation: "地震発生時には火の元を確認し、火災が発生しないようにすることが重要です。"
        ),
        QuizQuestion(
            question: "台風の進路が主に影響を与える地域はどこですか？",
            choices: [
                "内陸地域",
                "山間部",
                "海沿い地域",
                "高原"
            ],
            correctAnswerIndex: 2,
            explanation: "台風は海沿いの地域に大きな影響を与えます。特に風雨や高潮が被害を引き起こします。"
        ),
        QuizQuestion(
            question: "温室効果ガスの排出を減らすために行われる活動はどれですか？",
            choices: [
                "石炭の使用拡大",
                "エネルギー効率の向上",
                "車の利用拡大",
                "森林伐採の増加"
            ],
            correctAnswerIndex: 1,
            explanation: "エネルギー効率の向上は、温室効果ガスの排出を減らすために重要な活動です。"
        ),
        QuizQuestion(
            question: "日本で重要な輸出品の一つはどれですか？",
            choices: [
                "自動車",
                "コーヒー",
                "大豆",
                "石油"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は自動車を主な輸出品としており、世界中で高いシェアを占めています。"
        ),
        QuizQuestion(
            question: "地球温暖化が引き起こす影響として正しいものはどれですか？",
            choices: [
                "気温の上昇",
                "気温の低下",
                "海面の低下",
                "森林の拡大"
            ],
            correctAnswerIndex: 0,
            explanation: "地球温暖化により、気温の上昇や海面の上昇が起こります。"
        ),
        QuizQuestion(
            question: "日本の農業で特に栽培が盛んな作物はどれですか？",
            choices: [
                "米",
                "バナナ",
                "コーヒー",
                "大豆"
            ],
            correctAnswerIndex: 0,
            explanation: "日本では米が主要な農作物として栽培されています。"
        ),
        QuizQuestion(
            question: "地震に備えるための基本的な対策はどれですか？",
            choices: [
                "避難場所の確認",
                "水の無駄遣い",
                "テレビを見る",
                "車のガソリンを減らす"
            ],
            correctAnswerIndex: 0,
            explanation: "地震に備えるためには、避難場所を確認し、非常時に備えることが大切です。"
        ),
        QuizQuestion(
            question: "世界で最も使用されているエネルギー資源はどれですか？",
            choices: [
                "風力",
                "太陽光",
                "石油",
                "原子力"
            ],
            correctAnswerIndex: 2,
            explanation: "石油は世界中で最も使用されているエネルギー資源です。"
        ),
        QuizQuestion(
            question: "日本で使われる主要なエネルギー源の一つはどれですか？",
            choices: [
                "水力",
                "風力",
                "石油",
                "太陽光"
            ],
            correctAnswerIndex: 2,
            explanation: "日本では石油が主要なエネルギー源として広く使われています。"
        ),
        QuizQuestion(
            question: "日本で行われる重要な農業の一つはどれですか？",
            choices: [
                "果物栽培",
                "漁業",
                "米作",
                "木材伐採"
            ],
            correctAnswerIndex: 2,
            explanation: "日本では米作が非常に重要な農業の一つです。"
        ),
        QuizQuestion(
            question: "環境保護のために行うべき活動はどれですか？",
            choices: [
                "ゴミの分別",
                "プラスチックの多用",
                "森林伐採",
                "水の浪費"
            ],
            correctAnswerIndex: 0,
            explanation: "環境保護のためには、ゴミの分別やリサイクルが重要です。"
        ),
        QuizQuestion(
            question: "地球温暖化の原因となるガスはどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 1,
            explanation: "地球温暖化の主な原因は、二酸化炭素の増加による温室効果です。"
        ),
        QuizQuestion(
            question: "日本で盛んな農産物の一つはどれですか？",
            choices: [
                "小麦",
                "コーヒー",
                "米",
                "綿花"
            ],
            correctAnswerIndex: 2,
            explanation: "日本では米が主要な農産物として栽培されています。"
        ),
        QuizQuestion(
            question: "日本が主に輸出している製品はどれですか？",
            choices: [
                "石油",
                "自動車",
                "小麦",
                "コーヒー"
            ],
            correctAnswerIndex: 1,
            explanation: "日本は自動車産業が盛んで、多くの自動車を世界に輸出しています。"
        ),
        QuizQuestion(
            question: "地震による津波の影響を受けやすい場所はどれですか？",
            choices: [
                "山間部",
                "海岸地域",
                "内陸地域",
                "高原"
            ],
            correctAnswerIndex: 1,
            explanation: "津波は海岸地域で発生しやすく、地震の影響を強く受けます。"
        ),
        QuizQuestion(
            question: "森林の伐採が進むことで発生する問題はどれですか？",
            choices: [
                "砂漠化",
                "温暖化防止",
                "大気汚染の減少",
                "洪水の減少"
            ],
            correctAnswerIndex: 0,
            explanation: "森林伐採により土地が荒廃し、砂漠化が進行することがあります。"
        ),
        QuizQuestion(
            question: "日本が最も多く輸入しているエネルギー資源はどれですか？",
            choices: [
                "石炭",
                "天然ガス",
                "石油",
                "ウラン"
            ],
            correctAnswerIndex: 2,
            explanation: "日本は石油を大量に輸入し、エネルギー源として利用しています。"
        ),
        QuizQuestion(
            question: "温暖化対策として有効な方法はどれですか？",
            choices: [
                "再生可能エネルギーの利用",
                "森林伐採の推進",
                "石炭の多用",
                "化石燃料の輸入増加"
            ],
            correctAnswerIndex: 0,
            explanation: "再生可能エネルギーの利用は、温暖化対策として有効な手段の一つです。"
        ),
        QuizQuestion(
            question: "世界で最も人口の多い国はどこですか？",
            choices: [
                "アメリカ",
                "中国",
                "インド",
                "ロシア"
            ],
            correctAnswerIndex: 2,
            explanation: "インドは2023年に中国を抜き、世界で最も人口が多い国になりました。"
        ),
        QuizQuestion(
            question: "世界で最も面積が広い国はどこですか？",
            choices: [
                "アメリカ",
                "カナダ",
                "ロシア",
                "ブラジル"
            ],
            correctAnswerIndex: 2,
            explanation: "ロシアは世界で最も面積が広い国です。"
        ),
        QuizQuestion(
            question: "地震対策として重要なものはどれですか？",
            choices: [
                "耐震建築",
                "電気の多用",
                "地下の利用",
                "建物の密集"
            ],
            correctAnswerIndex: 0,
            explanation: "耐震建築は地震対策として非常に重要な技術です。"
        ),
        QuizQuestion(
            question: "日本でよく起こる自然災害はどれですか？",
            choices: [
                "地震",
                "洪水",
                "火山噴火",
                "干ばつ"
            ],
            correctAnswerIndex: 0,
            explanation: "日本では地震が頻繁に発生します。特に太平洋沿岸に位置するため、地震が多い地域です。"
        ),
        QuizQuestion(
            question: "日本が輸入しているものはどれですか？",
            choices: [
                "石油",
                "米",
                "魚",
                "野菜"
            ],
            correctAnswerIndex: 0,
            explanation: "日本はエネルギー源として石油を多く輸入しています。"
        ),
        QuizQuestion(
            question: "アメリカの首都はどれですか？",
            choices: [
                "ワシントンD.C.",
                "ニューヨーク",
                "ロサンゼルス",
                "シカゴ"
            ],
            correctAnswerIndex: 0,
            explanation: "アメリカの首都はワシントンD.C.です。ニューヨークやロサンゼルスは大都市ですが、首都ではありません。"
        ),

        QuizQuestion(
        question: "洪水調節を目的とするダムが、大雨のときに果たす働きとして最も適切なものはどれですか？",
        choices: [
        "川の水をすべて海へ流れないようにする",
        "上流からの水を一時的にため、下流へ流れる量を調節する",
        "川底を毎日深く掘り続ける",
        "雨が降らないように雲をなくす"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「上流からの水を一時的にため、下流へ流れる量を調節する」です。洪水調節を行うダムは、大雨の水を一時的にためて下流へ流れる量を調節し、洪水の危険を小さくする働きがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】平均的な海面を0mとして測った、土地の高さを「＿＿」といいます。",
        answer: "標高",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「標高」です。標高は、平均的な海面を基準にして表した土地の高さです。"
        ),

        QuizQuestion.classification(
        question: "【分類】川の場所や特徴を、正しい位置に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "大きな石が多く、流れが速い", match: "上流"),
        QuizMatchingPair(prompt: "川幅が広がり、河原が見られる", match: "中流"),
        QuizMatchingPair(prompt: "流れがゆるやかになり、細かな土砂が運ばれる", match: "下流"),
        QuizMatchingPair(prompt: "川が海や湖へ注ぐ場所", match: "河口")
        ],
        categories: ["上流", "中流", "下流", "河口"],
        explanation: "大きな石が多く流れが速いのは「上流」、川幅が広がり河原が見られるのは「中流」、流れがゆるやかなのは「下流」、川が海や湖へ注ぐ場所は「河口」です。"
        ),

        QuizQuestion(
        question: "北海道の東側から三陸沖へ流れる寒流はどれですか？",
        choices: [
        "黒潮",
        "対馬海流",
        "津軽暖流",
        "親潮"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「親潮」です。親潮は北海道の東側から三陸沖へ流れる寒流で、冷たい海水を運びます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】気象情報と、その情報を生活に生かす例が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "大雨警報", match: "川の増水や土砂災害の危険を確認する"),
        QuizMatchingPair(prompt: "降水確率", match: "雨具を用意するか考える"),
        QuizMatchingPair(prompt: "最高気温の予報", match: "暑さに備えて水分補給などを考える"),
        QuizMatchingPair(prompt: "積雪情報", match: "道路や鉄道への影響を確かめる")
        ],
        choices: [
        "道路や鉄道への影響を確かめる",
        "暑さに備えて水分補給などを考える",
        "川の増水や土砂災害の危険を確認する",
        "雨具を用意するか考える"
        ],
        explanation: "大雨警報は災害の危険確認、降水確率は雨への備え、最高気温の予報は暑さ対策、積雪情報は交通への影響を確認するために役立ちます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】12月から2月までの雪日数が最も多く、同じ期間の日照時間が最も短い地点を答えましょう。",
        answer: "B地点",
        acceptableAnswers: ["B"],
        referenceTitle: "冬の雪日数と日照時間（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地点", value: "雪日数8日・日照420時間"),
        QuizReferenceRow(label: "B地点", value: "雪日数62日・日照170時間"),
        QuizReferenceRow(label: "C地点", value: "雪日数21日・日照350時間"),
        QuizReferenceRow(label: "D地点", value: "雪日数45日・日照230時間")
        ],
        explanation: "正解は「B地点」です。B地点は雪日数が62日で最も多く、日照時間も170時間で最も短くなっています。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある10年間の台風接近数が、A地域3回、B地域7回、C地域5回、D地域9回でした。接近数が多い順に並べましょう。",
        choices: ["A地域", "B地域", "C地域", "D地域"],
        rankedChoices: ["D地域", "B地域", "C地域", "A地域"],
        explanation: "台風接近数はD地域9回、B地域7回、C地域5回、A地域3回なので、「D地域、B地域、C地域、A地域」の順です。"
        ),

        QuizQuestion(
        question: "同じ畑で育てる作物を何年かごとに変える「輪作」を行う利点として、最も適切なものはどれですか？",
        choices: [
        "毎年まったく同じ病害虫だけを増やすため",
        "畑に水を一切与えなくてよくするため",
        "特定の病害虫の増加や土の養分のかたよりをおさえやすくするため",
        "どの作物も収穫しなくてよくするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「特定の病害虫の増加や土の養分のかたよりをおさえやすくするため」です。輪作では育てる作物を変えることで、連作による病害虫や土の状態の悪化を防ぎやすくします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】家畜のふんや落ち葉などを発酵させてつくる肥料を「＿＿」といいます。",
        answer: "堆肥",
        acceptableAnswers: ["たい肥"],
        explanation: "＿＿に入る言葉は「堆肥」です。堆肥は、家畜のふんや植物などの有機物を発酵させてつくる肥料です。"
        ),

        QuizQuestion.classification(
        question: "【分類】農業で使うものを、正しい種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "トラクター", match: "農業機械"),
        QuizMatchingPair(prompt: "化成肥料", match: "肥料"),
        QuizMatchingPair(prompt: "配合飼料", match: "飼料"),
        QuizMatchingPair(prompt: "野菜の苗", match: "苗")
        ],
        categories: ["農業機械", "肥料", "飼料", "苗"],
        explanation: "トラクターは「農業機械」、化成肥料は「肥料」、配合飼料は家畜に与える「飼料」、野菜の苗は「苗」に分けられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】じゃがいもを畑で育てて出荷するまでの主な流れを、早い順に並べましょう。",
        choices: [
        "大きさなどを選別して出荷する",
        "畑を耕して種いもを植える",
        "茎や葉が枯れてきたころに収穫する",
        "芽が伸びたら株元へ土を寄せる"
        ],
        orderedChoices: [
        "畑を耕して種いもを植える",
        "芽が伸びたら株元へ土を寄せる",
        "茎や葉が枯れてきたころに収穫する",
        "大きさなどを選別して出荷する"
        ],
        explanation: "主な流れは「畑を耕して種いもを植える、芽が伸びたら株元へ土を寄せる、茎や葉が枯れてきたころに収穫する、大きさなどを選別して出荷する」の順です。"
        ),

        QuizQuestion(
        question: "海岸から沖へ続く浅くてゆるやかな海底である大陸棚が、好漁場になりやすい理由として最も適切なものはどれですか？",
        choices: [
        "太陽の光が届きやすく、プランクトンなどが育ちやすい海域があるから",
        "海水がすべて真水になるから",
        "魚が海底から出られなくなるから",
        "一年中どこでも同じ水温になるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「太陽の光が届きやすく、プランクトンなどが育ちやすい海域があるから」です。浅い大陸棚では生物が育ちやすい場所があり、多くの魚が集まる漁場になることがあります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水産業を支える組織や施設と、その主な役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "漁業協同組合", match: "漁業者の共同販売や資材購入などを支える"),
        QuizMatchingPair(prompt: "水産試験場", match: "水産資源や養殖技術などを調査・研究する"),
        QuizMatchingPair(prompt: "製氷施設", match: "魚を冷やすための氷をつくる"),
        QuizMatchingPair(prompt: "卸売市場", match: "集まった水産物を取引して小売店などへつなぐ")
        ],
        choices: [
        "魚を冷やすための氷をつくる",
        "集まった水産物を取引して小売店などへつなぐ",
        "水産資源や養殖技術などを調査・研究する",
        "漁業者の共同販売や資材購入などを支える"
        ],
        explanation: "漁業協同組合は漁業者の共同活動を支え、水産試験場は調査・研究、製氷施設は鮮度保持に使う氷の製造、卸売市場は水産物の取引を行います。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】販売額を水揚げ量で割ったとき、1トンあたりの販売額が最も高い港を答えましょう。",
        answer: "D港",
        acceptableAnswers: ["D"],
        referenceTitle: "水揚げ量と販売額（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A港", value: "20トン・600万円"),
        QuizReferenceRow(label: "B港", value: "15トン・570万円"),
        QuizReferenceRow(label: "C港", value: "25トン・750万円"),
        QuizReferenceRow(label: "D港", value: "10トン・420万円")
        ],
        explanation: "正解は「D港」です。1トンあたりの販売額はA港30万円、B港38万円、C港30万円、D港42万円なので、D港が最も高くなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】漁獲可能量とすでに漁獲した量から、これから漁獲できる残りの量が多い順に並べましょう。A海域は100トン中72トン、B海域は120トン中95トン、C海域は90トン中40トン、D海域は150トン中110トンをすでに漁獲しています。",
        choices: ["A海域", "B海域", "C海域", "D海域"],
        rankedChoices: ["C海域", "D海域", "A海域", "B海域"],
        explanation: "残りはA海域28トン、B海域25トン、C海域50トン、D海域40トンなので、「C海域、D海域、A海域、B海域」の順です。"
        ),

        QuizQuestion(
        question: "工場で組立ラインを使い、作業をいくつかの工程に分ける主な利点はどれですか？",
        choices: [
        "一人がすべての工程を毎回行う必要がある",
        "作業を分担し、製品を効率よくつくりやすい",
        "部品を使わずに製品をつくれる",
        "完成品を運ばなくてよくなる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「作業を分担し、製品を効率よくつくりやすい」です。組立ラインでは工程ごとに作業を分担し、製品を連続して効率よくつくることができます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】製品や機械の洗浄・冷却など、工場の生産活動で使われる水を「＿＿」といいます。",
        answer: "工業用水",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「工業用水」です。工業用水は、工場で製品や機械を洗ったり冷やしたりするなど、生産活動に利用される水です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】製造業の仕事の部門と、その主な役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "研究開発部門", match: "新しい製品や技術を考える"),
        QuizMatchingPair(prompt: "調達部門", match: "必要な原料や部品をそろえる"),
        QuizMatchingPair(prompt: "製造部門", match: "原料や部品を加工・組み立てする"),
        QuizMatchingPair(prompt: "品質管理部門", match: "製品が決められた品質を満たすか確かめる")
        ],
        choices: [
        "必要な原料や部品をそろえる",
        "製品が決められた品質を満たすか確かめる",
        "新しい製品や技術を考える",
        "原料や部品を加工・組み立てする"
        ],
        explanation: "研究開発部門は新製品や技術、調達部門は原料や部品、製造部門は加工・組み立て、品質管理部門は製品の品質確認を担当します。"
        ),

        QuizQuestion.classification(
        question: "【分類】工業製品を、主な工業の種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自動車用タイヤ", match: "ゴム製品工業"),
        QuizMatchingPair(prompt: "セメント", match: "窯業・土石製品工業"),
        QuizMatchingPair(prompt: "衣服", match: "繊維工業"),
        QuizMatchingPair(prompt: "医薬品", match: "化学工業")
        ],
        categories: ["ゴム製品工業", "窯業・土石製品工業", "繊維工業", "化学工業"],
        explanation: "自動車用タイヤは「ゴム製品工業」、セメントは「窯業・土石製品工業」、衣服は「繊維工業」、医薬品は「化学工業」に分けられます。"
        ),

        QuizQuestion(
        question: "外国で20ドルの商品を買うとします。手数料などを考えない場合、1ドル100円のときは2000円ですが、1ドル150円になると何円必要ですか？",
        choices: [
        "1000円",
        "2000円",
        "2500円",
        "3000円"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「3000円」です。20ドル×150円＝3000円です。同じ20ドルの商品でも、1ドルと交換するのに必要な円が増えると、円で支払う金額も増えます。"
        ),

        QuizQuestion.classification(
        question: "【分類】日本の貿易相手となることがある国を、位置する地域に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カナダ", match: "北アメリカ"),
        QuizMatchingPair(prompt: "ブラジル", match: "南アメリカ"),
        QuizMatchingPair(prompt: "タイ", match: "アジア"),
        QuizMatchingPair(prompt: "オーストラリア", match: "オセアニア")
        ],
        categories: ["北アメリカ", "南アメリカ", "アジア", "オセアニア"],
        explanation: "カナダは「北アメリカ」、ブラジルは「南アメリカ」、タイは「アジア」、オーストラリアは「オセアニア」に位置します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】外国で生産されたバナナが日本の店に並ぶまでの主な流れを、早い順に並べましょう。",
        choices: [
        "日本で植物検疫を受ける",
        "外国の農園で青い状態のバナナを収穫する",
        "日本で追熟させて店へ出荷する",
        "冷蔵コンテナなどで日本へ運ぶ"
        ],
        orderedChoices: [
        "外国の農園で青い状態のバナナを収穫する",
        "冷蔵コンテナなどで日本へ運ぶ",
        "日本で植物検疫を受ける",
        "日本で追熟させて店へ出荷する"
        ],
        explanation: "主な流れは「外国で青い状態のバナナを収穫する、冷蔵コンテナなどで日本へ運ぶ、植物検疫を受ける、日本で追熟させて店へ出荷する」の順です。"
        ),

        QuizQuestion(
        question: "インターネットで災害について調べるとき、情報が現在も役立つものか確かめるために、まず確認したいことはどれですか？",
        choices: [
        "情報が発信・更新された日時",
        "文章に使われている文字の大きさ",
        "ページの背景の色",
        "写真が何枚使われているか"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「情報が発信・更新された日時」です。災害情報は状況が変化するため、いつ発信・更新された情報なのかを確認することが重要です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】正方形の模様をスマートフォンなどで読み取り、ウェブページや情報を表示できるコードを「＿＿」といいます。",
        answer: "QRコード",
        acceptableAnswers: ["QR"],
        explanation: "＿＿に入る言葉は「QRコード」です。QRコードを読み取ることで、文字やウェブページなどの情報へすばやくアクセスできます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】情報を安全に扱うための方法と、その目的が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "バックアップ", match: "データが失われたときに復元できるようコピーを残す"),
        QuizMatchingPair(prompt: "ソフトウェアの更新", match: "見つかった安全上の問題を修正する"),
        QuizMatchingPair(prompt: "画面ロック", match: "他人に端末を勝手に使われにくくする"),
        QuizMatchingPair(prompt: "アクセス権限", match: "情報を見たり変更したりできる人を制限する")
        ],
        choices: [
        "情報を見たり変更したりできる人を制限する",
        "他人に端末を勝手に使われにくくする",
        "データが失われたときに復元できるようコピーを残す",
        "見つかった安全上の問題を修正する"
        ],
        explanation: "バックアップはデータの復元、ソフトウェアの更新は安全上の問題の修正、画面ロックは端末の不正利用防止、アクセス権限は利用できる人の制限に役立ちます。"
        ),

        QuizQuestion(
        question: "海に流れ出たプラスチックが細かく砕けてできるマイクロプラスチックが問題になる理由として、最も適切なものはどれですか？",
        choices: [
        "海水をすべて飲み水に変えるから",
        "海の深さを急に浅くするから",
        "海の生き物が取り込むなど、生態系へ影響するおそれがあるから",
        "海岸の砂をすべて増やすから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「海の生き物が取り込むなど、生態系へ影響するおそれがあるから」です。細かなプラスチックは回収しにくく、生き物がえさと間違えて取り込むことなどが問題になっています。"
        ),

        QuizQuestion(
        question: "干潟を保全することが環境を守ることにつながる理由として、最も適切なものはどれですか？",
        choices: [
        "干潟には生き物がほとんどいないから",
        "多くの生き物のすみかやえさ場になり、水をきれいにする働きもあるから",
        "海水が干潟では完全に蒸発するから",
        "干潟を残すと潮の満ち引きがなくなるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「多くの生き物のすみかやえさ場になり、水をきれいにする働きもあるから」です。干潟には多様な生き物が暮らし、水中の有機物などを取り込む生き物の働きも見られます。"
        ),

        QuizQuestion(
        question: "太陽光発電や風力発電に共通する課題として、最も適切なものはどれですか？",
        choices: [
        "天候や時間帯によって発電量が変化しやすい",
        "発電すると必ず石油を同じ量だけ燃やす必要がある",
        "どこに設置しても一年中まったく同じ量を発電できる",
        "発電に太陽や風を利用することができない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「天候や時間帯によって発電量が変化しやすい」です。太陽光や風力は自然条件を利用するため、日差しや風の強さなどによって発電量が変わります。"
        ),

        QuizQuestion(
        question: "日本の国土が南北に長いことによる特色として、最も適切なものはどれですか？",
        choices: [
        "日本全国の気候がほぼ同じになる",
        "すべての都道府県が太平洋に面する",
        "北と南で気温や季節の進み方に違いが見られる",
        "どの地域にも山地がなくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「北と南で気温や季節の進み方に違いが見られる」です。日本は南北に長いため、北と南では気温や季節の進み方などに違いが見られます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】同じ川とその支流に雨や雪どけ水が集まる地域全体を、その川の「＿＿」といいます。",
        answer: "流域",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「流域」です。流域は、降った雨や雪どけ水が同じ川やその支流へ集まる範囲を表します。"
        ),

        QuizQuestion.classification(
        question: "【分類】土地の使われ方を、正しい種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "駅の近くに商店や事務所が集まっている", match: "商業・業務用地"),
        QuizMatchingPair(prompt: "家や集合住宅がまとまって建っている", match: "住宅地"),
        QuizMatchingPair(prompt: "工場や大きな倉庫が集まっている", match: "工業用地"),
        QuizMatchingPair(prompt: "田や畑として作物を育てている", match: "農地")
        ],
        categories: ["商業・業務用地", "住宅地", "工業用地", "農地"],
        explanation: "駅周辺の商店や事務所は「商業・業務用地」、家や集合住宅は「住宅地」、工場や倉庫は「工業用地」、田畑は「農地」に分けられます。"
        ),

        QuizQuestion(
        question: "海に近い地域では、内陸に比べて一日の気温の変化が小さくなりやすいのはなぜですか？",
        choices: [
        "海水は陸地より温まりにくく冷めにくく、気温の変化を和らげるから",
        "海の近くでは太陽が昇らないから",
        "海水には熱がまったく伝わらないから",
        "海岸では一年中同じ風だけが吹くから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「海水は陸地より温まりにくく冷めにくく、気温の変化を和らげるから」です。海の影響を受ける地域では、内陸より気温の変化が小さくなりやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】気象や気候による現象と、起こりやすい影響が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "大雪", match: "道路や鉄道の交通に支障が出る"),
        QuizMatchingPair(prompt: "冷害", match: "低温によって農作物の生育が悪くなる"),
        QuizMatchingPair(prompt: "干ばつ", match: "雨が少なく水不足になりやすい"),
        QuizMatchingPair(prompt: "猛暑", match: "熱中症への注意が特に必要になる")
        ],
        choices: [
        "熱中症への注意が特に必要になる",
        "雨が少なく水不足になりやすい",
        "道路や鉄道の交通に支障が出る",
        "低温によって農作物の生育が悪くなる"
        ],
        explanation: "大雪は交通への支障、冷害は農作物の生育不良、干ばつは水不足、猛暑は熱中症の危険の高まりにつながります。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】年間降水量のうち、6月と7月の降水量が占める割合が最も高い地点を答えましょう。",
        answer: "D地点",
        acceptableAnswers: ["D"],
        referenceTitle: "年間降水量と6・7月の降水量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地点", value: "年間1600mm・6月と7月480mm"),
        QuizReferenceRow(label: "B地点", value: "年間1200mm・6月と7月420mm"),
        QuizReferenceRow(label: "C地点", value: "年間2000mm・6月と7月500mm"),
        QuizReferenceRow(label: "D地点", value: "年間1500mm・6月と7月600mm")
        ],
        explanation: "正解は「D地点」です。6月と7月の割合は、A地点30％、B地点35％、C地点25％、D地点40％なので、D地点が最も高くなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ緯度で、ほかの条件が同じとすると、気温が高くなりやすい順に並べましょう。",
        choices: ["標高1000mの地点", "標高100mの地点", "標高1500mの地点", "標高500mの地点"],
        rankedChoices: ["標高100mの地点", "標高500mの地点", "標高1000mの地点", "標高1500mの地点"],
        explanation: "一般に標高が高くなるほど気温は低くなるため、「標高100m、500m、1000m、1500m」の順に気温が高くなりやすいです。"
        ),

        QuizQuestion(
        question: "収穫した野菜を出荷前にすばやく冷やす「予冷」を行う主な目的はどれですか？",
        choices: [
        "野菜を必ず甘くするため",
        "収穫後に野菜をさらに大きくするため",
        "野菜の水分をすべてなくすため",
        "鮮度の低下をおさえたまま消費地へ届けるため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「鮮度の低下をおさえたまま消費地へ届けるため」です。収穫後の野菜をすばやく冷やすことで、品質や鮮度を保ちやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】牛、豚、鶏などの家畜を育て、肉や乳、卵などを生産する農業を「＿＿」といいます。",
        answer: "畜産",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「畜産」です。畜産では、牛、豚、鶏などを育て、肉、乳、卵などを生産します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】家畜と、主に生産されるものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乳牛", match: "牛乳"),
        QuizMatchingPair(prompt: "肉用牛", match: "牛肉"),
        QuizMatchingPair(prompt: "豚", match: "豚肉"),
        QuizMatchingPair(prompt: "採卵鶏", match: "鶏卵")
        ],
        choices: ["鶏卵", "豚肉", "牛乳", "牛肉"],
        explanation: "乳牛からは牛乳、肉用牛からは牛肉、豚からは豚肉、採卵鶏からは鶏卵が主に生産されます。"
        ),

        QuizQuestion.classification(
        question: "【分類】農産物が消費者へ届くまでの作業を、主な役割で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "畑に苗を植えて育てる", match: "生産"),
        QuizMatchingPair(prompt: "大きさや品質をそろえる", match: "選別"),
        QuizMatchingPair(prompt: "低い温度で品質を保つ", match: "保管"),
        QuizMatchingPair(prompt: "店で消費者に商品を売る", match: "販売")
        ],
        categories: ["生産", "選別", "保管", "販売"],
        explanation: "苗を育てるのは「生産」、大きさや品質をそろえるのは「選別」、低温で品質を保つのは「保管」、店で売るのは「販売」です。"
        ),

        QuizQuestion(
        question: "漁業者が人工衛星から得られる海面水温の情報を利用する主な目的はどれですか？",
        choices: [
        "海の深さをすべて同じにするため",
        "魚が集まりやすい海域を予想する手がかりにするため",
        "魚を船の上で自動的に増やすため",
        "港の土地の値段を決めるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「魚が集まりやすい海域を予想する手がかりにするため」です。魚の種類によって好む水温が異なるため、海面水温の情報は漁場を探す手がかりになります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水産資源を守る取り組みと、そのねらいが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "漁獲可能量を決める", match: "一年間にとる量の上限を設ける"),
        QuizMatchingPair(prompt: "網の目を大きくする", match: "小さな魚が網から逃げられるようにする"),
        QuizMatchingPair(prompt: "稚魚を放流する", match: "将来成長する魚を増やすことにつなげる"),
        QuizMatchingPair(prompt: "藻場を守る", match: "魚の産卵や成長の場所を守る")
        ],
        choices: [
        "魚の産卵や成長の場所を守る",
        "小さな魚が網から逃げられるようにする",
        "一年間にとる量の上限を設ける",
        "将来成長する魚を増やすことにつなげる"
        ],
        explanation: "漁獲可能量は漁獲量の上限、網目の調整は小魚の保護、稚魚の放流は将来の資源確保、藻場の保全は産卵や成長の場所を守ることにつながります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】のりの養殖で、網に種をつけてから製品として出荷するまでの主な流れを、早い順に並べましょう。",
        choices: [
        "摘み取ったのりを加工して乾燥させる",
        "のりの種を網につける",
        "乾燥したのりを包装して出荷する",
        "網を海で育て、のりを成長させる"
        ],
        orderedChoices: [
        "のりの種を網につける",
        "網を海で育て、のりを成長させる",
        "摘み取ったのりを加工して乾燥させる",
        "乾燥したのりを包装して出荷する"
        ],
        explanation: "主な流れは「のりの種を網につける、海で育てる、摘み取って加工・乾燥する、包装して出荷する」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】漁港から漁場までの距離が、A船18km、B船240km、C船65km、D船1200kmでした。漁場が近い順に並べましょう。",
        choices: ["A船", "B船", "C船", "D船"],
        rankedChoices: ["A船", "C船", "B船", "D船"],
        explanation: "距離はA船18km、C船65km、B船240km、D船1200kmなので、漁場が近い順は「A船、C船、B船、D船」です。"
        ),

        QuizQuestion(
        question: "工場で部品を必要なときに必要な量だけ届けてもらう生産の工夫には、どのような利点がありますか？",
        choices: [
        "工場で使う部品の種類を一種類にできる",
        "完成した製品を検査しなくてよくなる",
        "部品の在庫を減らし、保管にかかる負担を小さくできる",
        "製品を運ぶ道路が必要なくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「部品の在庫を減らし、保管にかかる負担を小さくできる」です。必要な部品を必要なときに受け取ることで、多くの在庫を抱える必要が少なくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】原料や部品を加工・組み立てして製品をつくる産業を「＿＿」といいます。",
        answer: "製造業",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「製造業」です。製造業では、原料や部品を加工したり組み立てたりして、さまざまな製品をつくります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場で使われる技術や仕組みと、その主な役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "CAD", match: "コンピュータを使って製品を設計する"),
        QuizMatchingPair(prompt: "バーコード", match: "部品や製品の情報を読み取って管理する"),
        QuizMatchingPair(prompt: "センサー", match: "温度や位置などの状態を検知する"),
        QuizMatchingPair(prompt: "自動倉庫", match: "部品や製品を自動で保管・取り出しする")
        ],
        choices: [
        "部品や製品を自動で保管・取り出しする",
        "コンピュータを使って製品を設計する",
        "温度や位置などの状態を検知する",
        "部品や製品の情報を読み取って管理する"
        ],
        explanation: "CADは設計、バーコードは情報管理、センサーは状態の検知、自動倉庫は部品や製品の保管・取り出しの自動化に使われます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】生産した製品に対する不良品の割合が最も低い工場を答えましょう。",
        answer: "B工場",
        acceptableAnswers: ["B"],
        referenceTitle: "1日の生産数と不良品数（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A工場", value: "生産1000個・不良品10個"),
        QuizReferenceRow(label: "B工場", value: "生産800個・不良品4個"),
        QuizReferenceRow(label: "C工場", value: "生産1200個・不良品12個"),
        QuizReferenceRow(label: "D工場", value: "生産900個・不良品9個")
        ],
        explanation: "正解は「B工場」です。不良品の割合はA工場1％、B工場0.5％、C工場1％、D工場1％なので、B工場が最も低くなります。"
        ),

        QuizQuestion(
        question: "外国から生鮮食品を輸入するときに利用される「コールドチェーン」の説明として、正しいものはどれですか？",
        choices: [
        "生産地から販売まで低い温度を保ちながら運び、品質を保つ仕組み",
        "外国の商品をすべて同じ価格で売る仕組み",
        "貨物を冷やさずに長期間屋外へ置く仕組み",
        "輸入品を船では運ばないようにする仕組み"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「生産地から販売まで低い温度を保ちながら運び、品質を保つ仕組み」です。冷蔵・冷凍設備をつないで温度を管理することで、生鮮食品などの品質を保ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】外国との貿易で運ばれる貨物を、適した運び方や状態に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "冷凍まぐろ", match: "冷凍貨物"),
        QuizMatchingPair(prompt: "生花", match: "航空貨物"),
        QuizMatchingPair(prompt: "原油", match: "液体貨物"),
        QuizMatchingPair(prompt: "鉄鉱石", match: "ばら積み貨物")
        ],
        categories: ["冷凍貨物", "航空貨物", "液体貨物", "ばら積み貨物"],
        explanation: "冷凍まぐろは低温を保つ「冷凍貨物」、生花は短時間で運ぶ「航空貨物」、原油は「液体貨物」、鉄鉱石は包装せず大量に積む「ばら積み貨物」に適しています。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】外国で生産された小麦が、日本でパンになるまでの主な流れを、早い順に並べましょう。",
        choices: [
        "製粉工場で小麦粉にする",
        "外国の農場で小麦を収穫する",
        "パン工場でパンをつくる",
        "船で日本の港へ運ぶ"
        ],
        orderedChoices: [
        "外国の農場で小麦を収穫する",
        "船で日本の港へ運ぶ",
        "製粉工場で小麦粉にする",
        "パン工場でパンをつくる"
        ],
        explanation: "主な流れは「外国で小麦を収穫する、船で日本へ運ぶ、製粉工場で小麦粉にする、パン工場でパンをつくる」の順です。"
        ),

        QuizQuestion(
        question: "インターネット上のグラフや統計を見るとき、情報を正しく読み取るために大切なことはどれですか？",
        choices: [
        "グラフの見た目だけで内容を決める",
        "数字が大きい資料だけを信用する",
        "出典や調査した時期を確認しない",
        "縦軸や横軸、単位、期間、出典を確認する"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「縦軸や横軸、単位、期間、出典を確認する」です。グラフや統計は、何をどの単位や期間で調べた資料なのかを確かめて読むことが大切です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】情報を集めたり加工したりして、社会や人々に提供することを中心とする産業を「＿＿」といいます。",
        answer: "情報産業",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「情報産業」です。情報産業には、情報を集め、加工し、伝えたり提供したりする仕事が含まれます。"
        ),

        QuizQuestion.classification(
        question: "【分類】情報を集める方法を、正しい調査方法に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "専門家に直接質問して話を聞く", match: "インタビュー"),
        QuizMatchingPair(prompt: "多くの人に同じ質問へ回答してもらう", match: "アンケート"),
        QuizMatchingPair(prompt: "現地へ行って土地の様子を自分で確かめる", match: "現地調査"),
        QuizMatchingPair(prompt: "国や自治体が公表した数値を調べる", match: "統計資料の利用")
        ],
        categories: ["インタビュー", "アンケート", "現地調査", "統計資料の利用"],
        explanation: "直接話を聞くのは「インタビュー」、多くの人から回答を集めるのは「アンケート」、現地で確かめるのは「現地調査」、公表された数値を使うのは「統計資料の利用」です。"
        ),

        QuizQuestion(
        question: "国立公園が設けられている主な目的として、最も適切なものはどれですか？",
        choices: [
        "自然をすべて工場用地に変えるため",
        "すぐれた自然の風景や環境を守りながら、適切に利用するため",
        "公園の中の生き物をすべて別の地域へ移すため",
        "道路や建物だけを増やすため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「すぐれた自然の風景や環境を守りながら、適切に利用するため」です。国立公園では、貴重な自然を保護しながら、人々が自然に親しめるようにしています。"
        ),

        QuizQuestion(
        question: "バイオマスエネルギーの原料として利用できるものはどれですか？",
        choices: [
        "鉄鉱石だけ",
        "海水だけ",
        "木くずや家畜のふん、生ごみなどの生物由来の資源",
        "ガラスや金属だけ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「木くずや家畜のふん、生ごみなどの生物由来の資源」です。バイオマスは、生物から生まれた資源をエネルギーなどに利用する考え方です。"
        ),

        QuizQuestion(
        question: "森林で木を適度に切る「間伐」を行う主な目的はどれですか？",
        choices: [
        "残った木に光が届きやすくし、森林を健全に育てるため",
        "森林をすべて駐車場に変えるため",
        "木が成長しないようにするため",
        "雨水が土にしみこまないようにするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「残った木に光が届きやすくし、森林を健全に育てるため」です。適切な間伐は木の成長を助け、森林の働きを保つことにもつながります。"
        ),

        QuizQuestion(
        question: "海に面していない都道府県の例として正しいものはどれですか？",
        choices: [
        "長野県",
        "千葉県",
        "高知県",
        "静岡県"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「長野県」です。長野県は海に面していない内陸県です。千葉県、高知県、静岡県はいずれも海に面しています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】日本のように、国土が海に囲まれ、多くの島からできている国を「＿＿」といいます。",
        answer: "島国",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「島国」です。日本は北海道、本州、四国、九州のほか、多くの島々からなる島国です。"
        ),

        QuizQuestion.classification(
        question: "【分類】都道府県を、主に面している海側で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "岩手県", match: "太平洋側"),
        QuizMatchingPair(prompt: "宮崎県", match: "太平洋側"),
        QuizMatchingPair(prompt: "石川県", match: "日本海側"),
        QuizMatchingPair(prompt: "鳥取県", match: "日本海側")
        ],
        categories: ["太平洋側", "日本海側"],
        explanation: "岩手県と宮崎県は太平洋に面し、石川県と鳥取県は日本海に面しています。"
        ),

        QuizQuestion(
        question: "標高の高い場所が、同じ緯度の低い場所より涼しくなりやすい理由として最も適切なものはどれですか？",
        choices: [
        "標高が高いほど必ず雨が降らなくなるから",
        "高い場所では太陽の光が届かないから",
        "一般に標高が高くなるほど気温が低くなるから",
        "高い場所では季節がなくなるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「一般に標高が高くなるほど気温が低くなるから」です。そのため、高原などでは平地より夏でも涼しい気候を生かした暮らしや農業が見られます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】都市と、その気候の特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "札幌", match: "冬の寒さが厳しく、梅雨の影響が比較的小さい"),
        QuizMatchingPair(prompt: "東京", match: "太平洋側にあり、冬は晴れて乾燥する日が多い"),
        QuizMatchingPair(prompt: "高松", match: "瀬戸内にあり、年間を通して降水量が比較的少ない"),
        QuizMatchingPair(prompt: "那覇", match: "一年を通して気温が高く、冬も比較的温暖")
        ],
        choices: [
        "一年を通して気温が高く、冬も比較的温暖",
        "瀬戸内にあり、年間を通して降水量が比較的少ない",
        "冬の寒さが厳しく、梅雨の影響が比較的小さい",
        "太平洋側にあり、冬は晴れて乾燥する日が多い"
        ],
        explanation: "札幌は冬の寒さが厳しく、東京は太平洋側の気候、高松は瀬戸内の少雨、那覇は温暖な気候が特徴です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】年間の日照時間が最も長い地点を答えましょう。",
        answer: "D地点",
        acceptableAnswers: ["D"],
        referenceTitle: "4地点の年間日照時間（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地点", value: "1680時間"),
        QuizReferenceRow(label: "B地点", value: "1920時間"),
        QuizReferenceRow(label: "C地点", value: "1750時間"),
        QuizReferenceRow(label: "D地点", value: "2140時間")
        ],
        explanation: "正解は「D地点」です。年間日照時間はD地点の2140時間が最も長くなっています。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】年間の雪日数が、A地点18日、B地点72日、C地点41日、D地点96日でした。雪日数が多い順に並べましょう。",
        choices: ["A地点", "B地点", "C地点", "D地点"],
        rankedChoices: ["D地点", "B地点", "C地点", "A地点"],
        explanation: "雪日数はD地点96日、B地点72日、C地点41日、A地点18日なので、「D地点、B地点、C地点、A地点」の順です。"
        ),

        QuizQuestion(
        question: "家畜のえさとなる輸入穀物の価格が大きく上がると、畜産農家に起こりやすいことはどれですか？",
        choices: [
        "家畜を育てる費用が必ず0円になる",
        "飼料にかかる費用が増える",
        "牛乳や肉を冷やす必要がなくなる",
        "農地の面積が自動的に広がる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「飼料にかかる費用が増える」です。畜産では家畜のえさが必要なため、輸入する飼料用穀物の価格上昇は生産費に影響します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域で生産された農産物などを、その地域で消費する取り組みを「＿＿」といいます。",
        answer: "地産地消",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「地産地消」です。地域でつくられたものを地域で消費することで、生産者と消費者の距離を近づけることができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農産物と、それを利用してつくられるものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "いぐさ", match: "畳表"),
        QuizMatchingPair(prompt: "茶葉", match: "緑茶"),
        QuizMatchingPair(prompt: "こんにゃくいも", match: "こんにゃく"),
        QuizMatchingPair(prompt: "なたね", match: "食用油")
        ],
        choices: ["食用油", "畳表", "こんにゃく", "緑茶"],
        explanation: "いぐさは畳表、茶葉は緑茶、こんにゃくいもはこんにゃく、なたねは食用油の原料として利用されます。"
        ),

        QuizQuestion.classification(
        question: "【分類】農業で使われる技術や設備を、主な目的で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自動運転トラクター", match: "作業の省力化"),
        QuizMatchingPair(prompt: "土壌水分センサー", match: "水分の管理"),
        QuizMatchingPair(prompt: "防虫ネット", match: "害虫対策"),
        QuizMatchingPair(prompt: "ドローンによる農地撮影", match: "生育状況の把握")
        ],
        categories: ["作業の省力化", "水分の管理", "害虫対策", "生育状況の把握"],
        explanation: "自動運転トラクターは省力化、土壌水分センサーは水分管理、防虫ネットは害虫対策、ドローン撮影は作物の生育状況の把握に役立ちます。"
        ),

        QuizQuestion(
        question: "魚を取り過ぎないために、一定の期間、漁を禁止する取り組みの主な目的はどれですか？",
        choices: [
        "海水の温度を一定にするため",
        "漁船をすべて新しくするため",
        "魚の値段を毎日同じにするため",
        "魚が成長したり産卵したりする機会を守るため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「魚が成長したり産卵したりする機会を守るため」です。禁漁期を設けることは、水産資源を守りながら漁業を続けるための方法の一つです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】漁法と、その特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "定置網漁", match: "魚の通り道に網を設置してとる"),
        QuizMatchingPair(prompt: "まき網漁", match: "魚の群れを大きな網で囲んでとる"),
        QuizMatchingPair(prompt: "一本釣り", match: "釣り針を使って魚を一匹ずつ釣る"),
        QuizMatchingPair(prompt: "底引き網漁", match: "海底付近で網を引いて魚介類をとる")
        ],
        choices: [
        "海底付近で網を引いて魚介類をとる",
        "釣り針を使って魚を一匹ずつ釣る",
        "魚の通り道に網を設置してとる",
        "魚の群れを大きな網で囲んでとる"
        ],
        explanation: "定置網漁は魚の通り道に網を設置し、まき網漁は魚群を囲み、一本釣りは釣り針を使い、底引き網漁は海底付近で網を引く漁法です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】魚を干物に加工して出荷するまでの主な流れを、早い順に並べましょう。",
        choices: [
        "包装して出荷する",
        "魚を開いて内臓などを取り除く",
        "乾燥させる",
        "塩水につける"
        ],
        orderedChoices: [
        "魚を開いて内臓などを取り除く",
        "塩水につける",
        "乾燥させる",
        "包装して出荷する"
        ],
        explanation: "主な流れは「魚を開いて内臓などを取り除く、塩水につける、乾燥させる、包装して出荷する」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある年の養殖生産量が、A県32千トン、B県47千トン、C県25千トン、D県39千トンでした。生産量が多い順に並べましょう。",
        choices: ["A県", "B県", "C県", "D県"],
        rankedChoices: ["B県", "D県", "A県", "C県"],
        explanation: "養殖生産量はB県47千トン、D県39千トン、A県32千トン、C県25千トンなので、「B県、D県、A県、C県」の順です。"
        ),

        QuizQuestion(
        question: "地域に昔から伝わる技術や、地域でとれる原料などを生かして発達した産業を何といいますか？",
        choices: [
        "地場産業",
        "遠洋漁業",
        "近郊農業",
        "情報産業"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「地場産業」です。地場産業は、地域の原料や技術、歴史などを生かして発達してきた産業です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】伝統的な技術や技法を使い、主に手作業でつくられる工芸品のうち、国が定めた条件を満たすものを「＿＿」といいます。",
        answer: "伝統的工芸品",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「伝統的工芸品」です。長く受け継がれてきた技術や技法を生かし、地域ごとの特色ある製品がつくられています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】伝統的な工芸品と、主な産地の都道府県が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "南部鉄器", match: "岩手県"),
        QuizMatchingPair(prompt: "越前和紙", match: "福井県"),
        QuizMatchingPair(prompt: "熊野筆", match: "広島県"),
        QuizMatchingPair(prompt: "博多人形", match: "福岡県")
        ],
        choices: ["広島県", "福岡県", "岩手県", "福井県"],
        explanation: "南部鉄器は岩手県、越前和紙は福井県、熊野筆は広島県、博多人形は福岡県を代表する伝統的な工芸品です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】製造品出荷額が前年から最も大きく増えた工場を答えましょう。",
        answer: "C工場",
        acceptableAnswers: ["C"],
        referenceTitle: "工場別の製造品出荷額（学習用データ・単位：億円）",
        referenceRows: [
        QuizReferenceRow(label: "A工場", value: "前年80・今年95"),
        QuizReferenceRow(label: "B工場", value: "前年120・今年130"),
        QuizReferenceRow(label: "C工場", value: "前年90・今年118"),
        QuizReferenceRow(label: "D工場", value: "前年150・今年165")
        ],
        explanation: "正解は「C工場」です。増加額はA工場15億円、B工場10億円、C工場28億円、D工場15億円なので、C工場が最も大きく増えています。"
        ),

        QuizQuestion(
        question: "日本の企業が外国に工場をつくり、その国や周辺地域で製品を販売する利点として最も適切なものはどれですか？",
        choices: [
        "日本国内でしか製品を売れなくなる",
        "消費地の近くで生産し、輸送にかかる時間や費用を減らしやすい",
        "原料や部品が一切必要なくなる",
        "外国との情報交換ができなくなる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「消費地の近くで生産し、輸送にかかる時間や費用を減らしやすい」です。海外での現地生産には、販売する地域の近くで製品をつくれる利点があります。"
        ),

        QuizQuestion.classification(
        question: "【分類】輸出額と輸入額を比べて、「輸出超過」と「輸入超過」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "A国との貿易：輸出120・輸入80", match: "輸出超過"),
        QuizMatchingPair(prompt: "B国との貿易：輸出70・輸入110", match: "輸入超過"),
        QuizMatchingPair(prompt: "C国との貿易：輸出95・輸入60", match: "輸出超過"),
        QuizMatchingPair(prompt: "D国との貿易：輸出50・輸入90", match: "輸入超過")
        ],
        categories: ["輸出超過", "輸入超過"],
        explanation: "輸出額が輸入額より大きいA国・C国は「輸出超過」、輸入額が輸出額より大きいB国・D国は「輸入超過」です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】工場でつくられた精密機器を航空貨物として外国へ輸出するまでの主な流れを、早い順に並べましょう。",
        choices: [
        "航空機に積んで外国へ運ぶ",
        "工場で製品を梱包する",
        "空港の貨物地区へ運ぶ",
        "輸出に必要な税関の手続きを行う"
        ],
        orderedChoices: [
        "工場で製品を梱包する",
        "空港の貨物地区へ運ぶ",
        "輸出に必要な税関の手続きを行う",
        "航空機に積んで外国へ運ぶ"
        ],
        explanation: "主な流れは「工場で製品を梱包する、空港の貨物地区へ運ぶ、輸出に必要な税関の手続きを行う、航空機に積んで外国へ運ぶ」の順です。"
        ),

        QuizQuestion(
        question: "情報通信機器やインターネットを利用できる人と利用しにくい人の間に生まれる情報利用の差を何といいますか？",
        choices: [
        "フードロス",
        "デジタルデバイド",
        "ヒートアイランド",
        "リサイクル"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「デジタルデバイド」です。年齢、地域、利用環境などによって情報通信技術を利用する機会や能力に差が生じることを表します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】複数のコンピュータや情報機器をつないで、情報をやり取りできるようにした仕組みを「＿＿」といいます。",
        answer: "ネットワーク",
        acceptableAnswers: ["network", "NETWORK"],
        explanation: "＿＿に入る言葉は「ネットワーク」です。機器同士をつなぐことで、情報やデータをやり取りできます。"
        ),

        QuizQuestion(
        question: "インターネットのサービスで使うパスワードの管理方法として、最も適切なものはどれですか？",
        choices: [
        "自分の名前だけをすべてのサービスで使う",
        "友だち全員にパスワードを教えておく",
        "短い同じパスワードを何年も使い続ける",
        "推測されにくいパスワードを使い、他人に教えない"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「推測されにくいパスワードを使い、他人に教えない」です。大切な情報を守るため、簡単に推測できる文字列や他人との共有は避ける必要があります。"
        ),

        QuizQuestion(
        question: "商品についているエコマークが示していることとして、最も適切なものはどれですか？",
        choices: [
        "環境への負担が少ないなど、環境保全に役立つと認められた商品であること",
        "必ず外国でつくられた商品であること",
        "値段が日本で最も安い商品であること",
        "一度しか使えない商品であること"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「環境への負担が少ないなど、環境保全に役立つと認められた商品であること」です。エコマークは、環境への負担を減らすことに役立つ商品を選ぶ目安の一つです。"
        ),

        QuizQuestion(
        question: "里山の環境を適切に手入れすることが、生き物にとって役立つ理由として最も適切なものはどれですか？",
        choices: [
        "すべての木を切ると生き物が必ず増えるから",
        "人が入らないようにコンクリートでおおうから",
        "森林や草地、水辺など多様な環境が保たれ、生き物のすみかになりやすいから",
        "里山では雨や雪が降らなくなるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「森林や草地、水辺など多様な環境が保たれ、生き物のすみかになりやすいから」です。適切な手入れは、里山のさまざまな環境と生物の多様性を守ることにつながります。"
        ),

        QuizQuestion.classification(
        question: "【分類】環境問題の例を、主な種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自動車や工場から出る煙で空気が汚れる", match: "大気汚染"),
        QuizMatchingPair(prompt: "処理されていない汚れた水が川へ流れ込む", match: "水質汚濁"),
        QuizMatchingPair(prompt: "航空機や機械の大きな音で生活に影響が出る", match: "騒音"),
        QuizMatchingPair(prompt: "有害な物質が地面にしみ込み、土が汚れる", match: "土壌汚染")
        ],
        categories: ["大気汚染", "水質汚濁", "騒音", "土壌汚染"],
        explanation: "煙などによる空気の汚れは「大気汚染」、汚れた水によるものは「水質汚濁」、大きな音は「騒音」、有害物質による土の汚れは「土壌汚染」です。"
        ),

        QuizQuestion(
        question: "海を埋め立てて土地を広げる主な目的として、最も適切なものはどれですか？",
        choices: [
        "山の標高を高くするため",
        "港湾施設や工場などに使える平地を確保するため",
        "川の流れを急にするため",
        "火山の噴火を防ぐため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「港湾施設や工場などに使える平地を確保するため」です。平地の少ない地域では、海を埋め立てて港や工場などに利用できる土地をつくることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】日本標準時の基準となる兵庫県明石市付近を通る経線は、東経＿＿度です。",
        answer: "135",
        acceptableAnswers: ["１３５", "135度", "１３５度"],
        explanation: "＿＿に入る数字は「135」です。日本標準時は、兵庫県明石市付近を通る東経135度の経線を基準にしています。"
        ),

        QuizQuestion.classification(
        question: "【分類】地名を、正しい地形の種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "佐渡島", match: "島"),
        QuizMatchingPair(prompt: "伊豆半島", match: "半島"),
        QuizMatchingPair(prompt: "駿河湾", match: "湾"),
        QuizMatchingPair(prompt: "津軽海峡", match: "海峡")
        ],
        categories: ["島", "半島", "湾", "海峡"],
        explanation: "佐渡島は「島」、伊豆半島は「半島」、駿河湾は「湾」、津軽海峡は「海峡」です。"
        ),

        QuizQuestion(
        question: "雪の多い地域で道路に設置される消雪パイプの主な役割はどれですか？",
        choices: [
        "海水の塩分を減らす",
        "雪が降る量を増やす",
        "家の中の空気を暖める",
        "道路に水を出して雪をとかし、通行しやすくする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「道路に水を出して雪をとかし、通行しやすくする」です。消雪パイプは道路に水を出して雪をとかし、雪の多い地域の交通を助けます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】気候の特色と、暮らしの工夫が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "冬の寒さが厳しい地域", match: "二重窓などで室内の熱を逃げにくくする"),
        QuizMatchingPair(prompt: "雪が多い地域", match: "雪囲いなどで家や樹木を雪から守る"),
        QuizMatchingPair(prompt: "台風の強い風を受けやすい地域", match: "防風林などで風を弱める"),
        QuizMatchingPair(prompt: "雨が少ない地域", match: "ため池に水をたくわえて利用する")
        ],
        choices: [
        "ため池に水をたくわえて利用する",
        "防風林などで風を弱める",
        "二重窓などで室内の熱を逃げにくくする",
        "雪囲いなどで家や樹木を雪から守る"
        ],
        explanation: "寒さが厳しい地域では二重窓、雪が多い地域では雪囲い、強風を受けやすい地域では防風林、雨が少ない地域ではため池など、気候に合わせた工夫が見られます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】12月・1月・2月の降水量を合計したとき、最も多い地点を答えましょう。",
        answer: "A地点",
        acceptableAnswers: ["A"],
        referenceTitle: "冬の3か月の降水量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地点", value: "12月180mm・1月210mm・2月190mm"),
        QuizReferenceRow(label: "B地点", value: "12月40mm・1月35mm・2月50mm"),
        QuizReferenceRow(label: "C地点", value: "12月70mm・1月60mm・2月80mm"),
        QuizReferenceRow(label: "D地点", value: "12月120mm・1月100mm・2月110mm")
        ],
        explanation: "正解は「A地点」です。3か月の合計は、A地点580mm、B地点125mm、C地点210mm、D地点330mmなので、A地点が最も多くなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】8月の平均気温が、A地点26.8℃、B地点23.4℃、C地点29.1℃、D地点27.6℃でした。平均気温が高い順に並べましょう。",
        choices: ["A地点", "B地点", "C地点", "D地点"],
        rankedChoices: ["C地点", "D地点", "A地点", "B地点"],
        explanation: "平均気温はC地点29.1℃、D地点27.6℃、A地点26.8℃、B地点23.4℃なので、「C地点、D地点、A地点、B地点」の順です。"
        ),

        QuizQuestion(
        question: "高冷地の夏の涼しさを利用し、野菜の出荷時期を平地より遅らせる栽培方法はどれですか？",
        choices: [
        "近郊農業",
        "促成栽培",
        "抑制栽培",
        "二毛作"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「抑制栽培」です。抑制栽培では、高冷地などの涼しい気候を利用して作物の成長時期を調整し、平地より遅い時期に出荷します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】以前は耕していたのに、長い間作物をつくらなくなった農地を「＿＿」といいます。",
        answer: "耕作放棄地",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「耕作放棄地」です。農業の担い手不足などにより、使われなくなった農地が増えることが課題になっています。"
        ),

        QuizQuestion.classification(
        question: "【分類】農産物を、代表的に育てられる農地の種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水稲", match: "水田"),
        QuizMatchingPair(prompt: "キャベツ", match: "畑"),
        QuizMatchingPair(prompt: "りんご", match: "果樹園"),
        QuizMatchingPair(prompt: "茶", match: "茶園")
        ],
        categories: ["水田", "畑", "果樹園", "茶園"],
        explanation: "水稲は「水田」、キャベツは「畑」、りんごは「果樹園」、茶は「茶園」で育てられる代表的な農産物です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】酪農家でしぼった牛乳が店に並ぶまでの主な流れを、早い順に並べましょう。",
        choices: [
        "店へ運んで販売する",
        "乳業工場で殺菌して容器に詰める",
        "牛から乳をしぼる",
        "冷やしたまま集乳車で乳業工場へ運ぶ"
        ],
        orderedChoices: [
        "牛から乳をしぼる",
        "冷やしたまま集乳車で乳業工場へ運ぶ",
        "乳業工場で殺菌して容器に詰める",
        "店へ運んで販売する"
        ],
        explanation: "主な流れは「牛から乳をしぼる、冷やしたまま集乳車で乳業工場へ運ぶ、乳業工場で殺菌して容器に詰める、店へ運んで販売する」の順です。"
        ),

        QuizQuestion(
        question: "漁船で使う魚群探知機の主な役割はどれですか？",
        choices: [
        "超音波などを利用して魚の群れの位置や深さを調べる",
        "海水の塩分をなくす",
        "魚を自動で加工して缶詰にする",
        "港の市場で魚の値段を決める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「超音波などを利用して魚の群れの位置や深さを調べる」です。魚群探知機は、魚の群れを効率よく探すために使われます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】漁業で使われる設備や技術と、その役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "GPS", match: "漁船の現在位置を確認する"),
        QuizMatchingPair(prompt: "魚群探知機", match: "魚の群れの位置や深さを探す"),
        QuizMatchingPair(prompt: "無線通信", match: "天気や安全に関する情報をやり取りする"),
        QuizMatchingPair(prompt: "冷凍設備", match: "とった魚を低い温度で保存する")
        ],
        choices: [
        "とった魚を低い温度で保存する",
        "天気や安全に関する情報をやり取りする",
        "漁船の現在位置を確認する",
        "魚の群れの位置や深さを探す"
        ],
        explanation: "GPSは位置の確認、魚群探知機は魚群の探索、無線通信は情報のやり取り、冷凍設備は水産物の鮮度を保つために利用されます。"
        ),

        QuizQuestion.classification(
        question: "【分類】養殖されることのある水産物を、生き物の種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ぶり", match: "魚類"),
        QuizMatchingPair(prompt: "かき", match: "貝類"),
        QuizMatchingPair(prompt: "のり", match: "海藻類"),
        QuizMatchingPair(prompt: "くるまえび", match: "甲殻類")
        ],
        categories: ["魚類", "貝類", "海藻類", "甲殻類"],
        explanation: "ぶりは「魚類」、かきは「貝類」、のりは「海藻類」、くるまえびは「甲殻類」です。これらはいずれも養殖の対象になることがあります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある日の水揚げ量が、A港84トン、B港120トン、C港67トン、D港95トンでした。水揚げ量が多い順に並べましょう。",
        choices: ["A港", "B港", "C港", "D港"],
        rankedChoices: ["B港", "D港", "A港", "C港"],
        explanation: "水揚げ量はB港120トン、D港95トン、A港84トン、C港67トンなので、「B港、D港、A港、C港」の順です。"
        ),

        QuizQuestion(
        question: "工場で完成した製品を出荷前に検査する主な目的はどれですか？",
        choices: [
        "製品の重さをすべて同じ0kgにするため",
        "工場で使う電気をなくすため",
        "不良品が出荷されるのを防ぎ、品質を確かめるため",
        "製品を必ず海外だけで販売するため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「不良品が出荷されるのを防ぎ、品質を確かめるため」です。出荷前の検査は、製品が決められた品質や安全の基準を満たしているか確認するために行われます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】大工場に比べて従業者の数が少なく、専門的な技術で部品などをつくる工場を「＿＿」といいます。",
        answer: "中小工場",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「中小工場」です。中小工場の中には、高い技術を生かして、大工場で使われる部品などをつくる工場があります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場の設備と、その主な役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "集じん装置", match: "空気中へ出るちりや粉じんを減らす"),
        QuizMatchingPair(prompt: "排水処理設備", match: "工場から出る汚れた水を処理する"),
        QuizMatchingPair(prompt: "防音壁", match: "工場から周囲へ伝わる騒音を減らす"),
        QuizMatchingPair(prompt: "安全柵", match: "動く機械に人が近づきすぎるのを防ぐ")
        ],
        choices: [
        "動く機械に人が近づきすぎるのを防ぐ",
        "工場から出る汚れた水を処理する",
        "空気中へ出るちりや粉じんを減らす",
        "工場から周囲へ伝わる騒音を減らす"
        ],
        explanation: "集じん装置は粉じん、排水処理設備は汚れた水、防音壁は騒音への対策に使われ、安全柵は工場で働く人の安全を守るために使われます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】1日に生産する製品数を従業者数で割ったとき、従業者1人あたりの生産数が最も多い工場を答えましょう。",
        answer: "D工場",
        acceptableAnswers: ["D"],
        referenceTitle: "工場の従業者数と1日の生産数（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A工場", value: "従業者20人・400個"),
        QuizReferenceRow(label: "B工場", value: "従業者25人・550個"),
        QuizReferenceRow(label: "C工場", value: "従業者30人・600個"),
        QuizReferenceRow(label: "D工場", value: "従業者18人・414個")
        ],
        explanation: "正解は「D工場」です。1人あたりの生産数は、A工場20個、B工場22個、C工場20個、D工場23個なので、D工場が最も多くなります。"
        ),

        QuizQuestion(
        question: "空港や港で、外国から入ってくる動物や植物などを検査する「検疫」の主な目的はどれですか？",
        choices: [
        "輸入品の販売価格をすべて同じにするため",
        "船や飛行機の速さを調べるため",
        "外国のお金を日本円に交換するため",
        "病気や害虫などが国内へ入るのを防ぐため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「病気や害虫などが国内へ入るのを防ぐため」です。検疫では、外国から持ち込まれる動植物などを調べ、病気や害虫の侵入を防ぎます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】外国から原料を輸入し、国内で製品に加工して外国へ輸出する貿易のしかたを「＿＿」といいます。",
        answer: "加工貿易",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「加工貿易」です。加工貿易は、外国から輸入した原料を国内で加工し、できた製品を輸出する貿易のしかたです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】貨物を運ぶ船と、運ぶのに適したものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "LNG船", match: "液化天然ガス"),
        QuizMatchingPair(prompt: "ばら積み船", match: "穀物や鉱石などのばら積み貨物"),
        QuizMatchingPair(prompt: "冷凍・冷蔵船", match: "低い温度を保つ必要がある食品"),
        QuizMatchingPair(prompt: "フェリー", match: "人と自動車を一緒に運ぶ")
        ],
        choices: [
        "人と自動車を一緒に運ぶ",
        "低い温度を保つ必要がある食品",
        "液化天然ガス",
        "穀物や鉱石などのばら積み貨物"
        ],
        explanation: "LNG船は液化天然ガス、ばら積み船は穀物や鉱石など、冷凍・冷蔵船は低温で運ぶ食品、フェリーは人と自動車を一緒に運ぶのに適しています。"
        ),

        QuizQuestion(
        question: "日本が多く輸入している小麦の生産国で大きな干ばつが起こり、収穫量が大幅に減った場合、日本への影響として最も考えられるものはどれですか？",
        choices: [
        "日本の小麦の輸入量が必ず増え、価格も必ず下がる",
        "小麦の輸入量が減ったり、価格が上がったりする可能性がある",
        "日本の海岸線が短くなる",
        "外国との輸送がすべて不要になる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「小麦の輸入量が減ったり、価格が上がったりする可能性がある」です。輸入先で不作になると、輸出できる量が減り、日本で手に入る量や価格に影響することがあります。"
        ),

        QuizQuestion(
        question: "インターネットで見つけた写真を学校のウェブページに載せたいとき、最も適切な行動はどれですか？",
        choices: [
        "写真の利用条件や著作権を確認し、必要なら許可を得る",
        "見つけた写真はすべて自由に使えると考える",
        "作者の名前を消せば必ず使ってよいと考える",
        "友だちが使っていれば確認せずに使う"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「写真の利用条件や著作権を確認し、必要なら許可を得る」です。インターネット上の写真にも著作権があるため、決められた利用条件を守る必要があります。"
        ),

        QuizQuestion.classification(
        question: "【分類】情報技術の利用例を、主に使われる分野に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カーナビゲーションで道順を調べる", match: "交通"),
        QuizMatchingPair(prompt: "気象レーダーで雨雲の動きを調べる", match: "防災・気象"),
        QuizMatchingPair(prompt: "学校でオンライン授業を受ける", match: "教育"),
        QuizMatchingPair(prompt: "店で商品の在庫をコンピュータ管理する", match: "商業")
        ],
        categories: ["交通", "防災・気象", "教育", "商業"],
        explanation: "カーナビゲーションは「交通」、気象レーダーは「防災・気象」、オンライン授業は「教育」、店の在庫管理は「商業」での情報技術の利用例です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】インターネット通販で商品を注文してから家に届くまでの主な流れを、早い順に並べましょう。",
        choices: [
        "配送会社が商品を受け取って運ぶ",
        "購入者がウェブサイトで注文する",
        "商品が購入者の家に届く",
        "倉庫で注文情報を確認して商品を取り出し、梱包する"
        ],
        orderedChoices: [
        "購入者がウェブサイトで注文する",
        "倉庫で注文情報を確認して商品を取り出し、梱包する",
        "配送会社が商品を受け取って運ぶ",
        "商品が購入者の家に届く"
        ],
        explanation: "主な流れは「購入者がウェブサイトで注文する、倉庫で注文情報を確認して商品を取り出し梱包する、配送会社が運ぶ、商品が家に届く」の順です。"
        ),

        QuizQuestion(
        question: "都市の中心部が周辺より高温になりやすいヒートアイランド現象を和らげる取り組みとして、最も適切なものはどれですか？",
        choices: [
        "道路や建物をすべて黒い材料でおおう",
        "公園や街路樹を減らして建物を増やす",
        "屋上緑化や街路樹など、都市の緑を増やす",
        "冷房の室外機から出る熱を増やす"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「屋上緑化や街路樹など、都市の緑を増やす」です。植物は日差しをさえぎったり、水分を蒸発させたりするため、都市の気温上昇を和らげるのに役立ちます。"
        ),

        QuizQuestion(
        question: "外国などから持ち込まれた生き物を、むやみに野外へ放してはいけない主な理由はどれですか？",
        choices: [
        "もともといる生き物との関係が変わり、生態系に影響を与えることがあるから",
        "外来生物は必ず一日で死んでしまうから",
        "野外へ放すと川や海の水がすべてなくなるから",
        "外来生物は必ず作物の成長を速くするから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「もともといる生き物との関係が変わり、生態系に影響を与えることがあるから」です。外来生物が増えると、在来の生き物を食べたり、すみかやえさを奪ったりすることがあります。"
        ),

        QuizQuestion(
        question: "日本の国土のうち、山地や丘陵が占める割合に最も近いものはどれですか？",
        choices: [
        "約4分の1",
        "約半分",
        "約4分の3",
        "ほぼ全部"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「約4分の3」です。日本は山地や丘陵が多く、国土のおよそ4分の3を占めています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】海岸の基準となる線から原則12海里までの、国の主権が及ぶ海域を「＿＿」といいます。",
        answer: "領海",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「領海」です。領海は、海岸の基準となる線から原則12海里までの国の主権が及ぶ海域です。"
        ),

        QuizQuestion.classification(
        question: "【分類】日本の地形や水域を、正しい種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "富士山", match: "火山"),
        QuizMatchingPair(prompt: "琵琶湖", match: "湖"),
        QuizMatchingPair(prompt: "津軽海峡", match: "海峡"),
        QuizMatchingPair(prompt: "関東平野", match: "平野")
        ],
        categories: ["火山", "湖", "海峡", "平野"],
        explanation: "富士山は「火山」、琵琶湖は「湖」、津軽海峡は「海峡」、関東平野は「平野」です。"
        ),

        QuizQuestion(
        question: "海から遠い内陸の地域で、海岸に近い地域より気温の変化が大きくなりやすい主な理由はどれですか？",
        choices: [
        "海の影響が小さく、陸地が暖まりやすく冷えやすいから",
        "一年中同じ向きの風だけが吹くから",
        "内陸には雲がまったくできないから",
        "標高が必ず海面より低いから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「海の影響が小さく、陸地が暖まりやすく冷えやすいから」です。海から遠い内陸では海の気温を和らげる影響が小さいため、気温差が大きくなりやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】季節と、日本付近で見られやすい天気の特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "移動性高気圧と低気圧が交互に通り、天気が変わりやすい"),
        QuizMatchingPair(prompt: "夏", match: "太平洋高気圧におおわれ、暑い日が多くなる"),
        QuizMatchingPair(prompt: "秋", match: "秋雨前線や台風の影響を受けることがある"),
        QuizMatchingPair(prompt: "冬", match: "西高東低の気圧配置になりやすい")
        ],
        choices: [
        "西高東低の気圧配置になりやすい",
        "秋雨前線や台風の影響を受けることがある",
        "太平洋高気圧におおわれ、暑い日が多くなる",
        "移動性高気圧と低気圧が交互に通り、天気が変わりやすい"
        ],
        explanation: "春は移動性高気圧と低気圧が交互に通り、夏は太平洋高気圧におおわれやすく、秋は秋雨前線や台風、冬は西高東低の気圧配置の影響を受けやすくなります。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】6月と7月の降水量を合計したとき、最も多い地点を答えましょう。",
        answer: "C地点",
        acceptableAnswers: ["C"],
        referenceTitle: "梅雨のころの降水量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地点", value: "6月180mm・7月220mm"),
        QuizReferenceRow(label: "B地点", value: "6月90mm・7月100mm"),
        QuizReferenceRow(label: "C地点", value: "6月250mm・7月310mm"),
        QuizReferenceRow(label: "D地点", value: "6月130mm・7月180mm")
        ],
        explanation: "正解は「C地点」です。6月と7月の合計は、A地点400mm、B地点190mm、C地点560mm、D地点310mmなので、C地点が最も多くなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】年間降水量が、A地点1200mm、B地点2200mm、C地点1600mm、D地点900mmでした。年間降水量が多い順に並べましょう。",
        choices: ["A地点", "B地点", "C地点", "D地点"],
        rankedChoices: ["B地点", "C地点", "A地点", "D地点"],
        explanation: "年間降水量はB地点2200mm、C地点1600mm、A地点1200mm、D地点900mmなので、「B地点、C地点、A地点、D地点」の順です。"
        ),

        QuizQuestion(
        question: "温暖な地域でビニールハウスなどを利用し、野菜を通常より早い時期に出荷する栽培方法はどれですか？",
        choices: [
        "二毛作",
        "近郊農業",
        "抑制栽培",
        "促成栽培"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「促成栽培」です。促成栽培では、温暖な気候やビニールハウスなどを生かして作物の成長を早め、通常より早い時期に出荷します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】田畑を広く使いやすく整えたり、用水路や排水路を整備したりすることを「＿＿」といいます。",
        answer: "土地改良",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「土地改良」です。土地改良では、農地の形や水路などを整えて、農作業をしやすくします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農業を支える施設や組織と、その役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "用水路", match: "田畑に必要な水を送る"),
        QuizMatchingPair(prompt: "カントリーエレベーター", match: "収穫した米などを乾燥・調製して保管する"),
        QuizMatchingPair(prompt: "直売所", match: "生産者が地域の消費者などへ農産物を販売する"),
        QuizMatchingPair(prompt: "農業協同組合", match: "農産物の共同出荷や資材の購入などを支える")
        ],
        choices: [
        "農産物の共同出荷や資材の購入などを支える",
        "田畑に必要な水を送る",
        "生産者が地域の消費者などへ農産物を販売する",
        "収穫した米などを乾燥・調製して保管する"
        ],
        explanation: "用水路は水を送る施設、カントリーエレベーターは米などの乾燥・調製・保管を行う施設、直売所は生産者が農産物を販売する場所、農業協同組合は共同出荷や資材購入などを支える組織です。"
        ),

        QuizQuestion.classification(
        question: "【分類】作物を、種類ごとに正しく分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "小麦", match: "穀類"),
        QuizMatchingPair(prompt: "大豆", match: "豆類"),
        QuizMatchingPair(prompt: "じゃがいも", match: "いも類"),
        QuizMatchingPair(prompt: "茶", match: "工芸作物")
        ],
        categories: ["穀類", "豆類", "いも類", "工芸作物"],
        explanation: "小麦は「穀類」、大豆は「豆類」、じゃがいもは「いも類」、茶は加工して利用される「工芸作物」に分けられます。"
        ),

        QuizQuestion(
        question: "水産資源を将来も利用するため、小さな魚まで取り尽くさないことが大切な理由はどれですか？",
        choices: [
        "小さな魚は海水を温めるから",
        "成長して卵を産む魚を残し、資源が増える機会を守るため",
        "小さな魚はすべて毒を持っているから",
        "魚を取らないと海の塩分が下がるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「成長して卵を産む魚を残し、資源が増える機会を守るため」です。小さな魚を取り過ぎないことは、魚が成長して繁殖する機会を残し、水産資源を守ることにつながります。"
        ),

        QuizQuestion.classification(
        question: "【分類】水産物を、主な加工方法に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "あじの干物", match: "乾燥"),
        QuizMatchingPair(prompt: "塩ざけ", match: "塩蔵"),
        QuizMatchingPair(prompt: "冷凍まぐろ", match: "冷凍"),
        QuizMatchingPair(prompt: "さばの缶詰", match: "缶詰")
        ],
        categories: ["乾燥", "塩蔵", "冷凍", "缶詰"],
        explanation: "あじの干物は「乾燥」、塩ざけは「塩蔵」、冷凍まぐろは「冷凍」、さばの缶詰は「缶詰」という方法で加工・保存されています。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】魚の養殖で、稚魚を育て始めてから出荷するまでの主な流れを、早い順に並べましょう。",
        choices: [
        "市場や加工場へ出荷する",
        "養殖場のいけすに稚魚を入れる",
        "出荷できる大きさまで育てる",
        "大きさなどを確認して選別する"
        ],
        orderedChoices: [
        "養殖場のいけすに稚魚を入れる",
        "出荷できる大きさまで育てる",
        "大きさなどを確認して選別する",
        "市場や加工場へ出荷する"
        ],
        explanation: "主な流れは「養殖場のいけすに稚魚を入れる、出荷できる大きさまで育てる、大きさなどを確認して選別する、市場や加工場へ出荷する」の順です。"
        ),

        QuizQuestion(
        question: "内陸部の工業団地が高速道路のインターチェンジの近くにつくられることが多い理由はどれですか？",
        choices: [
        "海水を工場の原料として使いやすいから",
        "周囲の山から鉄鉱石を採掘できるから",
        "トラックで部品や製品を運びやすいから",
        "船を工場のすぐ横につけられるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「トラックで部品や製品を運びやすいから」です。高速道路の近くでは、トラックを使って原料・部品・製品を各地へ効率よく運べます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】工場を計画的に集め、道路なども整備した地域を「＿＿」といいます。",
        answer: "工業団地",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「工業団地」です。工業団地は、工場を計画的に集め、道路などの設備を整えた地域です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工場で使われる設備や場所と、その主な役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "溶鉱炉", match: "鉄鉱石から鉄のもとになる銑鉄をつくる"),
        QuizMatchingPair(prompt: "プレス機", match: "金属の板を型に合わせて成形する"),
        QuizMatchingPair(prompt: "産業用ロボット", match: "溶接などの決まった作業を正確に繰り返す"),
        QuizMatchingPair(prompt: "クリーンルーム", match: "ほこりなどを少なくした環境で精密な製品をつくる")
        ],
        choices: [
        "ほこりなどを少なくした環境で精密な製品をつくる",
        "金属の板を型に合わせて成形する",
        "鉄鉱石から鉄のもとになる銑鉄をつくる",
        "溶接などの決まった作業を正確に繰り返す"
        ],
        explanation: "溶鉱炉は銑鉄をつくり、プレス機は金属板を成形し、産業用ロボットは決まった作業を正確に行い、クリーンルームはほこりを少なくして精密な製品をつくるために使われます。"
        ),

        QuizQuestion(
        question: "消費者の好みが多様になったとき、工場が多くの種類の製品を必要な量ずつつくる生産方法の利点はどれですか？",
        choices: [
        "さまざまな需要に合わせた製品をつくりやすい",
        "一種類の製品しかつくれなくなる",
        "原料をまったく使わずに生産できる",
        "輸送をすべて船だけで行える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「さまざまな需要に合わせた製品をつくりやすい」です。多くの種類を必要な量ずつ生産することで、消費者の多様な好みに対応しやすくなります。"
        ),

        QuizQuestion(
        question: "港のコンテナターミナルにあるガントリークレーンの主な役割はどれですか？",
        choices: [
        "船の燃料をつくる",
        "輸入品の値段を決める",
        "外国へ送る手紙を仕分ける",
        "船と陸上の間でコンテナを積み下ろす"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「船と陸上の間でコンテナを積み下ろす」です。ガントリークレーンは、コンテナ船からコンテナを降ろしたり、船へ積んだりする大型のクレーンです。"
        ),

        QuizQuestion(
        question: "重要な原料の輸入を一つの国だけに大きく頼ると、どのような問題が起こる可能性がありますか？",
        choices: [
        "必ず輸送時間がゼロになる",
        "その国からの輸入が止まったとき、原料が不足しやすくなる",
        "国内の港がすべて不要になる",
        "原料の品質が必ず高くなる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「その国からの輸入が止まったとき、原料が不足しやすくなる」です。輸入先が一つの国に集中すると、災害や国際情勢などで輸入が止まった場合の影響が大きくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】日本が外国から輸入することのある品物を、資源や産物の種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "原油", match: "鉱産資源"),
        QuizMatchingPair(prompt: "大豆", match: "農産物"),
        QuizMatchingPair(prompt: "サーモン", match: "水産物"),
        QuizMatchingPair(prompt: "木材", match: "林産物")
        ],
        categories: ["鉱産資源", "農産物", "水産物", "林産物"],
        explanation: "原油は「鉱産資源」、大豆は「農産物」、サーモンは「水産物」、木材は「林産物」に分けられます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】ある品物の輸入額全体に占める割合について、A国とB国を合わせると何％になりますか。「％」をつけて答えましょう。",
        answer: "70％",
        acceptableAnswers: ["70%", "７０％", "７０%"],
        referenceTitle: "ある品物の国別輸入額の割合（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A国", value: "40％"),
        QuizReferenceRow(label: "B国", value: "30％"),
        QuizReferenceRow(label: "C国", value: "20％"),
        QuizReferenceRow(label: "D国", value: "10％")
        ],
        explanation: "正解は「70％」です。A国40％とB国30％を合わせると70％になります。"
        ),

        QuizQuestion(
        question: "自治体が避難情報をスマートフォンへ一斉に配信する利点として、最も適切なものはどれですか？",
        choices: [
        "情報を受け取れる人を一人だけにできる",
        "紙の地図がすべて不要になる",
        "多くの人へ短時間で情報を伝えやすい",
        "通信がなくても世界中へ必ず届く"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「多くの人へ短時間で情報を伝えやすい」です。情報通信を利用すると、災害などの重要な情報を多くの人へすばやく伝えやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】人工衛星からの電波を利用して、現在地を調べる仕組みを表すアルファベット3文字を答えましょう。",
        answer: "GPS",
        acceptableAnswers: ["gps", "ＧＰＳ"],
        explanation: "答えは「GPS」です。GPSは人工衛星からの電波を利用して、現在地などを調べる仕組みです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】情報を伝える主なメディアと、その特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "テレビ", match: "映像と音声を使って情報を伝えられる"),
        QuizMatchingPair(prompt: "新聞", match: "記事を紙面で読み返しながら確認できる"),
        QuizMatchingPair(prompt: "ラジオ", match: "音声を中心に情報を伝えられる"),
        QuizMatchingPair(prompt: "インターネット", match: "利用者が検索して多くの情報へアクセスできる")
        ],
        choices: [
        "利用者が検索して多くの情報へアクセスできる",
        "音声を中心に情報を伝えられる",
        "映像と音声を使って情報を伝えられる",
        "記事を紙面で読み返しながら確認できる"
        ],
        explanation: "テレビは映像と音声、新聞は紙面の記事、ラジオは音声、インターネットは検索などを通して多くの情報へアクセスできるという特徴があります。"
        ),

        QuizQuestion(
        question: "ごみの最終処分場を長く使うために、最も効果的な取り組みはどれですか？",
        choices: [
        "ごみを減らし、再使用や再生利用を進める",
        "まだ使える物もすべて捨てる",
        "ごみを分別せずに混ぜる",
        "家庭ごとにごみを地面へ埋める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「ごみを減らし、再使用や再生利用を進める」です。最終処分するごみの量を減らすことで、処分場をより長く使うことにつながります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】使用済みペットボトルが再生製品になるまでの主な流れを、早い順に並べましょう。",
        choices: [
        "再生材料から新しい製品をつくる",
        "家庭などで分別して回収する",
        "リサイクル工場へ運ぶ",
        "細かく砕いて再生材料にする"
        ],
        orderedChoices: [
        "家庭などで分別して回収する",
        "リサイクル工場へ運ぶ",
        "細かく砕いて再生材料にする",
        "再生材料から新しい製品をつくる"
        ],
        explanation: "主な流れは「家庭などで分別して回収する、リサイクル工場へ運ぶ、細かく砕いて再生材料にする、再生材料から新しい製品をつくる」の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】資源ごみのリサイクル率が、A市72％、B市64％、C市81％、D市76％でした。リサイクル率が高い順に並べましょう。",
        choices: ["A市", "B市", "C市", "D市"],
        rankedChoices: ["C市", "D市", "A市", "B市"],
        explanation: "リサイクル率はC市81％、D市76％、A市72％、B市64％なので、「C市、D市、A市、B市」の順です。"
        ),

        QuizQuestion(
        question: "日本の平野に人口や都市が集まりやすい理由として、最も適切なものはどれですか？",
        choices: [
        "海から遠く、台風が来ないから",
        "平野には川がほとんどないから",
        "平らな土地が多く、住宅や道路をつくりやすいから",
        "一年中、気温がほとんど変わらないから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「平らな土地が多く、住宅や道路をつくりやすいから」です。日本では山地が多いため、利用しやすい平野に人口や都市が集まりやすくなっています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】海岸線が複雑に入り組み、細長い湾が多く見られる海岸を「＿＿海岸」といいます。",
        answer: "リアス",
        acceptableAnswers: ["リアス式"],
        explanation: "＿＿に入る言葉は「リアス」です。リアス海岸は海岸線が複雑に入り組み、入り江や湾が多い地形です。"
        ),

        QuizQuestion.classification(
        question: "【分類】地形のでき方や特徴を、正しい地形名に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "山地から平地へ出た所に、川が運んだ土砂が扇形にたまる", match: "扇状地"),
        QuizMatchingPair(prompt: "川の河口付近に、細かな土砂がたまってできる", match: "三角州"),
        QuizMatchingPair(prompt: "海や湖を堤防で囲み、内側の水を抜いてつくる", match: "干拓地"),
        QuizMatchingPair(prompt: "風で運ばれた砂が積もってできる", match: "砂丘")
        ],
        categories: ["扇状地", "三角州", "干拓地", "砂丘"],
        explanation: "山地の出口に土砂がたまるのが「扇状地」、河口付近に土砂がたまるのが「三角州」、水を抜いてつくるのが「干拓地」、風で運ばれた砂が積もるのが「砂丘」です。"
        ),

        QuizQuestion(
        question: "日本で、初夏に雨やくもりの日が続きやすくなる時期を何といいますか？",
        choices: [
        "梅雨",
        "小春日和",
        "台風一過",
        "春一番"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「梅雨」です。初夏には梅雨前線の影響で、雨やくもりの日が続きやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】気候に関係する言葉と、その特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "やませ", match: "夏に東北地方の太平洋側へ吹き、低温をもたらす冷たい風"),
        QuizMatchingPair(prompt: "フェーン現象", match: "山を越えた空気が乾燥し、気温が高くなる現象"),
        QuizMatchingPair(prompt: "梅雨前線", match: "初夏に日本付近に停滞し、雨の日を多くする前線"),
        QuizMatchingPair(prompt: "黒潮", match: "日本の南岸を流れる暖流")
        ],
        choices: [
        "日本の南岸を流れる暖流",
        "初夏に日本付近に停滞し、雨の日を多くする前線",
        "山を越えた空気が乾燥し、気温が高くなる現象",
        "夏に東北地方の太平洋側へ吹き、低温をもたらす冷たい風"
        ],
        explanation: "やませは東北地方の太平洋側に低温をもたらす冷たい風、フェーン現象は山越えの風で高温・乾燥になる現象、梅雨前線は初夏の長雨に関係する前線、黒潮は日本の南岸を流れる暖流です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】1月と8月の平均気温の差が最も大きい地点を答えましょう。",
        answer: "B地点",
        acceptableAnswers: ["B"],
        referenceTitle: "4地点の平均気温（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A地点", value: "1月5℃・8月27℃"),
        QuizReferenceRow(label: "B地点", value: "1月−6℃・8月22℃"),
        QuizReferenceRow(label: "C地点", value: "1月16℃・8月29℃"),
        QuizReferenceRow(label: "D地点", value: "1月9℃・8月25℃")
        ],
        explanation: "正解は「B地点」です。1月と8月の平均気温の差は、A地点22℃、B地点28℃、C地点13℃、D地点16℃なので、B地点が最も大きくなります。"
        ),

        QuizQuestion(
        question: "山の斜面に階段のようにつくられた水田を何といいますか？",
        choices: [
        "干拓地",
        "牧草地",
        "果樹園",
        "棚田"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「棚田」です。棚田は、山や丘の斜面を階段状に整えてつくられた水田です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】同じ耕地で一年のうちに異なる作物を二回つくることを「＿＿」といいます。",
        answer: "二毛作",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「二毛作」です。二毛作は、同じ耕地で一年に異なる作物を二回栽培する方法です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】農業の工夫と、その主な目的が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ビニールハウス", match: "気温などを調節して出荷時期を工夫する"),
        QuizMatchingPair(prompt: "大型農業機械", match: "広い農地を効率よく作業する"),
        QuizMatchingPair(prompt: "品種改良", match: "病気や気候に強い品種などをつくる"),
        QuizMatchingPair(prompt: "共同選果場", match: "大きさや品質をそろえて出荷する")
        ],
        choices: [
        "病気や気候に強い品種などをつくる",
        "大きさや品質をそろえて出荷する",
        "広い農地を効率よく作業する",
        "気温などを調節して出荷時期を工夫する"
        ],
        explanation: "ビニールハウスは出荷時期の工夫、大型農業機械は作業の効率化、品種改良は育てやすさや品質の向上、共同選果場は大きさや品質をそろえた出荷に役立ちます。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】10aあたりの収穫量が最も多い農家を答えましょう。",
        answer: "B農家",
        acceptableAnswers: ["B"],
        referenceTitle: "畑の面積と収穫量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "A農家", value: "20a・1000kg"),
        QuizReferenceRow(label: "B農家", value: "30a・1800kg"),
        QuizReferenceRow(label: "C農家", value: "40a・2000kg"),
        QuizReferenceRow(label: "D農家", value: "20a・1100kg")
        ],
        explanation: "正解は「B農家」です。10aあたりでは、A農家500kg、B農家600kg、C農家500kg、D農家550kgとなり、B農家が最も多くなります。"
        ),

        QuizQuestion(
        question: "暖流と寒流が出会う潮目の近くで魚が集まりやすい理由として、最も適切なものはどれですか？",
        choices: [
        "海水の温度が一年中まったく同じになるから",
        "プランクトンなどが豊富になり、魚のえさが多くなりやすいから",
        "海底がすべて浅くなるから",
        "海水の塩分がなくなるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「プランクトンなどが豊富になり、魚のえさが多くなりやすいから」です。暖流と寒流が出会う海域では魚のえさとなる生物が豊富になり、好漁場になりやすいです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】沿岸国が水産資源などを管理できる、海岸から200海里までの水域を「＿＿」といいます。",
        answer: "排他的経済水域",
        acceptableAnswers: ["EEZ", "排他的経済水域（EEZ）"],
        explanation: "＿＿に入る言葉は「排他的経済水域」です。沿岸国は、この水域の水産資源などについて権利を持ち、管理します。"
        ),

        QuizQuestion.classification(
        question: "【分類】水産物が消費者へ届くまでに関わる場所や施設を、主な役割で分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "漁船から魚を陸に上げる", match: "漁港"),
        QuizMatchingPair(prompt: "水揚げされた魚をせりにかける", match: "産地市場"),
        QuizMatchingPair(prompt: "魚を缶詰や干物などにする", match: "加工場"),
        QuizMatchingPair(prompt: "魚を低い温度で保管する", match: "冷凍倉庫")
        ],
        categories: ["漁港", "産地市場", "加工場", "冷凍倉庫"],
        explanation: "魚を陸に上げる場所は「漁港」、せりを行う場所は「産地市場」、水産加工品をつくる場所は「加工場」、低温で保管する施設は「冷凍倉庫」です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】魚が漁港で水揚げされてから小売店に並ぶまでの主な流れを、早い順に並べましょう。",
        choices: [
        "小売店に並ぶ",
        "産地市場でせりにかける",
        "漁船から水揚げする",
        "冷蔵車などで消費地へ運ぶ"
        ],
        orderedChoices: [
        "漁船から水揚げする",
        "産地市場でせりにかける",
        "冷蔵車などで消費地へ運ぶ",
        "小売店に並ぶ"
        ],
        explanation: "主な流れは「漁船から水揚げする、産地市場でせりにかける、冷蔵車などで消費地へ運ぶ、小売店に並ぶ」の順です。"
        ),

        QuizQuestion(
        question: "工場で生産工程を自動化する主なねらいとして、最も適切なものはどれですか？",
        choices: [
        "製品の種類を一つも作れないようにするため",
        "原料を運ばなくてもよくするため",
        "品質をそろえながら、効率よく生産するため",
        "工場を必ず山の中へ移すため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「品質をそろえながら、効率よく生産するため」です。機械やロボットを活用すると、同じ作業を正確に行い、生産を効率化しやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工業で使う主な原料と、そこから作られるものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鉄鉱石", match: "鉄鋼"),
        QuizMatchingPair(prompt: "原油", match: "合成樹脂"),
        QuizMatchingPair(prompt: "木材", match: "紙"),
        QuizMatchingPair(prompt: "ボーキサイト", match: "アルミニウム")
        ],
        choices: [
        "紙",
        "アルミニウム",
        "鉄鋼",
        "合成樹脂"
        ],
        explanation: "鉄鉱石からは鉄鋼、原油からは合成樹脂、木材からは紙、ボーキサイトからはアルミニウムが作られます。"
        ),

        QuizQuestion.classification(
        question: "【分類】工業製品を、主な工業の種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自動車", match: "機械工業"),
        QuizMatchingPair(prompt: "鉄鋼", match: "金属工業"),
        QuizMatchingPair(prompt: "プラスチックの原料", match: "化学工業"),
        QuizMatchingPair(prompt: "缶詰", match: "食料品工業")
        ],
        categories: ["機械工業", "金属工業", "化学工業", "食料品工業"],
        explanation: "自動車は「機械工業」、鉄鋼は「金属工業」、プラスチックの原料は「化学工業」、缶詰は「食料品工業」に分けられます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】4つの工場の1日の生産台数は、A工場120台、B工場90台、C工場150台、D工場110台です。生産台数が多い順に並べましょう。",
        choices: ["A工場", "B工場", "C工場", "D工場"],
        rankedChoices: ["C工場", "A工場", "D工場", "B工場"],
        explanation: "生産台数はC工場150台、A工場120台、D工場110台、B工場90台なので、「C工場、A工場、D工場、B工場」の順です。"
        ),

        QuizQuestion(
        question: "貿易でコンテナを使う利点として、最も適切なものはどれですか？",
        choices: [
        "船やトラックなどへ積み替えやすく、荷物を効率よく運べる",
        "コンテナに入れると関税が必ずなくなる",
        "コンテナは空港でしか使えない",
        "一つのコンテナには一種類の品物しか入れられない"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「船やトラックなどへ積み替えやすく、荷物を効率よく運べる」です。大きさが規格化されたコンテナは、異なる輸送手段の間でも扱いやすいという利点があります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】外国から輸入する品物にかける税を「＿＿」といいます。",
        answer: "関税",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「関税」です。関税は、外国から輸入する品物にかけられる税です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】日本が外国から輸入することのある原料や資源と、主な使い道が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鉄鉱石", match: "鉄鋼を作る原料"),
        QuizMatchingPair(prompt: "原油", match: "燃料や化学製品の原料"),
        QuizMatchingPair(prompt: "とうもろこし", match: "家畜の飼料など"),
        QuizMatchingPair(prompt: "木材", match: "建築材や紙の原料")
        ],
        choices: [
        "家畜の飼料など",
        "建築材や紙の原料",
        "燃料や化学製品の原料",
        "鉄鋼を作る原料"
        ],
        explanation: "鉄鉱石は鉄鋼、原油は燃料や化学製品、とうもろこしは家畜の飼料など、木材は建築材や紙の原料として利用されます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】外国の商品が船で日本へ輸入され、国内へ運ばれるまでの主な流れを、早い順に並べましょう。",
        choices: [
        "税関の手続きを受ける",
        "外国の港で船に積む",
        "国内の工場や店へ運ぶ",
        "日本の港で船から降ろす"
        ],
        orderedChoices: [
        "外国の港で船に積む",
        "日本の港で船から降ろす",
        "税関の手続きを受ける",
        "国内の工場や店へ運ぶ"
        ],
        explanation: "主な流れは「外国の港で船に積む、日本の港で船から降ろす、税関の手続きを受ける、国内の工場や店へ運ぶ」の順です。"
        ),

        QuizQuestion(
        question: "コンビニエンスストアなどで使われるPOSシステムは、主に何のために役立ちますか？",
        choices: [
        "店の建物を自動で建てるため",
        "商品の産地をすべて同じにするため",
        "買い物客の名前を必ず公開するため",
        "いつ、どの商品が、どれだけ売れたかを記録して販売に生かすため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「いつ、どの商品が、どれだけ売れたかを記録して販売に生かすため」です。POSシステムでは販売情報を集め、品ぞろえや発注などに活用できます。"
        ),

        QuizQuestion.classification(
        question: "【分類】情報の例を、主な種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "スマートフォンが示す現在地", match: "位置情報"),
        QuizMatchingPair(prompt: "氏名や電話番号", match: "個人情報"),
        QuizMatchingPair(prompt: "明日の降水確率", match: "気象情報"),
        QuizMatchingPair(prompt: "電車の遅れや運休のお知らせ", match: "交通情報")
        ],
        categories: ["位置情報", "個人情報", "気象情報", "交通情報"],
        explanation: "現在地は「位置情報」、氏名や電話番号は「個人情報」、降水確率は「気象情報」、電車の遅れや運休は「交通情報」です。"
        ),

        QuizQuestion(
        question: "友だちの顔写真や名前をインターネット上に公開するとき、最も適切な行動はどれですか？",
        choices: [
        "本人に知らせず、すぐに公開する",
        "本人の許可を確かめ、公開してよい内容か考える",
        "一度公開したら必ず消せるので気にしない",
        "名前だけなら必ず自由に公開してよい"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「本人の許可を確かめ、公開してよい内容か考える」です。写真や名前などの個人に関わる情報は、本人の意思やプライバシーに配慮して扱うことが大切です。"
        ),

        QuizQuestion(
        question: "森林が川の水量を保ち、洪水を起こりにくくする働きとして、最も適切な説明はどれですか？",
        choices: [
        "雨水を土にしみこませ、一度に川へ流れ出る量を減らす",
        "雨をすべて木の葉の上に永久にためる",
        "川の水を海へ流れないよう完全に止める",
        "森林の中では雨がまったく降らなくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「雨水を土にしみこませ、一度に川へ流れ出る量を減らす」です。森林の土は雨水をたくわえ、川へ流れ出る水の量を調節する働きがあります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】1人が1日に出すごみの量は、A市780g、B市720g、C市850g、D市650gです。ごみの量が少ない順に並べましょう。",
        choices: ["A市", "B市", "C市", "D市"],
        rankedChoices: ["D市", "B市", "A市", "C市"],
        explanation: "ごみの量はD市650g、B市720g、A市780g、C市850gなので、少ない順は「D市、B市、A市、C市」です。"
        ),

        QuizQuestion(
        question: "家庭で食品ロスを減らす行動として、最も適切なものはどれですか？",
        choices: [
        "食べきれない量を毎回多めに買う",
        "必要な量を考えて買い、食べられるものを使い切る",
        "賞味期限を確認せずに食品を捨てる",
        "まだ食べられる料理を必ず残す"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「必要な量を考えて買い、食べられるものを使い切る」です。必要な分だけ購入し、食材を無駄なく使うことは食品ロスの削減につながります。"
        ),

        QuizQuestion(
        question: "日本の川の特徴として、最も適切なものはどれですか？",
        choices: [
        "短くて流れがゆるやかな川が多い",
        "短くて流れが急な川が多い",
        "長くて流れがゆるやかな川が多い",
        "一年中ほとんど流れない川が多い"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「短くて流れが急な川が多い」です。日本は山地が多く、山から海までの距離が短いため、川は短くて流れが急なものが多くなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】地形の名前を、正しい種類に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "筑紫平野", match: "平野"),
        QuizMatchingPair(prompt: "山形盆地", match: "盆地"),
        QuizMatchingPair(prompt: "赤石山脈", match: "山脈"),
        QuizMatchingPair(prompt: "房総半島", match: "半島")
        ],
        categories: ["平野", "盆地", "山脈", "半島"],
        explanation: "筑紫平野は「平野」、山形盆地は「盆地」、赤石山脈は「山脈」、房総半島は「半島」です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】日本の4つの大きな島を、面積が大きい順に並べましょう。",
        choices: ["九州", "本州", "四国", "北海道"],
        rankedChoices: ["本州", "北海道", "九州", "四国"],
        explanation: "面積が大きい順は「本州、北海道、九州、四国」です。"
        ),

        QuizQuestion(
        question: "日本海側で冬に雪が多くなる主な理由はどれですか？",
        choices: [
        "大陸からの季節風が日本海で水蒸気をふくむから",
        "一年中、南から暖かい風だけが吹くから",
        "太平洋の海水が冬だけ凍るから",
        "山地がまったくないから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「大陸からの季節風が日本海で水蒸気をふくむから」です。冬の季節風は日本海を渡る間に水蒸気をふくみ、山地にぶつかって日本海側に雪を降らせます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の気候と特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "日本海側", match: "冬に雪や雨が多い"),
        QuizMatchingPair(prompt: "太平洋側", match: "冬に晴れる日が多く乾燥しやすい"),
        QuizMatchingPair(prompt: "瀬戸内", match: "一年を通して降水量が少なめ"),
        QuizMatchingPair(prompt: "中央高地", match: "夏と冬の気温差が大きい")
        ],
        choices: [
        "夏と冬の気温差が大きい",
        "一年を通して降水量が少なめ",
        "冬に雪や雨が多い",
        "冬に晴れる日が多く乾燥しやすい"
        ],
        explanation: "日本海側は「冬に雪や雨が多い」、太平洋側は「冬に晴れる日が多く乾燥しやすい」、瀬戸内は「一年を通して降水量が少なめ」、中央高地は「夏と冬の気温差が大きい」という特徴があります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】都市を北から南の順に並べましょう。",
        choices: ["鹿児島", "札幌", "那覇", "東京"],
        rankedChoices: ["札幌", "東京", "鹿児島", "那覇"],
        explanation: "北から南の順は「札幌、東京、鹿児島、那覇」です。緯度の違いは各地の気候にも関係します。"
        ),

        QuizQuestion(
        question: "大都市の近くで、新鮮な野菜や花を短時間で出荷する農業を何といいますか？",
        choices: [
        "促成栽培",
        "抑制栽培",
        "酪農",
        "近郊農業"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「近郊農業」です。近郊農業は大都市の近くで行われ、新鮮な野菜や花などを消費地へ短時間で届けやすい農業です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】国内で消費する食料のうち、国内の生産でまかなえる割合を「食料＿＿率」といいます。＿＿に入る言葉を答えましょう。",
        answer: "自給",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「自給」です。「食料自給率」は、国内で消費する食料を国内の生産でどれだけまかなえるかを表す割合です。"
        ),

        QuizQuestion.classification(
        question: "【分類】生産するものと、主な農業の種類を正しく分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "小麦", match: "畑作"),
        QuizMatchingPair(prompt: "りんご", match: "果樹栽培"),
        QuizMatchingPair(prompt: "牛乳", match: "酪農"),
        QuizMatchingPair(prompt: "鶏卵", match: "養鶏")
        ],
        categories: ["畑作", "果樹栽培", "酪農", "養鶏"],
        explanation: "小麦は「畑作」、りんごは「果樹栽培」、牛乳は「酪農」、鶏卵は「養鶏」に分けられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】野菜が収穫されてから店で売られるまでの流れを、早い順に並べましょう。",
        choices: ["店で販売する", "市場へ運ぶ", "収穫する", "選別して箱詰めする"],
        orderedChoices: ["収穫する", "選別して箱詰めする", "市場へ運ぶ", "店で販売する"],
        explanation: "「収穫する、選別して箱詰めする、市場へ運ぶ、店で販売する」の順です。"
        ),

        QuizQuestion(
        question: "魚や貝をいけすなどで人が育て、出荷する水産業を何といいますか？",
        choices: [
        "養殖業",
        "沖合漁業",
        "沿岸漁業",
        "遠洋漁業"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「養殖業」です。養殖業では、魚や貝などをいけすや養殖施設で育てて出荷します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】稚魚や稚貝を育てて海や川に放流し、成長したあとにとる漁業を「＿＿漁業」といいます。",
        answer: "栽培",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「栽培」です。「栽培漁業」は、稚魚や稚貝を育てて放流し、成長した資源を利用する取り組みです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水産業の種類と特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "沿岸漁業", match: "海岸に近い海で行う"),
        QuizMatchingPair(prompt: "沖合漁業", match: "日本近海の沖合で行う"),
        QuizMatchingPair(prompt: "遠洋漁業", match: "遠くの海で長期間行う"),
        QuizMatchingPair(prompt: "養殖業", match: "いけすなどで育てて出荷する")
        ],
        choices: [
        "遠くの海で長期間行う",
        "いけすなどで育てて出荷する",
        "海岸に近い海で行う",
        "日本近海の沖合で行う"
        ],
        explanation: "沿岸漁業は「海岸に近い海で行う」、沖合漁業は「日本近海の沖合で行う」、遠洋漁業は「遠くの海で長期間行う」、養殖業は「いけすなどで育てて出荷する」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】ある年の水産物の生産量について、沿岸漁業と養殖業を合わせた量を「万トン」をつけて答えましょう。",
        answer: "220万トン",
        acceptableAnswers: [],
        referenceTitle: "水産物の生産量（学習用データ）",
        referenceRows: [
        QuizReferenceRow(label: "沿岸漁業", value: "120万トン"),
        QuizReferenceRow(label: "沖合漁業", value: "180万トン"),
        QuizReferenceRow(label: "遠洋漁業", value: "40万トン"),
        QuizReferenceRow(label: "養殖業", value: "100万トン")
        ],
        explanation: "正解は「220万トン」です。沿岸漁業120万トンと養殖業100万トンを合わせると220万トンです。"
        ),

        QuizQuestion(
        question: "大きな工場が海沿いに集まる理由として、最も適切なものはどれですか？",
        choices: [
        "山の斜面を使うと工場の機械が動きやすいから",
        "農地から離れると電気代がかからないから",
        "海外からの原料を船で受け取り、製品を船で運び出しやすいから",
        "海水だけを原料にしている工場が多いから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「海外からの原料を船で受け取り、製品を船で運び出しやすいから」です。海沿いは港を利用しやすく、大量の原料や製品を船で運ぶのに便利です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】大きな組立工場に部品をつくって納める工場を「＿＿工場」といいます。",
        answer: "関連",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は「関連」です。「関連工場」は、組立工場で使う部品などをつくって納めます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】工業を支える場所やしくみと、その役割が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "組立工場", match: "多くの部品を組み合わせて製品を完成させる"),
        QuizMatchingPair(prompt: "関連工場", match: "部品をつくって組立工場へ納める"),
        QuizMatchingPair(prompt: "港", match: "原料の受け入れや製品の積み出しに使う"),
        QuizMatchingPair(prompt: "高速道路", match: "国内で部品や製品を運ぶのに使う")
        ],
        choices: [
        "国内で部品や製品を運ぶのに使う",
        "部品をつくって組立工場へ納める",
        "原料の受け入れや製品の積み出しに使う",
        "多くの部品を組み合わせて製品を完成させる"
        ],
        explanation: "組立工場は「多くの部品を組み合わせて製品を完成させる」、関連工場は「部品をつくって組立工場へ納める」、港は「原料の受け入れや製品の積み出しに使う」、高速道路は「国内で部品や製品を運ぶのに使う」という役割があります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】自動車工場で車体ができていく主な工程を、早い順に並べましょう。",
        choices: ["塗装する", "組み立てる", "鋼板をプレスする", "車体を溶接する"],
        orderedChoices: ["鋼板をプレスする", "車体を溶接する", "塗装する", "組み立てる"],
        explanation: "主な工程は「鋼板をプレスする、車体を溶接する、塗装する、組み立てる」の順です。"
        ),

        QuizQuestion(
        question: "大量の鉄鉱石を外国から日本へ運ぶのに、最も適した輸送手段はどれですか？",
        choices: [
        "旅客機",
        "貨物船",
        "新幹線",
        "トラック"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「貨物船」です。鉄鉱石のように重く大量の貨物は、海上を一度に多く運べる貨物船が適しています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】貿易で使う輸送手段と、運ぶのに適した品物や貨物が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "タンカー", match: "原油などの液体"),
        QuizMatchingPair(prompt: "自動車専用船", match: "完成した自動車"),
        QuizMatchingPair(prompt: "コンテナ船", match: "コンテナに入れた一般貨物"),
        QuizMatchingPair(prompt: "航空機", match: "軽くて高価で急いで運ぶ貨物")
        ],
        choices: ["完成した自動車", "軽くて高価で急いで運ぶ貨物", "原油などの液体", "コンテナに入れた一般貨物"],
        explanation: "タンカーは「原油などの液体」、自動車専用船は「完成した自動車」、コンテナ船は「コンテナに入れた一般貨物」、航空機は「軽くて高価で急いで運ぶ貨物」の輸送に適しています。"
        ),

        QuizQuestion.classification(
        question: "【分類】貿易を支える場所や機関の役割を、正しく分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "外国から来た船が貨物を積み下ろす", match: "港"),
        QuizMatchingPair(prompt: "航空貨物を外国と行き来させる", match: "空港"),
        QuizMatchingPair(prompt: "輸出入する品物を検査する", match: "税関"),
        QuizMatchingPair(prompt: "出荷まで貨物を保管する", match: "倉庫")
        ],
        categories: ["港", "空港", "税関", "倉庫"],
        explanation: "「外国から来た船が貨物を積み下ろす」は「港」、「航空貨物を外国と行き来させる」は「空港」、「輸出入する品物を検査する」は「税関」、「出荷まで貨物を保管する」は「倉庫」です。"
        ),

        QuizQuestion.dataReading(
        question: "【資料の読み取り】輸出額から輸入額を引いた金額が最も大きい国を答えましょう。",
        answer: "D国",
        acceptableAnswers: [],
        referenceTitle: "ある年の貿易額（学習用データ・単位：億円）",
        referenceRows: [
        QuizReferenceRow(label: "A国", value: "輸出80・輸入120"),
        QuizReferenceRow(label: "B国", value: "輸出100・輸入90"),
        QuizReferenceRow(label: "C国", value: "輸出60・輸入60"),
        QuizReferenceRow(label: "D国", value: "輸出140・輸入100")
        ],
        explanation: "正解は「D国」です。輸出額から輸入額を引くと、A国は−40、B国は10、C国は0、D国は40億円なので、D国が最も大きくなります。"
        ),

        QuizQuestion(
        question: "テレビ、新聞、インターネットなどから情報を得るとき、大切なことはどれですか？",
        choices: [
        "最初に見た情報だけを必ず正しいと考える",
        "情報の出どころを見ないようにする",
        "同じ内容なら古い情報だけを使う",
        "複数の信頼できる情報源で確かめる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「複数の信頼できる情報源で確かめる」です。情報の出どころや新しさを確認し、複数の情報源を比べることが大切です。"
        ),

        QuizQuestion(
        question: "災害時、SNSで出どころが分からない『橋がくずれた』という投稿を見ました。最初にする行動として最も適切なのはどれですか？",
        choices: [
        "自治体や公的機関の発表で確かめる",
        "内容を確かめずにすぐ広める",
        "友だち一人の意見だけで判断する",
        "投稿を見なかったことにする"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「自治体や公的機関の発表で確かめる」です。災害時は誤った情報が広がることがあるため、信頼できる公的な情報で確認することが大切です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】情報通信技術を表すアルファベット3文字を答えましょう。",
        answer: "ICT",
        acceptableAnswers: ["ict", "ＩＣＴ"],
        explanation: "答えは「ICT」です。ICTは、コンピュータや通信ネットワークを使って情報をやり取りする技術を表します。"
        ),

        QuizQuestion(
        question: "3Rのうち、ごみになるものをできるだけ減らす取り組みはどれですか？",
        choices: [
        "リユース",
        "リサイクル",
        "リデュース",
        "リペア"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「リデュース」です。リデュースは、必要のないものを買わないなど、ごみそのものを減らす取り組みです。"
        ),

        QuizQuestion(
        question: "家庭などから出た汚れた水をきれいにして、川や海へ戻す施設はどれですか？",
        choices: [
        "浄水場",
        "下水処理場",
        "発電所",
        "清掃工場"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「下水処理場」です。下水処理場では、家庭などから出た汚れた水を処理して、きれいにしてから川や海へ戻します。"
        ),

        QuizQuestion.classification(
        question: "【分類】環境を守る取り組みを、主な目的ごとに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "工場の煙に含まれる汚れを減らす", match: "大気を守る"),
        QuizMatchingPair(prompt: "生活排水を処理して川へ流す", match: "水質を守る"),
        QuizMatchingPair(prompt: "古紙から再生紙をつくる", match: "資源を大切に使う"),
        QuizMatchingPair(prompt: "干潟を保全して生き物のすみかを残す", match: "生態系を守る")
        ],
        categories: ["大気を守る", "水質を守る", "資源を大切に使う", "生態系を守る"],
        explanation: "「工場の煙に含まれる汚れを減らす」は「大気を守る」、「生活排水を処理して川へ流す」は「水質を守る」、「古紙から再生紙をつくる」は「資源を大切に使う」、「干潟を保全して生き物のすみかを残す」は「生態系を守る」取り組みです。"
        ),

    ]
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: sociallyBalancedShuffledQuizList(quizBeginnerList))
    }
    @StateObject var sharedInterstitial = Interstitial()
    var body: some View {
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai5, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai5ListView(isPresenting: .constant(false))
    }
}
