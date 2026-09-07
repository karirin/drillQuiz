//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika4ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】磁石の 力が もっとも強い部分を答えましょう。",
            answer: "極",
            acceptableAnswers: ["きょく"],
            explanation: "磁石の力が もっとも強い部分を『極』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】月が まるく見えるときの 名前を答えましょう。",
            answer: "満月",
            acceptableAnswers: ["まんげつ"],
            explanation: "月が まるく見えるときは『満月』です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】回路の 部品と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "乾電池", match: "電気を 流す もと"),
                QuizMatchingPair(prompt: "スイッチ", match: "電気の 道を つなぐ"),
                QuizMatchingPair(prompt: "豆電球", match: "光る")
            ],
            choices: ["光る", "電気の 道を つなぐ", "電気を 流す もと"],
            explanation: "乾電池は 電気のもと、スイッチは つなぐ役目、豆電球は 光る部分です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】月の 形と 名前が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "細い月", match: "三日月"),
                QuizMatchingPair(prompt: "半分の月", match: "半月"),
                QuizMatchingPair(prompt: "まるい月", match: "満月")
            ],
            choices: ["半月", "満月", "三日月"],
            explanation: "細い月は 三日月、半分の月は 半月、まるい月は 満月です。"
        ),

        QuizQuestion.classification(
            question: "【分類】ものを 『電気を通す』『電気を通さない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "鉄のくぎ", match: "電気を通す"),
                QuizMatchingPair(prompt: "ゴム", match: "電気を通さない"),
                QuizMatchingPair(prompt: "アルミホイル", match: "電気を通す")
            ],
            categories: ["電気を通す", "電気を通さない"],
            explanation: "金ぞくは 電気を通しやすく、ゴムは 電気を通しません。"
        ),

        QuizQuestion.classification(
            question: "【分類】ものを 『磁石につく』『磁石につかない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "クリップ", match: "磁石につく"),
                QuizMatchingPair(prompt: "アルミかん", match: "磁石につかない"),
                QuizMatchingPair(prompt: "鉄のねじ", match: "磁石につく")
            ],
            categories: ["磁石につく", "磁石につかない"],
            explanation: "鉄でできたものは 磁石につきやすく、アルミは つきません。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】かいろを つくる 手順を じゅんに ならべましょう。",
            choices: ["スイッチを 入れる", "導線で つなぐ", "乾電池を おく"],
            orderedChoices: ["乾電池を おく", "導線で つなぐ", "スイッチを 入れる"],
            explanation: "乾電池をおき、導線でつないでから スイッチを入れると 回路が はたらきます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】月を 明るく見えるじゅんに ならべましょう。",
            choices: ["三日月", "満月", "半月"],
            rankedChoices: ["満月", "半月", "三日月"],
            explanation: "月は、満月が もっとも明るく見え、そのつぎが 半月、三日月です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】空気を あたためると 体積は どうなりますか。",
            answer: "大きくなる",
            acceptableAnswers: ["おおきくなる"],
            explanation: "空気は あたためると ふくらみ、体積が 大きくなります。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】星が いくつも 集まって 形に 見えるものを答えましょう。",
            answer: "星座",
            acceptableAnswers: ["せいざ"],
            explanation: "星が 集まって 形に見えるものを『星座』といいます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】方位じしんの 記号と 方角が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "N", match: "北"),
                QuizMatchingPair(prompt: "E", match: "東"),
                QuizMatchingPair(prompt: "W", match: "西")
            ],
            choices: ["東", "西", "北"],
            explanation: "方位じしんでは Nが北、Eが東、Wが西を表します。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】あたためた ときの 変化が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "空気", match: "体積が 大きくなる"),
                QuizMatchingPair(prompt: "水", match: "じょう発しやすくなる"),
                QuizMatchingPair(prompt: "金属", match: "少し のびる")
            ],
            choices: ["少し のびる", "体積が 大きくなる", "じょう発しやすくなる"],
            explanation: "空気や 水、金属は あたためると それぞれ ちがう変化をします。"
        ),

        QuizQuestion.classification(
            question: "【分類】天体を 『自分で光る』『光を 受けて見える』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "太陽", match: "自分で光る"),
                QuizMatchingPair(prompt: "月", match: "光を 受けて見える"),
                QuizMatchingPair(prompt: "星", match: "自分で光る")
            ],
            categories: ["自分で光る", "光を 受けて見える"],
            explanation: "太陽や 星は 自分で光り、月は 太陽の光を受けて見えます。"
        ),

        QuizQuestion.classification(
            question: "【分類】回路を 『電流が流れる』『電流が流れない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "スイッチが 入っている", match: "電流が流れる"),
                QuizMatchingPair(prompt: "どう線が ぬけている", match: "電流が流れない"),
                QuizMatchingPair(prompt: "輪の形に つながっている", match: "電流が流れる")
            ],
            categories: ["電流が流れる", "電流が流れない"],
            explanation: "回路が つながっていると 電流が流れ、切れていると 流れません。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】月の 見え方の 変化を じゅんに ならべましょう。",
            choices: ["満月", "三日月", "半月"],
            orderedChoices: ["三日月", "半月", "満月"],
            explanation: "細い三日月から 半月へと大きくなり、満月になります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】あたためたとき 体積が大きくなりやすいじゅんに ならべましょう。",
            choices: ["金属", "空気", "水"],
            rankedChoices: ["空気", "水", "金属"],
            explanation: "あたためたときの 体積の変わりやすさは、空気、水、金属の順です。"
        ),

        QuizQuestion(
            question: "電気を通さないものはどれですか？",
            choices: [
                "鉄の釘",
                "ゴム",
                "銅線",
                "アルミニウム"
            ],
            correctAnswerIndex: 1,
            explanation: "ゴムは電気を通さない絶縁体です。"
        ),

        QuizQuestion(
            question: "乾電池を使うと何ができますか？",
            choices: [
                "豆電球を光らせる",
                "水を温める",
                "木を燃やす",
                "風を吹かせる"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "磁石が引き寄せないものはどれですか？",
            choices: [
                "アルミ缶",
                "鉄のネジ",
                "クリップ",
                "針金"
            ],
            correctAnswerIndex: 0,
            explanation: "アルミニウムは磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "カエルはどこで生活していますか？",
            choices: [
                "山の上",
                "海",
                "池や川",
                "砂漠"
            ],
            correctAnswerIndex: 2,
            explanation: "カエルは池や川などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "電気を流すと、どれが起こりますか？",
            choices: [
                "豆電球が光る",
                "風が吹く",
                "水が流れる",
                "音が鳴る"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "乾電池が無くなると、何が起こりますか？",
            choices: [
                "豆電球が消える",
                "水が溢れる",
                "音が鳴り始める",
                "風が強くなる"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池が無くなると豆電球が消えます。"
        ),

        QuizQuestion(
            question: "磁石で一番強く引き寄せられる場所はどこですか？",
            choices: [
                "真ん中",
                "端の部分",
                "底",
                "全体"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が一番強く引き寄せられます。"
        ),

        QuizQuestion(
            question: "電気が流れなくなった場合、何が考えられますか？",
            choices: [
                "豆電球が壊れている",
                "電池が切れている",
                "風が止まった",
                "音が鳴り始めた"
            ],
            correctAnswerIndex: 0,
            explanation: "電気が流れない原因として、豆電球が壊れている可能性があります。"
        ),

        QuizQuestion(
            question: "フクロウはどこで生活していますか？",
            choices: [
                "砂漠",
                "森",
                "川",
                "海"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは森や林に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池を使って光らせることができるものはどれですか？",
            choices: [
                "豆電球",
                "木の板",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うと豆電球を光らせることができます。"
        ),
        QuizQuestion(
            question: "電気を通すものはどれですか？",
            choices: [
                "木の棒",
                "鉄の釘",
                "プラスチック",
                "ゴム"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄の釘は電気を通す導体です。"
        ),

        QuizQuestion(
            question: "乾電池を使って何ができますか？",
            choices: [
                "水を凍らせる",
                "豆電球を光らせる",
                "火をつける",
                "風を起こす"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "フクロウが主に見られる場所はどこですか？",
            choices: [
                "砂漠",
                "森",
                "川",
                "海の中"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは森や林でよく見られます。"
        ),

        QuizQuestion(
            question: "磁石が引き寄せるものはどれですか？",
            choices: [
                "紙",
                "ガラス",
                "プラスチック",
                "鉄のネジ"
            ],
            correctAnswerIndex: 3,
            explanation: "鉄のネジは磁石に引き寄せられます。"
        ),

        QuizQuestion(
            question: "乾電池が無くなったとき、何が起こりますか？",
            choices: [
                "豆電球が消える",
                "水が流れる",
                "音が大きくなる",
                "風が強くなる"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池が無くなると、豆電球が消えます。"
        ),

        QuizQuestion(
            question: "電気を使うとどうなりますか？",
            choices: [
                "水が冷たくなる",
                "音が鳴る",
                "豆電球が光る",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "電気を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カエルが主に住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "池や川",
                "山の上",
                "海の底"
            ],
            correctAnswerIndex: 1,
            explanation: "カエルは池や川などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "電気が流れるためには何が必要ですか？",
            choices: [
                "プラスチック",
                "鉄の釘",
                "木の棒",
                "ガラス"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄の釘のような導体が電気を流すために必要です。"
        ),

        QuizQuestion(
            question: "磁石が一番強いのはどこですか？",
            choices: [
                "真ん中",
                "端の部分",
                "全体",
                "底"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が一番強い力を持っています。"
        ),

        QuizQuestion(
            question: "乾電池が使い終わったときにどうなりますか？",
            choices: [
                "豆電球が光る",
                "豆電球が消える",
                "音が出る",
                "風が強くなる"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池が使い終わると、豆電球が消えます。"
        ),
        QuizQuestion(
            question: "磁石が引き寄せる金属はどれですか？",
            choices: [
                "アルミニウム",
                "鉄",
                "銅",
                "プラスチック"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石は鉄などの金属を引き寄せます。"
        ),

        QuizQuestion(
            question: "乾電池を正しく使うと何が起こりますか？",
            choices: [
                "水が流れる",
                "音が鳴る",
                "豆電球が光る",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "乾電池を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "磁石に引き寄せられないものはどれですか？",
            choices: [
                "鉄の釘",
                "コバルト",
                "木の棒",
                "ニッケル"
            ],
            correctAnswerIndex: 2,
            explanation: "木の棒は磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "カエルが主に住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "海の中",
                "池や川",
                "山の上"
            ],
            correctAnswerIndex: 2,
            explanation: "カエルは池や川など、水のある場所に住んでいます。"
        ),

        QuizQuestion(
            question: "フクロウが住む場所はどこですか？",
            choices: [
                "砂漠",
                "川",
                "森",
                "海"
            ],
            correctAnswerIndex: 2,
            explanation: "フクロウは森や林に住んでいます。"
        ),

        QuizQuestion(
            question: "電気が流れるとどうなりますか？",
            choices: [
                "水が温まる",
                "音が鳴る",
                "豆電球が光る",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "電気が流れると豆電球が光ります。"
        ),

        QuizQuestion(
            question: "乾電池が無くなると何が起こりますか？",
            choices: [
                "豆電球が消える",
                "風が止まる",
                "水が止まる",
                "音が消える"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池が無くなると、豆電球が消えます。"
        ),

        QuizQuestion(
            question: "電気を使って光らせることができるものはどれですか？",
            choices: [
                "豆電球",
                "木の板",
                "金属の棒",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "植物がよく育つために必要なものはどれですか？",
            choices: [
                "光",
                "砂",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成をするために光が必要です。"
        ),

        QuizQuestion(
            question: "磁石の力が最も強い場所はどこですか？",
            choices: [
                "真ん中",
                "端",
                "全体",
                "底"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が最も強い磁力を持っています。"
        ),
        QuizQuestion(
            question: "磁石に引き寄せられるものはどれですか？",
            choices: [
                "プラスチック",
                "鉄のくぎ",
                "ガラス",
                "紙"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄のくぎは磁石に引き寄せられます。"
        ),

        QuizQuestion(
            question: "電気を流すとどうなるでしょうか？",
            choices: [
                "豆電球が光る",
                "水が流れる",
                "風が吹く",
                "音が出る"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "磁石で引き寄せられないものはどれですか？",
            choices: [
                "木の棒",
                "鉄のネジ",
                "コバルト",
                "ニッケル"
            ],
            correctAnswerIndex: 0,
            explanation: "木の棒は磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "乾電池を使うと何ができますか？",
            choices: [
                "電線を燃やす",
                "豆電球を光らせる",
                "水を沸かす",
                "風を作る"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと電気が流れて豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カエルが主に生活する場所はどこですか？",
            choices: [
                "砂漠",
                "海",
                "池や川",
                "山の上"
            ],
            correctAnswerIndex: 2,
            explanation: "カエルは池や川など、水のある場所に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池が無くなったときに起こることは何ですか？",
            choices: [
                "音が消える",
                "豆電球が消える",
                "風が止まる",
                "水が溢れる"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池が無くなると、豆電球が消えます。"
        ),

        QuizQuestion(
            question: "フクロウはどこに住んでいますか？",
            choices: [
                "川の中",
                "森",
                "砂漠",
                "山の上"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは森や林に住んでいます。"
        ),

        QuizQuestion(
            question: "電気を流すと何が光りますか？",
            choices: [
                "風車",
                "豆電球",
                "スピーカー",
                "コンロ"
            ],
            correctAnswerIndex: 1,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "磁石の一番強い場所はどこですか？",
            choices: [
                "真ん中",
                "端の部分",
                "全体",
                "底"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が最も強く引き寄せます。"
        ),

        QuizQuestion(
            question: "植物が育つために必要な要素はどれですか？",
            choices: [
                "水",
                "砂",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は水がないと育ちません。"
        ),
        QuizQuestion(
            question: "乾電池を使うと動かせるものはどれですか？",
            choices: [
                "電気ストーブ",
                "扇風機",
                "豆電球",
                "自転車"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと扇風機のモーターを動かすことができます。"
        ),

        QuizQuestion(
            question: "金属であり、磁石に引き寄せられないものはどれですか？",
            choices: [
                "鉄",
                "コバルト",
                "アルミニウム",
                "ニッケル"
            ],
            correctAnswerIndex: 2,
            explanation: "アルミニウムは金属ですが、磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "電池を正しく使うとどうなるでしょうか？",
            choices: [
                "水が流れる",
                "豆電球が光る",
                "音が鳴る",
                "風が吹く"
            ],
            correctAnswerIndex: 1,
            explanation: "電池を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カメが主に住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "山の上",
                "池や川",
                "海の中"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは池や川などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池が切れたとき、何が起こりますか？",
            choices: [
                "風が吹く",
                "水が出る",
                "豆電球が消える",
                "音が鳴る"
            ],
            correctAnswerIndex: 2,
            explanation: "乾電池が切れると豆電球は消えます。"
        ),

        QuizQuestion(
            question: "電気を流すと、どれが起こりますか？",
            choices: [
                "植物が育つ",
                "豆電球が光る",
                "水が温まる",
                "風が吹く"
            ],
            correctAnswerIndex: 1,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "フクロウはどこでよく見られますか？",
            choices: [
                "砂漠",
                "川の中",
                "森",
                "海の中"
            ],
            correctAnswerIndex: 2,
            explanation: "フクロウは森や林でよく見られます。"
        ),

        QuizQuestion(
            question: "電池を使って光らせることができるものはどれですか？",
            choices: [
                "木の板",
                "豆電球",
                "金属の棒",
                "プラスチック"
            ],
            correctAnswerIndex: 1,
            explanation: "電池を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "磁石が最も強く引き寄せる場所はどこですか？",
            choices: [
                "真ん中",
                "端",
                "全体",
                "どこにも引き寄せられない"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が最も強く引き寄せます。"
        ),

        QuizQuestion(
            question: "電気が流れなくなった場合、何が考えられますか？",
            choices: [
                "豆電球が壊れている",
                "水が足りない",
                "風が止まった",
                "光が弱くなった"
            ],
            correctAnswerIndex: 0,
            explanation: "電気が流れない原因として、豆電球が壊れている可能性があります。"
        ),
        QuizQuestion(
            question: "磁石で引き寄せられる金属はどれですか？",
            choices: [
                "金",
                "銀",
                "鉄",
                "アルミニウム"
            ],
            correctAnswerIndex: 2,
            explanation: "磁石に引き寄せられる金属は鉄などです。"
        ),

        QuizQuestion(
            question: "電気を使って何ができるかを選びなさい。",
            choices: [
                "木を燃やす",
                "豆電球を光らせる",
                "水を凍らせる",
                "風を起こす"
            ],
            correctAnswerIndex: 1,
            explanation: "電気を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "魚がよく住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "川",
                "山の頂上",
                "草原"
            ],
            correctAnswerIndex: 1,
            explanation: "魚は川や湖、海などの水中に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池を正しく使うと、どの現象が見られますか？",
            choices: [
                "紙が燃える",
                "風が吹く",
                "豆電球が光る",
                "花が咲く"
            ],
            correctAnswerIndex: 2,
            explanation: "乾電池を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カメはどの場所に住むことが多いですか？",
            choices: [
                "山の上",
                "砂漠",
                "池や川",
                "海の底"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは池や川などの水辺に住むことが多いです。"
        ),

        QuizQuestion(
            question: "電池を使って何ができるか選んでください。",
            choices: [
                "音を鳴らす",
                "火をつける",
                "花を咲かせる",
                "水を沸かす"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うとスピーカーで音を鳴らすことができます。"
        ),

        QuizQuestion(
            question: "植物はどのような場所で育ちやすいですか？",
            choices: [
                "光が当たる場所",
                "暗い場所",
                "寒い場所",
                "砂漠"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光が当たる場所で育ちやすいです。"
        ),

        QuizQuestion(
            question: "乾電池を使って音を鳴らすために必要なものはどれですか？",
            choices: [
                "豆電球",
                "スピーカー",
                "磁石",
                "水"
            ],
            correctAnswerIndex: 1,
            explanation: "音を鳴らすためにはスピーカーが必要です。"
        ),

        QuizQuestion(
            question: "カタツムリが好んで住む場所はどこですか？",
            choices: [
                "乾いた砂地",
                "湿った草むら",
                "山の上",
                "砂漠"
            ],
            correctAnswerIndex: 1,
            explanation: "カタツムリは湿った場所を好んで住んでいます。"
        ),

        QuizQuestion(
            question: "電池を使って動かせるものはどれですか？",
            choices: [
                "風車",
                "電気ストーブ",
                "豆電球",
                "モーター"
            ],
            correctAnswerIndex: 3,
            explanation: "電池を使うとモーターを動かすことができます。"
        ),
        QuizQuestion(
            question: "磁石が引き寄せないものはどれですか？",
            choices: [
                "アルミ缶",
                "鉄の釘",
                "クリップ",
                "ネジ"
            ],
            correctAnswerIndex: 0,
            explanation: "アルミニウムは磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "電気を流すために必要なものはどれですか？",
            choices: [
                "電線",
                "水",
                "紙",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を流すには電線や導電性のある物質が必要です。"
        ),

        QuizQuestion(
            question: "電池を使うと電気が流れて何ができますか？",
            choices: [
                "音が鳴る",
                "風が吹く",
                "豆電球が光る",
                "水が沸く"
            ],
            correctAnswerIndex: 2,
            explanation: "電池で電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "フクロウはどこで生活していますか？",
            choices: [
                "森",
                "砂漠",
                "海の中",
                "川の中"
            ],
            correctAnswerIndex: 0,
            explanation: "フクロウは森や林で生活しています。"
        ),

        QuizQuestion(
            question: "植物が育つために必要なものはどれですか？",
            choices: [
                "光",
                "砂",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成をするために光が必要です。"
        ),

        QuizQuestion(
            question: "乾電池を使って電気が流れるときに点灯するものはどれですか？",
            choices: [
                "豆電球",
                "風車",
                "スピーカー",
                "電気ストーブ"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うと電気が流れて豆電球が点灯します。"
        ),

        QuizQuestion(
            question: "磁石のどこに最も強い力がありますか？",
            choices: [
                "端の部分",
                "真ん中の部分",
                "全体",
                "磁石には力がない"
            ],
            correctAnswerIndex: 0,
            explanation: "磁石の端の部分（極）に最も強い磁力があります。"
        ),

        QuizQuestion(
            question: "カメが主に住んでいる場所はどこですか？",
            choices: [
                "海",
                "砂漠",
                "川",
                "森"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは主に川や池などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "電気が流れるときに電球が光らない理由はどれですか？",
            choices: [
                "電池が切れている",
                "電線がない",
                "水が足りない",
                "豆電球が壊れている"
            ],
            correctAnswerIndex: 3,
            explanation: "豆電球が壊れていると、電気が流れても光りません。"
        ),

        QuizQuestion(
            question: "バッタが主に見られる場所はどこですか？",
            choices: [
                "草原",
                "海辺",
                "山の頂上",
                "砂漠"
            ],
            correctAnswerIndex: 0,
            explanation: "バッタは草原や草むらに多く見られます。"
        ),
        QuizQuestion(
            question: "磁石に引き寄せられるものはどれですか？",
            choices: [
                "鉄の釘",
                "木の板",
                "紙",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "磁石に引き寄せられるのは鉄やニッケルなどの金属です。"
        ),

        QuizQuestion(
            question: "乾電池を使って電気を流すと何が起こりますか？",
            choices: [
                "水が流れる",
                "豆電球が光る",
                "風が吹く",
                "音が鳴る"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと、電気が流れて豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カエルが住んでいる場所はどこですか？",
            choices: [
                "水の中",
                "砂漠",
                "山の上",
                "海の底"
            ],
            correctAnswerIndex: 0,
            explanation: "カエルは水辺や湿った場所に住んでいます。"
        ),

        QuizQuestion(
                question: "モンシロチョウの幼虫を観察したいとき、探すと見つけやすい植物はどれですか？",
                choices: [
                    "キャベツ",
                    "マツ",
                    "イチョウ",
                    "ススキ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『キャベツ』です。モンシロチョウはキャベツなどの葉に卵を産み、幼虫はその葉を食べて育ちます。"
            ),

            QuizQuestion(
                question: "教室から温度計を外の日かげへ運び、すぐに読まずに少し待つのはなぜですか？",
                choices: [
                    "温度計の目盛りを増やすため",
                    "温度計を周りの空気の温度になじませるため",
                    "液だめの中の液を凍らせるため",
                    "日光が当たる時刻まで待つため"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『温度計を周りの空気の温度になじませるため』です。温度計を測る場所の空気になじませてから読むと、その場所の気温をより正しく測れます。"
            ),

            QuizQuestion(
                question: "水がさかんに沸騰しているとき、さらに火を強くすると一般にどうなりますか？",
                choices: [
                    "水温がすぐに0℃まで下がる",
                    "水温が50℃付近で止まる",
                    "水温は100℃付近のままで、沸騰がより盛んになる",
                    "水がすぐにすべて氷になる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『水温は100℃付近のままで、沸騰がより盛んになる』です。水が沸騰している間は温度が100℃付近に保たれ、加熱を強くすると水蒸気になる量が増えます。"
            ),

            QuizQuestion(
                question: "手や指に多くの関節があることで、できる動きはどれですか？",
                choices: [
                    "骨を自由に長くしたり短くしたりする",
                    "手の中の骨をすべて一度に外す",
                    "筋肉を使わずに物を持ち上げる",
                    "小さな物をつまむなど、細かな動きをする"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『小さな物をつまむなど、細かな動きをする』です。手や指には多くの関節があり、それぞれを曲げ伸ばしすることで細かな動きができます。"
            ),

            QuizQuestion(
                question: "導線だけで乾電池の＋極と−極を直接つなぐと危険なのはなぜですか？",
                choices: [
                    "大きな電流が流れ、乾電池や導線が熱くなることがあるから",
                    "乾電池の中に水がたまるから",
                    "導線が必ず磁石に変わるから",
                    "乾電池の＋極と−極が入れ替わるから"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『大きな電流が流れ、乾電池や導線が熱くなることがあるから』です。乾電池の両極を導線だけで直接つないではいけません。"
            ),

            QuizQuestion(
                question: "北極星を探すとき、手がかりとして使える星の並びはどれですか？",
                choices: [
                    "冬の大三角",
                    "北斗七星",
                    "夏の大三角",
                    "オリオン座の三つ星"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『北斗七星』です。北斗七星のひしゃくの先端にある2つの星を手がかりにすると、北極星を見つけられます。"
            ),

            QuizQuestion(
                question: "ふたを閉めたやわらかいペットボトルを暖かい場所から冷たい場所へ移すと、へこむことがあります。主な理由はどれですか？",
                choices: [
                    "ボトルの中の空気が水に変わるから",
                    "ボトルの材料が冷えると消えるから",
                    "中の空気が冷えて体積が小さくなるから",
                    "外の空気がなくなるから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『中の空気が冷えて体積が小さくなるから』です。閉じ込めた空気は冷やされると体積が小さくなり、外側から押されてボトルがへこむことがあります。"
            ),

            QuizQuestion(
                question: "春にタンポポの花が終わったあとに見られる変化はどれですか？",
                choices: [
                    "花が氷に変わる",
                    "根が地面から飛び出す",
                    "葉がすべて水にとける",
                    "綿毛のついた実ができ、風で運ばれる"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『綿毛のついた実ができ、風で運ばれる』です。タンポポは花のあとに綿毛のついた実をつくり、風を利用して広がります。"
            ),

            QuizQuestion(
                question: "雨の降らなかった2日間を比べました。A日は午前6時が9℃、午後2時が23℃、B日は午前6時が15℃、午後2時が19℃でした。一般的な晴れの日の気温変化に、より近いのはどちらですか？",
                choices: [
                    "A日",
                    "B日",
                    "どちらも必ずくもり",
                    "気温の記録からはまったく考えられない"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『A日』です。A日は朝と午後の気温差が14℃と大きく、日中に地面がよく温まる晴れの日の変化により近い記録です。"
            ),

            QuizQuestion(
                question: "少量の温かい水を入れたビーカーにラップをかけ、ラップの上に氷を置くと、ラップの内側に水滴ができました。この水滴について正しい説明はどれですか？",
                choices: [
                    "氷がラップを通り抜けて落ちた水である",
                    "水から出た水蒸気が冷やされ、再び水になったものである",
                    "ラップが水を新しく作ったものである",
                    "ビーカーの中の空気がすべて水になったものである"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『水から出た水蒸気が冷やされ、再び水になったものである』です。温かい水から出た水蒸気が、氷で冷えたラップに触れて水滴になりました。"
            ),

            QuizQuestion(
                question: "体のどこに関節があるかを確かめる方法として、最も適切なものはどれですか？",
                choices: [
                    "体を動かさず、皮ふの色だけを見る",
                    "骨を強くたたいて音だけを比べる",
                    "体をゆっくり曲げ伸ばしし、曲がる部分を手で確かめる",
                    "筋肉を使わないように息を止める"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『体をゆっくり曲げ伸ばしし、曲がる部分を手で確かめる』です。骨と骨のつなぎ目で体が曲がる部分に関節があります。"
            ),

            QuizQuestion(
                question: "同じ新しい乾電池2個を直列につないでモーターを回したあと、2個とも向きを反対にしてつなぎ直しました。回り方は一般にどうなりますか？",
                choices: [
                    "モーターは必ず止まる",
                    "同じ向きに遅く回る",
                    "同じ向きにさらに速く回る",
                    "速さは同じくらいで、反対向きに回る"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『速さは同じくらいで、反対向きに回る』です。乾電池2個の向きをそろえて両方とも反対にすると、電流の強さは同程度のまま向きが反対になります。"
            ),

            QuizQuestion(
                question: "オリオン座の星のうち、赤っぽく見える星はどれですか？",
                choices: [
                    "ベテルギウス",
                    "リゲル",
                    "シリウス",
                    "デネブ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『ベテルギウス』です。ベテルギウスはオリオン座にある、赤っぽく見える明るい星です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】先をふさいだ注射器のピストンを引くと、閉じ込めた空気の体積は ＿＿ 。",
                answer: "大きくなる",
                acceptableAnswers: ["おおきくなる", "増える", "ふえる"],
                explanation: "＿＿に入る言葉は『大きくなる』です。ピストンを引くと、閉じ込めた空気が広がって体積が大きくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】セミの幼虫が成虫になるとき、木の幹などに残す殻を何といいますか。",
                answer: "抜け殻",
                acceptableAnswers: ["ぬけがら", "抜けがら"],
                explanation: "答えは『抜け殻』です。セミの幼虫はからをぬいで成虫になり、そのからが木の幹などに残ります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】時刻による気温の変化を、点を線で結んで表すグラフを何といいますか。",
                answer: "折れ線グラフ",
                acceptableAnswers: ["おれせんグラフ", "折線グラフ"],
                explanation: "答えは『折れ線グラフ』です。時刻ごとの気温を点で表して線で結ぶと、変化の様子が分かりやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】水が沸騰している間も加熱を続けると、水の量は少しずつ ＿＿ 。",
                answer: "少なくなる",
                acceptableAnswers: ["すくなくなる", "減る", "へる"],
                explanation: "＿＿に入る言葉は『少なくなる』です。水が水蒸気に変わって外へ出るため、水の量は少しずつ減ります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】首から腰にかけて体の中心を支える、多くの骨がつながった部分を何といいますか。",
                answer: "背骨",
                acceptableAnswers: ["せぼね"],
                explanation: "答えは『背骨』です。背骨は多くの骨がつながってできており、体の中心を支えています。"
            ),

            QuizQuestion.related(
                question: "【関連付け】簡易検流計の針の動きと、分かることを組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "針が右へ振れた", match: "ある向きに電流が流れた"),
                    QuizMatchingPair(prompt: "乾電池を逆向きにすると針が左へ振れた", match: "電流の向きが反対になった"),
                    QuizMatchingPair(prompt: "針の振れが前より大きくなった", match: "電流が前より強くなった"),
                    QuizMatchingPair(prompt: "針が中央から動かなかった", match: "電流が流れていない")
                ],
                choices: ["電流が前より強くなった", "電流が流れていない", "ある向きに電流が流れた", "電流の向きが反対になった"],
                explanation: "針が右へ振れたときは『ある向きに電流が流れた』、乾電池を逆向きにして左へ振れたときは『電流の向きが反対になった』と分かります。振れが大きいと『電流が前より強くなった』、動かないと『電流が流れていない』と判断できます。"
            ),

            QuizQuestion.related(
                question: "【関連付け】星が見える場所と、その後の見え方を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "東の空から昇った星", match: "時間がたつと空の高い方へ動く"),
                    QuizMatchingPair(prompt: "南の空で最も高い位置にある星", match: "その後、西の空へ動く"),
                    QuizMatchingPair(prompt: "西の空の低い位置にある星", match: "やがて地平線近くへ沈む"),
                    QuizMatchingPair(prompt: "北極星", match: "ほぼ同じ位置に見える")
                ],
                choices: ["ほぼ同じ位置に見える", "やがて地平線近くへ沈む", "時間がたつと空の高い方へ動く", "その後、西の空へ動く"],
                explanation: "東から昇った星は『時間がたつと空の高い方へ動く』、南の空で高く見える星は『その後、西の空へ動く』、西の低い星は『やがて地平線近くへ沈む』ように見えます。北極星は『ほぼ同じ位置に見える』星です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】空気や水を使ったときの様子と、その説明を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "空気入りのクッションを押す", match: "空気が押し縮められて押し返す"),
                    QuizMatchingPair(prompt: "水を満たして先をふさいだ注射器を押す", match: "ピストンがほとんど動かない"),
                    QuizMatchingPair(prompt: "へこんだふた付きボトルを温かい湯につける", match: "中の空気が広がってへこみが戻る"),
                    QuizMatchingPair(prompt: "ふた付きのやわらかいボトルを冷やす", match: "中の空気が縮んでボトルがへこむ")
                ],
                choices: ["中の空気が縮んでボトルがへこむ", "空気が押し縮められて押し返す", "中の空気が広がってへこみが戻る", "ピストンがほとんど動かない"],
                explanation: "空気入りのクッションでは『空気が押し縮められて押し返す』、水入りの注射器では『ピストンがほとんど動かない』様子が見られます。空気は温めると広がり、冷やすと縮むため、ふた付きボトルの形も変わります。"
            ),

            QuizQuestion.related(
                question: "【関連付け】植物の様子と、主に見られる季節を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ウメのつぼみが開いて花が咲く", match: "春"),
                    QuizMatchingPair(prompt: "アサガオのつるが伸びて花が咲く", match: "夏"),
                    QuizMatchingPair(prompt: "クリのいがが熟して実が落ちる", match: "秋"),
                    QuizMatchingPair(prompt: "落葉樹の枝に冬芽が見られる", match: "冬")
                ],
                choices: ["秋", "春", "冬", "夏"],
                explanation: "ウメの花は『春』、アサガオの花は『夏』、熟したクリの実は『秋』、落葉樹の冬芽は『冬』に主に見られます。"
            ),

            QuizQuestion.classification(
                question: "【分類】風が吹いてくる方角を表す名前に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "北から南へ吹く風", match: "北風"),
                    QuizMatchingPair(prompt: "南から北へ吹く風", match: "南風"),
                    QuizMatchingPair(prompt: "東から西へ吹く風", match: "東風"),
                    QuizMatchingPair(prompt: "西から東へ吹く風", match: "西風")
                ],
                categories: ["北風", "南風", "東風", "西風"],
                explanation: "風向は風が吹いてくる方角で表します。北から吹く風は『北風』、南からは『南風』、東からは『東風』、西からは『西風』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】水の姿がどのように変わったかで分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "皿の氷がとけて水になった", match: "固体から液体"),
                    QuizMatchingPair(prompt: "製氷皿の水が氷になった", match: "液体から固体"),
                    QuizMatchingPair(prompt: "ぬれた運動場が乾いた", match: "液体から気体"),
                    QuizMatchingPair(prompt: "浴室の鏡に水滴がついた", match: "気体から液体")
                ],
                categories: ["固体から液体", "液体から固体", "液体から気体", "気体から液体"],
                explanation: "氷が水になるのは『固体から液体』、水が氷になるのは『液体から固体』です。ぬれた運動場の水が蒸発するのは『液体から気体』、水蒸気が鏡で水滴になるのは『気体から液体』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】動かすときに中心となる関節で分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "うでを伸ばしたまま前から上へ上げる", match: "肩の関節"),
                    QuizMatchingPair(prompt: "前うでを曲げて手を肩へ近づける", match: "ひじの関節"),
                    QuizMatchingPair(prompt: "立ったまま、かかとをおしりへ近づける", match: "ひざの関節"),
                    QuizMatchingPair(prompt: "座ったまま、つま先を上下に動かす", match: "足首の関節")
                ],
                categories: ["肩の関節", "ひじの関節", "ひざの関節", "足首の関節"],
                explanation: "うで全体を上げるときは『肩の関節』、前うでを曲げるときは『ひじの関節』が中心になります。かかとをおしりへ近づけるときは『ひざの関節』、つま先を上下に動かすときは『足首の関節』が中心になります。"
            ),

            QuizQuestion.classification(
                question: "【分類】回路を変えたときに起こることを分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "乾電池の向きを反対にする", match: "電流の向きが変わる"),
                    QuizMatchingPair(prompt: "乾電池1個から2個の直列つなぎにする", match: "電流が強くなる"),
                    QuizMatchingPair(prompt: "スイッチを切る", match: "電流が流れない"),
                    QuizMatchingPair(prompt: "導線が端子から外れる", match: "電流が流れない")
                ],
                categories: ["電流の向きが変わる", "電流が強くなる", "電流が流れない"],
                explanation: "乾電池の向きを反対にすると『電流の向きが変わる』、乾電池を2個の直列つなぎにすると『電流が強くなる』と考えられます。スイッチを切ったり導線が外れたりすると『電流が流れない』状態になります。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】満月が夕方から明け方にかけて見える位置を、時間の早い順に並べましょう。",
                choices: [
                    "明け方ごろ、西の空の低い位置に見える",
                    "夕方ごろ、東の空から昇る",
                    "夜がふけるにつれて、西の空へ動く",
                    "真夜中ごろ、南の空の高い位置に見える"
                ],
                orderedChoices: [
                    "夕方ごろ、東の空から昇る",
                    "真夜中ごろ、南の空の高い位置に見える",
                    "夜がふけるにつれて、西の空へ動く",
                    "明け方ごろ、西の空の低い位置に見える"
                ],
                explanation: "満月は『夕方ごろ、東の空から昇る』『真夜中ごろ、南の空の高い位置に見える』『夜がふけるにつれて、西の空へ動く』『明け方ごろ、西の空の低い位置に見える』の順に見えます。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】びんの中の空気が場所を取っていることを確かめる実験を順番に並べましょう。",
                choices: [
                    "びんを水中でゆっくり傾ける",
                    "びんの中へ水が入りにくいことを確かめる",
                    "空の透明なびんを、口を下にしてまっすぐ水中へ沈める",
                    "泡が出て、その分だけ水がびんの中へ入ることを見る"
                ],
                orderedChoices: [
                    "空の透明なびんを、口を下にしてまっすぐ水中へ沈める",
                    "びんの中へ水が入りにくいことを確かめる",
                    "びんを水中でゆっくり傾ける",
                    "泡が出て、その分だけ水がびんの中へ入ることを見る"
                ],
                explanation: "『空の透明なびんを、口を下にしてまっすぐ水中へ沈める』『びんの中へ水が入りにくいことを確かめる』『びんを水中でゆっくり傾ける』『泡が出て、その分だけ水がびんの中へ入ることを見る』の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】同じ公園で見つけたセミの抜け殻の数を、多い順に並べましょう。",
                choices: [
                    "7月10日：8個",
                    "8月5日：21個",
                    "8月25日：14個",
                    "9月20日：3個"
                ],
                rankedChoices: [
                    "8月5日：21個",
                    "8月25日：14個",
                    "7月10日：8個",
                    "9月20日：3個"
                ],
                explanation: "多い順は『8月5日：21個』『8月25日：14個』『7月10日：8個』『9月20日：3個』です。この記録では、8月5日にセミの羽化が最も多かったと考えられます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】午前9時から正午までに降った雨の量が多い順に並べましょう。雨量計の数字は、その時刻までにたまった雨の量です。",
                choices: [
                    "地点A：2mmから14mm",
                    "地点B：5mmから13mm",
                    "地点C：0mmから15mm",
                    "地点D：7mmから12mm"
                ],
                rankedChoices: [
                    "地点C：0mmから15mm",
                    "地点A：2mmから14mm",
                    "地点B：5mmから13mm",
                    "地点D：7mmから12mm"
                ],
                explanation: "午前9時から正午までの雨量は、地点Cが15mm、地点Aが12mm、地点Bが8mm、地点Dが5mmです。したがって、地点C、地点A、地点B、地点Dの順です。"
            ),

        QuizQuestion(
                question: "春の池で、カエルが子孫を残す様子として見られるものはどれですか？",
                choices: [
                    "水の中に卵のかたまりがある",
                    "木の枝にさなぎが並んでいる",
                    "地面に木の実を埋めている",
                    "落ち葉の下で冬眠している"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『水の中に卵のかたまりがある』です。春になると、カエルは池などの水中に卵を産みます。"
            ),

            QuizQuestion(
                question: "温度計の目盛りを正しく読むとき、目はどの位置に置きますか？",
                choices: [
                    "温度計を下から見上げる位置",
                    "液柱の先と同じ高さの位置",
                    "温度計を上から見下ろす位置",
                    "液だめを手でにぎれる位置"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『液柱の先と同じ高さの位置』です。目盛りは、液柱の先と目の高さをそろえて正面から読みます。"
            ),

            QuizQuestion(
                question: "沸騰したやかんの口のすぐ近くで、何も見えない部分にあるものは主に何ですか？",
                choices: [
                    "細かな氷の粒",
                    "白いけむり",
                    "目に見えない水蒸気",
                    "やかんの中から出た空気だけ"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『目に見えない水蒸気』です。やかんの口のすぐ近くには水蒸気があり、少し離れて冷えると細かな水滴となって白く見えます。"
            ),

            QuizQuestion(
                question: "肩を中心に、うでを前後や左右へ動かせるのはなぜですか？",
                choices: [
                    "肩の骨が動くたびにやわらかくなるから",
                    "うでの骨が毎回短くなるから",
                    "肩の皮ふが骨を押しているから",
                    "肩に骨と骨をつなぐ関節があるから"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『肩に骨と骨をつなぐ関節があるから』です。肩の関節があるため、うでをいろいろな向きへ動かせます。"
            ),

            QuizQuestion(
                question: "乾電池2個を並列につないだ回路から片方の乾電池だけを外しました。残った1個が正しくつながっているとき、モーターはどうなりますか？",
                choices: [
                    "乾電池1個の回路として回り続ける",
                    "乾電池が2個ないので必ず反対向きに回る",
                    "モーターの中から新しい乾電池が出てくる",
                    "残った乾電池の向きに関係なく必ず止まる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『乾電池1個の回路として回り続ける』です。並列つなぎでは枝分かれしたそれぞれの乾電池が回路につながっているため、片方を外しても残りの1個で回路がつながっていればモーターは回ります。"
            ),

            QuizQuestion(
                question: "冬の大三角をつくる星の組み合わせはどれですか？",
                choices: [
                    "ベガ・アルタイル・デネブ",
                    "シリウス・プロキオン・ベテルギウス",
                    "北極星・カペラ・スピカ",
                    "アンタレス・アルデバラン・ポルックス"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『シリウス・プロキオン・ベテルギウス』です。この3つの明るい星を結ぶと、冬の大三角になります。"
            ),

            QuizQuestion(
                question: "同じ大きさの注射器に、同じ体積の空気と水をそれぞれ閉じ込め、同じ力でピストンを押しました。正しい結果はどれですか？",
                choices: [
                    "水のほうだけが大きく押し縮められる",
                    "空気も水も同じだけ大きく押し縮められる",
                    "空気は押し縮められるが、水はほとんど押し縮められない",
                    "空気も水も体積が必ず2倍になる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『空気は押し縮められるが、水はほとんど押し縮められない』です。閉じ込めた空気は体積が小さくなりますが、水の体積はほとんど変わりません。"
            ),

            QuizQuestion(
                question: "同じサクラの木を夏と冬に観察しました。季節による変化を正しく表しているものはどれですか？",
                choices: [
                    "夏も冬も花だけが咲き続ける",
                    "夏は葉がなく、冬は緑の葉がしげる",
                    "夏も冬も枝や葉の様子はまったく同じである",
                    "夏は葉がしげり、冬は葉が落ちて枝に冬芽が見られる"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『夏は葉がしげり、冬は葉が落ちて枝に冬芽が見られる』です。サクラの様子は季節によって大きく変化します。"
            ),

            QuizQuestion(
                question: "雨量計を置く場所として、最も適切なところはどれですか？",
                choices: [
                    "建物や木から離れた、平らで開けた場所",
                    "屋根から落ちる雨水が集まる場所",
                    "大きな木の枝の真下",
                    "かたむいた地面のくぼみ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『建物や木から離れた、平らで開けた場所』です。屋根や木の影響を受けない場所に置くと、降った雨の量を正しく測れます。"
            ),

            QuizQuestion(
                question: "試験管の水を凍らせる実験で、試験管の周りに氷と食塩を入れる主な目的はどれですか？",
                choices: [
                    "水の色を白く変えるため",
                    "氷だけのときより低い温度にするため",
                    "試験管の中へ食塩を入れるため",
                    "水の重さを増やすため"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『氷だけのときより低い温度にするため』です。氷に食塩を混ぜると温度がさらに下がり、試験管の水を凍らせやすくなります。"
            ),

            QuizQuestion(
                question: "口を開けたり閉じたりするとき、主に動く部分はどれですか？",
                choices: [
                    "頭がい骨全体が首から外れて動く",
                    "上あごだけが前後に大きく動く",
                    "下あごが、耳の近くにある関節を中心に動く",
                    "歯が一本ずつ関節の代わりに動く"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『下あごが、耳の近くにある関節を中心に動く』です。口の開け閉めでは、下あごがあごの関節を中心に動きます。"
            ),

            QuizQuestion(
                question: "乾電池1個と2個の直列つなぎで、モーターの回り方を公平に比べる方法はどれですか？",
                choices: [
                    "乾電池の数と同時にモーターも別の種類へ替える",
                    "一方だけ大きなプロペラを取り付ける",
                    "一方だけ長く使った乾電池を使う",
                    "同じモーターとプロペラを使い、乾電池のつなぎ方だけを変える"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『同じモーターとプロペラを使い、乾電池のつなぎ方だけを変える』です。調べたい条件以外を同じにすると、公平に比べられます。"
            ),

            QuizQuestion(
                question: "同じ夜に月を午後7時と午後9時に観察しました。一般に正しい記録はどれですか？",
                choices: [
                    "月の形はほぼ同じで、空での位置が変わる",
                    "月の位置は同じで、形だけが大きく変わる",
                    "月の形も位置も必ずまったく同じである",
                    "2時間で満月から三日月へ変わる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『月の形はほぼ同じで、空での位置が変わる』です。一晩の数時間では月の形はほとんど変わりませんが、見える位置は時間とともに変化します。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】秋にカエデなどの葉が赤や黄色に変わることを何といいますか。",
                answer: "紅葉",
                acceptableAnswers: ["こうよう"],
                explanation: "答えは『紅葉』です。秋になって気温が下がると、カエデなどの葉が赤や黄色に変わります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】風通しがよく、直射日光を避けて気温を測るための白い箱を何といいますか。",
                answer: "百葉箱",
                acceptableAnswers: ["ひゃくようばこ"],
                explanation: "答えは『百葉箱』です。百葉箱の中では、直射日光や雨の影響を避けて気温を測れます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】水を0℃近くまで冷やすと、水は固体の氷に変わります。この変化を日常の言葉で何といいますか。",
                answer: "凍る",
                acceptableAnswers: ["こおる"],
                explanation: "答えは『凍る』です。水を0℃近くまで冷やすと、固体の氷へ変わります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】体を支え、体の形を保つ、かたい部分を何といいますか。",
                answer: "骨",
                acceptableAnswers: ["ほね"],
                explanation: "答えは『骨』です。骨は体を支え、体の形を保つはたらきをします。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】冬の大三角をつくる星のうち、おおいぬ座の一等星の名前を答えましょう。",
                answer: "シリウス",
                acceptableAnswers: ["しりうす"],
                explanation: "答えは『シリウス』です。シリウスはおおいぬ座の一等星で、冬の大三角をつくる星の一つです。"
            ),

            QuizQuestion.related(
                question: "【関連付け】季節と、その季節に見られやすい生き物の様子を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "池でカエルの卵が見られる"),
                    QuizMatchingPair(prompt: "夏", match: "木でセミの鳴き声が聞こえる"),
                    QuizMatchingPair(prompt: "秋", match: "草むらでコオロギの鳴き声が聞こえる"),
                    QuizMatchingPair(prompt: "冬", match: "落葉樹の枝に冬芽が見られる")
                ],
                choices: ["草むらでコオロギの鳴き声が聞こえる", "落葉樹の枝に冬芽が見られる", "池でカエルの卵が見られる", "木でセミの鳴き声が聞こえる"],
                explanation: "春は『池でカエルの卵が見られる』、夏は『木でセミの鳴き声が聞こえる』、秋は『草むらでコオロギの鳴き声が聞こえる』、冬は『落葉樹の枝に冬芽が見られる』様子が代表的です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】水の変化と、その変化の名前を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "水が氷になる", match: "凝固"),
                    QuizMatchingPair(prompt: "氷が水になる", match: "融解"),
                    QuizMatchingPair(prompt: "水が水蒸気になる", match: "蒸発"),
                    QuizMatchingPair(prompt: "水蒸気が水になる", match: "凝結")
                ],
                choices: ["蒸発", "凝結", "凝固", "融解"],
                explanation: "水が氷になる変化は『凝固』、氷が水になる変化は『融解』、水が水蒸気になる変化は『蒸発』、水蒸気が水になる変化は『凝結』です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】モーターが回らない原因と、適切な確かめ方や直し方を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "スイッチが切れている", match: "スイッチを入れる"),
                    QuizMatchingPair(prompt: "導線の被覆部分が端子に触れている", match: "金属部分を端子に触れさせる"),
                    QuizMatchingPair(prompt: "乾電池を使い切っている", match: "新しい乾電池に替える"),
                    QuizMatchingPair(prompt: "プロペラが台に触れている", match: "プロペラが自由に回るようにする")
                ],
                choices: ["新しい乾電池に替える", "プロペラが自由に回るようにする", "スイッチを入れる", "金属部分を端子に触れさせる"],
                explanation: "スイッチが切れているときは『スイッチを入れる』、導線の被覆部分が触れているときは『金属部分を端子に触れさせる』、乾電池を使い切っているときは『新しい乾電池に替える』、プロペラが台に触れているときは『プロペラが自由に回るようにする』のが適切です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】冬の夜空で見つけられる星と、その星座を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "シリウス", match: "おおいぬ座"),
                    QuizMatchingPair(prompt: "プロキオン", match: "こいぬ座"),
                    QuizMatchingPair(prompt: "リゲル", match: "オリオン座"),
                    QuizMatchingPair(prompt: "アルデバラン", match: "おうし座")
                ],
                choices: ["オリオン座", "おうし座", "おおいぬ座", "こいぬ座"],
                explanation: "シリウスは『おおいぬ座』、プロキオンは『こいぬ座』、リゲルは『オリオン座』、アルデバランは『おうし座』にある星です。"
            ),

            QuizQuestion.classification(
                question: "【分類】天気の観察記録を、『天気』『気温』『風』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "雲量7", match: "天気"),
                    QuizMatchingPair(prompt: "午前9時は18℃", match: "気温"),
                    QuizMatchingPair(prompt: "北西の風", match: "風"),
                    QuizMatchingPair(prompt: "午後2時は24℃", match: "気温")
                ],
                categories: ["天気", "気温", "風"],
                explanation: "『雲量7』は天気、『午前9時は18℃』『午後2時は24℃』は気温、『北西の風』は風の記録です。"
            ),

            QuizQuestion.classification(
                question: "【分類】骨、関節、筋肉のはたらきを、正しい仲間に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "体を支えて形を保つ", match: "骨のはたらき"),
                    QuizMatchingPair(prompt: "大切な部分を囲んで守る", match: "骨のはたらき"),
                    QuizMatchingPair(prompt: "骨と骨のつなぎ目で曲げ伸ばしを可能にする", match: "関節のはたらき"),
                    QuizMatchingPair(prompt: "縮んで骨を引く", match: "筋肉のはたらき")
                ],
                categories: ["骨のはたらき", "関節のはたらき", "筋肉のはたらき"],
                explanation: "『体を支えて形を保つ』『大切な部分を囲んで守る』は骨のはたらき、『骨と骨のつなぎ目で曲げ伸ばしを可能にする』は関節のはたらき、『縮んで骨を引く』は筋肉のはたらきです。"
            ),

            QuizQuestion.classification(
                question: "【分類】空気と水の性質を、『空気だけ』『水だけ』『空気と水の両方』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "押すと体積がかなり小さくなる", match: "空気だけ"),
                    QuizMatchingPair(prompt: "静かに置くと表面が水平になる", match: "水だけ"),
                    QuizMatchingPair(prompt: "入れ物の中で場所を占める", match: "空気と水の両方"),
                    QuizMatchingPair(prompt: "決まった形をもたない", match: "空気と水の両方")
                ],
                categories: ["空気だけ", "水だけ", "空気と水の両方"],
                explanation: "『押すと体積がかなり小さくなる』のは空気だけ、『静かに置くと表面が水平になる』のは水だけです。『入れ物の中で場所を占める』『決まった形をもたない』は空気と水の両方に当てはまります。"
            ),

            QuizQuestion.classification(
                question: "【分類】空気や水を温めたり冷やしたりしたときの変化を、『温めたとき』『冷やしたとき』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "びんの口につけた風船がふくらむ", match: "温めたとき"),
                    QuizMatchingPair(prompt: "細い管の中の水面が少し上がる", match: "温めたとき"),
                    QuizMatchingPair(prompt: "びんの口につけた風船がしぼむ", match: "冷やしたとき"),
                    QuizMatchingPair(prompt: "細い管の中の水面が少し下がる", match: "冷やしたとき")
                ],
                categories: ["温めたとき", "冷やしたとき"],
                explanation: "空気や水は温めると体積が大きくなるため、風船がふくらんだり水面が上がったりします。冷やすと体積が小さくなるため、風船がしぼんだり水面が下がったりします。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】乾電池の数によるモーターの回り方を比べる実験手順を順番に並べましょう。",
                choices: [
                    "乾電池2個を直列につなぎ、同じ方法で回り方を記録する",
                    "同じモーターとプロペラを用意する",
                    "二つの記録を比べる",
                    "乾電池1個をつなぎ、回り方を記録する"
                ],
                orderedChoices: [
                    "同じモーターとプロペラを用意する",
                    "乾電池1個をつなぎ、回り方を記録する",
                    "乾電池2個を直列につなぎ、同じ方法で回り方を記録する",
                    "二つの記録を比べる"
                ],
                explanation: "『同じモーターとプロペラを用意する』『乾電池1個をつなぎ、回り方を記録する』『乾電池2個を直列につなぎ、同じ方法で回り方を記録する』『二つの記録を比べる』の順です。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】春から冬までのカエルの様子を順番に並べましょう。",
                choices: [
                    "寒くなり、土や落ち葉の下で活動を減らす",
                    "オタマジャクシに足が出て、小さなカエルになる",
                    "池の水中に卵が産みつけられる",
                    "卵からかえったオタマジャクシが泳ぐ"
                ],
                orderedChoices: [
                    "池の水中に卵が産みつけられる",
                    "卵からかえったオタマジャクシが泳ぐ",
                    "オタマジャクシに足が出て、小さなカエルになる",
                    "寒くなり、土や落ち葉の下で活動を減らす"
                ],
                explanation: "『池の水中に卵が産みつけられる』『卵からかえったオタマジャクシが泳ぐ』『オタマジャクシに足が出て、小さなカエルになる』『寒くなり、土や落ち葉の下で活動を減らす』の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】午前8時から午後2時までに気温が上がった大きさが、大きい順に並べましょう。",
                choices: [
                    "月曜日：13℃から22℃",
                    "火曜日：16℃から20℃",
                    "水曜日：11℃から23℃",
                    "木曜日：15℃から21℃"
                ],
                rankedChoices: [
                    "水曜日：11℃から23℃",
                    "月曜日：13℃から22℃",
                    "木曜日：15℃から21℃",
                    "火曜日：16℃から20℃"
                ],
                explanation: "上がった大きさは、水曜日が12℃、月曜日が9℃、木曜日が6℃、火曜日が4℃です。したがって、水曜日、月曜日、木曜日、火曜日の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】同じ量の空気を入れた同じ風船について、実験で測った体積が大きい順に並べましょう。",
                choices: [
                    "5℃の場所：44mL",
                    "20℃の場所：50mL",
                    "35℃の場所：57mL",
                    "50℃の場所：64mL"
                ],
                rankedChoices: [
                    "50℃の場所：64mL",
                    "35℃の場所：57mL",
                    "20℃の場所：50mL",
                    "5℃の場所：44mL"
                ],
                explanation: "体積が大きい順は『50℃の場所：64mL』『35℃の場所：57mL』『20℃の場所：50mL』『5℃の場所：44mL』です。この実験結果から、空気は温度が高いほど体積が大きくなっていることが分かります。"
            ),

        QuizQuestion(
                question: "春の暖かい日に、アブラナの花の周りでチョウがよく見られる理由として、最も適切なものはどれですか？",
                choices: [
                    "花の蜜を吸うため",
                    "氷の下で眠るため",
                    "土の中でさなぎになるため",
                    "木の実を土に埋めるため"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『花の蜜を吸うため』です。春に花が咲き、気温も高くなると、チョウは花の蜜を求めて活発に飛ぶようになります。"
            ),

            QuizQuestion(
                question: "西の空に黒っぽい雲が増え、その雲が東へ動いていました。この後の天気の予想として、最も適切なものはどれですか？",
                choices: [
                    "雲が消えて必ず晴れ続ける",
                    "雨が降るなど天気がくずれる可能性がある",
                    "気温が必ず0℃より低くなる",
                    "風が完全に止まり、雲も動かなくなる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『雨が降るなど天気がくずれる可能性がある』です。黒っぽい雲が近づいているときは、雲の動く向きから、その後の天気を予想できます。"
            ),

            QuizQuestion(
                question: "ふたをした容器の中で100gの水をすべて氷にしました。容器から何も出入りしていないとき、氷の重さはどうなりますか？",
                choices: [
                    "約50gになる",
                    "約80gになる",
                    "約100gのままである",
                    "約200gになる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『約100gのままである』です。水が氷に変わっても、外へ出たり中へ入ったりするものがなければ、重さは変わりません。"
            ),

            QuizQuestion(
                question: "筋肉が骨を動かすときのはたらきとして、正しいものはどれですか？",
                choices: [
                    "筋肉が骨をとかして短くする",
                    "筋肉がふくらんで骨を押し続ける",
                    "筋肉が骨から離れて骨を回す",
                    "筋肉が縮んで骨を引く"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『筋肉が縮んで骨を引く』です。筋肉は縮むことで骨を引き、関節を中心に骨を動かします。"
            ),

            QuizQuestion(
                question: "乾電池の向きは変えず、モーターにつないだ2本の導線を入れ替えました。モーターの回り方はどうなりますか？",
                choices: [
                    "反対向きに回る",
                    "必ず同じ向きに速く回る",
                    "回転する向きは変わらず、音だけ消える",
                    "乾電池を増やさなくても回転が2倍速くなる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『反対向きに回る』です。モーターにつなぐ導線を入れ替えると、モーターを流れる電流の向きが反対になります。"
            ),

            QuizQuestion(
                question: "オリオン座を見つける手がかりになる並び方はどれですか？",
                choices: [
                    "明るい星が五角形に並ぶ",
                    "中央付近に3つの星がほぼ一直線に並ぶ",
                    "7つの星がひしゃくの形に並ぶ",
                    "5つの星がWの形に並ぶ"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『中央付近に3つの星がほぼ一直線に並ぶ』です。オリオン座は、中央に並ぶ3つの星を手がかりに見つけられます。"
            ),

            QuizQuestion(
                question: "乾いたティッシュを底に入れたコップを逆さにし、まっすぐ水中へ沈めました。ティッシュがぬれにくい理由はどれですか？",
                choices: [
                    "ティッシュが水をはね返す物質に変わるから",
                    "コップの中の水がすべて氷になるから",
                    "コップの中の空気が場所を取り、水が入りにくいから",
                    "水中ではティッシュが水を吸わなくなるから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『コップの中の空気が場所を取り、水が入りにくいから』です。空気にも体積があり、コップの中の場所を占めています。"
            ),

            QuizQuestion(
                question: "秋が深まると、草むらで見られるバッタの数が少なくなる主な理由はどれですか？",
                choices: [
                    "バッタがすべて魚に変わるから",
                    "草むらが海水で満たされるから",
                    "日が短くなると植物が石になるから",
                    "気温が下がり、えさになる植物も少なくなるから"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『気温が下がり、えさになる植物も少なくなるから』です。秋が深まると気温が下がり、昆虫の活動やえさとなる植物が少なくなります。"
            ),

            QuizQuestion(
                question: "天気予報で『北の風』といったとき、風はどちらから吹いてきますか？",
                choices: [
                    "北から",
                    "東から",
                    "南から",
                    "西から"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『北から』です。風向は、風が吹いてくる方角で表します。"
            ),

            QuizQuestion(
                question: "少量の水を入れて口を閉じた透明な袋を日なたに置くと、しばらくして袋の内側に水滴がつきました。水滴ができた理由はどれですか？",
                choices: [
                    "袋の材料が水に変わったから",
                    "蒸発した水が水蒸気になり、冷えて再び水になったから",
                    "外の雨が袋を通り抜けたから",
                    "袋の中の空気がすべて氷になったから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『蒸発した水が水蒸気になり、冷えて再び水になったから』です。袋の中で水が蒸発し、その水蒸気が冷えた部分で水滴に戻りました。"
            ),

            QuizQuestion(
                question: "背中を前後や左右に曲げられる主な理由はどれですか？",
                choices: [
                    "背骨が1本のやわらかい骨だから",
                    "背骨の中に空気だけが入っているから",
                    "多くの骨が関節でつながっているから",
                    "背骨が動くたびに短くなるから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『多くの骨が関節でつながっているから』です。背骨は多くの骨がつながってできているため、少しずつ動いて体を曲げられます。"
            ),

            QuizQuestion(
                question: "2個のモーターをそれぞれ別のスイッチで動かし、一方を止めてももう一方が回るようにするには、どの回路が適切ですか？",
                choices: [
                    "2個のモーターを1本の導線だけにつなぐ回路",
                    "乾電池を使わず、モーターだけを輪につなぐ回路",
                    "2個のモーターを一列に並べ、共通のスイッチを1個だけつけた回路",
                    "モーターごとに枝分かれさせ、それぞれの枝にスイッチをつけた回路"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『モーターごとに枝分かれさせ、それぞれの枝にスイッチをつけた回路』です。枝分かれした回路なら、それぞれのモーターを別々に動かせます。"
            ),

            QuizQuestion(
                question: "星座早見を使って南の空の星座を探す方法として、正しいものはどれですか？",
                choices: [
                    "日付と時刻を合わせ、南の表示を下にして頭の上にかざす",
                    "日付だけを合わせ、北の表示を必ず下にする",
                    "時刻を合わせず、机の上に置いたまま見る",
                    "星座早見を裏返し、地面へ向けて見る"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『日付と時刻を合わせ、南の表示を下にして頭の上にかざす』です。観察する方角の表示を下にして空と見比べます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】生き物が卵、さなぎ、成体などの姿で寒い季節を過ごすことを ＿＿ といいます。",
                answer: "冬越し",
                acceptableAnswers: ["冬ごし", "ふゆごし"],
                explanation: "＿＿に入る言葉は『冬越し』です。生き物によって、冬を過ごす姿や場所は異なります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】風の強さを数字などで表したものを何といいますか。",
                answer: "風力",
                acceptableAnswers: ["ふうりょく"],
                explanation: "答えは『風力』です。風力は、風の強さを表します。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】空気中の水蒸気が冷たい物の表面で水滴になることを何といいますか。",
                answer: "結露",
                acceptableAnswers: ["けつろ"],
                explanation: "答えは『結露』です。空気中の水蒸気が冷やされると、水滴になります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】うでの筋肉が縮むと、縮む前より短くなり、同時に ＿＿ なります。",
                answer: "太く",
                acceptableAnswers: ["ふとく", "太くなる", "ふとくなる"],
                explanation: "＿＿に入る言葉は『太く』です。筋肉は縮むと短くなり、太くなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】水中で空のように見えるびんを傾けると泡が出ました。びんの中に入っていたものは ＿＿ です。",
                answer: "空気",
                acceptableAnswers: ["くうき"],
                explanation: "＿＿に入る言葉は『空気』です。びんの中の空気が水中へ出ると、泡として見えます。"
            ),

            QuizQuestion.related(
                question: "【関連付け】生き物と、冬を過ごすことが多い姿や場所を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "カマキリ", match: "卵"),
                    QuizMatchingPair(prompt: "アゲハ", match: "さなぎ"),
                    QuizMatchingPair(prompt: "カブトムシ", match: "土の中の幼虫"),
                    QuizMatchingPair(prompt: "アマガエル", match: "土や落ち葉の下に隠れた成体")
                ],
                choices: ["さなぎ", "土や落ち葉の下に隠れた成体", "卵", "土の中の幼虫"],
                explanation: "カマキリは『卵』、アゲハは『さなぎ』、カブトムシは『土の中の幼虫』、アマガエルは『土や落ち葉の下に隠れた成体』で冬を過ごすことが多いです。"
            ),

            QuizQuestion.related(
                question: "【関連付け】体を動かしたときの観察場所と、分かることを組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "うでを曲げたときの上うでの内側", match: "筋肉が縮んで太くなる"),
                    QuizMatchingPair(prompt: "うでを伸ばしたときの上うでの内側", match: "筋肉がゆるんで細くなる"),
                    QuizMatchingPair(prompt: "ひざを曲げたときのひざの部分", match: "関節を中心に曲がる"),
                    QuizMatchingPair(prompt: "頭を左右に向けたときの首", match: "首の関節で向きが変わる")
                ],
                choices: ["首の関節で向きが変わる", "筋肉がゆるんで細くなる", "関節を中心に曲がる", "筋肉が縮んで太くなる"],
                explanation: "うでを曲げると上うでの内側の筋肉は『筋肉が縮んで太くなる』、伸ばすと『筋肉がゆるんで細くなる』と分かります。ひざは『関節を中心に曲がる』、首は『首の関節で向きが変わる』ことも観察できます。"
            ),

            QuizQuestion.related(
                question: "【関連付け】星の並びと、見つける手がかりを組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "カシオペヤ座", match: "5つの星がWの形に並ぶ"),
                    QuizMatchingPair(prompt: "北斗七星", match: "7つの星がひしゃくの形に並ぶ"),
                    QuizMatchingPair(prompt: "オリオン座", match: "中央に3つの星がほぼ一直線に並ぶ"),
                    QuizMatchingPair(prompt: "夏の大三角", match: "3つの明るい星が大きな三角形をつくる")
                ],
                choices: ["3つの明るい星が大きな三角形をつくる", "中央に3つの星がほぼ一直線に並ぶ", "5つの星がWの形に並ぶ", "7つの星がひしゃくの形に並ぶ"],
                explanation: "カシオペヤ座は『5つの星がWの形に並ぶ』、北斗七星は『7つの星がひしゃくの形に並ぶ』、オリオン座は『中央に3つの星がほぼ一直線に並ぶ』、夏の大三角は『3つの明るい星が大きな三角形をつくる』ことが手がかりです。"
            ),

            QuizQuestion.related(
                question: "【関連付け】空気や水の性質を調べる実験道具と、その主な目的を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "底に乾いたティッシュを入れたコップ", match: "水がコップの中へ入ったか確かめる"),
                    QuizMatchingPair(prompt: "先をふさいだ針のない注射器", match: "空気や水を閉じ込める"),
                    QuizMatchingPair(prompt: "同じ大きさで同じ目盛りの注射器", match: "押したときの体積の変化を比べる"),
                    QuizMatchingPair(prompt: "水を満たして2本の注射器をつなぐ管", match: "加えた力が水を通して伝わるか調べる")
                ],
                choices: ["空気や水を閉じ込める", "加えた力が水を通して伝わるか調べる", "水がコップの中へ入ったか確かめる", "押したときの体積の変化を比べる"],
                explanation: "乾いたティッシュは『水がコップの中へ入ったか確かめる』、先をふさいだ注射器は『空気や水を閉じ込める』、同じ注射器は『押したときの体積の変化を比べる』、水を満たした管は『加えた力が水を通して伝わるか調べる』ために使います。"
            ),

            QuizQuestion.classification(
                question: "【分類】雲量を、『晴れ（雲量0〜8）』『くもり（雲量9〜10）』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "雲量1", match: "晴れ（雲量0〜8）"),
                    QuizMatchingPair(prompt: "雲量8", match: "晴れ（雲量0〜8）"),
                    QuizMatchingPair(prompt: "雲量9", match: "くもり（雲量9〜10）"),
                    QuizMatchingPair(prompt: "雲量10", match: "くもり（雲量9〜10）")
                ],
                categories: ["晴れ（雲量0〜8）", "くもり（雲量9〜10）"],
                explanation: "雲量1と雲量8は『晴れ（雲量0〜8）』、雲量9と雲量10は『くもり（雲量9〜10）』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】水の姿を、『固体』『液体』『気体』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "製氷皿の氷", match: "固体"),
                    QuizMatchingPair(prompt: "コップに入った水", match: "液体"),
                    QuizMatchingPair(prompt: "冷たい窓についた水滴", match: "液体"),
                    QuizMatchingPair(prompt: "空気中の目に見えない水蒸気", match: "気体")
                ],
                categories: ["固体", "液体", "気体"],
                explanation: "『製氷皿の氷』は固体、『コップに入った水』『冷たい窓についた水滴』は液体、『空気中の目に見えない水蒸気』は気体です。"
            ),

            QuizQuestion.classification(
                question: "【分類】モーターを使う回路の変え方を、『回る向きが変わる』『回る速さが変わる』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "乾電池の向きを反対にする", match: "回る向きが変わる"),
                    QuizMatchingPair(prompt: "モーターにつなぐ2本の導線を入れ替える", match: "回る向きが変わる"),
                    QuizMatchingPair(prompt: "乾電池1個から2個の直列つなぎにする", match: "回る速さが変わる"),
                    QuizMatchingPair(prompt: "乾電池2個の直列つなぎから1個にする", match: "回る速さが変わる")
                ],
                categories: ["回る向きが変わる", "回る速さが変わる"],
                explanation: "乾電池の向きを反対にしたり、モーターの導線を入れ替えたりすると『回る向きが変わる』ことがあります。乾電池の直列つなぎの個数を変えると『回る速さが変わる』ことがあります。"
            ),

            QuizQuestion.classification(
                question: "【分類】観察結果を、『空気が場所を取ることが分かる』『水が入れ物に合わせて形を変えることが分かる』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "逆さにしたコップをまっすぐ水へ沈めると、中へ水が入りにくい", match: "空気が場所を取ることが分かる"),
                    QuizMatchingPair(prompt: "水中のびんを傾けると、びんの中から泡が出る", match: "空気が場所を取ることが分かる"),
                    QuizMatchingPair(prompt: "細長い容器に入れた水は細長い形になる", match: "水が入れ物に合わせて形を変えることが分かる"),
                    QuizMatchingPair(prompt: "同じ水を広い皿へ移すと、薄く広がる", match: "水が入れ物に合わせて形を変えることが分かる")
                ],
                categories: ["空気が場所を取ることが分かる", "水が入れ物に合わせて形を変えることが分かる"],
                explanation: "逆さのコップや水中のびんの観察から『空気が場所を取ることが分かる』といえます。容器を替えた水の形から『水が入れ物に合わせて形を変えることが分かる』といえます。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】サクラの一年の変化を、冬から始めて順番に並べましょう。",
                choices: [
                    "葉がしげり、枝がのびる",
                    "葉が色づいて落ちる",
                    "冬芽が枝についている",
                    "冬芽が開き、花や葉が出る"
                ],
                orderedChoices: [
                    "冬芽が枝についている",
                    "冬芽が開き、花や葉が出る",
                    "葉がしげり、枝がのびる",
                    "葉が色づいて落ちる"
                ],
                explanation: "『冬芽が枝についている』『冬芽が開き、花や葉が出る』『葉がしげり、枝がのびる』『葉が色づいて落ちる』の順です。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】逆さにしたコップの中に空気があることを確かめる実験手順を並べましょう。",
                choices: [
                    "コップを水からまっすぐ引き上げ、ティッシュを確かめる",
                    "乾いたティッシュをコップの底に入れる",
                    "コップを逆さにする",
                    "コップを傾けずに水中へまっすぐ沈める"
                ],
                orderedChoices: [
                    "乾いたティッシュをコップの底に入れる",
                    "コップを逆さにする",
                    "コップを傾けずに水中へまっすぐ沈める",
                    "コップを水からまっすぐ引き上げ、ティッシュを確かめる"
                ],
                explanation: "『乾いたティッシュをコップの底に入れる』『コップを逆さにする』『コップを傾けずに水中へまっすぐ沈める』『コップを水からまっすぐ引き上げ、ティッシュを確かめる』の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】同じ簡易検流計で測ったとき、電流が強い順に並べましょう。",
                choices: [
                    "回路A：針が7目盛り振れた",
                    "回路B：針が3目盛り振れた",
                    "回路C：針が5目盛り振れた",
                    "回路D：針が1目盛り振れた"
                ],
                rankedChoices: [
                    "回路A：針が7目盛り振れた",
                    "回路C：針が5目盛り振れた",
                    "回路B：針が3目盛り振れた",
                    "回路D：針が1目盛り振れた"
                ],
                explanation: "電流が強い順は『回路A：針が7目盛り振れた』『回路C：針が5目盛り振れた』『回路B：針が3目盛り振れた』『回路D：針が1目盛り振れた』です。簡易検流計は、針の振れが大きいほど強い電流が流れています。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】同じ時刻に測った星の地平線からの高さを、高い順に並べましょう。",
                choices: [
                    "ベガ：高さ62度",
                    "アルタイル：高さ47度",
                    "デネブ：高さ54度",
                    "アンタレス：高さ25度"
                ],
                rankedChoices: [
                    "ベガ：高さ62度",
                    "デネブ：高さ54度",
                    "アルタイル：高さ47度",
                    "アンタレス：高さ25度"
                ],
                explanation: "高さが高い順は『ベガ：高さ62度』『デネブ：高さ54度』『アルタイル：高さ47度』『アンタレス：高さ25度』です。"
            ),

        QuizQuestion(
                question: "冬のサクラの芽を包む、かたい部分にはどのような役割がありますか？",
                choices: [
                    "寒さや乾燥から芽を守る",
                    "根から水を吸い上げる",
                    "花粉を運ぶ虫を集める",
                    "葉でつくった養分をたくわえる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『寒さや乾燥から芽を守る』です。冬芽を包むかたい部分は、中の芽を寒さや乾燥から守ります。"
            ),

            QuizQuestion(
                question: "ある日の気温は、午前9時が14℃、正午が19℃、午後3時が17℃でした。正午から午後3時までに気温はどう変化しましたか？",
                choices: [
                    "3℃上がった",
                    "2℃下がった",
                    "変わらなかった",
                    "5℃下がった"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『2℃下がった』です。19℃から17℃になったので、気温は2℃下がりました。"
            ),

            QuizQuestion(
                question: "晴れた日に水たまりの水が少しずつなくなりました。なくなった水は主に何になりましたか？",
                choices: [
                    "酸素",
                    "氷",
                    "目に見えない水蒸気",
                    "土の中の石"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『目に見えない水蒸気』です。水たまりの水は蒸発し、目に見えない水蒸気になって空気中へ出ていきます。"
            ),

            QuizQuestion(
                question: "頭がい骨が主に守っているものはどれですか？",
                choices: [
                    "胃",
                    "心臓",
                    "肺",
                    "脳"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『脳』です。頭がい骨は、外からの力を受けやすい脳を囲んで守っています。"
            ),

            QuizQuestion(
                question: "簡易検流計をつないだ回路で、乾電池の向きだけを反対にしました。針の振れ方はどうなりますか？",
                choices: [
                    "反対向きに振れる",
                    "必ず同じ向きに大きく振れる",
                    "針が外れて落ちる",
                    "目盛りの中央で動かなくなる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『反対向きに振れる』です。乾電池の向きを反対にすると電流の向きが変わるため、簡易検流計の針も反対向きに振れます。"
            ),

            QuizQuestion(
                question: "月を同じ時刻に何日か続けて観察したとき、一般に見られる変化はどれですか？",
                choices: [
                    "毎日まったく同じ形と位置に見える",
                    "形や見える位置が少しずつ変わる",
                    "一日ごとに大きさが2倍になる",
                    "数日で自分から光らなくなる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『形や見える位置が少しずつ変わる』です。月は日がたつにつれて、見える形や空での位置が少しずつ変化します。"
            ),

            QuizQuestion(
                question: "暖房で温められた空気は、部屋の中で主にどちらへ動きますか？",
                choices: [
                    "床の下へ動く",
                    "横だけに動く",
                    "上の方へ動く",
                    "その場からまったく動かない"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『上の方へ動く』です。温められた空気は軽くなり、部屋の上の方へ動きます。"
            ),

            QuizQuestion(
                question: "秋になると、日本で多くのツバメが見られなくなる主な理由はどれですか？",
                choices: [
                    "水の中で冬を過ごすから",
                    "木の中でさなぎになるから",
                    "羽がすべて抜けて飛べなくなるから",
                    "より暖かい地域へ移動するから"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『より暖かい地域へ移動するから』です。多くのツバメは秋になると、えさを得やすい暖かい地域へ移動します。"
            ),

            QuizQuestion(
                question: "ある晴れた日の気温は、午前6時11℃、午前9時15℃、正午21℃、午後3時20℃、午後6時16℃でした。気温が最も大きく上がった時間帯はどれですか？",
                choices: [
                    "午前9時から正午",
                    "午前6時から午前9時",
                    "正午から午後3時",
                    "午後3時から午後6時"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『午前9時から正午』です。この時間帯は15℃から21℃になり、6℃上がっています。"
            ),

            QuizQuestion(
                question: "同じ量の水を入れた二つのコップを同じ場所に置き、一方だけにふたをしました。数日後、ふたをしたコップに水が多く残ったのはなぜですか？",
                choices: [
                    "ふたが水を新しくつくったから",
                    "水蒸気が外へ出にくくなったから",
                    "ふたをすると水が氷になったから",
                    "ふたが水を重くしたから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『水蒸気が外へ出にくくなったから』です。ふたをすると、蒸発した水蒸気が外へ逃げにくくなり、水の減り方が小さくなります。"
            ),

            QuizQuestion(
                question: "ろっ骨が主に守っている体の部分はどれですか？",
                choices: [
                    "目と耳",
                    "胃と小腸だけ",
                    "心臓と肺",
                    "手首と足首"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『心臓と肺』です。ろっ骨は胸の部分を囲み、心臓や肺などの大切な器官を守っています。"
            ),

            QuizQuestion(
                question: "同じモーターを使い、乾電池1個の回路と、同じ向きの乾電池2個を直列につないだ回路を比べました。2個の回路で簡易検流計の針の振れが大きくなりました。この結果から分かることはどれですか？",
                choices: [
                    "2個の回路では電流の向きが毎回変わる",
                    "1個の回路には電流が流れていない",
                    "2個の回路ではモーターがこわれている",
                    "2個の直列つなぎの方が流れる電流が強い"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『2個の直列つなぎの方が流れる電流が強い』です。簡易検流計の針の振れが大きいほど、流れている電流が強いことを表します。"
            ),

            QuizQuestion(
                question: "月と近くの星を、観察できる日に同じ時刻で何日か比べました。星を目印にすると、月は一般にどちらへ移って見えますか？",
                choices: [
                    "少しずつ東側へ移って見える",
                    "毎日必ず同じ位置に見える",
                    "少しずつ西側へ移って見える",
                    "東西に交互に移って見える"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『少しずつ東側へ移って見える』です。同じ時刻に近くの星と比べると、月は日ごとに少しずつ東側へ位置を変えます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】春から夏にかけて気温が高くなると、多くの昆虫の活動は一般に ＿＿ 。",
                answer: "活発になる",
                acceptableAnswers: ["かっぱつになる", "さかんになる"],
                explanation: "＿＿に入る言葉は『活発になる』です。気温が高くなる季節には、多くの昆虫の活動が活発になります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】空全体を10としたとき、雲が空をおおっている割合を何といいますか。",
                answer: "雲量",
                acceptableAnswers: ["うんりょう"],
                explanation: "答えは『雲量』です。雲量は、空全体のうち雲がおおっている割合を表します。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】沸騰していない水でも、水面から水が水蒸気に変わる現象を何といいますか。",
                answer: "蒸発",
                acceptableAnswers: ["じょうはつ"],
                explanation: "答えは『蒸発』です。水は沸騰していなくても、水面から水蒸気へ変わります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】体全体の骨の組み合わせを何といいますか。",
                answer: "骨格",
                acceptableAnswers: ["こっかく"],
                explanation: "答えは『骨格』です。骨格は体を支え、体の形を保つはたらきをします。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】回路を流れる電流の向きや強さを調べる器具を何といいますか。",
                answer: "簡易検流計",
                acceptableAnswers: ["検流計", "かんいけんりゅうけい"],
                explanation: "答えは『簡易検流計』です。針の振れる向きや大きさから、電流の向きや強さを調べられます。"
            ),

            QuizQuestion.related(
                question: "【関連付け】季節と生き物の観察で記録することと、その記録から分かりやすくなることを組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "観察した日付", match: "季節の移り変わりと結び付ける"),
                    QuizMatchingPair(prompt: "その日の気温", match: "生き物の活動と暖かさの関係を考える"),
                    QuizMatchingPair(prompt: "見つけた生き物の数", match: "活動の多さを比べる"),
                    QuizMatchingPair(prompt: "同じ場所から撮った写真", match: "姿や周囲の様子の変化を比べる")
                ],
                choices: ["活動の多さを比べる", "姿や周囲の様子の変化を比べる", "季節の移り変わりと結び付ける", "生き物の活動と暖かさの関係を考える"],
                explanation: "日付は『季節の移り変わりと結び付ける』、気温は『生き物の活動と暖かさの関係を考える』、生き物の数は『活動の多さを比べる』、同じ場所から撮った写真は『姿や周囲の様子の変化を比べる』ために役立ちます。"
            ),

            QuizQuestion.related(
                question: "【関連付け】天気の観測項目と、調べ方や道具を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "気温", match: "日かげに置いた温度計で測る"),
                    QuizMatchingPair(prompt: "風向", match: "風向計で調べる"),
                    QuizMatchingPair(prompt: "雨量", match: "雨量計で測る"),
                    QuizMatchingPair(prompt: "雲量", match: "空全体を見て雲の割合を調べる")
                ],
                choices: ["雨量計で測る", "空全体を見て雲の割合を調べる", "日かげに置いた温度計で測る", "風向計で調べる"],
                explanation: "気温は『日かげに置いた温度計で測る』、風向は『風向計で調べる』、雨量は『雨量計で測る』、雲量は『空全体を見て雲の割合を調べる』のが適切です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】骨と、その主なはたらきを組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "頭がい骨", match: "脳を囲んで守る"),
                    QuizMatchingPair(prompt: "ろっ骨", match: "心臓や肺を囲んで守る"),
                    QuizMatchingPair(prompt: "背骨", match: "体の中心を支える"),
                    QuizMatchingPair(prompt: "骨盤", match: "上半身を支え、下腹部の内臓を守る")
                ],
                choices: ["体の中心を支える", "上半身を支え、下腹部の内臓を守る", "脳を囲んで守る", "心臓や肺を囲んで守る"],
                explanation: "頭がい骨は『脳を囲んで守る』、ろっ骨は『心臓や肺を囲んで守る』、背骨は『体の中心を支える』、骨盤は『上半身を支え、下腹部の内臓を守る』はたらきをします。"
            ),

            QuizQuestion.related(
                question: "【関連付け】月や星について調べたいことと、適切な記録方法を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "月の位置", match: "建物などの目印との位置関係を記録する"),
                    QuizMatchingPair(prompt: "星の明るさ", match: "近くの星と見比べて記録する"),
                    QuizMatchingPair(prompt: "星の色", match: "白っぽい、赤っぽいなどと記録する"),
                    QuizMatchingPair(prompt: "星座の並び方", match: "星どうしの位置関係を線で結んで記録する")
                ],
                choices: ["白っぽい、赤っぽいなどと記録する", "星どうしの位置関係を線で結んで記録する", "建物などの目印との位置関係を記録する", "近くの星と見比べて記録する"],
                explanation: "月の位置は『建物などの目印との位置関係を記録する』、星の明るさは『近くの星と見比べて記録する』、星の色は『白っぽい、赤っぽいなどと記録する』、星座の並び方は『星どうしの位置関係を線で結んで記録する』方法が適切です。"
            ),

            QuizQuestion.classification(
                question: "【分類】水の蒸発について、『蒸発しやすくする条件』『蒸発しにくくする条件』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "水面を広くする", match: "蒸発しやすくする条件"),
                    QuizMatchingPair(prompt: "水面に風を当てる", match: "蒸発しやすくする条件"),
                    QuizMatchingPair(prompt: "入れ物にふたをする", match: "蒸発しにくくする条件"),
                    QuizMatchingPair(prompt: "気温の低い日かげに置く", match: "蒸発しにくくする条件")
                ],
                categories: ["蒸発しやすくする条件", "蒸発しにくくする条件"],
                explanation: "『水面を広くする』『水面に風を当てる』と蒸発しやすくなります。『入れ物にふたをする』『気温の低い日かげに置く』と蒸発しにくくなります。"
            ),

            QuizQuestion.classification(
                question: "【分類】教室で行う温まり方の実験について、『上の方へ動きやすい』『下の方へ動きやすい』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "温められた空気", match: "上の方へ動きやすい"),
                    QuizMatchingPair(prompt: "温められた水", match: "上の方へ動きやすい"),
                    QuizMatchingPair(prompt: "冷やされた空気", match: "下の方へ動きやすい"),
                    QuizMatchingPair(prompt: "冷やされた水", match: "下の方へ動きやすい")
                ],
                categories: ["上の方へ動きやすい", "下の方へ動きやすい"],
                explanation: "温められた空気や水は『上の方へ動きやすい』性質があります。冷やされた空気や水は『下の方へ動きやすい』性質があります。"
            ),

            QuizQuestion.classification(
                question: "【分類】空気や水の温まり方を、『温かさが全体に広がりやすい』『温かさが上の方にとどまりやすい』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "水を容器の下から温める", match: "温かさが全体に広がりやすい"),
                    QuizMatchingPair(prompt: "水を表面近くから温める", match: "温かさが上の方にとどまりやすい"),
                    QuizMatchingPair(prompt: "部屋の空気を床近くで温める", match: "温かさが全体に広がりやすい"),
                    QuizMatchingPair(prompt: "部屋の空気を天井近くで温める", match: "温かさが上の方にとどまりやすい")
                ],
                categories: ["温かさが全体に広がりやすい", "温かさが上の方にとどまりやすい"],
                explanation: "水を下から温めたり、空気を床近くで温めたりすると、温められた部分が上へ動くため、温かさが全体に広がりやすくなります。水を表面近くから温めたり、空気を天井近くで温めたりすると、温かさが上の方にとどまりやすくなります。"
            ),

            QuizQuestion.classification(
                question: "【分類】季節による生き物の変化を、『植物の変化』『動物の変化』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "木の芽がふくらむ", match: "植物の変化"),
                    QuizMatchingPair(prompt: "葉の色が緑から黄色に変わる", match: "植物の変化"),
                    QuizMatchingPair(prompt: "セミの鳴き声が聞こえる", match: "動物の変化"),
                    QuizMatchingPair(prompt: "アリが巣の外で活動する", match: "動物の変化")
                ],
                categories: ["植物の変化", "動物の変化"],
                explanation: "『木の芽がふくらむ』『葉の色が緑から黄色に変わる』は植物の変化です。『セミの鳴き声が聞こえる』『アリが巣の外で活動する』は動物の変化です。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】簡易検流計を使って電流を調べる手順を順番に並べましょう。",
                choices: [
                    "スイッチを短い時間だけ入れる",
                    "針の向きと振れを記録し、スイッチを切る",
                    "スイッチを切った状態にする",
                    "簡易検流計を回路に正しくつなぐ"
                ],
                orderedChoices: [
                    "スイッチを切った状態にする",
                    "簡易検流計を回路に正しくつなぐ",
                    "スイッチを短い時間だけ入れる",
                    "針の向きと振れを記録し、スイッチを切る"
                ],
                explanation: "『スイッチを切った状態にする』『簡易検流計を回路に正しくつなぐ』『スイッチを短い時間だけ入れる』『針の向きと振れを記録し、スイッチを切る』の順です。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】一日の気温を観測し、折れ線グラフを完成させるまでの手順を順番に並べましょう。",
                choices: [
                    "表の値をグラフ上に点で表す",
                    "観測する時刻と場所を決める",
                    "点を時刻順に線で結ぶ",
                    "決めた時刻に気温を測り、その都度表に記録する"
                ],
                orderedChoices: [
                    "観測する時刻と場所を決める",
                    "決めた時刻に気温を測り、その都度表に記録する",
                    "表の値をグラフ上に点で表す",
                    "点を時刻順に線で結ぶ"
                ],
                explanation: "『観測する時刻と場所を決める』『決めた時刻に気温を測り、その都度表に記録する』『表の値をグラフ上に点で表す』『点を時刻順に線で結ぶ』の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】等級の数字が小さい星ほど明るく見えるものとして、明るい順に並べましょう。",
                choices: [
                    "3等星",
                    "1等星",
                    "4等星",
                    "2等星"
                ],
                rankedChoices: [
                    "1等星",
                    "2等星",
                    "3等星",
                    "4等星"
                ],
                explanation: "明るく見える順は『1等星』『2等星』『3等星』『4等星』です。星の等級は、数字が小さいほど明るいことを表します。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】暖房を入れてしばらくたった教室で同じ時刻に測りました。気温が高い順に並べましょう。",
                choices: [
                    "机の高さ：21℃",
                    "床近く：18℃",
                    "天井近く：26℃",
                    "顔の高さ：23℃"
                ],
                rankedChoices: [
                    "天井近く：26℃",
                    "顔の高さ：23℃",
                    "机の高さ：21℃",
                    "床近く：18℃"
                ],
                explanation: "気温が高い順は『天井近く：26℃』『顔の高さ：23℃』『机の高さ：21℃』『床近く：18℃』です。温められた空気は上へ動くため、暖房後は上の方ほど気温が高くなりやすいです。"
            ),

        QuizQuestion(
                question: "ツルレイシの花がしぼんだあと、花のつけ根にふくらんでくるものはどれですか？",
                choices: [
                    "実",
                    "根",
                    "新しい芽",
                    "冬芽"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『実』です。ツルレイシは花がしぼんだあと、花のつけ根がふくらんで実になります。"
            ),

            QuizQuestion(
                question: "同じ木の季節による変化を比べる観察方法として、最も適切なものはどれですか？",
                choices: [
                    "毎回ちがう木を選び、好きな時刻に見る",
                    "同じ枝を決め、同じ向きから定期的に記録する",
                    "春だけに多くの枝を一度ずつ見る",
                    "実際の木を見ず、天気予報だけを記録する"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『同じ枝を決め、同じ向きから定期的に記録する』です。観察する場所や対象をそろえると、季節による変化を比べやすくなります。"
            ),

            QuizQuestion(
                question: "一日の気温の変化を正しく調べる方法はどれですか？",
                choices: [
                    "測るたびに場所を変える",
                    "温度計を手で温めてから測る",
                    "決めた時刻に同じ場所と同じ条件で測る",
                    "朝に一度だけ測る"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『決めた時刻に同じ場所と同じ条件で測る』です。条件をそろえて何度も測ると、一日の気温の変化を正しく比べられます。"
            ),

            QuizQuestion(
                question: "晴れた日とくもりの日の気温の変化を比べたとき、一般に正しいものはどれですか？",
                choices: [
                    "どちらも一日中まったく変化しない",
                    "くもりの日のほうが必ず10℃以上大きく変化する",
                    "晴れた日のほうが一日中気温が低い",
                    "晴れた日のほうが一日の気温の変化が大きい"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『晴れた日のほうが一日の気温の変化が大きい』です。晴れた日は日中に地面がよく温まり、夜には冷えやすいため、気温の変化が大きくなりやすいです。"
            ),

            QuizQuestion(
                question: "同じ量の水を、口の広い皿と口のせまいびんに入れて同じ場所に置きました。水が早く減るのはどちらですか？",
                choices: [
                    "口の広い皿",
                    "口のせまいびん",
                    "どちらもまったく減らない",
                    "入れ物の形に関係なく必ず同時に全部なくなる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『口の広い皿』です。水面の広いほうが空気にふれる部分が多く、水が蒸発しやすくなります。"
            ),

            QuizQuestion(
                question: "ひざを曲げたり伸ばしたりできる主な理由はどれですか？",
                choices: [
                    "骨の中が空洞だから",
                    "骨と骨のつなぎ目に関節があるから",
                    "皮ふが骨をとかすから",
                    "血液が骨を短くするから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『骨と骨のつなぎ目に関節があるから』です。関節がある部分では、骨を曲げたり伸ばしたりできます。"
            ),

            QuizQuestion(
                question: "体を動かすときの筋肉のはたらきとして、正しいものはどれですか？",
                choices: [
                    "筋肉は動くたびに骨へ変わる",
                    "一組の筋肉はいつも同時に縮む",
                    "一組の筋肉が交互に縮んだりゆるんだりする",
                    "筋肉は皮ふの色だけを変える"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『一組の筋肉が交互に縮んだりゆるんだりする』です。向かい合う筋肉が交互にはたらくことで、骨が動きます。"
            ),

            QuizQuestion(
                question: "乾電池2個を並列につなぐ方法として正しいものはどれですか？",
                choices: [
                    "1個目の＋極と2個目の−極だけをつなぐ",
                    "2個の＋極だけをつなぎ、−極は何にもつながない",
                    "2個の−極だけをつなぎ、＋極は何にもつながない",
                    "＋極どうし、−極どうしをそれぞれつなぐ"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『＋極どうし、−極どうしをそれぞれつなぐ』です。このつなぎ方を乾電池の並列つなぎといいます。"
            ),

            QuizQuestion(
                question: "同じ新しい乾電池2個を、向きを反対にして直列につなぎました。モーターはどうなりやすいですか？",
                choices: [
                    "ほとんど回らない",
                    "正しい直列つなぎより速く回る",
                    "回る向きだけが毎秒変わる",
                    "乾電池1個のときの2倍の時間だけ回る"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『ほとんど回らない』です。同じ乾電池を反対向きにつなぐと、それぞれが電流を流そうとする向きが反対になり、はたらきが打ち消し合います。"
            ),

            QuizQuestion(
                question: "夏の大三角をつくる3つの一等星の組み合わせはどれですか？",
                choices: [
                    "シリウス・ベテルギウス・プロキオン",
                    "ベガ・アルタイル・デネブ",
                    "ポラリス・スピカ・アンタレス",
                    "カペラ・リゲル・アルデバラン"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『ベガ・アルタイル・デネブ』です。こと座のベガ、わし座のアルタイル、はくちょう座のデネブが夏の大三角をつくります。"
            ),

            QuizQuestion(
                question: "夜空の星を観察して分かることとして、正しいものはどれですか？",
                choices: [
                    "すべての星は同じ明るさに見える",
                    "すべての星は同じ色に見える",
                    "星によって明るさや色にちがいがある",
                    "星の明るさは見る人によって必ず反対になる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『星によって明るさや色にちがいがある』です。星には明るいものや暗いものがあり、白っぽい星や赤っぽい星など色にもちがいがあります。"
            ),

            QuizQuestion(
                question: "空気を入れたビニール袋の口を閉じ、両手で押したときの様子として正しいものはどれですか？",
                choices: [
                    "中の空気がすべて消える",
                    "中の空気が水に変わる",
                    "袋の形はまったく変わらない",
                    "袋はへこむが、中の空気が押し返す"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『袋はへこむが、中の空気が押し返す』です。閉じ込めた空気は押し縮められ、元に戻ろうとして押し返します。"
            ),

            QuizQuestion(
                question: "空気鉄砲で後ろの玉を押すと前の玉が飛び出すのはなぜですか？",
                choices: [
                    "玉の間の空気が押し縮められ、前の玉を強く押すから",
                    "玉の間の空気がすべてなくなり、前の玉を引くから",
                    "後ろの玉が水に変わり、前の玉をぬらすから",
                    "筒の中の空気の重さがゼロになるから"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『玉の間の空気が押し縮められ、前の玉を強く押すから』です。閉じ込めた空気は強く押し縮めるほど、元に戻ろうとする力が大きくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】ツルレイシの実の中にでき、次の年に芽を出すもとになるものを何といいますか。",
                answer: "種子",
                acceptableAnswers: ["種", "しゅし", "たね"],
                explanation: "答えは『種子』です。ツルレイシは実の中に種子をつくり、次の世代へ命をつなぎます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】くもりや雨の日は、晴れた日より一日の気温の変化が ＿＿ ことが多いです。",
                answer: "小さい",
                acceptableAnswers: ["ちいさい", "少ない"],
                explanation: "＿＿に入る言葉は『小さい』です。くもりや雨の日は、日光による地面の温まり方が弱く、気温の変化が小さくなりやすいです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】水が氷になると、同じ量の水に比べて体積は少し ＿＿ 。",
                answer: "大きくなる",
                acceptableAnswers: ["おおきくなる", "増える", "ふえる"],
                explanation: "＿＿に入る言葉は『大きくなる』です。水は氷になると、体積が少し大きくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】骨を動かすために、縮んだりゆるんだりする体の部分を何といいますか。",
                answer: "筋肉",
                acceptableAnswers: ["きんにく"],
                explanation: "答えは『筋肉』です。筋肉が縮んだりゆるんだりすることで、骨が動きます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】夏の大三角をつくる星のうち、こと座の一等星の名前を答えましょう。",
                answer: "ベガ",
                acceptableAnswers: ["べが"],
                explanation: "答えは『ベガ』です。ベガはこと座の一等星で、夏の大三角をつくる星の一つです。"
            ),

            QuizQuestion.related(
                question: "【関連付け】ツルレイシの様子と、主に見られる季節を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "種子をまく", match: "春"),
                    QuizMatchingPair(prompt: "つるが大きく伸び、花が咲く", match: "夏"),
                    QuizMatchingPair(prompt: "実が熟して種子ができる", match: "秋"),
                    QuizMatchingPair(prompt: "地上部が枯れ、種子で次の春を待つ", match: "冬")
                ],
                choices: ["夏", "冬", "春", "秋"],
                explanation: "種子をまくのは『春』、つるが大きく伸びて花が咲くのは『夏』、実が熟して種子ができるのは『秋』、地上部が枯れて種子で次の春を待つのは『冬』です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】水の変化を調べたときの観察結果と、その説明を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "冷凍庫で十分に冷やした水", match: "固体の氷になる"),
                    QuizMatchingPair(prompt: "沸騰中に水の中から出る大きな泡", match: "中に水蒸気が入っている"),
                    QuizMatchingPair(prompt: "冷たいコップの外側についたしずく", match: "空気中の水蒸気が水になった"),
                    QuizMatchingPair(prompt: "日なたに置いたぬれた布から減った水", match: "見えない水蒸気になった")
                ],
                choices: ["見えない水蒸気になった", "空気中の水蒸気が水になった", "固体の氷になる", "中に水蒸気が入っている"],
                explanation: "十分に冷やした水は『固体の氷になる』、沸騰中の大きな泡には『中に水蒸気が入っている』、冷たいコップのしずくは『空気中の水蒸気が水になった』もの、ぬれた布から減った水は『見えない水蒸気になった』ものです。"
            ),

            QuizQuestion.related(
                question: "【関連付け】電気の実験での目的や状態と、適切な操作を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "モーターの回る向きを反対にしたい", match: "乾電池の向きを反対にする"),
                    QuizMatchingPair(prompt: "導線の先がビニールでおおわれている", match: "金属部分が触れるようにする"),
                    QuizMatchingPair(prompt: "実験中に導線が熱くなった", match: "すぐにスイッチを切る"),
                    QuizMatchingPair(prompt: "回路を調べ終えた", match: "乾電池を回路から外す")
                ],
                choices: ["乾電池を回路から外す", "金属部分が触れるようにする", "乾電池の向きを反対にする", "すぐにスイッチを切る"],
                explanation: "モーターの向きを変えるときは『乾電池の向きを反対にする』、導線がビニールでおおわれているときは『金属部分が触れるようにする』、導線が熱くなったときは『すぐにスイッチを切る』、調べ終えたら『乾電池を回路から外す』のが適切です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】星の名前と、その星がある星座を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ベガ", match: "こと座"),
                    QuizMatchingPair(prompt: "アルタイル", match: "わし座"),
                    QuizMatchingPair(prompt: "デネブ", match: "はくちょう座"),
                    QuizMatchingPair(prompt: "ベテルギウス", match: "オリオン座")
                ],
                choices: ["オリオン座", "はくちょう座", "こと座", "わし座"],
                explanation: "ベガは『こと座』、アルタイルは『わし座』、デネブは『はくちょう座』、ベテルギウスは『オリオン座』にある星です。"
            ),

            QuizQuestion.classification(
                question: "【分類】午前8時と午後2時の気温の差を、『差が5℃以上』『差が5℃未満』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "午前8時12℃・午後2時24℃", match: "差が5℃以上"),
                    QuizMatchingPair(prompt: "午前8時18℃・午後2時20℃", match: "差が5℃未満"),
                    QuizMatchingPair(prompt: "午前8時15℃・午後2時23℃", match: "差が5℃以上"),
                    QuizMatchingPair(prompt: "午前8時17℃・午後2時18℃", match: "差が5℃未満")
                ],
                categories: ["差が5℃以上", "差が5℃未満"],
                explanation: "12℃と24℃の差は12℃、15℃と23℃の差は8℃なので『差が5℃以上』です。18℃と20℃の差は2℃、17℃と18℃の差は1℃なので『差が5℃未満』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】関節を『上半身にある』『下半身にある』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ひじの関節", match: "上半身にある"),
                    QuizMatchingPair(prompt: "手首の関節", match: "上半身にある"),
                    QuizMatchingPair(prompt: "ひざの関節", match: "下半身にある"),
                    QuizMatchingPair(prompt: "足首の関節", match: "下半身にある")
                ],
                categories: ["上半身にある", "下半身にある"],
                explanation: "『ひじの関節』『手首の関節』は上半身にあり、『ひざの関節』『足首の関節』は下半身にあります。"
            ),

            QuizQuestion.classification(
                question: "【分類】乾電池2個のつなぎ方を『直列つなぎ』『並列つなぎ』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "1個目の＋極と2個目の−極をつなぐ", match: "直列つなぎ"),
                    QuizMatchingPair(prompt: "＋極どうし、−極どうしをつなぐ", match: "並列つなぎ"),
                    QuizMatchingPair(prompt: "乾電池が一列になるようにつなぐ", match: "直列つなぎ"),
                    QuizMatchingPair(prompt: "2個の乾電池が別々の枝に入るようにつなぐ", match: "並列つなぎ")
                ],
                categories: ["直列つなぎ", "並列つなぎ"],
                explanation: "『1個目の＋極と2個目の−極をつなぐ』『乾電池が一列になるようにつなぐ』は直列つなぎです。『＋極どうし、−極どうしをつなぐ』『2個の乾電池が別々の枝に入るようにつなぐ』は並列つなぎです。"
            ),

            QuizQuestion.classification(
                question: "【分類】空気や水の性質を利用した例を、『空気を押し縮められる性質』『水がほとんど押し縮められない性質』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "エアマットが体の重さでへこむ", match: "空気を押し縮められる性質"),
                    QuizMatchingPair(prompt: "空気鉄砲で玉を飛ばす", match: "空気を押し縮められる性質"),
                    QuizMatchingPair(prompt: "水を満たした二つの注射器で力を伝える", match: "水がほとんど押し縮められない性質"),
                    QuizMatchingPair(prompt: "水をいっぱい入れた注射器のピストンがほとんど動かない", match: "水がほとんど押し縮められない性質")
                ],
                categories: ["空気を押し縮められる性質", "水がほとんど押し縮められない性質"],
                explanation: "『エアマットが体の重さでへこむ』『空気鉄砲で玉を飛ばす』は空気を押し縮められる性質を利用しています。『水を満たした二つの注射器で力を伝える』『水をいっぱい入れた注射器のピストンがほとんど動かない』は水がほとんど押し縮められない性質によるものです。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】ツルレイシが育って実をつけるまでの変化を順番に並べましょう。",
                choices: [
                    "花が咲く",
                    "種子から芽が出る",
                    "実が大きくなる",
                    "つると葉が増える"
                ],
                orderedChoices: [
                    "種子から芽が出る",
                    "つると葉が増える",
                    "花が咲く",
                    "実が大きくなる"
                ],
                explanation: "『種子から芽が出る』『つると葉が増える』『花が咲く』『実が大きくなる』の順です。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】水を冷やして氷になるまでを調べる実験の変化を順番に並べましょう。",
                choices: [
                    "0℃近くで氷ができ始める",
                    "試験管に水を入れて温度計を入れる",
                    "さらに冷やすと全体が氷になる",
                    "氷と食塩を使って試験管の周りを冷やす"
                ],
                orderedChoices: [
                    "試験管に水を入れて温度計を入れる",
                    "氷と食塩を使って試験管の周りを冷やす",
                    "0℃近くで氷ができ始める",
                    "さらに冷やすと全体が氷になる"
                ],
                explanation: "『試験管に水を入れて温度計を入れる』『氷と食塩を使って試験管の周りを冷やす』『0℃近くで氷ができ始める』『さらに冷やすと全体が氷になる』の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】最高気温と最低気温の差が大きい順に並べましょう。",
                choices: [
                    "月曜日：最高22℃・最低12℃",
                    "火曜日：最高19℃・最低15℃",
                    "水曜日：最高25℃・最低13℃",
                    "木曜日：最高21℃・最低14℃"
                ],
                rankedChoices: [
                    "水曜日：最高25℃・最低13℃",
                    "月曜日：最高22℃・最低12℃",
                    "木曜日：最高21℃・最低14℃",
                    "火曜日：最高19℃・最低15℃"
                ],
                explanation: "気温の差は、水曜日が12℃、月曜日が10℃、木曜日が7℃、火曜日が4℃です。したがって、水曜日、月曜日、木曜日、火曜日の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】同じ大きさの注射器に閉じ込めた空気を、体積が大きい順に並べましょう。",
                choices: [
                    "注射器A：40mL",
                    "注射器B：25mL",
                    "注射器C：10mL",
                    "注射器D：30mL"
                ],
                rankedChoices: [
                    "注射器A：40mL",
                    "注射器D：30mL",
                    "注射器B：25mL",
                    "注射器C：10mL"
                ],
                explanation: "体積が大きい順は『注射器A：40mL』『注射器D：30mL』『注射器B：25mL』『注射器C：10mL』です。"
            ),

        QuizQuestion(
                question: "春のサクラの枝に見られる変化として、正しいものはどれですか？",
                choices: [
                    "つぼみが開いて花が咲く",
                    "葉がすべて落ちる",
                    "実が熟して種がこぼれる",
                    "冬芽だけを残して休む"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『つぼみが開いて花が咲く』です。春になるとサクラのつぼみが開き、花が咲きます。"
            ),

            QuizQuestion(
                question: "晴れた日の気温は、朝から昼過ぎにかけて一般にどう変化しますか？",
                choices: [
                    "下がり続ける",
                    "上がっていく",
                    "まったく変わらない",
                    "上がったり下がったりを短時間でくり返す"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『上がっていく』です。晴れた日は地面が日光で温められるため、気温は朝から昼過ぎにかけて一般に上がります。"
            ),

            QuizQuestion(
                question: "氷がとけている間の温度は、ふつうどうなりますか？",
                choices: [
                    "100℃近くまで上がり続ける",
                    "0℃よりどんどん下がる",
                    "0℃付近でほぼ変わらない",
                    "50℃付近で止まる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『0℃付近でほぼ変わらない』です。氷がとけて水に変わっている間は、温度が0℃付近に保たれます。"
            ),

            QuizQuestion(
                question: "体を動かすとき、骨を動かすはたらきをするものはどれですか？",
                choices: [
                    "皮ふ",
                    "血液",
                    "胃",
                    "筋肉"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『筋肉』です。筋肉が縮んだりゆるんだりすることで、骨が動きます。"
            ),

            QuizQuestion(
                question: "モーターにつないだ乾電池の向きを反対にすると、モーターの回り方はどうなりますか？",
                choices: [
                    "反対向きに回る",
                    "同じ向きに速く回る",
                    "必ず止まったままになる",
                    "回転する向きは毎回ばらばらになる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『反対向きに回る』です。乾電池の向きを反対にすると電流の向きが変わり、モーターも反対向きに回ります。"
            ),

            QuizQuestion(
                question: "月や星の位置を記録するとき、方角を確かめるために使うものはどれですか？",
                choices: [
                    "虫めがね",
                    "方位磁針",
                    "ストップウォッチ",
                    "上皿てんびん"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『方位磁針』です。方位磁針を使うと、月や星が見える方角を確かめられます。"
            ),

            QuizQuestion(
                question: "注射器に空気を閉じ込めてピストンを押すと、空気はどうなりますか？",
                choices: [
                    "重さがなくなる",
                    "水に変わる",
                    "体積が小さくなり、押し返す",
                    "体積が大きくなり、押し返さなくなる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『体積が小さくなり、押し返す』です。閉じ込めた空気は押すと体積が小さくなり、元に戻ろうとして押し返します。"
            ),

            QuizQuestion(
                question: "秋のヘチマに見られる様子として、最も適切なものはどれですか？",
                choices: [
                    "芽が出たばかりである",
                    "花だけが咲き続ける",
                    "つるがのび始める",
                    "実が熟し、中に種ができる"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『実が熟し、中に種ができる』です。秋になるとヘチマの実が熟し、中の種も育ちます。"
            ),

            QuizQuestion(
                question: "晴れた日の気温が最も高くなりやすい時刻は、一般にいつごろですか？",
                choices: [
                    "午後2時ごろ",
                    "日の出ごろ",
                    "午前9時ごろ",
                    "夜中の12時ごろ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『午後2時ごろ』です。晴れた日の気温は、太陽が最も高くなる正午より少し遅い午後2時ごろに最も高くなりやすいです。"
            ),

            QuizQuestion(
                question: "沸騰している水から出る泡を集めて冷やすと、何になりますか？",
                choices: [
                    "空気",
                    "水",
                    "氷",
                    "酸素"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『水』です。沸騰している水から出る泡の中は水蒸気で、水蒸気を冷やすと水になります。"
            ),

            QuizQuestion(
                question: "うでを伸ばすとき、上うでの筋肉はどのようになりますか？",
                choices: [
                    "内側も外側も縮む",
                    "内側も外側もゆるむ",
                    "内側がゆるみ、外側が縮む",
                    "内側が縮み、外側がゆるむ"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『内側がゆるみ、外側が縮む』です。うでを伸ばすときは、上うでの内側の筋肉がゆるみ、外側の筋肉が縮みます。"
            ),

            QuizQuestion(
                question: "乾電池1個で回るモーターに、乾電池2個を直列につなぐと、回り方は一般にどうなりますか？",
                choices: [
                    "回らなくなる",
                    "1個のときより遅くなる",
                    "1個のときと必ず同じになる",
                    "1個のときより速くなる"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『1個のときより速くなる』です。乾電池2個を直列につなぐと、1個のときより大きな電流が流れ、モーターは一般に速く回ります。"
            ),

            QuizQuestion(
                question: "同じ場所で2時間あけて星空を観察しました。観察結果として正しいものはどれですか？",
                choices: [
                    "北極星はほぼ同じ位置に見え、ほかの星は並び方を保ちながら位置を変える",
                    "北極星だけが大きく西へ動き、ほかの星は動かない",
                    "すべての星がそれぞれ別々の向きへ動く",
                    "星の並び方は完全に変わり、同じ星座は見つけられない"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『北極星はほぼ同じ位置に見え、ほかの星は並び方を保ちながら位置を変える』です。星座をつくる星の並び方は変わらず、北極星はほぼ同じ位置に見えます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】注射器に閉じ込めた空気を押すと、空気の体積は ＿＿ 。",
                answer: "小さくなる",
                acceptableAnswers: ["ちいさくなる"],
                explanation: "＿＿に入る言葉は『小さくなる』です。閉じ込めた空気は押し縮めることができます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】水は、ふつう ＿＿ ℃で沸騰します。数字で答えましょう。",
                answer: "100",
                acceptableAnswers: ["１００"],
                explanation: "＿＿に入る数字は『100』です。水は、ふつう100℃で沸騰します。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】骨と骨がつながり、体を曲げたり伸ばしたりできる部分を何といいますか。",
                answer: "関節",
                acceptableAnswers: ["かんせつ"],
                explanation: "骨と骨がつながって動く部分を『関節』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】乾電池2個を、1個目の＋極と2個目の−極がつながるように一列につなぐ方法を何といいますか。",
                answer: "直列つなぎ",
                acceptableAnswers: ["直列"],
                explanation: "このつなぎ方を『直列つなぎ』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】冬のサクラの枝にあり、春に葉や花になる芽を何といいますか。",
                answer: "冬芽",
                acceptableAnswers: ["ふゆめ"],
                explanation: "冬の枝にあり、春に葉や花になる芽を『冬芽』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連付け】生き物の様子と、最もよく見られる季節を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ツバメが巣を作る", match: "春"),
                    QuizMatchingPair(prompt: "カブトムシの成虫が活動する", match: "夏"),
                    QuizMatchingPair(prompt: "カマキリが卵を産む", match: "秋"),
                    QuizMatchingPair(prompt: "カエルが土の中などでじっとしている", match: "冬")
                ],
                choices: ["夏", "冬", "春", "秋"],
                explanation: "ツバメが巣を作るのは『春』、カブトムシの成虫が活動するのは『夏』、カマキリが卵を産むのは『秋』、カエルが土の中などでじっとしているのは『冬』です。"
            ),

            QuizQuestion.related(
                question: "【関連付け】関節と、その関節を使う主な動きを組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ひじの関節", match: "うでを曲げ伸ばしする"),
                    QuizMatchingPair(prompt: "ひざの関節", match: "あしを曲げ伸ばしする"),
                    QuizMatchingPair(prompt: "首の関節", match: "頭の向きを変える"),
                    QuizMatchingPair(prompt: "指の関節", match: "指を曲げてものをつかむ")
                ],
                choices: ["頭の向きを変える", "指を曲げてものをつかむ", "うでを曲げ伸ばしする", "あしを曲げ伸ばしする"],
                explanation: "ひじの関節は『うでを曲げ伸ばしする』、ひざの関節は『あしを曲げ伸ばしする』、首の関節は『頭の向きを変える』、指の関節は『指を曲げてものをつかむ』動きに関係します。"
            ),

            QuizQuestion.related(
                question: "【関連付け】乾電池のつなぎ方や回路の状態と、モーターの回り方を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "乾電池1個の閉じた回路", match: "モーターが基準の速さで回る"),
                    QuizMatchingPair(prompt: "乾電池2個の直列つなぎ", match: "1個のときより速く回る"),
                    QuizMatchingPair(prompt: "乾電池2個の並列つなぎ", match: "1個のときとほぼ同じ速さで長く回る"),
                    QuizMatchingPair(prompt: "スイッチを切った回路", match: "モーターは回らない")
                ],
                choices: ["モーターは回らない", "1個のときとほぼ同じ速さで長く回る", "モーターが基準の速さで回る", "1個のときより速く回る"],
                explanation: "乾電池1個の閉じた回路では『モーターが基準の速さで回る』、直列つなぎでは『1個のときより速く回る』、並列つなぎでは『1個のときとほぼ同じ速さで長く回る』、スイッチを切ると『モーターは回らない』となります。"
            ),

            QuizQuestion.related(
                question: "【関連付け】月や星の観察対象と、観察できる特徴を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "北極星", match: "ほぼ同じ位置に見える"),
                    QuizMatchingPair(prompt: "南の空の星", match: "時間とともに東から西へ動く"),
                    QuizMatchingPair(prompt: "一つの星座の星々", match: "並び方を保って動く"),
                    QuizMatchingPair(prompt: "月", match: "時間とともに位置が変わる")
                ],
                choices: ["並び方を保って動く", "時間とともに位置が変わる", "ほぼ同じ位置に見える", "時間とともに東から西へ動く"],
                explanation: "北極星は『ほぼ同じ位置に見える』、南の空の星は『時間とともに東から西へ動く』、一つの星座の星々は『並び方を保って動く』、月は『時間とともに位置が変わる』という特徴があります。"
            ),

            QuizQuestion.classification(
                question: "【分類】気温のはかり方を『正しいはかり方』『正しくないはかり方』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "風通しのよい日かげではかる", match: "正しいはかり方"),
                    QuizMatchingPair(prompt: "地面から1.2〜1.5mほどの高さではかる", match: "正しいはかり方"),
                    QuizMatchingPair(prompt: "温度計の液だめに日光を当てる", match: "正しくないはかり方"),
                    QuizMatchingPair(prompt: "温度計の液だめを手でにぎる", match: "正しくないはかり方")
                ],
                categories: ["正しいはかり方", "正しくないはかり方"],
                explanation: "『風通しのよい日かげではかる』『地面から1.2〜1.5mほどの高さではかる』は正しいはかり方です。『温度計の液だめに日光を当てる』『温度計の液だめを手でにぎる』は正しくないはかり方です。"
            ),

            QuizQuestion.classification(
                question: "【分類】水を加熱する実験で見られるものを『空気』『水蒸気』『水』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "加熱を始めた直後に容器の内側から出る小さな泡", match: "空気"),
                    QuizMatchingPair(prompt: "沸騰中に水の中から出る大きな泡の中", match: "水蒸気"),
                    QuizMatchingPair(prompt: "やかんの口から少し離れて見える白い湯気", match: "水"),
                    QuizMatchingPair(prompt: "水蒸気を冷やした板につくしずく", match: "水")
                ],
                categories: ["空気", "水蒸気", "水"],
                explanation: "『加熱を始めた直後に容器の内側から出る小さな泡』は空気、『沸騰中に水の中から出る大きな泡の中』は水蒸気です。『やかんの口から少し離れて見える白い湯気』『水蒸気を冷やした板につくしずく』は細かな水です。"
            ),

            QuizQuestion.classification(
                question: "【分類】木を『秋から冬に葉を落とす』『一年中緑の葉をつける』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "サクラ", match: "秋から冬に葉を落とす"),
                    QuizMatchingPair(prompt: "イチョウ", match: "秋から冬に葉を落とす"),
                    QuizMatchingPair(prompt: "マツ", match: "一年中緑の葉をつける"),
                    QuizMatchingPair(prompt: "スギ", match: "一年中緑の葉をつける")
                ],
                categories: ["秋から冬に葉を落とす", "一年中緑の葉をつける"],
                explanation: "『サクラ』『イチョウ』は秋から冬に葉を落とし、『マツ』『スギ』は一年中緑の葉をつけます。"
            ),

            QuizQuestion.classification(
                question: "【分類】閉じ込めた空気と水の性質を『閉じ込めた空気』『閉じ込めた水』に分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "押すと体積が小さくなる", match: "閉じ込めた空気"),
                    QuizMatchingPair(prompt: "押すほど押し返す力が大きくなる", match: "閉じ込めた空気"),
                    QuizMatchingPair(prompt: "押しても体積がほとんど変わらない", match: "閉じ込めた水"),
                    QuizMatchingPair(prompt: "加えた力が水を通して伝わる", match: "閉じ込めた水")
                ],
                categories: ["閉じ込めた空気", "閉じ込めた水"],
                explanation: "閉じ込めた空気は『押すと体積が小さくなる』『押すほど押し返す力が大きくなる』性質があります。閉じ込めた水は『押しても体積がほとんど変わらない』『加えた力が水を通して伝わる』性質があります。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】水を加熱し始めてから、水の量が減るまでの変化を順番に並べましょう。",
                choices: [
                    "水の量が少しずつ減る",
                    "水を加熱し始める",
                    "水の温度が上がる",
                    "水の中からさかんに泡が出る"
                ],
                orderedChoices: [
                    "水を加熱し始める",
                    "水の温度が上がる",
                    "水の中からさかんに泡が出る",
                    "水の量が少しずつ減る"
                ],
                explanation: "『水を加熱し始める』『水の温度が上がる』『水の中からさかんに泡が出る』『水の量が少しずつ減る』の順です。"
            ),

            QuizQuestion.chronological(
                question: "【順番に並べる】月や星の位置の変化を調べる観察手順を順番に並べましょう。",
                choices: [
                    "時間をおいて同じ場所からもう一度位置を記録する",
                    "方位磁針で観察する方角を確かめる",
                    "月や星の位置と時刻を記録する",
                    "その方角にある動かない建物や木を目印に決める"
                ],
                orderedChoices: [
                    "方位磁針で観察する方角を確かめる",
                    "その方角にある動かない建物や木を目印に決める",
                    "月や星の位置と時刻を記録する",
                    "時間をおいて同じ場所からもう一度位置を記録する"
                ],
                explanation: "『方位磁針で観察する方角を確かめる』『その方角にある動かない建物や木を目印に決める』『月や星の位置と時刻を記録する』『時間をおいて同じ場所からもう一度位置を記録する』の順です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】ある晴れた日の記録を、気温が高い順に並べましょう。",
                choices: [
                    "午前8時：12℃",
                    "午後6時：17℃",
                    "午後2時：23℃",
                    "正午：20℃"
                ],
                rankedChoices: [
                    "午後2時：23℃",
                    "正午：20℃",
                    "午後6時：17℃",
                    "午前8時：12℃"
                ],
                explanation: "気温が高い順は『午後2時：23℃』『正午：20℃』『午後6時：17℃』『午前8時：12℃』です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】同じ注射器に同じ量の空気を閉じ込めたとき、空気が押し返す力が強い順に並べましょう。",
                choices: [
                    "ピストンを1cm押したとき",
                    "ピストンを押していないとき",
                    "ピストンを3cm押したとき",
                    "ピストンを2cm押したとき"
                ],
                rankedChoices: [
                    "ピストンを3cm押したとき",
                    "ピストンを2cm押したとき",
                    "ピストンを1cm押したとき",
                    "ピストンを押していないとき"
                ],
                explanation: "空気が押し返す力が強い順は『ピストンを3cm押したとき』『ピストンを2cm押したとき』『ピストンを1cm押したとき』『ピストンを押していないとき』です。空気は強く押し縮めるほど、押し返す力が大きくなります。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika4, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika4ListView(isPresenting: .constant(false))
    }
}
