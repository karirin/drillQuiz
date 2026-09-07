//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika3ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】水が あたためられて 空気中へ 出ていくことを ひらがなで答えましょう。",
            answer: "じょうはつ",
            acceptableAnswers: ["蒸発"],
            explanation: "水が あたためられて 水蒸気になることを『じょうはつ』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】太陽が しずむ 方角を答えましょう。",
            answer: "西",
            acceptableAnswers: ["にし"],
            explanation: "太陽は 西の方角に しずみます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】植物の ぶぶんと はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "根", match: "水を すい上げる"),
                QuizMatchingPair(prompt: "くき", match: "からだを ささえる"),
                QuizMatchingPair(prompt: "葉", match: "日光を 受ける")
            ],
            choices: ["日光を 受ける", "水を すい上げる", "からだを ささえる"],
            explanation: "根は 水をすい上げ、くきは からだをささえ、葉は 日光を受けます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】電気の どうぐと 役目が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "乾電池", match: "電気を ためる"),
                QuizMatchingPair(prompt: "導線", match: "電気を 通す"),
                QuizMatchingPair(prompt: "豆電球", match: "光る")
            ],
            choices: ["光る", "電気を 通す", "電気を ためる"],
            explanation: "乾電池は 電気のもと、導線は 電気の通り道、豆電球は 光る部分です。"
        ),

        QuizQuestion.classification(
            question: "【分類】ものを 『うく』『しずむ』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "木ぎれ", match: "うく"),
                QuizMatchingPair(prompt: "石", match: "しずむ"),
                QuizMatchingPair(prompt: "プラスチックの ボール", match: "うく")
            ],
            categories: ["うく", "しずむ"],
            explanation: "木ぎれや プラスチックのボールは うき、石は しずみます。"
        ),

        QuizQuestion.classification(
            question: "【分類】てんたいを 『昼に見える』『夜に見える』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "太陽", match: "昼に見える"),
                QuizMatchingPair(prompt: "月", match: "夜に見える"),
                QuizMatchingPair(prompt: "星", match: "夜に見える")
            ],
            categories: ["昼に見える", "夜に見える"],
            explanation: "太陽は 昼に、月や 星は 夜に見えることが多いです。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】ホウセンカの そだちかたを じゅんに ならべましょう。",
            choices: ["花が さく", "たねを まく", "めが 出る"],
            orderedChoices: ["たねを まく", "めが 出る", "花が さく"],
            explanation: "ホウセンカは たねをまき、めが出てから 花がさきます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】わく星を 大きいじゅんに ならべましょう。",
            choices: ["火星", "木星", "地球"],
            rankedChoices: ["木星", "地球", "火星"],
            explanation: "大きさをくらべると、木星、地球、火星の順です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】光が 当たって できる くらいところを答えましょう。",
            answer: "影",
            acceptableAnswers: ["かげ"],
            explanation: "光が 当たらない くらいところを『影』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】電気を よく通す ものの なかまを答えましょう。",
            answer: "金属",
            acceptableAnswers: ["きんぞく"],
            explanation: "鉄や 銅のような『金属』は 電気をよく通します。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】こん虫の からだの 部分と 役目が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "口", match: "食べる"),
                QuizMatchingPair(prompt: "はね", match: "とぶ"),
                QuizMatchingPair(prompt: "あし", match: "歩く")
            ],
            choices: ["歩く", "食べる", "とぶ"],
            explanation: "口は 食べる、はねは とぶ、あしは 歩く ときに使います。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】時こくと 太陽の 方角が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "朝", match: "東"),
                QuizMatchingPair(prompt: "昼ごろ", match: "南"),
                QuizMatchingPair(prompt: "夕方", match: "西")
            ],
            choices: ["南", "西", "東"],
            explanation: "太陽は 朝に東、昼ごろ南、夕方に西の空に見えます。"
        ),

        QuizQuestion.classification(
            question: "【分類】植物を 『花がさく』『花がさかない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "ホウセンカ", match: "花がさく"),
                QuizMatchingPair(prompt: "シダ", match: "花がさかない"),
                QuizMatchingPair(prompt: "ヒマワリ", match: "花がさく")
            ],
            categories: ["花がさく", "花がさかない"],
            explanation: "ホウセンカや ヒマワリは 花がさき、シダは 花がさきません。"
        ),

        QuizQuestion.classification(
            question: "【分類】虫めがねの 使い方を 『よい使い方』『あぶない使い方』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "太陽を 見ない", match: "よい使い方"),
                QuizMatchingPair(prompt: "日光を 集める", match: "あぶない使い方"),
                QuizMatchingPair(prompt: "見たいものに 近づける", match: "よい使い方")
            ],
            categories: ["よい使い方", "あぶない使い方"],
            explanation: "虫めがねで 太陽や 日光を集めるのは 危険です。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】かげの 長さの 変わり方を 1日のじゅんに ならべましょう。",
            choices: ["昼ごろ いちばん短い", "朝 長い", "夕方 また長くなる"],
            orderedChoices: ["朝 長い", "昼ごろ いちばん短い", "夕方 また長くなる"],
            explanation: "かげは 朝と夕方に長く、昼ごろに いちばん短くなります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】植物を せの高いじゅんに ならべましょう。",
            choices: ["タンポポ", "ヒマワリ", "ホウセンカ"],
            rankedChoices: ["ヒマワリ", "ホウセンカ", "タンポポ"],
            explanation: "ふつうは、ヒマワリ、ホウセンカ、タンポポの順に 高く育ちます。"
        ),

        QuizQuestion(
            question: "木が二酸化炭素を吸収すると、何を出しますか？",
            choices: [
                "水",
                "酸素",
                "二酸化炭素",
                "窒素"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は二酸化炭素を吸収し、酸素を出します。"
        ),

        QuizQuestion(
            question: "電球が光るために必要なものはどれですか？",
            choices: [
                "電気",
                "水",
                "風",
                "光"
            ],
            correctAnswerIndex: 0,
            explanation: "電球は電気が通ることで光ります。"
        ),

        QuizQuestion(
            question: "地球が回転していることによって生じる現象はどれですか？",
            choices: [
                "季節の変化",
                "昼と夜の変化",
                "月の満ち欠け",
                "雨の降り方"
            ],
            correctAnswerIndex: 1,
            explanation: "地球が自転することで昼と夜が生じます。"
        ),

        QuizQuestion(
            question: "水に浮かびやすいものはどれですか？",
            choices: [
                "鉄のボール",
                "プラスチックのボール",
                "石",
                "ガラスのコップ"
            ],
            correctAnswerIndex: 1,
            explanation: "プラスチックのボールは軽く、水に浮かびやすいです。"
        ),

        QuizQuestion(
            question: "太陽はどのように見えますか？",
            choices: [
                "止まっているように見える",
                "ゆっくり動いているように見える",
                "とても速く動いているように見える",
                "消えたり現れたりするように見える"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は地球の自転により、ゆっくり動いているように見えます。"
        ),

        QuizQuestion(
            question: "雷がなる前に見える光は何ですか？",
            choices: [
                "星",
                "稲妻",
                "太陽",
                "月"
            ],
            correctAnswerIndex: 1,
            explanation: "雷がなる前に稲妻が光るのが見えます。"
        ),

        QuizQuestion(
            question: "夏の間に木々が青々としている理由は何ですか？",
            choices: [
                "日光をたくさん受けるから",
                "雨が少ないから",
                "風が強いから",
                "気温が低いから"
            ],
            correctAnswerIndex: 0,
            explanation: "夏は日光をたくさん受けるため、木々が青々としています。"
        ),

        QuizQuestion(
            question: "植物の根が行う役割はどれですか？",
            choices: [
                "酸素を出す",
                "水を吸い上げる",
                "花を咲かせる",
                "光を集める"
            ],
            correctAnswerIndex: 1,
            explanation: "植物の根は土から水や栄養を吸い上げる役割を持っています。"
        ),

        QuizQuestion(
            question: "地球が一回転するのにかかる時間はどれですか？",
            choices: [
                "24時間",
                "12時間",
                "1週間",
                "1か月"
            ],
            correctAnswerIndex: 0,
            explanation: "地球が一回転するのにかかる時間は24時間です。"
        ),

        QuizQuestion(
            question: "太陽が沈む方向はどちらですか？",
            choices: [
                "東",
                "西",
                "南",
                "北"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は西の方向に沈みます。"
        ),
        QuizQuestion(
            question: "太陽の光が当たることでできる影の動きはどうなりますか？",
            choices: [
                "東から西へ動く",
                "西から東へ動く",
                "動かない",
                "上から下へ動く"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は東から西へ動くため、太陽と反対側にできる影は西から東へと動きます。"
        ),

        QuizQuestion(
            question: "植物が成長するために一番必要なものはどれですか？",
            choices: [
                "風",
                "水",
                "日光",
                "土"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は日光を受けて光合成を行い、成長します。"
        ),

        QuizQuestion(
            question: "風を起こすために必要なものはどれですか？",
            choices: [
                "空気の温度差",
                "月の引力",
                "太陽の光",
                "星の動き"
            ],
            correctAnswerIndex: 0,
            explanation: "空気の温度差が風を起こします。"
        ),

        QuizQuestion(
            question: "地球の周りを回っている天体はどれですか？",
            choices: [
                "月",
                "火星",
                "太陽",
                "木星"
            ],
            correctAnswerIndex: 0,
            explanation: "月は地球の周りを回っている天体です。"
        ),

        QuizQuestion(
            question: "水が蒸発すると何になりますか？",
            choices: [
                "氷",
                "水蒸気",
                "雪",
                "霧"
            ],
            correctAnswerIndex: 1,
            explanation: "水が蒸発すると水蒸気になります。"
        ),

        QuizQuestion(
            question: "雷が鳴るときに空に光るものは何ですか？",
            choices: [
                "星",
                "稲妻",
                "太陽",
                "月"
            ],
            correctAnswerIndex: 1,
            explanation: "雷が鳴るときには稲妻が空に光ります。"
        ),

        QuizQuestion(
            question: "空に浮かんでいる雲の主成分は何ですか？",
            choices: [
                "氷",
                "塵",
                "水蒸気",
                "砂"
            ],
            correctAnswerIndex: 2,
            explanation: "雲は水蒸気でできています。"
        ),

        QuizQuestion(
            question: "太陽はどのように見えるでしょうか？",
            choices: [
                "昼間は動いているように見える",
                "昼間は止まっているように見える",
                "昼間は消えているように見える",
                "昼間は揺れているように見える"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽は地球の自転により、昼間は動いているように見えます。"
        ),

        QuizQuestion(
            question: "大きな石を川の中に入れると何が起こりますか？",
            choices: [
                "水が溢れる",
                "水が冷たくなる",
                "川の流れが速くなる",
                "川の流れが遅くなる"
            ],
            correctAnswerIndex: 0,
            explanation: "大きな石を川に入れると、水の量が増え水が溢れることがあります。"
        ),

        QuizQuestion(
            question: "雪が解けると何になりますか？",
            choices: [
                "氷",
                "水",
                "水蒸気",
                "霜"
            ],
            correctAnswerIndex: 1,
            explanation: "雪が解けると水になります。"
        ),
        QuizQuestion(
            question: "水を蒸発させるにはどうすればよいですか？",
            choices: [
                "冷やす",
                "温める",
                "振る",
                "凍らせる"
            ],
            correctAnswerIndex: 1,
            explanation: "水は温めることで蒸発して水蒸気になります。"
        ),

        QuizQuestion(
            question: "虫が成長する過程で「さなぎ」となるのはいつですか？",
            choices: [
                "卵から孵った直後",
                "幼虫が成虫になる前",
                "成虫になってから",
                "卵を産む直前"
            ],
            correctAnswerIndex: 1,
            explanation: "幼虫は成虫になる前にさなぎの状態を経ます。"
        ),

        QuizQuestion(
            question: "昼と夜が入れ替わる原因は何ですか？",
            choices: [
                "月が動くから",
                "地球が回転するから",
                "太陽が動くから",
                "星が動くから"
            ],
            correctAnswerIndex: 1,
            explanation: "地球が自転することで昼と夜が入れ替わります。"
        ),

        QuizQuestion(
            question: "月の形が変わる理由は何ですか？",
            choices: [
                "太陽との位置関係が変わるから",
                "月が回転するから",
                "星が動くから",
                "地球が自転するから"
            ],
            correctAnswerIndex: 0,
            explanation: "月の形は、太陽との位置関係によって変わります。"
        ),

        QuizQuestion(
            question: "磁石が引き寄せるものはどれですか？",
            choices: [
                "木",
                "プラスチック",
                "鉄",
                "ガラス"
            ],
            correctAnswerIndex: 2,
            explanation: "磁石は鉄などの金属を引き寄せます。"
        ),

        QuizQuestion(
            question: "空気の動きによってできるものはどれですか？",
            choices: [
                "風",
                "雨",
                "雪",
                "雲"
            ],
            correctAnswerIndex: 0,
            explanation: "空気が動くことで風が生まれます。"
        ),

        QuizQuestion(
            question: "雪が降るために必要な条件はどれですか？",
            choices: [
                "気温が高い",
                "気温が低い",
                "風が吹く",
                "空が晴れている"
            ],
            correctAnswerIndex: 1,
            explanation: "雪は気温が低いときに降ります。"
        ),

        QuizQuestion(
            question: "電気を通しやすいものはどれですか？",
            choices: [
                "ゴム",
                "木",
                "プラスチック",
                "金属"
            ],
            correctAnswerIndex: 3,
            explanation: "金属は電気を通しやすい性質があります。"
        ),

        QuizQuestion(
            question: "地球が自転していることで生じる現象はどれですか？",
            choices: [
                "季節の変化",
                "昼と夜の変化",
                "月の満ち欠け",
                "潮の満ち引き"
            ],
            correctAnswerIndex: 1,
            explanation: "地球の自転により、昼と夜が入れ替わります。"
        ),

        QuizQuestion(
            question: "雨水が川へ流れる途中で行う役割はどれですか？",
            choices: [
                "空気を作る",
                "酸素を運ぶ",
                "土に栄養を与える",
                "風を起こす"
            ],
            correctAnswerIndex: 2,
            explanation: "雨水は土に浸透して栄養を与える役割を持っています。"
        ),
        QuizQuestion(
            question: "植物が昼間に行う重要な働きはどれですか？",
            choices: [
                "水を出す",
                "酸素を作る",
                "根を伸ばす",
                "種をつくる"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は光合成をして酸素を作ります。"
        ),

        QuizQuestion(
            question: "水を熱するとどうなりますか？",
            choices: [
                "氷になる",
                "蒸発して水蒸気になる",
                "土になる",
                "砂になる"
            ],
            correctAnswerIndex: 1,
            explanation: "水を熱すると蒸発して水蒸気になります。"
        ),

        QuizQuestion(
            question: "昆虫の卵からかえるものはどれですか？",
            choices: [
                "幼虫",
                "成虫",
                "さなぎ",
                "種"
            ],
            correctAnswerIndex: 0,
            explanation: "昆虫の卵からは幼虫がかえります。"
        ),

        QuizQuestion(
            question: "雲が空にできるために必要なものはどれですか？",
            choices: [
                "土",
                "太陽の光",
                "水蒸気",
                "氷"
            ],
            correctAnswerIndex: 2,
            explanation: "雲は水蒸気が集まってできています。"
        ),

        QuizQuestion(
            question: "鏡に映った像はどのように見えますか？",
            choices: [
                "大きくなる",
                "小さくなる",
                "左右が逆になる",
                "色が変わる"
            ],
            correctAnswerIndex: 2,
            explanation: "鏡に映る像は左右が逆に見えます。"
        ),

        QuizQuestion(
            question: "月が光る理由は何ですか？",
            choices: [
                "自分で光っているから",
                "太陽の光を反射しているから",
                "星の光を集めているから",
                "風に吹かれているから"
            ],
            correctAnswerIndex: 1,
            explanation: "月は太陽の光を反射して光っています。"
        ),

        QuizQuestion(
            question: "太陽が地球に与える影響はどれですか？",
            choices: [
                "地球を冷やす",
                "地球を温める",
                "地球を回す",
                "地球に水を与える"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽の光が地球を温めています。"
        ),

        QuizQuestion(
            question: "夏が暑くなる理由は何ですか？",
            choices: [
                "太陽の光が強いから",
                "風が吹かないから",
                "地球が太陽に近づくから",
                "雨が少ないから"
            ],
            correctAnswerIndex: 0,
            explanation: "夏は太陽の光が強いため、暑くなります。"
        ),

        QuizQuestion(
            question: "水が冷えると氷になるのはどんなときですか？",
            choices: [
                "気温が0℃以下のとき",
                "気温が高いとき",
                "風が強いとき",
                "水が蒸発するとき"
            ],
            correctAnswerIndex: 0,
            explanation: "水は気温が0℃以下になると氷になります。"
        ),

        QuizQuestion(
            question: "植物の葉っぱが緑色をしている理由は何ですか？",
            choices: [
                "水が多いから",
                "光を吸収する色だから",
                "酸素を出すため",
                "土から栄養を吸っているから"
            ],
            correctAnswerIndex: 1,
            explanation: "植物の葉っぱは、光合成に必要な光を吸収するために緑色をしています。"
        ),
        QuizQuestion(
            question: "セミの幼虫が土から出てくるのはどの季節ですか？",
            choices: [
                "冬",
                "秋",
                "夏",
                "春"
            ],
            correctAnswerIndex: 2,
            explanation: "セミの幼虫は夏に土から出てきます。"
        ),

        QuizQuestion(
            question: "雨が降った後、虹ができる理由は何ですか？",
            choices: [
                "水が光を屈折させるから",
                "風が強く吹くから",
                "空が青いから",
                "雲が動くから"
            ],
            correctAnswerIndex: 0,
            explanation: "雨粒が光を屈折させることで虹が見えます。"
        ),

        QuizQuestion(
            question: "夏に植物がたくさん成長する理由は何ですか？",
            choices: [
                "気温が高いから",
                "雨が多いから",
                "日光が強いから",
                "風が吹くから"
            ],
            correctAnswerIndex: 2,
            explanation: "夏は日光が強いため、植物が成長しやすいです。"
        ),

        QuizQuestion(
            question: "風を起こす原因はどれですか？",
            choices: [
                "雲の動き",
                "温度差",
                "雨の降り方",
                "月の引力"
            ],
            correctAnswerIndex: 1,
            explanation: "風は温度差によって空気が動くことで起こります。"
        ),

        QuizQuestion(
            question: "太陽が一番高くなる時間帯はどれですか？",
            choices: [
                "午前中",
                "昼",
                "夕方",
                "夜"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽は正午頃に最も高くなります。"
        ),

        QuizQuestion(
            question: "氷が溶けるとどうなりますか？",
            choices: [
                "水蒸気になる",
                "水になる",
                "砂になる",
                "冷たいまま"
            ],
            correctAnswerIndex: 1,
            explanation: "氷が溶けると水になります。"
        ),

        QuizQuestion(
            question: "金属に光を当てると何が起こりますか？",
            choices: [
                "熱くなる",
                "光が反射する",
                "色が変わる",
                "柔らかくなる"
            ],
            correctAnswerIndex: 1,
            explanation: "金属は光をよく反射する性質があります。"
        ),

        QuizQuestion(
            question: "太陽が沈む方向はどれですか？",
            choices: [
                "北",
                "南",
                "東",
                "西"
            ],
            correctAnswerIndex: 3,
            explanation: "太陽は西の空に沈みます。"
        ),

        QuizQuestion(
            question: "雲が空に浮かんでいる理由は何ですか？",
            choices: [
                "軽いから",
                "風が強いから",
                "水蒸気が集まっているから",
                "空が青いから"
            ],
            correctAnswerIndex: 2,
            explanation: "雲は水蒸気が集まってできています。"
        ),

        QuizQuestion(
            question: "火山が噴火するときに出るものはどれですか？",
            choices: [
                "水",
                "風",
                "溶岩",
                "氷"
            ],
            correctAnswerIndex: 2,
            explanation: "火山の噴火では溶岩や火山灰が出ます。"
        ),
        QuizQuestion(
            question: "イモムシがチョウになるために通る段階はどれですか？",
            choices: [
                "卵",
                "さなぎ",
                "葉っぱ",
                "幼虫"
            ],
            correctAnswerIndex: 1,
            explanation: "イモムシはさなぎになってからチョウになります。"
        ),

        QuizQuestion(
            question: "光を鏡に当てるとどうなりますか？",
            choices: [
                "吸収される",
                "跳ね返る",
                "透過する",
                "散らばる"
            ],
            correctAnswerIndex: 1,
            explanation: "光は鏡に当たると跳ね返ります。"
        ),

        QuizQuestion(
            question: "水が沸騰するとどうなりますか？",
            choices: [
                "氷になる",
                "水蒸気になる",
                "雪になる",
                "水のまま"
            ],
            correctAnswerIndex: 1,
            explanation: "水が沸騰すると水蒸気になります。"
        ),

        QuizQuestion(
            question: "昼間に太陽がある場所はどこですか？",
            choices: [
                "地平線の下",
                "北の空",
                "東の空",
                "南の空"
            ],
            correctAnswerIndex: 3,
            explanation: "日本では昼間、太陽は南の空に見えます。"
        ),

        QuizQuestion(
            question: "植物が成長するために必要なものはどれですか？",
            choices: [
                "月の光",
                "空気",
                "土",
                "火"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は光、水、そして空気から二酸化炭素を取り入れて成長します。"
        ),

        QuizQuestion(
            question: "葉っぱの役割として正しいものはどれですか？",
            choices: [
                "水を吸収する",
                "酸素を出す",
                "根を守る",
                "種をつくる"
            ],
            correctAnswerIndex: 1,
            explanation: "葉っぱは光合成を行い、酸素を出します。"
        ),

        QuizQuestion(
            question: "地球はどのように動いていますか？",
            choices: [
                "自転している",
                "止まっている",
                "上下に動いている",
                "横に滑っている"
            ],
            correctAnswerIndex: 0,
            explanation: "地球は自転しており、これにより昼と夜が生まれます。"
        ),

        QuizQuestion(
            question: "植物の根の役割として正しいものはどれですか？",
            choices: [
                "葉っぱを守る",
                "水を吸収する",
                "光を作る",
                "空気を吸う"
            ],
            correctAnswerIndex: 1,
            explanation: "根は土から水と栄養分を吸収します。"
        ),
        QuizQuestion(
            question: "カブトムシの幼虫が成虫になるために変わるものはどれですか？",
            choices: [
                "さなぎ",
                "卵",
                "葉っぱ",
                "土"
            ],
            correctAnswerIndex: 0,
            explanation: "カブトムシの幼虫は、さなぎを経て成虫になります。"
        ),

        QuizQuestion(
            question: "光はどのように進みますか？",
            choices: [
                "まっすぐ進む",
                "曲がって進む",
                "ぐるぐる回る",
                "止まる"
            ],
            correctAnswerIndex: 0,
            explanation: "光は常にまっすぐ進みます。"
        ),

        QuizQuestion(
            question: "水が冷えるとどうなりますか？",
            choices: [
                "氷になる",
                "水蒸気になる",
                "雪になる",
                "砂になる"
            ],
            correctAnswerIndex: 0,
            explanation: "水が冷えると氷になります。"
        ),

        QuizQuestion(
        question: "ホウセンカの葉の大きさの変化を写真で比べます。最も比べやすい撮り方はどれですか？",
        choices: [
        "葉の横に同じものさしを置き、毎回同じ向きから撮る",
        "毎回ちがう距離から葉だけを撮る",
        "葉を折りたたんでから撮る",
        "植木ばちだけを大きく撮る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『葉の横に同じものさしを置き、毎回同じ向きから撮る』です。同じ基準と向きで撮ると、葉の大きさの変化を比べやすくなります。"
        ),

        QuizQuestion(
        question: "印をつけたホウセンカの葉を調べると、1週間で長さが4 cmから6 cmになり、葉の枚数は8枚のままでした。分かることはどれですか？",
        choices: [
        "葉が2枚増えた",
        "印をつけた葉が2 cm長くなった",
        "葉がすべて実に変わった",
        "草たけが2 cm低くなった"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『印をつけた葉が2 cm長くなった』です。葉の長さは4 cmから6 cmになったので2 cm長くなり、葉の枚数は変わっていません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】植物を見て分かったことを、日付・絵・文などで残す用紙を答えましょう。",
        answer: "観察カード",
        acceptableAnswers: ["かんさつカード", "観察かーど"],
        explanation: "植物を見て分かったことを、日付・絵・文などで残す用紙を『観察カード』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】植物の世話と、その主な目的を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "土が乾いたときに水をやる", match: "根から水を取り入れられるようにする"),
        QuizMatchingPair(prompt: "混み合った芽を間引く", match: "残した芽が育つ場所を広くする"),
        QuizMatchingPair(prompt: "倒れそうな茎に支柱を立てる", match: "茎が折れたり倒れたりするのを防ぐ"),
        QuizMatchingPair(prompt: "植木ばちの周りの雑草を取る", match: "育てる植物に日光が当たりやすくする")
        ],
        choices: [
        "茎が折れたり倒れたりするのを防ぐ",
        "育てる植物に日光が当たりやすくする",
        "根から水を取り入れられるようにする",
        "残した芽が育つ場所を広くする"
        ],
        explanation: "水やりは根から水を取り入れられるようにし、間引きは残した芽が育つ場所を広くします。支柱は茎を支え、雑草取りは育てる植物に日光が当たりやすくします。"
        ),

        QuizQuestion(
        question: "テントウムシが飛び立つとき、かたい前ばねの下から広げるものはどれですか？",
        choices: [
        "長い触角",
        "太いうしろあし",
        "うすい後ろばね",
        "はらの節"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『うすい後ろばね』です。テントウムシは、かたい前ばねを開き、その下のうすい後ろばねを広げて飛びます。"
        ),

        QuizQuestion(
        question: "クモがこん虫の仲間ではないと分かる特徴はどれですか？",
        choices: [
        "地面を歩くこと",
        "小さな生き物を食べること",
        "体に節があること",
        "あしが8本あり、体が主に2つの部分に分かれること"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『あしが8本あり、体が主に2つの部分に分かれること』です。こん虫はあしが6本で、体が頭・むね・はらの3つに分かれます。"
        ),

        QuizQuestion.classification(
        question: "【分類】こん虫を『幼虫が水中で育つ』『幼虫が陸上で育つ』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "トンボ", match: "幼虫が水中で育つ"),
        QuizMatchingPair(prompt: "カ", match: "幼虫が水中で育つ"),
        QuizMatchingPair(prompt: "バッタ", match: "幼虫が陸上で育つ"),
        QuizMatchingPair(prompt: "カマキリ", match: "幼虫が陸上で育つ")
        ],
        categories: ["幼虫が水中で育つ", "幼虫が陸上で育つ"],
        explanation: "トンボの幼虫であるヤゴと、カの幼虫であるボウフラは水中で育ちます。バッタとカマキリの幼虫は陸上で育ちます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】セミが卵から成虫になるまでを順に並べましょう。",
        choices: [
        "幼虫が木に登る",
        "土の中で幼虫が育つ",
        "成虫になって飛び立つ",
        "木の枝に産みつけられた卵から幼虫がかえる"
        ],
        orderedChoices: [
        "木の枝に産みつけられた卵から幼虫がかえる",
        "土の中で幼虫が育つ",
        "幼虫が木に登る",
        "成虫になって飛び立つ"
        ],
        explanation: "『木の枝に産みつけられた卵から幼虫がかえる』『土の中で幼虫が育つ』『幼虫が木に登る』『成虫になって飛び立つ』の順です。"
        ),

        QuizQuestion(
        question: "同じ場所・同じ時刻に、高さのちがう2本の棒をまっすぐ立てました。2本の影の向きはどうなりますか？",
        choices: [
        "同じ向きになる",
        "高い棒だけ東を向く",
        "低い棒だけ西を向く",
        "必ず反対向きになる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『同じ向きになる』です。同じ場所・同じ時刻なら、太陽の見える方向が同じなので、棒の高さがちがっても影は同じ向きにできます。"
        ),

        QuizQuestion(
        question: "校庭の日なたと日かげの地面の温度を比べます。公平に比べる方法はどれですか？",
        choices: [
        "日なたは朝、日かげは昼に測る",
        "同じ時刻に、温度計の液だまりを同じ深さにして測る",
        "日なたは乾いた地面、日かげは水でぬれた地面を測る",
        "日なたは温度計、日かげは手でさわって調べる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『同じ時刻に、温度計の液だまりを同じ深さにして測る』です。時刻や測り方をそろえると、日光の当たり方による温度のちがいを公平に比べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】温度計の先にある、色のついた液がたまっている部分を答えましょう。",
        answer: "液だまり",
        acceptableAnswers: ["えきだまり", "液溜まり"],
        explanation: "温度計の先にある、色のついた液がたまっている部分を『液だまり』といいます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】日なたと日かげの地面の温度差が大きい順に、記録を並べましょう。",
        choices: [
        "記録B（日なた30度・日かげ25度）",
        "記録D（日なた27度・日かげ25度）",
        "記録A（日なた35度・日かげ26度）",
        "記録C（日なた32度・日かげ26度）"
        ],
        rankedChoices: [
        "記録A（日なた35度・日かげ26度）",
        "記録C（日なた32度・日かげ26度）",
        "記録B（日なた30度・日かげ25度）",
        "記録D（日なた27度・日かげ25度）"
        ],
        explanation: "温度差は、記録Aが9度、記録Cが6度、記録Bが5度、記録Dが2度です。したがって、A、C、B、Dの順です。"
        ),

        QuizQuestion(
        question: "暗い部屋で同じ強さの光を当てたとき、黒い紙より明るく見えやすいものはどれですか？",
        choices: [
        "黒い布",
        "黒い画用紙",
        "白い画用紙",
        "光を当てていない黒い板"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『白い画用紙』です。白い画用紙は黒い紙より多くの光をはね返すため、同じ光を当てると明るく見えやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】光が当たった白い紙を見ることができるのは、紙ではね返った光が ＿＿ に届くからです。",
        answer: "目",
        acceptableAnswers: ["め"],
        explanation: "＿＿に入る言葉は『目』です。紙ではね返った光が目に届くことで、白い紙を見ることができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】光を当てたものと、観察しやすいようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "白い画用紙", match: "表面が明るく見える"),
        QuizMatchingPair(prompt: "黒い画用紙", match: "白い紙より暗く見える"),
        QuizMatchingPair(prompt: "鏡", match: "別の場所に明るい光が映る"),
        QuizMatchingPair(prompt: "厚い板", match: "板の後ろに影ができる")
        ],
        choices: [
        "別の場所に明るい光が映る",
        "板の後ろに影ができる",
        "表面が明るく見える",
        "白い紙より暗く見える"
        ],
        explanation: "白い画用紙は明るく、黒い画用紙は白い紙より暗く見えます。鏡では別の場所に明るい光が映り、厚い板の後ろには影ができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】観察した場所を『光が当たっている』『光がさえぎられている』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "懐中電灯で照らした机の中央", match: "光が当たっている"),
        QuizMatchingPair(prompt: "鏡ではね返した光が映る白い壁", match: "光が当たっている"),
        QuizMatchingPair(prompt: "積み木の後ろにできた暗い部分", match: "光がさえぎられている"),
        QuizMatchingPair(prompt: "日光を背にした人の足元の暗い部分", match: "光がさえぎられている")
        ],
        categories: ["光が当たっている", "光がさえぎられている"],
        explanation: "懐中電灯で照らした机と、鏡の光が映る壁には光が当たっています。積み木や人の体の後ろにできる暗い部分は、光がさえぎられています。"
        ),

        QuizQuestion(
        question: "空のペットボトルの口を横から吹くと音が出ました。主に何がふるえて音を出していますか？",
        choices: [
        "ペットボトルのラベルの文字",
        "吹いている人の手",
        "ペットボトルの下の机だけ",
        "ペットボトルの中の空気"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『ペットボトルの中の空気』です。口を横から吹くと、中の空気がふるえて音が出ます。"
        ),

        QuizQuestion(
        question: "水を入れた金属のボウルのふちを軽くたたくと、水面に細かい波ができました。このことから分かることはどれですか？",
        choices: [
        "ボウルのふるえが水に伝わった",
        "水が磁石になった",
        "水から電気が流れた",
        "水が光を出した"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『ボウルのふるえが水に伝わった』です。ふちをたたいたときのボウルのふるえが水へ伝わり、水面に細かい波ができます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】向かい合って話すとき、声は人と耳の間の ＿＿ を通って伝わります。",
        answer: "空気",
        acceptableAnswers: ["くうき"],
        explanation: "＿＿に入る言葉は『空気』です。声によるふるえが空気を通って耳まで伝わります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】音を出すものと、主にふるえている部分を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "紙笛", match: "うすい紙"),
        QuizMatchingPair(prompt: "空き箱の上に張った輪ゴム", match: "輪ゴム"),
        QuizMatchingPair(prompt: "空きびんの口を吹いた音", match: "びんの中の空気"),
        QuizMatchingPair(prompt: "木の板をたたいた音", match: "木の板")
        ],
        choices: [
        "木の板",
        "びんの中の空気",
        "うすい紙",
        "輪ゴム"
        ],
        explanation: "紙笛ではうすい紙、輪ゴムの楽器では輪ゴム、空きびんでは中の空気、木の板では板そのものが主にふるえて音を出します。"
        ),

        QuizQuestion(
        question: "同じ大きさのほを使い、一方のほだけに大きな穴をいくつも開けました。同じ風を当てたとき、遠くまで進みやすい車はどれですか？",
        choices: [
        "大きな穴が多いほの車",
        "穴のないほの車",
        "ほを横向きにした車",
        "ほを取り外した車"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『穴のないほの車』です。穴のないほは風を受ける面が広いため、同じ風なら遠くまで進みやすくなります。"
        ),

        QuizQuestion(
        question: "ゴムで動く車を毎回同じ場所から走らせるため、車を放す前に行うことはどれですか？",
        choices: [
        "車輪を一つ外す",
        "ゴムを毎回ちがう種類にする",
        "車の先をスタート線に合わせる",
        "車を手で前へ押して勢いをつける"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『車の先をスタート線に合わせる』です。毎回同じ位置から放すと、進んだきょりを公平に比べられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】風で動く車の実験の工夫を『車を遠く進ませる工夫』『公平に比べる工夫』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ほを風に正面から向ける", match: "車を遠く進ませる工夫"),
        QuizMatchingPair(prompt: "風を受ける面を広くする", match: "車を遠く進ませる工夫"),
        QuizMatchingPair(prompt: "毎回同じスタート線から放す", match: "公平に比べる工夫"),
        QuizMatchingPair(prompt: "毎回同じ車と同じほを使う", match: "公平に比べる工夫")
        ],
        categories: ["車を遠く進ませる工夫", "公平に比べる工夫"],
        explanation: "ほを風に正面から向けたり、風を受ける面を広くしたりすると、車は遠くまで進みやすくなります。同じスタート線、同じ車、同じほを使うと公平に比べられます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じゴムの車が1 m進むのにかかった時間から、速く進んだ順に並べましょう。",
        choices: [
        "記録C（2.4秒）",
        "記録A（1.2秒）",
        "記録D（3.0秒）",
        "記録B（1.8秒）"
        ],
        rankedChoices: [
        "記録A（1.2秒）",
        "記録B（1.8秒）",
        "記録C（2.4秒）",
        "記録D（3.0秒）"
        ],
        explanation: "同じ1 mを進むなら、かかった時間が短いほど速く進んでいます。『記録A（1.2秒）』『記録B（1.8秒）』『記録C（2.4秒）』『記録D（3.0秒）』の順です。"
        ),

        QuizQuestion(
        question: "棒磁石の上に紙を置き、その上に鉄のクリップをたくさん散らすと、クリップはどこに多く集まりやすいですか？",
        choices: [
        "棒磁石から最も遠い場所",
        "棒磁石の中央だけ",
        "紙の四つの角だけ",
        "棒磁石の両端の近く"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『棒磁石の両端の近く』です。棒磁石は、両端にある極の近くで鉄を強く引きつけます。"
        ),

        QuizQuestion(
        question: "見た目がよく似たスチール缶とアルミ缶に磁石を近づけると、スチール缶だけが引きつけられました。この結果から分かることはどれですか？",
        choices: [
        "磁石に引きつけられるかどうかは、ものの材料によってちがう",
        "光って見えるものはすべて磁石に引きつけられる",
        "中が空のものは磁石に引きつけられない",
        "同じ形のものは必ず同じ性質をもつ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『磁石に引きつけられるかどうかは、ものの材料によってちがう』です。スチールには鉄がふくまれるため引きつけられますが、アルミニウムは引きつけられません。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものを『それ自体が磁石』『磁石ではない鉄製品』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "方位磁針の針", match: "それ自体が磁石"),
        QuizMatchingPair(prompt: "冷蔵庫に付ける棒磁石", match: "それ自体が磁石"),
        QuizMatchingPair(prompt: "磁石につける前の鉄のくぎ", match: "磁石ではない鉄製品"),
        QuizMatchingPair(prompt: "磁石につける前のスチール製クリップ", match: "磁石ではない鉄製品")
        ],
        categories: ["それ自体が磁石", "磁石ではない鉄製品"],
        explanation: "方位磁針の針と棒磁石は、それ自体が磁石です。磁石につける前の鉄のくぎとスチール製クリップは、磁石に引きつけられる鉄製品ですが、それ自体が磁石とは限りません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】豆電球をつなぐとき、導線の金属部分を触れさせるのは、ガラスではなく豆電球の ＿＿ です。",
        answer: "金属部分",
        acceptableAnswers: ["金属の部分", "きんぞくぶぶん", "きんぞくのぶぶん"],
        explanation: "＿＿に入る言葉は『金属部分』です。豆電球のガラスではなく、横と下にある金属部分へ導線をつなぎます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】豆電球が光らない原因と、直し方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "導線の先がビニールでおおわれたまま", match: "先のビニールをむいて金属を出す"),
        QuizMatchingPair(prompt: "回路のスイッチが開いている", match: "スイッチを閉じる"),
        QuizMatchingPair(prompt: "豆電球がソケットにゆるく入っている", match: "豆電球をソケットへしっかり入れる"),
        QuizMatchingPair(prompt: "乾電池が電池ホルダーの金属に触れていない", match: "乾電池を正しい位置に入れ直す")
        ],
        choices: [
        "豆電球をソケットへしっかり入れる",
        "乾電池を正しい位置に入れ直す",
        "先のビニールをむいて金属を出す",
        "スイッチを閉じる"
        ],
        explanation: "導線の先は金属を出し、開いているスイッチは閉じます。豆電球はソケットへしっかり入れ、乾電池はホルダーの金属に触れる正しい位置へ入れ直します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】豆電球が光らない回路を安全に調べて直す手順を順に並べましょう。",
        choices: [
        "外れている部分をつなぎ直す",
        "スイッチを閉じて豆電球が光るか確かめる",
        "スイッチを開いて回路を切る",
        "導線・豆電球・乾電池のつながりを順に調べる"
        ],
        orderedChoices: [
        "スイッチを開いて回路を切る",
        "導線・豆電球・乾電池のつながりを順に調べる",
        "外れている部分をつなぎ直す",
        "スイッチを閉じて豆電球が光るか確かめる"
        ],
        explanation: "『スイッチを開いて回路を切る』『導線・豆電球・乾電池のつながりを順に調べる』『外れている部分をつなぎ直す』『スイッチを閉じて豆電球が光るか確かめる』の順です。"
        ),

        QuizQuestion(
        question: "ホウセンカの熟した実を強くつままない方がよいのはなぜですか？",
        choices: [
        "実がはじけて種が飛び散ることがあるから",
        "葉がすべて落ちてしまうから",
        "根が土から抜けてしまうから",
        "花の色が変わってしまうから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『実がはじけて種が飛び散ることがあるから』です。ホウセンカの熟した実は、強くさわるとはじけて、中の種が飛び散ることがあります。"
        ),

        QuizQuestion(
        question: "ホウセンカAは草たけが12 cmから28 cmに、ホウセンカBは18 cmから30 cmになりました。伸びた長さを比べた説明として正しいものはどれですか？",
        choices: [
        "Bの方が4 cm多く伸びた",
        "Aの方が4 cm多く伸びた",
        "AとBは同じ長さだけ伸びた",
        "Aの方が12 cm多く伸びた"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『Aの方が4 cm多く伸びた』です。Aは16 cm、Bは12 cm伸びたので、Aの方が4 cm多く伸びています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ホウセンカの熟した実が開いて、種を飛ばすようすを『実が ＿＿ 』と表します。",
        answer: "はじける",
        acceptableAnswers: ["弾ける"],
        explanation: "＿＿に入る言葉は『はじける』です。ホウセンカの熟した実は、さわるとはじけて種を飛ばします。"
        ),

        QuizQuestion.classification(
        question: "【分類】植物の観察項目を『数や長さで記録する』『形や色で記録する』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "草たけ", match: "数や長さで記録する"),
        QuizMatchingPair(prompt: "葉の枚数", match: "数や長さで記録する"),
        QuizMatchingPair(prompt: "葉のふちの形", match: "形や色で記録する"),
        QuizMatchingPair(prompt: "花びらの色", match: "形や色で記録する")
        ],
        categories: ["数や長さで記録する", "形や色で記録する"],
        explanation: "草たけは長さで、葉の枚数は数で記録します。葉のふちの形と花びらの色は、見た形や色が分かるように記録します。"
        ),

        QuizQuestion(
        question: "こん虫を手でつかまずに、あしが体のどこについているか観察する方法として、最もよいものはどれですか？",
        choices: [
        "こん虫を不透明な箱に入れて外から見る",
        "容器を強く振って、こん虫を動かす",
        "透明な容器に入れ、容器の底側から見る",
        "こん虫を水の中に入れて観察する"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『透明な容器に入れ、容器の底側から見る』です。透明な容器の底側から見ると、こん虫を手でつかまずに、あしの付け根を観察できます。"
        ),

        QuizQuestion(
        question: "モンシロチョウがキャベツなどの葉に卵を産むことが多いのはなぜですか？",
        choices: [
        "卵が土の中へもぐりやすいから",
        "葉が卵をあたためて成虫にするから",
        "葉にふれると卵がすぐさなぎになるから",
        "卵からかえった幼虫がすぐに葉を食べられるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『卵からかえった幼虫がすぐに葉を食べられるから』です。モンシロチョウの幼虫は、キャベツなどの葉を食べて育ちます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】こん虫と、見分ける手がかりになる体の特徴を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カマキリ", match: "鎌のような前あし"),
        QuizMatchingPair(prompt: "テントウムシ", match: "丸い体と斑点のある前ばね"),
        QuizMatchingPair(prompt: "セミ", match: "大きな透明のはね"),
        QuizMatchingPair(prompt: "コオロギ", match: "長い触角と太いうしろあし")
        ],
        choices: ["大きな透明のはね", "長い触角と太いうしろあし", "鎌のような前あし", "丸い体と斑点のある前ばね"],
        explanation: "カマキリには鎌のような前あし、テントウムシには丸い体と斑点のある前ばね、セミには大きな透明のはね、コオロギには長い触角と太いうしろあしがあります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】カブトムシが卵から成虫になるまでを順に並べましょう。",
        choices: ["さなぎになる", "卵から幼虫がかえる", "成虫になる", "幼虫が土の中で育つ"],
        orderedChoices: ["卵から幼虫がかえる", "幼虫が土の中で育つ", "さなぎになる", "成虫になる"],
        explanation: "『卵から幼虫がかえる』『幼虫が土の中で育つ』『さなぎになる』『成虫になる』の順です。"
        ),

        QuizQuestion(
        question: "太陽の位置を安全に調べる方法として、最もよいものはどれですか？",
        choices: [
        "太陽を直接見ず、棒の影の向きや長さを調べる",
        "虫眼鏡を通して太陽を見る",
        "鏡に映した太陽を長い時間見続ける",
        "双眼鏡で太陽を大きくして見る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『太陽を直接見ず、棒の影の向きや長さを調べる』です。太陽を直接見ると目を傷める危険があるため、影を使って調べます。"
        ),

        QuizQuestion(
        question: "午前10時は平らな校庭で、午前11時は坂道で、同じ棒の影を測りました。この記録だけでは太陽の高さの変化を正しく比べにくいのはなぜですか？",
        choices: [
        "記録した時刻が1時間しか離れていないから",
        "地面の傾きという条件が変わっているから",
        "同じ棒を使っているから",
        "影の長さを測っているから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『地面の傾きという条件が変わっているから』です。太陽の高さによる変化を比べるには、棒を立てる場所や地面の傾きなどを同じにする必要があります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】日なたや日かげの地面の温度を測る道具を答えましょう。",
        answer: "温度計",
        acceptableAnswers: ["おんどけい"],
        explanation: "地面の温度を測る道具は『温度計』です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ時間だけ日光に当てた地面について、温度が上がった大きい順に並べましょう。",
        choices: ["記録C（20度から25度）", "記録A（20度から34度）", "記録D（22度から24度）", "記録B（21度から31度）"],
        rankedChoices: ["記録A（20度から34度）", "記録B（21度から31度）", "記録C（20度から25度）", "記録D（22度から24度）"],
        explanation: "温度の上がり方は、記録Aが14度、記録Bが10度、記録Cが5度、記録Dが2度です。したがって、A、B、C、Dの順です。"
        ),

        QuizQuestion(
        question: "同じ材質・大きさ・厚さの黒い紙と白い紙を、同じ時間だけ日光に当てました。温度が高くなりやすいのはどちらですか？",
        choices: [
        "どちらも必ず同じ温度になる",
        "白い紙",
        "黒い紙",
        "日光に当てる前の温度だけで決まる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『黒い紙』です。同じ材料なら、黒い紙は白い紙より日光を多く受け取って温まりやすい傾向があります。"
        ),

        QuizQuestion(
        question: "紙の色と日光による温まり方の関係を公平に調べる方法はどれですか？",
        choices: [
        "黒い紙は日なた、白い紙は日かげに置く",
        "紙の色と厚さを同時に変える",
        "黒い紙だけを長い時間日光に当てる",
        "同じ材質・大きさ・厚さの紙を使い、色だけを変えて同じ時間測る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『同じ材質・大きさ・厚さの紙を使い、色だけを変えて同じ時間測る』です。調べたい色以外の条件をそろえると、公平に比べられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】紙の色と温まり方を調べる道具や材料を、その役目と正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "温度計", match: "紙の温度を測る"),
        QuizMatchingPair(prompt: "時計", match: "日光に当てる時間をそろえる"),
        QuizMatchingPair(prompt: "黒い紙", match: "暗い色の条件をつくる"),
        QuizMatchingPair(prompt: "白い紙", match: "明るい色の条件をつくる")
        ],
        choices: ["暗い色の条件をつくる", "紙の温度を測る", "明るい色の条件をつくる", "日光に当てる時間をそろえる"],
        explanation: "温度計は紙の温度を測り、時計は日光に当てる時間をそろえるために使います。黒い紙と白い紙で、暗い色と明るい色の条件をつくります。"
        ),

        QuizQuestion.classification(
        question: "【分類】同じ材質の色紙を、日光で『温まりやすい色』『温まりにくい色』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "黒色", match: "温まりやすい色"),
        QuizMatchingPair(prompt: "濃い紺色", match: "温まりやすい色"),
        QuizMatchingPair(prompt: "白色", match: "温まりにくい色"),
        QuizMatchingPair(prompt: "うすい黄色", match: "温まりにくい色")
        ],
        categories: ["温まりやすい色", "温まりにくい色"],
        explanation: "同じ材質なら、黒色や濃い紺色のような暗い色は温まりやすく、白色やうすい黄色のような明るい色は温まりにくい傾向があります。"
        ),

        QuizQuestion(
        question: "目覚まし時計の音を小さく聞こえるようにする方法として、最もよいものはどれですか？",
        choices: [
        "ふたを閉じた箱に入れ、箱の外を厚い布で包む",
        "箱から出して耳の近くに置く",
        "固い机の上で強く鳴らす",
        "音が出る部分を耳の方へ向ける"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『ふたを閉じた箱に入れ、箱の外を厚い布で包む』です。箱や布が音の伝わりを弱めるため、音が小さく聞こえやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】音を出しているものが、左右や上下に動く大きさを表す言葉を答えましょう。",
        answer: "ふれはば",
        acceptableAnswers: ["振れ幅", "ふれ幅"],
        explanation: "音を出しているものが動く大きさを『ふれはば』といいます。ふれはばが大きいほど、音も大きくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】音を出しているものと、その音を止める方法を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "たいこ", match: "皮を手で押さえる"),
        QuizMatchingPair(prompt: "ギター", match: "ふるえている弦に指を当てる"),
        QuizMatchingPair(prompt: "トライアングル", match: "本体を手でにぎる"),
        QuizMatchingPair(prompt: "机から出した物さし", match: "物さしを机に押さえつける")
        ],
        choices: ["本体を手でにぎる", "物さしを机に押さえつける", "皮を手で押さえる", "ふるえている弦に指を当てる"],
        explanation: "音を止めるには、音を出している部分のふるえを止めます。たいこの皮、ギターの弦、トライアングルの本体、物さしをそれぞれ押さえます。"
        ),

        QuizQuestion.classification(
        question: "【分類】音に関係するものを『音を出すもの』『音を伝えるもの』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鳴っているたいこの皮", match: "音を出すもの"),
        QuizMatchingPair(prompt: "声を出しているのど", match: "音を出すもの"),
        QuizMatchingPair(prompt: "糸電話の張った糸", match: "音を伝えるもの"),
        QuizMatchingPair(prompt: "話し声と耳の間の空気", match: "音を伝えるもの")
        ],
        categories: ["音を出すもの", "音を伝えるもの"],
        explanation: "たいこの皮とのどは、ふるえて音を出します。糸電話の糸や話し声と耳の間の空気は、ふるえを伝えます。"
        ),

        QuizQuestion(
        question: "吹き流しが下へ垂れ、風車もほとんど回っていません。このときの風のようすとして最も考えやすいものはどれですか？",
        choices: [
        "東から強く吹いている",
        "風はほとんど吹いていない",
        "西から強く吹いている",
        "風向きが1秒ごとに反対になっている"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『風はほとんど吹いていない』です。風が弱いと、吹き流しは垂れたままになり、風車も回りにくくなります。"
        ),

        QuizQuestion(
        question: "同じ風を当てた同じ車を、なめらかな板の上と毛足の長いじゅうたんの上で走らせました。遠くまで進みやすいのはどちらですか？",
        choices: [
        "じゅうたんの上。毛が風を集めるから",
        "どちらも必ず同じきょりになる",
        "なめらかな板の上。車輪が転がりやすいから",
        "どちらも車輪が回らない"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『なめらかな板の上。車輪が転がりやすいから』です。同じ風でも、車輪が動きやすいなめらかな面の方が遠くまで進みやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】風やゴムの力を調べる実験と、変える条件を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "風の強さと進むきょりを調べる", match: "送風機の風の強さだけを変える"),
        QuizMatchingPair(prompt: "ほの大きさと進むきょりを調べる", match: "ほの面積だけを変える"),
        QuizMatchingPair(prompt: "ゴムをのばす長さと進むきょりを調べる", match: "ゴムをのばす長さだけを変える"),
        QuizMatchingPair(prompt: "ゴムの本数と進むきょりを調べる", match: "同じ種類のゴムの本数だけを変える")
        ],
        choices: ["ゴムをのばす長さだけを変える", "同じ種類のゴムの本数だけを変える", "ほの面積だけを変える", "送風機の風の強さだけを変える"],
        explanation: "公平に比べるには、調べたい条件だけを変えます。風の強さ、ほの面積、ゴムをのばす長さ、ゴムの本数を、それぞれ一つだけ変えます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じゴムの車を走らせた記録を、ゴムの力が強かったと考えられる順に並べましょう。",
        choices: ["記録D（46 cm進んだ）", "記録B（105 cm進んだ）", "記録A（132 cm進んだ）", "記録C（78 cm進んだ）"],
        rankedChoices: ["記録A（132 cm進んだ）", "記録B（105 cm進んだ）", "記録C（78 cm進んだ）", "記録D（46 cm進んだ）"],
        explanation: "同じ車を同じ場所で走らせたなら、遠くまで進んだ記録ほど、ゴムの力が強かったと考えられます。A、B、C、Dの順です。"
        ),

        QuizQuestion(
        question: "水を入れた透明なコップの底に鉄のクリップがあります。コップの外側から磁石を近づけると、どうなりますか？",
        choices: [
        "水だけが磁石に向かって動く",
        "クリップがプラスチックに変わる",
        "磁石の力が水で完全に消える",
        "クリップが磁石の方へ動く"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『クリップが磁石の方へ動く』です。磁石の力は、コップや水を間にはさんでも、近くの鉄のクリップにはたらくことがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】磁石が鉄などを引きつけるはたらきを答えましょう。",
        answer: "磁石の力",
        acceptableAnswers: ["じしゃくの力", "じしゃくのちから"],
        explanation: "磁石が鉄などを引きつけるはたらきを『磁石の力』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】次のことを『磁石だけで調べられる』『磁石だけでは調べられない』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "うすい紙に包まれた物に鉄が入っているか", match: "磁石だけで調べられる"),
        QuizMatchingPair(prompt: "自由に動く磁石が示す北と南の向き", match: "磁石だけで調べられる"),
        QuizMatchingPair(prompt: "物の重さが何グラムか", match: "磁石だけでは調べられない"),
        QuizMatchingPair(prompt: "水の温度が何度か", match: "磁石だけでは調べられない")
        ],
        categories: ["磁石だけで調べられる", "磁石だけでは調べられない"],
        explanation: "磁石は鉄を引きつける性質や、自由に動くと北と南を示す性質を使って調べられます。物の重さや水の温度は、磁石だけでは調べられません。"
        ),

        QuizQuestion(
        question: "表面に塗料がぬられた金属板を回路の切れ目に入れると豆電球は光らず、塗料をけずって金属を出すと光りました。主な理由はどれですか？",
        choices: [
        "塗料は電気を通しにくく、出てきた金属は電気を通すから",
        "塗料をけずると乾電池が新しくなるから",
        "金属板が磁石に変わったから",
        "塗料の色が豆電球の光を吸い取ったから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『塗料は電気を通しにくく、出てきた金属は電気を通すから』です。導線の金属部分を、塗料でおおわれていない金属に触れさせると回路がつながります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】豆電球の中にあり、電気が流れると光る細い線を答えましょう。",
        answer: "フィラメント",
        acceptableAnswers: ["ふぃらめんと"],
        explanation: "豆電球の中で光る細い線を『フィラメント』といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】乾電池を安全に交換して、豆電球が光るか確かめる手順を順に並べましょう。",
        choices: ["新しい乾電池の向きを確かめて入れる", "スイッチを閉じて豆電球を確かめる", "スイッチを開いて回路を切る", "使い終わった乾電池を外す"],
        orderedChoices: ["スイッチを開いて回路を切る", "使い終わった乾電池を外す", "新しい乾電池の向きを確かめて入れる", "スイッチを閉じて豆電球を確かめる"],
        explanation: "『スイッチを開いて回路を切る』『使い終わった乾電池を外す』『新しい乾電池の向きを確かめて入れる』『スイッチを閉じて豆電球を確かめる』の順です。"
        ),

        QuizQuestion(
        question: "ホウセンカの葉が茎のどこから出ているかを観察カードに残すには、どの描き方が最もよいですか？",
        choices: [
        "茎と葉を横から見て、葉の付け根まで描く",
        "花だけを大きく描く",
        "植木ばちの色だけを塗る",
        "葉を全部重ねて丸く描く"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『茎と葉を横から見て、葉の付け根まで描く』です。葉の付け根まで描くと、葉が茎のどこから出ているかを記録できます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】芽が出たあと、子葉につづいて出る、その植物らしい形の葉を答えましょう。",
        answer: "本葉",
        acceptableAnswers: ["ほんよう"],
        explanation: "子葉につづいて出る、その植物らしい形の葉を『本葉』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】植物の育つ段階と、そのころに見つけやすいものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "種をまいた直後", match: "土の中の種"),
        QuizMatchingPair(prompt: "芽が出たばかり", match: "開いた子葉"),
        QuizMatchingPair(prompt: "茎がのびているころ", match: "増えてきた本葉"),
        QuizMatchingPair(prompt: "花がさく少し前", match: "ふくらんだつぼみ")
        ],
        choices: ["増えてきた本葉", "ふくらんだつぼみ", "土の中の種", "開いた子葉"],
        explanation: "種をまいた直後には土の中の種、芽が出たばかりのころには開いた子葉が見られます。茎がのびるころには本葉が増え、花がさく少し前にはつぼみがふくらみます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】一つのつぼみが花になり、その後どう変わるかを観察する手順を順に並べましょう。",
        choices: ["花が開いた日を記録する", "同じつぼみに印をつける", "花がしぼんだあとの部分を観察する", "印をつけたつぼみを毎日見る"],
        orderedChoices: ["同じつぼみに印をつける", "印をつけたつぼみを毎日見る", "花が開いた日を記録する", "花がしぼんだあとの部分を観察する"],
        explanation: "『同じつぼみに印をつける』『印をつけたつぼみを毎日見る』『花が開いた日を記録する』『花がしぼんだあとの部分を観察する』の順です。"
        ),

        QuizQuestion(
        question: "つかまえたこん虫を観察し終わったあとの行動として、最もよいものはどれですか？",
        choices: [
        "ふたを閉じた容器に入れたままにする",
        "短い時間で観察し、元いた場所に戻す",
        "容器を強く振って動かす",
        "はねやあしを取り外して調べる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『短い時間で観察し、元いた場所に戻す』です。こん虫を傷つけないように観察し、終わったら元いた場所に戻します。"
        ),

        QuizQuestion(
        question: "こん虫を透明な容器に入れて短い時間観察するとき、ふたに小さな穴を開ける主な理由はどれですか？",
        choices: [
        "容器の色を変えるため",
        "こん虫を外から見えなくするため",
        "容器の中に空気が入るようにするため",
        "こん虫の体を冷たくするため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『容器の中に空気が入るようにするため』です。小さな穴を開けると、こん虫が呼吸するための空気が入りやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】こん虫と、体の目立つ特徴を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウ", match: "くるくる巻ける細長い口"),
        QuizMatchingPair(prompt: "トンボ", match: "周りを広く見やすい大きな目"),
        QuizMatchingPair(prompt: "バッタ", match: "跳ぶのに適した太いうしろあし"),
        QuizMatchingPair(prompt: "オスのカブトムシ", match: "頭やむねにある大きな角")
        ],
        choices: ["頭やむねにある大きな角", "跳ぶのに適した太いうしろあし", "くるくる巻ける細長い口", "周りを広く見やすい大きな目"],
        explanation: "モンシロチョウには細長い口、トンボには大きな目、バッタには太いうしろあしがあります。オスのカブトムシには、頭やむねに大きな角があります。"
        ),

        QuizQuestion.classification(
        question: "【分類】モンシロチョウのようすを『幼虫のころ』『成虫のころ』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "キャベツの葉を食べるアオムシ", match: "幼虫のころ"),
        QuizMatchingPair(prompt: "脱皮しながら大きくなるアオムシ", match: "幼虫のころ"),
        QuizMatchingPair(prompt: "花から花へ飛ぶチョウ", match: "成虫のころ"),
        QuizMatchingPair(prompt: "花のみつを吸うチョウ", match: "成虫のころ")
        ],
        categories: ["幼虫のころ", "成虫のころ"],
        explanation: "アオムシがキャベツの葉を食べたり脱皮したりするのは幼虫のころです。花から花へ飛び、花のみつを吸うのは成虫のころです。"
        ),

        QuizQuestion(
        question: "日なたの地面の温度を、温度計で正しく測る方法はどれですか？",
        choices: [
        "温度計を手でにぎったまま数字を読む",
        "温度計を地面から高く持ち上げて測る",
        "温度計の液だまりを水につけて測る",
        "液だまりを地面に浅く差し、温度計への直射日光をさえぎって測る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『液だまりを地面に浅く差し、温度計への直射日光をさえぎって測る』です。直射日光の影響を避けると、地面の温度をより正しく測れます。"
        ),

        QuizQuestion(
        question: "同じ時刻に地面の温度を測ると、日なたは32度、日かげは25度でした。この結果から正しく言えることはどれですか？",
        choices: [
        "このときは日なたの地面が7度高い",
        "このときは日かげの地面が7度高い",
        "日なたと日かげの温度は同じである",
        "この結果だけで夜の温度も32度だと分かる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『このときは日なたの地面が7度高い』です。32度から25度を引くと、温度の差は7度です。"
        ),

        QuizQuestion.classification(
        question: "【分類】地面のようすを『日なた』『日かげ』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "建物の影がかかっていない地面", match: "日なた"),
        QuizMatchingPair(prompt: "木の影がかかっている地面", match: "日かげ"),
        QuizMatchingPair(prompt: "日光が直接当たっている地面", match: "日なた"),
        QuizMatchingPair(prompt: "日光が直接当たっていない地面", match: "日かげ")
        ],
        categories: ["日なた", "日かげ"],
        explanation: "日光が直接当たる地面は日なたです。建物や木の影になり、日光が直接当たらない地面は日かげです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】地面の温度が高い順に、観察記録を並べましょう。",
        choices: ["記録C（25度）", "記録A（34度）", "記録D（21度）", "記録B（29度）"],
        rankedChoices: ["記録A（34度）", "記録B（29度）", "記録C（25度）", "記録D（21度）"],
        explanation: "温度を比べると、『記録A（34度）』『記録B（29度）』『記録C（25度）』『記録D（21度）』の順です。"
        ),

        QuizQuestion(
        question: "鏡の向きを変えずに、表面の半分を黒い紙でおおいました。壁にはね返る光はどうなりやすいですか？",
        choices: [
        "前より明るくなりやすい",
        "前より暗くなりやすい",
        "必ず青い光に変わる",
        "必ず完全に消える"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『前より暗くなりやすい』です。鏡の光をはね返せる部分が少なくなるため、壁に届く光も少なくなります。"
        ),

        QuizQuestion(
        question: "白い壁の前に積み木を置き、左右のちがう方向から2本の懐中電灯を当てます。影が重ならないようにすると、影はいくつできますか？",
        choices: [
        "影はできない",
        "1つ",
        "2つ",
        "4つ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『2つ』です。ちがう方向から2本の光を当てると、それぞれの光による影が一つずつできます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】電灯やろうそくの炎のように、自分で光を出しているものを答えましょう。",
        answer: "光源",
        acceptableAnswers: ["こうげん"],
        explanation: "自分で光を出しているものを『光源』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】光に関係するものと、その主な役目を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "懐中電灯", match: "暗い場所を照らす"),
        QuizMatchingPair(prompt: "鏡", match: "光をはね返して向きを変える"),
        QuizMatchingPair(prompt: "厚いカーテン", match: "外から入る光をさえぎる"),
        QuizMatchingPair(prompt: "透明な窓ガラス", match: "光を通して部屋を明るくする")
        ],
        choices: ["外から入る光をさえぎる", "光を通して部屋を明るくする", "暗い場所を照らす", "光をはね返して向きを変える"],
        explanation: "懐中電灯は暗い場所を照らし、鏡は光をはね返します。厚いカーテンは光をさえぎり、透明な窓ガラスは光を通します。"
        ),

        QuizQuestion(
        question: "声を出しているときとのどを休めているときを、手でふれて比べました。分かることはどれですか？",
        choices: [
        "声を出すとのどが磁石になる",
        "声を出すとのどから光が出る",
        "声を出すとのどが冷たくなる",
        "声を出すときはのどにふるえを感じやすい"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『声を出すときはのどにふるえを感じやすい』です。声を出すとき、のどの中の部分がふるえて音をつくります。"
        ),

        QuizQuestion(
        question: "うすい膜を張った入れ物の上に米粒を置き、近くでたいこをたたくと、米粒が動きました。主な理由はどれですか？",
        choices: [
        "たいこのふるえが空気を通して膜に伝わったから",
        "米粒が磁石に引かれたから",
        "膜から電気が流れたから",
        "米粒が日光を集めたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『たいこのふるえが空気を通して膜に伝わったから』です。音のふるえが空気を通して膜へ伝わり、膜の上の米粒を動かしました。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】声を出したとき、手でふるえを感じやすい首の前の部分を答えましょう。",
        answer: "のど",
        acceptableAnswers: ["喉"],
        explanation: "声を出したとき、首の前の『のど』に手を当てると、ふるえを感じられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】音を調べる実験と、観察できることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "声を出しながらのどに手を当てる", match: "のどのふるえを感じる"),
        QuizMatchingPair(prompt: "たいこの近くに、米粒をのせたうすい膜を置く", match: "空気のふるえで米粒が動く"),
        QuizMatchingPair(prompt: "話している糸電話の糸に軽くふれる", match: "糸のふるえを感じる"),
        QuizMatchingPair(prompt: "鳴らした音さを水面に軽くふれさせる", match: "水面に細かい波ができる")
        ],
        choices: ["糸のふるえを感じる", "水面に細かい波ができる", "のどのふるえを感じる", "空気のふるえで米粒が動く"],
        explanation: "声を出すとのどがふるえ、たいこの音は空気を通して膜へ伝わります。糸電話では糸がふるえ、鳴らした音さを水面にふれさせると細かい波ができます。"
        ),

        QuizQuestion(
        question: "同じ強さの風を当てるとき、風で動く車のほを風に対して横向きにしました。正面を向けたときと比べ、車はどうなりやすいですか？",
        choices: [
        "必ず反対向きに進む",
        "風を受けにくくなり、進むきょりが短くなりやすい",
        "風を受けやすくなり、進むきょりが長くなりやすい",
        "車輪がなくても同じように進む"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『風を受けにくくなり、進むきょりが短くなりやすい』です。ほを横向きにすると、風を受ける面が小さくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】風で動く車が風を受けるために取り付ける、紙や板の部分を答えましょう。",
        answer: "ほ",
        acceptableAnswers: ["帆"],
        explanation: "風で動く車は、『ほ』に風を受けて進みます。"
        ),

        QuizQuestion.classification(
        question: "【分類】観察や記録を『風の向きが分かる』『風の強さが分かる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "吹き流しが南へなびいた", match: "風の向きが分かる"),
        QuizMatchingPair(prompt: "リボンが西へなびいた", match: "風の向きが分かる"),
        QuizMatchingPair(prompt: "風車が10秒で25回回った", match: "風の強さが分かる"),
        QuizMatchingPair(prompt: "同じ車が風を受けて150 cm進んだ", match: "風の強さが分かる")
        ],
        categories: ["風の向きが分かる", "風の強さが分かる"],
        explanation: "吹き流しやリボンがなびく方向から風の向きが分かります。同じ時間の風車の回転数や、同じ車が進んだきょりから風の強さを比べられます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ風車が10秒間に回った回数を見て、風が強かった順に並べましょう。",
        choices: ["記録A（18回）", "記録D（12回）", "記録B（31回）", "記録C（24回）"],
        rankedChoices: ["記録B（31回）", "記録C（24回）", "記録A（18回）", "記録D（12回）"],
        explanation: "同じ風車を同じ時間使ったときは、回った回数が多いほど風が強いと考えられます。『記録B（31回）』『記録C（24回）』『記録A（18回）』『記録D（12回）』の順です。"
        ),

        QuizQuestion(
        question: "N極と分かっている磁石の端を、極の印がない別の磁石の端へ近づけると、しりぞけ合いました。印のない磁石のその端は何極ですか？",
        choices: [
        "S極",
        "磁石の中央",
        "N極",
        "極ではない部分"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『N極』です。同じ極どうしはしりぞけ合うため、N極としりぞけ合った端もN極です。"
        ),

        QuizQuestion(
        question: "散らばった鉄のクリップを磁石で集め、あとでクリップを簡単に外したいとき、最もよい方法はどれですか？",
        choices: [
        "磁石とクリップを接着剤でくっつける",
        "磁石を水につけてから集める",
        "磁石でクリップを強くたたく",
        "磁石をうすいポリ袋に入れて集め、袋の外から磁石だけを抜く"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『磁石をうすいポリ袋に入れて集め、袋の外から磁石だけを抜く』です。磁石の力はうすい袋を通してはたらき、磁石を抜くとクリップを外しやすくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものを『磁石に引きつけられる』『磁石に引きつけられない』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鉄のワッシャー", match: "磁石に引きつけられる"),
        QuizMatchingPair(prompt: "スチール製のゼムクリップ", match: "磁石に引きつけられる"),
        QuizMatchingPair(prompt: "アルミニウムはく", match: "磁石に引きつけられない"),
        QuizMatchingPair(prompt: "銅線", match: "磁石に引きつけられない")
        ],
        categories: ["磁石に引きつけられる", "磁石に引きつけられない"],
        explanation: "鉄やスチールでできたものは磁石に引きつけられます。アルミニウムはくと銅線は磁石に引きつけられません。"
        ),

        QuizQuestion(
        question: "乾電池のプラス極とマイナス極を、豆電球を通さずに導線だけで直接つないではいけない主な理由はどれですか？",
        choices: [
        "導線や乾電池が熱くなるおそれがあるから",
        "乾電池が磁石に変わるから",
        "導線から水が出るから",
        "乾電池が軽くなるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『導線や乾電池が熱くなるおそれがあるから』です。乾電池の両極を導線だけで直接つなぐのは危険なので、してはいけません。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】乾電池の、平らな側の端を答えましょう。",
        answer: "マイナス極",
        acceptableAnswers: ["－極", "-極", "まいなすきょく"],
        explanation: "乾電池の平らな側の端を『マイナス極』といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】豆電球をつないだ回路でスイッチを閉じてから、豆電球が光るまでを順に並べましょう。",
        choices: ["回路に電気が流れる", "豆電球が光る", "回路が切れ目なくつながる", "スイッチを閉じる"],
        orderedChoices: ["スイッチを閉じる", "回路が切れ目なくつながる", "回路に電気が流れる", "豆電球が光る"],
        explanation: "『スイッチを閉じる』『回路が切れ目なくつながる』『回路に電気が流れる』『豆電球が光る』の順です。"
        ),

        QuizQuestion(
        question: "来年まくために集めたホウセンカの種は、どのようにしてからしまうとよいですか？",
        choices: [
        "風通しのよい日かげでよく乾かす",
        "水につけたままにする",
        "ぬれた袋に入れて密閉する",
        "土の中に深く埋める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『風通しのよい日かげでよく乾かす』です。集めた種はよく乾かしてからしまうと、次にまくときまで保存しやすくなります。"
        ),

        QuizQuestion(
        question: "日光の当たり方とホウセンカの育ち方の関係を調べます。最もよい比べ方はどれですか？",
        choices: [
        "種類も水の量も異なる2本を、同じ日なたで育てる",
        "同じように育った2本を使い、水の量などをそろえて日なたと日かげで育てる",
        "同じ1本を、毎日ちがう場所へ移して育てる",
        "種類の異なる2本を、日なたと日かげで育てる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『同じように育った2本を使い、水の量などをそろえて日なたと日かげで育てる』です。日光の当たり方だけを変えると、育ち方との関係を比べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】植物が芽を出して育ち、花を咲かせ、種を残すまでのまとまった変化を、植物の ＿＿ といいます。",
        answer: "一生",
        acceptableAnswers: ["いっしょう"],
        explanation: "＿＿に入る言葉は『一生』です。植物は芽を出して育ち、花や実をつけて種を残します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】植物の観察で調べたいことと、記録のしかたを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "草たけ", match: "ものさしで地面からの高さを測る"),
        QuizMatchingPair(prompt: "葉の枚数", match: "茎の下から上へ順に数える"),
        QuizMatchingPair(prompt: "葉の形", match: "形が分かるようにスケッチする"),
        QuizMatchingPair(prompt: "花の色", match: "見た色を色鉛筆で記録する")
        ],
        choices: ["形が分かるようにスケッチする", "見た色を色鉛筆で記録する", "ものさしで地面からの高さを測る", "茎の下から上へ順に数える"],
        explanation: "草たけはものさしで測り、葉の枚数は順番を決めて数えます。葉の形はスケッチし、花の色は見た色が分かるように記録します。"
        ),

        QuizQuestion(
        question: "次のうち、体が頭・むね・はらに分かれ、あしが6本あるものはどれですか？",
        choices: [
        "クモ",
        "ダンゴムシ",
        "アリ",
        "ムカデ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『アリ』です。アリは体が頭・むね・はらに分かれ、むねに6本のあしがあるこん虫です。"
        ),

        QuizQuestion(
        question: "バッタの幼虫と成虫を比べたとき、成虫で大きく発達している部分はどれですか？",
        choices: [
        "触角",
        "6本のあし",
        "頭とむね",
        "はね"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『はね』です。バッタの幼虫は成虫に似た形をしていますが、成長して成虫になるとはねが大きく発達します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】こん虫が大きくなるとき、古い皮をぬぐことを答えましょう。",
        answer: "脱皮",
        acceptableAnswers: ["だっぴ"],
        explanation: "こん虫が成長するときに古い皮をぬぐことを『脱皮』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】こん虫の体の部分を『頭についている』『むねについている』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "触角", match: "頭についている"),
        QuizMatchingPair(prompt: "目", match: "頭についている"),
        QuizMatchingPair(prompt: "6本のあし", match: "むねについている"),
        QuizMatchingPair(prompt: "はね", match: "むねについている")
        ],
        categories: ["頭についている", "むねについている"],
        explanation: "触角と目は頭についています。こん虫の6本のあしとはねは、むねについています。"
        ),

        QuizQuestion(
        question: "同じ場所に立てた棒の影の先へ、1時間ごとに印をつけると、印の位置が少しずつ動きました。主な理由はどれですか？",
        choices: [
        "太陽の見える位置が時間とともに変わったから",
        "棒が時間とともに短くなったから",
        "地面が少しずつ光り始めたから",
        "影が風に流されたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『太陽の見える位置が時間とともに変わったから』です。太陽の見える位置が変わると、影の向きや長さも変わります。"
        ),

        QuizQuestion(
        question: "日本で、昼ごろに太陽が南の空に見えるとき、棒の影は主にどちらへできますか？",
        choices: [
        "東",
        "北",
        "南",
        "西"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『北』です。影は太陽と反対側にできるので、太陽が南の空に見えるときは主に北へできます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】影がのびている方向と、太陽が見える方向を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "影が東へのびている", match: "太陽は西に見える"),
        QuizMatchingPair(prompt: "影が西へのびている", match: "太陽は東に見える"),
        QuizMatchingPair(prompt: "影が北へのびている", match: "太陽は南に見える"),
        QuizMatchingPair(prompt: "影が北東へのびている", match: "太陽は南西に見える")
        ],
        choices: ["太陽は東に見える", "太陽は南西に見える", "太陽は西に見える", "太陽は南に見える"],
        explanation: "影は太陽と反対の方向へのびます。東の影には西の太陽、西の影には東の太陽、北の影には南の太陽、北東の影には南西の太陽が対応します。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ棒を同じ場所で使った記録です。太陽が高く見えた順に並べましょう。",
        choices: ["記録B（影55 cm）", "記録D（影38 cm）", "記録A（影12 cm）", "記録C（影24 cm）"],
        rankedChoices: ["記録A（影12 cm）", "記録C（影24 cm）", "記録D（影38 cm）", "記録B（影55 cm）"],
        explanation: "同じ棒なら、影が短いほど太陽は高く見えます。『記録A（影12 cm）』『記録C（影24 cm）』『記録D（影38 cm）』『記録B（影55 cm）』の順です。"
        ),

        QuizQuestion(
        question: "ふたを閉めた暗い箱の中にある積み木を見えるようにするには、どうすればよいですか？",
        choices: [
        "箱を強く振る",
        "箱の近くで大きな音を出す",
        "箱の中へ光が入るようにする",
        "箱を冷たい場所へ移す"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『箱の中へ光が入るようにする』です。物を見るには、その物に光が当たり、物から来た光が目に届く必要があります。"
        ),

        QuizQuestion(
        question: "日光を受けたとき、向きを調整して離れた壁に明るい光を映しやすいものはどれですか？",
        choices: [
        "黒い布",
        "厚い木の板",
        "段ボール",
        "鏡"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『鏡』です。鏡は日光をよくはね返し、向きを調整すると離れた壁に明るい光を映せます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】向こう側がはっきり見え、光をよく通すものの性質を表す言葉を答えましょう。",
        answer: "透明",
        acceptableAnswers: ["とうめい"],
        explanation: "向こう側がはっきり見え、光をよく通す性質を『透明』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】光を使うときの行動を『安全な行動』『危険な行動』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鏡ではね返した日光を白い壁に当てる", match: "安全な行動"),
        QuizMatchingPair(prompt: "懐中電灯を机に向けて光の進み方を調べる", match: "安全な行動"),
        QuizMatchingPair(prompt: "鏡ではね返した日光を人の顔へ向ける", match: "危険な行動"),
        QuizMatchingPair(prompt: "虫眼鏡を使って太陽を直接見る", match: "危険な行動")
        ],
        categories: ["安全な行動", "危険な行動"],
        explanation: "光を壁や机に当てて調べるのは安全です。強い日光を人の顔へ向けたり、虫眼鏡で太陽を直接見たりするのは危険です。"
        ),

        QuizQuestion(
        question: "机から出した物さしをはじいて音を出しました。音をすぐに止めるには、どうすればよいですか？",
        choices: [
        "ふるえている物さしを手で押さえる",
        "物さしをさらに長く机から出す",
        "物さしをもっと強くはじく",
        "机を別の場所へ動かす"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『ふるえている物さしを手で押さえる』です。音を出している物さしのふるえを止めると、音も止まります。"
        ),

        QuizQuestion(
        question: "同じ鐘を同じ強さで鳴らしたとき、鐘から遠い場所では音がどのように聞こえやすいですか？",
        choices: [
        "高い音に変わって聞こえる",
        "小さく聞こえる",
        "近くより大きく聞こえる",
        "必ずまったく聞こえなくなる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『小さく聞こえる』です。同じ音でも、音を出すものから遠ざかるほど小さく聞こえやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】音を出すものと、音を出すための動かし方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "リコーダー", match: "息を吹きこむ"),
        QuizMatchingPair(prompt: "トライアングル", match: "棒でたたく"),
        QuizMatchingPair(prompt: "輪ゴム", match: "指ではじく"),
        QuizMatchingPair(prompt: "マラカス", match: "手で振る")
        ],
        choices: ["手で振る", "指ではじく", "息を吹きこむ", "棒でたたく"],
        explanation: "リコーダーは息を吹きこみ、トライアングルは棒でたたきます。輪ゴムは指ではじき、マラカスは手で振って音を出します。"
        ),

        QuizQuestion.classification(
        question: "【分類】音の主な伝わり方を『空気を主に伝わる』『固体を主に伝わる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "向かい合った友達の声を聞く", match: "空気を主に伝わる"),
        QuizMatchingPair(prompt: "少し離れた目覚まし時計の音を聞く", match: "空気を主に伝わる"),
        QuizMatchingPair(prompt: "糸電話で相手の声を聞く", match: "固体を主に伝わる"),
        QuizMatchingPair(prompt: "机に耳をつけて、反対側をたたく音を聞く", match: "固体を主に伝わる")
        ],
        categories: ["空気を主に伝わる", "固体を主に伝わる"],
        explanation: "会話や目覚まし時計の音は主に空気を伝わります。糸電話では糸を、机の音では机を通して、ふるえが伝わります。"
        ),

        QuizQuestion(
        question: "吹き流しが東の方へなびいています。風は主にどちらから吹いてきていますか？",
        choices: [
        "北",
        "東",
        "西",
        "南"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『西』です。吹き流しが東へなびくとき、風は反対側の西から東へ吹いています。"
        ),

        QuizQuestion(
        question: "ねじったゴムでプロペラを回します。ゴムが切れない範囲で、ねじる回数を増やすとどうなりやすいですか？",
        choices: [
        "プロペラがまったく回らなくなる",
        "回る向きが必ず反対になる",
        "回る時間はいつも同じになる",
        "プロペラが長く回りやすくなる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『プロペラが長く回りやすくなる』です。ゴムをねじる回数を増やすと、もとに戻ろうとする力をより多く使って回せます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】風で動く車の進むきょりを公平に調べる手順を順に並べましょう。",
        choices: ["車が止まった位置までのきょりを測る", "車と送風機を決めた印の位置に置く", "スタート線と送風機の位置に印をつける", "決めた強さの風を当て、車を手で押さずに放す"],
        orderedChoices: ["スタート線と送風機の位置に印をつける", "車と送風機を決めた印の位置に置く", "決めた強さの風を当て、車を手で押さずに放す", "車が止まった位置までのきょりを測る"],
        explanation: "『スタート線と送風機の位置に印をつける』『車と送風機を決めた印の位置に置く』『決めた強さの風を当て、車を手で押さずに放す』『車が止まった位置までのきょりを測る』の順です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ車に同じ向きから風を当てた結果です。風が強かったと考えられる順に並べましょう。",
        choices: ["実験C（40 cm進んだ）", "実験A（120 cm進んだ）", "実験D（95 cm進んだ）", "実験B（70 cm進んだ）"],
        rankedChoices: ["実験A（120 cm進んだ）", "実験D（95 cm進んだ）", "実験B（70 cm進んだ）", "実験C（40 cm進んだ）"],
        explanation: "車やほかの条件が同じなら、強い風ほど車を遠くまで進ませます。『実験A（120 cm進んだ）』『実験D（95 cm進んだ）』『実験B（70 cm進んだ）』『実験C（40 cm進んだ）』の順です。"
        ),

        QuizQuestion(
        question: "方位磁針の近くに棒磁石を置くと、針が北と南を指さなくなりました。主な理由はどれですか？",
        choices: [
        "棒磁石の力が方位磁針の針にはたらいたから",
        "方位磁針の針が水にぬれたから",
        "棒磁石から電気が流れたから",
        "地球が回るのを止めたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『棒磁石の力が方位磁針の針にはたらいたから』です。方位磁針の針も磁石なので、近くの棒磁石の力を受けて向きが変わります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】自由に動ける棒磁石で、北を指す方の極を答えましょう。",
        answer: "N極",
        acceptableAnswers: ["Nきょく", "エヌ極", "エヌきょく"],
        explanation: "自由に動ける棒磁石で、北を指す方の極を『N極』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】磁石の近づけ方と、起こることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "棒磁石のN極と方位磁針のN極側を近づける", match: "しりぞけ合う"),
        QuizMatchingPair(prompt: "棒磁石のS極と方位磁針のN極側を近づける", match: "引き合う"),
        QuizMatchingPair(prompt: "棒磁石の端を鉄のクリップへ近づける", match: "強く引きつける"),
        QuizMatchingPair(prompt: "棒磁石の中央を鉄のクリップへ近づける", match: "端より弱く引きつける")
        ],
        choices: ["強く引きつける", "しりぞけ合う", "端より弱く引きつける", "引き合う"],
        explanation: "同じ極どうしはしりぞけ合い、ちがう極どうしは引き合います。また、棒磁石は中央よりも端の極の近くで鉄を強く引きつけます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】豆電球を差し込み、導線につないで使う道具を答えましょう。",
        answer: "ソケット",
        acceptableAnswers: ["そけっと"],
        explanation: "豆電球を差し込み、導線につないで使う道具を『ソケット』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものを『電気を通す』『電気を通しにくい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "10円玉", match: "電気を通す"),
        QuizMatchingPair(prompt: "アルミニウムはく", match: "電気を通す"),
        QuizMatchingPair(prompt: "ゴムの消しゴム", match: "電気を通しにくい"),
        QuizMatchingPair(prompt: "プラスチックの定規", match: "電気を通しにくい")
        ],
        categories: ["電気を通す", "電気を通しにくい"],
        explanation: "10円玉とアルミニウムはくは金属なので電気を通します。ゴムの消しゴムとプラスチックの定規は電気を通しにくいものです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】身近なものが電気を通すか調べる手順を順に並べましょう。",
        choices: ["回路の切れ目に調べるものを入れる", "豆電球が光る回路を作る", "豆電球が光るか観察して記録する", "導線の一か所を外して回路に切れ目を作る"],
        orderedChoices: ["豆電球が光る回路を作る", "導線の一か所を外して回路に切れ目を作る", "回路の切れ目に調べるものを入れる", "豆電球が光るか観察して記録する"],
        explanation: "『豆電球が光る回路を作る』『導線の一か所を外して回路に切れ目を作る』『回路の切れ目に調べるものを入れる』『豆電球が光るか観察して記録する』の順です。"
        ),

        QuizQuestion(
        question: "ホウセンカの葉の数を数えるとき、同じ葉を二度数えないための方法として最もよいものはどれですか？",
        choices: [
        "茎の下から上へ順に数える",
        "目を閉じて数える",
        "毎回ちがう場所から数える",
        "葉を何枚か取り外してから数える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『茎の下から上へ順に数える』です。数える順番を決めると、同じ葉を二度数えたり、数え落としたりしにくくなります。"
        ),

        QuizQuestion(
        question: "2本のホウセンカの育ち方を比べます。記録する組み合わせとして最もよいものはどれですか？",
        choices: [
        "花の色と植木ばちの色",
        "観察した日、草たけ、葉の数",
        "土の色と教室の広さ",
        "水やりをした人の名前と天気だけ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『観察した日、草たけ、葉の数』です。同じ日に草たけや葉の数を記録すると、2本の育ち方を比べやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】植物が育ち、花や実をつけたあと、次の新しい植物につながるものを答えましょう。",
        answer: "種",
        acceptableAnswers: ["たね", "種子", "しゅし"],
        explanation: "植物がつくる『種』は、次の新しい植物につながります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じホウセンカの観察記録を、草たけが高い順に並べましょう。",
        choices: ["4回目 38 cm", "1回目 12 cm", "3回目 29 cm", "2回目 21 cm"],
        rankedChoices: ["4回目 38 cm", "3回目 29 cm", "2回目 21 cm", "1回目 12 cm"],
        explanation: "草たけを比べると、『4回目 38 cm』『3回目 29 cm』『2回目 21 cm』『1回目 12 cm』の順です。"
        ),

        QuizQuestion(
        question: "バッタが大きく跳ぶときに、特に役立つ体の部分はどれですか？",
        choices: [
        "頭の触角",
        "前のはね",
        "長くて太いうしろあし",
        "はらの先"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『長くて太いうしろあし』です。バッタは発達したうしろあしで地面を強くけって跳びます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】こん虫の頭にあり、まわりのようすを感じ取る2本の細長い部分を答えましょう。",
        answer: "触角",
        acceptableAnswers: ["しょっかく"],
        explanation: "こん虫の頭にある2本の細長い部分を『触角』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】こん虫と、卵を産むことが多い場所を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウ", match: "キャベツなどの葉"),
        QuizMatchingPair(prompt: "トンボ", match: "水の中や水面"),
        QuizMatchingPair(prompt: "バッタ", match: "草むらの土の中"),
        QuizMatchingPair(prompt: "カブトムシ", match: "腐葉土の中")
        ],
        choices: ["水の中や水面", "腐葉土の中", "キャベツなどの葉", "草むらの土の中"],
        explanation: "モンシロチョウはキャベツなどの葉、トンボは水の中や水面、バッタは草むらの土の中、カブトムシは腐葉土の中に卵を産むことが多いです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】バッタが卵から成虫になるまでを順に並べましょう。",
        choices: ["脱皮をくり返して大きくなる", "成虫になる", "卵から幼虫がかえる", "土の中に卵がある"],
        orderedChoices: ["土の中に卵がある", "卵から幼虫がかえる", "脱皮をくり返して大きくなる", "成虫になる"],
        explanation: "『土の中に卵がある』『卵から幼虫がかえる』『脱皮をくり返して大きくなる』『成虫になる』の順です。バッタはさなぎになりません。"
        ),

        QuizQuestion(
        question: "棒の影の向きの変化を一日調べます。正しく比べるために、変えない方がよいものはどれですか？",
        choices: [
        "記録する時刻",
        "影の先につける印の色",
        "観察する人の立つ場所",
        "棒を立てる位置と棒の立て方"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『棒を立てる位置と棒の立て方』です。同じ位置に同じように立てた棒を使うと、時刻による影の向きの変化を正しく比べられます。"
        ),

        QuizQuestion(
        question: "晴れていた空に厚い雲が広がり、太陽がかくれました。地面の影はどうなりやすいですか？",
        choices: [
        "うすくなったり、見えにくくなったりする",
        "必ず前より長くなる",
        "必ず前より短くなる",
        "向きだけが反対になる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『うすくなったり、見えにくくなったりする』です。厚い雲で日光がさえぎられると、はっきりした影ができにくくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】影を観察した結果と、そこから分かることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "影の先の位置が時間とともに動いた", match: "太陽の見える位置が変わった"),
        QuizMatchingPair(prompt: "影が前より短くなった", match: "太陽が前より高く見えた"),
        QuizMatchingPair(prompt: "影が前より長くなった", match: "太陽が前より低く見えた"),
        QuizMatchingPair(prompt: "雲が広がると影がうすくなった", match: "地面に届く日光が弱くなった")
        ],
        choices: ["太陽が前より低く見えた", "地面に届く日光が弱くなった", "太陽の見える位置が変わった", "太陽が前より高く見えた"],
        explanation: "影の位置の変化から太陽の見える位置の変化が分かります。影が短いと太陽は高く、影が長いと太陽は低く見えます。雲で影がうすくなるのは、届く日光が弱くなるためです。"
        ),

        QuizQuestion.classification(
        question: "【分類】影の変化を比べる観察を『正しく比べやすい』『正しく比べにくい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "同じ棒を同じ場所に立て、時刻だけを変えて調べる", match: "正しく比べやすい"),
        QuizMatchingPair(prompt: "影の先に時刻を書いて記録する", match: "正しく比べやすい"),
        QuizMatchingPair(prompt: "時刻ごとに長さのちがう棒を使う", match: "正しく比べにくい"),
        QuizMatchingPair(prompt: "午前は日なた、午後は日かげで調べる", match: "正しく比べにくい")
        ],
        categories: ["正しく比べやすい", "正しく比べにくい"],
        explanation: "棒の位置や長さなどをそろえ、時刻だけを変えると比べやすくなります。使う棒や日光の当たり方まで変えると、時刻による変化を正しく比べにくくなります。"
        ),

        QuizQuestion(
        question: "透明なガラス板の後ろにある文字が見えるのはなぜですか？",
        choices: [
        "ガラス板が同じ文字を作るから",
        "文字から来た光がガラス板を通るから",
        "ガラス板が文字を鏡のように映すだけだから",
        "ガラス板そのものが強い光を出すから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『文字から来た光がガラス板を通るから』です。透明なガラス板は光をよく通すため、後ろの文字が見えます。"
        ),

        QuizQuestion(
        question: "曲がった紙の筒の一方から懐中電灯を照らしても、反対側から光が見えにくいのはなぜですか？",
        choices: [
        "紙が音を吸い取るから",
        "懐中電灯の電気がなくなるから",
        "光はまっすぐ進み、筒の曲がりに沿って進まないから",
        "曲がった筒の中では光が水に変わるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『光はまっすぐ進み、筒の曲がりに沿って進まないから』です。光は基本的にまっすぐ進みます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】光が鏡などに当たり、進む向きを変えて戻ることを答えましょう。",
        answer: "はね返り",
        acceptableAnswers: ["反射", "はんしゃ", "跳ね返り"],
        explanation: "光が鏡などに当たって戻ることを『はね返り』または『反射』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものを『自分で光を出している』『受けた光を返して明るく見える』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "点灯中の懐中電灯", match: "自分で光を出している"),
        QuizMatchingPair(prompt: "ろうそくの炎", match: "自分で光を出している"),
        QuizMatchingPair(prompt: "日光が当たった鏡", match: "受けた光を返して明るく見える"),
        QuizMatchingPair(prompt: "日光が当たった白い紙", match: "受けた光を返して明るく見える")
        ],
        categories: ["自分で光を出している", "受けた光を返して明るく見える"],
        explanation: "点灯中の懐中電灯とろうそくの炎は自分で光を出します。鏡や白い紙は、受けた光を返すことで明るく見えます。"
        ),

        QuizQuestion(
        question: "糸電話で相手の声が聞こえにくく、糸がたるんでいました。どうすると聞こえやすくなりますか？",
        choices: [
        "紙コップを水でぬらす",
        "糸を途中で切る",
        "糸を指で強くつまむ",
        "糸をまっすぐに張る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『糸をまっすぐに張る』です。糸を張ると、声によるふるえが糸を通して相手の紙コップまで伝わりやすくなります。"
        ),

        QuizQuestion(
        question: "音が出ているスピーカーの前に軽い紙を置くと、紙が細かく動きました。主な理由はどれですか？",
        choices: [
        "スピーカーやまわりの空気のふるえが紙に伝わったから",
        "紙が磁石に引かれたから",
        "紙の中に電池が入っているから",
        "紙が光を集めたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『スピーカーやまわりの空気のふるえが紙に伝わったから』です。音を出すスピーカーのふるえが空気に伝わり、軽い紙を動かします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】たいこの皮へのはたらきかけと、起こることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "強くたたく", match: "皮のふれが大きく、音も大きくなる"),
        QuizMatchingPair(prompt: "弱くたたく", match: "皮のふれが小さく、音も小さくなる"),
        QuizMatchingPair(prompt: "鳴っている皮を手で押さえる", match: "ふるえと音が止まる"),
        QuizMatchingPair(prompt: "たたいたあと何もしないで待つ", match: "ふるえと音がだんだん小さくなる")
        ],
        choices: ["ふるえと音が止まる", "皮のふれが小さく、音も小さくなる", "ふるえと音がだんだん小さくなる", "皮のふれが大きく、音も大きくなる"],
        explanation: "強くたたくと皮のふれと音は大きく、弱くたたくと小さくなります。皮を押さえるとふるえと音が止まり、そのまま待つとふるえと音はだんだん小さくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】糸電話の使い方を『声が伝わりやすい』『声が伝わりにくい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "糸をまっすぐ張る", match: "声が伝わりやすい"),
        QuizMatchingPair(prompt: "糸が壁や机に触れないようにする", match: "声が伝わりやすい"),
        QuizMatchingPair(prompt: "糸をたるませる", match: "声が伝わりにくい"),
        QuizMatchingPair(prompt: "話している途中で糸を指でつまむ", match: "声が伝わりにくい")
        ],
        categories: ["声が伝わりやすい", "声が伝わりにくい"],
        explanation: "糸をまっすぐ張り、ほかの物に触れないようにすると、ふるえが伝わりやすくなります。糸をたるませたり指でつまんだりすると、ふるえが伝わりにくくなります。"
        ),

        QuizQuestion(
        question: "同じ風で走る車を、送風機から遠い場所に置きました。車の進むきょりはどうなりやすいですか？",
        choices: [
        "前より遠くなりやすい",
        "前より短くなりやすい",
        "必ず真上に進む",
        "送風機とのきょりにはまったく関係しない"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『前より短くなりやすい』です。送風機から遠ざかると車に当たる風が弱くなり、進むきょりも短くなりやすくなります。"
        ),

        QuizQuestion(
        question: "ゴムをのばす長さと車の進むきょりの関係を調べます。最も正しい調べ方はどれですか？",
        choices: [
        "毎回ちがう車とちがうゴムを使う",
        "ゴムの長さと走らせる場所を同時に変える",
        "同じ車とゴムを使い、のばす長さだけを変える",
        "車を手で押す強さだけを比べる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『同じ車とゴムを使い、のばす長さだけを変える』です。調べたい条件だけを変え、ほかの条件をそろえると正しく比べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】輪ゴムの、もとの長さからどれだけ長くなったかを表す言葉を答えましょう。",
        answer: "のばした長さ",
        acceptableAnswers: ["伸ばした長さ", "のばしたながさ"],
        explanation: "もとの長さからどれだけ長くしたかを『のばした長さ』と表します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ゴムで動く車の進むきょりを調べる手順を順に並べましょう。",
        choices: ["車が止まった位置までのきょりを測る", "車をスタート線に置く", "手で押さずに車を放す", "ゴムを決めた長さまでのばす"],
        orderedChoices: ["車をスタート線に置く", "ゴムを決めた長さまでのばす", "手で押さずに車を放す", "車が止まった位置までのきょりを測る"],
        explanation: "『車をスタート線に置く』『ゴムを決めた長さまでのばす』『手で押さずに車を放す』『車が止まった位置までのきょりを測る』の順です。"
        ),

        QuizQuestion(
        question: "棒磁石を糸でつるし、自由に回るようにして静かに待つと、どの向きで止まりやすいですか？",
        choices: [
        "東と西を結ぶ向き",
        "上下を結ぶ向き",
        "毎回まったくちがう向き",
        "北と南を結ぶ向き"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『北と南を結ぶ向き』です。自由に動ける磁石は、一方の極がおよそ北を、もう一方の極がおよそ南を向いて止まります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】磁石を使ったものと、磁石の役目を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "方位磁針", match: "方位を調べる"),
        QuizMatchingPair(prompt: "冷蔵庫の扉", match: "扉を閉じた状態に保つ"),
        QuizMatchingPair(prompt: "磁石式の筆箱", match: "ふたを簡単に留める"),
        QuizMatchingPair(prompt: "鉄くずを運ぶクレーン", match: "鉄くずを持ち上げる")
        ],
        choices: ["鉄くずを持ち上げる", "ふたを簡単に留める", "方位を調べる", "扉を閉じた状態に保つ"],
        explanation: "方位磁針は方位を調べ、冷蔵庫の扉では閉じた状態を保つために磁石が使われます。筆箱ではふたを留め、クレーンでは鉄くずを持ち上げます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ種類の鉄のクリップを持ち上げた数から、磁石を力が強い順に並べましょう。",
        choices: ["磁石B（5個）", "磁石D（2個）", "磁石A（12個）", "磁石C（8個）"],
        rankedChoices: ["磁石A（12個）", "磁石C（8個）", "磁石B（5個）", "磁石D（2個）"],
        explanation: "同じ種類のクリップを多く持ち上げた磁石ほど力が強いと考えられます。『磁石A（12個）』『磁石C（8個）』『磁石B（5個）』『磁石D（2個）』の順です。"
        ),

        QuizQuestion(
        question: "10円玉が電気を通すか調べるには、回路の切れ目に10円玉をどのように入れればよいですか？",
        choices: [
        "2本の導線の金属部分を10円玉の別々の場所に触れさせる",
        "10円玉を乾電池の上に置くだけにする",
        "10円玉を紙で包んで回路から離す",
        "導線のビニール部分だけを10円玉に触れさせる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『2本の導線の金属部分を10円玉の別々の場所に触れさせる』です。回路の切れ目を10円玉の金属でつなぐと、電気を通すか調べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】乾電池の、少し出っぱっている側の端を答えましょう。",
        answer: "プラス極",
        acceptableAnswers: ["＋極", "+極", "ぷらすきょく"],
        explanation: "乾電池の少し出っぱっている側の端を『プラス極』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】回路のようすを『回路がつながっている』『回路が切れている』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "乾電池の両極と豆電球を導線で一つの輪につなぐ", match: "回路がつながっている"),
        QuizMatchingPair(prompt: "回路につないだスイッチを閉じる", match: "回路がつながっている"),
        QuizMatchingPair(prompt: "導線の金属部分が豆電球から外れる", match: "回路が切れている"),
        QuizMatchingPair(prompt: "回路につないだスイッチを開く", match: "回路が切れている")
        ],
        categories: ["回路がつながっている", "回路が切れている"],
        explanation: "乾電池、導線、豆電球が一つの輪になり、スイッチが閉じていると回路はつながっています。導線が外れたりスイッチを開いたりすると、回路は切れています。"
        ),

        QuizQuestion(
        question: "ホウセンカへの水の量が育ち方にどう関係するか調べます。比べ方として最もよいものはどれですか？",
        choices: [
        "同じ土と日当たりで、一方だけに水を与えない",
        "一方は日なたで水を与え、もう一方は日かげで水を与えない",
        "同じ土と日当たりで、両方に同じ量の水を与える",
        "ホウセンカとヒマワリを別々の場所で育てる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『同じ土と日当たりで、一方だけに水を与えない』です。水の有無だけを変え、ほかの条件を同じにすると、水と育ち方の関係を比べられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】花がしぼんだあとにでき、中に種が入っている部分を答えましょう。",
        answer: "実",
        acceptableAnswers: ["み"],
        explanation: "花がしぼんだあとに『実』ができ、その中に種ができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】植物を育てるときのようすと、行うことを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "種をまいた直後", match: "土が乾かないように水をやる"),
        QuizMatchingPair(prompt: "芽が出たあと", match: "日光が当たる場所で育てる"),
        QuizMatchingPair(prompt: "茎が倒れそうなとき", match: "支柱を立てて支える"),
        QuizMatchingPair(prompt: "実が十分に熟したとき", match: "種を集めて保存する")
        ],
        choices: ["支柱を立てて支える", "種を集めて保存する", "土が乾かないように水をやる", "日光が当たる場所で育てる"],
        explanation: "種をまいた直後は土が乾かないように水をやり、芽が出たあとは日光が当たる場所で育てます。茎が倒れそうなときは支柱で支え、実が熟したら種を集めます。"
        ),

        QuizQuestion.classification(
        question: "【分類】植物の観察記録を『大きさや数が増えた』『色や形が変わった』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "草たけが12 cmから24 cmになった", match: "大きさや数が増えた"),
        QuizMatchingPair(prompt: "葉が5枚から11枚になった", match: "大きさや数が増えた"),
        QuizMatchingPair(prompt: "葉の色が緑色から黄色になった", match: "色や形が変わった"),
        QuizMatchingPair(prompt: "つぼみが開いて花になった", match: "色や形が変わった")
        ],
        categories: ["大きさや数が増えた", "色や形が変わった"],
        explanation: "草たけと葉の枚数は増えています。葉の色の変化と、つぼみが花になる変化は、色や形の変化です。"
        ),

        QuizQuestion(
        question: "こん虫のはねは、体のどの部分についていますか？",
        choices: [
        "頭",
        "むね",
        "はら",
        "しょっ角"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『むね』です。こん虫のはねと6本のあしは、むねについています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ヤゴが水から上がり、皮をぬいで成虫のトンボになることを答えましょう。",
        answer: "羽化",
        acceptableAnswers: ["うか"],
        explanation: "ヤゴなどが皮をぬいで成虫になることを『羽化』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】こん虫と、主に食べるものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウの成虫", match: "花のみつ"),
        QuizMatchingPair(prompt: "バッタ", match: "草の葉"),
        QuizMatchingPair(prompt: "セミ", match: "木の汁"),
        QuizMatchingPair(prompt: "トンボ", match: "小さな虫")
        ],
        choices: ["木の汁", "小さな虫", "花のみつ", "草の葉"],
        explanation: "モンシロチョウの成虫は花のみつ、バッタは草の葉、セミは木の汁、トンボは小さな虫を主に食べます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】モンシロチョウが卵から成虫になるまでを順に並べましょう。",
        choices: ["さなぎになる", "成虫になる", "卵からよう虫がかえる", "よう虫が葉を食べて育つ"],
        orderedChoices: ["卵からよう虫がかえる", "よう虫が葉を食べて育つ", "さなぎになる", "成虫になる"],
        explanation: "『卵からよう虫がかえる』『よう虫が葉を食べて育つ』『さなぎになる』『成虫になる』の順です。"
        ),

        QuizQuestion(
        question: "晴れた日に棒の影が東の方へ長くのびていました。観察した時刻として最も考えやすいものはどれですか？",
        choices: [
        "朝早く",
        "昼ごろ",
        "夕方",
        "夜中"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『夕方』です。夕方は太陽が西の空に見えるため、影は反対側の東へ長くのびます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】影がどの方位にのびているか調べるときに使う道具を答えましょう。",
        answer: "方位磁針",
        acceptableAnswers: ["ほういじしん"],
        explanation: "東西南北の方位を調べる道具は『方位磁針』です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】太陽と影を観察するときの道具と、使い方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "時計", match: "観察した時刻を記録する"),
        QuizMatchingPair(prompt: "方位磁針", match: "影が向く方位を調べる"),
        QuizMatchingPair(prompt: "チョーク", match: "影の先に印をつける"),
        QuizMatchingPair(prompt: "まっすぐな棒", match: "影をつくる基準にする")
        ],
        choices: ["影の先に印をつける", "観察した時刻を記録する", "影をつくる基準にする", "影が向く方位を調べる"],
        explanation: "時計は時刻の記録、方位磁針は方位の確認、チョークは影の先の印、まっすぐな棒は影をつくる基準に使います。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ棒の影を調べた記録を、影が長い順に並べましょう。",
        choices: ["正午 18 cm", "午前9時 62 cm", "午後2時 44 cm", "午前11時 30 cm"],
        rankedChoices: ["午前9時 62 cm", "午後2時 44 cm", "午前11時 30 cm", "正午 18 cm"],
        explanation: "記録された長さを比べると、『午前9時 62 cm』『午後2時 44 cm』『午前11時 30 cm』『正午 18 cm』の順です。"
        ),

        QuizQuestion(
        question: "懐中電灯と白い壁の間に不透明な板を置き、その板を懐中電灯に近づけました。壁にできる影はどうなりやすいですか？",
        choices: [
        "小さくなる",
        "消える",
        "明るさだけが変わり、大きさは変わらない",
        "大きくなる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『大きくなる』です。不透明な板を光源に近づけると、板がさえぎる光の広がりが大きくなり、壁の影も大きくなりやすくなります。"
        ),

        QuizQuestion(
        question: "1枚目の鏡ではね返した日光を2枚目の鏡に当て、2枚目の向きを変えました。できることはどれですか？",
        choices: [
        "日光を二回はね返して、別の場所を照らす",
        "日光を電気に変える",
        "鏡の中に日光をためる",
        "日光を音に変える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『日光を二回はね返して、別の場所を照らす』です。光は鏡に当たるたびにはね返るため、2枚の鏡で進む向きを二回変えられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものの表面を『はっきりした光を返しやすい』『はっきりした光を返しにくい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鏡", match: "はっきりした光を返しやすい"),
        QuizMatchingPair(prompt: "よくみがいた金属板", match: "はっきりした光を返しやすい"),
        QuizMatchingPair(prompt: "黒い布", match: "はっきりした光を返しにくい"),
        QuizMatchingPair(prompt: "段ボール", match: "はっきりした光を返しにくい")
        ],
        categories: ["はっきりした光を返しやすい", "はっきりした光を返しにくい"],
        explanation: "鏡や、よくみがいた金属板は、はっきりした光を返しやすい表面です。黒い布や段ボールは、鏡のようなはっきりした光を返しにくいものです。"
        ),

        QuizQuestion(
        question: "日かげに置いた鏡で、壁に明るい日光を映したいとき、まず必要なことはどれですか？",
        choices: [
        "鏡を冷たくする",
        "鏡に日光が当たるようにする",
        "壁を黒くぬる",
        "鏡を布でおおう"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『鏡に日光が当たるようにする』です。鏡に日光が当たらなければ、日光を壁へはね返すことはできません。"
        ),

        QuizQuestion(
        question: "机の一方の端を軽くたたき、反対側で机に耳をつけると音が聞こえました。このことから分かることはどれですか？",
        choices: [
        "机が電気をつくった",
        "指から光が出た",
        "音が木の中を伝わった",
        "机が磁石になった"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『音が木の中を伝わった』です。音は空気だけでなく、机のような固体の中も伝わります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】音の大きさを変えたときのようすを、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "たいこを強くたたく", match: "たいこの皮のふるえが大きくなる"),
        QuizMatchingPair(prompt: "輪ゴムを強くはじく", match: "輪ゴムのふるえが大きくなる"),
        QuizMatchingPair(prompt: "声を小さくする", match: "のどのふるえが小さくなる"),
        QuizMatchingPair(prompt: "音さを弱くたたく", match: "音さのふるえが小さくなる")
        ],
        choices: [
        "音さのふるえが小さくなる",
        "たいこの皮のふるえが大きくなる",
        "のどのふるえが小さくなる",
        "輪ゴムのふるえが大きくなる"
        ],
        explanation: "音を大きくすると、音を出している物のふるえは大きくなります。音を小さくすると、ふるえも小さくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】もののようすを『音が出ている』『音が止まっている』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "たたいた直後で、皮がふるえているたいこ", match: "音が出ている"),
        QuizMatchingPair(prompt: "手で押さえ、皮のふるえが止まったたいこ", match: "音が止まっている"),
        QuizMatchingPair(prompt: "はじいたあとで、ふるえている輪ゴム", match: "音が出ている"),
        QuizMatchingPair(prompt: "はじかずに、止まっている輪ゴム", match: "音が止まっている")
        ],
        categories: ["音が出ている", "音が止まっている"],
        explanation: "たいこの皮や輪ゴムがふるえているときは音が出ています。ふるえを止めると、音も止まります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】物さしをはじいてから音が耳に届くまでを順に並べましょう。",
        choices: ["音が耳に届く", "物さしの端をはじく", "物さしがふるえ始める", "ふるえが周りの空気に伝わる"],
        orderedChoices: ["物さしの端をはじく", "物さしがふるえ始める", "ふるえが周りの空気に伝わる", "音が耳に届く"],
        explanation: "『物さしの端をはじく』『物さしがふるえ始める』『ふるえが周りの空気に伝わる』『音が耳に届く』の順です。"
        ),

        QuizQuestion(
        question: "同じ車に同じ強さの風を当てるとき、車をより遠くまで進ませやすいほはどれですか？",
        choices: [
        "とても小さいほ",
        "穴の多いほ",
        "ほを付けない車",
        "風を受ける面が大きいほ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『風を受ける面が大きいほ』です。風を受ける面が大きいと、風の力を受けやすくなります。"
        ),

        QuizQuestion(
        question: "車のほの大きさと進むきょりの関係を調べます。正しい実験のしかたはどれですか？",
        choices: [
        "車、風の強さ、送風機までのきょりを同じにし、ほの大きさだけを変える",
        "ほの大きさと風の強さを同時に変える",
        "大きさのちがう車を別々の場所で走らせる",
        "毎回、車を手で押す強さを変える"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『車、風の強さ、送風機までのきょりを同じにし、ほの大きさだけを変える』です。調べたい条件だけを変えると、ほの大きさによるちがいを比べられます。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものの動きに使われている力を『風の力』『ゴムの力』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "うちわで風車を回す", match: "風の力"),
        QuizMatchingPair(prompt: "送風機でほのある車を進ませる", match: "風の力"),
        QuizMatchingPair(prompt: "のばした輪ゴムで車を走らせる", match: "ゴムの力"),
        QuizMatchingPair(prompt: "ねじったゴムでプロペラを回す", match: "ゴムの力")
        ],
        categories: ["風の力", "ゴムの力"],
        explanation: "うちわや送風機で動かすものは風の力を使います。のばしたり、ねじったりしたゴムで動かすものはゴムの力を使います。"
        ),

        QuizQuestion(
        question: "同じ種類の輪ゴムを同じ長さだけのばします。輪ゴム1本の車と、輪ゴム2本を並べて使う車では、どちらが遠くまで進みやすいですか？",
        choices: [
        "輪ゴム1本の車",
        "輪ゴム2本の車",
        "どちらも必ず同じきょり",
        "どちらもまったく動かない"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『輪ゴム2本の車』です。同じ種類の輪ゴムを同じ長さだけのばすなら、2本を使う方がもとにもどろうとする力が大きくなり、遠くまで進みやすくなります。"
        ),

        QuizQuestion(
        question: "うすい紙をはさんで磁石を動かすと、紙の上の鉄のクリップも動きました。このことから分かることはどれですか？",
        choices: [
        "紙が磁石に変わった",
        "クリップに電気が流れた",
        "磁石の力はうすい紙を通してはたらくことがある",
        "紙が鉄になった"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『磁石の力はうすい紙を通してはたらくことがある』です。磁石が直接ふれていなくても、近くにある鉄を引きつけることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】棒磁石の両端にある、磁石の力が強いところを答えましょう。",
        answer: "極",
        acceptableAnswers: ["きょく"],
        explanation: "棒磁石の両端にある、磁石の力が強いところを『極』といいます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ磁石と同じ鉄のクリップを使います。磁石の力が強くはたらく順に、磁石とクリップのきょりを並べましょう。",
        choices: ["4 cm", "1 cm", "3 cm", "2 cm"],
        rankedChoices: ["1 cm", "2 cm", "3 cm", "4 cm"],
        explanation: "同じ磁石なら、クリップとのきょりが近いほど磁石の力が強くはたらきます。『1 cm』『2 cm』『3 cm』『4 cm』の順です。"
        ),

        QuizQuestion(
        question: "乾電池と豆電球を切れ目なくつないだ回路で、乾電池の向きだけを反対にしました。豆電球はどうなりますか？",
        choices: [
        "まったく光らなくなる",
        "一度だけ光って消える",
        "急にとても明るくなる",
        "ほぼ同じように光る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『ほぼ同じように光る』です。豆電球の回路が切れ目なくつながっていれば、乾電池の向きを反対にしても豆電球は光ります。"
        ),

        QuizQuestion(
        question: "豆電球から出た2本の導線を、どちらも乾電池のプラス極につなぎました。豆電球が光らない主な理由はどれですか？",
        choices: [
        "プラス極とマイナス極を通る一つの輪になっていないから",
        "導線が長すぎるから",
        "豆電球が冷たいから",
        "乾電池を横向きに置いたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『プラス極とマイナス極を通る一つの輪になっていないから』です。電気が流れるには、乾電池のプラス極とマイナス極を通る切れ目のない回路が必要です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】回路をつないだり切ったりして、豆電球をつけたり消したりする道具を答えましょう。",
        answer: "スイッチ",
        acceptableAnswers: ["すいっち"],
        explanation: "回路をつないだり切ったりする道具を『スイッチ』といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ホウセンカの めが出たとき、はじめに開く葉を答えましょう。",
        answer: "子葉",
        acceptableAnswers: ["しよう"],
        explanation: "ホウセンカの芽が出たとき、はじめに開く葉を『子葉』といいます。"
        ),

        QuizQuestion(
        question: "ホウセンカの草たけをものさしで測るとき、ものさしの0 cmをどこに合わせますか？",
        choices: [
        "地面と茎が接するところ",
        "いちばん上の葉の先",
        "花のまん中",
        "植木ばちのふち"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『地面と茎が接するところ』です。そこにものさしの0 cmを合わせ、いちばん高いところまで測ります。"
        ),

        QuizQuestion(
        question: "こん虫の6本のあしは、体のどの部分についていますか？",
        choices: [
        "頭",
        "むね",
        "はら",
        "はね"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『むね』です。こん虫の6本のあしは、すべてむねについています。"
        ),

        QuizQuestion(
        question: "棒を立てたときにできる影は、太陽が見える方向と比べて、どちら側にできますか？",
        choices: [
        "太陽と同じ側",
        "棒の真上",
        "太陽と反対側",
        "いつも北側"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『太陽と反対側』です。影は光がさえぎられた側にできます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】一日の中で棒の影がいちばん短くなりやすいのは、太陽が空の ＿＿ に見えるときです。",
        answer: "高いところ",
        acceptableAnswers: ["たかいところ", "高い位置", "たかいいち"],
        explanation: "＿＿に入るのは『高いところ』です。太陽が空の高いところに見えるとき、棒の影は短くなりやすくなります。"
        ),

        QuizQuestion(
        question: "鏡で日光を壁に当てています。壁の明るい場所を動かすには、どうすればよいですか？",
        choices: [
        "鏡を布でおおう",
        "壁を水でぬらす",
        "鏡を箱にしまう",
        "鏡の向きを変える"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『鏡の向きを変える』です。鏡の向きを変えると、はね返る光の向きも変わり、壁の明るい場所が動きます。"
        ),

        QuizQuestion(
        question: "音が出ているトライアングルに指でそっとふれると、どのようなことが分かりますか？",
        choices: [
        "あたたかくなっている",
        "細かくふるえている",
        "水でぬれている",
        "磁石の力をもっている"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『細かくふるえている』です。音が出ているトライアングルにふれると、そのふるえが分かります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】音を出しているものの、細かく動くようすを答えましょう。",
        answer: "ふるえ",
        acceptableAnswers: ["振動", "しんどう"],
        explanation: "音が出ているものはふるえています。この動きを『ふるえ』や『振動』といいます。"
        ),

        QuizQuestion(
        question: "風で動く車を、同じ場所からもっと遠くまで進ませるには、どうすればよいですか？",
        choices: [
        "車のほを外す",
        "車輪を手で押さえる",
        "風を弱くする",
        "風を強くする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『風を強くする』です。同じ車なら、強い風を当てるほど風の力が大きくなり、遠くまで進みやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】同じゴムを長くのばすほど、もとにもどろうとする力は ＿＿ なります。",
        answer: "強く",
        acceptableAnswers: ["つよく"],
        explanation: "＿＿に入るのは『強く』です。同じゴムは、長くのばすほど、もとにもどろうとする力が強くなります。"
        ),

        QuizQuestion(
        question: "棒磁石のN極とS極を近づけると、どうなりますか？",
        choices: [
        "何も起こらない",
        "引き合う",
        "しりぞけ合う",
        "両方とも鉄になる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『引き合う』です。磁石のちがう極どうしであるN極とS極は、引き合います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】乾電池と豆電球が導線で切れ目なくつながった、電気の通り道を答えましょう。",
        answer: "回路",
        acceptableAnswers: ["かいろ"],
        explanation: "電気が流れる、切れ目なくつながった通り道を『回路』といいます。"
        ),

        QuizQuestion(
        question: "導線の先のビニールをむき、中の金属どうしをつなぐのはなぜですか？",
        choices: [
        "ビニールが電気をつくるから",
        "ビニールが磁石につくから",
        "金属を冷やすため",
        "中の金属が電気を通すから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『中の金属が電気を通すから』です。導線の外側のビニールは電気を通しにくいため、先をむいて中の金属どうしをつなぎます。"
        ),

        QuizQuestion.classification(
        question: "【分類】こん虫を『さなぎになる』『さなぎにならない』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウ", match: "さなぎになる"),
        QuizMatchingPair(prompt: "カブトムシ", match: "さなぎになる"),
        QuizMatchingPair(prompt: "バッタ", match: "さなぎにならない"),
        QuizMatchingPair(prompt: "トンボ", match: "さなぎにならない")
        ],
        categories: ["さなぎになる", "さなぎにならない"],
        explanation: "モンシロチョウとカブトムシはさなぎになります。バッタとトンボはさなぎにならずに成虫になります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】ものと、光の通り方やはね返り方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "透明なガラス板", match: "光をよく通す"),
        QuizMatchingPair(prompt: "半透明のシート", match: "光を少し通す"),
        QuizMatchingPair(prompt: "鏡", match: "光をはね返す"),
        QuizMatchingPair(prompt: "厚い木の板", match: "光を通さない")
        ],
        choices: ["光をはね返す", "光を通さない", "光をよく通す", "光を少し通す"],
        explanation: "透明なガラス板は『光をよく通す』、半透明のシートは『光を少し通す』、鏡は『光をはね返す』、厚い木の板は『光を通さない』ものです。"
        ),

        QuizQuestion.related(
        question: "【関連付け】植物の部分と、観察するとよいことを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "葉", match: "枚数と形"),
        QuizMatchingPair(prompt: "茎", match: "地面からの高さ"),
        QuizMatchingPair(prompt: "花", match: "色と形"),
        QuizMatchingPair(prompt: "実", match: "中にある種のようす")
        ],
        choices: ["色と形", "中にある種のようす", "地面からの高さ", "枚数と形"],
        explanation: "葉は『枚数と形』、茎は『地面からの高さ』、花は『色と形』、実は『中にある種のようす』を観察します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ホウセンカのつぼみができてから、種ができるまでを順に並べましょう。",
        choices: ["花がしぼむ", "実の中に種ができる", "つぼみがふくらむ", "花がさく"],
        orderedChoices: ["つぼみがふくらむ", "花がさく", "花がしぼむ", "実の中に種ができる"],
        explanation: "『つぼみがふくらむ』『花がさく』『花がしぼむ』『実の中に種ができる』の順です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】トンボが卵から成虫になるまでを順に並べましょう。",
        choices: ["ヤゴが水中で育つ", "羽化して成虫になる", "水中に卵が産みつけられる", "ヤゴが水面上の草などに上がる"],
        orderedChoices: ["水中に卵が産みつけられる", "ヤゴが水中で育つ", "ヤゴが水面上の草などに上がる", "羽化して成虫になる"],
        explanation: "『水中に卵が産みつけられる』『ヤゴが水中で育つ』『ヤゴが水面上の草などに上がる』『羽化して成虫になる』の順です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】こん虫と、よう虫が主に育つ場所を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウ", match: "キャベツなどの葉の上"),
        QuizMatchingPair(prompt: "トンボ", match: "水の中"),
        QuizMatchingPair(prompt: "カブトムシ", match: "くさった木や腐葉土の中"),
        QuizMatchingPair(prompt: "バッタ", match: "草むら")
        ],
        choices: ["草むら", "水の中", "くさった木や腐葉土の中", "キャベツなどの葉の上"],
        explanation: "モンシロチョウは『キャベツなどの葉の上』、トンボは『水の中』、カブトムシは『くさった木や腐葉土の中』、バッタは『草むら』で、よう虫が主に育ちます。"
        ),

        QuizQuestion.classification(
        question: "【分類】観察したようすを『太陽のようす』『影のようす』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "朝に東の空に見える", match: "太陽のようす"),
        QuizMatchingPair(prompt: "時間とともに西の方へ動いて見える", match: "太陽のようす"),
        QuizMatchingPair(prompt: "太陽と反対側にできる", match: "影のようす"),
        QuizMatchingPair(prompt: "昼ごろ短くなりやすい", match: "影のようす")
        ],
        categories: ["太陽のようす", "影のようす"],
        explanation: "『朝に東の空に見える』『時間とともに西の方へ動いて見える』は太陽のようすです。『太陽と反対側にできる』『昼ごろ短くなりやすい』は影のようすです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ場所・同じ時刻に、まっすぐ立てた棒の影が長くなる順に並べましょう。",
        choices: ["高さ40 cmの棒", "高さ80 cmの棒", "高さ20 cmの棒", "高さ60 cmの棒"],
        rankedChoices: ["高さ80 cmの棒", "高さ60 cmの棒", "高さ40 cmの棒", "高さ20 cmの棒"],
        explanation: "同じ場所・同じ時刻なら、高い棒ほど長い影ができます。『高さ80 cmの棒』『高さ60 cmの棒』『高さ40 cmの棒』『高さ20 cmの棒』の順です。"
        ),

        QuizQuestion(
        question: "鏡1枚で当てた日光と、鏡2枚で同じ場所に重ねた日光を比べると、重ねた場所の温度はどうなりやすいですか？",
        choices: [
        "高くなりやすい",
        "低くなりやすい",
        "まったく変わらない",
        "必ず0度になる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『高くなりやすい』です。日光を同じ場所に重ねると光が強くなり、その場所の温度は高くなりやすくなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】実験の結果を『光がまっすぐ進むこと』『光がはね返ること』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "3枚の厚紙の穴を一直線にすると光が見えた", match: "光がまっすぐ進むこと"),
        QuizMatchingPair(prompt: "真ん中の厚紙をずらすと光が見えなくなった", match: "光がまっすぐ進むこと"),
        QuizMatchingPair(prompt: "鏡に日光を当てると壁が明るくなった", match: "光がはね返ること"),
        QuizMatchingPair(prompt: "鏡の向きを変えると明るい場所が動いた", match: "光がはね返ること")
        ],
        categories: ["光がまっすぐ進むこと", "光がはね返ること"],
        explanation: "『3枚の厚紙の穴を一直線にすると光が見えた』『真ん中の厚紙をずらすと光が見えなくなった』は光がまっすぐ進むことを示します。『鏡に日光を当てると壁が明るくなった』『鏡の向きを変えると明るい場所が動いた』は光がはね返ることを示します。"
        ),

        QuizQuestion(
        question: "同じ輪ゴムを弱くはじいたあと、強くはじきました。強くはじいたときの音はどうなりますか？",
        choices: [
        "小さくなる",
        "変わらない",
        "大きくなる",
        "まったく聞こえなくなる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『大きくなる』です。輪ゴムを強くはじくと、ふるえが大きくなり、音も大きくなります。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じたいこをたたいたとき、音が大きいと考えられる順に、たいこの皮のふれはばを並べましょう。",
        choices: ["ふれはば 4 mm", "ふれはば 2 mm", "ふれはば 8 mm", "ふれはば 6 mm"],
        rankedChoices: ["ふれはば 8 mm", "ふれはば 6 mm", "ふれはば 4 mm", "ふれはば 2 mm"],
        explanation: "音を出すもののふれはばが大きいほど、音も大きくなります。『ふれはば 8 mm』『ふれはば 6 mm』『ふれはば 4 mm』『ふれはば 2 mm』の順です。"
        ),

        QuizQuestion(
        question: "ゴムで動く車をもっと遠くまで進ませるには、同じゴムをどうすればよいですか？",
        choices: [
        "より長くのばす",
        "のばす長さを短くする",
        "たるませる",
        "車から外す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『より長くのばす』です。同じゴムをより長くのばすと、もとにもどろうとする力が強くなり、車は遠くまで進みやすくなります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】風やゴムの使い方と、ものの動き方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "風車に弱い風を当てる", match: "ゆっくり回る"),
        QuizMatchingPair(prompt: "風車に強い風を当てる", match: "速く回る"),
        QuizMatchingPair(prompt: "車のゴムを短くのばす", match: "近いところで止まる"),
        QuizMatchingPair(prompt: "車のゴムを長くのばす", match: "遠いところで止まる")
        ],
        choices: ["遠いところで止まる", "ゆっくり回る", "近いところで止まる", "速く回る"],
        explanation: "風車に弱い風を当てると『ゆっくり回る』、強い風を当てると『速く回る』ようになります。車のゴムを短くのばすと『近いところで止まる』、長くのばすと『遠いところで止まる』ようになります。"
        ),

        QuizQuestion(
        question: "磁石にしばらくつけた鉄のくぎが、別の鉄のクリップを引きつけました。このことから何が分かりますか？",
        choices: [
        "くぎが熱を出した",
        "くぎに電気が流れた",
        "くぎが磁石の性質をもった",
        "くぎが軽くなった"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『くぎが磁石の性質をもった』です。鉄のくぎは磁石につけると、一時的に別の鉄を引きつけることがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】磁石の極の組み合わせを『引き合う』『しりぞけ合う』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "N極とS極", match: "引き合う"),
        QuizMatchingPair(prompt: "S極とN極", match: "引き合う"),
        QuizMatchingPair(prompt: "N極とN極", match: "しりぞけ合う"),
        QuizMatchingPair(prompt: "S極とS極", match: "しりぞけ合う")
        ],
        categories: ["引き合う", "しりぞけ合う"],
        explanation: "『N極とS極』『S極とN極』は引き合います。『N極とN極』『S極とS極』はしりぞけ合います。"
        ),

        QuizQuestion(
        question: "豆電球と乾電池に異常はありませんが、導線の切れ目をプラスチックの定規でつないでいるため光りません。何に取りかえると光りますか？",
        choices: [
        "ゴムの消しゴム",
        "木のぼう",
        "紙の細長い切れはし",
        "アルミニウムはく"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『アルミニウムはく』です。アルミニウムはくは金属で電気を通すため、回路の切れ目をつなぐと豆電球が光ります。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika3, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika3ListView(isPresenting: .constant(false))
    }
}
