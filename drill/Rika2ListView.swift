//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika2ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "次のうち、夏に活動が活発になる動物はどれですか？",
            choices: [
                "クマ",
                "カエル",
                "カブトムシ",
                "リス"
            ],
            correctAnswerIndex: 2,
            explanation: "カブトムシは夏に活動が活発になる昆虫です。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "コスモス",
                "桜",
                "バラ"
            ],
            correctAnswerIndex: 2,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "次のうち、冬に眠る動物はどれですか？",
            choices: [
                "ウサギ",
                "ネズミ",
                "クマ",
                "リス"
            ],
            correctAnswerIndex: 2,
            explanation: "クマは冬眠する動物です。"
        ),
        QuizQuestion(
            question: "秋に葉が色づく理由はどれですか？",
            choices: [
                "日が短くなるから",
                "風が強くなるから",
                "気温が下がるから",
                "雨が多くなるから"
            ],
            correctAnswerIndex: 2,
            explanation: "気温が下がることで、秋に葉が赤や黄色に色づきます。"
        ),
        QuizQuestion(
            question: "次のうち、夏に多く見られる天気はどれですか？",
            choices: [
                "雪",
                "霧",
                "雷",
                "曇り"
            ],
            correctAnswerIndex: 2,
            explanation: "夏は雷が多く発生します。"
        ),
        QuizQuestion(
            question: "動物が冬眠する理由は何ですか？",
            choices: [
                "暖かくなるため",
                "仲間を守るため",
                "食べ物が少ないから",
                "巣を作るため"
            ],
            correctAnswerIndex: 2,
            explanation: "動物は冬になると食べ物が少なくなるため、冬眠します。"
        ),
        QuizQuestion(
            question: "次のうち、空に見える星が最もよく見えるのはどんな天気ですか？",
            choices: [
                "曇り",
                "晴れ",
                "雨",
                "雪"
            ],
            correctAnswerIndex: 2,
            explanation: "晴れた日には星がよく見えます。"
        ),
        QuizQuestion(
            question: "春に渡ってくる鳥はどれですか？",
            choices: [
                "ツバメ",
                "スズメ",
                "カラス",
                "カモ"
            ],
            correctAnswerIndex: 0,
            explanation: "ツバメは春に日本に渡ってくる鳥です。"
        ),
        QuizQuestion(
            question: "次のうち、冬に多く見られる天気はどれですか？",
            choices: [
                "晴れ",
                "曇り",
                "雪",
                "雷"
            ],
            correctAnswerIndex: 2,
            explanation: "冬には雪が多く降ることがあります。"
        ),
        QuizQuestion(
            question: "動物が冬に眠る理由はどれですか？",
            choices: [
                "暖かい場所がないから",
                "食べ物が少ないから",
                "日が短いから",
                "水が少ないから"
            ],
            correctAnswerIndex: 2,
            explanation: "動物は冬眠し、エネルギーを節約するために眠ります。"
        ),
        QuizQuestion(
            question: "夏に見られる現象はどれですか？",
            choices: [
                "霜",
                "開花",
                "雷",
                "紅葉"
            ],
            correctAnswerIndex: 2,
            explanation: "夏は雷が多く発生します。"
        ),
        QuizQuestion(
            question: "次のうち、植物が太陽の光を使って行うことは何ですか？",
            choices: [
                "呼吸",
                "成長",
                "光合成",
                "水の吸収"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は太陽の光を使って光合成を行い、栄養を作ります。"
        ),
        QuizQuestion(
            question: "次のうち、春に見られる自然現象はどれですか？",
            choices: [
                "雪が降る",
                "霧が立ち込める",
                "花が咲く",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "春には多くの花が咲き始めます。"
        ),
        QuizQuestion(
            question: "動物が冬眠をする理由はどれですか？",
            choices: [
                "仲間と過ごすため",
                "食べ物が少ないから",
                "暖かくするため",
                "体を休めるため"
            ],
            correctAnswerIndex: 2,
            explanation: "動物は冬になると食べ物が少なくなるため、冬眠します。"
        ),
        QuizQuestion(
            question: "次のうち、秋に木の葉が落ちる理由はどれですか？",
            choices: [
                "風が強いから",
                "雨が多いから",
                "気温が下がるから",
                "日が長くなるから"
            ],
            correctAnswerIndex: 2,
            explanation: "気温が下がると、木の葉は色づいて落ち始めます。"
        ),
        QuizQuestion(
            question: "次のうち、秋に実がなる植物はどれですか？",
            choices: [
                "桜",
                "ススキ",
                "柿",
                "梅"
            ],
            correctAnswerIndex: 2,
            explanation: "柿は秋に実をつける植物です。"
        ),
        QuizQuestion(
            question: "次のうち、植物が水を吸い上げる部分はどれですか？",
            choices: [
                "葉",
                "根",
                "茎",
                "花"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は根から水を吸い上げますが、それを茎を通して運びます。"
        ),
        QuizQuestion(
            question: "次のうち、空気中に最も多く含まれている気体はどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水蒸気"
            ],
            correctAnswerIndex: 2,
            explanation: "空気中には窒素が最も多く含まれています。"
        ),
        QuizQuestion(
            question: "次のうち、夏に多く見られる自然現象はどれですか？",
            choices: [
                "霧",
                "霜",
                "雷",
                "雪"
            ],
            correctAnswerIndex: 2,
            explanation: "夏には雷が多く発生します。"
        ),
        QuizQuestion(
            question: "冬に見られる現象はどれですか？",
            choices: [
                "紅葉",
                "開花",
                "霜",
                "発芽"
            ],
            correctAnswerIndex: 2,
            explanation: "冬の朝には霜がよく見られます。"
        ),
        QuizQuestion(
            question: "次のうち、秋に実がなる植物はどれですか？",
            choices: [
                "桜",
                "梅",
                "柿",
                "ひまわり"
            ],
            correctAnswerIndex: 2,
            explanation: "柿は秋に実をつける植物です。"
        ),
        QuizQuestion(
            question: "次のうち、夜に空に見える星が最もよく見えるのはどんな天気ですか？",
            choices: [
                "曇り",
                "晴れ",
                "雨",
                "雪"
            ],
            correctAnswerIndex: 3,
            explanation: "晴れた夜には星がよく見えますが、雪の夜は星が隠れてしまいます。"
        ),
        QuizQuestion(
            question: "次のうち、植物が光合成に必要なものはどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "アルゴン"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は二酸化炭素と水を使って光合成を行います。"
        ),
        QuizQuestion(
            question: "春に動物が活動を再開する理由はどれですか？",
            choices: [
                "食べ物が増えるから",
                "日が長くなるから",
                "暖かくなるから",
                "雨が多くなるから"
            ],
            correctAnswerIndex: 2,
            explanation: "春に暖かくなることで、動物は冬眠から目覚めて活動を再開します。"
        ),
        QuizQuestion(
            question: "次のうち、冬に見られる植物はどれですか？",
            choices: [
                "ひまわり",
                "松",
                "桜",
                "コスモス"
            ],
            correctAnswerIndex: 1,
            explanation: "松は冬でも緑の葉を保つ常緑樹です。"
        ),
        QuizQuestion(
            question: "春に動物が活動を再開する理由は何ですか？",
            choices: [
                "雨が多くなるから",
                "日が長くなるから",
                "食べ物が増えるから",
                "暖かくなるから"
            ],
            correctAnswerIndex: 3,
            explanation: "春に暖かくなることで、動物は活動を再開します。"
        ),
        QuizQuestion(
            question: "次のうち、夜行性の動物はどれですか？",
            choices: [
                "ウサギ",
                "フクロウ",
                "リス",
                "カラス"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは夜に活動する夜行性の動物です。"
        ),
        QuizQuestion(
            question: "次のうち、水が凍る温度はどれですか？",
            choices: [
                "5度",
                "0度",
                "10度",
                "20度"
            ],
            correctAnswerIndex: 1,
            explanation: "水は0度で凍ります。"
        ),
        QuizQuestion(
            question: "次のうち、秋に葉が色づく現象はどれですか？",
            choices: [
                "開花",
                "発芽",
                "紅葉",
                "落葉"
            ],
            correctAnswerIndex: 2,
            explanation: "秋には紅葉と呼ばれる現象で葉が色づきます。"
        ),
        QuizQuestion(
            question: "次のうち、夏に多く見られる天気はどれですか？",
            choices: [
                "雪",
                "霧",
                "晴れ",
                "雷"
            ],
            correctAnswerIndex: 3,
            explanation: "夏には雷が多く発生します。"
        ),
        QuizQuestion(
            question: "植物が太陽の光を利用して行うことは何ですか？",
            choices: [
                "呼吸",
                "光合成",
                "成長",
                "花を咲かせる"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は太陽の光を利用して光合成を行います。"
        ),
        QuizQuestion(
            question: "次のうち、秋に実をつける植物はどれですか？",
            choices: [
                "チューリップ",
                "柿",
                "ひまわり",
                "スイカ"
            ],
            correctAnswerIndex: 1,
            explanation: "柿は秋に実をつける植物です。"
        ),
        QuizQuestion(
            question: "次のうち、春に咲く花はどれですか？",
            choices: [
                "ヒマワリ",
                "チューリップ",
                "コスモス",
                "バラ"
            ],
            correctAnswerIndex: 1,
            explanation: "チューリップは春に咲く花です。"
        ),
        QuizQuestion(
            question: "動物が冬眠をする主な理由は何ですか？",
            choices: [
                "暖かい場所を見つけるため",
                "食べ物が少ないから",
                "体を休めるため",
                "天気が悪いから"
            ],
            correctAnswerIndex: 1,
            explanation: "冬眠は、食べ物が少なくなるために行われます。"
        ),
        QuizQuestion(
            question: "夏に見られる天気はどれですか？",
            choices: [
                "雪",
                "雷",
                "曇り",
                "晴れ"
            ],
            correctAnswerIndex: 1,
            explanation: "夏には雷が発生しやすいです。"
        ),
        QuizQuestion(
            question: "次のうち、植物が水を吸い上げる部分はどれですか？",
            choices: [
                "葉",
                "茎",
                "根",
                "花"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は根から水を吸い上げます。"
        ),
        QuizQuestion(
            question: "冬に見られる現象はどれですか？",
            choices: [
                "紅葉",
                "霜",
                "開花",
                "発芽"
            ],
            correctAnswerIndex: 1,
            explanation: "冬の朝には霜がよく見られます。"
        ),
        QuizQuestion(
            question: "次のうち、空に見える星が最もよく見えるのはどんな天気ですか？",
            choices: [
                "曇り",
                "晴れ",
                "雨",
                "雪"
            ],
            correctAnswerIndex: 1,
            explanation: "晴れた夜には星がよく見えます。"
        ),
        QuizQuestion(
            question: "次のうち、秋に実をつける植物はどれですか？",
            choices: [
                "桜",
                "柿",
                "ひまわり",
                "チューリップ"
            ],
            correctAnswerIndex: 1,
            explanation: "柿は秋に実をつける植物です。"
        ),
        QuizQuestion(
            question: "春に木の芽が出る現象を何と言いますか？",
            choices: [
                "開花",
                "発芽",
                "紅葉",
                "結実"
            ],
            correctAnswerIndex: 1,
            explanation: "春には木々が発芽し、芽を出します。"
        ),
        QuizQuestion(
            question: "次のうち、冬に見られる天気はどれですか？",
            choices: [
                "雨",
                "雪",
                "曇り",
                "晴れ"
            ],
            correctAnswerIndex: 1,
            explanation: "冬には雪がよく降ります。"
        ),
        QuizQuestion(
            question: "春に花を咲かせる植物はどれですか？",
            choices: [
                "もみじ",
                "ひまわり",
                "桜",
                "ツバキ"
            ],
            correctAnswerIndex: 2,
            explanation: "桜は春に花を咲かせる代表的な植物です。"
        ),
        QuizQuestion(
            question: "動物が冬眠をする主な理由はどれですか？",
            choices: [
                "体を休めるため",
                "暖かい場所を見つけるため",
                "食べ物が少なくなるため",
                "仲間と過ごすため"
            ],
            correctAnswerIndex: 2,
            explanation: "動物は冬に食べ物が少なくなるため、冬眠します。"
        ),
        QuizQuestion(
            question: "夏に多く見られる昆虫はどれですか？",
            choices: [
                "カマキリ",
                "カブトムシ",
                "トンボ",
                "アリ"
            ],
            correctAnswerIndex: 1,
            explanation: "カブトムシは夏に多く見られる昆虫です。"
        ),
        QuizQuestion(
            question: "次のうち、光を通さない物はどれですか？",
            choices: [
                "ガラス",
                "木",
                "水",
                "プラスチック"
            ],
            correctAnswerIndex: 1,
            explanation: "木は光を通さない物です。"
        ),
        QuizQuestion(
            question: "次のうち、空気中に最も多く含まれている気体はどれですか？",
            choices: [
                "酸素",
                "窒素",
                "二酸化炭素",
                "アルゴン"
            ],
            correctAnswerIndex: 1,
            explanation: "空気の大部分は窒素でできています。"
        ),
        QuizQuestion(
            question: "次のうち、秋に葉が色づく現象はどれですか？",
            choices: [
                "落葉",
                "紅葉",
                "開花",
                "発芽"
            ],
            correctAnswerIndex: 1,
            explanation: "秋には葉が赤や黄色に変わる紅葉が見られます。"
        ),
        QuizQuestion(
            question: "次のうち、植物が光合成に必要なものはどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "アルゴン"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は二酸化炭素と水を使って光合成を行います。"
        ),
        QuizQuestion(
            question: "次のうち、秋に見られる植物はどれですか？",
            choices: [
                "ひまわり",
                "ススキ",
                "桜",
                "ツバキ"
            ],
            correctAnswerIndex: 1,
            explanation: "ススキは秋に見られる代表的な植物です。"
        ),
        QuizQuestion(
            question: "次のうち、冬に水が凍るときの温度はどれですか？",
            choices: [
                "10度",
                "0度",
                "20度",
                "5度"
            ],
            correctAnswerIndex: 1,
            explanation: "水は0度で凍ります。"
        ),
        QuizQuestion(
            question: "動物が冬眠をする主な理由はどれですか？",
            choices: [
                "暖かい場所を見つけるため",
                "食べ物が少なくなるため",
                "仲間と過ごすため",
                "体を休めるため"
            ],
            correctAnswerIndex: 1,
            explanation: "動物は冬に食べ物が少なくなるため、冬眠をします。"
        ),
        QuizQuestion(
            question: "次のうち、春に見られる現象はどれですか？",
            choices: [
                "雪が降る",
                "雷が鳴る",
                "花が咲く",
                "風が強く吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "春には花が咲き始める現象が多く見られます。"
        ),
        QuizQuestion(
            question: "夏に日が一番長くなる日はどれですか？",
            choices: [
                "冬至",
                "秋分",
                "夏至",
                "春分"
            ],
            correctAnswerIndex: 2,
            explanation: "夏至は、1年の中で日が最も長くなる日です。"
        ),
        QuizQuestion(
            question: "次のうち、夜行性の動物はどれですか？",
            choices: [
                "スズメ",
                "フクロウ",
                "ハト",
                "リス"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは夜に活動する夜行性の動物です。"
        ),
        QuizQuestion(
            question: "次のうち、晴れた日に空に見えるものはどれですか？",
            choices: [
                "雷",
                "雪",
                "青い空",
                "霧"
            ],
            correctAnswerIndex: 2,
            explanation: "晴れた日には青い空が広がります。"
        ),
        QuizQuestion(
            question: "次のうち、春に渡ってくる鳥はどれですか？",
            choices: [
                "カモ",
                "スズメ",
                "ツバメ",
                "カラス"
            ],
            correctAnswerIndex: 2,
            explanation: "ツバメは春になると日本に渡ってきます。"
        ),
        QuizQuestion(
            question: "冬に葉が落ちる木はどれですか？",
            choices: [
                "松",
                "イチョウ",
                "スギ",
                "ヒノキ"
            ],
            correctAnswerIndex: 1,
            explanation: "イチョウは落葉樹で、冬になると葉が落ちます。"
        ),
        QuizQuestion(
            question: "次のうち、雨が降ると見えなくなるものはどれですか？",
            choices: [
                "雲",
                "太陽",
                "虹",
                "風"
            ],
            correctAnswerIndex: 1,
            explanation: "雨の日には太陽が見えなくなります。"
        ),
        QuizQuestion(
            question: "夏に多く見られる昆虫はどれですか？",
            choices: [
                "カマキリ",
                "トンボ",
                "カブトムシ",
                "アリ"
            ],
            correctAnswerIndex: 2,
            explanation: "カブトムシは夏に多く見られる昆虫です。"
        ),
        QuizQuestion(
            question: "次のうち、植物が水を吸収するのに使う部分はどれですか？",
            choices: [
                "葉",
                "根",
                "茎",
                "花"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は根から水を吸収します。"
        ),
        QuizQuestion(
            question: "次のうち、冬に見られる天気はどれですか？",
            choices: [
                "晴れ",
                "雪",
                "曇り",
                "雨"
            ],
            correctAnswerIndex: 1,
            explanation: "冬には雪が多く降ります。"
        ),
        QuizQuestion(
            question: "次のうち、夜行性の動物はどれですか？",
            choices: [
                "ネズミ",
                "リス",
                "スズメ",
                "カラス"
            ],
            correctAnswerIndex: 0,
            explanation: "ネズミは夜に活動する夜行性の動物です。"
        ),
        QuizQuestion(
            question: "次のうち、秋に実がなる植物はどれですか？",
            choices: [
                "桜",
                "柿",
                "梅",
                "スイカ"
            ],
            correctAnswerIndex: 1,
            explanation: "柿は秋に実がなる代表的な植物です。"
        ),
        QuizQuestion(
            question: "次のうち、動物が冬眠する理由はどれですか？",
            choices: [
                "食べ物が少ないから",
                "天気が悪いから",
                "日が短いから",
                "水が凍るから"
            ],
            correctAnswerIndex: 0,
            explanation: "動物は冬に食べ物が少なくなるため、冬眠します。"
        ),
        QuizQuestion(
            question: "次のうち、昼間に空に見えるものはどれですか？",
            choices: [
                "月",
                "星",
                "太陽",
                "雲"
            ],
            correctAnswerIndex: 2,
            explanation: "昼間には太陽が空に見えます。"
        ),
        QuizQuestion(
            question: "動物が冬に眠る理由はどれですか？",
            choices: [
                "暖かい場所がないから",
                "食べ物が少ないから",
                "日が短いから",
                "雨が多いから"
            ],
            correctAnswerIndex: 1,
            explanation: "冬眠するのは、冬に食べ物が少なくなるためです。"
        ),
        QuizQuestion(
            question: "春に花を咲かせる植物はどれですか？",
            choices: [
                "もみじ",
                "ひまわり",
                "桜",
                "ススキ"
            ],
            correctAnswerIndex: 2,
            explanation: "桜は春に花を咲かせる代表的な植物です。"
        ),
        QuizQuestion(
            question: "次のうち、動物が冬に使うエネルギーの元は何ですか？",
            choices: [
                "太陽の光",
                "食べ物を食べて蓄えた脂肪",
                "植物の葉",
                "水"
            ],
            correctAnswerIndex: 1,
            explanation: "動物は冬眠前に食べ物を食べ、脂肪を蓄えてエネルギーとします。"
        ),
        QuizQuestion(
            question: "次のうち、夏に見られる自然現象はどれですか？",
            choices: [
                "虹",
                "霜",
                "雪",
                "雷"
            ],
            correctAnswerIndex: 3,
            explanation: "夏には雷が多く発生します。"
        ),
        QuizQuestion(
            question: "植物が水を吸い上げるために使う部分はどれですか？",
            choices: [
                "葉",
                "茎",
                "根",
                "花"
            ],
            correctAnswerIndex: 2,
            explanation: "植物は根から水を吸い上げます。"
        ),
        QuizQuestion(
            question: "秋に木の葉が落ちる理由はどれですか？",
            choices: [
                "気温が低くなるから",
                "日が長くなるから",
                "雨が多くなるから",
                "風が吹くから"
            ],
            correctAnswerIndex: 0,
            explanation: "気温が下がると、木の葉は落ち始めます。"
        ),
        QuizQuestion(
            question: "次のうち、空気中に最も多く含まれる気体はどれですか？",
            choices: [
                "酸素",
                "窒素",
                "二酸化炭素",
                "アルゴン"
            ],
            correctAnswerIndex: 1,
            explanation: "空気の大部分は窒素です。"
        ),
        QuizQuestion(
            question: "次のうち、春に見られる植物はどれですか？",
            choices: [
                "ひまわり",
                "桜",
                "もみじ",
                "ススキ"
            ],
            correctAnswerIndex: 1,
            explanation: "桜は春に咲く代表的な植物です。"
        ),
        QuizQuestion(
            question: "次のうち、秋に実がなる植物はどれですか？",
            choices: [
                "松",
                "柿",
                "ひまわり",
                "桜"
            ],
            correctAnswerIndex: 1,
            explanation: "柿は秋に実がなる植物です。"
        ),
        QuizQuestion(
            question: "次のうち、空気中に多く含まれている気体はどれですか？",
            choices: [
                "酸素",
                "二酸化炭素",
                "窒素",
                "水素"
            ],
            correctAnswerIndex: 2,
            explanation: "空気中には窒素が最も多く含まれています。"
        ),
        QuizQuestion(
            question: "夏に多く見られる天気はどれですか？",
            choices: [
                "雪",
                "晴れ",
                "霧",
                "雷"
            ],
            correctAnswerIndex: 3,
            explanation: "夏は雷が多く発生することがあります。"
        ),
        QuizQuestion(
            question: "次のうち、水を吸収する部分はどれですか？",
            choices: [
                "葉",
                "根",
                "茎",
                "花"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は根から水を吸収します。"
        ),
        QuizQuestion(
            question: "次のうち、動物が空を飛ぶために使うものはどれですか？",
            choices: [
                "足",
                "羽",
                "尾",
                "ヒレ"
            ],
            correctAnswerIndex: 1,
            explanation: "動物は羽を使って空を飛びます。"
        ),
        QuizQuestion(
            question: "次のうち、動物が冬に活動を休む理由はどれですか？",
            choices: [
                "暖かい場所がないから",
                "食べ物が少ないから",
                "日が短いから",
                "天気が悪いから"
            ],
            correctAnswerIndex: 1,
            explanation: "冬には食べ物が少なくなるため、動物は冬眠します。"
        ),
        QuizQuestion(
            question: "夜に見える星の数が多くなるのはどんな天気の日ですか？",
            choices: [
                "曇りの日",
                "晴れの日",
                "雨の日",
                "雪の日"
            ],
            correctAnswerIndex: 1,
            explanation: "晴れた日には星が多く見えます。"
        ),
        QuizQuestion(
            question: "どの植物が秋に紅葉することが多いですか？",
            choices: [
                "もみじ",
                "ひまわり",
                "桜",
                "稲"
            ],
            correctAnswerIndex: 0,
            explanation: "もみじは秋に美しい紅葉を見せる植物です。"
        ),
        QuizQuestion(
            question: "次のうち、冬に活動が鈍くなる動物はどれですか？",
            choices: [
                "クマ",
                "カラス",
                "ウサギ",
                "犬"
            ],
            correctAnswerIndex: 0,
            explanation: "クマは冬に冬眠し、活動が鈍くなります。"
        ),
        QuizQuestion(
            question: "夏に多く見られる虫はどれですか？",
            choices: [
                "カブトムシ",
                "アリ",
                "セミ",
                "クモ"
            ],
            correctAnswerIndex: 2,
            explanation: "セミは夏によく見られる虫です。"
        ),
        QuizQuestion(
            question: "次のうち、光を通さない物はどれですか？",
            choices: [
                "石",
                "ガラス",
                "水",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "石は光を通さない物です。"
        ),
        QuizQuestion(
            question: "動物が冬に冬眠する理由は何ですか？",
            choices: [
                "寒さに耐えるため",
                "食べ物が少ないから",
                "日が短いから",
                "夜が長いから"
            ],
            correctAnswerIndex: 1,
            explanation: "冬眠は、食べ物が少なくなるため、エネルギーを節約するために行われます。"
        ),
        QuizQuestion(
            question: "次のうち、夏に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "梅",
                "桜",
                "コスモス"
            ],
            correctAnswerIndex: 0,
            explanation: "ひまわりは夏に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "次のうち、水が蒸発しやすいのはどんな天気の日ですか？",
            choices: [
                "晴れた日",
                "曇りの日",
                "雨の日",
                "雪の日"
            ],
            correctAnswerIndex: 0,
            explanation: "晴れた日は温度が上がり、水が蒸発しやすくなります。"
        ),
        QuizQuestion(
            question: "次のうち、木の葉が一年中落ちない植物はどれですか？",
            choices: [
                "松",
                "イチョウ",
                "桜",
                "もみじ"
            ],
            correctAnswerIndex: 0,
            explanation: "松は一年中葉が落ちない常緑樹です。"
        ),
        QuizQuestion(
            question: "夏に多く見られる天気はどれですか？",
            choices: [
                "晴れ",
                "雪",
                "曇り",
                "雷"
            ],
            correctAnswerIndex: 0,
            explanation: "夏は晴れの日が多い季節です。"
        ),
        QuizQuestion(
            question: "次のうち、水に溶けやすい物質はどれですか？",
            choices: [
                "砂糖",
                "砂",
                "鉄",
                "木"
            ],
            correctAnswerIndex: 0,
            explanation: "砂糖は水に溶けやすい物質です。"
        ),
        QuizQuestion(
            question: "秋に葉が赤くなる現象を何と言いますか？",
            choices: [
                "紅葉",
                "黄変",
                "枯葉",
                "枯れ木"
            ],
            correctAnswerIndex: 0,
            explanation: "葉が赤くなる現象を紅葉と呼びます。"
        ),
        QuizQuestion(
            question: "次のうち、春に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ひまわり",
                "コスモス",
                "梅"
            ],
            correctAnswerIndex: 0,
            explanation: "チューリップは春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "水蒸気が冷えて水になる現象を何と言いますか？",
            choices: [
                "凝結",
                "蒸発",
                "昇華",
                "融解"
            ],
            correctAnswerIndex: 0,
            explanation: "水蒸気が冷えて水になる現象を凝結と言います。"
        ),
        QuizQuestion(
            question: "次のうち、夜行性の動物はどれですか？",
            choices: [
                "コウモリ",
                "リス",
                "スズメ",
                "ウサギ"
            ],
            correctAnswerIndex: 0,
            explanation: "コウモリは夜に活動する夜行性の動物です。"
        ),
        QuizQuestion(
            question: "太陽が一番高くなる時間帯はいつですか？",
            choices: [
                "昼",
                "朝",
                "夕方",
                "夜"
            ],
            correctAnswerIndex: 0,
            explanation: "太陽は昼に一番高くなります。"
        ),
        QuizQuestion(
            question: "次のうち、冬に見られる天気はどれですか？",
            choices: [
                "雪",
                "雨",
                "雷",
                "霧"
            ],
            correctAnswerIndex: 0,
            explanation: "冬には雪がよく降ります。"
        ),
        QuizQuestion(
            question: "次のうち、夏に見られる植物はどれですか？",
            choices: [
                "ひまわり",
                "コスモス",
                "チューリップ",
                "桜"
            ],
            correctAnswerIndex: 0,
            explanation: "ひまわりは夏に見られる植物です。"
        ),
        QuizQuestion(
            question: "星が一番よく見える時間帯はいつですか？",
            choices: [
                "昼",
                "朝",
                "夕方",
                "夜"
            ],
            correctAnswerIndex: 3,
            explanation: "星は夜によく見えます。"
        ),
        QuizQuestion(
            question: "動物が冬眠をする理由はどれですか？",
            choices: [
                "食べ物が少ないから",
                "暖かい場所がないから",
                "昼が短いから",
                "天気が悪いから"
            ],
            correctAnswerIndex: 0,
            explanation: "冬眠は、食べ物が少なくなるため、エネルギーを節約するために行われます。"
        ),
        QuizQuestion(
            question: "晴れた日に空が青く見えるのはなぜですか？",
            choices: [
                "空が青い色をしているから",
                "太陽の光が散乱して青く見えるから",
                "大気に青い物質が含まれているから",
                "地球が青いから"
            ],
            correctAnswerIndex: 1,
            explanation: "太陽の光が大気中で散乱し、青い光が私たちの目に届くため、空が青く見えます。"
        ),
        QuizQuestion(
            question: "次のうち、風が吹く原因はどれですか？",
            choices: [
                "気温の差",
                "月の引力",
                "地球の自転",
                "山の高さ"
            ],
            correctAnswerIndex: 0,
            explanation: "風は、気温の差によって空気が移動することで発生します。"
        ),
        QuizQuestion(
            question: "朝露が発生するのはどんな天気の日ですか？",
            choices: [
                "晴れた日",
                "雨の日",
                "雪の日",
                "曇りの日"
            ],
            correctAnswerIndex: 0,
            explanation: "晴れた日の朝は、地面が冷え、空気中の水蒸気が冷やされて朝露が発生します。"
        ),
        QuizQuestion(
            question: "春に渡ってくる鳥はどれですか？",
            choices: [
                "ツバメ",
                "カラス",
                "カモ",
                "スズメ"
            ],
            correctAnswerIndex: 0,
            explanation: "ツバメは春に日本に渡ってくる鳥です。"
        ),
        QuizQuestion(
            question: "冬に見られる自然現象はどれですか？",
            choices: [
                "霜",
                "虹",
                "稲穂",
                "桜"
            ],
            correctAnswerIndex: 0,
            explanation: "冬には、霜がよく見られます。"
        ),
        QuizQuestion(
            question: "次のうち、秋に収穫される作物はどれですか？",
            choices: [
                "稲",
                "トマト",
                "きゅうり",
                "ナス"
            ],
            correctAnswerIndex: 0,
            explanation: "稲は秋に収穫される作物です。"
        ),
        QuizQuestion(
            question: "昼と夜の長さが同じになる日はいつですか？",
            choices: [
                "春分",
                "夏至",
                "冬至",
                "秋分"
            ],
            correctAnswerIndex: 3,
            explanation: "秋分の日と春分の日は、昼と夜の長さがほぼ同じになります。"
        ),
        QuizQuestion(
            question: "次のうち、水に浮かびやすい物はどれですか？",
            choices: [
                "木",
                "鉄",
                "石",
                "ガラス"
            ],
            correctAnswerIndex: 0,
            explanation: "木は水に浮かびやすい性質を持っています。"
        ),
        QuizQuestion(
            question: "どの季節にセミの鳴き声がよく聞こえますか？",
            choices: [
                "夏",
                "春",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 0,
            explanation: "セミは夏に鳴き声がよく聞こえる昆虫です。"
        ),
        QuizQuestion(
            question: "雨が降ったあとによく見える自然現象はどれですか？",
            choices: [
                "虹",
                "雪",
                "雷",
                "霧"
            ],
            correctAnswerIndex: 0,
            explanation: "雨が降ったあとには、虹が見えることがあります。"
        ),
        QuizQuestion(
            question: "風が強く吹くとどんな天気になることが多いですか？",
            choices: [
                "雨",
                "雪",
                "曇り",
                "晴れ"
            ],
            correctAnswerIndex: 2,
            explanation: "風が強く吹くときは、曇りや雨になることが多いです。"
        ),
        QuizQuestion(
            question: "冬にかけてどの鳥が日本に渡ってきますか？",
            choices: [
                "ツバメ",
                "カモ",
                "スズメ",
                "ハト"
            ],
            correctAnswerIndex: 1,
            explanation: "冬になると、カモが日本に渡ってきます。"
        ),
        QuizQuestion(
            question: "秋に見られる自然現象はどれですか？",
            choices: [
                "紅葉",
                "桜",
                "ヒマワリ",
                "雪"
            ],
            correctAnswerIndex: 0,
            explanation: "秋には紅葉が見られます。"
        ),
        QuizQuestion(
            question: "植物が太陽の光を使って行うことは何ですか？",
            choices: [
                "呼吸",
                "光合成",
                "成長",
                "花を咲かせる"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は太陽の光を使って光合成を行い、エネルギーを作ります。"
        ),
        QuizQuestion(
            question: "雪が降るときの気温はどれですか？",
            choices: [
                "0度以下",
                "20度",
                "15度",
                "5度"
            ],
            correctAnswerIndex: 0,
            explanation: "雪が降るときは気温が0度以下になります。"
        ),
        QuizQuestion(
            question: "次のうち、冬に枯れる植物はどれですか？",
            choices: [
                "松",
                "イチョウ",
                "桜",
                "梅"
            ],
            correctAnswerIndex: 1,
            explanation: "イチョウは冬に葉が枯れて落ちます。"
        ),
        QuizQuestion(
            question: "次のうち、夏に見られる昆虫はどれですか？",
            choices: [
                "アリ",
                "カブトムシ",
                "トンボ",
                "チョウ"
            ],
            correctAnswerIndex: 1,
            explanation: "カブトムシは夏によく見られる昆虫です。"
        ),
        QuizQuestion(
            question: "動物が冬に食べ物を蓄える理由はどれですか？",
            choices: [
                "冬は寒くて食べ物が少ないから",
                "冬は眠るから",
                "冬は雨が降るから",
                "冬は暗いから"
            ],
            correctAnswerIndex: 0,
            explanation: "冬は寒くて食べ物が少ないため、動物は食べ物を蓄えます。"
        ),
        QuizQuestion(
            question: "どの季節に桜の花が咲きますか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 0,
            explanation: "桜の花は春に咲きます。"
        ),
        QuizQuestion(
            question: "星が見えやすいのはどんな天気の日ですか？",
            choices: [
                "曇り",
                "雨",
                "晴れ",
                "雪"
            ],
            correctAnswerIndex: 2,
            explanation: "晴れた日には星がよく見えます。"
        ),
        QuizQuestion(
            question: "次のうち、秋に多く見られる植物はどれですか？",
            choices: [
                "紅葉",
                "ヒマワリ",
                "サクラ",
                "タンポポ"
            ],
            correctAnswerIndex: 0,
            explanation: "紅葉は秋に見られる代表的な植物です。"
        ),
        QuizQuestion(
            question: "どの動物が冬眠をしますか？",
            choices: [
                "カエル",
                "イヌ",
                "ニワトリ",
                "ウサギ"
            ],
            correctAnswerIndex: 0,
            explanation: "カエルは寒い冬に冬眠をします。"
        ),
        QuizQuestion(
            question: "夏に見られる植物の特徴はどれですか？",
            choices: [
                "花が咲く",
                "葉が落ちる",
                "実がなる",
                "つぼみができる"
            ],
            correctAnswerIndex: 2,
            explanation: "夏には植物が実をつけることがあります。"
        ),
        QuizQuestion(
            question: "雲が低く見えるときの天気はどれですか？",
            choices: [
                "晴れ",
                "曇り",
                "雨",
                "雪"
            ],
            correctAnswerIndex: 2,
            explanation: "雲が低く見えるときは、雨が降ることが多いです。"
        ),
        QuizQuestion(
            question: "朝に東から昇るものはどれですか？",
            choices: [
                "月",
                "星",
                "太陽",
                "雲"
            ],
            correctAnswerIndex: 2,
            explanation: "太陽は東から昇り、西に沈みます。"
        ),
        QuizQuestion(
            question: "次のうち、光を反射するものはどれですか？",
            choices: [
                "鏡",
                "布",
                "紙",
                "木"
            ],
            correctAnswerIndex: 0,
            explanation: "鏡は光を反射する性質があります。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "タンポポ"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "雷がよく起こる季節はどれですか？",
            choices: [
                "春",
                "夏",
                "秋",
                "冬"
            ],
            correctAnswerIndex: 1,
            explanation: "雷は夏に多く発生します。"
        ),
        QuizQuestion(
            question: "昼間に月が見えることがあるのはどんな天気の日ですか？",
            choices: [
                "晴れ",
                "曇り",
                "雨",
                "雪"
            ],
            correctAnswerIndex: 0,
            explanation: "晴れた日には、昼間に月が見えることがあります。"
        ),
        QuizQuestion(
            question: "昆虫が卵から成虫になるまでの順番はどれですか？",
            choices: [
                "卵→幼虫→さなぎ→成虫",
                "卵→さなぎ→幼虫→成虫",
                "卵→成虫→さなぎ→幼虫",
                "卵→成虫→幼虫→さなぎ"
            ],
            correctAnswerIndex: 0,
            explanation: "昆虫は、卵→幼虫→さなぎ→成虫という順番で成長します。"
        ),
        QuizQuestion(
            question: "秋に葉が落ちる木を何といいますか？",
            choices: [
                "落葉樹",
                "常緑樹",
                "果樹",
                "花木"
            ],
            correctAnswerIndex: 0,
            explanation: "秋に葉が落ちる木は落葉樹と呼ばれます。"
        ),
        QuizQuestion(
            question: "晴れの日に見えるものはどれですか？",
            choices: [
                "青い空",
                "雨",
                "雪",
                "雷"
            ],
            correctAnswerIndex: 0,
            explanation: "晴れの日には青い空が見えます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika2, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika2ListView(isPresenting: .constant(false))
    }
}
