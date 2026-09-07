//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika5ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】水蒸気が 冷えて 水に なることを答えましょう。",
            answer: "凝結",
            acceptableAnswers: ["ぎょうけつ"],
            explanation: "水蒸気が 冷えて 水になることを『凝結』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】水に とけた ものを 取り出すために、水だけを とばす 方法を 何といいますか。",
            answer: "蒸発",
            acceptableAnswers: ["じょうはつ"],
            explanation: "水を とばして とけたものを 取り出す 方法は『蒸発』です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】実験器具と 使い方が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "上皿てんびん", match: "重さを はかる"),
                QuizMatchingPair(prompt: "メスシリンダー", match: "体積を はかる"),
                QuizMatchingPair(prompt: "ろ紙", match: "こし分ける")
            ],
            choices: ["こし分ける", "重さを はかる", "体積を はかる"],
            explanation: "上皿てんびんは 重さ、メスシリンダーは 体積、ろ紙は こし分ける ときに使います。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】条件と 結果が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "日光が 当たる", match: "光合成が 進む"),
                QuizMatchingPair(prompt: "水に 砂を 入れる", match: "下に 沈む"),
                QuizMatchingPair(prompt: "水蒸気を 冷やす", match: "水に なる")
            ],
            choices: ["光合成が 進む", "水に なる", "下に 沈む"],
            explanation: "条件によって、植物や 水のようすは 変わります。"
        ),

        QuizQuestion.classification(
            question: "【分類】ものを 『水に とける』『水に とけない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "食塩", match: "水に とける"),
                QuizMatchingPair(prompt: "砂", match: "水に とけない"),
                QuizMatchingPair(prompt: "さとう", match: "水に とける")
            ],
            categories: ["水に とける", "水に とけない"],
            explanation: "食塩と さとうは 水に とけますが、砂は とけません。"
        ),

        QuizQuestion.classification(
            question: "【分類】ものを 『気体』『液体』『固体』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "空気", match: "気体"),
                QuizMatchingPair(prompt: "水", match: "液体"),
                QuizMatchingPair(prompt: "氷", match: "固体")
            ],
            categories: ["気体", "液体", "固体"],
            explanation: "空気は 気体、水は 液体、氷は 固体です。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】水の すがたの 変化を じゅんに ならべましょう。",
            choices: ["水蒸気に なる", "氷を あたためる", "水に なる"],
            orderedChoices: ["氷を あたためる", "水に なる", "水蒸気に なる"],
            explanation: "氷を あたためると 水になり、さらに あたためると 水蒸気になります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】水に とけやすいじゅんに ならべましょう。",
            choices: ["砂", "ミョウバン", "食塩"],
            rankedChoices: ["食塩", "ミョウバン", "砂"],
            explanation: "水に とけやすいのは、食塩、そのつぎが ミョウバンで、砂は ほとんど とけません。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】電流が 流れる みちすじを何といいますか。",
            answer: "回路",
            acceptableAnswers: ["かいろ"],
            explanation: "電流が 流れる みちすじを『回路』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】水に とけたものを 取り出したときに できる つぶを何といいますか。",
            answer: "結晶",
            acceptableAnswers: ["けっしょう"],
            explanation: "とけたものが 出てきて できるつぶを『結晶』といいます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】実験器具と 注意することが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "アルコールランプ", match: "火を 消してから しまう"),
                QuizMatchingPair(prompt: "メスシリンダー", match: "目の高さで 水面を 見る"),
                QuizMatchingPair(prompt: "ろうと", match: "ろ紙を 入れて こす")
            ],
            choices: ["目の高さで 水面を 見る", "ろ紙を 入れて こす", "火を 消してから しまう"],
            explanation: "器具ごとに 正しい使い方を守ることが 大切です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】雲の ようすと 天気の変化が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "黒い雲が ふえる", match: "雨が 近い"),
                QuizMatchingPair(prompt: "空が よく晴れる", match: "気温が 上がりやすい"),
                QuizMatchingPair(prompt: "風が 強くなる", match: "天気が 変わりやすい")
            ],
            choices: ["気温が 上がりやすい", "天気が 変わりやすい", "雨が 近い"],
            explanation: "雲や風のようすを見ると、天気の変化を 予想できます。"
        ),

        QuizQuestion.classification(
            question: "【分類】発芽の 条件を 『必要』『なくてもよい』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "水", match: "必要"),
                QuizMatchingPair(prompt: "空気", match: "必要"),
                QuizMatchingPair(prompt: "土", match: "なくてもよい")
            ],
            categories: ["必要", "なくてもよい"],
            explanation: "発芽には 水と空気が 必要ですが、土は なくても発芽します。"
        ),

        QuizQuestion.classification(
            question: "【分類】水の 中のものを 『ろ過で分けられる』『ろ過で分けられない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "砂水", match: "ろ過で分けられる"),
                QuizMatchingPair(prompt: "食塩水", match: "ろ過で分けられない"),
                QuizMatchingPair(prompt: "でい水", match: "ろ過で分けられる")
            ],
            categories: ["ろ過で分けられる", "ろ過で分けられない"],
            explanation: "水に とけていないものは ろ過で分けられますが、食塩水は 分けられません。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】食塩を 水から 取り出す 手順を じゅんに ならべましょう。",
            choices: ["白い 結晶が のこる", "食塩水を あたためる", "水が へる"],
            orderedChoices: ["食塩水を あたためる", "水が へる", "白い 結晶が のこる"],
            explanation: "食塩水を あたためると 水がへり、さいごに 食塩の結晶が のこります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】せんたく物が かわきやすいじゅんに ならべましょう。",
            choices: ["日かげで 風がない", "日なたで 風がある", "日なたで 風がない"],
            rankedChoices: ["日なたで 風がある", "日なたで 風がない", "日かげで 風がない"],
            explanation: "日なたで 風があると もっとも早くかわき、日かげで 風がないと かわきにくいです。"
        ),

        QuizQuestion(
            question: "砂糖を水に溶かしたとき、どうなりますか？",
            choices: [
                "見えなくなるが、水に溶けている",
                "砂糖が浮く",
                "砂糖が沈む",
                "砂糖が燃える"
            ],
            correctAnswerIndex: 0,
            explanation: "砂糖は水に溶けて見えなくなりますが、水の中に溶けています。"
        ),
        QuizQuestion(
            question: "植物が成長するために最も必要なものはどれですか？",
            choices: [
                "光",
                "火",
                "風",
                "雪"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成を行うために光が最も必要です。"
        ),
        QuizQuestion(
            question: "スイッチをオンにすると、電気がどう流れますか？",
            choices: [
                "電気が流れる",
                "電気が止まる",
                "電気が回る",
                "電気が光る"
            ],
            correctAnswerIndex: 0,
            explanation: "スイッチをオンにすると、電気回路が閉じて電気が流れます。"
        ),
        QuizQuestion(
            question: "水に砂を入れるとどうなりますか？",
            choices: [
                "砂が浮く",
                "砂が沈む",
                "砂が溶ける",
                "砂が消える"
            ],
            correctAnswerIndex: 1,
            explanation: "砂は水に溶けず、底に沈みます。"
        ),
        QuizQuestion(
            question: "鉄を加熱するとどうなりますか？",
            choices: [
                "溶ける",
                "曲がる",
                "蒸発する",
                "燃える"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄を加熱すると柔らかくなり、曲がることがあります。"
        ),
        QuizQuestion(
            question: "植物が成長するために必要な成分はどれですか？",
            choices: [
                "窒素",
                "酸素",
                "二酸化炭素",
                "水素"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は成長するために窒素を含む栄養素が必要です。"
        ),
        QuizQuestion(
            question: "電球がつかない原因として考えられるものはどれですか？",
            choices: [
                "スイッチが切れている",
                "電気が強すぎる",
                "回路が閉じている",
                "電球が明るすぎる"
            ],
            correctAnswerIndex: 0,
            explanation: "スイッチが切れていると電球はつきません。"
        ),
        QuizQuestion(
            question: "植物の根の役割はどれですか？",
            choices: [
                "水を吸収する",
                "葉を成長させる",
                "光を集める",
                "栄養を作る"
            ],
            correctAnswerIndex: 0,
            explanation: "植物の根は主に水を吸収する役割を持っています。"
        ),
        QuizQuestion(
            question: "電気回路が切れるとどうなりますか？",
            choices: [
                "電気が流れなくなる",
                "電気が強くなる",
                "電気が回り続ける",
                "電気が光る"
            ],
            correctAnswerIndex: 0,
            explanation: "回路が切れると、電気は流れなくなります。"
        ),
        QuizQuestion(
            question: "光が水に当たるとどうなりますか？",
            choices: [
                "屈折する",
                "吸収される",
                "反射する",
                "消える"
            ],
            correctAnswerIndex: 0,
            explanation: "光は水に当たると屈折し、進む方向が変わります。"
        ),
        QuizQuestion(
            question: "静電気はどのようにして発生しますか？",
            choices: [
                "摩擦によって発生する",
                "電池によって発生する",
                "光によって発生する",
                "音によって発生する"
            ],
            correctAnswerIndex: 0,
            explanation: "静電気は、摩擦によって発生します。"
        ),
        QuizQuestion(
            question: "水蒸気が冷やされると何が起こりますか？",
            choices: [
                "水になる",
                "氷になる",
                "蒸発する",
                "消える"
            ],
            correctAnswerIndex: 0,
            explanation: "水蒸気が冷やされると凝結して水になります。"
        ),
        QuizQuestion(
            question: "植物の光合成によって作られる物質は何ですか？",
            choices: [
                "酸素",
                "窒素",
                "水素",
                "炭素"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成によって酸素を作り出します。"
        ),
        QuizQuestion(
            question: "ガスを燃やすと何が発生しますか？",
            choices: [
                "光と熱",
                "水",
                "音",
                "風"
            ],
            correctAnswerIndex: 0,
            explanation: "ガスを燃やすと光と熱が発生します。"
        ),
        QuizQuestion(
            question: "電気を流すのに必要なものは何ですか？",
            choices: [
                "導線",
                "紙",
                "プラスチック",
                "ゴム"
            ],
            correctAnswerIndex: 0,
            explanation: "導線は電気を通すために使われます。"
        ),
        QuizQuestion(
            question: "太陽が沈むと、空の色はどう変わりますか？",
            choices: [
                "赤くなる",
                "青くなる",
                "黄色くなる",
                "緑になる"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽が沈むと、空は赤くなります。"
        ),
        QuizQuestion(
            question: "酸素が最も多く含まれている場所はどこですか？",
            choices: [
                "空気",
                "水",
                "土",
                "火"
            ],
            correctAnswerIndex: 0,
            explanation: "空気中には酸素が多く含まれています。"
        ),
        QuizQuestion(
            question: "植物は光を使って何を作りますか？",
            choices: [
                "栄養",
                "火",
                "土",
                "水"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光を使って栄養を作り出します。"
        ),
        QuizQuestion(
            question: "音はどのように伝わりますか？",
            choices: [
                "空気を通して伝わる",
                "光を通して伝わる",
                "水を通して伝わる",
                "金属を通して伝わる"
            ],
            correctAnswerIndex: 0,
            explanation: "音は空気を振動させて伝わります。"
        ),
        QuizQuestion(
            question: "雲ができる原因は何ですか？",
            choices: [
                "水蒸気が冷えて凝結する",
                "風が強くなる",
                "空気が温まる",
                "太陽が照る"
            ],
            correctAnswerIndex: 0,
            explanation: "水蒸気が冷えて凝結することで雲ができます。"
        ),
        QuizQuestion(
            question: "月はどのようにして光っているように見えますか？",
            choices: [
                "太陽の光を反射している",
                "自ら光っている",
                "地球の光を反射している",
                "星の光を集めている"
            ],
            correctAnswerIndex: 0,
            explanation: "月は太陽の光を反射して光っているように見えます。"
        ),
        QuizQuestion(
            question: "水を沸騰させるとどうなりますか？",
            choices: [
                "水蒸気になる",
                "氷になる",
                "水が消える",
                "水が濁る"
            ],
            correctAnswerIndex: 0,
            explanation: "水を沸騰させると水蒸気になります。"
        ),
        QuizQuestion(
            question: "磁石に引きつけられる物質はどれですか？",
            choices: [
                "鉄",
                "木",
                "プラスチック",
                "紙"
            ],
            correctAnswerIndex: 0,
            explanation: "鉄は磁石に引きつけられます。"
        ),
        QuizQuestion(
            question: "地球が1回自転するのにかかる時間はどれですか？",
            choices: [
                "24時間",
                "12時間",
                "1週間",
                "1ヶ月"
            ],
            correctAnswerIndex: 0,
            explanation: "地球が自転するのにかかる時間は約24時間です。"
        ),
        QuizQuestion(
            question: "水に油を入れるとどうなりますか？",
            choices: [
                "油が水に浮く",
                "油が水に溶ける",
                "油が水の底に沈む",
                "油が蒸発する"
            ],
            correctAnswerIndex: 0,
            explanation: "油は水より軽いため、水に浮きます。"
        ),
        QuizQuestion(
            question: "氷が水になるとき、どのような現象が起こりますか？",
            choices: [
                "融解",
                "蒸発",
                "凝固",
                "昇華"
            ],
            correctAnswerIndex: 0,
            explanation: "氷が水に変わることを融解と言います。"
        ),
        QuizQuestion(
            question: "植物が二酸化炭素を吸収して何を作り出しますか？",
            choices: [
                "酸素",
                "窒素",
                "水素",
                "メタン"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成によって二酸化炭素を吸収し、酸素を作り出します。"
        ),
        QuizQuestion(
            question: "雨はどのようにして発生しますか？",
            choices: [
                "水蒸気が冷えて水滴になる",
                "風が強くなる",
                "雲が地面に落ちる",
                "太陽が雲を引き寄せる"
            ],
            correctAnswerIndex: 0,
            explanation: "水蒸気が冷えて水滴となり、雨として地面に落ちます。"
        ),
        QuizQuestion(
            question: "電池がなくなったとき、電気はどうなりますか？",
            choices: [
                "電気が流れなくなる",
                "電気が強くなる",
                "電気が止まらない",
                "電気が逆流する"
            ],
            correctAnswerIndex: 0,
            explanation: "電池がなくなると、電気は流れなくなります。"
        ),
        QuizQuestion(
            question: "ガラスに光が当たると何が起こりますか？",
            choices: [
                "光が反射する",
                "光が吸収される",
                "光が通り抜ける",
                "光が消える"
            ],
            correctAnswerIndex: 2,
            explanation: "ガラスに光が当たると、一部は反射しますが、多くは通り抜けます。"
        ),
        QuizQuestion(
            question: "静電気が発生する原因は何ですか？",
            choices: [
                "物体同士の摩擦",
                "温度の変化",
                "湿度の低下",
                "光の照射"
            ],
            correctAnswerIndex: 0,
            explanation: "静電気は、物体同士がこすれ合うことで発生します。"
        ),
        QuizQuestion(
            question: "電気の回路が閉じているとき、電気はどう流れますか？",
            choices: [
                "電気が流れる",
                "電気が止まる",
                "電気が反射する",
                "電気が消える"
            ],
            correctAnswerIndex: 0,
            explanation: "電気回路が閉じていると、電気は途切れずに流れます。"
        ),
        QuizQuestion(
            question: "水が沸騰すると、何に変わりますか？",
            choices: [
                "水蒸気",
                "氷",
                "砂",
                "火"
            ],
            correctAnswerIndex: 0,
            explanation: "水が沸騰すると水蒸気に変わります。"
        ),
        QuizQuestion(
            question: "太陽はどのようなエネルギーを地球に与えていますか？",
            choices: [
                "風",
                "熱",
                "音",
                "磁力"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は熱と光のエネルギーを地球に与えています。"
        ),
        QuizQuestion(
            question: "水を冷凍庫に入れるとどうなりますか？",
            choices: [
                "水蒸気になる",
                "氷になる",
                "水のまま",
                "蒸発する"
            ],
            correctAnswerIndex: 1,
            explanation: "水を冷凍庫に入れると、氷になります。"
        ),
        QuizQuestion(
            question: "植物は何を使って光合成を行いますか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は二酸化炭素を使って光合成を行います。"
        ),
        QuizQuestion(
            question: "金属に電気を通すと何が起こりますか？",
            choices: [
                "熱が発生する",
                "冷たくなる",
                "色が変わる",
                "透明になる"
            ],
            correctAnswerIndex: 0,
            explanation: "金属に電気を通すと、熱が発生することがあります。"
        ),
        QuizQuestion(
            question: "電球がつかない原因はどれですか？",
            choices: [
                "電気が弱い",
                "回路が閉じていない",
                "電球が大きすぎる",
                "電気が強すぎる"
            ],
            correctAnswerIndex: 1,
            explanation: "回路が閉じていないと、電球はつきません。"
        ),
        QuizQuestion(
            question: "水が蒸発するとき、どのような変化が起こりますか？",
            choices: [
                "液体から気体になる",
                "固体から液体になる",
                "液体から固体になる",
                "気体から液体になる"
            ],
            correctAnswerIndex: 0,
            explanation: "水が蒸発すると、液体から気体に変化します。"
        ),
        QuizQuestion(
            question: "風はどのようにして発生しますか？",
            choices: [
                "空気が温められる",
                "太陽が照る",
                "空気が冷える",
                "空気が動く"
            ],
            correctAnswerIndex: 3,
            explanation: "風は、空気が動くことで発生します。"
        ),
        QuizQuestion(
            question: "雲ができるのは、どのような現象ですか？",
            choices: [
                "蒸発",
                "凝結",
                "昇華",
                "融解"
            ],
            correctAnswerIndex: 1,
            explanation: "雲は、水蒸気が冷えて凝結することでできます。"
        ),
        QuizQuestion(
            question: "光はどのようにして反射しますか？",
            choices: [
                "光が鏡に当たる",
                "光が吸収される",
                "光が曲がる",
                "光が消える"
            ],
            correctAnswerIndex: 0,
            explanation: "光が鏡や滑らかな面に当たると、反射します。"
        ),
        QuizQuestion(
            question: "雷が発生する原因はどれですか？",
            choices: [
                "雲の中の氷の粒どうしの摩擦",
                "風の強さ",
                "太陽の熱",
                "雲の動き"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は、雲の中で氷の粒どうしがぶつかり合って摩擦を起こすことで発生します。"
        ),
        QuizQuestion(
            question: "光が水に入るとどうなりますか？",
            choices: [
                "屈折する",
                "反射する",
                "消える",
                "跳ね返る"
            ],
            correctAnswerIndex: 0,
            explanation: "光が水に入ると、進む方向が屈折します。"
        ),
        QuizQuestion(
            question: "雷が発生するとき、何が空気中で起こっていますか？",
            choices: [
                "摩擦",
                "光の反射",
                "音の発生",
                "蒸発"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は、雲の中で摩擦が発生することで生じます。"
        ),
        QuizQuestion(
            question: "植物の根が行っている役割はどれですか？",
            choices: [
                "水を吸収する",
                "光を吸収する",
                "二酸化炭素を吸収する",
                "酸素を吸収する"
            ],
            correctAnswerIndex: 0,
            explanation: "植物の根は、水や栄養分を土から吸収します。"
        ),
        QuizQuestion(
            question: "水蒸気が冷やされると何が起こりますか？",
            choices: [
                "水になる",
                "氷になる",
                "蒸発する",
                "火になる"
            ],
            correctAnswerIndex: 0,
            explanation: "水蒸気が冷やされると、凝結して水になります。"
        ),
        QuizQuestion(
            question: "磁石が引きつける物質はどれですか？",
            choices: [
                "鉄",
                "プラスチック",
                "木",
                "紙"
            ],
            correctAnswerIndex: 0,
            explanation: "鉄は磁石に引きつけられる物質の一つです。"
        ),
        QuizQuestion(
            question: "地球の自転は何時間で一周しますか？",
            choices: [
                "24時間",
                "12時間",
                "48時間",
                "6時間"
            ],
            correctAnswerIndex: 0,
            explanation: "地球の自転は24時間で一周します。"
        ),
        QuizQuestion(
            question: "水に溶けやすい物質はどれですか？",
            choices: [
                "塩",
                "鉄",
                "プラスチック",
                "木"
            ],
            correctAnswerIndex: 0,
            explanation: "塩は水に溶けやすい物質の一つです。"
        ),
        QuizQuestion(
            question: "植物が光合成を行うために必要なものはどれですか？",
            choices: [
                "光",
                "音",
                "風",
                "土"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成を行うために光が必要です。"
        ),
        QuizQuestion(
            question: "太陽が東から昇り、西に沈むのは何の現象ですか？",
            choices: [
                "地球の自転",
                "地球の公転",
                "月の自転",
                "月の公転"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽が昇って沈むのは、地球の自転による現象です。"
        ),
        QuizQuestion(
            question: "音はどのように伝わりますか？",
            choices: [
                "空気の振動",
                "光の反射",
                "風の力",
                "水の流れ"
            ],
            correctAnswerIndex: 0,
            explanation: "音は空気の振動によって伝わります。"
        ),
        QuizQuestion(
            question: "太陽から地球に届くエネルギーはどれですか？",
            choices: [
                "光エネルギー",
                "風エネルギー",
                "音エネルギー",
                "磁気エネルギー"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽は光エネルギーを地球に届けます。"
        ),
        QuizQuestion(
            question: "水蒸気が上空で冷やされると何になりますか？",
            choices: [
                "雨",
                "氷",
                "風",
                "霧"
            ],
            correctAnswerIndex: 0,
            explanation: "水蒸気が上空で冷やされると雨になります。"
        ),
        QuizQuestion(
            question: "電気を通さない物質はどれですか？",
            choices: [
                "ゴム",
                "銅",
                "鉄",
                "アルミ"
            ],
            correctAnswerIndex: 0,
            explanation: "ゴムは電気を通さない絶縁体です。"
        ),
        QuizQuestion(
            question: "植物が光合成を行うのに必要な成分は何ですか？",
            choices: [
                "二酸化炭素",
                "酸素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成のために二酸化炭素を必要とします。"
        ),
        QuizQuestion(
            question: "地球の表面の大部分を占めるのは何ですか？",
            choices: [
                "水",
                "土",
                "氷",
                "岩"
            ],
            correctAnswerIndex: 0,
            explanation: "地球の表面の約70％は水で覆われています。"
        ),
        QuizQuestion(
            question: "磁石が引き寄せる金属はどれですか？",
            choices: [
                "鉄",
                "銅",
                "アルミ",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "鉄は磁石に引き寄せられる金属です。"
        ),
        QuizQuestion(
            question: "酸素はどこで最も多く存在していますか？",
            choices: [
                "空気中",
                "水中",
                "地面",
                "雲"
            ],
            correctAnswerIndex: 0,
            explanation: "酸素は空気中に最も多く存在します。"
        ),
        QuizQuestion(
            question: "雷が鳴るとき、雲の中で起こっている現象は何ですか？",
            choices: [
                "氷の粒どうしの摩擦",
                "水の蒸発",
                "風の強まり",
                "光の反射"
            ],
            correctAnswerIndex: 0,
            explanation: "雷が発生するのは、雲の中で氷の粒どうしがぶつかり合う摩擦によるものです。"
        ),
        QuizQuestion(
            question: "太陽が地球に与える影響はどれですか？",
            choices: [
                "地球を温める",
                "地球を冷やす",
                "地球を縮める",
                "地球を飛ばす"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽は地球を温め、生命を育む重要な役割を担っています。"
        ),
        QuizQuestion(
            question: "音はどのようにして伝わりますか？",
            choices: [
                "空気の振動",
                "水の波",
                "光の反射",
                "風の流れ"
            ],
            correctAnswerIndex: 0,
            explanation: "音は空気の振動によって伝わります。"
        ),
        QuizQuestion(
            question: "地球の公転により起こる現象はどれですか？",
            choices: [
                "季節の変化",
                "昼と夜の変化",
                "月の満ち欠け",
                "天気の変化"
            ],
            correctAnswerIndex: 0,
            explanation: "地球の公転により、季節の変化が起こります。"
        ),
        QuizQuestion(
            question: "水を熱すると、どのような変化が起こりますか？",
            choices: [
                "水蒸気になる",
                "氷になる",
                "透明になる",
                "色が変わる"
            ],
            correctAnswerIndex: 0,
            explanation: "水を熱すると水蒸気に変わります。"
        ),
        QuizQuestion(
            question: "月が地球を一周するのにかかる時間はどれですか？",
            choices: [
                "約1か月",
                "約1日",
                "約1週間",
                "約1年"
            ],
            correctAnswerIndex: 0,
            explanation: "月が地球を一周するのにかかる時間は約1か月です。"
        ),
        QuizQuestion(
            question: "太陽光が地球に与えるエネルギーは何ですか？",
            choices: [
                "光と熱",
                "風と雨",
                "磁力",
                "音"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽光は地球に光と熱のエネルギーを与えます。"
        ),
        QuizQuestion(
            question: "音が伝わるために必要なものは何ですか？",
            choices: [
                "空気",
                "光",
                "水",
                "風"
            ],
            correctAnswerIndex: 0,
            explanation: "音は空気の振動を通して伝わります。"
        ),
        QuizQuestion(
            question: "植物が成長するために必要な要素はどれですか？",
            choices: [
                "光",
                "音",
                "火",
                "風"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は成長するために光が必要です。"
        ),
        QuizQuestion(
            question: "磁石が引きつける物質はどれですか？",
            choices: [
                "鉄",
                "ガラス",
                "プラスチック",
                "木"
            ],
            correctAnswerIndex: 0,
            explanation: "鉄は磁石に引きつけられます。"
        ),
        QuizQuestion(
            question: "雷はどのようにして発生しますか？",
            choices: [
                "雲の中の氷の粒どうしの摩擦で発生する",
                "風が強くなることで発生する",
                "太陽が照りつけることで発生する",
                "月の光で発生する"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は、雲の中で氷の粒どうしがぶつかり合う摩擦によって発生します。"
        ),
        QuizQuestion(
            question: "水が固体になると、何になりますか？",
            choices: [
                "氷",
                "水蒸気",
                "風",
                "霧"
            ],
            correctAnswerIndex: 0,
            explanation: "水が固体になると氷になります。"
        ),
        QuizQuestion(
            question: "地球の自転が原因で起こる現象はどれですか？",
            choices: [
                "昼と夜の変化",
                "季節の変化",
                "月の満ち欠け",
                "星の動き"
            ],
            correctAnswerIndex: 0,
            explanation: "地球の自転によって昼と夜の変化が起こります。"
        ),
        QuizQuestion(
            question: "金属を加熱するとどうなりますか？",
            choices: [
                "熱くなる",
                "冷たくなる",
                "溶ける",
                "膨らむ"
            ],
            correctAnswerIndex: 0,
            explanation: "金属は加熱すると熱くなり、場合によっては溶けますが、一般的には温度が上がります。"
        ),
        QuizQuestion(
            question: "風が吹く原因はどれですか？",
            choices: [
                "空気の温度差",
                "月の引力",
                "海の波",
                "雲の動き"
            ],
            correctAnswerIndex: 0,
            explanation: "風は、空気の温度差によって生じる気圧差により発生します。"
        ),
        QuizQuestion(
            question: "水を冷やし続けると、最終的にどうなりますか？",
            choices: [
                "氷になる",
                "水蒸気になる",
                "温度が変わらない",
                "泡が出る"
            ],
            correctAnswerIndex: 0,
            explanation: "水を冷やし続けると、凍結して氷になります。"
        ),
        QuizQuestion(
            question: "音が強く聞こえるとき、それは何が原因ですか？",
            choices: [
                "振動の大きさ",
                "振動の速さ",
                "空気の重さ",
                "光の反射"
            ],
            correctAnswerIndex: 0,
            explanation: "音が強く聞こえるのは、振動の大きさが大きいためです。"
        ),
        QuizQuestion(
            question: "太陽のエネルギーによって起こる現象はどれですか？",
            choices: [
                "気温の上昇",
                "月の満ち欠け",
                "雷の発生",
                "地球の自転"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽のエネルギーによって気温が上昇します。"
        ),
        QuizQuestion(
            question: "植物が光合成で作り出すものはどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成によって酸素を作り出します。"
        ),
        QuizQuestion(
            question: "雷が発生する原因は何ですか？",
            choices: [
                "雲の中の氷の粒の摩擦",
                "太陽の光",
                "月の引力",
                "風の強さ"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は、雲の中で氷の粒どうしがぶつかり合う摩擦によって発生します。"
        ),
        QuizQuestion(
            question: "植物が育つために最も必要なものはどれですか？",
            choices: [
                "光",
                "音",
                "風",
                "雪"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光を使って成長します。光は光合成に必要です。"
        ),
        QuizQuestion(
            question: "水に砂を入れるとどうなりますか？",
            choices: [
                "砂が沈む",
                "砂が溶ける",
                "砂が浮く",
                "砂が燃える"
            ],
            correctAnswerIndex: 0,
            explanation: "砂は水に溶けず、底に沈みます。"
        ),
        QuizQuestion(
            question: "音が空気中で伝わる仕組みはどれですか？",
            choices: [
                "空気の振動",
                "光の反射",
                "水の流れ",
                "温度の変化"
            ],
            correctAnswerIndex: 0,
            explanation: "音は空気の振動によって伝わります。"
        ),
        QuizQuestion(
            question: "水が沸騰すると、どのような変化が起こりますか？",
            choices: [
                "氷になる",
                "水蒸気になる",
                "水が消える",
                "色が変わる"
            ],
            correctAnswerIndex: 1,
            explanation: "水が沸騰すると、水蒸気に変わります。"
        ),
        QuizQuestion(
            question: "太陽はどのようなエネルギーを地球に与えていますか？",
            choices: [
                "風",
                "光",
                "音",
                "水"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は地球に光エネルギーを与えています。"
        ),
        QuizQuestion(
            question: "植物はどのようにして成長しますか？",
            choices: [
                "水だけを使って",
                "酸素を吸って",
                "光合成を行って",
                "土の中に隠れて"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は光合成を行い、エネルギーを得て成長します。"
        ),
        QuizQuestion(
            question: "雷が鳴る原因は何ですか？",
            choices: [
                "風の強さ",
                "雲の中の摩擦",
                "太陽の熱",
                "月の引力"
            ],
            correctAnswerIndex: 1,
            explanation: "雷は、雲の中で発生する摩擦によって起こります。"
        ),
        QuizQuestion(
            question: "風が吹く主な原因はどれですか？",
            choices: [
                "空気の温度差",
                "地球の回転",
                "月の動き",
                "太陽の引力"
            ],
            correctAnswerIndex: 0,
            explanation: "風は、空気の温度差によって生じる気圧差が原因です。"
        ),
        QuizQuestion(
            question: "音はどのようにして私たちの耳に届きますか？",
            choices: [
                "光に乗って伝わる",
                "空気の振動によって伝わる",
                "水に乗って伝わる",
                "風に押されて伝わる"
            ],
            correctAnswerIndex: 1,
            explanation: "音は、空気の振動によって私たちの耳に届きます。"
        ),
        QuizQuestion(
            question: "水に砂糖を入れるとどうなりますか？",
            choices: [
                "沈む",
                "溶ける",
                "浮く",
                "消える"
            ],
            correctAnswerIndex: 1,
            explanation: "砂糖は水に溶けて、見えなくなりますが、存在しています。"
        ),
        QuizQuestion(
            question: "電気が流れるために必要な要素はどれですか？",
            choices: [
                "プラスチック",
                "導線",
                "木",
                "ガラス"
            ],
            correctAnswerIndex: 1,
            explanation: "導線は、電気を流すために使われる材料です。"
        ),
        QuizQuestion(
            question: "太陽が地球に与える影響はどれですか？",
            choices: [
                "地球を冷やす",
                "地球を温める",
                "月を回す",
                "空気を冷やす"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は地球を温め、生命に必要なエネルギーを提供します。"
        ),
        QuizQuestion(
            question: "水が氷になるとき、何が起こりますか？",
            choices: [
                "水蒸気になる",
                "体積が増える",
                "体積が減る",
                "色が変わる"
            ],
            correctAnswerIndex: 1,
            explanation: "水が氷になると、体積が増えます。"
        ),

        QuizQuestion(
        question: "発芽の条件を調べる実験で、同じ条件の種子を1個ではなく10個ずつ使う主な理由はどれですか？",
        choices: [
        "種子ごとの違いによる影響を小さくするため",
        "発芽に必要な水をなくすため",
        "すべての種子を同時に冷やすため",
        "種子の種類を増やすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「種子ごとの違いによる影響を小さくするため」です。複数の種子を使うと、育ち方などの個体差による影響を小さくし、より確かな結果を得られます。"
        ),

        QuizQuestion(
        question: "種子を10個ずつ使ったところ、Aは「湿った脱脂綿・25℃・空気に触れる」で9個、Bは「乾いた脱脂綿・25℃・空気に触れる」で0個、Cは「湿った脱脂綿・5℃・空気に触れる」で0個、Dは「25℃の水中に沈める」で0個発芽しました。発芽に水が必要なことを確かめるには、どれとどれを比べますか？",
        choices: [
        "AとC",
        "AとB",
        "AとD",
        "BとC"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「AとB」です。AとBは温度と空気の条件が同じで、水を与えたかどうかだけが異なります。この2つを比べると、発芽に水が必要かを調べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】種子から発芽し、育ち始めたばかりの植物を何といいますか。",
        answer: "芽生え",
        acceptableAnswers: ["めばえ"],
        explanation: "種子から発芽し、育ち始めたばかりの植物を「芽生え」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】発芽の実験で行う工夫と、その目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "同じ種類の種子を10個ずつ使う", match: "種子ごとの違いによる影響を小さくする"),
        QuizMatchingPair(prompt: "すべての容器をA、B、Cなどで区別する", match: "条件や結果を取り違えないようにする"),
        QuizMatchingPair(prompt: "毎日ほぼ同じ時刻に観察する", match: "時間の経過による変化を比べやすくする"),
        QuizMatchingPair(prompt: "実験を始めた日と種子の数を記録する", match: "観察結果を正しく整理できるようにする")
        ],
        choices: [
        "観察結果を正しく整理できるようにする",
        "時間の経過による変化を比べやすくする",
        "種子ごとの違いによる影響を小さくする",
        "条件や結果を取り違えないようにする"
        ],
        explanation: "複数の種子を使うと個体差の影響を小さくできます。容器を区別し、観察時刻をそろえ、開始日や種子数を記録すると、結果を正しく整理して比較できます。"
        ),

        QuizQuestion.classification(
        question: "【分類】芽生えの観察内容を、「数値で記録する内容」「言葉や写真で記録する内容」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "根の長さが4.2 cm", match: "数値で記録する内容"),
        QuizMatchingPair(prompt: "発芽した種子が8個", match: "数値で記録する内容"),
        QuizMatchingPair(prompt: "子葉が黄色っぽくなった", match: "言葉や写真で記録する内容"),
        QuizMatchingPair(prompt: "根が曲がりながら下へ伸びた", match: "言葉や写真で記録する内容")
        ],
        categories: ["数値で記録する内容", "言葉や写真で記録する内容"],
        explanation: "長さや個数は数値で記録できます。色や形、伸びる向きなどのようすは、言葉や写真で記録すると変化が伝わりやすくなります。"
        ),

        QuizQuestion(
        question: "雲が動く方角を屋外で調べる方法として、最も適切なものはどれですか？",
        choices: [
        "目を閉じて風の音だけを聞く",
        "雲の色だけを一度観察する",
        "動かない建物などを目印にして、雲の位置の変化を見る",
        "観察するたびに立つ場所を大きく変える"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「動かない建物などを目印にして、雲の位置の変化を見る」です。動かない物を目印にして時間ごとの雲の位置を比べると、雲が動く方角を調べられます。"
        ),

        QuizQuestion(
        question: "20分間に6 mmの雨が降りました。同じ強さで1時間降り続いたとすると、降水量は何mmになりますか？",
        choices: [
        "12 mm",
        "6 mm",
        "24 mm",
        "18 mm"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「18 mm」です。1時間は20分の3倍なので、6×3＝18となり、降水量は18 mmです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】天気、気温、風、雲などのようすを調べて記録することを何といいますか。",
        answer: "観測",
        acceptableAnswers: ["かんそく"],
        explanation: "天気、気温、風、雲などのようすを調べて記録することを「観測」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】天気に関する資料や観察結果と、そこから考えられることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "西の空で雲がしだいに増えている", match: "このあと天気が悪くなる可能性がある"),
        QuizMatchingPair(prompt: "雨雲レーダーの雨雲が東へ進んでいる", match: "東側の地域であとから雨が降る可能性がある"),
        QuizMatchingPair(prompt: "時間の異なる雲画像で雲が少なくなっている", match: "天気が回復する可能性がある"),
        QuizMatchingPair(prompt: "雨量計の水が8 mmの目盛りまでたまった", match: "その測定時間の降水量は8 mmである")
        ],
        choices: [
        "天気が回復する可能性がある",
        "その測定時間の降水量は8 mmである",
        "このあと天気が悪くなる可能性がある",
        "東側の地域であとから雨が降る可能性がある"
        ],
        explanation: "雲が西から増えていれば天気が悪くなる可能性があります。東へ進む雨雲の東側ではあとから雨が降る可能性があり、雲が減れば天気の回復が考えられます。雨量計の目盛りは降水量を表します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】同じ場所で雲が動く方角を調べる手順を、正しい順に並べましょう。",
        choices: [
        "決めた時間がたったら、同じ場所からもう一度撮影する",
        "2枚の写真で雲の位置を比べ、動いた方角を記録する",
        "動かない建物など、雲の位置を比べる目印を決める",
        "目印と雲が一緒に写るように最初の写真を撮る"
        ],
        orderedChoices: [
        "動かない建物など、雲の位置を比べる目印を決める",
        "目印と雲が一緒に写るように最初の写真を撮る",
        "決めた時間がたったら、同じ場所からもう一度撮影する",
        "2枚の写真で雲の位置を比べ、動いた方角を記録する"
        ],
        explanation: "初めに動かない目印を決めて撮影し、一定時間後に同じ場所から再び撮影します。2枚の写真を比べると、雲が動いた方角を判断できます。"
        ),

        QuizQuestion(
        question: "大雨のあとに川の水が茶色くにごる主な理由はどれですか？",
        choices: [
        "流れる水が土をけずり、細かい土を運んでいるから",
        "川の水がすべて泥に変わるから",
        "川底の石が水に溶けて茶色になるから",
        "雨水が川の流れを止めるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「流れる水が土をけずり、細かい土を運んでいるから」です。大雨で流れが強くなると、地面をけずる侵食と、土砂を運ぶ運搬のはたらきが強くなります。"
        ),

        QuizQuestion(
        question: "川の水が急に増え、避難に関する情報が出たときの行動として最も適切なものはどれですか？",
        choices: [
        "川岸へ行って水位を近くで観察する",
        "川から離れ、決められた安全な場所へ移動する",
        "橋の上に立って写真を撮る",
        "中州に移動して水が減るのを待つ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「川から離れ、決められた安全な場所へ移動する」です。増水した川や橋、中州には近づかず、避難情報に従って安全な場所へ移動します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】川の水面の高さを何といいますか。",
        answer: "水位",
        acceptableAnswers: ["すいい"],
        explanation: "川の水面の高さを「水位」といいます。大雨などで川の水が増えると、水位が上がります。"
        ),

        QuizQuestion.classification(
        question: "【分類】洪水に備える行動を、「日ごろの備え」「大雨のときの行動」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "地域のハザードマップを確認する", match: "日ごろの備え"),
        QuizMatchingPair(prompt: "非常持ち出し品を用意しておく", match: "日ごろの備え"),
        QuizMatchingPair(prompt: "川や用水路からすぐに離れる", match: "大雨のときの行動"),
        QuizMatchingPair(prompt: "避難情報を確認して安全な場所へ移動する", match: "大雨のときの行動")
        ],
        categories: ["日ごろの備え", "大雨のときの行動"],
        explanation: "ハザードマップの確認や非常持ち出し品の準備は日ごろ行います。大雨のときは川から離れ、避難情報を確認して安全な場所へ移動します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ時間に浮かべた木片が進んだ距離をもとに、水の流れが速い順に並べましょう。",
        choices: [
        "水路A：60 cm",
        "水路B：140 cm",
        "水路C：25 cm",
        "水路D：95 cm"
        ],
        rankedChoices: [
        "水路B：140 cm",
        "水路D：95 cm",
        "水路A：60 cm",
        "水路C：25 cm"
        ],
        explanation: "進んだ時間が同じなら、木片が遠くまで進んだ水路ほど流れが速いと判断できます。140 cm、95 cm、60 cm、25 cmの順です。"
        ),

        QuizQuestion(
        question: "同じ量・同じ温度の水に、溶ける限度より少ない同じ量の砂糖を入れ、一方だけをかき混ぜました。結果として正しいものはどれですか？",
        choices: [
        "かき混ぜたほうだけ、最終的に2倍の砂糖が溶ける",
        "かき混ぜないほうが必ず速く溶ける",
        "かき混ぜたほうが速く溶けるが、最終的に溶ける量は同じ",
        "かき混ぜると砂糖が水に溶けなくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「かき混ぜたほうが速く溶けるが、最終的に溶ける量は同じ」です。かき混ぜると溶ける速さは大きくなりますが、同じ水量と温度で溶ける限度は変わりません。"
        ),

        QuizQuestion(
        question: "20℃と60℃の水を100 gずつ用意し、それぞれにミョウバンを5 g入れたところ、どちらもすべて溶けました。この結果だけで、60℃の水のほうが多く溶かせるといえますか？",
        choices: [
        "20℃の水だけが透明なのでいえる",
        "5 gずつ入れたので必ずいえる",
        "水の量が同じなので必ずいえる",
        "どちらも限度に達していないため、この結果だけではいえない"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「どちらも限度に達していないため、この結果だけではいえない」です。温度による溶ける限度の違いを調べるには、溶け残りが出るまで少しずつ加え、溶けた量を比べる必要があります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ろ過をしたとき、ろ紙を通り抜けて下の容器にたまった液を何といいますか。",
        answer: "ろ液",
        acceptableAnswers: ["ろえき", "濾液"],
        explanation: "ろ過によってろ紙を通り抜け、下の容器にたまった液を「ろ液」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水溶液を調べたときの結果と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "透明な食塩水をろ過しても、ろ液に塩味があった", match: "溶けた食塩は水とともにろ紙を通る"),
        QuizMatchingPair(prompt: "同じ食塩水を同じ量ずつ分けた", match: "分けた2つの水溶液の濃さは同じである"),
        QuizMatchingPair(prompt: "食塩水に水だけを加えた", match: "食塩水の濃さがうすくなる"),
        QuizMatchingPair(prompt: "熱いミョウバン水溶液をゆっくり冷やした", match: "ミョウバンの結晶が出ることがある")
        ],
        choices: [
        "食塩水の濃さがうすくなる",
        "ミョウバンの結晶が出ることがある",
        "溶けた食塩は水とともにろ紙を通る",
        "分けた2つの水溶液の濃さは同じである"
        ],
        explanation: "溶けた食塩はろ紙を通り、水溶液全体に同じように広がっています。水だけを加えると濃さはうすくなり、熱いミョウバン水溶液を冷やすと結晶が出ることがあります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】かき混ぜることが砂糖の溶ける速さに関係するかを調べる手順を、正しい順に並べましょう。",
        choices: [
        "一方だけを決めた速さでかき混ぜ、もう一方はそのままにする",
        "砂糖が見えなくなるまでの時間を比べる",
        "同じ量・同じ温度の水を2つの容器に入れる",
        "同じ粒の大きさの砂糖を同じ量ずつ同時に入れる"
        ],
        orderedChoices: [
        "同じ量・同じ温度の水を2つの容器に入れる",
        "同じ粒の大きさの砂糖を同じ量ずつ同時に入れる",
        "一方だけを決めた速さでかき混ぜ、もう一方はそのままにする",
        "砂糖が見えなくなるまでの時間を比べる"
        ],
        explanation: "水の量や温度、砂糖の量と粒の大きさをそろえ、かき混ぜるかどうかだけを変えます。砂糖が見えなくなるまでの時間を比べると、溶ける速さへの影響を調べられます。"
        ),

        QuizQuestion(
        question: "振り子Aは12往復に18秒、振り子Bは20往復に30秒かかりました。1往復する時間について正しいものはどれですか？",
        choices: [
        "AとBはどちらも1.5秒で同じ",
        "Aは1.5秒、Bは2.5秒",
        "Aは6秒、Bは10秒",
        "Aは18秒、Bは30秒"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「AとBはどちらも1.5秒で同じ」です。Aは18÷12＝1.5秒、Bは30÷20＝1.5秒なので、1往復する時間は同じです。"
        ),

        QuizQuestion(
        question: "振り子をしばらく動かすと、空気の抵抗などによって振れ幅が少しずつ小さくなりました。小さな振れ幅の範囲では、1往復する時間はどうなりますか？",
        choices: [
        "振れ幅と同じ割合で短くなり続ける",
        "ほとんど変わらない",
        "毎回2倍ずつ長くなる",
        "おもりの重さと同じ秒数になる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「ほとんど変わらない」です。小さな振れ幅の範囲では、振れ幅が少し変わっても、振り子が1往復する時間はほとんど変わりません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】物が同じ動きをくり返し、行ったり来たりすることを何といいますか。",
        answer: "振動",
        acceptableAnswers: ["しんどう"],
        explanation: "物が同じ動きをくり返し、行ったり来たりすることを「振動」といいます。振り子の動きも振動の一つです。"
        ),

        QuizQuestion.classification(
        question: "【分類】振り子の動きを、「1往復」「半往復」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "左端から右端へ進み、再び左端へ戻る", match: "1往復"),
        QuizMatchingPair(prompt: "右端から左端へ進み、再び右端へ戻る", match: "1往復"),
        QuizMatchingPair(prompt: "左端から右端まで進む", match: "半往復"),
        QuizMatchingPair(prompt: "中央から右端へ進み、再び中央へ戻る", match: "半往復")
        ],
        categories: ["1往復", "半往復"],
        explanation: "一方の端から反対側の端へ進み、元の端まで戻る動きが1往復です。一方の端から反対側の端までや、中央から端を通って中央までの動きは半往復です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】おもりの重さと振れ幅が同じ振り子を、糸が長いと考えられる順に並べましょう。",
        choices: [
        "振り子A：1往復に1.1秒",
        "振り子B：1往復に1.9秒",
        "振り子C：1往復に1.4秒",
        "振り子D：1往復に1.6秒"
        ],
        rankedChoices: [
        "振り子B：1往復に1.9秒",
        "振り子D：1往復に1.6秒",
        "振り子C：1往復に1.4秒",
        "振り子A：1往復に1.1秒"
        ],
        explanation: "ほかの条件が同じなら、1往復する時間が長いほど糸も長いと考えられます。したがって、B、D、C、Aの順です。"
        ),

        QuizQuestion(
        question: "鉄しんを入れていないコイルに電流を流したところ、近くの方位磁針の針が動きました。このことから何がわかりますか？",
        choices: [
        "鉄しんがないと電流は流れない",
        "方位磁針がコイルに電流をつくった",
        "鉄しんがなくても、電流が流れるコイルには磁力が生じる",
        "コイルは電流を流すと必ず永久磁石になる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「鉄しんがなくても、電流が流れるコイルには磁力が生じる」です。コイルそのものにも磁力が生じ、鉄しんを入れるとその磁力をさらに強くできます。"
        ),

        QuizQuestion(
        question: "同じ100回巻きのコイルに同じ電流を流しました。鉄しんなしではクリップを1個、鉄しんありでは8個持ち上げました。この結果からいえることはどれですか？",
        choices: [
        "鉄しんを入れると電流が流れなくなる",
        "鉄しんを入れると必ず極がなくなる",
        "鉄しんなしのほうが電磁石は強い",
        "コイルに鉄しんを入れると電磁石が強くなる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「コイルに鉄しんを入れると電磁石が強くなる」です。コイルや電流を同じにして鉄しんの有無だけを変えたところ、鉄しんありのほうが多くのクリップを持ち上げました。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石の実験結果と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "電磁石の端Xが方位磁針のN極をしりぞけた", match: "端XはN極である"),
        QuizMatchingPair(prompt: "乾電池の向きを反対にすると、端Xが方位磁針のN極を引きつけた", match: "電流の向きを変えると極が入れ替わる"),
        QuizMatchingPair(prompt: "100回巻きより200回巻きのほうが多くのクリップを持ち上げた", match: "巻き数を増やすと電磁石が強くなる"),
        QuizMatchingPair(prompt: "スイッチを切ると持ち上げていたクリップが落ちた", match: "電流を止めると磁力がほぼなくなる")
        ],
        choices: [
        "巻き数を増やすと電磁石が強くなる",
        "電流を止めると磁力がほぼなくなる",
        "端XはN極である",
        "電流の向きを変えると極が入れ替わる"
        ],
        explanation: "方位磁針のN極をしりぞける端はN極です。電流の向きを変えると極が入れ替わり、巻き数を増やすと磁力が強くなります。電流を止めると磁力はほぼなくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】電磁石に加えた変化を、「極の向きが変わる」「磁力の強さが変わる」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乾電池の向きを反対にする", match: "極の向きが変わる"),
        QuizMatchingPair(prompt: "コイルを巻く向きを反対にする", match: "極の向きが変わる"),
        QuizMatchingPair(prompt: "同じ向きのままコイルの巻き数を増やす", match: "磁力の強さが変わる"),
        QuizMatchingPair(prompt: "コイルの中に鉄しんを入れる", match: "磁力の強さが変わる")
        ],
        categories: ["極の向きが変わる", "磁力の強さが変わる"],
        explanation: "乾電池の向きやコイルを巻く向きを反対にすると、N極とS極が入れ替わります。巻き数を増やしたり鉄しんを入れたりすると、主に磁力の強さが変わります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】電流が流れるコイルに磁力が生じることを、方位磁針で確かめる手順を正しい順に並べましょう。",
        choices: [
        "スイッチを入れ、方位磁針の針の動きを記録する",
        "コイル、乾電池、スイッチを回路につなぐ",
        "スイッチを切り、針が元の向きに戻るか確かめる",
        "スイッチを切った状態で、コイルの近くに方位磁針を置く"
        ],
        orderedChoices: [
        "コイル、乾電池、スイッチを回路につなぐ",
        "スイッチを切った状態で、コイルの近くに方位磁針を置く",
        "スイッチを入れ、方位磁針の針の動きを記録する",
        "スイッチを切り、針が元の向きに戻るか確かめる"
        ],
        explanation: "回路をつないでから、電流を流していないときの方位磁針を確認します。スイッチを入れたときの針の動きを記録し、切ったときに元へ戻るかを確かめます。"
        ),

        QuizQuestion(
        question: "乾いたインゲンマメの種子を水に一晩つけると、つける前より重くなりました。主な理由はどれですか？",
        choices: [
        "種子が水を吸ったから",
        "種子の中に土ができたから",
        "種子が空気をすべて外へ出したから",
        "子葉が新しく増えたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「種子が水を吸ったから」です。乾いた種子は発芽の準備として水を吸うため、水につけた後は重さが増えます。"
        ),

        QuizQuestion(
        question: "インゲンマメが発芽するとき、根が先に出ることにはどのような利点がありますか？",
        choices: [
        "種子を空中へ持ち上げられる",
        "水を取り入れ、体を地面に支えられる",
        "日光を受けてすぐに花を咲かせられる",
        "子葉を新しい種皮で包める"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「水を取り入れ、体を地面に支えられる」です。先に伸びた根は水を取り入れるとともに、育ち始めた植物の体を地面に支えます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】種子の中にあり、これから新しい植物の体になる部分をまとめて何といいますか。",
        answer: "胚",
        acceptableAnswers: ["はい"],
        explanation: "種子の中で、これから新しい植物の体になる部分をまとめて「胚」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】発芽の実験で見られた結果と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水につけた種子の重さが増えた", match: "種子が水を吸った"),
        QuizMatchingPair(prompt: "湿らせた脱脂綿の種子だけが発芽した", match: "発芽には水が必要である"),
        QuizMatchingPair(prompt: "暖かい場所の種子だけが発芽した", match: "発芽には適した温度が必要である"),
        QuizMatchingPair(prompt: "発芽後の子葉のヨウ素液による色がうすくなった", match: "子葉のでんぷんが成長に使われた")
        ],
        choices: [
        "子葉のでんぷんが成長に使われた",
        "発芽には水が必要である",
        "種子が水を吸った",
        "発芽には適した温度が必要である"
        ],
        explanation: "種子の重さの増加は吸水、水を与えた種子だけの発芽は水の必要性、暖かい場所だけの発芽は適温の必要性を示します。ヨウ素液の色がうすくなったことから、子葉のでんぷんが使われたとわかります。"
        ),

        QuizQuestion.classification(
        question: "【分類】インゲンマメの種子に見られる変化を、「発芽前の変化」「発芽したと判断できる変化」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水を吸って種子がふくらむ", match: "発芽前の変化"),
        QuizMatchingPair(prompt: "種皮がやわらかくなる", match: "発芽前の変化"),
        QuizMatchingPair(prompt: "種皮を破って根が外へ出る", match: "発芽したと判断できる変化"),
        QuizMatchingPair(prompt: "出た根がさらに長く伸びる", match: "発芽したと判断できる変化")
        ],
        categories: ["発芽前の変化", "発芽したと判断できる変化"],
        explanation: "種子が水を吸ってふくらみ、種皮がやわらかくなるのは発芽前の変化です。根が種皮の外へ出れば発芽したと判断でき、その後、根はさらに伸びます。"
        ),

        QuizQuestion(
        question: "百葉箱が白くぬられている主な理由はどれですか？",
        choices: [
        "雨水を多く集めるため",
        "中を暗くして雲量を測るため",
        "日光の熱を吸収しにくくするため",
        "風が入らないようにするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「日光の熱を吸収しにくくするため」です。白色は日光を反射しやすく、箱そのものが熱くなって気温の測定に影響するのを防ぎます。"
        ),

        QuizQuestion(
        question: "南西の風が吹いているとき、空気は主にどの方角へ進みますか？",
        choices: [
        "南西",
        "南東",
        "北西",
        "北東"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「北東」です。南西の風は南西から吹いてくる風なので、空気は反対側の北東へ進みます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】風の強さを段階で表したものを何といいますか。",
        answer: "風力",
        acceptableAnswers: ["ふうりょく"],
        explanation: "風の強さを段階で表したものを「風力」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】天気の観測で不適切な置き方や測り方と、起こりやすい問題を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "温度計を直射日光に当てる", match: "実際の気温より高く読みやすい"),
        QuizMatchingPair(prompt: "雨量計を大きな木の下に置く", match: "雨がさえぎられて少なく測りやすい"),
        QuizMatchingPair(prompt: "風向計を高い壁のすぐそばに置く", match: "建物の影響で風向を正しく測りにくい"),
        QuizMatchingPair(prompt: "観察する時刻を毎日変える", match: "日ごとの変化を公平に比べにくい")
        ],
        choices: [
        "建物の影響で風向を正しく測りにくい",
        "日ごとの変化を公平に比べにくい",
        "雨がさえぎられて少なく測りやすい",
        "実際の気温より高く読みやすい"
        ],
        explanation: "直射日光は温度計を温め、木は雨をさえぎります。壁の近くでは風向が乱れやすく、観察時刻が違うと日ごとの値を公平に比較できません。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】屋外で気温を測る手順を、正しい順に並べましょう。",
        choices: [
        "液の先が止まったら、目盛りと同じ高さから読む",
        "直射日光の当たらない風通しのよい場所に温度計を置く",
        "測った時刻と気温を記録する",
        "温度計を置いたまま、液の先が動かなくなるまで待つ"
        ],
        orderedChoices: [
        "直射日光の当たらない風通しのよい場所に温度計を置く",
        "温度計を置いたまま、液の先が動かなくなるまで待つ",
        "液の先が止まったら、目盛りと同じ高さから読む",
        "測った時刻と気温を記録する"
        ],
        explanation: "温度計を日光の当たらない風通しのよい場所に置き、示す値が安定するまで待ちます。目盛りと同じ高さから読み、時刻とともに記録します。"
        ),

        QuizQuestion(
        question: "川の中に大きな岩があり、その岩のすぐ下流側に砂がたまっていました。主な理由はどれですか？",
        choices: [
        "岩の後ろで流れが弱まり、砂を運ぶ力が小さくなったから",
        "岩が砂を水に溶かしたから",
        "岩の後ろだけ川底が上向きに動いたから",
        "砂が流れに逆らって上流から集まったから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「岩の後ろで流れが弱まり、砂を運ぶ力が小さくなったから」です。流れが遅くなる場所では、運ばれてきた砂が堆積しやすくなります。"
        ),

        QuizQuestion(
        question: "大雨による川の増水に備えて、地域のハザードマップを確認する目的として最も適切なものはどれですか？",
        choices: [
        "川の石の色を調べるため",
        "浸水しやすい場所や避難経路を知るため",
        "雨雲を消す場所を決めるため",
        "川の流れを反対向きにするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「浸水しやすい場所や避難経路を知るため」です。ハザードマップでは、洪水などで危険が予想される区域や避難場所、避難経路を確認できます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】降った雨が同じ川へ集まって流れ込む土地の範囲を何といいますか。",
        answer: "流域",
        acceptableAnswers: ["りゅういき"],
        explanation: "降った雨が同じ川へ集まって流れ込む土地の範囲を「流域」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】川の観察結果を、「流れが速いと考えられる」「流れが遅いと考えられる」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "浮かべた小枝が10秒で遠くまで進む", match: "流れが速いと考えられる"),
        QuizMatchingPair(prompt: "曲がった川の外側の岸がけずられている", match: "流れが速いと考えられる"),
        QuizMatchingPair(prompt: "砂の中州ができている", match: "流れが遅いと考えられる"),
        QuizMatchingPair(prompt: "細かい泥が川底に積もっている", match: "流れが遅いと考えられる")
        ],
        categories: ["流れが速いと考えられる", "流れが遅いと考えられる"],
        explanation: "物が短時間で遠くへ進む場所や岸が強くけずられる場所では、流れが速いと考えられます。砂や泥が積もる場所では、流れが遅く運搬の力が弱くなっています。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ材質の土砂が流れの速い水で運ばれたあと、水の流れが急に止まりました。先に積もりやすい順に並べましょう。",
        choices: [
        "直径0.2 mmの細かい砂",
        "直径10 mmの小石",
        "直径0.02 mmの泥",
        "直径2 mmの粗い砂"
        ],
        rankedChoices: [
        "直径10 mmの小石",
        "直径2 mmの粗い砂",
        "直径0.2 mmの細かい砂",
        "直径0.02 mmの泥"
        ],
        explanation: "同じ材質なら、粒が大きく重いものほど水の流れが弱まったときに先に沈みます。小石、粗い砂、細かい砂、泥の順です。"
        ),

        QuizQuestion(
        question: "同じ量・同じ温度の水に、同じ量の食塩を入れます。食塩の粒を細かくくだいた場合、くだかない場合と比べてどうなりますか？",
        choices: [
        "溶ける速さも溶ける限度も必ず小さくなる",
        "溶ける速さは同じで、溶ける限度だけ大きくなる",
        "溶ける速さは大きくなるが、溶ける限度は変わらない",
        "溶ける速さも溶ける限度も必ず2倍になる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「溶ける速さは大きくなるが、溶ける限度は変わらない」です。粒を細かくすると水に触れる面が増えて速く溶けますが、同じ水量と温度で溶ける限度は変わりません。"
        ),

        QuizQuestion(
        question: "食塩水全体の重さが120 gで、その中に食塩が18 g溶けています。水の重さは何gですか？",
        choices: [
        "138 g",
        "120 g",
        "18 g",
        "102 g"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「102 g」です。食塩水の重さは水と食塩を合わせた重さなので、120−18＝102 gです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】水溶液を入れて加熱し、水を蒸発させるときに使う平たい器具を何といいますか。",
        answer: "蒸発皿",
        acceptableAnswers: ["じょうはつざら"],
        explanation: "水溶液を加熱して水を蒸発させるときに使う平たい器具を「蒸発皿」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】物の溶け方に関する操作と、主に変化するものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "食塩の粒を細かくくだく", match: "食塩が溶ける速さが大きくなる"),
        QuizMatchingPair(prompt: "ミョウバンを溶かす水の温度を上げる", match: "ミョウバンが溶ける限度が大きくなる"),
        QuizMatchingPair(prompt: "食塩水に水だけを加える", match: "食塩水がうすくなる"),
        QuizMatchingPair(prompt: "結晶が出ない範囲で食塩水の水を蒸発させる", match: "食塩水が濃くなる")
        ],
        choices: [
        "食塩水が濃くなる",
        "ミョウバンが溶ける限度が大きくなる",
        "食塩が溶ける速さが大きくなる",
        "食塩水がうすくなる"
        ],
        explanation: "粒を細かくすると溶ける速さが大きくなり、ミョウバンは水温を上げると溶ける限度が大きくなります。水を加えるとうすくなり、水だけを減らすと濃くなります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】食塩が水に溶けても全体の重さが変わらないことを調べる手順を、正しい順に並べましょう。",
        choices: [
        "食塩を容器に入れてふたをし、こぼさずに振って溶かす",
        "水を入れたふた付き容器の重さを量る",
        "食塩を別に量る",
        "食塩水が入った容器の重さを量り、初めの合計と比べる"
        ],
        orderedChoices: [
        "水を入れたふた付き容器の重さを量る",
        "食塩を別に量る",
        "食塩を容器に入れてふたをし、こぼさずに振って溶かす",
        "食塩水が入った容器の重さを量り、初めの合計と比べる"
        ],
        explanation: "水入り容器と食塩の重さをそれぞれ量ってから、食塩をこぼさずに溶かします。溶かした後の全体の重さを初めの合計と比べると、重さが変わらないことを確かめられます。"
        ),

        QuizQuestion(
        question: "振り子のおもりが最も速く動くのは、どの位置を通るときですか？",
        choices: [
        "振れの中央を通るとき",
        "右端で向きを変えるとき",
        "左端で向きを変えるとき",
        "どの位置でも速さは同じ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「振れの中央を通るとき」です。おもりは端では一瞬止まり、中央へ近づくほど速くなって、中央を通るときに最も速く動きます。"
        ),

        QuizQuestion(
        question: "振り子を左端から動かし、中央を10回通ったあと、再び左端で止めました。振り子は何往復しましたか？",
        choices: [
        "10往復",
        "5往復",
        "20往復",
        "4往復"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「5往復」です。1往復では中央を2回通るので、中央を10回通ったときの往復数は10÷2＝5往復です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】糸などの先におもりをつけ、一定の範囲を行ったり来たりするものを何といいますか。",
        answer: "振り子",
        acceptableAnswers: ["ふりこ"],
        explanation: "糸などの先におもりをつけ、一定の範囲を行ったり来たりするものを「振り子」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】振り子のおもりの速さの変化を、「速くなる」「遅くなる」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "左端から中央へ動く", match: "速くなる"),
        QuizMatchingPair(prompt: "中央から右端へ動く", match: "遅くなる"),
        QuizMatchingPair(prompt: "右端から中央へ動く", match: "速くなる"),
        QuizMatchingPair(prompt: "中央から左端へ動く", match: "遅くなる")
        ],
        categories: ["速くなる", "遅くなる"],
        explanation: "おもりは端から中央へ向かうと速くなり、中央から端へ向かうと遅くなります。端では一瞬止まって向きを変えます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】おもりの重さと振れ幅が同じ振り子を30秒間動かしました。糸が長いと考えられる順に並べましょう。",
        choices: [
        "振り子A：10往復",
        "振り子B：15往復",
        "振り子C：12往復",
        "振り子D：18往復"
        ],
        rankedChoices: [
        "振り子A：10往復",
        "振り子C：12往復",
        "振り子B：15往復",
        "振り子D：18往復"
        ],
        explanation: "同じ時間では、糸が長い振り子ほど1往復する時間が長く、往復回数が少なくなります。したがって、A、C、B、Dの順です。"
        ),

        QuizQuestion(
        question: "電流を流したまっすぐな導線の近くに方位磁針を置くと、針の向きが変わりました。このことから何がわかりますか？",
        choices: [
        "導線の近くでは重力がなくなる",
        "電流が流れると導線が必ず永久磁石になる",
        "電流のまわりには磁力が生じる",
        "方位磁針は電流を止めるはたらきをする"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「電流のまわりには磁力が生じる」です。電流を流したときだけ方位磁針が動くことから、電流のまわりに磁力が生じているとわかります。"
        ),

        QuizQuestion(
        question: "電磁石を作るとき、乾電池の向きとコイルを巻く向きを、どちらも元と反対にしました。元の電磁石と比べて極はどうなりますか？",
        choices: [
        "N極だけがなくなる",
        "必ず磁力が2倍になる",
        "N極とS極が入れ替わる",
        "N極とS極の位置は元と同じになる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「N極とS極の位置は元と同じになる」です。乾電池の向きを反対にする変化と、コイルを巻く向きを反対にする変化は、それぞれ極を入れ替えます。両方を同時に反対にすると、2回入れ替わるため元と同じ極になります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石について調べたいことと、変える条件を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鉄しんの材料による強さの違い", match: "しんの材料だけを変える"),
        QuizMatchingPair(prompt: "コイルの巻き数による強さの違い", match: "コイルの巻き数だけを変える"),
        QuizMatchingPair(prompt: "乾電池の数による強さの違い", match: "直列につなぐ乾電池の数だけを変える"),
        QuizMatchingPair(prompt: "電流の向きによる極の違い", match: "乾電池の向きだけを反対にする")
        ],
        choices: [
        "乾電池の向きだけを反対にする",
        "コイルの巻き数だけを変える",
        "しんの材料だけを変える",
        "直列につなぐ乾電池の数だけを変える"
        ],
        explanation: "調べたい条件だけを変え、ほかの条件をそろえます。しんの材料、巻き数、乾電池の数、乾電池の向きをそれぞれ一つずつ変えて比べます。"
        ),

        QuizQuestion.classification(
        question: "【分類】材料の性質を、「電気を通し、電磁石に引きつけられる」「電気を通すが、電磁石にほとんど引きつけられない」「電気を通さず、電磁石にほとんど引きつけられない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鉄のくぎ", match: "電気を通し、電磁石に引きつけられる"),
        QuizMatchingPair(prompt: "銅線", match: "電気を通すが、電磁石にほとんど引きつけられない"),
        QuizMatchingPair(prompt: "アルミニウムはく", match: "電気を通すが、電磁石にほとんど引きつけられない"),
        QuizMatchingPair(prompt: "プラスチックの定規", match: "電気を通さず、電磁石にほとんど引きつけられない")
        ],
        categories: [
        "電気を通し、電磁石に引きつけられる",
        "電気を通すが、電磁石にほとんど引きつけられない",
        "電気を通さず、電磁石にほとんど引きつけられない"
        ],
        explanation: "鉄は電気を通し、電磁石にも引きつけられます。銅とアルミニウムは電気を通しますが、電磁石にはほとんど引きつけられません。プラスチックは電気を通さず、電磁石にもほとんど引きつけられません。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】鉄しんを入れると電磁石が強くなるかを調べる手順を、正しい順に並べましょう。",
        choices: [
        "スイッチを切り、同じコイルに鉄しんを入れる",
        "鉄しんを入れずに電流を流し、持ち上げたクリップの数を記録する",
        "鉄しんを入れた状態で同じ電流を流し、クリップの数を記録して比べる",
        "鉄しんを出し入れできる同じ巻き数のコイルを用意する"
        ],
        orderedChoices: [
        "鉄しんを出し入れできる同じ巻き数のコイルを用意する",
        "鉄しんを入れずに電流を流し、持ち上げたクリップの数を記録する",
        "スイッチを切り、同じコイルに鉄しんを入れる",
        "鉄しんを入れた状態で同じ電流を流し、クリップの数を記録して比べる"
        ],
        explanation: "同じコイルを使い、まず鉄しんなしで強さを測ります。安全のためスイッチを切って鉄しんを入れ、同じ電流で再び測ると、鉄しんの有無だけを公平に比べられます。"
        ),

        QuizQuestion(
        question: "インゲンマメの種子25個のうち20個が発芽しました。発芽した種子の割合は何％ですか？",
        choices: [
        "80％",
        "20％",
        "5％",
        "125％"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「80％」です。20÷25×100＝80なので、発芽した種子の割合は80％です。"
        ),

        QuizQuestion(
        question: "同じ大きさの鉢に、鉢Aには苗を2本、鉢Bには苗を10本植え、同じ量の水と肥料を与えて育てました。鉢Bの苗の平均の高さが低くなった理由として、最も考えられるものはどれですか？",
        choices: [
        "苗が多いほど土の温度が必ず0℃になるから",
        "苗どうしが日光や水、肥料分を取り合ったから",
        "苗が多いと根がすべて葉に変わるから",
        "苗が多いほど種子が発芽前の状態に戻るから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「苗どうしが日光や水、肥料分を取り合ったから」です。同じ鉢に多くの苗が育つと、限られた日光や水、肥料分を取り合うため、1本あたりの成長が悪くなることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】まいた種子の数に対する、発芽した種子の数の割合を何といいますか。",
        answer: "発芽率",
        acceptableAnswers: ["はつがりつ"],
        explanation: "まいた種子の数に対する、発芽した種子の数の割合を「発芽率」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】発芽や成長の観察内容と、適切な調べ方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "種子が水を吸う前後の重さ", match: "同じ種子を上皿てんびんで量る"),
        QuizMatchingPair(prompt: "根が伸びた長さ", match: "根元から先端までをものさしで測る"),
        QuizMatchingPair(prompt: "発芽した種子の数", match: "決めた時刻に毎日数える"),
        QuizMatchingPair(prompt: "子葉にでんぷんが残っているか", match: "ヨウ素液をつけて色の変化を見る")
        ],
        choices: [
        "ヨウ素液をつけて色の変化を見る",
        "決めた時刻に毎日数える",
        "同じ種子を上皿てんびんで量る",
        "根元から先端までをものさしで測る"
        ],
        explanation: "重さは上皿てんびん、長さはものさし、個数は決めた時刻の観察で調べます。でんぷんの有無は、ヨウ素液による色の変化で確かめます。"
        ),

        QuizQuestion.classification(
        question: "【分類】種子をまく深さが発芽に関係するかを調べる実験を、「公平に比べられる」「公平に比べられない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "同じ種類の種子を同じ土にまき、深さだけを1 cmと5 cmに変える", match: "公平に比べられる"),
        QuizMatchingPair(prompt: "深さ1 cmにはインゲンマメ、深さ5 cmにはトウモロコシをまく", match: "公平に比べられない"),
        QuizMatchingPair(prompt: "深さだけを変え、与える水の量や置く場所を同じにする", match: "公平に比べられる"),
        QuizMatchingPair(prompt: "まく深さと与える水の量を同時に変える", match: "公平に比べられない")
        ],
        categories: ["公平に比べられる", "公平に比べられない"],
        explanation: "まく深さだけを変え、種子の種類、水の量、土、置く場所などをそろえると公平に比べられます。複数の条件を同時に変えると、深さだけの影響を判断できません。"
        ),

        QuizQuestion(
        question: "午前9時から10時までに4 mm、10時から11時までに7 mm、11時から正午までに0 mmの雨が降りました。午前9時から正午までの降水量は何mmですか？",
        choices: [
        "4 mm",
        "7 mm",
        "11 mm",
        "14 mm"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「11 mm」です。3つの時間帯の降水量を足すと、4＋7＋0＝11 mmです。"
        ),

        QuizQuestion(
        question: "ある日の降水量が12 mmだったという記録は、どのような意味ですか？",
        choices: [
        "雨粒が全部で12個落ちたという意味",
        "12分間だけ雨が降ったという意味",
        "雨雲が12 km動いたという意味",
        "流れ出たりしない平らな場所に、雨水が深さ12 mmたまる量だったという意味"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「流れ出たりしない平らな場所に、雨水が深さ12 mmたまる量だったという意味」です。降水量は、降った水が流れたりしないとしたときの深さで表します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】各地の気圧、前線、天気などを記号で書き表した図を何といいますか。",
        answer: "天気図",
        acceptableAnswers: ["てんきず"],
        explanation: "各地の気圧、前線、天気などを記号で書き表した図を「天気図」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】天気の観測結果と、それを表すのに適した方法を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1日の気温の変化", match: "時刻ごとの値を折れ線グラフにする"),
        QuizMatchingPair(prompt: "日ごとの降水量", match: "日ごとの値を棒グラフにする"),
        QuizMatchingPair(prompt: "毎時の風向", match: "方位を表す記号で記録する"),
        QuizMatchingPair(prompt: "雲の形や広がり", match: "同じ場所から写真で記録する")
        ],
        choices: [
        "方位を表す記号で記録する",
        "同じ場所から写真で記録する",
        "日ごとの値を棒グラフにする",
        "時刻ごとの値を折れ線グラフにする"
        ],
        explanation: "時間にともなう気温の変化は折れ線グラフ、日ごとの降水量は棒グラフが適しています。風向は方位記号、雲の形や広がりは写真で記録できます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】雨量計で1時間の降水量を測る手順を、正しい順に並べましょう。",
        choices: [
        "1時間後、たまった雨の量を読み取る",
        "測定を始める時刻を記録する",
        "雨量計を周りにさえぎる物がない水平な場所に置く",
        "中の水を空にして、次の測定に備える"
        ],
        orderedChoices: [
        "雨量計を周りにさえぎる物がない水平な場所に置く",
        "測定を始める時刻を記録する",
        "1時間後、たまった雨の量を読み取る",
        "中の水を空にして、次の測定に備える"
        ],
        explanation: "雨量計を適切な場所に置き、開始時刻を記録します。1時間後に雨量を読み取り、中を空にして次の測定に備えます。"
        ),

        QuizQuestion(
        question: "大雨のあと、川の中にあった砂の中州の形が大きく変わっていました。主な理由として最も適切なものはどれですか？",
        choices: [
        "増えた川の水が砂をけずり、別の場所へ運んだから",
        "雨によって砂がすべて水に溶けたから",
        "中州の砂が自分で上流へ動いたから",
        "川底の石が急に軽くなったから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「増えた川の水が砂をけずり、別の場所へ運んだから」です。大雨で水量と流れの速さが増すと、侵食と運搬のはたらきが強くなり、中州の形が変わることがあります。"
        ),

        QuizQuestion(
        question: "同じ傾きの斜面に、草が生えた場所と土がむき出しの場所を作り、同じ量の水を流しました。土がむき出しの場所から、より多くの土が流れ出ました。この結果から考えられることはどれですか？",
        choices: [
        "草が生えると斜面の傾きが必ず急になる",
        "草や根には、土が流されるのをおさえるはたらきがある",
        "草が生えると流した水の量が自動的に増える",
        "土がむき出しだと水が上向きに流れる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「草や根には、土が流されるのをおさえるはたらきがある」です。植物が地面をおおい、根が土を支えることで、流れる水による侵食を弱めます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】川の流れが始まる場所を何といいますか。",
        answer: "水源",
        acceptableAnswers: ["すいげん"],
        explanation: "川の流れが始まる場所を「水源」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】草が斜面の土の流され方に関係するかを調べる実験の項目を、「変える条件」「そろえる条件」「測る結果」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "斜面に草が生えているかどうか", match: "変える条件"),
        QuizMatchingPair(prompt: "斜面の傾き", match: "そろえる条件"),
        QuizMatchingPair(prompt: "流す水の量", match: "そろえる条件"),
        QuizMatchingPair(prompt: "下に流れ出た土の重さ", match: "測る結果")
        ],
        categories: ["変える条件", "そろえる条件", "測る結果"],
        explanation: "草の有無だけを変え、斜面の傾きや水量をそろえます。下に流れ出た土の重さを測ると、草が侵食に与える影響を比べられます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ時間に下流へ運ばれた土砂の重さを比べ、流れる水の運搬のはたらきが強かった順に並べましょう。",
        choices: [
        "水路A：18 g",
        "水路B：42 g",
        "水路C：7 g",
        "水路D：30 g"
        ],
        rankedChoices: [
        "水路B：42 g",
        "水路D：30 g",
        "水路A：18 g",
        "水路C：7 g"
        ],
        explanation: "同じ時間に運ばれた土砂が多いほど、運搬のはたらきが強かったと考えられます。42 g、30 g、18 g、7 gの順です。"
        ),

        QuizQuestion(
        question: "20℃の水に食塩を溶ける限度まで入れたところ、底に食塩が残りました。水の温度を変えずに水だけを加えてかき混ぜると、どうなりますか？",
        choices: [
        "底に残る食塩がさらに増える",
        "何も変化せず、食塩はまったく溶けない",
        "底に残っていた食塩の一部が溶ける",
        "水に溶けていた食塩がすべて消える"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「底に残っていた食塩の一部が溶ける」です。水を加えると、同じ温度でも全体として溶かせる食塩の量が増えるため、溶け残りの一部が溶けます。"
        ),

        QuizQuestion(
        question: "100 mLの水に食塩10 gを溶かした食塩水から、水だけを25 mL蒸発させました。食塩の結晶はまだ出ていません。蒸発前と比べた食塩水の濃さはどうなりますか？",
        choices: [
        "うすくなる",
        "同じままである",
        "食塩を含まなくなる",
        "濃くなる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「濃くなる」です。食塩の量は変わらず、水の量だけが減るため、水の量に対する食塩の割合が大きくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ある温度で、それ以上は物を溶かせないほど物が溶けている水溶液を何といいますか。",
        answer: "飽和水溶液",
        acceptableAnswers: ["ほうわ水溶液", "ほうわすいようえき", "飽和"],
        explanation: "ある温度で、それ以上は物を溶かせないほど物が溶けている水溶液を「飽和水溶液」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水溶液に加えた操作と、起こる変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "同じ食塩水を同じ量ずつ2つに分ける", match: "それぞれに含まれる食塩の量も同じになる"),
        QuizMatchingPair(prompt: "食塩水に水だけを加える", match: "食塩水はうすくなる"),
        QuizMatchingPair(prompt: "結晶が出ない範囲で水だけを蒸発させる", match: "食塩水は濃くなる"),
        QuizMatchingPair(prompt: "食塩を加え続け、かき混ぜても底に残る", match: "その温度で溶ける限度に達している")
        ],
        choices: [
        "食塩水は濃くなる",
        "その温度で溶ける限度に達している",
        "それぞれに含まれる食塩の量も同じになる",
        "食塩水はうすくなる"
        ],
        explanation: "同じ水溶液を等量に分けると、溶けている物も等しく分かれます。水を加えるとうすくなり、水だけを減らすと濃くなります。溶け残りが出たときは、その温度での限度に達しています。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ミョウバンの種結晶を使って、より大きな結晶を育てる手順を正しい順に並べましょう。",
        choices: [
        "水溶液を少し冷ましてから、種結晶を糸でつるして入れる",
        "熱い水にミョウバンを十分に溶かす",
        "熱いうちにろ過して、透明な水溶液を作る",
        "静かな場所でゆっくり冷まし、育った結晶を取り出す"
        ],
        orderedChoices: [
        "熱い水にミョウバンを十分に溶かす",
        "熱いうちにろ過して、透明な水溶液を作る",
        "水溶液を少し冷ましてから、種結晶を糸でつるして入れる",
        "静かな場所でゆっくり冷まし、育った結晶を取り出す"
        ],
        explanation: "熱い水にミョウバンを十分に溶かしてろ過し、透明な水溶液を作ります。水溶液を少し冷ましてから種結晶を入れ、静かに冷ますと、種結晶のまわりにミョウバンがついて大きく育ちます。"
        ),

        QuizQuestion(
        question: "振り子を使ったメトロノームの動きが遅すぎるため、1往復する時間を短くしたいときは、どう調整すればよいですか？",
        choices: [
        "振り子の長さを短くする",
        "おもりを重くする",
        "おもりの色を変える",
        "支点を強く押す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「振り子の長さを短くする」です。振り子を短くすると1往復する時間が短くなり、往復する速さが上がります。"
        ),

        QuizQuestion(
        question: "同じ振り子の10往復する時間を測ると、14.9秒、15.0秒、22.7秒、15.1秒でした。次に行うこととして最も適切なものはどれですか？",
        choices: [
        "4回の値を調べずにそのまま平均する",
        "ほかと大きく違う22.7秒の測定をもう一度行う",
        "最も短い14.9秒だけを正しい値とする",
        "おもりを重い物に取り替えて結果を合わせる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「ほかと大きく違う22.7秒の測定をもう一度行う」です。22.7秒だけがほかの値から大きく外れているため、数え間違いや操作のずれがなかったかを確かめ、再測定します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】振り子が1往復するのにかかる時間を、振り子の何といいますか。",
        answer: "周期",
        acceptableAnswers: ["しゅうき"],
        explanation: "振り子が1往復するのにかかる時間を「周期」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】振り子の実験で扱う量を、「器具で直接測る量」「測った値から計算する量」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "振り子の長さ", match: "器具で直接測る量"),
        QuizMatchingPair(prompt: "20往復する時間", match: "器具で直接測る量"),
        QuizMatchingPair(prompt: "1往復する時間", match: "測った値から計算する量"),
        QuizMatchingPair(prompt: "3回測定した時間の平均", match: "測った値から計算する量")
        ],
        categories: ["器具で直接測る量", "測った値から計算する量"],
        explanation: "振り子の長さはものさし、20往復する時間はストップウォッチで直接測ります。1往復する時間や複数回の平均は、測った値を使って計算します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ程度の手元のずれがあるとき、1往復する時間を正確に求めやすい順に並べましょう。",
        choices: [
        "1往復だけの時間を測る",
        "5往復をまとめて測る",
        "10往復をまとめて測る",
        "20往復をまとめて測る"
        ],
        rankedChoices: [
        "20往復をまとめて測る",
        "10往復をまとめて測る",
        "5往復をまとめて測る",
        "1往復だけの時間を測る"
        ],
        explanation: "多くの往復をまとめて測るほど、測り始めや測り終わりの手元のずれが、1往復あたりの時間に与える影響を小さくできます。"
        ),

        QuizQuestion(
        question: "電磁石の鉄しんに、磁化されやすく磁力が残りにくい鉄を使う利点はどれですか？",
        choices: [
        "鉄しんそのものが乾電池の代わりになる",
        "電流を流さなくても永久に強い磁石になる",
        "電流を流すと磁石になり、止めると磁力がほぼなくなる",
        "鉄しんの中だけを電流が流れ、コイルには流れなくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「電流を流すと磁石になり、止めると磁力がほぼなくなる」です。この性質により、電磁石の磁力をスイッチで入り切りしやすくなります。"
        ),

        QuizQuestion(
        question: "同じ鉄しんに、コイルAは100回すべて同じ向きに巻き、コイルBは50回巻いたあと残り50回を反対向きに巻きました。同じ電流を流したときの磁力について、最も適切なものはどれですか？",
        choices: [
        "コイルBのほうが必ず2倍強くなる",
        "どちらも巻き数が100回なので必ず同じ強さになる",
        "コイルAには磁力が生じず、コイルBだけに生じる",
        "反対向きの部分の磁力が打ち消し合うため、コイルAのほうが強くなりやすい"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「反対向きの部分の磁力が打ち消し合うため、コイルAのほうが強くなりやすい」です。コイルは同じ向きに巻くことで、それぞれの巻き線が生む磁力を同じ向きに重ねられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石を利用した装置と、その主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "リレー", match: "小さな電流で別の回路の接点を動かす"),
        QuizMatchingPair(prompt: "電磁式ドアロック", match: "電流の入り切りで施錠や解錠を行う"),
        QuizMatchingPair(prompt: "磁気選別機", match: "混じった物の中から鉄を選び分ける"),
        QuizMatchingPair(prompt: "電磁弁", match: "電流で水や空気の通り道を開閉する")
        ],
        choices: [
        "電流で水や空気の通り道を開閉する",
        "混じった物の中から鉄を選び分ける",
        "小さな電流で別の回路の接点を動かす",
        "電流の入り切りで施錠や解錠を行う"
        ],
        explanation: "リレーは回路の接点、電磁式ドアロックは鍵、磁気選別機は鉄の選別、電磁弁は水や空気の通り道を、電磁石の力で動かします。"
        ),

        QuizQuestion.classification(
        question: "【分類】磁石の性質を、「電磁石だけ」「永久磁石だけ」「どちらにも当てはまる」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "スイッチを切ると磁力がほぼなくなる", match: "電磁石だけ"),
        QuizMatchingPair(prompt: "電流の大きさなどで磁力を調整できる", match: "電磁石だけ"),
        QuizMatchingPair(prompt: "電源がなくても鉄を引きつけ続ける", match: "永久磁石だけ"),
        QuizMatchingPair(prompt: "N極とS極がある", match: "どちらにも当てはまる")
        ],
        categories: ["電磁石だけ", "永久磁石だけ", "どちらにも当てはまる"],
        explanation: "電磁石は電流によって磁力を入り切りしたり強さを変えたりできます。永久磁石は電源なしで磁力を保ちます。どちらにもN極とS極があります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】方位磁針を使って電磁石のN極とS極を調べる手順を、正しい順に並べましょう。",
        choices: [
        "方位磁針のN極側を電磁石の一方の端に近づける",
        "電磁石から離れた場所で、方位磁針のN極側を確認する",
        "引き合うか、しりぞけ合うかを観察して電磁石の極を記録する",
        "スイッチを入れて電磁石に電流を流す"
        ],
        orderedChoices: [
        "電磁石から離れた場所で、方位磁針のN極側を確認する",
        "スイッチを入れて電磁石に電流を流す",
        "方位磁針のN極側を電磁石の一方の端に近づける",
        "引き合うか、しりぞけ合うかを観察して電磁石の極を記録する"
        ],
        explanation: "初めに方位磁針のN極側を確認し、電磁石に電流を流します。方位磁針のN極側が引きつけられた端はS極、しりぞけられた端はN極と判断できます。"
        ),

        QuizQuestion(
        question: "水、空気、適した温度をそろえ、インゲンマメの種子を明るい場所と暗い場所に置いたところ、どちらも発芽しました。この結果からわかることはどれですか？",
        choices: [
        "インゲンマメの発芽に光は必ずしも必要ではない",
        "インゲンマメの発芽に水は必要ない",
        "暗い場所では空気がなくなる",
        "明るい場所では温度が必ず下がる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「インゲンマメの発芽に光は必ずしも必要ではない」です。水、空気、温度の条件をそろえ、明るさだけを変えても両方が発芽したため、発芽に光は必ずしも必要ではないとわかります。"
        ),

        QuizQuestion(
        question: "種子の発芽に土が必要かを調べる組み合わせとして、最も適切なものはどれですか？",
        choices: [
        "乾いた土に置いた種子と、湿った脱脂綿に置いた種子を比べる",
        "同じ温度で、湿った土に置いた種子と湿った脱脂綿に置いた種子を比べる",
        "冷たい土に置いた種子と、暖かい脱脂綿に置いた種子を比べる",
        "日なたの土に置いた種子と、暗い場所の脱脂綿に置いた種子を比べる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「同じ温度で、湿った土に置いた種子と湿った脱脂綿に置いた種子を比べる」です。土の有無だけを変え、水、空気、温度などの条件をそろえると、土が発芽に必要かを公平に調べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】種子の発芽には、水、空気、発芽に適した ＿＿ が必要です。",
        answer: "温度",
        acceptableAnswers: ["おんど", "適した温度", "適温", "てきおん"],
        explanation: "＿＿に入る言葉は「温度」です。種子の発芽には、水、空気、発芽に適した温度が必要です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】発芽の条件を調べる実験と、主に調べている条件を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "湿った脱脂綿と乾いた脱脂綿で比べる", match: "水"),
        QuizMatchingPair(prompt: "水中に沈めた種子と水面より上の種子で比べる", match: "空気"),
        QuizMatchingPair(prompt: "暖かい場所と冷蔵庫の中で比べる", match: "温度"),
        QuizMatchingPair(prompt: "明るい場所と暗い場所で比べる", match: "光")
        ],
        choices: [
        "温度",
        "光",
        "水",
        "空気"
        ],
        explanation: "脱脂綿の湿り方では水、水中と水面より上では空気、暖かい場所と冷蔵庫では温度、明るい場所と暗い場所では光の影響を調べています。"
        ),

        QuizQuestion.classification(
        question: "【分類】インゲンマメが発芽して育つ間の変化を、「増える」「減る」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "根の長さ", match: "増える"),
        QuizMatchingPair(prompt: "茎の長さ", match: "増える"),
        QuizMatchingPair(prompt: "子葉に残るでんぷん", match: "減る"),
        QuizMatchingPair(prompt: "子葉の重さ", match: "減る")
        ],
        categories: ["増える", "減る"],
        explanation: "発芽して育つと根や茎は長くなります。一方、子葉のでんぷんは成長に使われるため、子葉に残るでんぷんや子葉の重さは減っていきます。"
        ),

        QuizQuestion(
        question: "雨雲が3時間で東へ12 km移動しました。移動する速さが一定なら、1時間に何km進んだことになりますか？",
        choices: [
        "2 km",
        "3 km",
        "4 km",
        "6 km"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「4 km」です。12 kmを3時間で進んだので、12÷3＝4となり、1時間に4 km進んだことになります。"
        ),

        QuizQuestion(
        question: "雨量計を置く場所として、最も適切なものはどれですか？",
        choices: [
        "大きな木の枝の真下",
        "建物の屋根のすぐ下",
        "水がはね返りやすい壁のそば",
        "周りに雨をさえぎる物がない開けた場所"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「周りに雨をさえぎる物がない開けた場所」です。木や建物に雨をさえぎられたり、壁から水がはね返ったりしない場所で測ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】風の速さを何といいますか。",
        answer: "風速",
        acceptableAnswers: ["ふうそく"],
        explanation: "風の速さを「風速」といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】雨を降らせる雲が近づいて通り過ぎるときの空の変化を、起こる順に並べましょう。",
        choices: [
        "厚い雲が空をおおい、雨が降り始める",
        "雲が少なくなり、空が明るくなる",
        "西の空に雲のかたまりが見え始める",
        "雲が増え、日差しが弱くなる"
        ],
        orderedChoices: [
        "西の空に雲のかたまりが見え始める",
        "雲が増え、日差しが弱くなる",
        "厚い雲が空をおおい、雨が降り始める",
        "雲が少なくなり、空が明るくなる"
        ],
        explanation: "雨雲が西から近づくと、まず西の空に雲が見え、次第に雲が増えます。厚い雲におおわれて雨が降ったあと、雲が通り過ぎると空が明るくなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】1日に降った雨の量を、多い順に並べましょう。",
        choices: [
        "地点A：3 mm",
        "地点B：25 mm",
        "地点C：0 mm",
        "地点D：12 mm"
        ],
        rankedChoices: [
        "地点B：25 mm",
        "地点D：12 mm",
        "地点A：3 mm",
        "地点C：0 mm"
        ],
        explanation: "降水量の数値が大きいほど、降った雨の量が多いことを表します。25 mm、12 mm、3 mm、0 mmの順です。"
        ),

        QuizQuestion(
        question: "山地を流れてきた川が平地に出たところに、砂やれきが扇の形に積もりやすいのはなぜですか？",
        choices: [
        "川の傾きが急にゆるやかになり、土砂を運ぶ力が弱くなるから",
        "平地では川の水がすべて蒸発するから",
        "砂やれきが水に溶けて広がるから",
        "川の水が山へ向かって逆流するから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「川の傾きが急にゆるやかになり、土砂を運ぶ力が弱くなるから」です。山地から平地へ出ると流れが遅くなり、運ばれてきた砂やれきが積もりやすくなります。"
        ),

        QuizQuestion(
        question: "土の種類によって流れる水にけずられやすさが違うかを調べます。最も適切な実験はどれですか？",
        choices: [
        "同じ土を使い、水の量だけを変える",
        "異なる土を同じ傾きの水路に入れ、同じ量の水を流す",
        "異なる土を傾きの違う水路に入れ、水の量も変える",
        "同じ土を使い、水路の長さと傾きを同時に変える"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「異なる土を同じ傾きの水路に入れ、同じ量の水を流す」です。土の種類だけを変え、傾きや水量などをそろえると、土の種類による違いを調べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】流れがゆるやかになった場所に、運ばれてきた土や石が積もるはたらきを何といいますか。",
        answer: "堆積",
        acceptableAnswers: ["たい積", "たいせき"],
        explanation: "運ばれてきた土や石が積もるはたらきを「堆積」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】川によってできる地形や場所と、その特徴を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "V字形の谷", match: "上流で川が深く地面をけずってできる"),
        QuizMatchingPair(prompt: "扇状地", match: "山地から平地へ出た所に砂やれきが広がる"),
        QuizMatchingPair(prompt: "曲流", match: "平地で川が大きく曲がって流れる"),
        QuizMatchingPair(prompt: "三角州", match: "河口付近に細かい土砂が積もってできる")
        ],
        choices: [
        "河口付近に細かい土砂が積もってできる",
        "平地で川が大きく曲がって流れる",
        "上流で川が深く地面をけずってできる",
        "山地から平地へ出た所に砂やれきが広がる"
        ],
        explanation: "V字形の谷は上流の侵食、扇状地は山地から平地へ出た所での堆積、曲流は平地での川の曲がり、三角州は河口付近での堆積によって見られます。"
        ),

        QuizQuestion.classification(
        question: "【分類】次のものを、「川のはたらきでできた地形」「人がつくった施設」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "扇状地", match: "川のはたらきでできた地形"),
        QuizMatchingPair(prompt: "三角州", match: "川のはたらきでできた地形"),
        QuizMatchingPair(prompt: "堤防", match: "人がつくった施設"),
        QuizMatchingPair(prompt: "ダム", match: "人がつくった施設")
        ],
        categories: ["川のはたらきでできた地形", "人がつくった施設"],
        explanation: "扇状地と三角州は川が運んだ土砂の堆積によってできる地形です。堤防とダムは、洪水を防いだり水を利用したりするために人がつくった施設です。"
        ),

        QuizQuestion(
        question: "食塩水Aは50 mLの水に食塩10 g、食塩水Bは100 mLの水に食塩20 gを溶かしたものです。濃さについて正しいものはどれですか？",
        choices: [
        "Aのほうが濃い",
        "Bのほうが濃い",
        "AとBの濃さは同じ",
        "水の量が違うので比べられない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「AとBの濃さは同じ」です。BはAに比べて水も食塩も2倍なので、水の量に対する食塩の割合は同じです。"
        ),

        QuizQuestion(
        question: "食塩水から食塩を取り出すとき、ろ過ではなく水を蒸発させるのはなぜですか？",
        choices: [
        "ろ紙が食塩を水に変えるから",
        "食塩がろ紙を溶かしてしまうから",
        "ろ過すると水だけがろ紙に残るから",
        "溶けた食塩は水とともにろ紙を通り抜けるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「溶けた食塩は水とともにろ紙を通り抜けるから」です。食塩は水に溶けているため、ろ過では分けられません。水を蒸発させると食塩を取り出せます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】同じ量の水に溶けている物の量が多い水溶液ほど、味や性質が ＿＿ といいます。",
        answer: "濃い",
        acceptableAnswers: ["こい"],
        explanation: "同じ量の水に溶けている物の量が多い水溶液ほど「濃い」といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】食塩水の上の部分と下の部分で濃さが同じかを調べる手順を、正しい順に並べましょう。",
        choices: [
        "2つの蒸発皿に残った食塩の量を比べる",
        "食塩が見えなくなるまで水に溶かし、しばらく置く",
        "上の部分と下の部分から同じ量の液を取る",
        "取った液を別々の蒸発皿で蒸発させる"
        ],
        orderedChoices: [
        "食塩が見えなくなるまで水に溶かし、しばらく置く",
        "上の部分と下の部分から同じ量の液を取る",
        "取った液を別々の蒸発皿で蒸発させる",
        "2つの蒸発皿に残った食塩の量を比べる"
        ],
        explanation: "食塩を完全に溶かしてから、上と下から同じ量の液を取り、それぞれの水を蒸発させます。残った食塩の量を比べると、濃さが同じか確かめられます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】すべての食塩が溶けているものとして、食塩水を濃い順に並べましょう。",
        choices: [
        "食塩水A：水100 mLに食塩5 g",
        "食塩水B：水100 mLに食塩10 g",
        "食塩水C：水50 mLに食塩10 g",
        "食塩水D：水100 mLに食塩15 g"
        ],
        rankedChoices: [
        "食塩水C：水50 mLに食塩10 g",
        "食塩水D：水100 mLに食塩15 g",
        "食塩水B：水100 mLに食塩10 g",
        "食塩水A：水100 mLに食塩5 g"
        ],
        explanation: "水100 mL当たりに直すと、Cは20 g、Dは15 g、Bは10 g、Aは5 gの食塩を含みます。したがって、C、D、B、Aの順です。"
        ),

        QuizQuestion(
        question: "糸の長さが60 cmの振り子は1往復に1.6秒かかりました。ほかの条件を同じにして糸を80 cmにすると、1往復する時間はどうなると考えられますか？",
        choices: [
        "1.6秒より長くなる",
        "必ず1.6秒の半分になる",
        "必ず1.6秒と同じになる",
        "0秒になる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「1.6秒より長くなる」です。ほかの条件が同じなら、振り子の糸を長くすると1往復する時間は長くなります。"
        ),

        QuizQuestion(
        question: "振り子を使った時計が、正しい時計より速く進んでいます。1往復する時間を長くするには、振り子をどう調整すればよいですか？",
        choices: [
        "おもりを重くする",
        "振り子の長さを長くする",
        "振れ幅を毎回大きくする",
        "おもりを強く押して動かす"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「振り子の長さを長くする」です。振り子の長さを長くすると1往復する時間が長くなり、時計の進み方を遅くできます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】振り子の糸を長くすると、1往復する時間は ＿＿ なります。",
        answer: "長く",
        acceptableAnswers: ["ながく", "長くなる", "ながくなる"],
        explanation: "振り子の糸を長くすると、1往復する時間は「長く」なります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】振り子の測定で起こりやすい問題と、適切な改善方法を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "1往復だけを測ると手元のずれが大きい", match: "10往復以上の時間を測って1往復を求める"),
        QuizMatchingPair(prompt: "測るたびに結果が少し違う", match: "数回測って平均を求める"),
        QuizMatchingPair(prompt: "実験中に支柱が動く", match: "支柱を固定してから測る"),
        QuizMatchingPair(prompt: "毎回おもりを離す位置が違う", match: "同じ印を付けた位置から離す")
        ],
        choices: [
        "支柱を固定してから測る",
        "同じ印を付けた位置から離す",
        "10往復以上の時間を測って1往復を求める",
        "数回測って平均を求める"
        ],
        explanation: "多くの往復をまとめて測り、複数回の平均を求めると誤差を小さくできます。また、支柱とおもりを離す位置をそろえることも大切です。"
        ),

        QuizQuestion.classification(
        question: "【分類】振り子の1往復する時間を比べる実験を、「公平に比べられる」「公平に比べられない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "糸の長さだけを変え、おもりと振れ幅をそろえる", match: "公平に比べられる"),
        QuizMatchingPair(prompt: "おもりの重さだけを変え、糸の長さと振れ幅をそろえる", match: "公平に比べられる"),
        QuizMatchingPair(prompt: "糸の長さとおもりの重さを同時に変える", match: "公平に比べられない"),
        QuizMatchingPair(prompt: "一方は10往復、もう一方は20往復の合計時間だけを比べる", match: "公平に比べられない")
        ],
        categories: ["公平に比べられる", "公平に比べられない"],
        explanation: "調べたい条件だけを変え、ほかの条件をそろえると公平に比べられます。複数の条件を同時に変えたり、往復回数の違う合計時間をそのまま比べたりするのは適切ではありません。"
        ),

        QuizQuestion(
        question: "同じ乾電池につないだ2つのコイルがあります。巻く向きだけを反対にすると、電磁石の極はどうなりますか？",
        choices: [
        "磁力が完全になくなる",
        "N極だけがなくなる",
        "N極とS極が入れ替わる",
        "極は変わらず、必ず2倍強くなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「N極とS極が入れ替わる」です。乾電池の向きが同じでも、コイルを巻く向きを反対にすると、電流がコイルを回る向きが反対になり、極が入れ替わります。"
        ),

        QuizQuestion(
        question: "鉄しんを入れたコイルと、同じ大きさのプラスチックの棒を入れたコイルに同じ電流を流しました。クリップをより多く引きつけるのはどちらですか？",
        choices: [
        "プラスチックの棒を入れたコイル",
        "どちらも必ず同じ",
        "どちらもクリップを引きつけない",
        "鉄しんを入れたコイル"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「鉄しんを入れたコイル」です。コイルの中に鉄しんを入れると磁力が強まり、より多くの鉄のクリップを引きつけます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石の実験で観察した結果と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乾電池の向きを反対にすると方位磁針の向きも反対になった", match: "電流の向きで電磁石の極が変わる"),
        QuizMatchingPair(prompt: "コイルの巻き数を増やすと持ち上げるクリップが増えた", match: "巻き数を増やすと電磁石が強くなる"),
        QuizMatchingPair(prompt: "スイッチを切るとクリップが落ちた", match: "電流を止めると磁力がほぼなくなる"),
        QuizMatchingPair(prompt: "長時間電流を流すと導線が熱くなった", match: "実験では必要なときだけ電流を流す")
        ],
        choices: [
        "巻き数を増やすと電磁石が強くなる",
        "実験では必要なときだけ電流を流す",
        "電流を止めると磁力がほぼなくなる",
        "電流の向きで電磁石の極が変わる"
        ],
        explanation: "乾電池の向きから極の変化、持ち上げたクリップの数から強さの変化、スイッチを切った結果から磁力の有無がわかります。導線の発熱を防ぐため、電流は必要なときだけ流します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】作った電磁石がクリップを引きつけないときに、回路を安全に点検する手順を正しい順に並べましょう。",
        choices: [
        "エナメル線の両端を必要に応じて紙やすりでみがく",
        "スイッチを切る",
        "回路をつなぎ直し、短時間だけスイッチを入れて確かめる",
        "導線や端子が外れていないか確認する"
        ],
        orderedChoices: [
        "スイッチを切る",
        "導線や端子が外れていないか確認する",
        "エナメル線の両端を必要に応じて紙やすりでみがく",
        "回路をつなぎ直し、短時間だけスイッチを入れて確かめる"
        ],
        explanation: "安全のため最初にスイッチを切ります。接続を確認し、必要ならエナメル線の端をみがいてから回路をつなぎ直し、短時間だけ電流を流して確かめます。"
        ),

        QuizQuestion.classification(
        question: "【分類】電流を流した電磁石に近づけた物を、「引きつけられる」「ほとんど引きつけられない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鉄のくぎ", match: "引きつけられる"),
        QuizMatchingPair(prompt: "鉄製のクリップ", match: "引きつけられる"),
        QuizMatchingPair(prompt: "銅線", match: "ほとんど引きつけられない"),
        QuizMatchingPair(prompt: "アルミニウムはく", match: "ほとんど引きつけられない")
        ],
        categories: ["引きつけられる", "ほとんど引きつけられない"],
        explanation: "電磁石は鉄を強く引きつけます。鉄のくぎや鉄製のクリップは引きつけられますが、銅線やアルミニウムはくはほとんど引きつけられません。"
        ),

        QuizQuestion(
        question: "発芽したばかりの同じ大きさの苗を2本用意し、一方だけ子葉を取り除いて同じ条件で育てました。子葉を取り除いた苗の成長が悪くなった主な理由はどれですか？",
        choices: [
        "子葉にたくわえられた養分を成長に使えなかったから",
        "子葉がないと根が水を吸えなくなるから",
        "子葉を取ると周りの温度が下がるから",
        "子葉がないと土の中の空気がなくなるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「子葉にたくわえられた養分を成長に使えなかったから」です。発芽したばかりの苗は、子葉にたくわえられた養分を使って成長します。"
        ),

        QuizQuestion(
        question: "同じ期間に、苗Aは高さ7 cmから18 cmに、苗Bは10 cmから19 cmになりました。高さの増え方について正しいものはどれですか？",
        choices: [
        "苗Bのほうが2 cm多く伸びた",
        "苗Aのほうが2 cm多く伸びた",
        "2つの苗は同じだけ伸びた",
        "苗Aのほうが9 cm多く伸びた"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「苗Aのほうが2 cm多く伸びた」です。苗Aは18−7＝11 cm、苗Bは19−10＝9 cm伸びたので、苗Aのほうが2 cm多く伸びました。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】でんぷんがあるかを調べるときに使い、でんぷんに触れると青紫色になる液を何といいますか。",
        answer: "ヨウ素液",
        acceptableAnswers: ["よう素液", "ようそ液", "ようそえき"],
        explanation: "でんぷんがあるかを調べるときに使う液は「ヨウ素液」です。でんぷんに触れると青紫色になります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】苗の成長を記録する項目と、適切な記録方法を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "茎の高さ", match: "土の表面から茎の先までをものさしで測る"),
        QuizMatchingPair(prompt: "開いた本葉の枚数", match: "同じ基準で葉を数える"),
        QuizMatchingPair(prompt: "葉の色", match: "同じ明るさで写真を撮って比べる"),
        QuizMatchingPair(prompt: "観察した日", match: "年月日を記録する")
        ],
        choices: [
        "年月日を記録する",
        "同じ明るさで写真を撮って比べる",
        "土の表面から茎の先までをものさしで測る",
        "同じ基準で葉を数える"
        ],
        explanation: "茎の高さはものさしで測り、本葉は同じ基準で数えます。葉の色は同じ明るさの写真で比べ、観察した年月日も記録します。"
        ),

        QuizQuestion.classification(
        question: "【分類】肥料分が苗の成長に関係するかを調べる実験の項目を、「変える条件」「そろえる条件」「記録する結果」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "肥料分を与えるかどうか", match: "変える条件"),
        QuizMatchingPair(prompt: "毎日与える水の量", match: "そろえる条件"),
        QuizMatchingPair(prompt: "日光に当てる時間", match: "そろえる条件"),
        QuizMatchingPair(prompt: "実験前後の葉の枚数", match: "記録する結果")
        ],
        categories: ["変える条件", "そろえる条件", "記録する結果"],
        explanation: "肥料分を与えるかどうかだけを変え、水の量と日光に当てる時間をそろえます。実験前後の葉の枚数を記録して、成長の違いを比べます。"
        ),

        QuizQuestion(
        question: "屋外の気温を温度計で測る場所として、最も適切なものはどれですか？",
        choices: [
        "日光が当たる黒い壁の近く",
        "閉め切った透明な箱の中",
        "日光が直接当たらず、風通しのよい場所",
        "日なたのアスファルトのすぐ上"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「日光が直接当たらず、風通しのよい場所」です。直射日光や地面、壁からの熱の影響を避け、空気の温度を測ります。"
        ),

        QuizQuestion(
        question: "数日間の天気の変化を正しく比べるための観察方法として、最も適切なものはどれですか？",
        choices: [
        "日によって観察する場所を変える",
        "晴れた日だけ観察する",
        "観察する時刻を毎日変える",
        "毎日、同じ場所で同じ時刻に観察する"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「毎日、同じ場所で同じ時刻に観察する」です。場所と時刻をそろえると、日ごとの天気の変化を公平に比べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】直射日光や雨を防ぎ、風通しをよくして気温などを観測するための白い箱を何といいますか。",
        answer: "百葉箱",
        acceptableAnswers: ["ひゃくようばこ"],
        explanation: "気温などを観測するための白い箱を「百葉箱」といいます。直射日光や雨を防ぎながら、風が通るつくりになっています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】天気の観察や記録と、主にわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "同じ方角の空を1時間ごとに撮影する", match: "雲の量や動きの変化"),
        QuizMatchingPair(prompt: "雨量計の値を毎日記録する", match: "日ごとの降水量の違い"),
        QuizMatchingPair(prompt: "風向計を観察する", match: "風が吹いてくる方角"),
        QuizMatchingPair(prompt: "同じ時刻の気温を毎日記録する", match: "日ごとの気温の違い")
        ],
        choices: [
        "日ごとの気温の違い",
        "風が吹いてくる方角",
        "雲の量や動きの変化",
        "日ごとの降水量の違い"
        ],
        explanation: "同じ方角の空の写真から雲の変化、雨量計から降水量、風向計から風向、同じ時刻の気温記録から日ごとの気温の違いがわかります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】雲の動きを使って天気を予想し、予想を確かめる手順を正しい順に並べましょう。",
        choices: [
        "雲が進む向きと速さから、その後の天気を予想する",
        "現在の天気や雲のようすを観察する",
        "時間の異なる雲画像を比べる",
        "後の実際の天気と予想を比べる"
        ],
        orderedChoices: [
        "現在の天気や雲のようすを観察する",
        "時間の異なる雲画像を比べる",
        "雲が進む向きと速さから、その後の天気を予想する",
        "後の実際の天気と予想を比べる"
        ],
        explanation: "現在のようすを観察し、時間の異なる雲画像から動きを読み取ります。その動きから天気を予想し、後で実際の天気と比べます。"
        ),

        QuizQuestion(
        question: "曲がった川の内側に砂や小石が積もりやすい主な理由はどれですか？",
        choices: [
        "内側では流れが遅くなり、土砂を運ぶ力が弱くなるから",
        "内側では水が上向きに流れるから",
        "内側の水だけが冷たくなるから",
        "内側では石が水に溶けるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「内側では流れが遅くなり、土砂を運ぶ力が弱くなるから」です。運ぶ力が弱くなるため、砂や小石が積もりやすくなります。"
        ),

        QuizQuestion(
        question: "同じ土、同じ傾き、同じ水量の4本の水路で、水が5 m進む時間を測りました。地面をけずるはたらきが最も強いと考えられる水路はどれですか？",
        choices: [
        "水路D：20秒",
        "水路A：5秒",
        "水路B：10秒",
        "水路C：15秒"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「水路A：5秒」です。同じ距離を最も短い時間で進んだ水路Aの流れが最も速く、地面をけずるはたらきも強いと考えられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】流れる水が、けずった土や石を下流へ運ぶはたらきを何といいますか。",
        answer: "運搬",
        acceptableAnswers: ["うんぱん"],
        explanation: "流れる水が土や石を下流へ運ぶはたらきを「運搬」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】川の場所を、「侵食が目立つ場所」「堆積が目立つ場所」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "曲がった川の外側の岸", match: "侵食が目立つ場所"),
        QuizMatchingPair(prompt: "傾きが急で流れの速い上流", match: "侵食が目立つ場所"),
        QuizMatchingPair(prompt: "曲がった川の内側の岸", match: "堆積が目立つ場所"),
        QuizMatchingPair(prompt: "流れが海に入って急に遅くなる河口", match: "堆積が目立つ場所")
        ],
        categories: ["侵食が目立つ場所", "堆積が目立つ場所"],
        explanation: "流れが速い外側の岸や上流では侵食が目立ちます。流れが遅い内側の岸や河口では、運ばれてきた土砂の堆積が目立ちます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】どの水路も水が2 m進む時間を測りました。流れが速い順に並べましょう。",
        choices: [
        "水路A：4秒",
        "水路B：8秒",
        "水路C：5秒",
        "水路D：10秒"
        ],
        rankedChoices: [
        "水路A：4秒",
        "水路C：5秒",
        "水路B：8秒",
        "水路D：10秒"
        ],
        explanation: "進む距離が同じなので、かかった時間が短いほど流れは速くなります。4秒、5秒、8秒、10秒の順です。"
        ),

        QuizQuestion(
        question: "食塩が完全に溶けた食塩水をしばらく置き、上の部分と下の部分から同じ量ずつ取り出して水を蒸発させました。最も起こりやすい結果はどれですか？",
        choices: [
        "上の部分からだけ食塩が出る",
        "下の部分からだけ食塩が出る",
        "どちらからもほぼ同じ量の食塩が出る",
        "どちらからも食塩は出ない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「どちらからもほぼ同じ量の食塩が出る」です。完全に溶けた食塩は水溶液全体に均一に広がっているためです。"
        ),

        QuizQuestion(
        question: "150 gの食塩水から水だけを35 g蒸発させました。蒸発後の食塩水と食塩を合わせた重さは何gですか？",
        choices: [
        "95 g",
        "130 g",
        "135 g",
        "115 g"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「115 g」です。水だけが35 g減るので、150−35＝115 gになります。食塩の重さは変わりません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】液体に溶けずに混じっている固体を、ろ紙を使って分ける方法を何といいますか。",
        answer: "ろ過",
        acceptableAnswers: ["ろか", "濾過"],
        explanation: "液体に溶けずに混じっている固体を、ろ紙を使って分ける方法を「ろ過」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】物の溶け方を調べる実験での誤りと、その影響を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "比べる2つの容器で水の量が違う", match: "溶けた量をそのまま公平に比べられない"),
        QuizMatchingPair(prompt: "測定の途中で水溶液をこぼす", match: "全体の重さが本来より小さくなる"),
        QuizMatchingPair(prompt: "ぬれた蒸発皿の重さを量る", match: "取り出した物の重さを大きく見積もることがある"),
        QuizMatchingPair(prompt: "温度計の先を容器の底に当てる", match: "水そのものの温度を正しく測れない")
        ],
        choices: [
        "水そのものの温度を正しく測れない",
        "全体の重さが本来より小さくなる",
        "取り出した物の重さを大きく見積もることがある",
        "溶けた量をそのまま公平に比べられない"
        ],
        explanation: "水量が違うと公平に比較できず、溶液をこぼすと重さが減ります。ぬれた蒸発皿は測定値を大きくし、温度計を底に当てると水そのものの温度を正しく測れません。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】一定量の食塩水から食塩を取り出し、その重さを調べる手順を正しい順に並べましょう。",
        choices: [
        "蒸発皿と残った食塩の重さから、蒸発皿の重さを引く",
        "乾いた蒸発皿だけの重さを量る",
        "一定量の食塩水を蒸発皿に入れて加熱する",
        "水がなくなったら加熱をやめ、蒸発皿を冷ます"
        ],
        orderedChoices: [
        "乾いた蒸発皿だけの重さを量る",
        "一定量の食塩水を蒸発皿に入れて加熱する",
        "水がなくなったら加熱をやめ、蒸発皿を冷ます",
        "蒸発皿と残った食塩の重さから、蒸発皿の重さを引く"
        ],
        explanation: "初めに乾いた蒸発皿の重さを量ります。食塩水を加熱して水を蒸発させ、冷ましてから全体の重さを量り、蒸発皿の重さを引きます。"
        ),

        QuizQuestion(
        question: "糸の長さだけが違う4つの振り子を、同じ時間だけ動かします。最も多く往復すると考えられる振り子はどれですか？",
        choices: [
        "糸の長さ30 cm",
        "糸の長さ50 cm",
        "糸の長さ70 cm",
        "糸の長さ90 cm"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「糸の長さ30 cm」です。糸が短い振り子ほど1往復する時間が短いため、同じ時間では多く往復します。"
        ),

        QuizQuestion(
        question: "ある振り子が15往復するのに24秒かかりました。1往復する時間は何秒ですか？",
        choices: [
        "0.625秒",
        "1.6秒",
        "9秒",
        "24秒"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「1.6秒」です。24÷15＝1.6なので、1往復する時間は1.6秒です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】振り子が中央の位置から片側の端までふれる大きさを何といいますか。",
        answer: "振れ幅",
        acceptableAnswers: ["ふれ幅", "ふれはば"],
        explanation: "振り子が中央の位置から片側の端までふれる大きさを「振れ幅」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】振り子に加えた変化を、1往復する時間が「長くなる」「短くなる」「ほとんど変わらない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "糸の長さを40 cmから80 cmにする", match: "長くなる"),
        QuizMatchingPair(prompt: "糸の長さを80 cmから40 cmにする", match: "短くなる"),
        QuizMatchingPair(prompt: "おもりを10 gから30 gにする", match: "ほとんど変わらない"),
        QuizMatchingPair(prompt: "小さな範囲で振れ幅を10度から20度にする", match: "ほとんど変わらない")
        ],
        categories: ["長くなる", "短くなる", "ほとんど変わらない"],
        explanation: "糸を長くすると1往復する時間は長くなり、短くすると短くなります。おもりの重さや小さな範囲の振れ幅を変えても、ほとんど変わりません。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】測定結果から、1往復する時間が長い順に振り子を並べましょう。",
        choices: [
        "振り子A：10往復で12秒",
        "振り子B：15往復で21秒",
        "振り子C：8往復で16秒",
        "振り子D：18往復で27秒"
        ],
        rankedChoices: [
        "振り子C：8往復で16秒",
        "振り子D：18往復で27秒",
        "振り子B：15往復で21秒",
        "振り子A：10往復で12秒"
        ],
        explanation: "1往復する時間は、Aが1.2秒、Bが1.4秒、Cが2.0秒、Dが1.5秒です。したがって、C、D、B、Aの順です。"
        ),

        QuizQuestion(
        question: "鉄くずを運ぶクレーンで、永久磁石ではなく電磁石を使う大きな利点はどれですか？",
        choices: [
        "電池や電源を使わずに動かせる",
        "鉄以外のすべての物も引きつけられる",
        "電流を切ると鉄くずを離せる",
        "どんな電磁石よりも必ず強い磁力を出せる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「電流を切ると鉄くずを離せる」です。電磁石は電流を流したり切ったりすることで、鉄を引きつけたり離したりできます。"
        ),

        QuizQuestion(
        question: "同じコイルと鉄しんを使い、乾電池1個ではクリップを5個、直列2個では9個、直列3個では12個持ち上げました。この実験からいえることはどれですか？",
        choices: [
        "乾電池を増やすほど電磁石は必ず弱くなる",
        "クリップの数は乾電池の数と関係がない",
        "乾電池1個のときが最も強い",
        "この実験の範囲では、乾電池を増やすと電磁石が強くなった"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「この実験の範囲では、乾電池を増やすと電磁石が強くなった」です。乾電池を増やすにつれて、持ち上げられるクリップの数が5個、9個、12個と増えています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石の実験で起きた問題と、適切な直し方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "エナメル線の端の膜が残っていて電流が流れない", match: "線の端を紙やすりでみがく"),
        QuizMatchingPair(prompt: "乾電池が弱くなり、引きつける力が小さい", match: "新しい乾電池に取り替える"),
        QuizMatchingPair(prompt: "長時間電流を流して導線が熱くなった", match: "すぐにスイッチを切って冷ます"),
        QuizMatchingPair(prompt: "導線が端子から外れかけている", match: "電流を切ってから端子にしっかりつなぐ")
        ],
        choices: [
        "新しい乾電池に取り替える",
        "電流を切ってから端子にしっかりつなぐ",
        "線の端を紙やすりでみがく",
        "すぐにスイッチを切って冷ます"
        ],
        explanation: "膜が残った線の端はみがき、弱い乾電池は取り替えます。導線が熱くなったらスイッチを切って冷まし、外れかけた端子は電流を切ってからつなぎ直します。"
        ),

        QuizQuestion.classification(
        question: "【分類】電磁石の極どうしを近づけたときのようすを、「引き合う」「しりぞけ合う」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "N極とS極", match: "引き合う"),
        QuizMatchingPair(prompt: "S極とN極", match: "引き合う"),
        QuizMatchingPair(prompt: "N極とN極", match: "しりぞけ合う"),
        QuizMatchingPair(prompt: "S極とS極", match: "しりぞけ合う")
        ],
        categories: ["引き合う", "しりぞけ合う"],
        explanation: "異なる極どうしのN極とS極は引き合い、同じ極どうしのN極とN極、S極とS極はしりぞけ合います。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】電磁石を使ったクレーンで鉄のクリップを運ぶ手順を、正しい順に並べましょう。",
        choices: [
        "クリップを持ち上げて目的の場所へ動かす",
        "スイッチを切り、クリップを目的の場所に落とす",
        "スイッチを切ったまま電磁石をクリップの上へ近づける",
        "スイッチを入れてクリップを引きつける"
        ],
        orderedChoices: [
        "スイッチを切ったまま電磁石をクリップの上へ近づける",
        "スイッチを入れてクリップを引きつける",
        "クリップを持ち上げて目的の場所へ動かす",
        "スイッチを切り、クリップを目的の場所に落とす"
        ],
        explanation: "電磁石をクリップに近づけてから電流を流して引きつけ、目的の場所へ運びます。最後にスイッチを切ると、クリップを離せます。"
        ),

        QuizQuestion(
        question: "メダカの受精卵を観察するとき、卵の中の変化を比べやすくする方法はどれですか？",
        choices: [
        "毎日ほぼ同じ時刻に同じ倍率で観察する",
        "観察するたびに別の種類の卵に替える",
        "卵を強く押して中を確かめる",
        "毎回ちがう場所に置いて観察する"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「毎日ほぼ同じ時刻に同じ倍率で観察する」です。条件をできるだけそろえて記録すると、卵の中の変化を比べやすくなります。"
        ),

        QuizQuestion(
        question: "メダカの受精卵が育つにつれて、卵の中で見られるようになる変化はどれですか？",
        choices: [
        "目や体の形がしだいにはっきりする",
        "卵が土の中へもぐる",
        "卵の中に葉が生える",
        "卵が石に変わる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「目や体の形がしだいにはっきりする」です。受精卵の中では体がつくられ、目や体の形がしだいに分かるようになります。"
        ),

        QuizQuestion(
        question: "メダカの卵を育てるとき、直射日光が強く当たり続ける場所を避ける主な理由はどれですか？",
        choices: [
        "水温が上がりすぎることがあるから",
        "卵が必ず大きな魚になるから",
        "水が酸素だけになるから",
        "卵の色が必ず青くなるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水温が上がりすぎることがあるから」です。卵は急な温度変化や高すぎる水温を避け、適した環境で観察します。"
        ),

        QuizQuestion(
        question: "メダカの卵が受精卵になるのは、どのようなときですか？",
        choices: [
        "卵と精子が結びついたとき",
        "卵が水草についたとき",
        "卵が日光に当たったとき",
        "卵から子メダカが出たとき"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「卵と精子が結びついたとき」です。卵と精子が結びつくことを受精といい、受精した卵を受精卵といいます。"
        ),

        QuizQuestion(
        question: "メダカが卵を産みつける場所として見られやすいものはどれですか？",
        choices: [
        "水草など",
        "乾いた砂の中",
        "木の高い枝",
        "石の内部"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水草など」です。メダカの卵は水草などに付着して見つかることがあります。"
        ),

        QuizQuestion(
        question: "ふ化したばかりの子メダカを観察するときに大切なことはどれですか？",
        choices: [
        "弱らせないよう静かに観察する",
        "手で強くつかんで長さを測る",
        "水から出したまま長時間観察する",
        "毎日水を全部取り替える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「弱らせないよう静かに観察する」です。小さな生き物を傷つけない方法で観察することが大切です。"
        ),

        QuizQuestion(
        question: "人の子どもが生まれるまで育つ場所は、母親の体のどこですか？",
        choices: [
        "子宮",
        "胃",
        "肺",
        "大腸"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「子宮」です。受精卵は母親の子宮の中で成長していきます。"
        ),

        QuizQuestion(
        question: "母親の体内で育つ胎児が、成長に必要な酸素や養分を受け取るしくみに関係するものはどれですか？",
        choices: [
        "胎盤とへその緒",
        "気管と食道",
        "骨と関節",
        "耳と鼻"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「胎盤とへその緒」です。胎児は胎盤とへその緒を通して、母体から酸素や養分を受け取ります。"
        ),

        QuizQuestion(
        question: "母親の子宮の中で胎児を包み、外からの衝撃をやわらげるのに役立つ液体はどれですか？",
        choices: [
        "羊水",
        "だ液",
        "胃液",
        "汗"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「羊水」です。胎児は羊水の中で育ち、羊水は衝撃をやわらげるはたらきもします。"
        ),

        QuizQuestion(
        question: "胎児が成長するにつれて一般に見られる変化はどれですか？",
        choices: [
        "体が大きくなり、体のつくりが整っていく",
        "体がしだいに小さくなる",
        "骨がすべてなくなる",
        "子宮の外で育つようになる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「体が大きくなり、体のつくりが整っていく」です。胎児は子宮の中で成長し、体の各部分が発達していきます。"
        ),

        QuizQuestion(
        question: "メダカと人の誕生に共通していることはどれですか？",
        choices: [
        "どちらも受精卵から成長が始まる",
        "どちらも水草に卵を産みつける",
        "どちらも母体の外でだけ育つ",
        "どちらも卵からすぐ成体になる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「どちらも受精卵から成長が始まる」です。育つ場所や方法には違いがありますが、どちらも受精卵から新しい命の成長が始まります。"
        ),

        QuizQuestion(
        question: "動物の誕生を調べるとき、観察や資料から分かったことと予想を区別して記録する理由はどれですか？",
        choices: [
        "事実と自分の考えを分けて整理するため",
        "記録する量を必ず半分にするため",
        "結果を予想に合わせるため",
        "観察した日を分からなくするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「事実と自分の考えを分けて整理するため」です。観察した事実と予想・考察を区別すると、変化を正しく捉えやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】卵と精子が結びつくことを何といいますか。",
        answer: "受精",
        acceptableAnswers: ["じゅせい"],
        explanation: "卵と精子が結びつくことを「受精」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】受精した卵を何といいますか。",
        answer: "受精卵",
        acceptableAnswers: ["じゅせいらん"],
        explanation: "受精した卵を「受精卵」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】人の受精卵が育ち、胎児が成長する母親の体内の場所を何といいますか。",
        answer: "子宮",
        acceptableAnswers: ["しきゅう"],
        explanation: "胎児は母親の「子宮」の中で成長します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】胎児と胎盤をつなぎ、酸素や養分などのやり取りに関わるものを何といいますか。",
        answer: "へその緒",
        acceptableAnswers: ["へそのお", "臍の緒"],
        explanation: "胎児と胎盤をつないでいるものを「へその緒」といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】母体と胎児の間で、酸素や養分などのやり取りに関わる器官を何といいますか。",
        answer: "胎盤",
        acceptableAnswers: ["たいばん"],
        explanation: "母体と胎児の間の物質のやり取りに関わる器官を「胎盤」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】メダカの卵のようすと、成長の段階を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "受精して間もない卵", match: "体の形はまだはっきりしない"),
        QuizMatchingPair(prompt: "成長が進んだ卵", match: "目や体の形が分かる"),
        QuizMatchingPair(prompt: "ふ化直前の卵", match: "子メダカが卵の中で動くようすが見られる"),
        QuizMatchingPair(prompt: "ふ化したあと", match: "子メダカが水中を泳ぐ")
        ],
        choices: [
        "子メダカが水中を泳ぐ",
        "目や体の形が分かる",
        "体の形はまだはっきりしない",
        "子メダカが卵の中で動くようすが見られる"
        ],
        explanation: "受精卵の中では体がしだいにつくられ、ふ化が近づくと動くようすも見られます。ふ化すると子メダカが水中へ出ます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】人の誕生に関わる部分と、主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "子宮", match: "胎児が育つ場所"),
        QuizMatchingPair(prompt: "胎盤", match: "母体と胎児の物質のやり取りに関わる"),
        QuizMatchingPair(prompt: "へその緒", match: "胎児と胎盤をつなぐ"),
        QuizMatchingPair(prompt: "羊水", match: "胎児を包み衝撃をやわらげる")
        ],
        choices: [
        "胎児を包み衝撃をやわらげる",
        "胎児が育つ場所",
        "胎児と胎盤をつなぐ",
        "母体と胎児の物質のやり取りに関わる"
        ],
        explanation: "子宮は胎児が育つ場所で、胎盤とへその緒は母体と胎児の物質のやり取りに関わります。羊水は胎児を包みます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】動物の誕生について調べる方法と、分かりやすくなることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "同じ卵を日ごとに観察する", match: "一つの卵の変化を追える"),
        QuizMatchingPair(prompt: "写真に日付を書く", match: "変化した順番が分かる"),
        QuizMatchingPair(prompt: "同じ倍率で撮影する", match: "大きさや形を比べやすい"),
        QuizMatchingPair(prompt: "資料の出典を記録する", match: "どの資料を使ったか確かめられる")
        ],
        choices: [
        "大きさや形を比べやすい",
        "どの資料を使ったか確かめられる",
        "一つの卵の変化を追える",
        "変化した順番が分かる"
        ],
        explanation: "観察条件や記録方法をそろえると、成長の変化を比べやすくなります。資料を使う場合は出典も記録します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】メダカと人について、子が育つ場所を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "メダカの受精卵", match: "母体の外の水中"),
        QuizMatchingPair(prompt: "メダカの子", match: "水中"),
        QuizMatchingPair(prompt: "人の胎児", match: "母親の子宮の中"),
        QuizMatchingPair(prompt: "生まれたあとの人の子", match: "母体の外")
        ],
        choices: [
        "母体の外",
        "母親の子宮の中",
        "水中",
        "母体の外の水中"
        ],
        explanation: "メダカは受精卵が母体の外の水中で育ち、人は胎児が母親の子宮の中で育ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】メダカの卵の観察で見られることを、「卵の外から観察できる」「卵を傷つけるのでしてはいけない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "目や体の形を見る", match: "卵の外から観察できる"),
        QuizMatchingPair(prompt: "卵の中の動きを見る", match: "卵の外から観察できる"),
        QuizMatchingPair(prompt: "卵を切り開く", match: "卵を傷つけるのでしてはいけない"),
        QuizMatchingPair(prompt: "卵を強く押す", match: "卵を傷つけるのでしてはいけない")
        ],
        categories: ["卵の外から観察できる", "卵を傷つけるのでしてはいけない"],
        explanation: "卵は傷つけずに外から観察します。目や体の形、動きなどはルーペや顕微鏡などで観察できます。"
        ),

        QuizQuestion.classification(
        question: "【分類】次の内容を、「メダカ」「人」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "受精卵が水中で育つ", match: "メダカ"),
        QuizMatchingPair(prompt: "水草などに卵が付く", match: "メダカ"),
        QuizMatchingPair(prompt: "胎児が子宮で育つ", match: "人"),
        QuizMatchingPair(prompt: "胎盤とへその緒が成長に関わる", match: "人")
        ],
        categories: ["メダカ", "人"],
        explanation: "メダカの受精卵は母体の外の水中で育ち、人の胎児は母親の子宮の中で育ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】胎児と母体の間でやり取りされるものを、「主に母体から胎児へ」「主に胎児から母体へ」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "酸素", match: "主に母体から胎児へ"),
        QuizMatchingPair(prompt: "養分", match: "主に母体から胎児へ"),
        QuizMatchingPair(prompt: "二酸化炭素", match: "主に胎児から母体へ"),
        QuizMatchingPair(prompt: "不要になった物質", match: "主に胎児から母体へ")
        ],
        categories: ["主に母体から胎児へ", "主に胎児から母体へ"],
        explanation: "胎児は酸素や養分を母体から受け取り、二酸化炭素や不要になった物質を母体側へ渡します。"
        ),

        QuizQuestion.classification(
        question: "【分類】動物の誕生についての記録を、「観察した事実」「考え・予想」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "卵の中に黒い目が見えた", match: "観察した事実"),
        QuizMatchingPair(prompt: "昨日より体の形がはっきりした", match: "観察した事実"),
        QuizMatchingPair(prompt: "明日はもっと大きくなると思う", match: "考え・予想"),
        QuizMatchingPair(prompt: "水温が高いと育ち方が変わるかもしれない", match: "考え・予想")
        ],
        categories: ["観察した事実", "考え・予想"],
        explanation: "実際に見たり測ったりしたことと、自分の考えや予想を分けて記録すると、学習内容を整理しやすくなります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】メダカが受精してから子メダカになるまでを、早い順に並べましょう。",
        choices: [
        "卵の中で目や体の形がはっきりしてくる",
        "卵と精子が結びついて受精卵になる",
        "子メダカが卵から出る",
        "受精卵の中で体がつくられ始める"
        ],
        orderedChoices: [
        "卵と精子が結びついて受精卵になる",
        "受精卵の中で体がつくられ始める",
        "卵の中で目や体の形がはっきりしてくる",
        "子メダカが卵から出る"
        ],
        explanation: "受精卵の中で体がつくられ、目や体の形がしだいにはっきりしたあと、子メダカがふ化します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】人の新しい命が成長して生まれるまでを、大まかな順に並べましょう。",
        choices: [
        "胎児が子宮の中で大きくなる",
        "卵と精子が結びつく",
        "赤ちゃんが生まれる",
        "受精卵が成長を始める"
        ],
        orderedChoices: [
        "卵と精子が結びつく",
        "受精卵が成長を始める",
        "胎児が子宮の中で大きくなる",
        "赤ちゃんが生まれる"
        ],
        explanation: "人も受精から新しい命の成長が始まり、子宮の中で胎児として育ったあとに生まれます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】メダカの卵の成長を継続して観察する手順を、正しい順に並べましょう。",
        choices: [
        "日付と卵のようすを記録する",
        "観察する卵を決める",
        "次の日も同じ条件で観察する",
        "ルーペなどで卵の中を見る"
        ],
        orderedChoices: [
        "観察する卵を決める",
        "ルーペなどで卵の中を見る",
        "日付と卵のようすを記録する",
        "次の日も同じ条件で観察する"
        ],
        explanation: "同じ卵を継続して、できるだけ同じ条件で観察・記録すると、成長の変化を追いやすくなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】メダカの卵の観察記録を、成長が進んでいる順に並べましょう。",
        choices: [
        "記録B：目がはっきり見え、体が動く",
        "記録D：子メダカが卵から出た",
        "記録A：受精して間もなく、体の形はまだはっきりしない",
        "記録C：体の形が少し分かる"
        ],
        rankedChoices: [
        "記録D：子メダカが卵から出た",
        "記録B：目がはっきり見え、体が動く",
        "記録C：体の形が少し分かる",
        "記録A：受精して間もなく、体の形はまだはっきりしない"
        ],
        explanation: "最も成長が進んでいるのはふ化後で、その前には目や体の形、動きがしだいにはっきりしていきます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】胎児の成長記録を、体の長さが長い順に並べましょう。",
        choices: [
        "記録A：18 cm",
        "記録B：32 cm",
        "記録C：8 cm",
        "記録D：25 cm"
        ],
        rankedChoices: [
        "記録B：32 cm",
        "記録D：25 cm",
        "記録A：18 cm",
        "記録C：8 cm"
        ],
        explanation: "数値を比べると、32 cm、25 cm、18 cm、8 cmの順です。胎児の成長を数値で記録すると、大きさの変化を比べられます。"
        ),

        QuizQuestion(
        question: "同じ日にまいたインゲンマメの苗の成長を、数値で比べる方法として最も適切なものはどれですか？",
        choices: [
        "葉の色を見た印象だけで比べる",
        "鉢全体の重さだけを量る",
        "同じ日に茎の高さを測って比べる",
        "土のにおいの強さを比べる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「同じ日に茎の高さを測って比べる」です。苗の成長を数値で比べるには、同じ日に茎の高さを測ると、結果を客観的に比べられます。"
        ),

        QuizQuestion(
        question: "種子を、沸騰させてから冷ました水の中に沈め、水面を油でおおって暖かい場所に置きました。発芽しにくい主な理由はどれですか？",
        choices: [
        "種子が空気にほとんど触れられないから",
        "種子に水が与えられていないから",
        "温度が必ず0℃になるから",
        "日光が強すぎるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「種子が空気にほとんど触れられないから」です。水を沸騰させると水中の空気が少なくなり、さらに油で水面をおおうと空気が入りにくくなります。種子は発芽に必要な空気を十分に得られません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】土の中に含まれ、植物が根から水とともに取り入れて成長に使う成分を何といいますか。",
        answer: "肥料分",
        acceptableAnswers: ["ひりょうぶん"],
        explanation: "植物は根から水とともに「肥料分」を取り入れ、成長に使います。"
        ),

        QuizQuestion.related(
        question: "【関連付け】苗を育てた条件と、起こりやすいようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "水だけを与え、暗い箱の中で育てる", match: "茎が細長くなり、葉が黄色っぽくなる"),
        QuizMatchingPair(prompt: "日光に当てるが、土を乾いたままにする", match: "葉や茎がしおれやすくなる"),
        QuizMatchingPair(prompt: "日光と水を与え、肥料分のない砂だけで長く育てる", match: "しだいに成長が悪くなりやすい"),
        QuizMatchingPair(prompt: "日光・水・肥料分を適切に与える", match: "葉が緑色で丈夫に育ちやすい")
        ],
        choices: [
        "葉が緑色で丈夫に育ちやすい",
        "しだいに成長が悪くなりやすい",
        "茎が細長くなり、葉が黄色っぽくなる",
        "葉や茎がしおれやすくなる"
        ],
        explanation: "日光が不足すると苗は細長く黄色っぽくなり、水が不足するとしおれます。肥料分が不足すると長く育てたときに成長が悪くなり、必要な条件がそろうと丈夫に育ちやすくなります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】苗の成長に日光が必要かを調べる実験の手順を、正しい順に並べましょう。",
        choices: [
        "数日後、苗の高さや葉の色を比べる",
        "一方を日光に当て、もう一方を光の入らない箱に入れる",
        "育ち方が同じくらいの苗を2つ選ぶ",
        "両方に同じ量の水を毎日与える"
        ],
        orderedChoices: [
        "育ち方が同じくらいの苗を2つ選ぶ",
        "一方を日光に当て、もう一方を光の入らない箱に入れる",
        "両方に同じ量の水を毎日与える",
        "数日後、苗の高さや葉の色を比べる"
        ],
        explanation: "初めに同じくらい育った苗を選び、日光の条件だけを変えます。水の量は同じにし、数日後に高さや葉の色を比べます。"
        ),

        QuizQuestion(
        question: "「北風」とは、どの方角から吹いてくる風ですか？",
        choices: [
        "南",
        "北",
        "東",
        "西"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「北」です。風向は、風が吹いてくる方角で表します。北風は北から吹いてくる風です。"
        ),

        QuizQuestion(
        question: "午前9時、雨雲の先端が町の西80 kmにあり、東へ毎時20 kmの速さで進んでいます。速さが変わらないとすると、雨雲の先端が町に着くのは何時ごろですか？",
        choices: [
        "午前10時",
        "午前11時",
        "正午",
        "午後1時"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「午後1時」です。80 kmを毎時20 kmで進むので、町まで4時間かかります。午前9時の4時間後は午後1時です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】風が吹いてくる方角を何といいますか。",
        answer: "風向",
        acceptableAnswers: ["ふうこう"],
        explanation: "風が吹いてくる方角を「風向」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】風の吹き方を「北よりの風」「南よりの風」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "北から南へ吹く風", match: "北よりの風"),
        QuizMatchingPair(prompt: "北西から南東へ吹く風", match: "北よりの風"),
        QuizMatchingPair(prompt: "南から北へ吹く風", match: "南よりの風"),
        QuizMatchingPair(prompt: "南東から北西へ吹く風", match: "南よりの風")
        ],
        categories: ["北よりの風", "南よりの風"],
        explanation: "風向は風が吹いてくる方角で決まります。北や北西から吹く風は北よりの風、南や南東から吹く風は南よりの風です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】空をおおう雲の割合が少ない順に並べましょう。",
        choices: [
        "空の10分の8が雲でおおわれている",
        "空の10分の2が雲でおおわれている",
        "空全体が雲でおおわれている",
        "空の10分の5が雲でおおわれている"
        ],
        rankedChoices: [
        "空の10分の2が雲でおおわれている",
        "空の10分の5が雲でおおわれている",
        "空の10分の8が雲でおおわれている",
        "空全体が雲でおおわれている"
        ],
        explanation: "雲の割合は、10分の2、10分の5、10分の8、空全体の順に大きくなります。"
        ),

        QuizQuestion(
        question: "川の水が海や湖に流れ込むところを何といいますか？",
        choices: [
        "河口",
        "水源",
        "分水界",
        "滝"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「河口」です。川の水が海や湖に流れ込むところを河口といいます。"
        ),

        QuizQuestion(
        question: "速い流れに運ばれていた泥・砂・大きな石が、急に流れの遅い場所へ入りました。最も先に積もりやすいものはどれですか？",
        choices: [
        "細かい泥",
        "細かい砂",
        "大きな石",
        "すべて同時に積もる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「大きな石」です。流れが遅くなると、重くて大きな石から先に運ばれにくくなり、積もりやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】川の水が少ないとき、川岸や川の中に見える、石や砂の多い場所を何といいますか。",
        answer: "河原",
        acceptableAnswers: ["かわら"],
        explanation: "川岸や川の中にある、石や砂の多い場所を「河原」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】川による災害を防ぐための施設と、主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "砂防ダム", match: "山から流れる土砂の勢いを弱める"),
        QuizMatchingPair(prompt: "護岸ブロック", match: "川岸がけずられるのを防ぐ"),
        QuizMatchingPair(prompt: "堤防", match: "川の水が周りへあふれるのを防ぐ"),
        QuizMatchingPair(prompt: "遊水地", match: "増えた川の水を一時的にためる")
        ],
        choices: [
        "増えた川の水を一時的にためる",
        "川岸がけずられるのを防ぐ",
        "山から流れる土砂の勢いを弱める",
        "川の水が周りへあふれるのを防ぐ"
        ],
        explanation: "砂防ダムは土砂の勢いを弱め、護岸ブロックは川岸を守ります。堤防は水が周りへあふれるのを防ぎ、遊水地は増えた水を一時的にためます。"
        ),

        QuizQuestion.classification(
        question: "【分類】同じ量の水を流すときの水路の条件を、「流れが速くなりやすい」「流れが遅くなりやすい」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "傾きが急な水路", match: "流れが速くなりやすい"),
        QuizMatchingPair(prompt: "幅がせまい水路", match: "流れが速くなりやすい"),
        QuizMatchingPair(prompt: "傾きがゆるやかな水路", match: "流れが遅くなりやすい"),
        QuizMatchingPair(prompt: "幅が広い水路", match: "流れが遅くなりやすい")
        ],
        categories: ["流れが速くなりやすい", "流れが遅くなりやすい"],
        explanation: "ほかの条件が同じなら、傾きが急で幅がせまい水路では流れが速くなりやすく、傾きがゆるやかで幅が広い水路では遅くなりやすくなります。"
        ),

        QuizQuestion(
        question: "同じ温度で、食塩とミョウバンの水への溶ける量を正しく比べるには、どの条件を同じにする必要がありますか？",
        choices: [
        "一方だけ水の量を多くする",
        "一方だけ水の温度を高くする",
        "一方だけ短い時間だけかき混ぜる",
        "水の量と温度を同じにする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「水の量と温度を同じにする」です。物の種類による溶ける量の違いを比べるには、水の量と温度を同じにし、どちらも十分にかき混ぜます。"
        ),

        QuizQuestion(
        question: "ある温度で、100 gの水には食塩が最大36 g溶けます。同じ温度の50 gの水には、食塩が最大何g溶けますか？",
        choices: [
        "9 g",
        "18 g",
        "36 g",
        "72 g"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「18 g」です。水の量が100 gの半分の50 gなので、溶ける食塩の量も36 gの半分です。36÷2＝18 gです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】物を水に入れて十分にかき混ぜても、溶けきらずに容器の底に残った物を何といいますか。",
        answer: "溶け残り",
        acceptableAnswers: ["とけ残り", "とけのこり"],
        explanation: "十分にかき混ぜても溶けきらずに残った物を「溶け残り」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】溶ける量を比べる実験での操作と、その目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "メスシリンダーで水を50 mLずつ量る", match: "水の量を同じにする"),
        QuizMatchingPair(prompt: "湯せんで水温を40℃にそろえる", match: "水の温度を同じにする"),
        QuizMatchingPair(prompt: "溶かす物を1 gずつ加える", match: "溶ける限度を細かく調べる"),
        QuizMatchingPair(prompt: "毎回同じ時間だけかき混ぜる", match: "かき混ぜ方の条件を同じにする")
        ],
        choices: [
        "かき混ぜ方の条件を同じにする",
        "溶ける限度を細かく調べる",
        "水の温度を同じにする",
        "水の量を同じにする"
        ],
        explanation: "水量と水温、かき混ぜ方をそろえ、物を少しずつ加えると、溶ける限度を公平かつ細かく比べられます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】熱いミョウバン水溶液から結晶を取り出す手順を、正しい順に並べましょう。",
        choices: [
        "ろ液を静かな場所で冷ます",
        "熱い水にミョウバンを少しずつ加えてかき混ぜる",
        "出てきた結晶を観察する",
        "溶け残りが少し出たら、熱いうちにろ過する"
        ],
        orderedChoices: [
        "熱い水にミョウバンを少しずつ加えてかき混ぜる",
        "溶け残りが少し出たら、熱いうちにろ過する",
        "ろ液を静かな場所で冷ます",
        "出てきた結晶を観察する"
        ],
        explanation: "熱い水にミョウバンを十分に溶かし、溶け残りを熱いうちにろ過します。ろ液を静かに冷ますと結晶が出てくるので、それを観察します。"
        ),

        QuizQuestion(
        question: "振り子の1往復する時間を調べるとき、1往復ではなく10往復する時間を測る主な理由はどれですか？",
        choices: [
        "おもりを重くするため",
        "糸を長くするため",
        "時間を測るときの誤差を小さくするため",
        "振れ幅を大きくするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「時間を測るときの誤差を小さくするため」です。10往復のようにまとまった回数を測ってから1往復の時間を求めると、測り始めや測り終わりのずれによる誤差を小さくできます。"
        ),

        QuizQuestion(
        question: "ある振り子の10往復する時間を3回測ると、17.8秒、18.1秒、18.1秒でした。平均を使って求めた1往復する時間は何秒ですか？",
        choices: [
        "1.8秒",
        "6.0秒",
        "18.0秒",
        "54.0秒"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「1.8秒」です。3回の合計は54.0秒なので、10往復する時間の平均は54.0÷3＝18.0秒です。1往復する時間は18.0÷10＝1.8秒です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】振り子をつるしている、動かない点を何といいますか。",
        answer: "支点",
        acceptableAnswers: ["してん"],
        explanation: "振り子をつるしている動かない点を「支点」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】振り子の時間を正確に比べるための操作を、「適切」「不適切」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "10往復する時間を数回測って平均を求める", match: "適切"),
        QuizMatchingPair(prompt: "毎回同じ位置から、おもりを押さずに離す", match: "適切"),
        QuizMatchingPair(prompt: "おもりを手で押して勢いをつける", match: "不適切"),
        QuizMatchingPair(prompt: "測定の途中で糸の長さを変える", match: "不適切")
        ],
        categories: ["適切", "不適切"],
        explanation: "複数回の測定の平均を求め、同じ位置から押さずに離すと正確に比べやすくなります。勢いをつけたり途中で糸の長さを変えたりするのは不適切です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】それぞれ10往復する時間を測りました。1往復する時間が長い順に並べましょう。",
        choices: [
        "振り子A：12.0秒",
        "振り子B：16.0秒",
        "振り子C：14.0秒",
        "振り子D：18.0秒"
        ],
        rankedChoices: [
        "振り子D：18.0秒",
        "振り子B：16.0秒",
        "振り子C：14.0秒",
        "振り子A：12.0秒"
        ],
        explanation: "どれも10往復の時間なので、その時間が長いほど1往復する時間も長くなります。D、B、C、Aの順です。"
        ),

        QuizQuestion(
        question: "エナメル線の両端を紙やすりでみがいてから乾電池につなぐのは、なぜですか？",
        choices: [
        "コイルの巻き数を自動で増やすため",
        "金属部分を出して電流を流れやすくするため",
        "電磁石のN極とS極を入れ替えるため",
        "鉄しんが磁石になるのを防ぐため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「金属部分を出して電流を流れやすくするため」です。エナメル線の表面は電気を通しにくい膜でおおわれています。両端をみがいて金属部分を出すと、回路に電流が流れます。"
        ),

        QuizQuestion(
        question: "2つの電磁石の強さを公平に比べる方法として、最も適切なものはどれですか？",
        choices: [
        "鉄しんを手で触り、温かい方を強いとする",
        "方位磁針の色の見え方で決める",
        "回路から聞こえる音の大きさで決める",
        "同じ種類のクリップを、同じ近づけ方で何個持ち上げられるか比べる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「同じ種類のクリップを、同じ近づけ方で何個持ち上げられるか比べる」です。同じ種類のクリップを使い、近づけ方などの条件もそろえて、持ち上げられる個数を比べると、電磁石の強さを公平に調べられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石が利用されているものと、そのはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "電気ベル", match: "打ち子を動かしてベルを鳴らす"),
        QuizMatchingPair(prompt: "鉄くずを運ぶクレーン", match: "鉄を引きつけたり離したりする"),
        QuizMatchingPair(prompt: "モーター", match: "磁力を利用して回転させる"),
        QuizMatchingPair(prompt: "スピーカー", match: "振動板を動かして音を出す")
        ],
        choices: [
        "振動板を動かして音を出す",
        "磁力を利用して回転させる",
        "鉄を引きつけたり離したりする",
        "打ち子を動かしてベルを鳴らす"
        ],
        explanation: "電気ベル、鉄くずを運ぶクレーン、モーター、スピーカーでは、電流によって生じる磁力が、それぞれ物を動かすために利用されています。"
        ),

        QuizQuestion.classification(
        question: "【分類】電磁石の実験での行動を、「安全で適切」「危険・不適切」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "回路をつなぎ直す前にスイッチを切る", match: "安全で適切"),
        QuizMatchingPair(prompt: "エナメル線の端だけを紙やすりでみがく", match: "安全で適切"),
        QuizMatchingPair(prompt: "乾電池の両端を導線だけで直接つなぐ", match: "危険・不適切"),
        QuizMatchingPair(prompt: "長い時間、電流を流したままにする", match: "危険・不適切")
        ],
        categories: ["安全で適切", "危険・不適切"],
        explanation: "回路を直すときはスイッチを切り、必要な部分だけをみがきます。乾電池の両端を直接つないだり、長時間電流を流したりすると、導線や乾電池が熱くなるおそれがあります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】コイルの巻き数と電磁石の強さの関係を調べる手順を、正しい順に並べましょう。",
        choices: [
        "200回巻きの電磁石を同じ乾電池につなぎ、持ち上げたクリップの数を数える",
        "同じ鉄しんと導線を使い、100回巻きと200回巻きの電磁石を用意する",
        "2つの結果を比べる",
        "100回巻きの電磁石を乾電池につなぎ、持ち上げたクリップの数を数える"
        ],
        orderedChoices: [
        "同じ鉄しんと導線を使い、100回巻きと200回巻きの電磁石を用意する",
        "100回巻きの電磁石を乾電池につなぎ、持ち上げたクリップの数を数える",
        "200回巻きの電磁石を同じ乾電池につなぎ、持ち上げたクリップの数を数える",
        "2つの結果を比べる"
        ],
        explanation: "まず鉄しんや導線などをそろえて巻き数だけが違う電磁石を作ります。同じ乾電池で順にクリップの数を測り、結果を比べます。"
        ),

        QuizQuestion(
        question: "生きたインゲンマメの種子と、十分に加熱してから冷ました種子を、同じ条件で育てました。生きた種子だけが発芽したことから、何がわかりますか？",
        choices: [
        "種子は生きていて、加熱すると発芽するはたらきを失うことがある",
        "加熱した種子には水が必要ない",
        "種子は冷ますと必ず発芽する",
        "発芽には日光だけが必要である"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「種子は生きていて、加熱すると発芽するはたらきを失うことがある」です。生きた種子だけが発芽したので、種子は生きており、強く加熱すると発芽するはたらきを失うことがあるとわかります。"
        ),

        QuizQuestion(
        question: "同じ種類の種子を10個ずつ用意し、どちらも湿らせて空気にふれさせました。25℃では9個、5℃では0個が発芽しました。この結果から最も適切にいえることはどれですか？",
        choices: [
        "発芽には土が必ず必要である",
        "発芽には適した温度が必要である",
        "低い温度ほど発芽しやすい",
        "発芽には日光が必ず必要である"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「発芽には適した温度が必要である」です。水と空気の条件を同じにして温度だけを変えたところ、25℃で発芽し、5℃では発芽しませんでした。この結果は、発芽には適した温度が必要であることを示しています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】インゲンマメの子葉にヨウ素液をつけると青紫色になりました。この反応から、子葉にたくわえられているとわかる養分を答えましょう。",
        answer: "でんぷん",
        acceptableAnswers: ["デンプン", "澱粉"],
        explanation: "ヨウ素液で青紫色になることから、子葉には「でんぷん」がたくわえられているとわかります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】種子の中のつくりと、発芽後の変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "種皮", match: "種子の中身を包んで守る"),
        QuizMatchingPair(prompt: "子葉", match: "たくわえた養分を成長に使う"),
        QuizMatchingPair(prompt: "幼根", match: "成長して根になる"),
        QuizMatchingPair(prompt: "幼芽", match: "成長して茎や葉になる")
        ],
        choices: [
        "成長して茎や葉になる",
        "種子の中身を包んで守る",
        "成長して根になる",
        "たくわえた養分を成長に使う"
        ],
        explanation: "種皮は種子の中身を守り、子葉の養分は発芽後の成長に使われます。幼根は根に、幼芽は茎や葉になります。"
        ),

        QuizQuestion.classification(
        question: "【分類】次の実験を、主に「発芽の条件を調べる実験」「発芽後の成長の条件を調べる実験」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "種子を乾いた脱脂綿と湿った脱脂綿に置く", match: "発芽の条件を調べる実験"),
        QuizMatchingPair(prompt: "種子を暖かい場所と冷たい場所に置く", match: "発芽の条件を調べる実験"),
        QuizMatchingPair(prompt: "同じ大きさの苗の一方だけ日光をさえぎる", match: "発芽後の成長の条件を調べる実験"),
        QuizMatchingPair(prompt: "同じ大きさの苗の一方だけ肥料を与えない", match: "発芽後の成長の条件を調べる実験")
        ],
        categories: ["発芽の条件を調べる実験", "発芽後の成長の条件を調べる実験"],
        explanation: "水や温度を変えて種子の発芽を比べるのは発芽の条件を調べる実験です。苗の日光や肥料の条件を変えるのは、発芽後の成長の条件を調べる実験です。"
        ),

        QuizQuestion(
        question: "一定の時間に降った雨の量を測る器具はどれですか？",
        choices: [
        "百葉箱",
        "風向計",
        "雨量計",
        "温度計"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「雨量計」です。雨量計は、一定の時間に降った雨の量を測る器具です。"
        ),

        QuizQuestion(
        question: "雲の動きをもとに天気を予想するとき、最も適切な調べ方はどれですか？",
        choices: [
        "同じ時刻の気温だけを何度も測る",
        "1枚の雲画像だけを見て決める",
        "前日の天気だけをそのまま当てはめる",
        "時刻の異なる雲画像を並べて動く向きや速さを調べる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「時刻の異なる雲画像を並べて動く向きや速さを調べる」です。時刻の異なる雲画像を並べると、雲が動く向きや速さを読み取れるため、その後の天気を予想しやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】雨や雪など、空から降ってきた水の量を何といいますか。",
        answer: "降水量",
        acceptableAnswers: ["こうすいりょう"],
        explanation: "雨や雪など、空から降ってきた水の量を「降水量」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】天気の観測項目と、記録のしかたを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "気温", match: "℃で記録する"),
        QuizMatchingPair(prompt: "降水量", match: "mmで記録する"),
        QuizMatchingPair(prompt: "風向", match: "風が吹いてくる方位で記録する"),
        QuizMatchingPair(prompt: "雲量", match: "空全体を10とした数で記録する")
        ],
        choices: [
        "空全体を10とした数で記録する",
        "風が吹いてくる方位で記録する",
        "℃で記録する",
        "mmで記録する"
        ],
        explanation: "気温は℃、降水量はmmで記録します。風向は風が吹いてくる方位、雲量は空全体を10とした数で表します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】西から東へ進む、雨を降らせる大きな雲のかたまりと、町の天気の変化を早い順に並べましょう。",
        choices: [
        "雲のかたまりが町の東へ抜ける",
        "雲の先端が町の上空にかかる",
        "雲が町の西にあり、町は晴れている",
        "町全体が雲におおわれて雨が降る"
        ],
        orderedChoices: [
        "雲が町の西にあり、町は晴れている",
        "雲の先端が町の上空にかかる",
        "町全体が雲におおわれて雨が降る",
        "雲のかたまりが町の東へ抜ける"
        ],
        explanation: "雲のかたまりが西から近づき、先端が町にかかったあと、町全体をおおって雨を降らせ、やがて東へ抜けていきます。"
        ),

        QuizQuestion(
        question: "川の下流で見られる石が、上流の石より丸みを帯びている主な理由はどれですか？",
        choices: [
        "下流の水が石をふくらませるから",
        "流される間に石どうしがぶつかり、角がけずられるから",
        "海の塩が石を丸くするから",
        "下流では新しい石がつくられるから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「流される間に石どうしがぶつかり、角がけずられるから」です。石は川を流される間に石どうしや川底にぶつかり、角がけずられるため、下流ほど丸みを帯びやすくなります。"
        ),

        QuizQuestion(
        question: "同じ土と同じ量の水を使い、傾きだけが異なる2つの坂で実験しました。傾きが急な坂では、どのような結果になりやすいですか？",
        choices: [
        "水が止まり、土砂はまったく動かない",
        "流れが遅くなり、土砂が上へ運ばれる",
        "流れが速くなり、より多くの土砂が運ばれる",
        "流れの速さも土砂の動きも変わらない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「流れが速くなり、より多くの土砂が運ばれる」です。坂の傾きが急になると水の流れが速くなり、土をけずったり土砂を運んだりするはたらきが強くなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】大雨などで川の水が大きく増え、川から水があふれることを何といいますか。",
        answer: "洪水",
        acceptableAnswers: ["こうずい"],
        explanation: "大雨などで川の水が増え、川から水があふれることを「洪水」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】流れる水による変化を「侵食」「運搬」「堆積」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "川岸の土がけずられる", match: "侵食"),
        QuizMatchingPair(prompt: "けずられた砂が水とともに流れる", match: "運搬"),
        QuizMatchingPair(prompt: "大きな石が川底を転がって移動する", match: "運搬"),
        QuizMatchingPair(prompt: "流れがゆるやかな場所に泥がたまる", match: "堆積")
        ],
        categories: ["侵食", "運搬", "堆積"],
        explanation: "川岸がけずられるのは侵食、砂や石が移動するのは運搬、流れがゆるやかな場所に泥がたまるのは堆積です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】坂の傾きや土の種類を同じにし、1分間に流す水の量だけを変えます。地面をけずるはたらきが強い順に並べましょう。",
        choices: [
        "1分間に400 mL",
        "1分間に800 mL",
        "1分間に200 mL",
        "1分間に600 mL"
        ],
        rankedChoices: [
        "1分間に800 mL",
        "1分間に600 mL",
        "1分間に400 mL",
        "1分間に200 mL"
        ],
        explanation: "ほかの条件が同じなら、流す水の量が多いほど流れる水のはたらきが強くなります。したがって、800 mL、600 mL、400 mL、200 mLの順です。"
        ),

        QuizQuestion(
        question: "100 gの水に15 gの食塩を入れ、すべて溶かしました。できた食塩水の重さは何gですか？",
        choices: [
        "85 g",
        "100 g",
        "105 g",
        "115 g"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「115 g」です。食塩が見えなくなっても重さはなくなりません。水100 gと食塩15 gを合わせるので、食塩水は115 gです。"
        ),

        QuizQuestion(
        question: "100 gの水に溶けるミョウバンの量は、60℃で40 g、20℃で15 gです。60℃の水に35 gを溶かしてから20℃まで冷やすと、何gの結晶が出ますか？",
        choices: [
        "20 g",
        "15 g",
        "25 g",
        "35 g"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「20 g」です。20℃では15 gまで溶けたままでいられます。35−15＝20なので、20 gのミョウバンが結晶として出ます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ある温度の一定量の水に、物が溶ける量には ＿＿ があります。",
        answer: "限度",
        acceptableAnswers: ["げんど"],
        explanation: "ある温度の一定量の水に物が溶ける量には「限度」があります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】水に物を溶かす実験での観察と、そこからわかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "十分にかき混ぜても底に固体が残った", match: "その温度で溶ける限度に達している"),
        QuizMatchingPair(prompt: "透明な食塩水を半分だけ別の容器へ移した", match: "移した液にも食塩が含まれている"),
        QuizMatchingPair(prompt: "食塩を溶かす前後で全体の重さが同じだった", match: "溶けても食塩の重さはなくならない"),
        QuizMatchingPair(prompt: "同じ温度と水量で物の種類を変えると溶ける量が違った", match: "物の種類によって溶ける量が異なる")
        ],
        choices: [
        "物の種類によって溶ける量が異なる",
        "溶けても食塩の重さはなくならない",
        "その温度で溶ける限度に達している",
        "移した液にも食塩が含まれている"
        ],
        explanation: "溶け残りは限度に達したことを示します。水溶液は全体に溶けた物が広がり、溶けても重さはなくなりません。また、溶ける量は物の種類によって異なります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】水の温度によるミョウバンの溶ける量の違いを調べる手順を、正しい順に並べましょう。",
        choices: [
        "それぞれにミョウバンを少しずつ加えてかき混ぜる",
        "同じ量の水を2つの容器に入れる",
        "溶け残りが出るまでに加えた量を比べる",
        "一方を20℃、もう一方を60℃にする"
        ],
        orderedChoices: [
        "同じ量の水を2つの容器に入れる",
        "一方を20℃、もう一方を60℃にする",
        "それぞれにミョウバンを少しずつ加えてかき混ぜる",
        "溶け残りが出るまでに加えた量を比べる"
        ],
        explanation: "まず水の量を同じにし、温度だけを変えます。次にミョウバンを少しずつ加え、溶け残りが出るまでに加えた量を比べます。"
        ),

        QuizQuestion(
        question: "振り子の長さとして測るのは、どこからどこまでですか？",
        choices: [
        "支点からおもりの中心まで",
        "糸の上端からおもりの下端まで",
        "おもりの端から振れる先の端まで",
        "床から支点まで"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「支点からおもりの中心まで」です。振り子の長さは、糸をつるした支点からおもりの中心までを測ります。"
        ),

        QuizQuestion(
        question: "おもりの重さが1往復する時間に関係するかを調べます。おもりの重さ以外で、同じにする条件として最も適切なものはどれですか？",
        choices: [
        "おもりの色と測る人",
        "糸の長さと振れ幅",
        "糸の太さと実験する曜日",
        "おもりの形だけ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「糸の長さと振れ幅」です。おもりの重さだけの影響を調べるには、糸の長さと振れ幅を同じにして比べます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】振り子の実験で調べる量と、その求め方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "振り子の長さ", match: "支点からおもりの中心までをものさしで測る"),
        QuizMatchingPair(prompt: "10往復する時間", match: "ストップウォッチで測る"),
        QuizMatchingPair(prompt: "1往復する時間", match: "10往復する時間を10で割る"),
        QuizMatchingPair(prompt: "振れ幅", match: "中央の位置から振れた端までの大きさをそろえる")
        ],
        choices: [
        "10往復する時間を10で割る",
        "ストップウォッチで測る",
        "中央の位置から振れた端までの大きさをそろえる",
        "支点からおもりの中心までをものさしで測る"
        ],
        explanation: "振り子の長さは支点からおもりの中心までを測ります。10往復の時間を測り、それを10で割ると1往復の時間を求められます。振れ幅も実験ごとにそろえます。"
        ),

        QuizQuestion.classification(
        question: "【分類】おもりの重さが1往復する時間に関係するかを調べる実験で、項目を「変える条件」「そろえる条件」「測る結果」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "おもりの重さ", match: "変える条件"),
        QuizMatchingPair(prompt: "糸の長さ", match: "そろえる条件"),
        QuizMatchingPair(prompt: "振り始める位置", match: "そろえる条件"),
        QuizMatchingPair(prompt: "10往復する時間", match: "測る結果")
        ],
        categories: ["変える条件", "そろえる条件", "測る結果"],
        explanation: "おもりの重さだけを変え、糸の長さと振り始める位置をそろえます。そして、10往復する時間を測って比べます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】おもりの重さと振れ幅を同じにした振り子を、1往復する時間が長い順に並べましょう。",
        choices: [
        "糸の長さ20 cm",
        "糸の長さ80 cm",
        "糸の長さ40 cm",
        "糸の長さ60 cm"
        ],
        rankedChoices: [
        "糸の長さ80 cm",
        "糸の長さ60 cm",
        "糸の長さ40 cm",
        "糸の長さ20 cm"
        ],
        explanation: "ほかの条件が同じなら、糸が長い振り子ほど1往復する時間が長くなります。80 cm、60 cm、40 cm、20 cmの順です。"
        ),

        QuizQuestion(
        question: "鉄しん入りのコイルに電流を流すと鉄のクリップを引きつけました。スイッチを切ると、ふつうどうなりますか？",
        choices: [
        "N極とS極が必ず入れ替わる",
        "引きつける力がさらに強くなる",
        "クリップをほとんど引きつけなくなる",
        "鉄しんが永久に強い磁石になる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「クリップをほとんど引きつけなくなる」です。電磁石は電流が流れている間に磁力を示します。スイッチを切ると電流が止まり、クリップをほとんど引きつけなくなります。"
        ),

        QuizQuestion(
        question: "電磁石Aはコイル100回巻き・乾電池1個、電磁石Bはコイル50回巻き・乾電池2個です。どちらが強いかを比べるとき、最も適切な考えはどれですか？",
        choices: [
        "巻き数が多いので、必ずAが強い",
        "乾電池が多いので、必ずBが強い",
        "巻き数と乾電池の数が違っても、必ず同じ強さになる",
        "2つの条件が同時に違うため、この比較だけでは判断できない"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「2つの条件が同時に違うため、この比較だけでは判断できない」です。AとBではコイルの巻き数と乾電池の数の2条件が同時に違います。どちらか一方の条件をそろえなければ、それぞれの影響を正しく比べられません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】導線を同じ向きに何回も巻いたものを何といいますか。",
        answer: "コイル",
        acceptableAnswers: [],
        explanation: "導線を同じ向きに何回も巻いたものを「コイル」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】電磁石に加えた変化と結果を、「極が入れ替わる」「強くなる」「弱くなる」「磁力がほぼなくなる」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乾電池の向きを反対にする", match: "極が入れ替わる"),
        QuizMatchingPair(prompt: "コイルの巻き数を増やす", match: "強くなる"),
        QuizMatchingPair(prompt: "直列につないだ乾電池を2個から1個に減らす", match: "弱くなる"),
        QuizMatchingPair(prompt: "スイッチを切る", match: "磁力がほぼなくなる")
        ],
        categories: ["極が入れ替わる", "強くなる", "弱くなる", "磁力がほぼなくなる"],
        explanation: "乾電池の向きを反対にすると電流の向きが変わり、極が入れ替わります。巻き数を増やすと強くなり、乾電池を減らすと弱くなります。スイッチを切ると磁力はほぼなくなります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】電磁石の極が電流の向きで変わるかを調べる手順を、正しい順に並べましょう。",
        choices: [
        "スイッチを切って乾電池の向きを反対にし、もう一度方位磁針の動きを調べる",
        "コイルと乾電池、スイッチを回路につなぐ",
        "スイッチを入れて電流を流す",
        "電磁石の端に方位磁針を近づけ、針の動きを記録する"
        ],
        orderedChoices: [
        "コイルと乾電池、スイッチを回路につなぐ",
        "スイッチを入れて電流を流す",
        "電磁石の端に方位磁針を近づけ、針の動きを記録する",
        "スイッチを切って乾電池の向きを反対にし、もう一度方位磁針の動きを調べる"
        ],
        explanation: "回路をつないで電流を流し、まず方位磁針の動きを記録します。その後、乾電池の向きを反対にして同じ観察を行い、極の変化を比べます。"
        ),

        QuizQuestion(
        question: "インゲンマメが発芽してしばらくすると、子葉にたくわえられていた養分はどうなりますか？",
        choices: [
        "成長に使われて少なくなる",
        "外から取り入れられて多くなる",
        "水に変わってなくなる",
        "根から子葉へ運ばれて増える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「成長に使われて少なくなる」です。子葉にたくわえられていた養分は、発芽後の根や茎、葉の成長に使われるため、しだいに少なくなります。"
        ),

        QuizQuestion(
        question: "インゲンマメの苗の成長に日光が必要かを調べる実験で、変える条件として正しいものはどれですか？",
        choices: [
        "与える水の量",
        "苗を置く場所の温度",
        "使う苗の種類",
        "日光を当てるかどうか"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「日光を当てるかどうか」です。日光の必要性を調べるので、変える条件は「日光を当てるかどうか」だけにし、水の量や温度、苗の種類は同じにします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】種子が水を吸い、根や芽を出して育ち始めることを何といいますか。",
        answer: "発芽",
        acceptableAnswers: ["はつが"],
        explanation: "種子が根や芽を出して育ち始めることを「発芽」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】インゲンマメの体の部分と主なはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "子葉", match: "発芽直後の成長に使う養分をたくわえる"),
        QuizMatchingPair(prompt: "根", match: "水や肥料分を取り入れる"),
        QuizMatchingPair(prompt: "茎", match: "葉を支え、水などの通り道になる"),
        QuizMatchingPair(prompt: "本葉", match: "日光を受けて養分をつくる")
        ],
        choices: [
        "水や肥料分を取り入れる",
        "日光を受けて養分をつくる",
        "発芽直後の成長に使う養分をたくわえる",
        "葉を支え、水などの通り道になる"
        ],
        explanation: "子葉は発芽直後の成長に使う養分をたくわえ、根は水や肥料分を取り入れます。茎は葉を支えて水などの通り道になり、本葉は日光を受けて養分をつくります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】インゲンマメが発芽して育ち始めるようすを、早い順に並べましょう。",
        choices: [
        "茎がのび、子葉が地上に出る",
        "本葉が開いて大きくなる",
        "種子が水を吸ってふくらむ",
        "根が種皮を破って出る"
        ],
        orderedChoices: [
        "種子が水を吸ってふくらむ",
        "根が種皮を破って出る",
        "茎がのび、子葉が地上に出る",
        "本葉が開いて大きくなる"
        ],
        explanation: "種子が水を吸ってふくらみ、根が出たあと、茎と子葉が地上に出て、最後に本葉が開いて大きくなります。"
        ),

        QuizQuestion(
        question: "日本付近の天気は、多くの場合、どの方角からどの方角へ変化していきますか？",
        choices: [
        "東から西",
        "西から東",
        "北から南",
        "南から北"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「西から東」です。日本付近では、多くの場合、雲や雨の区域が西から東へ移動するため、天気も西から東へ変化します。"
        ),

        QuizQuestion(
        question: "午前9時の雨雲レーダーでは町の西側に雨雲があり、正午にはその雨雲が町に近づいていました。このあと起こる可能性が最も高いことはどれですか？",
        choices: [
        "気温が必ず0度になる",
        "雨雲が西へ戻る",
        "町で雨が降り始める",
        "雲がすべて消えて快晴になる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「町で雨が降り始める」です。雨雲が西側から町へ近づいているので、このあと町で雨が降り始める可能性が最も高いと考えられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】空全体を10としたとき、雲がおおっている割合を何といいますか。",
        answer: "雲量",
        acceptableAnswers: ["うんりょう"],
        explanation: "空全体を10としたとき、雲がおおっている割合を「雲量」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】天気を調べる資料や器具と、わかることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "気象衛星の雲画像", match: "広い範囲の雲の分布"),
        QuizMatchingPair(prompt: "雨雲レーダー", match: "雨の強さと雨雲の動き"),
        QuizMatchingPair(prompt: "アメダス", match: "各地の降水量や気温など"),
        QuizMatchingPair(prompt: "風向計", match: "風が吹いてくる方向")
        ],
        choices: [
        "各地の降水量や気温など",
        "風が吹いてくる方向",
        "広い範囲の雲の分布",
        "雨の強さと雨雲の動き"
        ],
        explanation: "気象衛星の雲画像では広い範囲の雲の分布、雨雲レーダーでは雨の強さと雨雲の動き、アメダスでは各地の降水量や気温など、風向計では風が吹いてくる方向がわかります。"
        ),

        QuizQuestion.classification(
        question: "【分類】雨や雪が降っていないときの雲量を「快晴」「晴れ」「くもり」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "雲量0", match: "快晴"),
        QuizMatchingPair(prompt: "雲量1", match: "快晴"),
        QuizMatchingPair(prompt: "雲量5", match: "晴れ"),
        QuizMatchingPair(prompt: "雲量10", match: "くもり")
        ],
        categories: ["快晴", "晴れ", "くもり"],
        explanation: "雲量0〜1は快晴、2〜8は晴れ、9〜10はくもりです。したがって、雲量0と1は快晴、雲量5は晴れ、雲量10はくもりです。"
        ),

        QuizQuestion(
        question: "川が曲がっているところで、水の流れが速く、岸がけずられやすいのはどこですか？",
        choices: [
        "内側の岸",
        "川の中央だけ",
        "外側の岸",
        "どこも同じ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「外側の岸」です。川が曲がっているところでは外側の流れが速くなるため、外側の岸がけずられやすくなります。"
        ),

        QuizQuestion(
        question: "大雨のあと、川の水の量と流れる水のはたらきは、ふつうどのようになりますか？",
        choices: [
        "水量が増え、地面をけずるはたらきも強くなる",
        "水量が減り、土砂を運ぶはたらきも弱くなる",
        "水量は増えるが、土砂を運ばなくなる",
        "水量は変わらず、石だけが軽くなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「水量が増え、地面をけずるはたらきも強くなる」です。大雨のあとは川の水量と流れの速さが増し、地面をけずったり、土砂を運んだりするはたらきが強くなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】流れる水によって地面がけずられるはたらきを何といいますか。",
        answer: "侵食",
        acceptableAnswers: ["しん食", "しんしょく"],
        explanation: "流れる水によって地面がけずられるはたらきを「侵食」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】川のようすを「上流」「中流」「下流」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "山地でV字形の谷が見られる", match: "上流"),
        QuizMatchingPair(prompt: "大きく角ばった石が多い", match: "上流"),
        QuizMatchingPair(prompt: "平野に出て川幅が広くなる", match: "中流"),
        QuizMatchingPair(prompt: "海の近くで細かい砂や泥が積もる", match: "下流")
        ],
        categories: ["上流", "中流", "下流"],
        explanation: "上流ではV字形の谷や大きく角ばった石が見られます。中流では平野に出て川幅が広くなり、下流の海に近い場所では細かい砂や泥が積もります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ川で見られる石の大きさを、一般に大きい順に並べましょう。",
        choices: [
        "平野の下流",
        "山地を出た中流",
        "河口付近",
        "山地の上流"
        ],
        rankedChoices: [
        "山地の上流",
        "山地を出た中流",
        "平野の下流",
        "河口付近"
        ],
        explanation: "川の石は流される間にぶつかって小さくなるため、一般に山地の上流、山地を出た中流、平野の下流、河口付近の順に小さくなります。"
        ),

        QuizQuestion(
        question: "同じ量の水にミョウバンをもっと多く溶かしたいとき、最も効果的な方法はどれですか？",
        choices: [
        "水を冷やす",
        "ろ過する",
        "水を蒸発させる",
        "水の温度を上げる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「水の温度を上げる」です。ミョウバンは水の温度が高いほど多く溶けるため、水の温度を上げる方法が最も効果的です。"
        ),

        QuizQuestion(
        question: "ある温度で、100 gの水に食塩が最大40 gまで溶けます。すでに25 g溶けているとき、あと何gまで溶かせますか？",
        choices: [
        "10 g",
        "15 g",
        "25 g",
        "65 g"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「15 g」です。最大40 gまで溶け、すでに25 g溶けているので、40−25＝15 gです。あと15 gまで溶かせます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】食塩水のように、物が水に溶けて全体に広がった液を何といいますか。",
        answer: "水溶液",
        acceptableAnswers: ["すいようえき"],
        explanation: "物が水に溶けて全体に広がった液を「水溶液」といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】操作と、その結果を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "食塩水を加熱して水を蒸発させる", match: "食塩の結晶が残る"),
        QuizMatchingPair(prompt: "熱いミョウバン水溶液を冷やす", match: "ミョウバンの結晶が出る"),
        QuizMatchingPair(prompt: "泥水をろ過する", match: "泥がろ紙に残る"),
        QuizMatchingPair(prompt: "水に溶ける量より少ない砂糖を入れて十分にかき混ぜる", match: "透明な砂糖水になる")
        ],
        choices: [
        "泥がろ紙に残る",
        "透明な砂糖水になる",
        "食塩の結晶が残る",
        "ミョウバンの結晶が出る"
        ],
        explanation: "食塩水を加熱すると食塩の結晶が残り、熱いミョウバン水溶液を冷やすとミョウバンの結晶が出ます。泥水をろ過すると泥がろ紙に残り、砂糖を水に十分に溶かすと透明な砂糖水になります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】どれも食塩がすべて溶けているものとして、食塩水を濃い順に並べましょう。",
        choices: [
        "100 mLの水に食塩10 g",
        "100 mLの水に食塩20 g",
        "100 mLの水に食塩5 g",
        "100 mLの水に食塩15 g"
        ],
        rankedChoices: [
        "100 mLの水に食塩20 g",
        "100 mLの水に食塩15 g",
        "100 mLの水に食塩10 g",
        "100 mLの水に食塩5 g"
        ],
        explanation: "水の量がどれも100 mLで同じなので、溶けている食塩が多いほど濃くなります。20 g、15 g、10 g、5 gの順です。"
        ),

        QuizQuestion(
        question: "振り子の1往復する時間を長くするには、どのようにすればよいですか？",
        choices: [
        "糸を長くする",
        "おもりを重くする",
        "振れ幅を大きくする",
        "おもりを強く押す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は「糸を長くする」です。振り子の1往復する時間は、糸を長くすると長くなります。おもりの重さや小さな範囲の振れ幅では、ほとんど変わりません。"
        ),

        QuizQuestion(
        question: "振り子が10往復するのに20秒かかりました。1往復する時間は何秒ですか？",
        choices: [
        "0.5秒",
        "1秒",
        "2秒",
        "10秒"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は「2秒」です。20秒を10往復で割ると、20÷10＝2なので、1往復する時間は2秒です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】振り子が一方の端から動き、元の位置にもどるまでの動きを1 ＿＿ といいます。",
        answer: "往復",
        acceptableAnswers: ["おうふく"],
        explanation: "振り子が一方の端から動き、元の位置にもどるまでの動きを「1往復」といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】条件の変え方を、振り子の「1往復する時間が変わる」「ほとんど変わらない」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "糸の長さを変える", match: "1往復する時間が変わる"),
        QuizMatchingPair(prompt: "おもりの重さを変える", match: "ほとんど変わらない"),
        QuizMatchingPair(prompt: "振れ幅を小さな範囲で変える", match: "ほとんど変わらない"),
        QuizMatchingPair(prompt: "おもりの色を変える", match: "ほとんど変わらない")
        ],
        categories: ["1往復する時間が変わる", "ほとんど変わらない"],
        explanation: "振り子の1往復する時間は糸の長さで変わります。おもりの重さ、小さな範囲の振れ幅、おもりの色では、ほとんど変わりません。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】糸の長さと1往復する時間の関係を調べる実験の手順を、正しい順に並べましょう。",
        choices: [
        "10往復する時間を測る",
        "糸の長さを変え、同じ方法でくり返す",
        "糸の長さを決めて装置を作る",
        "おもりを同じ角度まで引き、押さずに離す"
        ],
        orderedChoices: [
        "糸の長さを決めて装置を作る",
        "おもりを同じ角度まで引き、押さずに離す",
        "10往復する時間を測る",
        "糸の長さを変え、同じ方法でくり返す"
        ],
        explanation: "糸の長さを決めて装置を作り、おもりを同じ角度まで引いて押さずに離します。10往復する時間を測ったあと、糸の長さを変えて同じ方法でくり返します。"
        ),

        QuizQuestion(
        question: "電磁石のしんに使う材料として最も適しているものはどれですか？",
        choices: [
        "銅の棒",
        "鉄のくぎ",
        "アルミニウムの棒",
        "木の棒"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は「鉄のくぎ」です。電磁石のしんには、電流を流したときに磁化されやすい鉄のくぎが適しています。"
        ),

        QuizQuestion(
        question: "乾電池の数や鉄しんを同じにして、コイルの巻き数だけを変えます。電磁石を強くするにはどうすればよいですか？",
        choices: [
        "巻き数を少なくする",
        "導線を切る",
        "スイッチを切ったままにする",
        "巻き数を多くする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は「巻き数を多くする」です。乾電池の数や鉄しんが同じなら、コイルの巻き数を多くすると電磁石は強くなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】電磁石の回路に使うものと、そのはたらきを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "コイル", match: "電流が流れると磁力を生じる"),
        QuizMatchingPair(prompt: "鉄しん", match: "磁力を強くする"),
        QuizMatchingPair(prompt: "乾電池", match: "回路に電流を流す"),
        QuizMatchingPair(prompt: "スイッチ", match: "電流を流したり止めたりする")
        ],
        choices: [
        "回路に電流を流す",
        "電流を流したり止めたりする",
        "磁力を強くする",
        "電流が流れると磁力を生じる"
        ],
        explanation: "コイルは電流が流れると磁力を生じ、鉄しんは磁力を強くします。乾電池は回路に電流を流し、スイッチは電流を流したり止めたりします。"
        ),

        QuizQuestion.classification(
        question: "【分類】電磁石の強さの変化を「強くなる」「弱くなる」に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乾電池を1個から直列2個に増やす", match: "強くなる"),
        QuizMatchingPair(prompt: "コイルの巻き数を増やす", match: "強くなる"),
        QuizMatchingPair(prompt: "乾電池を回路から外す", match: "弱くなる"),
        QuizMatchingPair(prompt: "コイルの巻き数を減らす", match: "弱くなる")
        ],
        categories: ["強くなる", "弱くなる"],
        explanation: "乾電池を1個から直列2個に増やしたり、コイルの巻き数を増やしたりすると電磁石は強くなります。乾電池を外したり、巻き数を減らしたりすると弱くなります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】電磁石を作って鉄のクリップを引きつける実験の手順を、正しい順に並べましょう。",
        choices: [
        "スイッチを入れて電流を流す",
        "鉄のくぎにエナメル線を巻く",
        "鉄のクリップを近づけて確かめる",
        "導線と乾電池、スイッチを回路につなぐ"
        ],
        orderedChoices: [
        "鉄のくぎにエナメル線を巻く",
        "導線と乾電池、スイッチを回路につなぐ",
        "スイッチを入れて電流を流す",
        "鉄のクリップを近づけて確かめる"
        ],
        explanation: "鉄のくぎに導線を巻いてから回路につなぎ、スイッチを入れて電流を流します。そのあと鉄のクリップを近づけ、引きつけるか確かめます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika5, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika5ListView(isPresenting: .constant(false))
    }
}
