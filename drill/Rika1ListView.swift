//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika1ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "次の中で、春に見られる生き物はどれですか？",
            choices: [
                "セミ",
                "カエル",
                "クジラ",
                "カメ"
            ],
            correctAnswerIndex: 1,
            explanation: "春にはカエルがよく見られます。"
        ),

        QuizQuestion(
            question: "次の中で、水中に住む生き物はどれですか？",
            choices: [
                "カニ",
                "ネコ",
                "トンボ",
                "イヌ"
            ],
            correctAnswerIndex: 0,
            explanation: "カニは水中や水辺に住む生き物です。"
        ),

        QuizQuestion(
            question: "次の中で、花を咲かせる植物はどれですか？",
            choices: [
                "サクラ",
                "シダ",
                "ホウセンカ",
                "ヒマワリ"
            ],
            correctAnswerIndex: 3,
            explanation: "ヒマワリは夏に花を咲かせる植物です。"
        ),
        QuizQuestion(
            question: "次の中で、秋に見られる動物はどれですか？",
            choices: [
                "クマ",
                "ウサギ",
                "カエル",
                "イルカ"
            ],
            correctAnswerIndex: 0,
            explanation: "秋にはクマが冬眠の準備を始めます。"
        ),

        QuizQuestion(
            question: "次の中で、水に住む生き物はどれですか？",
            choices: [
                "イヌ",
                "カニ",
                "ネコ",
                "サル"
            ],
            correctAnswerIndex: 1,
            explanation: "カニは水辺に住む生き物です。"
        ),

        QuizQuestion(
            question: "次の中で、冬に葉を落とす木はどれですか？",
            choices: [
                "マツ",
                "カエデ",
                "サクラ",
                "モミ"
            ],
            correctAnswerIndex: 1,
            explanation: "カエデは冬に葉を落とす木です。"
        ),

        QuizQuestion(
            question: "次の中で、夏に見られる昆虫はどれですか？",
            choices: [
                "ホタル",
                "セミ",
                "アリ",
                "チョウ"
            ],
            correctAnswerIndex: 1,
            explanation: "セミは夏によく見られる昆虫です。"
        ),

        QuizQuestion(
            question: "次の中で、冬に見られる植物はどれですか？",
            choices: [
                "ヒマワリ",
                "シクラメン",
                "タンポポ",
                "サクラ"
            ],
            correctAnswerIndex: 1,
            explanation: "シクラメンは冬に見られる植物です。"
        ),

        QuizQuestion(
            question: "次の中で、花を咲かせる植物はどれですか？",
            choices: [
                "松",
                "ヒノキ",
                "バラ",
                "シダ"
            ],
            correctAnswerIndex: 2,
            explanation: "バラは花を咲かせる植物です。"
        ),

        QuizQuestion(
            question: "次の中で、太陽が昇る方向はどちらですか？",
            choices: [
                "北",
                "南",
                "東",
                "西"
            ],
            correctAnswerIndex: 2,
            explanation: "太陽は東から昇ります。"
        ),

        QuizQuestion(
            question: "次の中で、空を飛べる生き物はどれですか？",
            choices: [
                "ウサギ",
                "トンボ",
                "カメ",
                "イルカ"
            ],
            correctAnswerIndex: 1,
            explanation: "トンボは空を飛べる昆虫です。"
        ),

        QuizQuestion(
            question: "次の中で、夜に活動する生き物はどれですか？",
            choices: [
                "スズメ",
                "コウモリ",
                "アリ",
                "ネコ"
            ],
            correctAnswerIndex: 1,
            explanation: "コウモリは夜に活動します。"
        ),

        QuizQuestion(
            question: "次の中で、星が見られるのはどの時間帯ですか？",
            choices: [
                "昼",
                "夕方",
                "夜",
                "朝"
            ],
            correctAnswerIndex: 2,
            explanation: "星は夜に見られます。"
        ),
        QuizQuestion(
            question: "次の中で、冬に活動が少なくなる生き物はどれですか？",
            choices: [
                "クマ",
                "スズメ",
                "カラス",
                "イルカ"
            ],
            correctAnswerIndex: 0,
            explanation: "クマは冬に冬眠して活動が少なくなります。"
        ),

        QuizQuestion(
            question: "次の中で、春に見られる花はどれですか？",
            choices: [
                "タンポポ",
                "ヒマワリ",
                "コスモス",
                "チューリップ"
            ],
            correctAnswerIndex: 3,
            explanation: "チューリップは春に見られる花です。"
        ),

        QuizQuestion(
            question: "次の中で、動物が冬眠する季節はどれですか？",
            choices: [
                "夏",
                "春",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 3,
            explanation: "動物は冬に冬眠します。"
        ),

        QuizQuestion(
            question: "次の中で、地面に生える植物はどれですか？",
            choices: [
                "ワカメ",
                "シダ",
                "ホウセンカ",
                "ヒジキ"
            ],
            correctAnswerIndex: 2,
            explanation: "ホウセンカは地面に生える植物です。"
        ),

        QuizQuestion(
            question: "次の中で、夜に見える天体はどれですか？",
            choices: [
                "太陽",
                "星",
                "雲",
                "彗星"
            ],
            correctAnswerIndex: 1,
            explanation: "夜には星が見えます。"
        ),

        QuizQuestion(
            question: "次の中で、魚に分類される生き物はどれですか？",
            choices: [
                "タコ",
                "サメ",
                "カメ",
                "カエル"
            ],
            correctAnswerIndex: 1,
            explanation: "サメは魚に分類される生き物です。"
        ),

        QuizQuestion(
            question: "次の中で、昆虫に分類されるのはどれですか？",
            choices: [
                "カメ",
                "アリ",
                "ヘビ",
                "イヌ"
            ],
            correctAnswerIndex: 1,
            explanation: "アリは昆虫に分類されます。"
        ),

        QuizQuestion(
            question: "次の中で、春に見られる昆虫はどれですか？",
            choices: [
                "アリ",
                "カブトムシ",
                "ホタル",
                "セミ"
            ],
            correctAnswerIndex: 0,
            explanation: "春にはアリがよく見られます。"
        ),

        QuizQuestion(
            question: "次の中で、秋に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ヒマワリ",
                "コスモス",
                "バラ"
            ],
            correctAnswerIndex: 2,
            explanation: "コスモスは秋に咲く花です。"
        ),

        QuizQuestion(
            question: "次の中で、昼間に空で見えるものはどれですか？",
            choices: [
                "星",
                "月",
                "太陽",
                "流れ星"
            ],
            correctAnswerIndex: 2,
            explanation: "昼間には太陽が空に見えます。"
        ),
        QuizQuestion(
            question: "次の中で、木から落ちる葉っぱが多い季節はどれですか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 2,
            explanation: "秋になると木の葉っぱが多く落ちます。"
        ),

        QuizQuestion(
            question: "次の中で、昆虫に分類されるものはどれですか？",
            choices: [
                "カニ",
                "チョウ",
                "カメ",
                "タコ"
            ],
            correctAnswerIndex: 1,
            explanation: "チョウは昆虫に分類されます。"
        ),

        QuizQuestion(
            question: "次の中で、太陽が一番高くなるのはどの時間ですか？",
            choices: [
                "朝",
                "昼",
                "夕方",
                "夜"
            ],
            correctAnswerIndex: 1,
            explanation: "昼になると太陽が一番高くなります。"
        ),

        QuizQuestion(
            question: "次の中で、花を咲かせる植物はどれですか？",
            choices: [
                "ヒノキ",
                "松",
                "タンポポ",
                "シダ"
            ],
            correctAnswerIndex: 2,
            explanation: "タンポポは花を咲かせる植物です。"
        ),

        QuizQuestion(
            question: "次の中で、昼間に見える天体はどれですか？",
            choices: [
                "太陽",
                "星",
                "月",
                "彗星"
            ],
            correctAnswerIndex: 0,
            explanation: "昼間に見える天体は太陽です。"
        ),

        QuizQuestion(
            question: "次の中で、植物が育つために必要なものはどれですか？",
            choices: [
                "水",
                "石",
                "金属",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物が育つためには水が必要です。"
        ),

        QuizQuestion(
            question: "次の中で、地面に根をはって育つ植物はどれですか？",
            choices: [
                "サボテン",
                "ホウセンカ",
                "ワカメ",
                "ヒジキ"
            ],
            correctAnswerIndex: 1,
            explanation: "ホウセンカは地面に根をはって育つ植物です。"
        ),

        QuizQuestion(
            question: "次の中で、昼間に活動する生き物はどれですか？",
            choices: [
                "コウモリ",
                "スズメ",
                "フクロウ",
                "オオカミ"
            ],
            correctAnswerIndex: 1,
            explanation: "スズメは昼間に活動する鳥です。"
        ),

        QuizQuestion(
            question: "次の中で、春に芽を出す植物はどれですか？",
            choices: [
                "カエデ",
                "ヒマワリ",
                "コスモス",
                "チューリップ"
            ],
            correctAnswerIndex: 3,
            explanation: "チューリップは春に芽を出す植物です。"
        ),

        QuizQuestion(
            question: "次の中で、水辺に住む生き物はどれですか？",
            choices: [
                "カニ",
                "キツネ",
                "クマ",
                "シカ"
            ],
            correctAnswerIndex: 0,
            explanation: "カニは水辺に住む生き物です。"
        ),
        QuizQuestion(
            question: "次の中で、水の中で生活している動物はどれですか？",
            choices: [
                "イヌ",
                "ネコ",
                "イルカ",
                "ウサギ"
            ],
            correctAnswerIndex: 2,
            explanation: "イルカは水の中で生活しています。"
        ),

        QuizQuestion(
            question: "春に見られる昆虫はどれですか？",
            choices: [
                "アリ",
                "バッタ",
                "セミ",
                "ホタル"
            ],
            correctAnswerIndex: 0,
            explanation: "春にはアリがよく見られます。"
        ),

        QuizQuestion(
            question: "次の中で、空を飛ぶ生き物はどれですか？",
            choices: [
                "トカゲ",
                "カエル",
                "ハト",
                "サメ"
            ],
            correctAnswerIndex: 2,
            explanation: "ハトは空を飛ぶ生き物です。"
        ),

        QuizQuestion(
            question: "秋に実がなる木はどれですか？",
            choices: [
                "桜",
                "リンゴ",
                "バラ",
                "ヒマワリ"
            ],
            correctAnswerIndex: 1,
            explanation: "リンゴの木は秋に実がなります。"
        ),

        QuizQuestion(
            question: "次の中で、動物が冬眠するのはどの季節ですか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 3,
            explanation: "多くの動物は冬に冬眠します。"
        ),

        QuizQuestion(
            question: "次の中で、魚に分類されるものはどれですか？",
            choices: [
                "タコ",
                "エビ",
                "サメ",
                "クラゲ"
            ],
            correctAnswerIndex: 2,
            explanation: "サメは魚に分類されます。"
        ),

        QuizQuestion(
            question: "夏によく見る生き物はどれですか？",
            choices: [
                "セミ",
                "カエル",
                "カラス",
                "ハチ"
            ],
            correctAnswerIndex: 0,
            explanation: "夏にはセミがよく見られます。"
        ),

        QuizQuestion(
            question: "次の中で、太陽が見えなくなる時間帯はどれですか？",
            choices: [
                "昼",
                "夕方",
                "夜",
                "朝"
            ],
            correctAnswerIndex: 2,
            explanation: "太陽は夜には見えなくなります。"
        ),

        QuizQuestion(
            question: "次の中で、昼間に活動する生き物はどれですか？",
            choices: [
                "フクロウ",
                "ネコ",
                "スズメ",
                "コウモリ"
            ],
            correctAnswerIndex: 2,
            explanation: "スズメは昼間に活動します。"
        ),

        QuizQuestion(
            question: "次の中で、雲が見られるのはどの場所ですか？",
            choices: [
                "地面",
                "水中",
                "空",
                "地下"
            ],
            correctAnswerIndex: 2,
            explanation: "雲は空に見られます。"
        ),
        QuizQuestion(
            question: "夏に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ひまわり",
                "コスモス",
                "バラ"
            ],
            correctAnswerIndex: 1,
            explanation: "ひまわりは夏に咲く花の一つです。"
        ),

        QuizQuestion(
            question: "次の中で、鳥はどれですか？",
            choices: [
                "カメ",
                "ウサギ",
                "スズメ",
                "サメ"
            ],
            correctAnswerIndex: 2,
            explanation: "スズメは鳥の一種です。"
        ),

        QuizQuestion(
            question: "夜空に見えるものはどれですか？",
            choices: [
                "太陽",
                "星",
                "雲",
                "雷"
            ],
            correctAnswerIndex: 1,
            explanation: "夜空では星が見えます。"
        ),

        QuizQuestion(
            question: "秋に見られる葉っぱの色はどれですか？",
            choices: [
                "緑",
                "赤",
                "青",
                "黄"
            ],
            correctAnswerIndex: 3,
            explanation: "秋には葉っぱが黄色や赤に変わります。"
        ),

        QuizQuestion(
            question: "次の中で、虫はどれですか？",
            choices: [
                "トカゲ",
                "バッタ",
                "カエル",
                "ヘビ"
            ],
            correctAnswerIndex: 1,
            explanation: "バッタは虫の一種です。"
        ),

        QuizQuestion(
            question: "春に見られる生き物はどれですか？",
            choices: [
                "アリ",
                "カエル",
                "クジラ",
                "イヌ"
            ],
            correctAnswerIndex: 1,
            explanation: "春にはカエルがよく見られます。"
        ),

        QuizQuestion(
            question: "次の中で、爬虫類はどれですか？",
            choices: [
                "ウサギ",
                "カエル",
                "カメ",
                "イルカ"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは爬虫類の一種です。"
        ),

        QuizQuestion(
            question: "冬に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ひまわり",
                "シクラメン",
                "桜"
            ],
            correctAnswerIndex: 2,
            explanation: "シクラメンは冬に咲く花の一つです。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ひまわり",
                "コスモス",
                "バラ"
            ],
            correctAnswerIndex: 0,
            explanation: "チューリップは春に咲く花の一つです。"
        ),

        QuizQuestion(
            question: "次の中で、魚はどれですか？",
            choices: [
                "サメ",
                "カエル",
                "イヌ",
                "ヘビ"
            ],
            correctAnswerIndex: 0,
            explanation: "サメは魚の一種です。"
        ),

        QuizQuestion(
            question: "昼間の空に見えるものはどれですか？",
            choices: [
                "太陽",
                "月",
                "星",
                "雲"
            ],
            correctAnswerIndex: 0,
            explanation: "昼間の空では太陽が見えます。"
        ),
        QuizQuestion(
            question: "次の中で、秋に色が変わる葉っぱはどれですか？",
            choices: [
                "マツ",
                "カエデ",
                "サクラ",
                "ヒノキ"
            ],
            correctAnswerIndex: 1,
            explanation: "カエデの葉っぱは秋に赤や黄色に色が変わります。"
        ),

        QuizQuestion(
            question: "次の中で、冬に見ることができる天気はどれですか？",
            choices: [
                "雪",
                "雨",
                "晴れ",
                "風"
            ],
            correctAnswerIndex: 0,
            explanation: "冬には雪が降ることがあります。"
        ),

        QuizQuestion(
            question: "次の中で、春に咲く花はどれですか？",
            choices: [
                "ヒマワリ",
                "チューリップ",
                "バラ",
                "コスモス"
            ],
            correctAnswerIndex: 1,
            explanation: "チューリップは春に咲く花です。"
        ),
        QuizQuestion(
            question: "次の中で、昼間に見えるものはどれですか？",
            choices: [
                "星",
                "月",
                "太陽",
                "コウモリ"
            ],
            correctAnswerIndex: 2,
            explanation: "昼間には太陽が見えます。"
        ),

        QuizQuestion(
            question: "次の中で、夏に活動が活発になる生き物はどれですか？",
            choices: [
                "セミ",
                "フクロウ",
                "カエル",
                "クジラ"
            ],
            correctAnswerIndex: 0,
            explanation: "セミは夏に活動が活発になる昆虫です。"
        ),

        QuizQuestion(
            question: "次の中で、水の中で生活する植物はどれですか？",
            choices: [
                "タンポポ",
                "ヒマワリ",
                "ワカメ",
                "シダ"
            ],
            correctAnswerIndex: 2,
            explanation: "ワカメは水中で生活する植物です。"
        ),
        QuizQuestion(
            question: "次の中で、鳥に分類される生き物はどれですか？",
            choices: [
                "カエル",
                "カラス",
                "イルカ",
                "サメ"
            ],
            correctAnswerIndex: 1,
            explanation: "カラスは鳥に分類される生き物です。"
        ),

        QuizQuestion(
            question: "次の中で、冬に葉を落とさない木はどれですか？",
            choices: [
                "松",
                "カエデ",
                "サクラ",
                "イチョウ"
            ],
            correctAnswerIndex: 0,
            explanation: "松は冬でも葉を落とさない常緑樹です。"
        ),

        QuizQuestion(
            question: "次の中で、昆虫に分類される生き物はどれですか？",
            choices: [
                "トカゲ",
                "カメ",
                "バッタ",
                "カエル"
            ],
            correctAnswerIndex: 2,
            explanation: "バッタは昆虫に分類される生き物です。"
        ),
        QuizQuestion(
            question: "次の中で、春に見られる花はどれですか？",
            choices: [
                "コスモス",
                "ヒマワリ",
                "チューリップ",
                "バラ"
            ],
            correctAnswerIndex: 2,
            explanation: "チューリップは春に見られる花です。"
        ),

        QuizQuestion(
            question: "次の中で、水の中で生活している動物はどれですか？",
            choices: [
                "イヌ",
                "イルカ",
                "ウサギ",
                "クマ"
            ],
            correctAnswerIndex: 1,
            explanation: "イルカは水中で生活する動物です。"
        ),

        QuizQuestion(
            question: "次の中で、秋に実がなる木はどれですか？",
            choices: [
                "リンゴ",
                "サクラ",
                "ヒノキ",
                "モミ"
            ],
            correctAnswerIndex: 0,
            explanation: "リンゴの木は秋に実がなります。"
        ),
        QuizQuestion(
            question: "次の中で、夏に咲く花はどれですか？",
            choices: [
                "ヒマワリ",
                "チューリップ",
                "バラ",
                "コスモス"
            ],
            correctAnswerIndex: 0,
            explanation: "ヒマワリは夏に咲く花です。"
        ),

        QuizQuestion(
            question: "次の中で、夜に見える天体はどれですか？",
            choices: [
                "太陽",
                "月",
                "雲",
                "雷"
            ],
            correctAnswerIndex: 1,
            explanation: "夜には月が見えます。"
        ),

        QuizQuestion(
            question: "次の中で、昆虫に分類されるものはどれですか？",
            choices: [
                "カメ",
                "トカゲ",
                "チョウ",
                "ヘビ"
            ],
            correctAnswerIndex: 2,
            explanation: "チョウは昆虫に分類されます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika1, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika1ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika1ListView(isPresenting: .constant(false))
    }
}
