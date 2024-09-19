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
            correctAnswerIndex: 0,
            explanation: "太陽の光が当たると、影は東から西へと動きます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika3, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika3ListView(isPresenting: .constant(false))
    }
}
