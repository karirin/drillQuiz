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
        QuizQuestion.fillInBlank(
            question: "【穴うめ】あさ、東から のぼる てんたいを ひらがなで答えましょう。",
            answer: "たいよう",
            acceptableAnswers: ["太陽"],
            explanation: "朝、東からのぼる てんたいは『たいよう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】はるの のはらで よく見る 黄色い花を ひらがなで答えましょう。",
            answer: "たんぽぽ",
            explanation: "春の野原でよく見る 黄色い花は『たんぽぽ』です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】いきものと すむ ところが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "メダカ", match: "みずの なか"),
                QuizMatchingPair(prompt: "スズメ", match: "そら"),
                QuizMatchingPair(prompt: "アリ", match: "じめん")
            ],
            choices: ["そら", "じめん", "みずの なか"],
            explanation: "メダカは みずのなか、スズメは そら、アリは じめんで くらします。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】からだの ぶぶんと はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "はね", match: "とぶ"),
                QuizMatchingPair(prompt: "ひれ", match: "およぐ"),
                QuizMatchingPair(prompt: "あし", match: "あるく")
            ],
            choices: ["およぐ", "あるく", "とぶ"],
            explanation: "はねは とぶ、ひれは およぐ、あしは あるく ときに つかいます。"
        ),

        QuizQuestion.classification(
            question: "【分類】いきものを 『そら』『みず』『りく』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "ちょう", match: "そら"),
                QuizMatchingPair(prompt: "さかな", match: "みず"),
                QuizMatchingPair(prompt: "いぬ", match: "りく")
            ],
            categories: ["そら", "みず", "りく"],
            explanation: "ちょうは そら、さかなは みず、いぬは りくの なかまです。"
        ),

        QuizQuestion.classification(
            question: "【分類】見えるものを 『ひる』『よる』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "たいよう", match: "ひる"),
                QuizMatchingPair(prompt: "つき", match: "よる"),
                QuizMatchingPair(prompt: "ほし", match: "よる")
            ],
            categories: ["ひる", "よる"],
            explanation: "たいようは ひるに、つきや ほしは よるに 見えます。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】ひまわりの そだちかたを じゅんに ならべましょう。",
            choices: ["花が さく", "たねを まく", "めが でる"],
            orderedChoices: ["たねを まく", "めが でる", "花が さく"],
            explanation: "ひまわりは、たねを まいてから めが出て、花が さきます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】しょくぶつを せの高いじゅんに ならべましょう。",
            choices: ["たんぽぽ", "ひまわり", "あさがお"],
            rankedChoices: ["ひまわり", "あさがお", "たんぽぽ"],
            explanation: "ふつうは、ひまわりが いちばん高く、そのつぎが あさがお、たんぽぽです。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】なつの よるに ひかって見える むしを ひらがなで答えましょう。",
            answer: "ほたる",
            acceptableAnswers: ["ホタル"],
            explanation: "夏の夜に 光って見える 虫は『ほたる』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】あきに 木の はが 赤や黄に かわることを ひらがなで答えましょう。",
            answer: "こうよう",
            acceptableAnswers: ["紅葉"],
            explanation: "秋に 木の葉が 赤や黄に かわることを『こうよう』といいます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】てんきと 空の ようすが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "はれ", match: "青い そら"),
                QuizMatchingPair(prompt: "くもり", match: "くもが おおい"),
                QuizMatchingPair(prompt: "あめ", match: "みずたまりが できる")
            ],
            choices: ["みずたまりが できる", "くもが おおい", "青い そら"],
            explanation: "はれは 青い空、くもりは 雲が多く、あめの日は 水たまりができます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】いきものと うごきかたが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "さかな", match: "およぐ"),
                QuizMatchingPair(prompt: "とり", match: "とぶ"),
                QuizMatchingPair(prompt: "うま", match: "はしる")
            ],
            choices: ["とぶ", "はしる", "およぐ"],
            explanation: "さかなは およぎ、とりは とび、うまは はしって うごきます。"
        ),

        QuizQuestion.classification(
            question: "【分類】ものを 『生きもの』『生きものではない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "あり", match: "生きもの"),
                QuizMatchingPair(prompt: "いし", match: "生きものではない"),
                QuizMatchingPair(prompt: "ひまわり", match: "生きもの")
            ],
            categories: ["生きもの", "生きものではない"],
            explanation: "ありと ひまわりは 生きもの、いしは 生きものではありません。"
        ),

        QuizQuestion.classification(
            question: "【分類】花を 『はる』『なつ』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "さくら", match: "はる"),
                QuizMatchingPair(prompt: "あさがお", match: "なつ"),
                QuizMatchingPair(prompt: "ひまわり", match: "なつ")
            ],
            categories: ["はる", "なつ"],
            explanation: "さくらは 春、あさがおと ひまわりは 夏に よく見られます。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】あさから よるまでの 空の ようすを じゅんに ならべましょう。",
            choices: ["つきが 見える", "たいようが のぼる", "たいようが 高く のぼる"],
            orderedChoices: ["たいようが のぼる", "たいようが 高く のぼる", "つきが 見える"],
            explanation: "朝に 太陽がのぼり、昼ごろ高くなり、夜に 月が見えます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】いきものを 体の大きいじゅんに ならべましょう。",
            choices: ["あり", "ぞう", "いぬ"],
            rankedChoices: ["ぞう", "いぬ", "あり"],
            explanation: "体の大きさをくらべると、ぞう、いぬ、ありの順です。"
        ),

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
                "シダ",
                "コケ",
                "キノコ",
                "ヒマワリ"
            ],
            correctAnswerIndex: 3,
            explanation: "ヒマワリは夏に花を咲かせる植物です。シダ・コケ・キノコは花を咲かせません。"
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
                "スギ",
                "モミ"
            ],
            correctAnswerIndex: 1,
            explanation: "カエデは冬に葉を落とす木です。マツ・スギ・モミは一年中緑の葉をつける木です。"
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
                "コンブ",
                "ホウセンカ",
                "ヒジキ"
            ],
            correctAnswerIndex: 2,
            explanation: "ホウセンカは地面に生える植物です。ワカメ・コンブ・ヒジキは海に生える海そうです。"
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
                "コンブ",
                "ホウセンカ",
                "ワカメ",
                "ヒジキ"
            ],
            correctAnswerIndex: 1,
            explanation: "ホウセンカは地面に根をはって育つ植物です。コンブ・ワカメ・ヒジキは海に生える海そうです。"
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
                "スギ",
                "ヒノキ"
            ],
            correctAnswerIndex: 1,
            explanation: "カエデの葉っぱは秋に赤や黄色に色が変わります。マツ・スギ・ヒノキは一年中緑の葉をつける木です。"
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

        QuizQuestion(
                question: "秋に 落ちた はを、かわいた ばしょに 数日 おくと、どうなりやすいですか？",
                choices: [
                    "ぱりぱりして、おれやすくなる",
                    "水を ふくんで、おもくなる",
                    "みどり色に もどる",
                    "土の 中へ もぐる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『ぱりぱりして、おれやすくなる』です。落ちた はは、かわくと 水分が へって、ぱりぱりした かんじに なります。"
            ),

            QuizQuestion(
                question: "ミツバチの うしろあしに ついている、黄色い だんごのような ものは 何ですか？",
                choices: [
                    "小さな 石",
                    "花から 集めた かふん",
                    "木の かわ",
                    "かわいた 土"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『花から 集めた かふん』です。ミツバチは、花で 集めた かふんを うしろあしに つけて はこびます。"
            ),

            QuizQuestion(
                question: "ハスの はに 水を たらすと、どうなりやすいですか？",
                choices: [
                    "はが すぐに とける",
                    "水が ぜんぶ はに しみこむ",
                    "水が まるい つぶに なって ころがる",
                    "はの 色が 赤く なる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『水が まるい つぶに なって ころがる』です。ハスの はの 表面は 水を はじきやすく、水が つぶに なります。"
            ),

            QuizQuestion(
                question: "つめたい 水を 入れた コップの 外がわに、水の つぶが つきました。この 水は どこから きたものですか？",
                choices: [
                    "コップの ガラスが とけた",
                    "つくえの 中から 出てきた",
                    "コップの 水が ガラスを 通りぬけた",
                    "空気の 中の 水分が つぶに なった"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『空気の 中の 水分が つぶに なった』です。空気の 中の 水分が つめたい コップで ひやされ、水の つぶに なります。"
            ),

            QuizQuestion(
                question: "2つの 花の 色を くらべる とき、どのように 見ると よいですか？",
                choices: [
                    "おなじ 明るさの ばしょで 見る",
                    "一つだけ くらい はこの 中で 見る",
                    "一つだけ 水で ぬらして 見る",
                    "べつべつの 日に 見て そうぞうする"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『おなじ 明るさの ばしょで 見る』です。明るさを そろえると、花の 色を くらべやすくなります。"
            ),

            QuizQuestion(
                question: "おなじ へやに おいてあった 金ぞくの スプーンと 木の はしを さわると、つめたく かんじやすいのは どちらですか？",
                choices: [
                    "木の はし",
                    "金ぞくの スプーン",
                    "どちらも かならず あつい",
                    "どちらも さわれない"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『金ぞくの スプーン』です。金ぞくは 手の あたたかさを はやく うばうため、木より つめたく かんじやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】春、遠くの 山や けしきが 白っぽく ぼんやり 見えることを答えましょう。",
                answer: "かすみ",
                acceptableAnswers: ["霞"],
                explanation: "春に 遠くの けしきが ぼんやり 見えることを『かすみ』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】カイコが 糸を 出して つくる、白い つつみのような ものを答えましょう。",
                answer: "まゆ",
                acceptableAnswers: ["繭"],
                explanation: "カイコが 糸を 出して つくる つつみのような ものは『まゆ』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】はの 表面に 見える、すじのような ぶぶんを答えましょう。",
                answer: "ようみゃく",
                acceptableAnswers: ["葉脈"],
                explanation: "はの 表面に 見える すじのような ぶぶんを『ようみゃく』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】雨と 雪が まじって 空から ふるものを答えましょう。",
                answer: "みぞれ",
                acceptableAnswers: ["霙"],
                explanation: "雨と 雪が まじって ふるものを『みぞれ』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】生きものや しぜんを よく 見て、気づいたことを しらべることを答えましょう。",
                answer: "かんさつ",
                acceptableAnswers: ["観察"],
                explanation: "生きものや しぜんを よく 見て しらべることを『かんさつ』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】おなじ ばしょで 正午ごろに 見る かげと、きせつの ようすを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "冬より かげが みじかくなっていく"),
                    QuizMatchingPair(prompt: "夏", match: "かげが いちばん みじかい ころ"),
                    QuizMatchingPair(prompt: "秋", match: "夏より かげが 長くなっていく"),
                    QuizMatchingPair(prompt: "冬", match: "かげが いちばん 長い ころ")
                ],
                choices: [
                    "かげが いちばん 長い ころ",
                    "夏より かげが 長くなっていく",
                    "冬より かげが みじかくなっていく",
                    "かげが いちばん みじかい ころ"
                ],
                explanation: "おなじ ばしょで 正午ごろに くらべると、春は 冬より かげが みじかくなり、夏ごろに いちばん みじかくなります。秋は 長くなっていき、冬ごろに いちばん 長くなります。"
            ),

            QuizQuestion(
                question: "リスが 木の えだを 走る とき、長い しっぽは 何に 役立ちますか？",
                choices: [
                    "水の 中で いきを する",
                    "木の 実を かみくだく",
                    "からだの バランスを とる",
                    "土を 深く ほる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『からだの バランスを とる』です。リスは 長い しっぽを つかって、えだの 上で バランスを とります。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】しょくぶつと、その とくちょうを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "エンドウ", match: "まきひげで しちゅうに つかまる"),
                    QuizMatchingPair(prompt: "バラ", match: "くきに とげが ある"),
                    QuizMatchingPair(prompt: "オシロイバナ", match: "夕方ごろに 花が ひらく"),
                    QuizMatchingPair(prompt: "ホウセンカ", match: "じゅくした 実が はじけて たねが とぶ")
                ],
                choices: [
                    "じゅくした 実が はじけて たねが とぶ",
                    "くきに とげが ある",
                    "まきひげで しちゅうに つかまる",
                    "夕方ごろに 花が ひらく"
                ],
                explanation: "エンドウは まきひげで つかまり、バラには とげが あります。オシロイバナは 夕方ごろに 花が ひらき、ホウセンカの 実は じゅくすると はじけます。"
            ),

            QuizQuestion(
                question: "風が 北から 南へ ふいています。ふきながしの 細長い 先は、どちらへ のびますか？",
                choices: [
                    "北",
                    "東",
                    "西",
                    "南"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『南』です。北から ふく 風に おされて、ふきながしの 先は 南へ のびます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】かんさつする ものと、安全な 見方を 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "池の 生きもの", match: "おとなと いっしょに、ふちから はなれて 見る"),
                    QuizMatchingPair(prompt: "道ばたの 花", match: "歩道から 見て、車道へ 出ない"),
                    QuizMatchingPair(prompt: "高い 木の 鳥の す", match: "そうがんきょうで 遠くから 見る"),
                    QuizMatchingPair(prompt: "名前の 分からない けむし", match: "手で さわらず、目で 見る")
                ],
                choices: [
                    "手で さわらず、目で 見る",
                    "そうがんきょうで 遠くから 見る",
                    "おとなと いっしょに、ふちから はなれて 見る",
                    "歩道から 見て、車道へ 出ない"
                ],
                explanation: "池では おとなと いっしょに 安全な ばしょから見ます。道ばたでは 車道へ出ず、鳥のすは 遠くから見て、分からない けむしには さわりません。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】みぢかな しくみと、その はたらきを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ドアの ちょうつがい", match: "ドアを 回すように 開けしめする"),
                    QuizMatchingPair(prompt: "台車の 車りん", match: "ころがって うごきやすくする"),
                    QuizMatchingPair(prompt: "ばね", match: "おしたり のばしたりした あとに もどる"),
                    QuizMatchingPair(prompt: "きゅうばん", match: "なめらかな 面に くっつく")
                ],
                choices: [
                    "なめらかな 面に くっつく",
                    "おしたり のばしたりした あとに もどる",
                    "ドアを 回すように 開けしめする",
                    "ころがって うごきやすくする"
                ],
                explanation: "ちょうつがいは ドアを回して開けしめし、車りんは ころがります。ばねは 形がもどり、きゅうばんは なめらかな面に くっつきます。"
            ),

            QuizQuestion.classification(
                question: "【分類】しぜんの ようすを 『春から 夏へ 近づくころ』『秋から 冬へ 近づくころ』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "日なたの 雪が 小さくなる", match: "春から 夏へ 近づくころ"),
                    QuizMatchingPair(prompt: "木の めから 新しい はが 開く", match: "春から 夏へ 近づくころ"),
                    QuizMatchingPair(prompt: "朝、草に しもが つく", match: "秋から 冬へ 近づくころ"),
                    QuizMatchingPair(prompt: "池の 水が こおりはじめる", match: "秋から 冬へ 近づくころ")
                ],
                categories: ["春から 夏へ 近づくころ", "秋から 冬へ 近づくころ"],
                explanation: "あたたかくなるころには 雪が小さくなり、新しいはが開きます。さむくなるころには しもがつき、池の水がこおりはじめます。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを 『水の 中に たまごを うむ』『りくに たまごを うむ』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "メダカ", match: "水の 中に たまごを うむ"),
                    QuizMatchingPair(prompt: "カエル", match: "水の 中に たまごを うむ"),
                    QuizMatchingPair(prompt: "スズメ", match: "りくに たまごを うむ"),
                    QuizMatchingPair(prompt: "カメ", match: "りくに たまごを うむ")
                ],
                categories: ["水の 中に たまごを うむ", "りくに たまごを うむ"],
                explanation: "メダカと カエルは 水の中に たまごをうみます。スズメは すに、カメは りくの土などに たまごをうみます。"
            ),

            QuizQuestion(
                question: "かわいた マメの たねを 水に つけると、どうなりやすいですか？",
                choices: [
                    "水を すって ふくらむ",
                    "すぐに 石に なる",
                    "からだが とうめいに なる",
                    "水の 中で もえる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『水を すって ふくらむ』です。かわいた マメの たねは、水を すうと ふくらみます。"
            ),

            QuizQuestion.classification(
                question: "【分類】天気に かんけいする ものを 『水の つぶ』『こおりの つぶや けっしょう』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "雨", match: "水の つぶ"),
                    QuizMatchingPair(prompt: "つゆ", match: "水の つぶ"),
                    QuizMatchingPair(prompt: "雪", match: "こおりの つぶや けっしょう"),
                    QuizMatchingPair(prompt: "しも", match: "こおりの つぶや けっしょう")
                ],
                categories: ["水の つぶ", "こおりの つぶや けっしょう"],
                explanation: "雨と つゆは 水のつぶです。雪と しもは、水が こおってできた つぶや けっしょうです。"
            ),

            QuizQuestion(
                question: "まがった はの ふちの 長さを はかる とき、どの しかたが よいですか？",
                choices: [
                    "はを ちぎって まっすぐに のばす",
                    "糸を ふちに そわせ、その 糸を ものさしで はかる",
                    "はの 色を 数える",
                    "手で もって おもさだけを くらべる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『糸を ふちに そわせ、その 糸を ものさしで はかる』です。まがった ところには 糸を そわせると、長さを はかりやすくなります。"
            ),

            QuizQuestion.classification(
                question: "【分類】みぢかな ものを 『しぜんの 中で 見つかるもの』『人が つくったもの』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "木の えだ", match: "しぜんの 中で 見つかるもの"),
                    QuizMatchingPair(prompt: "貝がら", match: "しぜんの 中で 見つかるもの"),
                    QuizMatchingPair(prompt: "プラスチックの ものさし", match: "人が つくったもの"),
                    QuizMatchingPair(prompt: "アルミかん", match: "人が つくったもの")
                ],
                categories: ["しぜんの 中で 見つかるもの", "人が つくったもの"],
                explanation: "木のえだと 貝がらは しぜんの中で見つかります。プラスチックのものさしと アルミかんは 人がつくったものです。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】かんさつした ねの 長さを、長い じゅんに ならべましょう。",
                choices: [
                    "Aの ね（6cm）",
                    "Bの ね（11cm）",
                    "Cの ね（4cm）",
                    "Dの ね（8cm）"
                ],
                rankedChoices: [
                    "Bの ね（11cm）",
                    "Dの ね（8cm）",
                    "Aの ね（6cm）",
                    "Cの ね（4cm）"
                ],
                explanation: "ねの 長さは、Bの11cm、Dの8cm、Aの6cm、Cの4cmの じゅんです。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】おなじ じこくに はかった ばしょの 気おんを、高い じゅんに ならべましょう。",
                choices: [
                    "花だん（24℃）",
                    "木かげ（21℃）",
                    "すなば（27℃）",
                    "ろうか（23℃）"
                ],
                rankedChoices: [
                    "すなば（27℃）",
                    "花だん（24℃）",
                    "ろうか（23℃）",
                    "木かげ（21℃）"
                ],
                explanation: "気おんは、すなば27℃、花だん24℃、ろうか23℃、木かげ21℃の じゅんです。"
            ),

            QuizQuestion(
                question: "冬の 外で はいた 息が 白く 見えるのは なぜですか？",
                choices: [
                    "口から けむりが 出るから",
                    "空気が 白い 紙に かわるから",
                    "息の 中の 水分が ひえて、小さな 水の つぶに なるから",
                    "歯の 色が 空に うつるから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『息の 中の 水分が ひえて、小さな 水の つぶに なるから』です。さむい 空気で 息の 水分が ひやされると、白く 見える 小さな 水のつぶに なります。"
            ),

            QuizQuestion(
                question: "カマキリが 小さな むしを つかまえる ときに つかう からだの ぶぶんは どれですか？",
                choices: [
                    "うしろの はね",
                    "長い おなか",
                    "頭の しょっかく",
                    "かまのような まえあし"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『かまのような まえあし』です。カマキリは、かまのような まえあしで えものを つかまえます。"
            ),

            QuizQuestion(
                question: "おなじ 大きさの 雪を、黒い ぬのと 白い ぬのの 上に おいて 日に 当てました。はやく とけやすいのは どちらですか？",
                choices: [
                    "黒い ぬのの 上の 雪",
                    "白い ぬのの 上の 雪",
                    "どちらも ぜったいに とけない",
                    "ぬのの 色では なく、名前で きまる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『黒い ぬのの 上の 雪』です。黒い ものは たいようの 光で あたたまりやすいため、上の 雪が はやく とけやすくなります。"
            ),

            QuizQuestion(
                question: "かいちゅうでんとうと 白い かべの あいだに おもちゃを おきます。おもちゃを かいちゅうでんとうへ 近づけると、かべの かげは どうなりますか？",
                choices: [
                    "小さくなる",
                    "大きくなる",
                    "かならず 青くなる",
                    "かげが 光りはじめる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『大きくなる』です。おもちゃを 光に 近づけると、かべに うつる かげは 大きくなります。"
            ),

            QuizQuestion(
                question: "のばした ゴムひもを はじくと 音が 出ました。ゴムひもを 指で おさえると 音が 止まりやすいのは なぜですか？",
                choices: [
                    "ゴムひもの 色が かわるから",
                    "空気が なくなるから",
                    "ゴムひもの ふるえが 止まるから",
                    "ゴムひもが 金ぞくに なるから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『ゴムひもの ふるえが 止まるから』です。音は ゴムひもの ふるえで 出るため、ふるえを 止めると 音も 止まりやすくなります。"
            ),

        QuizQuestion(
                question: "雪の 上では、土の 上より どうぶつの 足あとが 見つけやすいのは なぜですか？",
                choices: [
                    "白い 雪に へこみが のこるから",
                    "雪が 大きな 音を 出すから",
                    "足あとが 光りはじめるから",
                    "どうぶつの 足が 長くなるから"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『白い 雪に へこみが のこるから』です。雪の 上を どうぶつが 歩くと、足の 形をした へこみが のこります。"
            ),

            QuizQuestion(
                question: "秋の 朝、クモの すが 白く 目立つことが あります。いちばん よい わけは どれですか？",
                choices: [
                    "クモの すに 白い すなが つくから",
                    "クモの すに つゆの つぶが つくから",
                    "クモの すが 雪に かわるから",
                    "クモが 白い 糸だけを 出すから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『クモの すに つゆの つぶが つくから』です。秋の ひんやりした 朝には、クモの すに 小さな つゆの つぶが つくことがあります。"
            ),

            QuizQuestion(
                question: "冬、はを 落とした 木では、夏より 何が 見えやすくなりますか？",
                choices: [
                    "土の 中の ね",
                    "花の におい",
                    "えだの 分かれ方",
                    "池の 魚の うごき"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『えだの 分かれ方』です。はが 落ちると、かくれていた えだの 形や 分かれ方が 見えやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】風に のって、さくらの 花びらが たくさん まう ようすを答えましょう。",
                answer: "さくらふぶき",
                acceptableAnswers: ["桜吹雪"],
                explanation: "さくらの 花びらが たくさん まう ようすを『さくらふぶき』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】きせつの しぜんと、それを つかった あそびを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春の シロツメクサ", match: "花の かんむりを つくる"),
                    QuizMatchingPair(prompt: "夏の ササの は", match: "ささぶねを つくる"),
                    QuizMatchingPair(prompt: "秋の どんぐり", match: "こまを つくる"),
                    QuizMatchingPair(prompt: "冬の 雪", match: "雪だるまを つくる")
                ],
                choices: [
                    "雪だるまを つくる",
                    "こまを つくる",
                    "花の かんむりを つくる",
                    "ささぶねを つくる"
                ],
                explanation: "春は シロツメクサで 花のかんむり、夏は ササのはで ささぶね、秋は どんぐりで こま、冬は 雪で 雪だるまを つくれます。"
            ),

            QuizQuestion(
                question: "ちょうの はねは、左右を 合わせて 何まい ありますか？",
                choices: [
                    "2まい",
                    "3まい",
                    "6まい",
                    "4まい"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『4まい』です。ちょうには、左右に 2まいずつ、合わせて 4まいの はねが あります。"
            ),

            QuizQuestion(
                question: "ハムスターの ほおぶくろは、何を するのに 役立ちますか？",
                choices: [
                    "食べものを はこぶ",
                    "小さな 音を 聞く",
                    "水の 中を およぐ",
                    "空を とぶ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『食べものを はこぶ』です。ハムスターは、ほおぶくろに 食べものを 入れて はこびます。"
            ),

            QuizQuestion(
                question: "おたまじゃくしが カエルに 近づくと、しっぽは どうなりますか？",
                choices: [
                    "だんだん 長くなる",
                    "だんだん みじかくなる",
                    "かたい からに なる",
                    "はねに かわる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『だんだん みじかくなる』です。おたまじゃくしが カエルの すがたに 近づくと、しっぽは だんだん みじかくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】いもむしが ちょうに なる まえに、あまり うごかず すがたを かえる じきを答えましょう。",
                answer: "さなぎ",
                acceptableAnswers: ["蛹"],
                explanation: "いもむしが ちょうに なる まえの すがたを『さなぎ』といいます。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを 『はねが ある』『はねが ない』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "テントウムシ", match: "はねが ある"),
                    QuizMatchingPair(prompt: "トンボ", match: "はねが ある"),
                    QuizMatchingPair(prompt: "ミミズ", match: "はねが ない"),
                    QuizMatchingPair(prompt: "カタツムリ", match: "はねが ない")
                ],
                categories: ["はねが ある", "はねが ない"],
                explanation: "テントウムシと トンボには はねがあり、ミミズと カタツムリには はねがありません。"
            ),

            QuizQuestion(
                question: "エンドウの たねは、どこに 入っていますか？",
                choices: [
                    "ねの 先",
                    "花びらの 表",
                    "さやの 中",
                    "土の 外"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『さやの 中』です。エンドウの たねは、花の あとに できる さやの 中に 入っています。"
            ),

            QuizQuestion(
                question: "ラッカセイの 実は、おもに どこで そだちますか？",
                choices: [
                    "木の えだの 上",
                    "花の まんなか",
                    "水の 表面",
                    "土の 中"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『土の 中』です。ラッカセイの 実は、花が さいた あとに 土の 中で そだちます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】花の 外がわに ついている、色の ついた うすい ぶぶんを答えましょう。",
                answer: "はなびら",
                acceptableAnswers: ["花びら", "花弁"],
                explanation: "花の 外がわに ついている、色の ついた うすい ぶぶんは『はなびら』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】しょくぶつと、たねが できる ばしょを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ヒマワリ", match: "花の まんなかに ならぶ"),
                    QuizMatchingPair(prompt: "エンドウ", match: "さやの 中に 入る"),
                    QuizMatchingPair(prompt: "トウモロコシ", match: "太い じくの まわりに ならぶ"),
                    QuizMatchingPair(prompt: "ホウセンカ", match: "花の あとの 実に 入る")
                ],
                choices: [
                    "花の あとの 実に 入る",
                    "太い じくの まわりに ならぶ",
                    "花の まんなかに ならぶ",
                    "さやの 中に 入る"
                ],
                explanation: "ヒマワリのたねは 花のまんなか、エンドウは さやの中、トウモロコシは 太いじくのまわり、ホウセンカは 花のあとの実に できます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】1しゅうかんで ふえた はの 数を、多い じゅんに ならべましょう。",
                choices: [
                    "Aの はち（3まい）",
                    "Bの はち（6まい）",
                    "Cの はち（2まい）",
                    "Dの はち（5まい）"
                ],
                rankedChoices: [
                    "Bの はち（6まい）",
                    "Dの はち（5まい）",
                    "Aの はち（3まい）",
                    "Cの はち（2まい）"
                ],
                explanation: "ふえた はの数は、Bの6まい、Dの5まい、Aの3まい、Cの2まいの じゅんです。"
            ),

            QuizQuestion(
                question: "シャボン玉を 外で とばすと、風の むきを どのように たしかめられますか？",
                choices: [
                    "シャボン玉が どちらへ ながれるかを 見る",
                    "シャボン玉の 色だけを 見る",
                    "ふく前の 大きさだけを はかる",
                    "とばした 人の 名前を 書く"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『シャボン玉が どちらへ ながれるかを 見る』です。シャボン玉は 風に ながされるので、うごく むきが 風の 手がかりになります。"
            ),

            QuizQuestion(
                question: "いくつかの 入れものを つかって 雨の りょうを くらべます。そろえると よいことは どれですか？",
                choices: [
                    "入れものの 色",
                    "雨が 入る 口の 広さ",
                    "入れものに 書く 名前",
                    "入れものを つくった 会社"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『雨が 入る 口の 広さ』です。口の 広さを そろえると、たまった 雨の りょうを くらべやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】テレビや アプリなどで、これからの 天気を 知らせるものを答えましょう。",
                answer: "てんきよほう",
                acceptableAnswers: ["天気予報"],
                explanation: "これからの 天気を 知らせるものは『てんきよほう』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】ものを 『雨水を 通しにくい』『雨水を 通しやすい』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ビニールシート", match: "雨水を 通しにくい"),
                    QuizMatchingPair(prompt: "ガラスの いた", match: "雨水を 通しにくい"),
                    QuizMatchingPair(prompt: "あみ", match: "雨水を 通しやすい"),
                    QuizMatchingPair(prompt: "ティッシュペーパー", match: "雨水を 通しやすい")
                ],
                categories: ["雨水を 通しにくい", "雨水を 通しやすい"],
                explanation: "ビニールシートと ガラスのいたは 雨水を通しにくく、あみと ティッシュペーパーは 雨水を通しやすい ものです。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】おなじ かざぐるまが 10びょうで 回った 数から、風が 強い じゅんに ならべましょう。",
                choices: [
                    "Aの とき（8回）",
                    "Bの とき（18回）",
                    "Cの とき（5回）",
                    "Dの とき（13回）"
                ],
                rankedChoices: [
                    "Bの とき（18回）",
                    "Dの とき（13回）",
                    "Aの とき（8回）",
                    "Cの とき（5回）"
                ],
                explanation: "おなじ かざぐるまなら、回る数が多いほど 風が強いと考えられます。B、D、A、Cの じゅんです。"
            ),

            QuizQuestion(
                question: "花の においを かんさつするとき、いちばん 安全な しかたは どれですか？",
                choices: [
                    "はなを 花に つけて、強く すいこむ",
                    "花びらを 口に 入れて たしかめる",
                    "少し はなして、手で 空気を はなの ほうへ あおぐ",
                    "花を さわった 手で 目を こする"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『少し はなして、手で 空気を はなの ほうへ あおぐ』です。花に 顔を 近づけすぎず、においを 少しずつ たしかめます。"
            ),

            QuizQuestion(
                question: "2つの 公園で 鳥の 数を くらべる とき、そろえると よいことは どれですか？",
                choices: [
                    "一方だけ 朝に 見る",
                    "一方だけ 何度も 数える",
                    "見つけた 鳥を 大声で よぶ",
                    "おなじ 長さの 時間だけ かんさつする"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『おなじ 長さの 時間だけ かんさつする』です。かんさつする 時間を そろえると、鳥の 数を くらべやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】どうぶつが 歩いた あとに、土や 雪の 上に のこる 形を答えましょう。",
                answer: "あしあと",
                acceptableAnswers: ["足あと", "足跡"],
                explanation: "どうぶつが 歩いた あとに のこる 形を『あしあと』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】かんさつの どうぐと、使い方を 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "とうめいな ケース", match: "小さな 生きものを 横から 見る"),
                    QuizMatchingPair(prompt: "方眼紙", match: "はの 形と 大きさを くらべる"),
                    QuizMatchingPair(prompt: "タイマー", match: "かんさつする 時間を そろえる"),
                    QuizMatchingPair(prompt: "白い トレー", match: "小さな 落ちた ものを 見つけやすくする")
                ],
                choices: [
                    "かんさつする 時間を そろえる",
                    "小さな 落ちた ものを 見つけやすくする",
                    "小さな 生きものを 横から 見る",
                    "はの 形と 大きさを くらべる"
                ],
                explanation: "とうめいなケースは 小さな生きもの、方眼紙は はの形と大きさ、タイマーは 時間、白いトレーは 小さな落ちたものの かんさつに 役立ちます。"
            ),

            QuizQuestion.classification(
                question: "【分類】しぜんかんさつで することを 『出かける まえ』『かんさつの あと』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "天気と ふくそうを たしかめる", match: "出かける まえ"),
                    QuizMatchingPair(prompt: "かんさつする ばしょを おとなと たしかめる", match: "出かける まえ"),
                    QuizMatchingPair(prompt: "手を きれいに あらう", match: "かんさつの あと"),
                    QuizMatchingPair(prompt: "かいた きろくを せいりする", match: "かんさつの あと")
                ],
                categories: ["出かける まえ", "かんさつの あと"],
                explanation: "出かけるまえに 天気や場所をたしかめ、かんさつのあとに 手をあらって きろくをせいりします。"
            ),

            QuizQuestion(
                question: "水を 入れた うつわに 入れると、しずみやすい ものは どれですか？",
                choices: [
                    "鉄の くぎ",
                    "コルク",
                    "はっぽうスチロールの 玉",
                    "からの プラスチックの ふた"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『鉄の くぎ』です。鉄の くぎは、水に 入れると しずみやすい ものです。"
            ),

            QuizQuestion(
                question: "糸でんわで 声を 聞きやすくするには、糸を どうすると よいですか？",
                choices: [
                    "ゆるませて ゆかに おく",
                    "ぴんと はる",
                    "まんなかで 切る",
                    "手で 強く にぎる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『ぴんと はる』です。糸を ぴんと はると、声の ふるえが 糸を つたわりやすくなります。"
            ),

            QuizQuestion(
                question: "水の 入った ペットボトルを 横にしても、水が こぼれにくいのは どの 状たいですか？",
                choices: [
                    "ふたを はずしてある",
                    "ボトルに あなが あいている",
                    "ふたを しっかり しめてある",
                    "ボトルを 強く おしている"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『ふたを しっかり しめてある』です。ふたを しっかり しめると、口から 水が こぼれにくくなります。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】みぢかな ものと、手で さわった ときの かんじを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "たわし", match: "ちくちく"),
                    QuizMatchingPair(prompt: "フェルト", match: "ふわふわ"),
                    QuizMatchingPair(prompt: "ガラスの コップ", match: "つるつる"),
                    QuizMatchingPair(prompt: "プチプチシート", match: "でこぼこ")
                ],
                choices: ["つるつる", "でこぼこ", "ちくちく", "ふわふわ"],
                explanation: "たわしは ちくちく、フェルトは ふわふわ、ガラスのコップは つるつる、プチプチシートは でこぼこした かんじです。"
            ),

            QuizQuestion.classification(
                question: "【分類】みぢかな ものを 『電気を つかう』『電気を つかわない』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "せんぷうき", match: "電気を つかう"),
                    QuizMatchingPair(prompt: "電気スタンド", match: "電気を つかう"),
                    QuizMatchingPair(prompt: "ほうき", match: "電気を つかわない"),
                    QuizMatchingPair(prompt: "じょうろ", match: "電気を つかわない")
                ],
                categories: ["電気を つかう", "電気を つかわない"],
                explanation: "せんぷうきと 電気スタンドは 電気をつかい、ほうきと じょうろは 電気をつかわずに つかえます。"
            ),

        QuizQuestion(
                question: "春に なって あたたかくなると、冬より 生きものを 見つけやすくなるのは なぜですか？",
                choices: [
                    "生きものが うごきはじめるから",
                    "昼の 時間が なくなるから",
                    "土が かたく こおるから",
                    "たいようが 見えなくなるから"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『生きものが うごきはじめるから』です。春に なって あたたかくなると、むしなどの 生きものが うごきはじめます。"
            ),

            QuizQuestion(
                question: "夏の 木かげが、日なたより すずしく かんじやすいのは なぜですか？",
                choices: [
                    "じめんが こおっているから",
                    "木の はが 日ざしを さえぎるから",
                    "空が なくなるから",
                    "木が 水を まくから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『木の はが 日ざしを さえぎるから』です。木の はが たいようの 光を さえぎるため、木かげは すずしく かんじやすくなります。"
            ),

            QuizQuestion(
                question: "冬の 朝、水の 入った バケツに こおりが できました。こおりが できやすい ところは どこですか？",
                choices: [
                    "バケツの 下の ゆか",
                    "水の 中の いちばん 下",
                    "水の 表面",
                    "バケツの とってだけ"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『水の 表面』です。さむい 朝には、バケツの 水の 表面に こおりが できることがあります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】春に なって、つもった 雪が とけはじめることを答えましょう。",
                answer: "ゆきどけ",
                acceptableAnswers: ["雪どけ", "雪解け"],
                explanation: "つもった 雪が とけはじめることを『ゆきどけ』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】きせつと、学校の まわりで 見つけやすい ようすを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "木の えだに わかばが 広がる"),
                    QuizMatchingPair(prompt: "夏", match: "日ざしで ゆうぐが あつくなる"),
                    QuizMatchingPair(prompt: "秋", match: "草の たねが ふくに つく"),
                    QuizMatchingPair(prompt: "冬", match: "花だんの 土が こおる")
                ],
                choices: [
                    "草の たねが ふくに つく",
                    "花だんの 土が こおる",
                    "木の えだに わかばが 広がる",
                    "日ざしで ゆうぐが あつくなる"
                ],
                explanation: "春は わかば、夏は あつくなった ゆうぐ、秋は ふくにつく 草のたね、冬は こおった 土が きせつの 手がかりになります。"
            ),

            QuizQuestion(
                question: "カモの はねには、水の 中へ 入った ときに どのような とくちょうが ありますか？",
                choices: [
                    "土を たくさん すう",
                    "くらい ところで 光る",
                    "水の 中で とける",
                    "水を はじきやすい"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『水を はじきやすい』です。カモの はねは 水を はじきやすく、からだが ぬれにくくなっています。"
            ),

            QuizQuestion(
                question: "リスの まえ歯は、どのような ことに 役立ちますか？",
                choices: [
                    "かたい 木の 実を かじる",
                    "水の 中で いきをする",
                    "空を 高く とぶ",
                    "花の みつを すう"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『かたい 木の 実を かじる』です。リスは じょうぶな まえ歯で、かたい 木の実などを かじります。"
            ),

            QuizQuestion(
                question: "カタツムリが じめんを はう とき、からだの どの ぶぶんを うごかしますか？",
                choices: [
                    "せなかの から",
                    "おなかがわの 広い あし",
                    "頭の しょっかく",
                    "空を とぶ はね"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『おなかがわの 広い あし』です。カタツムリは、おなかがわに ある 広い あしを うごかして はいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】へびや セミなどが、せいちょうするときに ぬいで のこす 古い かわを答えましょう。",
                answer: "ぬけがら",
                acceptableAnswers: ["抜け殻", "抜殻"],
                explanation: "へびや セミなどが ぬいで のこす 古い かわを『ぬけがら』といいます。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを、からだを おおう ものが 『うろこ』『毛』の どちらかに 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "きんぎょ", match: "うろこ"),
                    QuizMatchingPair(prompt: "へび", match: "うろこ"),
                    QuizMatchingPair(prompt: "うさぎ", match: "毛"),
                    QuizMatchingPair(prompt: "ねこ", match: "毛")
                ],
                categories: ["うろこ", "毛"],
                explanation: "きんぎょと へびの からだは うろこで おおわれ、うさぎと ねこの からだは 毛で おおわれています。"
            ),

            QuizQuestion(
                question: "チューリップの きゅうこんを うえる とき、とがった ほうは どちらへ むけますか？",
                choices: [
                    "横へ むける",
                    "下へ むける",
                    "上へ むける",
                    "土の 外へ 出したままにする"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『上へ むける』です。チューリップの きゅうこんは、とがった ほうを 上へ むけて うえます。"
            ),

            QuizQuestion(
                question: "たねから さいしょに 出て、土の 中へ のびていく ぶぶんは どれですか？",
                choices: [
                    "花",
                    "実",
                    "は",
                    "ね"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『ね』です。たねから さいしょに 出た ねは、土の 中へ のびていきます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】春から 夏にかけて 出てくる、みずみずしい 新しい はを答えましょう。",
                answer: "わかば",
                acceptableAnswers: ["若葉"],
                explanation: "みずみずしい 新しい はを『わかば』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】しょくぶつと、よく そだっている ばしょを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ハス", match: "池の 水の 中"),
                    QuizMatchingPair(prompt: "コケ", match: "しめった 日かげ"),
                    QuizMatchingPair(prompt: "サボテン", match: "雨の 少ない かわいた ところ"),
                    QuizMatchingPair(prompt: "クローバー", match: "日あたりの よい 草地")
                ],
                choices: [
                    "日あたりの よい 草地",
                    "雨の 少ない かわいた ところ",
                    "池の 水の 中",
                    "しめった 日かげ"
                ],
                explanation: "ハスは池の水の中、コケはしめった日かげ、サボテンはかわいたところ、クローバーは日あたりのよい草地で よくそだちます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】たねを まいてから めが 出るまでの 日数を、みじかい じゅんに ならべましょう。",
                choices: [
                    "Aの はち（5日）",
                    "Bの はち（2日）",
                    "Cの はち（7日）",
                    "Dの はち（3日）"
                ],
                rankedChoices: [
                    "Bの はち（2日）",
                    "Dの はち（3日）",
                    "Aの はち（5日）",
                    "Cの はち（7日）"
                ],
                explanation: "めが出るまでの日数は、Bの2日、Dの3日、Aの5日、Cの7日の じゅんです。"
            ),

            QuizQuestion(
                question: "雨が ふっている とき、水たまりに 丸い なみが 広がるのは なぜですか？",
                choices: [
                    "雨つぶが 水たまりに 当たるから",
                    "水たまりの 下から 風が 出るから",
                    "じめんが ゆれているから",
                    "水が こおりはじめるから"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『雨つぶが 水たまりに 当たるから』です。雨つぶが 水面に 当たると、その まわりへ 丸い なみが 広がります。"
            ),

            QuizQuestion(
                question: "ぬれた せんたくものが、風の ある日に かわきやすいのは なぜですか？",
                choices: [
                    "ぬのが こおりに かわるから",
                    "風が ぬのの 水を 空気の 中へ はこぶから",
                    "風が ぬのを おもくするから",
                    "水が ぬのの 中で ふえるから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『風が ぬのの 水を 空気の 中へ はこぶから』です。風が あると、せんたくものの 水が かわきやすくなります。"
            ),

            QuizQuestion(
                question: "外で くらい くもが 近づき、つめたい 風が ふいてきました。どうすると よいですか？",
                choices: [
                    "高い 木の 下で あそびつづける",
                    "金ぞくの ぼうを もって 走る",
                    "雨が ふる前に たてものの 中へ 入る",
                    "川の そばへ 見に 行く"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『雨が ふる前に たてものの 中へ 入る』です。くらい くもや つめたい風は、天気が きゅうに かわる 手がかりになることがあります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】ひこうきが とんだ あとの 空に、白い すじのように 見える くもを答えましょう。",
                answer: "ひこうきぐも",
                acceptableAnswers: ["飛行機雲"],
                explanation: "ひこうきが とんだ あとの 空に 白いすじのように見える くもを『ひこうきぐも』といいます。"
            ),

            QuizQuestion.classification(
                question: "【分類】天気に かんけいする ものを 『空から ふるもの』『じめんで できるもの』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "雨", match: "空から ふるもの"),
                    QuizMatchingPair(prompt: "雪", match: "空から ふるもの"),
                    QuizMatchingPair(prompt: "水たまり", match: "じめんで できるもの"),
                    QuizMatchingPair(prompt: "しもばしら", match: "じめんで できるもの")
                ],
                categories: ["空から ふるもの", "じめんで できるもの"],
                explanation: "雨と雪は 空からふり、水たまりと しもばしらは じめんで できます。"
            ),

            QuizQuestion(
                question: "木の みきの もようを 紙に うつして きろくするとき、つかうと よい ものは どれですか？",
                choices: [
                    "水の 入った コップ",
                    "金ぞくの スプーン",
                    "やわらかい ねんど",
                    "うすい 紙と クレヨン"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『うすい 紙と クレヨン』です。みきに 紙を 当てて クレヨンで こすると、もようを うつして きろくできます。"
            ),

            QuizQuestion(
                question: "アリの 行列を かんさつするとき、いちばん よい しかたは どれですか？",
                choices: [
                    "道を ふさがず、少し はなれて 見る",
                    "アリを 指で おして 止める",
                    "すの 入り口へ 水を 入れる",
                    "行列の 上を 何度も 歩く"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『道を ふさがず、少し はなれて 見る』です。アリの うごきを じゃましないように、少し はなれて かんさつします。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】見つけた ものの 形や 色を、見たまま 絵に かくことを答えましょう。",
                answer: "すけっち",
                acceptableAnswers: ["スケッチ"],
                explanation: "見つけた ものの 形や 色を、見たまま 絵に かくことを『すけっち』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】かんさつする ことと、分かりやすい きろくの しかたを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "鳥の なき声", match: "聞こえた 音を ことばで 書く"),
                    QuizMatchingPair(prompt: "はの 形", match: "りんかくを 絵で かく"),
                    QuizMatchingPair(prompt: "花の 数", match: "数字で 書く"),
                    QuizMatchingPair(prompt: "見つけた ばしょ", match: "かんたんな ちずに しるしを つける")
                ],
                choices: [
                    "数字で 書く",
                    "かんたんな ちずに しるしを つける",
                    "聞こえた 音を ことばで 書く",
                    "りんかくを 絵で かく"
                ],
                explanation: "鳥のなき声はことば、はの形は絵、花の数は数字、見つけたばしょは ちずのしるしで きろくすると 分かりやすくなります。"
            ),

            QuizQuestion.classification(
                question: "【分類】かんさつカードの 文を 『見つけた こと』『考えた こと』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "はは 5まい だった", match: "見つけた こと"),
                    QuizMatchingPair(prompt: "石の 下は しめっていた", match: "見つけた こと"),
                    QuizMatchingPair(prompt: "この つぼみは 明日 さきそうだ", match: "考えた こと"),
                    QuizMatchingPair(prompt: "この 足あとは ねこの ものだと 思う", match: "考えた こと")
                ],
                categories: ["見つけた こと", "考えた こと"],
                explanation: "見たり たしかめたりした ことは『見つけた こと』、そこから そうぞうした ことは『考えた こと』です。"
            ),

            QuizQuestion(
                question: "どの むきに おいても、ころがりにくい ものは どれですか？",
                choices: [
                    "丸い ボール",
                    "四角い つみき",
                    "ビー玉",
                    "丸い えんぴつ"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『四角い つみき』です。四角い つみきには たいらな 面が あり、丸い ものより ころがりにくくなっています。"
            ),

            QuizQuestion(
                question: "ぬれた タオルを 日なたで かわかすと、かわく前より かるくなりました。いちばん よい わけは どれですか？",
                choices: [
                    "タオルの ぬのが へったから",
                    "タオルの 中に 空気が ふえたから",
                    "タオルに ふくまれていた 水が へったから",
                    "タオルの 色が うすくなったから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『タオルに ふくまれていた 水が へったから』です。タオルが かわくと、ふくまれていた 水が へるため、かるくなります。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】みぢかな ものと、その とじ方や むすび方を 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "シャツの ボタン", match: "ボタンあなへ 通す"),
                    QuizMatchingPair(prompt: "ファスナー", match: "つまみを うごかす"),
                    QuizMatchingPair(prompt: "めんファスナー", match: "2つの 面を おしつける"),
                    QuizMatchingPair(prompt: "くつひも", match: "むすび目を つくる")
                ],
                choices: [
                    "むすび目を つくる",
                    "2つの 面を おしつける",
                    "ボタンあなへ 通す",
                    "つまみを うごかす"
                ],
                explanation: "ボタンはボタンあなへ通し、ファスナーはつまみを動かし、めんファスナーは2つの面をおしつけ、くつひもは むすび目をつくって とじます。"
            ),

            QuizQuestion.classification(
                question: "【分類】みぢかな ものを 『手で にぎると 形が かわりやすい』『形が かわりにくい』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "わた", match: "手で にぎると 形が かわりやすい"),
                    QuizMatchingPair(prompt: "スポンジ", match: "手で にぎると 形が かわりやすい"),
                    QuizMatchingPair(prompt: "石", match: "形が かわりにくい"),
                    QuizMatchingPair(prompt: "ガラスの ビー玉", match: "形が かわりにくい")
                ],
                categories: ["手で にぎると 形が かわりやすい", "形が かわりにくい"],
                explanation: "わたとスポンジは 手でにぎると形がかわりやすく、石とガラスのビー玉は 形がかわりにくい ものです。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】4本の ゴムひもを おなじ 力で ひいた ときに のびた 長さを、長い じゅんに ならべましょう。",
                choices: [
                    "Aの ゴムひも（4cm）",
                    "Bの ゴムひも（9cm）",
                    "Cの ゴムひも（2cm）",
                    "Dの ゴムひも（6cm）"
                ],
                rankedChoices: [
                    "Bの ゴムひも（9cm）",
                    "Dの ゴムひも（6cm）",
                    "Aの ゴムひも（4cm）",
                    "Cの ゴムひも（2cm）"
                ],
                explanation: "のびた長さは、Bの9cm、Dの6cm、Aの4cm、Cの2cmの じゅんです。"
            ),

        QuizQuestion(
                question: "冬の あいだ、落ち葉の 下で じっとしていた テントウムシは、春になると どうなりやすいですか？",
                choices: [
                    "うごきはじめる",
                    "こおりに なる",
                    "石に かわる",
                    "水の 中だけで くらす"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『うごきはじめる』です。春になって あたたかくなると、テントウムシは うごきはじめます。"
            ),

            QuizQuestion(
                question: "雪を あたたかい へやに 入れると、何に なりますか？",
                choices: [
                    "すな",
                    "水",
                    "木",
                    "けむり"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『水』です。雪は あたたかい ところで とけると、水に なります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】春、夏、秋、冬を まとめて 何と いうか、答えましょう。",
                answer: "きせつ",
                acceptableAnswers: ["季節"],
                explanation: "春、夏、秋、冬を まとめて『きせつ』と いいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】きせつと、その きせつに よく 食べられる くだものを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "いちご"),
                    QuizMatchingPair(prompt: "夏", match: "すいか"),
                    QuizMatchingPair(prompt: "秋", match: "かき"),
                    QuizMatchingPair(prompt: "冬", match: "みかん")
                ],
                choices: ["かき", "みかん", "いちご", "すいか"],
                explanation: "春はいちご、夏はすいか、秋はかき、冬はみかんが よく 食べられます。"
            ),

            QuizQuestion.classification(
                question: "【分類】しぜんの へんかを 『あたたかくなると 見られる』『さむくなると 見られる』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "池の こおりが とける", match: "あたたかくなると 見られる"),
                    QuizMatchingPair(prompt: "草の めが のびる", match: "あたたかくなると 見られる"),
                    QuizMatchingPair(prompt: "水たまりに こおりが はる", match: "さむくなると 見られる"),
                    QuizMatchingPair(prompt: "草の 上に しもが つく", match: "さむくなると 見られる")
                ],
                categories: ["あたたかくなると 見られる", "さむくなると 見られる"],
                explanation: "あたたかくなると こおりがとけ、草のめがのびます。さむくなると 水たまりにこおりがはり、草の上にしもがつきます。"
            ),

            QuizQuestion(
                question: "ウサギの 長い みみは、おもに 何を するのに 役立ちますか？",
                choices: [
                    "水の 中で いきをする",
                    "土を ほる",
                    "小さな 音を 聞く",
                    "空を とぶ"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『小さな 音を 聞く』です。ウサギの 長いみみは、まわりの 小さな音を 聞くのに 役立ちます。"
            ),

            QuizQuestion(
                question: "魚が 水の 中を すすむ ときに つかう からだの ぶぶんは どれですか？",
                choices: [
                    "つばさ",
                    "つの",
                    "毛",
                    "ひれ"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『ひれ』です。魚は ひれを うごかして、水の 中を すすみます。"
            ),

            QuizQuestion(
                question: "鳥の すに たまごが あるのを 見つけました。どうするのが よいですか？",
                choices: [
                    "さわらずに、しずかに はなれる",
                    "たまごを 手に とって 見る",
                    "すを ゆらしてみる",
                    "大きな 声で 鳥を よぶ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『さわらずに、しずかに はなれる』です。鳥や たまごを おどろかせないように、すから しずかに はなれます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】生きものと、よく 食べる ものを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "リス", match: "どんぐり"),
                    QuizMatchingPair(prompt: "アオムシ", match: "キャベツの は"),
                    QuizMatchingPair(prompt: "ミツバチ", match: "花の みつ"),
                    QuizMatchingPair(prompt: "キツツキ", match: "木の 中の むし")
                ],
                choices: ["花の みつ", "木の 中の むし", "どんぐり", "キャベツの は"],
                explanation: "リスはどんぐり、アオムシはキャベツのは、ミツバチは花のみつ、キツツキは木の中のむしを よく 食べます。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを 『鳥』『こん虫』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "すずめ", match: "鳥"),
                    QuizMatchingPair(prompt: "はと", match: "鳥"),
                    QuizMatchingPair(prompt: "ちょう", match: "こん虫"),
                    QuizMatchingPair(prompt: "とんぼ", match: "こん虫")
                ],
                categories: ["鳥", "こん虫"],
                explanation: "すずめとはとは鳥、ちょうととんぼは こん虫です。"
            ),

            QuizQuestion(
                question: "小さな たねに 水を あげる とき、たねが 流れにくい やり方は どれですか？",
                choices: [
                    "強い 水を たねに まっすぐ 当てる",
                    "じょうろで 土に そっと 水を かける",
                    "はちを さかさまに する",
                    "土を ぜんぶ ほり返す"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『じょうろで 土に そっと 水を かける』です。やさしく 水を かけると、小さな たねが 流れにくくなります。"
            ),

            QuizQuestion(
                question: "草花の ねには、どのような はたらきが ありますか？",
                choices: [
                    "空を とぶ",
                    "音を 出す",
                    "草花を 土に しっかり ささえる",
                    "花の 色を かえる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『草花を 土に しっかり ささえる』です。ねは 草花を 土に ささえ、たおれにくくします。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】花の あとに できて、たねを つつむ ものを答えましょう。",
                answer: "み",
                acceptableAnswers: ["実"],
                explanation: "花の あとに できて、たねを つつむ ものは『み』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】木と、その 木に できる ものを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "マツ", match: "まつぼっくり"),
                    QuizMatchingPair(prompt: "コナラ", match: "どんぐり"),
                    QuizMatchingPair(prompt: "クリ", match: "くり"),
                    QuizMatchingPair(prompt: "イチョウ", match: "ぎんなん")
                ],
                choices: ["どんぐり", "ぎんなん", "まつぼっくり", "くり"],
                explanation: "マツにはまつぼっくり、コナラにはどんぐり、クリにはくり、イチョウにはぎんなんが できます。"
            ),

            QuizQuestion.classification(
                question: "【分類】やさいを 『地上に できる 実を 食べる』『土の 中の ねを 食べる』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "トマト", match: "地上に できる 実を 食べる"),
                    QuizMatchingPair(prompt: "ピーマン", match: "地上に できる 実を 食べる"),
                    QuizMatchingPair(prompt: "にんじん", match: "土の 中の ねを 食べる"),
                    QuizMatchingPair(prompt: "だいこん", match: "土の 中の ねを 食べる")
                ],
                categories: ["地上に できる 実を 食べる", "土の 中の ねを 食べる"],
                explanation: "トマトとピーマンは 地上にできる実を食べ、にんじんとだいこんは 土の中のねを食べます。"
            ),

            QuizQuestion(
                question: "雨の りょうを しらべる 入れものは、どこに おくと よいですか？",
                choices: [
                    "屋根の 下",
                    "大きな 木の 下",
                    "へやの 中",
                    "まわりに 屋根や 木が ない、ひらけた ばしょ"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『まわりに 屋根や 木が ない、ひらけた ばしょ』です。雨を さえぎる ものが ない ばしょに おくと、雨の りょうを しらべやすくなります。"
            ),

            QuizQuestion(
                question: "空が くもで おおわれ、たいようが 見えないけれど、雨や 雪は ふっていません。この 天気は どれですか？",
                choices: [
                    "くもり",
                    "はれ",
                    "雨",
                    "雪"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『くもり』です。空が くもで おおわれ、雨や雪が ふっていない 天気を くもりと いいます。"
            ),

            QuizQuestion(
                question: "強い 風が ふきそうな とき、外に ある かるい バケツは どうすると よいですか？",
                choices: [
                    "高い ところへ おく",
                    "へやの 中へ しまう",
                    "道の まんなかへ おく",
                    "木の えだに かける"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『へやの 中へ しまう』です。かるい バケツは 強い風で とばされることが あるため、安全な へやの中へ しまいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】風が ふくと、くるくる 回る おもちゃを答えましょう。",
                answer: "かざぐるま",
                acceptableAnswers: ["風車"],
                explanation: "風が ふくと くるくる 回る おもちゃは『かざぐるま』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】外の ようすを 『はれの日』『雨の日』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "青い 空が 見える", match: "はれの日"),
                    QuizMatchingPair(prompt: "かげが はっきり できる", match: "はれの日"),
                    QuizMatchingPair(prompt: "かさを さす 人が いる", match: "雨の日"),
                    QuizMatchingPair(prompt: "道に 水たまりが できる", match: "雨の日")
                ],
                categories: ["はれの日", "雨の日"],
                explanation: "はれの日には 青い空や はっきりしたかげが見られ、雨の日には かさをさす人や 水たまりが見られます。"
            ),

            QuizQuestion(
                question: "ぬれた 石と かわいた 石では、色が ちがって 見えることが あります。石の 色を くらべる とき、どうすると よいですか？",
                choices: [
                    "一つだけ 水に しずめる",
                    "一つだけ 土で よごす",
                    "どちらも かわかしてから 見る",
                    "くらい はこの 中で 見る"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『どちらも かわかしてから 見る』です。石の ぬれ方を そろえると、色を くらべやすくなります。"
            ),

            QuizQuestion(
                question: "むしめがねを つかう とき、してはいけないことは どれですか？",
                choices: [
                    "はっぱを 大きくして 見る",
                    "石の もようを 見る",
                    "つかった あとに しまう",
                    "むしめがねで たいようを 見る"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『むしめがねで たいようを 見る』です。目を いためる おそれが あるため、むしめがねで たいようを 見てはいけません。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】かんさつカードに、何月何日に 見たかを 書く ところを答えましょう。",
                answer: "ひづけ",
                acceptableAnswers: ["日付"],
                explanation: "何月何日に 見たかを 書く ところは『ひづけ』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】かんさつする ものと、きろくの しかたを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "はの 長さ", match: "cmで きろくする"),
                    QuizMatchingPair(prompt: "むしの 数", match: "ひきで きろくする"),
                    QuizMatchingPair(prompt: "外の 気おん", match: "℃で きろくする"),
                    QuizMatchingPair(prompt: "かんさつした 時間", match: "分で きろくする")
                ],
                choices: ["分で きろくする", "℃で きろくする", "cmで きろくする", "ひきで きろくする"],
                explanation: "はの長さはcm、むしの数はひき、外の気おんは℃、かんさつした時間は分で きろくします。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】かんさつした ひまわりの はの 数を、多い じゅんに ならべましょう。",
                choices: [
                    "Aの ひまわり（12まい）",
                    "Bの ひまわり（7まい）",
                    "Cの ひまわり（15まい）",
                    "Dの ひまわり（9まい）"
                ],
                rankedChoices: [
                    "Cの ひまわり（15まい）",
                    "Aの ひまわり（12まい）",
                    "Dの ひまわり（9まい）",
                    "Bの ひまわり（7まい）"
                ],
                explanation: "はの数は、Cの15まい、Aの12まい、Dの9まい、Bの7まいの じゅんです。"
            ),

            QuizQuestion(
                question: "あたたかい スープに、金ぞくの スプーンと 木の スプーンを 入れました。えが はやく あたたかくなりやすいのは どちらですか？",
                choices: [
                    "金ぞくの スプーン",
                    "木の スプーン",
                    "どちらも ぜったいに あたたかくならない",
                    "スプーンではなく、つくえ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『金ぞくの スプーン』です。金ぞくは 木よりも あたたかさを つたえやすいため、えが はやく あたたかくなりやすいです。"
            ),

            QuizQuestion(
                question: "とうめいな 下じきを 通して、むこうがわを 見ると どうなりますか？",
                choices: [
                    "何も 見えなくなる",
                    "むこうがわが 見える",
                    "下じきが 木に かわる",
                    "むこうがわの 音だけが 見える"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『むこうがわが 見える』です。とうめいな ものは、むこうがわを 見ることができます。"
            ),

            QuizQuestion(
                question: "おなじ りょうの 水を、おなじ ばしょに おきました。いちばん はやく 水が へりやすい 入れものは どれですか？",
                choices: [
                    "ふたを しめた コップ",
                    "口の せまい、せの 高い びん",
                    "口の 広い、ひらたい さら",
                    "ふたを しめた ペットボトル"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『口の 広い、ひらたい さら』です。水が 空気に ふれる ところが 広いほど、水は かわいて へりやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】あつい なべを もつ とき、手を まもるために つかう ものを答えましょう。",
                answer: "なべつかみ",
                acceptableAnswers: ["鍋つかみ", "鍋掴み"],
                explanation: "あつい なべを もつ ときに つかう ものは『なべつかみ』です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】入れものに 入っている 水の りょうを、多い じゅんに ならべましょう。",
                choices: [
                    "Aの 入れもの（200mL）",
                    "Bの 入れもの（450mL）",
                    "Cの 入れもの（100mL）",
                    "Dの 入れもの（300mL）"
                ],
                rankedChoices: [
                    "Bの 入れもの（450mL）",
                    "Dの 入れもの（300mL）",
                    "Aの 入れもの（200mL）",
                    "Cの 入れもの（100mL）"
                ],
                explanation: "水のりょうは、Bの450mL、Dの300mL、Aの200mL、Cの100mLの じゅんです。"
            ),

        QuizQuestion(
                question: "春の つぎに くる きせつは どれですか？",
                choices: [
                    "夏",
                    "秋",
                    "冬",
                    "春"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『夏』です。春の つぎには 夏が きます。"
            ),

            QuizQuestion(
                question: "冬の 朝、おなじ 大きさの こおりを 日なたと 日かげに おきました。はやく とけやすいのは どちらですか？",
                choices: [
                    "日かげの こおり",
                    "日なたの こおり",
                    "どちらも ぜったいに とけない",
                    "どちらも いつも おなじ はやさで とける"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『日なたの こおり』です。日なたは たいようの 光で あたたまりやすいため、こおりが はやく とけやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】秋の おわりごろから 冬にかけて ふく、つめたい 風を答えましょう。",
                answer: "こがらし",
                acceptableAnswers: ["木枯らし", "木枯し"],
                explanation: "秋の おわりごろから 冬にかけて ふく、つめたい 風を『こがらし』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】きせつと、日の 長さの ようすを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "日が 少しずつ 長くなる"),
                    QuizMatchingPair(prompt: "夏", match: "夕方まで 明るい 日が 多い"),
                    QuizMatchingPair(prompt: "秋", match: "日が 少しずつ 短くなる"),
                    QuizMatchingPair(prompt: "冬", match: "夕方 はやく くらくなる")
                ],
                choices: [
                    "夕方 はやく くらくなる",
                    "日が 少しずつ 長くなる",
                    "夕方まで 明るい 日が 多い",
                    "日が 少しずつ 短くなる"
                ],
                explanation: "春は 日が少しずつ長くなり、夏は 夕方まで明るい日が多くなります。秋は 日が少しずつ短くなり、冬は 夕方はやく暗くなります。"
            ),

            QuizQuestion.classification(
                question: "【分類】きせつの ようすを 『春や夏に 見られる』『秋や冬に 見られる』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ヒバリの 声が 聞こえる", match: "春や夏に 見られる"),
                    QuizMatchingPair(prompt: "アブラゼミが なく", match: "春や夏に 見られる"),
                    QuizMatchingPair(prompt: "くりの いがが 落ちている", match: "秋や冬に 見られる"),
                    QuizMatchingPair(prompt: "しもばしらが できる", match: "秋や冬に 見られる")
                ],
                categories: ["春や夏に 見られる", "秋や冬に 見られる"],
                explanation: "ヒバリの声や アブラゼミの声は 春や夏に、くりのいがや しもばしらは 秋や冬に よく見られます。"
            ),

            QuizQuestion(
                question: "カタツムリの 頭から のびている、まわりを たしかめる ぶぶんは どれですか？",
                choices: [
                    "ひれ",
                    "しっぽ",
                    "しょっかく",
                    "はね"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『しょっかく』です。カタツムリは しょっかくを つかって、まわりの ようすを たしかめます。"
            ),

            QuizQuestion(
                question: "多くの カニが よくする 歩き方は どれですか？",
                choices: [
                    "上へ とびながら 歩く",
                    "その場で 回りながら 歩く",
                    "いつも うしろ向きに 歩く",
                    "横向きに 歩く"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『横向きに 歩く』です。多くの カニは、横向きに 歩くことが とくいです。"
            ),

            QuizQuestion(
                question: "鳥の からだを おおう 羽毛には、さむい ときに どんな はたらきが ありますか？",
                choices: [
                    "からだを あたたかく たもつ",
                    "土を 深く ほる",
                    "水の 中で いきをする",
                    "かたい 木を かむ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『からだを あたたかく たもつ』です。羽毛の あいだに 空気が たまり、鳥の からだが ひえにくくなります。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】生きものと、休んだり くらしたりする ばしょを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "リス", match: "木の うろ"),
                    QuizMatchingPair(prompt: "アリ", match: "土の 中の す"),
                    QuizMatchingPair(prompt: "ツバメ", match: "のき下の す"),
                    QuizMatchingPair(prompt: "ヤドカリ", match: "からになった 貝がら")
                ],
                choices: [
                    "からになった 貝がら",
                    "木の うろ",
                    "のき下の す",
                    "土の 中の す"
                ],
                explanation: "リスは木のうろ、アリは土の中のす、ツバメはのき下のす、ヤドカリは からになった貝がらを くらす場所にします。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを 『あしが 2本』『あしが 4本』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "にわとり", match: "あしが 2本"),
                    QuizMatchingPair(prompt: "すずめ", match: "あしが 2本"),
                    QuizMatchingPair(prompt: "いぬ", match: "あしが 4本"),
                    QuizMatchingPair(prompt: "うさぎ", match: "あしが 4本")
                ],
                categories: ["あしが 2本", "あしが 4本"],
                explanation: "にわとりと すずめは あしが2本、いぬと うさぎは あしが4本です。"
            ),

            QuizQuestion(
                question: "はちうえの 草花に 水を あげる とき、どこへ そそぐと よいですか？",
                choices: [
                    "花びらの まんなか",
                    "ねの ある 土",
                    "はの 先だけ",
                    "はちの 外の ゆか"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『ねの ある 土』です。土へ 水を そそぐと、草花の ねが 水を すうことができます。"
            ),

            QuizQuestion(
                question: "まどの 近くで そだてた 草の くきが、まどの ほうへ かたむきました。何に むかって のびたと 考えられますか？",
                choices: [
                    "大きな 音",
                    "土の におい",
                    "明るい 光",
                    "つめたい 風"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『明るい 光』です。草の くきや はは、光が ある ほうへ のびることがあります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】たねから 出たばかりの、小さな しょくぶつを答えましょう。",
                answer: "めばえ",
                acceptableAnswers: ["芽生え"],
                explanation: "たねから 出たばかりの 小さな しょくぶつを『めばえ』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】しょくぶつと、はの 形の とくちょうを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "イチョウ", match: "おうぎのような 形"),
                    QuizMatchingPair(prompt: "クローバー", match: "小さな はが 3まい 集まった 形"),
                    QuizMatchingPair(prompt: "マツ", match: "はりのように 細い 形"),
                    QuizMatchingPair(prompt: "ハス", match: "大きくて 丸い 形")
                ],
                choices: [
                    "はりのように 細い 形",
                    "大きくて 丸い 形",
                    "おうぎのような 形",
                    "小さな はが 3まい 集まった 形"
                ],
                explanation: "イチョウは おうぎのような形、クローバーは 小さなはが3まい集まった形、マツは はりのように細い形、ハスは 大きくて丸い形です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】かんさつした はの はばを、広い じゅんに ならべましょう。",
                choices: [
                    "Aの は（4cm）",
                    "Bの は（7cm）",
                    "Cの は（2cm）",
                    "Dの は（5cm）"
                ],
                rankedChoices: [
                    "Bの は（7cm）",
                    "Dの は（5cm）",
                    "Aの は（4cm）",
                    "Cの は（2cm）"
                ],
                explanation: "はの はばは、Bの7cm、Dの5cm、Aの4cm、Cの2cmの じゅんです。"
            ),

            QuizQuestion(
                question: "雨が やんだ あと、たいようの 光が さすと、空に 見えることが ある ものは どれですか？",
                choices: [
                    "つらら",
                    "しもばしら",
                    "ほし",
                    "にじ"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『にじ』です。雨の あとに たいようの 光が さすと、空に にじが 見えることがあります。"
            ),

            QuizQuestion(
                question: "朝、じめんの 近くが 白っぽくなり、遠くが 見えにくくなりました。この ようすを 何と いいますか？",
                choices: [
                    "きり",
                    "にじ",
                    "しも",
                    "つゆ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『きり』です。きりが 出ると、じめんの 近くが 白っぽくなり、遠くが 見えにくくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】夏の 午後などに、きゅうに はげしく ふる 雨を答えましょう。",
                answer: "ゆうだち",
                acceptableAnswers: ["夕立"],
                explanation: "夏の 午後などに、きゅうに はげしく ふる 雨を『ゆうだち』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】天気の ようすと、聞こえることが ある 音を 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "雨", match: "屋根に ぱらぱら 当たる 音"),
                    QuizMatchingPair(prompt: "強い 風", match: "電線が ひゅうひゅう なる 音"),
                    QuizMatchingPair(prompt: "かみなり", match: "空で ごろごろ なる 音"),
                    QuizMatchingPair(prompt: "ひょう", match: "まどに かちかち 当たる 音")
                ],
                choices: [
                    "空で ごろごろ なる 音",
                    "まどに かちかち 当たる 音",
                    "屋根に ぱらぱら 当たる 音",
                    "電線が ひゅうひゅう なる 音"
                ],
                explanation: "雨は屋根にぱらぱら、強い風では電線がひゅうひゅう、かみなりは空でごろごろ、ひょうはまどにかちかちと音がすることがあります。"
            ),

            QuizQuestion.classification(
                question: "【分類】天気に かんけいする ものを 『空から ふってくる』『空から ふってこない』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "雨", match: "空から ふってくる"),
                    QuizMatchingPair(prompt: "雪", match: "空から ふってくる"),
                    QuizMatchingPair(prompt: "風", match: "空から ふってこない"),
                    QuizMatchingPair(prompt: "くも", match: "空から ふってこない")
                ],
                categories: ["空から ふってくる", "空から ふってこない"],
                explanation: "雨と雪は 空からふってきます。風とくもは、空からふってくるものではありません。"
            ),

            QuizQuestion(
                question: "公園の 鳥を かんさつするとき、いちばん よい しかたは どれですか？",
                choices: [
                    "石を なげて とばせる",
                    "しずかに はなれて 見る",
                    "大きな 声で よびつづける",
                    "すの すぐ そばまで 近づく"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『しずかに はなれて 見る』です。鳥を おどろかせないように、しずかに はなれて かんさつします。"
            ),

            QuizQuestion(
                question: "はっぱの うらを かんさつするとき、はっぱを きずつけにくい しかたは どれですか？",
                choices: [
                    "はっぱを ちぎって すてる",
                    "はっぱを 足で ふむ",
                    "はっぱを そっと うらがえす",
                    "えだを 強く おる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『はっぱを そっと うらがえす』です。やさしく うらがえすと、はっぱを きずつけにくくなります。"
            ),

            QuizQuestion(
                question: "2本の 花の くきが どちらだけ のびたかを くらべる とき、いちばん よい はかり方は どれですか？",
                choices: [
                    "1本は cm、もう1本は 手の大きさで はかる",
                    "1本だけ はかって、もう1本は そうぞうする",
                    "ちがう 日の きろくを まぜて くらべる",
                    "おなじ ものさしで、土の 上から 先まで はかる"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『おなじ ものさしで、土の 上から 先まで はかる』です。おなじ どうぐと はかり方に そろえると、正しく くらべられます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】見つけた 生きものや 草花の 名前を しらべる 本を答えましょう。",
                answer: "ずかん",
                acceptableAnswers: ["図鑑"],
                explanation: "生きものや 草花の 名前を しらべる 本は『ずかん』です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】5分の あいだに 聞こえた 鳥の 声の 回数を、多い じゅんに ならべましょう。",
                choices: [
                    "Aの ばしょ（6回）",
                    "Bの ばしょ（11回）",
                    "Cの ばしょ（4回）",
                    "Dの ばしょ（8回）"
                ],
                rankedChoices: [
                    "Bの ばしょ（11回）",
                    "Dの ばしょ（8回）",
                    "Aの ばしょ（6回）",
                    "Cの ばしょ（4回）"
                ],
                explanation: "鳥の声の回数は、Bの11回、Dの8回、Aの6回、Cの4回の じゅんです。"
            ),

            QuizQuestion(
                question: "じしゃくに つく ものは どれですか？",
                choices: [
                    "鉄の クリップ",
                    "けしごむ",
                    "木の つみき",
                    "プラスチックの ストロー"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『鉄の クリップ』です。鉄で できた クリップは、じしゃくに つきます。"
            ),

            QuizQuestion(
                question: "水を 入れて ためておける ものは どれですか？",
                choices: [
                    "あみの ふくろ",
                    "プラスチックの コップ",
                    "ティッシュペーパー",
                    "ぬのの 手ぶくろ"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『プラスチックの コップ』です。プラスチックの コップには 水を 入れて ためておくことができます。"
            ),

            QuizQuestion(
                question: "ゴムの ボールを ゆかへ 落とすと、どうなりやすいですか？",
                choices: [
                    "とけて なくなる",
                    "光り はじめる",
                    "はねる",
                    "ゆかに くっついたままに なる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『はねる』です。ゴムの ボールは、ゆかへ 落とすと はねやすい ものです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】自分の 顔や、うしろの けしきを うつして 見る ものを答えましょう。",
                answer: "かがみ",
                acceptableAnswers: ["鏡"],
                explanation: "自分の 顔や けしきを うつして 見る ものは『かがみ』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】みぢかな ものを 『おりまげやすい』『おりまげにくい』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "紙", match: "おりまげやすい"),
                    QuizMatchingPair(prompt: "アルミホイル", match: "おりまげやすい"),
                    QuizMatchingPair(prompt: "木の つみき", match: "おりまげにくい"),
                    QuizMatchingPair(prompt: "ガラスの ビー玉", match: "おりまげにくい")
                ],
                categories: ["おりまげやすい", "おりまげにくい"],
                explanation: "紙とアルミホイルは おりまげやすく、木のつみきとガラスのビー玉は おりまげにくい ものです。"
            ),

        QuizQuestion(
                question: "春から 夏へ 近づくと、夕方に くらくなる じこくは どうなりやすいですか？",
                choices: [
                    "おそくなる",
                    "はやくなる",
                    "まい日 おなじになる",
                    "昼に くらくなる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『おそくなる』です。春から 夏へ 近づくと、日が出ている 時間が 長くなり、夕方に くらくなる じこくが おそくなります。"
            ),

            QuizQuestion(
                question: "冬の 朝、草の はや 土の 上が 白く きらきらしていました。何が ついていると 考えられますか？",
                choices: [
                    "白い すな",
                    "しも",
                    "花びら",
                    "せっけんの あわ"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『しも』です。冬の さむい 朝には、草の はや 土の 上に 白い しもが つくことがあります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】夏の はじめごろに、雨や くもりの 日が つづく じきを答えましょう。",
                answer: "つゆ",
                acceptableAnswers: ["梅雨"],
                explanation: "夏の はじめごろに、雨や くもりの 日が つづく じきを『つゆ』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】きせつと、その きせつに つかうことが 多い ものを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "うすい 上着"),
                    QuizMatchingPair(prompt: "夏", match: "日よけの ぼうし"),
                    QuizMatchingPair(prompt: "秋", match: "どんぐりを 入れる ふくろ"),
                    QuizMatchingPair(prompt: "冬", match: "手ぶくろ")
                ],
                choices: [
                    "手ぶくろ",
                    "どんぐりを 入れる ふくろ",
                    "日よけの ぼうし",
                    "うすい 上着"
                ],
                explanation: "春は うすい上着、夏は 日よけのぼうし、秋は どんぐりを入れるふくろ、冬は 手ぶくろを つかうことが 多くなります。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものの ようすを 『春』『夏』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ツバメが すを つくる", match: "春"),
                    QuizMatchingPair(prompt: "オタマジャクシが 見つかる", match: "春"),
                    QuizMatchingPair(prompt: "カブトムシが 木に 集まる", match: "夏"),
                    QuizMatchingPair(prompt: "セミの ぬけがらが 見つかる", match: "夏")
                ],
                categories: ["春", "夏"],
                explanation: "ツバメの す作りや オタマジャクシは 春に、カブトムシや セミの ぬけがらは 夏に よく見られます。"
            ),

            QuizQuestion(
                question: "クモの あしは、ぜんぶで 何本 ありますか？",
                choices: [
                    "4本",
                    "6本",
                    "8本",
                    "10本"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『8本』です。クモには あしが 8本あります。"
            ),

            QuizQuestion(
                question: "魚が 水の 中で いきを するときに つかう からだの ぶぶんは どれですか？",
                choices: [
                    "はね",
                    "つの",
                    "くちばし",
                    "えら"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『えら』です。魚は えらを つかって、水の 中で いきをします。"
            ),

            QuizQuestion(
                question: "カモの あしの ゆびの あいだに ある まくは、何を しやすくしますか？",
                choices: [
                    "水を およぐ",
                    "木を けずる",
                    "土を 深く ほる",
                    "空を とぶ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『水を およぐ』です。カモは ゆびの あいだの まくで 水を おし、じょうずに およぎます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】生きものと、その 生きものが のこすことの ある あとを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ねこ", match: "にくきゅうの 形の 足あと"),
                    QuizMatchingPair(prompt: "鳥", match: "ぬけ落ちた はね"),
                    QuizMatchingPair(prompt: "カタツムリ", match: "光るような 通った あと"),
                    QuizMatchingPair(prompt: "モグラ", match: "土の もり上がり")
                ],
                choices: [
                    "土の もり上がり",
                    "光るような 通った あと",
                    "にくきゅうの 形の 足あと",
                    "ぬけ落ちた はね"
                ],
                explanation: "ねこは にくきゅうの足あと、鳥は はね、カタツムリは 光るような通ったあと、モグラは 土のもり上がりを のこすことがあります。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを 『あしが ある』『あしが ない』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "いぬ", match: "あしが ある"),
                    QuizMatchingPair(prompt: "カブトムシ", match: "あしが ある"),
                    QuizMatchingPair(prompt: "へび", match: "あしが ない"),
                    QuizMatchingPair(prompt: "メダカ", match: "あしが ない")
                ],
                categories: ["あしが ある", "あしが ない"],
                explanation: "いぬと カブトムシには あしがあり、へびと メダカには あしがありません。"
            ),

            QuizQuestion(
                question: "たねを まいた はちに 名ふだを 立てるのは、何の ためですか？",
                choices: [
                    "土を かたくするため",
                    "何の たねを まいたか 分かるようにするため",
                    "むしを ぜんぶ 追いはらうため",
                    "はちを おもくするため"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『何の たねを まいたか 分かるようにするため』です。名ふだが あると、そだてている 草花の 名前を たしかめられます。"
            ),

            QuizQuestion(
                question: "おなじ 草花の はちを 2つ そだてます。1つだけに 水を あげなかったら、どうなりやすいですか？",
                choices: [
                    "水を あげない ほうだけ 花が ふえる",
                    "水を あげない ほうだけ すぐ 木になる",
                    "水を あげない ほうが しおれやすい",
                    "どちらも かならず おなじになる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『水を あげない ほうが しおれやすい』です。草花が そだつには 水が ひつようです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】花の 中に ある、きいろなどの こまかい こなを答えましょう。",
                answer: "かふん",
                acceptableAnswers: ["花粉"],
                explanation: "花の 中に ある こまかい こなを『かふん』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】たねや 実と、その ひろがり方の とくちょうを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "たんぽぽの たね", match: "わた毛で 風に はこばれる"),
                    QuizMatchingPair(prompt: "ひっつきむし", match: "どうぶつの 毛や ふくに つく"),
                    QuizMatchingPair(prompt: "もみじの たね", match: "はねのように 回って 落ちる"),
                    QuizMatchingPair(prompt: "どんぐり", match: "木から じめんへ 落ちる")
                ],
                choices: [
                    "木から じめんへ 落ちる",
                    "はねのように 回って 落ちる",
                    "わた毛で 風に はこばれる",
                    "どうぶつの 毛や ふくに つく"
                ],
                explanation: "たんぽぽのたねは 風に運ばれ、ひっつきむしは 毛や服につき、もみじのたねは 回って落ち、どんぐりは 木から地面へ落ちます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】花だんで はかった 花の くきの 長さを、長い じゅんに ならべましょう。",
                choices: [
                    "赤い 花（16cm）",
                    "白い 花（9cm）",
                    "黄色い 花（21cm）",
                    "むらさきの 花（13cm）"
                ],
                rankedChoices: [
                    "黄色い 花（21cm）",
                    "赤い 花（16cm）",
                    "むらさきの 花（13cm）",
                    "白い 花（9cm）"
                ],
                explanation: "くきの 長さは、黄色い花21cm、赤い花16cm、むらさきの花13cm、白い花9cmの じゅんです。"
            ),

            QuizQuestion(
                question: "はれた 日に 水たまりが 小さくなりました。いちばん 考えられる わけは どれですか？",
                choices: [
                    "水が 石に かわったから",
                    "水が じめんから わき出したから",
                    "水が こおったから",
                    "水が かわいて 空気の 中へ 出ていったから"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『水が かわいて 空気の 中へ 出ていったから』です。はれた 日には、水たまりの 水が かわいて 少なくなります。"
            ),

            QuizQuestion(
                question: "風が 東から 西へ ふいています。ぼうに むすんだ 細い ひもは、どちらへ なびきますか？",
                choices: [
                    "西",
                    "東",
                    "北",
                    "上"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『西』です。東から 西へ ふく 風に おされて、ひもは 西へ なびきます。"
            ),

            QuizQuestion(
                question: "外に いるときに かみなりの 音が 聞こえました。どうするのが よいですか？",
                choices: [
                    "高い 木の すぐ下へ 行く",
                    "じょうぶな たてものの 中へ 入る",
                    "広い ばしょで 立ったままにする",
                    "金ぞくの ぼうを 高く あげる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『じょうぶな たてものの 中へ 入る』です。かみなりが 聞こえたら、できるだけ はやく 安全な たてものの 中へ 入ります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】空から ふる、小さくて 白い こおりの つぶを答えましょう。",
                answer: "あられ",
                acceptableAnswers: ["霰"],
                explanation: "空から ふる、小さな こおりの つぶを『あられ』といいます。"
            ),

            QuizQuestion.classification(
                question: "【分類】どうぐを 『天気を しらべる』『ものの おもさを しらべる』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "外の 気おんを はかる おんどけい", match: "天気を しらべる"),
                    QuizMatchingPair(prompt: "雨の りょうを はかる 入れもの", match: "天気を しらべる"),
                    QuizMatchingPair(prompt: "たいじゅうけい", match: "ものの おもさを しらべる"),
                    QuizMatchingPair(prompt: "りょうり用の はかり", match: "ものの おもさを しらべる")
                ],
                categories: ["天気を しらべる", "ものの おもさを しらべる"],
                explanation: "おんどけいや 雨のりょうをはかる入れものは 天気をしらべ、たいじゅうけいや りょうり用のはかりは おもさをしらべます。"
            ),

            QuizQuestion(
                question: "つかまえて かんさつした 小さな 生きものは、かんさつの あと どうすると よいですか？",
                choices: [
                    "家の ひき出しに 入れる",
                    "べつの 町へ はこぶ",
                    "見つけた ばしょへ そっと もどす",
                    "空へ 高く なげる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『見つけた ばしょへ そっと もどす』です。かんさつが おわったら、生きものを もとの ばしょへ そっと もどします。"
            ),

            QuizQuestion(
                question: "木の みきの 太さを くらべる とき、どの やり方が いちばん よいですか？",
                choices: [
                    "木の 色だけを 見る",
                    "木の 高さを そうぞうする",
                    "葉の 数を 1まいだけ 数える",
                    "ひもを みきの まわりに まいて 長さを はかる"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『ひもを みきの まわりに まいて 長さを はかる』です。みきの まわりの 長さを はかると、木の 太さを くらべられます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】遠くに いる 鳥などを 大きく 見るために つかう どうぐを答えましょう。",
                answer: "そうがんきょう",
                acceptableAnswers: ["双眼鏡"],
                explanation: "遠くに いる 鳥などを 大きく 見るために つかう どうぐは『そうがんきょう』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】かんさつの どうぐと、その つかい方を 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ものさし", match: "長さを はかる"),
                    QuizMatchingPair(prompt: "むしめがね", match: "小さな ところを 大きく 見る"),
                    QuizMatchingPair(prompt: "ノート", match: "気づいたことを かく"),
                    QuizMatchingPair(prompt: "色えんぴつ", match: "見つけた 色を かき分ける")
                ],
                choices: [
                    "見つけた 色を かき分ける",
                    "気づいたことを かく",
                    "長さを はかる",
                    "小さな ところを 大きく 見る"
                ],
                explanation: "ものさしは長さ、むしめがねは小さなところ、ノートは気づいたこと、色えんぴつは見つけた色を きろくするときに つかいます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】ひろった 小えだの 長さを、長い じゅんに ならべましょう。",
                choices: [
                    "Aの 小えだ（8cm）",
                    "Bの 小えだ（17cm）",
                    "Cの 小えだ（11cm）",
                    "Dの 小えだ（5cm）"
                ],
                rankedChoices: [
                    "Bの 小えだ（17cm）",
                    "Cの 小えだ（11cm）",
                    "Aの 小えだ（8cm）",
                    "Dの 小えだ（5cm）"
                ],
                explanation: "小えだの 長さは、Bの17cm、Cの11cm、Aの8cm、Dの5cmの じゅんです。"
            ),

            QuizQuestion(
                question: "みじかくなった えんぴつの 先を とがらせる どうぐは どれですか？",
                choices: [
                    "えんぴつけずり",
                    "じょうろ",
                    "コップ",
                    "ものさし"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『えんぴつけずり』です。えんぴつけずりを つかうと、えんぴつの 先を とがらせることができます。"
            ),

            QuizQuestion(
                question: "にもつを はこぶ 台車の 車りんが 丸いのは、何の ためですか？",
                choices: [
                    "水を ためるため",
                    "ころがして うごかしやすくするため",
                    "音を 小さくするためだけ",
                    "にもつを ぬらすため"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『ころがして うごかしやすくするため』です。丸い 車りんが ころがることで、台車を うごかしやすくなります。"
            ),

            QuizQuestion(
                question: "かばんの チャックを しめると、どうなりますか？",
                choices: [
                    "かばんが とうめいになる",
                    "かばんが かるくなる",
                    "開いていた ところが とじる",
                    "かばんが 水に とける"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『開いていた ところが とじる』です。チャックを しめると、かばんの 開いていた ところを とじることができます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】今の じこくを 知るために つかう どうぐを答えましょう。",
                answer: "とけい",
                acceptableAnswers: ["時計"],
                explanation: "今の じこくを 知るために つかう どうぐは『とけい』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】みぢかな ものを 『開けたり しめたりするときに つかう』『字や 絵を かくときに つかう』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "かぎ", match: "開けたり しめたりするときに つかう"),
                    QuizMatchingPair(prompt: "チャック", match: "開けたり しめたりするときに つかう"),
                    QuizMatchingPair(prompt: "えんぴつ", match: "字や 絵を かくときに つかう"),
                    QuizMatchingPair(prompt: "クレヨン", match: "字や 絵を かくときに つかう")
                ],
                categories: ["開けたり しめたりするときに つかう", "字や 絵を かくときに つかう"],
                explanation: "かぎと チャックは 開けたりしめたりするときに、えんぴつと クレヨンは 字や絵をかくときに つかいます。"
            ),

        QuizQuestion(
                question: "春の のはらで、冬より 見つけやすくなる ものは どれですか？",
                choices: [
                    "わかい 草の め",
                    "あつい こおり",
                    "つもった 雪",
                    "長い つらら"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『わかい 草の め』です。春になって あたたかくなると、草の めが 出てきます。"
            ),

            QuizQuestion(
                question: "夏の 昼に、日なたと 日かげの じめんを くらべました。ふつう、より あたたかいのは どちらですか？",
                choices: [
                    "日かげの じめん",
                    "日なたの じめん",
                    "どちらも かならず おなじ",
                    "雨で ぬれた じめん"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『日なたの じめん』です。日なたの じめんには、たいようの 光が よく あたります。"
            ),

            QuizQuestion(
                question: "秋が ふかまると、朝や 夕方の 空気は どのように かんじることが ふえますか？",
                choices: [
                    "むしあつく かんじる",
                    "まい日 まったく おなじ",
                    "ひんやり かんじる",
                    "いつも 風が とまる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『ひんやり かんじる』です。秋が ふかまると、朝や 夕方は すずしくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】秋の 夜に「リーンリーン」と なく むしを答えましょう。",
                answer: "すずむし",
                acceptableAnswers: ["スズムシ", "鈴虫"],
                explanation: "秋の 夜に「リーンリーン」と なく むしは『すずむし』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】きせつの ようすを 『あたたかい きせつ』『さむい きせつ』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "セミの ぬけがらが 見つかる", match: "あたたかい きせつ"),
                    QuizMatchingPair(prompt: "木かげで すずむ", match: "あたたかい きせつ"),
                    QuizMatchingPair(prompt: "池の 水に こおりが はる", match: "さむい きせつ"),
                    QuizMatchingPair(prompt: "あつい コートを 着る", match: "さむい きせつ")
                ],
                categories: ["あたたかい きせつ", "さむい きせつ"],
                explanation: "セミの ぬけがらや 木かげで すずむ ようすは あたたかい きせつに、池の こおりや あつい コートは さむい きせつに よく見られます。"
            ),

            QuizQuestion(
                question: "こん虫の あしは、ぜんぶで 何本 ありますか？",
                choices: [
                    "2本",
                    "4本",
                    "8本",
                    "6本"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『6本』です。こん虫には、むねから 出ている あしが 6本あります。"
            ),

            QuizQuestion(
                question: "ミミズを 見つけやすい ばしょは どこですか？",
                choices: [
                    "しめった 土の 中",
                    "空の 高い ところ",
                    "かわいた コンクリートの 上",
                    "やねの 上"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『しめった 土の 中』です。ミミズは、しめった 土の 中で 見つけやすい 生きものです。"
            ),

            QuizQuestion(
                question: "カエルが むしを つかまえる とき、長く のばす からだの ぶぶんは どれですか？",
                choices: [
                    "しっぽ",
                    "した",
                    "みみ",
                    "つの"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『した』です。カエルは 長い したを のばして、むしを つかまえます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】生きものと、みを まもる ときの うごきを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ダンゴムシ", match: "からだを 丸める"),
                    QuizMatchingPair(prompt: "カメ", match: "こうらに 首と あしを 入れる"),
                    QuizMatchingPair(prompt: "イカ", match: "すみを はく"),
                    QuizMatchingPair(prompt: "バッタ", match: "大きく とんで にげる")
                ],
                choices: [
                    "すみを はく",
                    "大きく とんで にげる",
                    "からだを 丸める",
                    "こうらに 首と あしを 入れる"
                ],
                explanation: "ダンゴムシは からだを丸め、カメは こうらに首とあしを入れ、イカは すみをはき、バッタは 大きくとんで にげます。"
            ),

            QuizQuestion.classification(
                question: "【分類】生きものを 『たまごから 生まれる』『おなかから 生まれる』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "にわとり", match: "たまごから 生まれる"),
                    QuizMatchingPair(prompt: "かえる", match: "たまごから 生まれる"),
                    QuizMatchingPair(prompt: "いぬ", match: "おなかから 生まれる"),
                    QuizMatchingPair(prompt: "ねこ", match: "おなかから 生まれる")
                ],
                categories: ["たまごから 生まれる", "おなかから 生まれる"],
                explanation: "にわとりと かえるは たまごから生まれ、いぬと ねこは お母さんの おなかから生まれます。"
            ),

            QuizQuestion(
                question: "あさがおの 花が しぼんだ あと、やがて できる ものは どれですか？",
                choices: [
                    "石ころ",
                    "はね",
                    "たね",
                    "かいがら"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『たね』です。あさがおの 花が しぼんだ あと、やがて 実の 中に たねが できます。"
            ),

            QuizQuestion(
                question: "小さな 草花を うえかえる とき、ねを きずつけにくい やり方は どれですか？",
                choices: [
                    "くきを 強く ひっぱる",
                    "ねの 土を ぜんぶ 水で おとす",
                    "ねを みじかく 切る",
                    "ねの まわりの 土ごと そっと うつす"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『ねの まわりの 土ごと そっと うつす』です。ねの まわりの 土を のこすと、ねを きずつけにくくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】たねから めが 出た あと、はじめに 開く 2まいの はを答えましょう。",
                answer: "ふたば",
                acceptableAnswers: ["双葉"],
                explanation: "たねから めが 出た あと、はじめに 開く 2まいの はを『ふたば』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】草花の ぶぶんと、おもな はたらきを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ね", match: "土の 中から 水を すう"),
                    QuizMatchingPair(prompt: "くき", match: "はや 花を ささえる"),
                    QuizMatchingPair(prompt: "は", match: "日光を うける"),
                    QuizMatchingPair(prompt: "花", match: "たねが できる もとに なる")
                ],
                choices: [
                    "日光を うける",
                    "たねが できる もとに なる",
                    "土の 中から 水を すう",
                    "はや 花を ささえる"
                ],
                explanation: "ねは 水をすい、くきは はや花をささえ、はは 日光をうけ、花は たねができる もとになります。"
            ),

            QuizQuestion.classification(
                question: "【分類】草花を 『たねから そだてる』『きゅうこんから そだてる』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "あさがお", match: "たねから そだてる"),
                    QuizMatchingPair(prompt: "ひまわり", match: "たねから そだてる"),
                    QuizMatchingPair(prompt: "チューリップ", match: "きゅうこんから そだてる"),
                    QuizMatchingPair(prompt: "すいせん", match: "きゅうこんから そだてる")
                ],
                categories: ["たねから そだてる", "きゅうこんから そだてる"],
                explanation: "あさがおと ひまわりは たねから、チューリップと すいせんは きゅうこんから そだてることができます。"
            ),

            QuizQuestion(
                question: "空の くもが ゆっくり うごくことが あるのは、なぜですか？",
                choices: [
                    "風に ながされるから",
                    "じめんが とまるから",
                    "たいようが くもを おすから",
                    "雨つぶが 下から ひっぱるから"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『風に ながされるから』です。空の くもは、風に ながされて うごくことがあります。"
            ),

            QuizQuestion(
                question: "おなじ 時間だけ 入れものを 外に おいて、雨の 強さを くらべます。何を 見ると よいですか？",
                choices: [
                    "入れものの 色",
                    "たまった 水の りょう",
                    "おいた 人の 名前",
                    "入れものの もよう"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『たまった 水の りょう』です。おなじ 時間に たまった 水の りょうを 見ると、雨の 強さを くらべられます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】雨が ふる前などに 見られる、はい色で あつい くもを答えましょう。",
                answer: "あまぐも",
                acceptableAnswers: ["雨雲"],
                explanation: "雨が ふる前などに 見られる、はい色で あつい くもを『あまぐも』といいます。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】天気や 風と、外で 見られる ようすを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "はれ", match: "かげが はっきり 見える"),
                    QuizMatchingPair(prompt: "くもり", match: "かげが うすく 見える"),
                    QuizMatchingPair(prompt: "風が 強い", match: "落ち葉が はやく うごく"),
                    QuizMatchingPair(prompt: "雨", match: "のきから 水が ながれる")
                ],
                choices: [
                    "落ち葉が はやく うごく",
                    "のきから 水が ながれる",
                    "かげが はっきり 見える",
                    "かげが うすく 見える"
                ],
                explanation: "はれでは かげがはっきり見え、くもりでは かげがうすく見えます。強い風では 落ち葉が動き、雨では のきから水が流れます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】おなじ 時間に 入れものへ たまった 雨水を、りょうの 多い じゅんに ならべましょう。",
                choices: [
                    "Aの 入れもの（6mL）",
                    "Bの 入れもの（14mL）",
                    "Cの 入れもの（3mL）",
                    "Dの 入れもの（10mL）"
                ],
                rankedChoices: [
                    "Bの 入れもの（14mL）",
                    "Dの 入れもの（10mL）",
                    "Aの 入れもの（6mL）",
                    "Cの 入れもの（3mL）"
                ],
                explanation: "雨水の りょうは、Bの14mL、Dの10mL、Aの6mL、Cの3mLの じゅんです。"
            ),

            QuizQuestion(
                question: "見つけた きのこが 食べられるか 分からない とき、どうするのが よいですか？",
                choices: [
                    "少しだけ 食べる",
                    "近くで においを かぐ",
                    "さわらずに おとなへ 知らせる",
                    "足で ける"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『さわらずに おとなへ 知らせる』です。知らない きのこには、さわったり 食べたりせず、おとなへ 知らせます。"
            ),

            QuizQuestion(
                question: "おなじ 木の かわり方を、まい週 くらべるには どうすると よいですか？",
                choices: [
                    "まい回 ちがう 木を 見る",
                    "1回だけ 見て おわる",
                    "見る ばしょを まい回 かえる",
                    "おなじ 木の おなじ えだを 見て きろくする"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『おなじ 木の おなじ えだを 見て きろくする』です。見る ところを そろえると、かわり方を くらべやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】見つけた はっぱの 長さを はかる ときに つかう どうぐを答えましょう。",
                answer: "ものさし",
                acceptableAnswers: ["物差し", "じょうぎ", "定規"],
                explanation: "はっぱの 長さを はかる ときに つかう どうぐは『ものさし』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】しぜんかんさつで 『してよいこと』『してはいけないこと』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "落ち葉を ひろって 形を 見る", match: "してよいこと"),
                    QuizMatchingPair(prompt: "遠くから 鳥の 声を 聞く", match: "してよいこと"),
                    QuizMatchingPair(prompt: "知らない 実を 口に 入れる", match: "してはいけないこと"),
                    QuizMatchingPair(prompt: "ハチの すに 顔を 近づける", match: "してはいけないこと")
                ],
                categories: ["してよいこと", "してはいけないこと"],
                explanation: "落ち葉を見たり、遠くから鳥の声を聞いたりするのは よい観察です。知らない実を食べたり、ハチのすへ近づいたりしてはいけません。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】花だんで 見つけた テントウムシの 数を、多い じゅんに ならべましょう。",
                choices: [
                    "Aの 花だん（2ひき）",
                    "Bの 花だん（5ひき）",
                    "Cの 花だん（1ぴき）",
                    "Dの 花だん（4ひき）"
                ],
                rankedChoices: [
                    "Bの 花だん（5ひき）",
                    "Dの 花だん（4ひき）",
                    "Aの 花だん（2ひき）",
                    "Cの 花だん（1ぴき）"
                ],
                explanation: "テントウムシの 数は、Bの5ひき、Dの4ひき、Aの2ひき、Cの1ぴきの じゅんです。"
            ),

            QuizQuestion(
                question: "たいらな ゆかで、いちばん ころがりやすい ものは どれですか？",
                choices: [
                    "まるい ボール",
                    "四角い つみき",
                    "ひらいた ノート",
                    "けしごむ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『まるい ボール』です。まるい ボールは、たいらな ゆかでも ころがりやすい 形をしています。"
            ),

            QuizQuestion(
                question: "おなじ ガラスの コップを おなじ 強さで たたきます。より 高い 音が 出やすいのは どれですか？",
                choices: [
                    "水が 多く 入った コップ",
                    "水が 少し 入った コップ",
                    "どちらも 音が 出ない",
                    "コップの 色が こい ほう"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『水が 少し 入った コップ』です。おなじ コップなら、水が 少ない ほうが 高い 音に なりやすいです。"
            ),

            QuizQuestion(
                question: "スポンジを 手で おしてから はなすと、どうなりやすいですか？",
                choices: [
                    "石に かわる",
                    "とけて なくなる",
                    "もとの 形に もどる",
                    "光り はじめる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『もとの 形に もどる』です。スポンジは やわらかく、おしてから はなすと もとの 形に もどりやすい ものです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】紙やすりを 手で さわった ときの かんじを答えましょう。",
                answer: "ざらざら",
                acceptableAnswers: ["ざらざらしている"],
                explanation: "紙やすりを 手で さわると『ざらざら』した かんじがします。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】みぢかな ものと、力を くわえた ときなどの ようすを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ゴムひも", match: "ひくと のびる"),
                    QuizMatchingPair(prompt: "ねんど", match: "おすと 形が かわる"),
                    QuizMatchingPair(prompt: "ビー玉", match: "さかを ころがる"),
                    QuizMatchingPair(prompt: "ぬの", match: "小さく おりたためる")
                ],
                choices: [
                    "さかを ころがる",
                    "小さく おりたためる",
                    "ひくと のびる",
                    "おすと 形が かわる"
                ],
                explanation: "ゴムひもは ひくとのび、ねんどは おすと形がかわります。ビー玉は さかをころがり、ぬのは 小さくおりたためます。"
            ),

        QuizQuestion(
                question: "春になって あたたかくなると、木の めは どうなりますか？",
                choices: [
                    "ふくらむ",
                    "こおる",
                    "土の 中へ もぐる",
                    "とうめいに なる"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『ふくらむ』です。春になって あたたかくなると、木の めは ふくらみます。"
            ),

            QuizQuestion(
                question: "秋に なったことが いちばん よく分かる 公園の ようすは どれですか？",
                choices: [
                    "セミの 声が 大きく 聞こえる",
                    "どんぐりが たくさん 落ちている",
                    "雪が つもっている",
                    "チューリップが さいている"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『どんぐりが たくさん 落ちている』です。秋の 公園で よく見られる ようすです。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】冬の さむい日に、やねなどから 下へ 長く のびる こおりを答えましょう。",
                answer: "つらら",
                acceptableAnswers: ["氷柱"],
                explanation: "やねなどから 下へ 長く のびる こおりは『つらら』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】きせつと、その きせつに よく見られる ようすを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "春", match: "ウグイスの 声が 聞こえる"),
                    QuizMatchingPair(prompt: "夏", match: "入道雲が 見える"),
                    QuizMatchingPair(prompt: "秋", match: "すすきの ほが 開く"),
                    QuizMatchingPair(prompt: "冬", match: "はく 息が 白く 見える")
                ],
                choices: [
                    "はく 息が 白く 見える",
                    "すすきの ほが 開く",
                    "ウグイスの 声が 聞こえる",
                    "入道雲が 見える"
                ],
                explanation: "春は ウグイスの声、夏は 入道雲、秋は すすきの穂、冬は 白く見える息が きせつの 手がかりになります。"
            ),

            QuizQuestion.classification(
                question: "【分類】しぜんの ようすを 『春』『秋』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "つくしが 出る", match: "春"),
                    QuizMatchingPair(prompt: "たけのこが 出る", match: "春"),
                    QuizMatchingPair(prompt: "どんぐりが 落ちる", match: "秋"),
                    QuizMatchingPair(prompt: "コオロギの 声が 聞こえる", match: "秋")
                ],
                categories: ["春", "秋"],
                explanation: "つくしと たけのこは 春に 出て、どんぐりと コオロギの声は 秋に よく見られたり 聞かれたりします。"
            ),

            QuizQuestion(
                question: "ダンゴムシを 見つけやすい ばしょは どこですか？",
                choices: [
                    "日なたの かわいた すな",
                    "空の 高い ところ",
                    "石や 落ち葉の 下",
                    "水そうの 水の 中"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『石や 落ち葉の 下』です。ダンゴムシは、しめっていて くらい ばしょで 見つけやすい 生きものです。"
            ),

            QuizQuestion(
                question: "鳥が えさを ついばむ ときに つかう からだの ぶぶんは どれですか？",
                choices: [
                    "ひれ",
                    "つの",
                    "しっぽ",
                    "くちばし"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『くちばし』です。鳥は くちばしを つかって、えさを ついばみます。"
            ),

            QuizQuestion(
                question: "モンシロチョウが 花に とまる おもな わけは どれですか？",
                choices: [
                    "花の みつを すうため",
                    "土を ほるため",
                    "はねを 水で あらうため",
                    "木の 実を はこぶため"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『花の みつを すうため』です。モンシロチョウは、花に とまって みつを すいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】カタツムリが せなかに つけている、かたい ものを答えましょう。",
                answer: "から",
                acceptableAnswers: ["殻"],
                explanation: "カタツムリが せなかに つけている かたい ものは『から』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】生きものの 子どもと、おとなに なった ときの すがたを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ひよこ", match: "にわとり"),
                    QuizMatchingPair(prompt: "おたまじゃくし", match: "かえる"),
                    QuizMatchingPair(prompt: "やご", match: "とんぼ"),
                    QuizMatchingPair(prompt: "モンシロチョウの あおむし", match: "モンシロチョウ")
                ],
                choices: ["とんぼ", "モンシロチョウ", "にわとり", "かえる"],
                explanation: "ひよこは にわとり、おたまじゃくしは かえる、やごは とんぼ、モンシロチョウの あおむしは モンシロチョウに なります。"
            ),

            QuizQuestion(
                question: "あさがおの つるが まきついて、上へ のびるのを たすける ものは どれですか？",
                choices: [
                    "水たまり",
                    "しちゅう",
                    "石ころ",
                    "紙"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『しちゅう』です。あさがおの つるは、しちゅうに まきつきながら 上へ のびます。"
            ),

            QuizQuestion(
                question: "切った 花を しおれにくくする ために、まず すると よいことは どれですか？",
                choices: [
                    "強い 日ざしに おく",
                    "くきに 土を かぶせる",
                    "くきの 先を 水に つける",
                    "花びらを ぜんぶ とる"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『くきの 先を 水に つける』です。切った 花は、くきから 水を すうことができます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】花が まだ 開かず、かたく とじている すがたを答えましょう。",
                answer: "つぼみ",
                acceptableAnswers: ["蕾"],
                explanation: "花が まだ 開かず、かたく とじている すがたを『つぼみ』といいます。"
            ),

            QuizQuestion.classification(
                question: "【分類】花を 『木の 花』『草の 花』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "さくら", match: "木の 花"),
                    QuizMatchingPair(prompt: "うめ", match: "木の 花"),
                    QuizMatchingPair(prompt: "たんぽぽ", match: "草の 花"),
                    QuizMatchingPair(prompt: "チューリップ", match: "草の 花")
                ],
                categories: ["木の 花", "草の 花"],
                explanation: "さくらと うめは 木の花、たんぽぽと チューリップは 草の花です。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】あさがおの つるの 長さの きろくを、長い じゅんに ならべましょう。",
                choices: [
                    "Aの はち（12cm）",
                    "Bの はち（7cm）",
                    "Cの はち（15cm）",
                    "Dの はち（9cm）"
                ],
                rankedChoices: [
                    "Cの はち（15cm）",
                    "Aの はち（12cm）",
                    "Dの はち（9cm）",
                    "Bの はち（7cm）"
                ],
                explanation: "つるの長さは、Cのはち15cm、Aのはち12cm、Dのはち9cm、Bのはち7cmの順です。"
            ),

            QuizQuestion(
                question: "風が ふいていることを いちばん 見つけやすい ようすは どれですか？",
                choices: [
                    "とまった とけい",
                    "とじた 本",
                    "水の 入った コップ",
                    "ゆれている 木の は"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『ゆれている 木の は』です。木の葉の うごきから、風が ふいていることが 分かります。"
            ),

            QuizQuestion(
                question: "雨の日に、たての まどガラスに ついた 雨つぶは、どちらへ うごきますか？",
                choices: [
                    "上から 下へ",
                    "下から 上へ",
                    "右から 左へ だけ",
                    "その ばしょから まったく うごかない"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『上から 下へ』です。まどガラスに ついた 雨つぶは、上から 下へ 流れます。"
            ),

            QuizQuestion(
                question: "毎日の 天気を くらべる とき、そろえると よいことは どれですか？",
                choices: [
                    "見る 人の ふく",
                    "見る じこく",
                    "ノートの 色",
                    "歩く はやさ"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『見る じこく』です。毎日 おなじ じこくに 見ると、天気の かわり方を くらべやすくなります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】にわとりの 形などをして、風が ふいてくる むきを 知らせる ものを答えましょう。",
                answer: "かざみどり",
                acceptableAnswers: ["風見鶏"],
                explanation: "風が ふいてくる むきを 知らせる ものは『かざみどり』です。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】天気や 風の ようすと、見られる ものを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "そよ風", match: "草の はが 少し ゆれる"),
                    QuizMatchingPair(prompt: "強い 風", match: "木の えだが 大きく ゆれる"),
                    QuizMatchingPair(prompt: "雨", match: "じめんが ぬれる"),
                    QuizMatchingPair(prompt: "雪", match: "じめんが 白く なる")
                ],
                choices: [
                    "じめんが 白く なる",
                    "木の えだが 大きく ゆれる",
                    "じめんが ぬれる",
                    "草の はが 少し ゆれる"
                ],
                explanation: "そよ風では 草の葉が少しゆれ、強い風では 木の枝が大きくゆれます。雨では地面がぬれ、雪では地面が白くなります。"
            ),

            QuizQuestion(
                question: "小さな むしを 近くで よく 見る ときに つかう ものは どれですか？",
                choices: [
                    "はさみ",
                    "じょうろ",
                    "むしめがね",
                    "かなづち"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『むしめがね』です。小さな むしを 大きくして よく 見ることができます。"
            ),

            QuizQuestion(
                question: "おなじ ばしょに 立てた ぼうの かげを 朝と 昼に 見ると、かわる ものは どれですか？",
                choices: [
                    "じめんの 名前",
                    "ぼうの ざいりょう",
                    "空気の におい",
                    "かげの 長さや むき"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『かげの 長さや むき』です。太陽の 見える ばしょが かわると、かげも かわります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】生きものや 草花を 見て、気づいたことを 絵や 文で かく カードを答えましょう。",
                answer: "かんさつカード",
                acceptableAnswers: ["観察カード"],
                explanation: "気づいたことを 絵や文で かく カードは『かんさつカード』です。"
            ),

            QuizQuestion.classification(
                question: "【分類】しぜんを たしかめる ときに つかう からだの ぶぶんに 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "花の 色", match: "目"),
                    QuizMatchingPair(prompt: "鳥の 声", match: "耳"),
                    QuizMatchingPair(prompt: "土の におい", match: "はな（におい）"),
                    QuizMatchingPair(prompt: "石の ざらざら", match: "手")
                ],
                categories: ["目", "耳", "はな（におい）", "手"],
                explanation: "花の色は目、鳥の声は耳、土のにおいは はな（におい）、石のざらざらは手で たしかめます。"
            ),

            QuizQuestion.ranking(
                question: "【ランキング】ひろった 石の おもさの きろくを、おもい じゅんに ならべましょう。",
                choices: [
                    "白い 石（18g）",
                    "丸い 石（11g）",
                    "黒い 石（25g）",
                    "しまの 石（14g）"
                ],
                rankedChoices: [
                    "黒い 石（25g）",
                    "白い 石（18g）",
                    "しまの 石（14g）",
                    "丸い 石（11g）"
                ],
                explanation: "石のおもさは、黒い石25g、白い石18g、しまの石14g、丸い石11gの順です。"
            ),

            QuizQuestion(
                question: "こおりを 手で もつと、手は どのように かんじますか？",
                choices: [
                    "つめたい",
                    "あつい",
                    "あまい",
                    "まぶしい"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『つめたい』です。こおりは ひえているので、手で もつと つめたく かんじます。"
            ),

            QuizQuestion(
                question: "金ぞくの スプーンで つくえを かるく たたくと、どのような へんかに 気づきますか？",
                choices: [
                    "においが 出る",
                    "音が 出る",
                    "色が かわる",
                    "あじが かわる"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『音が 出る』です。スプーンで つくえを たたくと 音が 出ます。"
            ),

            QuizQuestion(
                question: "つくえの 上に おいた うすい 紙と 小石に、うちわで おなじように 風を おくると、うごきやすいのは どれですか？",
                choices: [
                    "小石だけ",
                    "どちらも おなじ",
                    "紙",
                    "どちらも うごかない"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『紙』です。うすくて かるい 紙は、小石より 風で うごきやすいです。"
            ),

            QuizQuestion.related(
                question: "【関連づけ】みぢかな ものと、おもに できている ざいりょうを 結びましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "けしごむ", match: "ゴム"),
                    QuizMatchingPair(prompt: "まどガラス", match: "ガラス"),
                    QuizMatchingPair(prompt: "ノート", match: "紙"),
                    QuizMatchingPair(prompt: "アルミかん", match: "金ぞく")
                ],
                choices: ["紙", "金ぞく", "ゴム", "ガラス"],
                explanation: "けしごむはゴム、まどガラスはガラス、ノートは紙、アルミかんは金ぞくで できています。"
            ),

            QuizQuestion.classification(
                question: "【分類】みぢかな ものを 『水を すう』『水を すわない』に 分けましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ティッシュペーパー", match: "水を すう"),
                    QuizMatchingPair(prompt: "タオル", match: "水を すう"),
                    QuizMatchingPair(prompt: "アルミホイル", match: "水を すわない"),
                    QuizMatchingPair(prompt: "ビニールぶくろ", match: "水を すわない")
                ],
                categories: ["水を すう", "水を すわない"],
                explanation: "ティッシュペーパーと タオルは 水をすい、アルミホイルと ビニールぶくろは 水をすいません。"
            )

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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika1, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika1ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika1ListView(isPresenting: .constant(false))
    }
}
