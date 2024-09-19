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
                "雲同士の摩擦",
                "風の強さ",
                "太陽の熱",
                "雲の動き"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は雲同士が摩擦を起こすことで発生します。"
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
            question: "雷が鳴るとき、空気中で起こっている現象は何ですか？",
            choices: [
                "空気の摩擦",
                "水の蒸発",
                "風の強まり",
                "光の反射"
            ],
            correctAnswerIndex: 0,
            explanation: "雷が発生するのは、空気中の摩擦によるものです。"
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
                "雲同士の摩擦で発生する",
                "風が強くなることで発生する",
                "太陽が照りつけることで発生する",
                "月の光で発生する"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は雲同士の摩擦によって発生します。"
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
                "雲の摩擦",
                "太陽の光",
                "月の引力",
                "風の強さ"
            ],
            correctAnswerIndex: 0,
            explanation: "雷は、雲同士の摩擦によって発生します。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika5, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika5ListView(isPresenting: .constant(false))
    }
}
