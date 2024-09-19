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
            question: "日本の輸出品の中で重要な工業製品はどれですか？",
            choices: [
                "自動車",
                "石油",
                "魚",
                "木材"
            ],
            correctAnswerIndex: 0,
            explanation: "日本の自動車産業は世界的に有名で、重要な輸出品となっています。"
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
            question: "日本で主に発生する自然災害はどれですか？",
            choices: [
                "洪水",
                "地震",
                "干ばつ",
                "竜巻"
            ],
            correctAnswerIndex: 1,
            explanation: "日本では地震が頻繁に発生し、それに伴う災害も多くあります。"
        ),
        QuizQuestion(
            question: "日本の主要な輸出品の一つはどれですか？",
            choices: [
                "自動車",
                "コーヒー",
                "鉄鉱石",
                "米"
            ],
            correctAnswerIndex: 0,
            explanation: "日本は自動車を世界中に輸出しており、主要な輸出品の一つです。"
        ),
        QuizQuestion(
            question: "地球温暖化の主な原因となるガスはどれですか？",
            choices: [
                "窒素",
                "二酸化炭素",
                "酸素",
                "アルゴン"
            ],
            correctAnswerIndex: 1,
            explanation: "二酸化炭素は温室効果ガスの一つで、地球温暖化の原因とされています。"
        ),
        QuizQuestion(
            question: "日本が主に輸入しているエネルギー資源はどれですか？",
            choices: [
                "風力",
                "天然ガス",
                "石油",
                "太陽光"
            ],
            correctAnswerIndex: 2,
            explanation: "日本はエネルギー源として多くの石油を輸入しています。"
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
            correctAnswerIndex: 2,
            explanation: "日本は太平洋プレートの影響を強く受けるため、地震が多発します。"
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
            correctAnswerIndex: 2,
            explanation: "中国は世界で最も人口が多い国で、13億人以上の人々が住んでいます。"
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
            correctAnswerIndex: 1,
            explanation: "中国は世界で最も人口が多い国です。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai5, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Sansu5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Sansu5ListView(isPresenting: .constant(false))
    }
}
