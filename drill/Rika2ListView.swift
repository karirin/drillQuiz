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
        QuizQuestion.fillInBlank(
            question: "【穴うめ】はるに 日本へ わたってくる鳥を ひらがなで答えましょう。",
            answer: "つばめ",
            acceptableAnswers: ["ツバメ"],
            explanation: "春に日本へ わたってくる 鳥は『つばめ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】あきに みが なる くだものの 一つを ひらがなで答えましょう。",
            answer: "かき",
            acceptableAnswers: ["柿"],
            explanation: "秋にみがなる くだものの 一つは『かき』です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】こん虫と とくちょうが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "カブトムシ", match: "つの"),
                QuizMatchingPair(prompt: "チョウ", match: "はね"),
                QuizMatchingPair(prompt: "バッタ", match: "長い あし")
            ],
            choices: ["長い あし", "はね", "つの"],
            explanation: "カブトムシは つの、チョウは はね、バッタは 長いあしが とくちょうです。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】きせつと ようすが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "春", match: "花が さく"),
                QuizMatchingPair(prompt: "夏", match: "セミが なく"),
                QuizMatchingPair(prompt: "秋", match: "葉が 色づく")
            ],
            choices: ["セミが なく", "葉が 色づく", "花が さく"],
            explanation: "春は 花、夏は セミ、秋は 色づいた葉が よく見られます。"
        ),

        QuizQuestion.classification(
            question: "【分類】どうぶつを 『冬みんする』『冬みんしない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "クマ", match: "冬みんする"),
                QuizMatchingPair(prompt: "カエル", match: "冬みんする"),
                QuizMatchingPair(prompt: "スズメ", match: "冬みんしない")
            ],
            categories: ["冬みんする", "冬みんしない"],
            explanation: "クマと カエルは 冬みんし、スズメは 冬でも かつどうします。"
        ),

        QuizQuestion.classification(
            question: "【分類】なかまを 『しょくぶつ』『どうぶつ』『こん虫』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "サクラ", match: "しょくぶつ"),
                QuizMatchingPair(prompt: "イヌ", match: "どうぶつ"),
                QuizMatchingPair(prompt: "セミ", match: "こん虫")
            ],
            categories: ["しょくぶつ", "どうぶつ", "こん虫"],
            explanation: "サクラは しょくぶつ、イヌは どうぶつ、セミは こん虫の なかまです。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】アサガオの そだちかたを じゅんに ならべましょう。",
            choices: ["花が さく", "たねを まく", "めが でる"],
            orderedChoices: ["たねを まく", "めが でる", "花が さく"],
            explanation: "アサガオは、たねを まいてから めが出て、花が さきます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】どうぶつを 体の大きいじゅんに ならべましょう。",
            choices: ["アリ", "クマ", "ウサギ"],
            rankedChoices: ["クマ", "ウサギ", "アリ"],
            explanation: "体の大きさをくらべると、クマ、ウサギ、アリの順です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ふゆに 空から ふる 白いものを ひらがなで答えましょう。",
            answer: "ゆき",
            acceptableAnswers: ["雪"],
            explanation: "冬に 空から ふる 白いものは『ゆき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】なつに 花が さく つるしょくぶつを ひらがなで答えましょう。",
            answer: "あさがお",
            acceptableAnswers: ["アサガオ", "朝顔"],
            explanation: "夏に 花がさく つる植物の 代表が『あさがお』です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】いきものと すみかが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "ザリガニ", match: "水の中"),
                QuizMatchingPair(prompt: "モグラ", match: "土の中"),
                QuizMatchingPair(prompt: "スズメ", match: "木の上")
            ],
            choices: ["木の上", "土の中", "水の中"],
            explanation: "ザリガニは 水の中、モグラは 土の中、スズメは 木の上で よくくらします。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】どうぶつと うごき方が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "カエル", match: "はねる"),
                QuizMatchingPair(prompt: "メダカ", match: "およぐ"),
                QuizMatchingPair(prompt: "カニ", match: "よこに 歩く")
            ],
            choices: ["はねる", "よこに 歩く", "およぐ"],
            explanation: "カエルは はね、メダカは およぎ、カニは よこに 歩くのが とくちょうです。"
        ),

        QuizQuestion.classification(
            question: "【分類】どうぶつを 『たまごから うまれる』『おなかから うまれる』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "メダカ", match: "たまごから うまれる"),
                QuizMatchingPair(prompt: "ねこ", match: "おなかから うまれる"),
                QuizMatchingPair(prompt: "にわとり", match: "たまごから うまれる")
            ],
            categories: ["たまごから うまれる", "おなかから うまれる"],
            explanation: "メダカや にわとりは たまご、ねこは おなかから 子どもが生まれます。"
        ),

        QuizQuestion.classification(
            question: "【分類】しょくぶつを 『たねが できる』『たねが できない』に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "あさがお", match: "たねが できる"),
                QuizMatchingPair(prompt: "こけ", match: "たねが できない"),
                QuizMatchingPair(prompt: "ひまわり", match: "たねが できる")
            ],
            categories: ["たねが できる", "たねが できない"],
            explanation: "あさがおと ひまわりは たねができ、こけは たねでは ふえません。"
        ),

        QuizQuestion.chronological(
            question: "【順番に並べる】チョウの そだち方を じゅんに ならべましょう。",
            choices: ["さなぎ", "たまご", "よう虫"],
            orderedChoices: ["たまご", "よう虫", "さなぎ"],
            explanation: "チョウは たまごから 生まれ、よう虫になってから さなぎになります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】きせつを あついじゅんに ならべましょう。",
            choices: ["ふゆ", "なつ", "はる"],
            rankedChoices: ["なつ", "はる", "ふゆ"],
            explanation: "いっぱんてきに、なつが いちばん暑く、そのつぎが はる、ふゆです。"
        ),

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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
            explanation: "冬は食べ物が少なくなるため、動物は冬眠してエネルギーを節約します。"
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
            explanation: "植物は根から水を吸い上げ、それを茎を通して運びます。"
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            question: "秋に、昼と夜の長さが同じくらいになる日はいつですか？",
            choices: [
                "春分",
                "夏至",
                "冬至",
                "秋分"
            ],
            correctAnswerIndex: 3,
            explanation: "秋分の日は、昼と夜の長さがほぼ同じになります（春分の日も同様です）。"
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

        QuizQuestion(
        question: "夏の終わりから秋の始まりに、草むらで聞こえやすくなるものはどれですか？",
        choices: [
        "コオロギやスズムシの鳴き声",
        "池の氷がわれる音",
        "ウグイスのさえずり",
        "セミのぬけがらが土にもぐる音"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『コオロギやスズムシの鳴き声』です。夏の終わりから秋にかけて、草むらでこれらの虫の鳴き声を聞きやすくなります。"
        ),

        QuizQuestion(
        question: "木の冬芽が、かたい皮やうろこのようなもので包まれている主な理由はどれですか？",
        choices: [
        "鳥に見つけてもらうため",
        "枝を重くするため",
        "中の葉や花になる部分を寒さから守るため",
        "雨水を根へ送るため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『中の葉や花になる部分を寒さから守るため』です。冬芽の外側は、寒さや乾燥から中の部分を守ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】春になって雪や氷がとけることを、答えましょう。",
        answer: "ゆきどけ",
        acceptableAnswers: ["雪どけ", "雪解け"],
        explanation: "春になって雪や氷がとけることを『ゆきどけ』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、その季節に見られやすい空気や風のようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "あたたかい風の日がふえる"),
        QuizMatchingPair(prompt: "夏", match: "むし暑く感じる日が多い"),
        QuizMatchingPair(prompt: "秋", match: "朝夕にすずしい風がふく"),
        QuizMatchingPair(prompt: "冬", match: "冷たい北風がふく")
        ],
        choices: [
        "冷たい北風がふく",
        "朝夕にすずしい風がふく",
        "むし暑く感じる日が多い",
        "あたたかい風の日がふえる"
        ],
        explanation: "春は『あたたかい風の日がふえる』、夏は『むし暑く感じる日が多い』、秋は『朝夕にすずしい風がふく』、冬は『冷たい北風がふく』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】春に校庭で見つけた花の種類を、多い順に並べましょう。",
        choices: [
        "3月5日（2種類）",
        "4月20日（9種類）",
        "3月25日（5種類）",
        "4月8日（7種類）"
        ],
        rankedChoices: [
        "4月20日（9種類）",
        "4月8日（7種類）",
        "3月25日（5種類）",
        "3月5日（2種類）"
        ],
        explanation: "花の種類が多い順は、『4月20日（9種類）』『4月8日（7種類）』『3月25日（5種類）』『3月5日（2種類）』です。"
        ),

        QuizQuestion(
        question: "部屋の窓の近くで育てた植物の茎が、窓のほうへ曲がって伸びました。主な理由はどれですか？",
        choices: [
        "窓の音を聞こうとしたから",
        "日光が当たるほうへ伸びたから",
        "根が窓を押したから",
        "葉が風を作ったから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『日光が当たるほうへ伸びたから』です。植物の茎や葉は、光がよく当たる方向へ伸びることがあります。"
        ),

        QuizQuestion(
        question: "小さなたねを土の中へ深く埋めすぎると、芽が出にくくなることがあります。主な理由はどれですか？",
        choices: [
        "たねの色が見えなくなるから",
        "土の中で花がさくから",
        "根が空へ伸びるから",
        "小さな芽が土の上まで出にくくなるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『小さな芽が土の上まで出にくくなるから』です。小さなたねには土をうすくかけ、芽が地上へ出やすくします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】花が開く前の、まだ閉じている部分を、答えましょう。",
        answer: "つぼみ",
        acceptableAnswers: ["蕾"],
        explanation: "花が開く前の、まだ閉じている部分は『つぼみ』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】木の葉を『針のように細い葉』『平たく広い葉』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "マツ", match: "針のように細い葉"),
        QuizMatchingPair(prompt: "スギ", match: "針のように細い葉"),
        QuizMatchingPair(prompt: "イチョウ", match: "平たく広い葉"),
        QuizMatchingPair(prompt: "サクラ", match: "平たく広い葉")
        ],
        categories: ["針のように細い葉", "平たく広い葉"],
        explanation: "マツとスギは『針のように細い葉』、イチョウとサクラは『平たく広い葉』に分けます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】トウモロコシのたねをまいてから実ができるまでを、順に並べましょう。",
        choices: [
        "茎の先などに花がつく",
        "たねを土にまく",
        "実のつまった穂ができる",
        "芽が出て葉がふえる"
        ],
        orderedChoices: [
        "たねを土にまく",
        "芽が出て葉がふえる",
        "茎の先などに花がつく",
        "実のつまった穂ができる"
        ],
        explanation: "『たねを土にまく』『芽が出て葉がふえる』『茎の先などに花がつく』『実のつまった穂ができる』の順です。"
        ),

        QuizQuestion(
        question: "コオロギが音を感じる耳は、体のどのあたりにありますか？",
        choices: [
        "前あし",
        "触角の先",
        "はねの先",
        "おなかの先"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『前あし』です。コオロギには、前あしに音を感じる部分があります。"
        ),

        QuizQuestion(
        question: "ミノムシの中にいる生き物は、何のなかまの幼虫ですか？",
        choices: [
        "トンボ",
        "セミ",
        "ガ",
        "バッタ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『ガ』です。ミノムシは、枝や葉で作ったみのに入ってくらすガの幼虫です。"
        ),

        QuizQuestion(
        question: "ゲンジボタルの幼虫が、水の中で食べるものはどれですか？",
        choices: [
        "クワの葉",
        "カワニナ",
        "木の実",
        "花のみつ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『カワニナ』です。ゲンジボタルの幼虫は水の中でくらし、巻き貝のカワニナを食べます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】こん虫が育ちきったすがたを、答えましょう。",
        answer: "せいちゅう",
        acceptableAnswers: ["成虫"],
        explanation: "こん虫が育ちきったすがたを『せいちゅう』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫と、そのとくちょうのある行動を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "オトシブミ", match: "葉を巻いてたまごを入れる"),
        QuizMatchingPair(prompt: "フンコロガシ", match: "ふんを丸めて運ぶ"),
        QuizMatchingPair(prompt: "アリジゴク", match: "砂にすりばち形の穴を作る"),
        QuizMatchingPair(prompt: "ミツバチ", match: "ダンスでえさの方向を仲間に知らせる")
        ],
        choices: [
        "砂にすりばち形の穴を作る",
        "ダンスでえさの方向を仲間に知らせる",
        "葉を巻いてたまごを入れる",
        "ふんを丸めて運ぶ"
        ],
        explanation: "オトシブミは『葉を巻いてたまごを入れる』、フンコロガシは『ふんを丸めて運ぶ』、アリジゴクは『砂にすりばち形の穴を作る』、ミツバチは『ダンスでえさの方向を仲間に知らせる』というとくちょうがあります。"
        ),

        QuizQuestion(
        question: "ウサギの目が顔の横についていることは、何に役立ちますか？",
        choices: [
        "土の中を見ること",
        "目を水から守ること",
        "暗い場所を明るくすること",
        "まわりを広く見わたすこと"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『まわりを広く見わたすこと』です。顔の横についた目は、近づく敵などを広いはんいで見つけるのに役立ちます。"
        ),

        QuizQuestion(
        question: "イルカが水面に出て息をするときに使う場所はどこですか？",
        choices: [
        "頭の上にある噴気孔（ふんきこう）",
        "尾びれの先",
        "むねびれの下",
        "口の中のえら"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『頭の上にある噴気孔（ふんきこう）』です。イルカは肺で呼吸し、水面に出て噴気孔から息をします。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、その体の部分の働きを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ネコ", match: "ひげでせまい場所の広さを感じる"),
        QuizMatchingPair(prompt: "ヘビ", match: "舌でにおいのもとを集める"),
        QuizMatchingPair(prompt: "コウモリ", match: "耳で返ってきた音を聞く"),
        QuizMatchingPair(prompt: "ゾウ", match: "大きな耳で体の熱をにがす")
        ],
        choices: [
        "大きな耳で体の熱をにがす",
        "耳で返ってきた音を聞く",
        "ひげでせまい場所の広さを感じる",
        "舌でにおいのもとを集める"
        ],
        explanation: "ネコは『ひげでせまい場所の広さを感じる』、ヘビは『舌でにおいのもとを集める』、コウモリは『耳で返ってきた音を聞く』、ゾウは『大きな耳で体の熱をにがす』ことに体のつくりを役立てています。"
        ),

        QuizQuestion.classification(
        question: "【分類】水中の動物を『肺で息をする』『えらで息をする』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "イルカ", match: "肺で息をする"),
        QuizMatchingPair(prompt: "クジラ", match: "肺で息をする"),
        QuizMatchingPair(prompt: "マグロ", match: "えらで息をする"),
        QuizMatchingPair(prompt: "キンギョ", match: "えらで息をする")
        ],
        categories: ["肺で息をする", "えらで息をする"],
        explanation: "イルカとクジラは『肺で息をする』、マグロとキンギョは『えらで息をする』動物です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】水そうで10秒間に進んだきょりを、長い順に並べましょう。",
        choices: [
        "ペンギン（25m）",
        "タツノオトシゴ（2m）",
        "イルカ（90m）",
        "ウミガメ（12m）"
        ],
        rankedChoices: [
        "イルカ（90m）",
        "ペンギン（25m）",
        "ウミガメ（12m）",
        "タツノオトシゴ（2m）"
        ],
        explanation: "進んだきょりが長い順は、『イルカ（90m）』『ペンギン（25m）』『ウミガメ（12m）』『タツノオトシゴ（2m）』です。"
        ),

        QuizQuestion(
        question: "空に見える雲は、主に何が集まってできていますか？",
        choices: [
        "細かな砂や土",
        "小さな水滴や氷のつぶ",
        "鳥の白い羽",
        "太陽から出たけむり"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『小さな水滴や氷のつぶ』です。雲は、空気中の小さな水滴や氷のつぶが集まって見えるものです。"
        ),

        QuizQuestion(
        question: "同じ風車が、さっきより速く回り始めました。風はどう変わったと考えられますか？",
        choices: [
        "風が止まった",
        "風向きだけが必ず北になった",
        "風が強くなった",
        "気温が必ず0℃になった"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『風が強くなった』です。同じ風車なら、風が強くなるほど速く回りやすくなります。"
        ),

        QuizQuestion(
        question: "晴れた日に外へ干したぬれたタオルが、しだいにかわくのはなぜですか？",
        choices: [
        "水がタオルの中で氷になるから",
        "水が土に変わるから",
        "タオルが水を食べるから",
        "水が水蒸気になって空気中へ出ていくから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『水が水蒸気になって空気中へ出ていくから』です。ぬれた物の水は、あたためられると水蒸気になって空気中へ出ていきます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】雨と雪がまじって空からふるものを、答えましょう。",
        answer: "みぞれ",
        acceptableAnswers: ["霙"],
        explanation: "雨と雪がまじって空からふるものは『みぞれ』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】見たり聞いたりしたようすと、分かる自然のようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "空全体が灰色の雲でおおわれている", match: "くもり"),
        QuizMatchingPair(prompt: "遠くの建物が白くかすんで見える", match: "霧"),
        QuizMatchingPair(prompt: "白くて小さな氷のつぶがぱらぱらふる", match: "あられ"),
        QuizMatchingPair(prompt: "窓がガタガタし、木の枝が大きくゆれる", match: "強い風")
        ],
        choices: [
        "強い風",
        "あられ",
        "くもり",
        "霧"
        ],
        explanation: "『空全体が灰色の雲でおおわれている』はくもり、『遠くの建物が白くかすんで見える』は霧、『白くて小さな氷のつぶがぱらぱらふる』はあられ、『窓がガタガタし、木の枝が大きくゆれる』は強い風と分かります。"
        ),

        QuizQuestion(
        question: "カタツムリのたまごから子どもがかえったとき、背中のからはどうなっていますか？",
        choices: [
        "小さなからがすでについている",
        "からはなく、大人になってから拾う",
        "鳥の羽でできたからがついている",
        "毎日ちがうからに入りかえる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『小さなからがすでについている』です。カタツムリの子どもは、小さなからをつけたすがたでたまごからかえります。"
        ),

        QuizQuestion(
        question: "アヒルのひなが育つときに見られる変化として、正しいものはどれですか？",
        choices: [
        "足がなくなって魚になる",
        "やわらかなうぶ毛から、しっかりした羽に生えかわる",
        "くちばしが根に変わる",
        "体が小さくなってたまごへ戻る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『やわらかなうぶ毛から、しっかりした羽に生えかわる』です。アヒルのひなは成長すると体が大きくなり、羽も生えそろいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】育った鳥のひなが巣をはなれることを、答えましょう。",
        answer: "すだち",
        acceptableAnswers: ["巣立ち"],
        explanation: "育った鳥のひなが巣をはなれることを『すだち』といいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】生き物の成長の記録を『長さを測る』『数を数える』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "茎の高さ", match: "長さを測る"),
        QuizMatchingPair(prompt: "葉の長さ", match: "長さを測る"),
        QuizMatchingPair(prompt: "葉の枚数", match: "数を数える"),
        QuizMatchingPair(prompt: "花の数", match: "数を数える")
        ],
        categories: ["長さを測る", "数を数える"],
        explanation: "茎の高さと葉の長さは『長さを測る』、葉の枚数と花の数は『数を数える』方法で記録します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ウミガメがたまごから育ち、親になるまでを順に並べましょう。",
        choices: [
        "海でえさを食べて大きくなる",
        "砂浜のたまごから子ガメがかえる",
        "大きく育ったメスが、砂浜へたまごをうみに来る",
        "子ガメが海へ向かう"
        ],
        orderedChoices: [
        "砂浜のたまごから子ガメがかえる",
        "子ガメが海へ向かう",
        "海でえさを食べて大きくなる",
        "大きく育ったメスが、砂浜へたまごをうみに来る"
        ],
        explanation: "『砂浜のたまごから子ガメがかえる』『子ガメが海へ向かう』『海でえさを食べて大きくなる』『大きく育ったメスが、砂浜へたまごをうみに来る』の順です。"
        ),

        QuizQuestion(
        question: "同じ場所でくらべると、冬から春へ季節が進むにつれて、日の出の時刻はどうなりやすいですか？",
        choices: [
        "早くなりやすい",
        "遅くなりやすい",
        "一日中、太陽が出なくなる",
        "毎日まったく同じになる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『早くなりやすい』です。冬から春へ季節が進むと、同じ場所では日の出の時刻がだんだん早くなります。"
        ),

        QuizQuestion(
        question: "夏に、葉がしげった木の下が日なたよりすずしく感じられる主な理由はどれですか？",
        choices: [
        "木の根が冷たい風を作るから",
        "葉が地面の熱をすべて吸い取るから",
        "葉が日光をさえぎって木かげを作るから",
        "木の幹から氷が出てくるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『葉が日光をさえぎって木かげを作るから』です。葉がしげると日光が地面へ届きにくくなり、木の下がすずしく感じられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】春に出たばかりの、やわらかくて明るい緑色の葉を、答えましょう。",
        answer: "わかば",
        acceptableAnswers: ["若葉"],
        explanation: "春に出たばかりの、やわらかくて明るい緑色の葉は『わかば』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、その季節に見つけやすい植物のようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "レンゲソウが田畑にさく"),
        QuizMatchingPair(prompt: "夏", match: "ゴーヤのつるが大きく伸びる"),
        QuizMatchingPair(prompt: "秋", match: "キンモクセイの花が香る"),
        QuizMatchingPair(prompt: "冬", match: "ナンテンの赤い実が目立つ")
        ],
        choices: [
        "キンモクセイの花が香る",
        "ナンテンの赤い実が目立つ",
        "レンゲソウが田畑にさく",
        "ゴーヤのつるが大きく伸びる"
        ],
        explanation: "春は『レンゲソウが田畑にさく』、夏は『ゴーヤのつるが大きく伸びる』、秋は『キンモクセイの花が香る』、冬は『ナンテンの赤い実が目立つ』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ木で調べた冬芽の長さを、長い順に並べましょう。",
        choices: [
        "2月10日（6mm）",
        "3月25日（18mm）",
        "1月10日（4mm）",
        "3月10日（11mm）"
        ],
        rankedChoices: [
        "3月25日（18mm）",
        "3月10日（11mm）",
        "2月10日（6mm）",
        "1月10日（4mm）"
        ],
        explanation: "冬芽が長い順は、『3月25日（18mm）』『3月10日（11mm）』『2月10日（6mm）』『1月10日（4mm）』です。"
        ),

        QuizQuestion(
        question: "植木鉢の底から根がたくさん出てきました。植物を元気に育てるための世話として、もっともよいものはどれですか？",
        choices: [
        "花や葉をすべて切り取る",
        "一回り大きな鉢へ植えかえる",
        "土を水で全部洗い流す",
        "鉢ごと暗い箱に入れる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『一回り大きな鉢へ植えかえる』です。根が広がれる場所をふやすと、植物が育ちやすくなります。"
        ),

        QuizQuestion(
        question: "まいたばかりの小さなたねへ水をやる方法として、もっともよいものはどれですか？",
        choices: [
        "強い水を一か所へ当てる",
        "芽が出るまで水をまったくやらない",
        "葉がないのに葉だけをぬらす",
        "土が動かないように、じょうろで静かに水をやる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『土が動かないように、じょうろで静かに水をやる』です。強い水を当てると、たねや土が流れてしまうことがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ミニトマトなどで、茎と葉のつけ根から出てくる新しい芽を、答えましょう。",
        answer: "わきめ",
        acceptableAnswers: ["わき芽", "脇芽"],
        explanation: "茎と葉のつけ根から出てくる新しい芽は『わきめ』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】植物を『支えにからんで伸びる』『自分の茎で立って伸びる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アサガオ", match: "支えにからんで伸びる"),
        QuizMatchingPair(prompt: "ゴーヤ", match: "支えにからんで伸びる"),
        QuizMatchingPair(prompt: "ヒマワリ", match: "自分の茎で立って伸びる"),
        QuizMatchingPair(prompt: "オクラ", match: "自分の茎で立って伸びる")
        ],
        categories: ["支えにからんで伸びる", "自分の茎で立って伸びる"],
        explanation: "アサガオとゴーヤは『支えにからんで伸びる』、ヒマワリとオクラは『自分の茎で立って伸びる』植物です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ラッカセイの花がさいてから収穫するまでを、順に並べましょう。",
        choices: [
        "土の中にさやができる",
        "黄色い花がさく",
        "株をぬいて実を収穫する",
        "花のもとから細い部分が土へ伸びる"
        ],
        orderedChoices: [
        "黄色い花がさく",
        "花のもとから細い部分が土へ伸びる",
        "土の中にさやができる",
        "株をぬいて実を収穫する"
        ],
        explanation: "『黄色い花がさく』『花のもとから細い部分が土へ伸びる』『土の中にさやができる』『株をぬいて実を収穫する』の順です。"
        ),

        QuizQuestion(
        question: "トンボの大きな目は、何に役立ちますか？",
        choices: [
        "土の中の音だけを聞く",
        "木のしるを吸う",
        "広いはんいの動きを見つける",
        "水を体の中にためる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『広いはんいの動きを見つける』です。トンボの大きな目は、まわりを広く見て、えものなどの動きを見つけるのに役立ちます。"
        ),

        QuizQuestion(
        question: "チョウのはねについている、粉のように見えるものの正体はどれですか？",
        choices: [
        "小さなうろこのようなりん粉",
        "かわいた土のつぶ",
        "花から落ちたたね",
        "細かくくだけた糸"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『小さなうろこのようなりん粉』です。チョウのはねは、たくさんの小さなりん粉でおおわれています。"
        ),

        QuizQuestion(
        question: "アリの大あごは、主に何をするときに役立ちますか？",
        choices: [
        "空を飛ぶ",
        "えさをくわえたり切ったりする",
        "水の中で息をする",
        "遠くの音を聞く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『えさをくわえたり切ったりする』です。アリは大あごを使って、えさを運んだり小さくしたりします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】こん虫が、幼虫やさなぎのすがたから成虫になって出てくることを、答えましょう。",
        answer: "うか",
        acceptableAnswers: ["羽化"],
        explanation: "こん虫が、幼虫やさなぎのすがたから成虫になって出てくることを『うか』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫やその幼虫と、身を守る方法を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アゲハチョウの幼虫", match: "頭の近くからにおいのある角を出す"),
        QuizMatchingPair(prompt: "カメムシ", match: "強いにおいを出す"),
        QuizMatchingPair(prompt: "ミノムシ", match: "枝や葉で作ったみのにかくれる"),
        QuizMatchingPair(prompt: "シャクトリムシ", match: "枝のように体を伸ばして動かずにいる")
        ],
        choices: [
        "枝や葉で作ったみのにかくれる",
        "頭の近くからにおいのある角を出す",
        "枝のように体を伸ばして動かずにいる",
        "強いにおいを出す"
        ],
        explanation: "アゲハチョウの幼虫は『頭の近くからにおいのある角を出す』、カメムシは『強いにおいを出す』、ミノムシは『枝や葉で作ったみのにかくれる』、シャクトリムシは『枝のように体を伸ばして動かずにいる』ことで身を守ります。"
        ),

        QuizQuestion(
        question: "キツツキのかたくてしっかりしたしっぽは、木の幹にとまるときに何に役立ちますか？",
        choices: [
        "木の実を切る",
        "空気を集める",
        "遠くのにおいを感じる",
        "幹に体をささえて安定させる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『幹に体をささえて安定させる』です。キツツキはしっぽを木の幹に当て、体をささえながら木をつつきます。"
        ),

        QuizQuestion(
        question: "アザラシが水にもぐるとき、鼻の穴を閉じるのは何のためですか？",
        choices: [
        "鼻から水が入るのをふせぐため",
        "水の中でにおいを強くするため",
        "鼻を長く伸ばすため",
        "海水を鼻にためるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『鼻から水が入るのをふせぐため』です。アザラシは水にもぐるときに鼻の穴を閉じ、水が入らないようにします。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】鳥と、そのくちばしに合った食べ物の取り方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "スズメ", match: "短く太いくちばしでたねをついばむ"),
        QuizMatchingPair(prompt: "サギ", match: "長くとがったくちばしで魚をとらえる"),
        QuizMatchingPair(prompt: "キツツキ", match: "かたいくちばしで木をつつき虫を探す"),
        QuizMatchingPair(prompt: "カモ", match: "平たいくちばしで水中の食べ物をすくう")
        ],
        choices: [
        "平たいくちばしで水中の食べ物をすくう",
        "かたいくちばしで木をつつき虫を探す",
        "短く太いくちばしでたねをついばむ",
        "長くとがったくちばしで魚をとらえる"
        ],
        explanation: "スズメは『短く太いくちばしでたねをついばむ』、サギは『長くとがったくちばしで魚をとらえる』、キツツキは『かたいくちばしで木をつつき虫を探す』、カモは『平たいくちばしで水中の食べ物をすくう』が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】動物を『主にひれを使って水中を進む』『主に足を使って地上を進む』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "メダカ", match: "主にひれを使って水中を進む"),
        QuizMatchingPair(prompt: "マグロ", match: "主にひれを使って水中を進む"),
        QuizMatchingPair(prompt: "イヌ", match: "主に足を使って地上を進む"),
        QuizMatchingPair(prompt: "リクガメ", match: "主に足を使って地上を進む")
        ],
        categories: ["主にひれを使って水中を進む", "主に足を使って地上を進む"],
        explanation: "メダカとマグロは『主にひれを使って水中を進む』、イヌとリクガメは『主に足を使って地上を進む』動物です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】観察カードに書かれた動物のしっぽの長さを、長い順に並べましょう。",
        choices: [
        "ネコ（30cm）",
        "ハムスター（3cm）",
        "カンガルー（120cm）",
        "リス（20cm）"
        ],
        rankedChoices: [
        "カンガルー（120cm）",
        "ネコ（30cm）",
        "リス（20cm）",
        "ハムスター（3cm）"
        ],
        explanation: "しっぽが長い順は、『カンガルー（120cm）』『ネコ（30cm）』『リス（20cm）』『ハムスター（3cm）』です。"
        ),

        QuizQuestion(
        question: "晴れた日に、空にぽっかり浮かぶ白くてふわふわした雲を何といいますか？",
        choices: [
        "雨雲",
        "わた雲",
        "霧",
        "飛行機雲"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『わた雲』です。わたのように白くふわふわした雲は、わた雲と呼ばれます。"
        ),

        QuizQuestion(
        question: "強い風で木の枝や看板が大きくゆれています。もっとも安全な行動はどれですか？",
        choices: [
        "大きな木のすぐ下で風をよける",
        "かさを開いて走る",
        "しっかりした建物の中へ入る",
        "飛ばされた物を追いかける"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『しっかりした建物の中へ入る』です。強い風のときは、木の枝や飛んでくる物から身を守れる場所へ移動します。"
        ),

        QuizQuestion(
        question: "ある日の気温は、午前8時が14℃、午前10時が18℃、正午が21℃、午後2時が24℃でした。もっとも気温が高かった時刻はどれですか？",
        choices: [
        "午前8時",
        "午前10時",
        "正午",
        "午後2時"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『午後2時』です。記録の中では、午後2時の24℃がもっとも高い気温です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】これからの天気や気温などを、テレビやインターネットなどで知らせるものを、答えましょう。",
        answer: "てんきよほう",
        acceptableAnswers: ["天気予報"],
        explanation: "これからの天気や気温などを知らせるものは『てんきよほう』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】天気と、地面や身のまわりに見られやすい変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "晴れの日が続く", match: "花だんの土がかわく"),
        QuizMatchingPair(prompt: "雨がふる", match: "道に水たまりができる"),
        QuizMatchingPair(prompt: "雪がふる", match: "地面が白くおおわれる"),
        QuizMatchingPair(prompt: "強い風がふく", match: "かれ葉が地面を転がる")
        ],
        choices: [
        "地面が白くおおわれる",
        "かれ葉が地面を転がる",
        "花だんの土がかわく",
        "道に水たまりができる"
        ],
        explanation: "晴れの日が続くと『花だんの土がかわく』、雨がふると『道に水たまりができる』、雪がふると『地面が白くおおわれる』、強い風がふくと『かれ葉が地面を転がる』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "去年ぴったりだったくつが、今年は小さくなりました。体のどこが成長したと考えられますか？",
        choices: [
        "足",
        "耳",
        "髪の毛",
        "まつげ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『足』です。足が大きく成長したため、去年のくつが小さく感じられるようになったと考えられます。"
        ),

        QuizQuestion(
        question: "カタツムリが成長して体が大きくなると、背中のからはどうなりますか？",
        choices: [
        "からだけが小さくなる",
        "体といっしょに大きくなる",
        "毎日新しいからへ取りかえる",
        "からが羽に変わる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『体といっしょに大きくなる』です。カタツムリのからは体の一部で、成長に合わせて大きくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】成長する前の小さな魚を、答えましょう。",
        answer: "ちぎょ",
        acceptableAnswers: ["稚魚"],
        explanation: "成長する前の小さな魚は『ちぎょ』と呼ばれます。"
        ),

        QuizQuestion.classification(
        question: "【分類】変化を『成長による変化』『そのときだけの変化』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "身長がのびる", match: "成長による変化"),
        QuizMatchingPair(prompt: "手のひらが大きくなる", match: "成長による変化"),
        QuizMatchingPair(prompt: "雨で服がぬれる", match: "そのときだけの変化"),
        QuizMatchingPair(prompt: "ぼうしをかぶる", match: "そのときだけの変化")
        ],
        categories: ["成長による変化", "そのときだけの変化"],
        explanation: "『身長がのびる』『手のひらが大きくなる』は成長による変化で、『雨で服がぬれる』『ぼうしをかぶる』はそのときだけの変化です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】カイコの育ち方を、はじめから順に並べましょう。",
        choices: [
        "まゆを作り、その中でさなぎになる",
        "たまご",
        "成虫のガがまゆから出る",
        "幼虫がクワの葉を食べて育つ"
        ],
        orderedChoices: [
        "たまご",
        "幼虫がクワの葉を食べて育つ",
        "まゆを作り、その中でさなぎになる",
        "成虫のガがまゆから出る"
        ],
        explanation: "『たまご』『幼虫がクワの葉を食べて育つ』『まゆを作り、その中でさなぎになる』『成虫のガがまゆから出る』の順です。"
        ),

        QuizQuestion(
        question: "春の野原で、冬には少なかった緑の草がふえてきました。主な理由はどれですか？",
        choices: [
        "あたたかくなり、草が育ち始めたから",
        "土がすべて氷に変わったから",
        "日光がまったく当たらなくなったから",
        "草が自分で別の場所から歩いてきたから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『あたたかくなり、草が育ち始めたから』です。春になると気温が上がり、草の芽や葉が育ち始めます。"
        ),

        QuizQuestion(
        question: "冬の池で、メダカの動きが夏よりゆっくりになることがあります。主な理由はどれですか？",
        choices: [
        "池の水がすべてなくなるから",
        "メダカのひれが冬だけ短くなるから",
        "水温が下がり、動きがにぶくなるから",
        "冬になるとメダカが植物に変わるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『水温が下がり、動きがにぶくなるから』です。冬は池の水が冷たくなり、メダカの動きもゆっくりになることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】春・夏・秋・冬のような、一年の自然のうつり変わりを表す言葉を、答えましょう。",
        answer: "きせつ",
        acceptableAnswers: ["季節"],
        explanation: "春・夏・秋・冬のような、一年の自然のうつり変わりを表す言葉は『きせつ』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、池やそのまわりで見られやすいようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "カエルのたまごが見つかる"),
        QuizMatchingPair(prompt: "夏", match: "スイレンの花がさく"),
        QuizMatchingPair(prompt: "秋", match: "ヨシの葉が茶色くなる"),
        QuizMatchingPair(prompt: "冬", match: "水べの草がかれて少なくなる")
        ],
        choices: [
        "ヨシの葉が茶色くなる",
        "水べの草がかれて少なくなる",
        "スイレンの花がさく",
        "カエルのたまごが見つかる"
        ],
        explanation: "春は『カエルのたまごが見つかる』、夏は『スイレンの花がさく』、秋は『ヨシの葉が茶色くなる』、冬は『水べの草がかれて少なくなる』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ場所で測った雪の深さを、深い順に並べましょう。",
        choices: [
        "3月15日（2cm）",
        "1月15日（18cm）",
        "4月1日（0cm）",
        "2月15日（11cm）"
        ],
        rankedChoices: [
        "1月15日（18cm）",
        "2月15日（11cm）",
        "3月15日（2cm）",
        "4月1日（0cm）"
        ],
        explanation: "雪が深い順は、『1月15日（18cm）』『2月15日（11cm）』『3月15日（2cm）』『4月1日（0cm）』です。"
        ),

        QuizQuestion(
        question: "植木鉢の底に穴があいている主な理由はどれですか？",
        choices: [
        "鉢を軽く飛ばすため",
        "余分な水を外へ出すため",
        "根を日光に当てるため",
        "土をすべて落とすため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『余分な水を外へ出すため』です。余分な水がたまり続けないようにすると、根が傷みにくくなります。"
        ),

        QuizQuestion(
        question: "植物の根が土の中に広がることは、どんなことに役立ちますか？",
        choices: [
        "花の色を毎日変えること",
        "葉を空から落とすこと",
        "たねを音で呼び集めること",
        "植物の体をささえ、倒れにくくすること"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『植物の体をささえ、倒れにくくすること』です。土の中に広がった根は、植物の体をしっかりささえます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】植物の根元へ水をやるときに使う、先に水の出口がついた道具を、答えましょう。",
        answer: "じょうろ",
        acceptableAnswers: ["ジョウロ", "如雨露"],
        explanation: "植物へ水をやるときに使う道具は『じょうろ』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】野菜を『茎を食べる』『花やつぼみを食べる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アスパラガス", match: "茎を食べる"),
        QuizMatchingPair(prompt: "タケノコ", match: "茎を食べる"),
        QuizMatchingPair(prompt: "ブロッコリー", match: "花やつぼみを食べる"),
        QuizMatchingPair(prompt: "カリフラワー", match: "花やつぼみを食べる")
        ],
        categories: ["茎を食べる", "花やつぼみを食べる"],
        explanation: "アスパラガスとタケノコは『茎を食べる』、ブロッコリーとカリフラワーは『花やつぼみを食べる』野菜です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】サツマイモを植えてから収穫するまでを、はじめから順に並べましょう。",
        choices: [
        "土の中のいもが太くなる",
        "苗のつるを土に植える",
        "いもを掘って収穫する",
        "葉やつるが広がる"
        ],
        orderedChoices: [
        "苗のつるを土に植える",
        "葉やつるが広がる",
        "土の中のいもが太くなる",
        "いもを掘って収穫する"
        ],
        explanation: "『苗のつるを土に植える』『葉やつるが広がる』『土の中のいもが太くなる』『いもを掘って収穫する』の順です。"
        ),

        QuizQuestion(
        question: "ミツバチの巣にある小さな部屋は、どのような形が多いですか？",
        choices: [
        "六角形",
        "三角形",
        "星形",
        "半円形"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『六角形』です。ミツバチの巣には、六角形の小さな部屋がたくさん並んでいます。"
        ),

        QuizQuestion(
        question: "アリが地面で列になって歩くことがあるのは、主に何をたどっているからですか？",
        choices: [
        "空にできたにじ",
        "仲間が残したにおい",
        "地面にうつった月の光",
        "木の葉から聞こえる歌"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『仲間が残したにおい』です。アリは仲間が地面に残したにおいをたどり、えさや巣へ向かうことがあります。"
        ),

        QuizQuestion(
        question: "モンシロチョウがたまごをうむ葉かどうかをたしかめるとき、葉の味を感じるのに使う部分はどれですか？",
        choices: [
        "はねの先",
        "おなかの横",
        "前あしの先",
        "触角の根元"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『前あしの先』です。モンシロチョウは前あしの先で葉の味を感じ、たまごをうむ葉をたしかめます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】カブトムシの幼虫が育つ、落ち葉などがくさってできた土を、答えましょう。",
        answer: "ふようど",
        acceptableAnswers: ["腐葉土"],
        explanation: "カブトムシの幼虫が育つ、落ち葉などがくさってできた土は『ふようど』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫と、冬をこすときのすがたを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カマキリ", match: "たまご"),
        QuizMatchingPair(prompt: "アゲハチョウ", match: "さなぎ"),
        QuizMatchingPair(prompt: "カブトムシ", match: "幼虫"),
        QuizMatchingPair(prompt: "ナナホシテントウ", match: "成虫")
        ],
        choices: [
        "成虫",
        "幼虫",
        "たまご",
        "さなぎ"
        ],
        explanation: "カマキリは『たまご』、アゲハチョウは『さなぎ』、カブトムシは『幼虫』、ナナホシテントウは『成虫』のすがたで冬をこします。"
        ),

        QuizQuestion(
        question: "ヤモリの足の裏にある細かなつくりは、何に役立ちますか？",
        choices: [
        "水の中で息をすること",
        "土を深く掘ること",
        "遠くの音を聞くこと",
        "壁や天井にくっついて進むこと"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『壁や天井にくっついて進むこと』です。ヤモリは足の裏の細かなつくりを使い、壁や天井を進みます。"
        ),

        QuizQuestion(
        question: "カモが尾の近くから出る油を羽にぬるのは、主に何のためですか？",
        choices: [
        "羽が水をはじきやすくなるようにするため",
        "くちばしを長くするため",
        "足の数をふやすため",
        "羽を土の色に変えるため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『羽が水をはじきやすくなるようにするため』です。油をぬった羽は水にぬれにくくなります。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、その動物が作ったり使ったりするすみかを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モグラ", match: "土の中のトンネル"),
        QuizMatchingPair(prompt: "ツバメ", match: "建物の軒下に作る泥の巣"),
        QuizMatchingPair(prompt: "リス", match: "木の穴や枝の上の巣"),
        QuizMatchingPair(prompt: "ビーバー", match: "水辺に枝で作る巣")
        ],
        choices: [
        "木の穴や枝の上の巣",
        "水辺に枝で作る巣",
        "土の中のトンネル",
        "建物の軒下に作る泥の巣"
        ],
        explanation: "モグラは『土の中のトンネル』、ツバメは『建物の軒下に作る泥の巣』、リスは『木の穴や枝の上の巣』、ビーバーは『水辺に枝で作る巣』をすみかにします。"
        ),

        QuizQuestion.classification(
        question: "【分類】動物を『植物を主に食べる』『ほかの動物を主に食べる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ウマ", match: "植物を主に食べる"),
        QuizMatchingPair(prompt: "シカ", match: "植物を主に食べる"),
        QuizMatchingPair(prompt: "ライオン", match: "ほかの動物を主に食べる"),
        QuizMatchingPair(prompt: "フクロウ", match: "ほかの動物を主に食べる")
        ],
        categories: ["植物を主に食べる", "ほかの動物を主に食べる"],
        explanation: "ウマとシカは『植物を主に食べる』、ライオンとフクロウは『ほかの動物を主に食べる』動物です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】地面に残った足あとの長さを、長い順に並べましょう。",
        choices: [
        "ネコ（4cm）",
        "ゾウ（45cm）",
        "スズメ（2cm）",
        "シカ（8cm）"
        ],
        rankedChoices: [
        "ゾウ（45cm）",
        "シカ（8cm）",
        "ネコ（4cm）",
        "スズメ（2cm）"
        ],
        explanation: "足あとが長い順は、『ゾウ（45cm）』『シカ（8cm）』『ネコ（4cm）』『スズメ（2cm）』です。"
        ),

        QuizQuestion(
        question: "霧がこく出ているとき、遠くの景色はどう見えやすくなりますか？",
        choices: [
        "いつもより大きく見える",
        "かすんで見えにくくなる",
        "すべて真っ赤に見える",
        "夜でも太陽のように光る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『かすんで見えにくくなる』です。霧は空気中の細かな水滴で、こくなると遠くの景色が見えにくくなります。"
        ),

        QuizQuestion(
        question: "温度計の目盛りを読むとき、目の高さはどこに合わせるとよいですか？",
        choices: [
        "温度計のいちばん上",
        "温度計を持つ手の高さ",
        "液の先と同じ高さ",
        "地面すれすれの高さ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『液の先と同じ高さ』です。目を液の先と同じ高さにすると、目盛りを正しく読みやすくなります。"
        ),

        QuizQuestion(
        question: "風が西から東へふいています。ふき流しの細い先は、どちらを向きますか？",
        choices: [
        "北",
        "南",
        "西",
        "東"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『東』です。ふき流しの細い先は、風が進んでいく向きを示します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】寒い朝、草や屋根の表面につく白い氷の結晶を、答えましょう。",
        answer: "しも",
        acceptableAnswers: ["霜"],
        explanation: "寒い朝、草や屋根の表面につく白い氷の結晶は『しも』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】天気の観察を『目でたしかめる』『道具ではかって数字で表す』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "空をおおう雲の広さ", match: "目でたしかめる"),
        QuizMatchingPair(prompt: "雲が動く向き", match: "目でたしかめる"),
        QuizMatchingPair(prompt: "気温", match: "道具ではかって数字で表す"),
        QuizMatchingPair(prompt: "ふった雨の量", match: "道具ではかって数字で表す")
        ],
        categories: ["目でたしかめる", "道具ではかって数字で表す"],
        explanation: "空をおおう雲の広さと雲が動く向きは『目でたしかめる』、気温とふった雨の量は『道具ではかって数字で表す』観察です。"
        ),

        QuizQuestion(
        question: "オタマジャクシがカエルへ育つとき、先に生えることが多い足はどれですか？",
        choices: [
        "後ろ足",
        "前足",
        "右の足だけ",
        "四本の足すべて"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『後ろ足』です。オタマジャクシは、まず後ろ足が生え、そのあと前足が見えるようになります。"
        ),

        QuizQuestion(
        question: "生まれたばかりの子犬は目を閉じています。育つと、まず見られる変化の一つはどれですか？",
        choices: [
        "しっぽがなくなる",
        "目が開く",
        "羽が生える",
        "えらができる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『目が開く』です。子犬は生まれてしばらくすると目が開き、まわりを見るようになります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】生き物の大きさやようすを、日付といっしょに書き残すカードを、答えましょう。",
        answer: "かんさつカード",
        acceptableAnswers: ["観察カード", "かんさつきろく", "観察記録"],
        explanation: "生き物の大きさやようすを、日付といっしょに書き残すものは『かんさつカード』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】成長を調べる方法と、わかる変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ものさしで背の高さを測る", match: "身長の変化"),
        QuizMatchingPair(prompt: "体重計に乗る", match: "体重の変化"),
        QuizMatchingPair(prompt: "同じ場所で写真を撮る", match: "体全体のすがたの変化"),
        QuizMatchingPair(prompt: "ぬけた歯の日をメモする", match: "歯の生えかわり")
        ],
        choices: [
        "歯の生えかわり",
        "体重の変化",
        "体全体のすがたの変化",
        "身長の変化"
        ],
        explanation: "ものさしでは『身長の変化』、体重計では『体重の変化』、写真では『体全体のすがたの変化』、歯の記録では『歯の生えかわり』がわかります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ザリガニが脱皮するときのようすを、はじめから順に並べましょう。",
        choices: [
        "新しいからがかたくなる",
        "古いからに割れ目ができる",
        "やわらかい体で古いからの外へ出る",
        "新しいからを広げて体が大きくなる"
        ],
        orderedChoices: [
        "古いからに割れ目ができる",
        "やわらかい体で古いからの外へ出る",
        "新しいからを広げて体が大きくなる",
        "新しいからがかたくなる"
        ],
        explanation: "『古いからに割れ目ができる』『やわらかい体で古いからの外へ出る』『新しいからを広げて体が大きくなる』『新しいからがかたくなる』の順です。"
        ),

        QuizQuestion(
        question: "春になって山の雪がとけると、ふもとの小川の水がふえることがあります。主な理由はどれですか？",
        choices: [
        "とけた雪の水が小川へ流れこむから",
        "小川の底から雪がわき出すから",
        "魚が水を運んでくるから",
        "風が水に変わるから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『とけた雪の水が小川へ流れこむから』です。春になると山の雪がとけ、その水が小川へ流れこむことがあります。"
        ),

        QuizQuestion(
        question: "秋が深まると、夏にくらべて朝や夕方に上着がほしくなるのはなぜですか？",
        choices: [
        "雨がまったくふらなくなるから",
        "昼の時間がなくなるから",
        "朝や夕方の気温が下がるから",
        "風がいつも止まるから"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『朝や夕方の気温が下がるから』です。秋が深まると朝や夕方が涼しくなり、上着がほしくなる日がふえます。"
        ),

        QuizQuestion(
        question: "寒い冬の朝、はいた息が白く見えることがあります。主な理由はどれですか？",
        choices: [
        "口から白いけむりが出るから",
        "息が雪に変わるから",
        "冬の空気が白くなるから",
        "息の中の水分が冷えて細かな水滴になるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『息の中の水分が冷えて細かな水滴になるから』です。細かな水滴に光が当たるため、息が白く見えます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】夏の午後から夕方に、急に強くふって短い時間でやむことが多い雨を、答えましょう。",
        answer: "ゆうだち",
        acceptableAnswers: ["夕立"],
        explanation: "夏の午後から夕方に、急に強くふることが多い雨は『ゆうだち』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、その季節に見聞きしやすいものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "ウグイスのさえずり"),
        QuizMatchingPair(prompt: "夏", match: "セミの大きな鳴き声"),
        QuizMatchingPair(prompt: "秋", match: "コオロギの鳴き声"),
        QuizMatchingPair(prompt: "冬", match: "北から来たハクチョウ")
        ],
        choices: [
        "コオロギの鳴き声",
        "北から来たハクチョウ",
        "ウグイスのさえずり",
        "セミの大きな鳴き声"
        ],
        explanation: "春は『ウグイスのさえずり』、夏は『セミの大きな鳴き声』、秋は『コオロギの鳴き声』、冬は『北から来たハクチョウ』を見聞きしやすくなります。"
        ),

        QuizQuestion(
        question: "ジャガイモの、ふだん食べている部分は植物のどの部分ですか？",
        choices: [
        "根",
        "土の中で太くなった茎",
        "葉",
        "花"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『土の中で太くなった茎』です。ジャガイモは、土の中にある茎の一部が太くなったものです。"
        ),

        QuizQuestion(
        question: "アサガオを育てるとき、近くにネットや支柱を用意する主な理由はどれですか？",
        choices: [
        "つるが巻きついて上へ伸びられるようにするため",
        "花を土の中にかくすため",
        "根を空中へ伸ばすため",
        "葉に日光が当たらないようにするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『つるが巻きついて上へ伸びられるようにするため』です。アサガオのつるは、ネットや支柱に巻きついて伸びます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】アサガオなどに見られる、細長く伸びてほかの物に巻きつく茎を、答えましょう。",
        answer: "つる",
        acceptableAnswers: ["蔓"],
        explanation: "細長く伸びてほかの物に巻きつく茎は『つる』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】野菜を『土の上に実ができる』『土の中の部分を食べる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ナス", match: "土の上に実ができる"),
        QuizMatchingPair(prompt: "ピーマン", match: "土の上に実ができる"),
        QuizMatchingPair(prompt: "ニンジン", match: "土の中の部分を食べる"),
        QuizMatchingPair(prompt: "サツマイモ", match: "土の中の部分を食べる")
        ],
        categories: ["土の上に実ができる", "土の中の部分を食べる"],
        explanation: "ナスとピーマンは『土の上に実ができる』、ニンジンとサツマイモは『土の中の部分を食べる』野菜です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】イチゴの実が赤くなるまでのようすを、はじめから順に並べましょう。",
        choices: [
        "緑色の小さな実ができる",
        "白い花がさく",
        "実が赤くなる",
        "花びらが落ちる"
        ],
        orderedChoices: [
        "白い花がさく",
        "花びらが落ちる",
        "緑色の小さな実ができる",
        "実が赤くなる"
        ],
        explanation: "『白い花がさく』『花びらが落ちる』『緑色の小さな実ができる』『実が赤くなる』の順です。"
        ),

        QuizQuestion(
        question: "セミが木のしるを吸うのに合った口の形はどれですか？",
        choices: [
        "平たくて大きな口",
        "かたい歯がならんだ口",
        "細い針のような口",
        "丸く広がる口"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『細い針のような口』です。セミは細い口を木にさし、木のしるを吸います。"
        ),

        QuizQuestion(
        question: "アメンボが水面をすべるように進めることに、もっとも関係する体のつくりはどれですか？",
        choices: [
        "足の先に大きなつめがある",
        "足に水をはじく細かな毛がある",
        "はらに水をためるふくろがある",
        "はねで水面を強くたたく"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『足に水をはじく細かな毛がある』です。その毛が水面にしずみにくくするのに役立ちます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】こん虫が、たまごからかえって成虫になる前のすがたを、答えましょう。",
        answer: "ようちゅう",
        acceptableAnswers: ["幼虫"],
        explanation: "こん虫が、たまごからかえって成虫になる前のすがたは『ようちゅう』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫と、たまごをうむ場所やようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウ", match: "キャベツなどの葉に一つずつうむ"),
        QuizMatchingPair(prompt: "カマキリ", match: "あわのようなかたまりにしてうむ"),
        QuizMatchingPair(prompt: "セミ", match: "細い木の枝の中にうむ"),
        QuizMatchingPair(prompt: "バッタ", match: "土の中にうむ")
        ],
        choices: [
        "土の中にうむ",
        "細い木の枝の中にうむ",
        "あわのようなかたまりにしてうむ",
        "キャベツなどの葉に一つずつうむ"
        ],
        explanation: "モンシロチョウは『キャベツなどの葉に一つずつうむ』、カマキリは『あわのようなかたまりにしてうむ』、セミは『細い木の枝の中にうむ』、バッタは『土の中にうむ』が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】こん虫を『幼虫が水の中で育つ』『幼虫が陸上で育つ』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "トンボ", match: "幼虫が水の中で育つ"),
        QuizMatchingPair(prompt: "カ", match: "幼虫が水の中で育つ"),
        QuizMatchingPair(prompt: "カブトムシ", match: "幼虫が陸上で育つ"),
        QuizMatchingPair(prompt: "モンシロチョウ", match: "幼虫が陸上で育つ")
        ],
        categories: ["幼虫が水の中で育つ", "幼虫が陸上で育つ"],
        explanation: "トンボとカは『幼虫が水の中で育つ』、カブトムシとモンシロチョウは『幼虫が陸上で育つ』こん虫です。"
        ),

        QuizQuestion(
        question: "カニの目が体からのびた柄の先についていることは、何に役立ちますか？",
        choices: [
        "土を深くほること",
        "水を飲むこと",
        "えさをかみ切ること",
        "目を動かして広くまわりを見ること"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『目を動かして広くまわりを見ること』です。カニは柄の先の目を動かし、まわりのようすを見ます。"
        ),

        QuizQuestion(
        question: "寒い海でくらすアザラシの体に、厚い脂肪がある主な理由はどれですか？",
        choices: [
        "体の熱がにげにくくなるようにするため",
        "海の水を飲みこむため",
        "岩をくだくため",
        "空を飛びやすくするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『体の熱がにげにくくなるようにするため』です。厚い脂肪は、寒い海で体を冷えにくくします。"
        ),

        QuizQuestion(
        question: "フクロウが夜、えものに気づかれにくく近づけることに役立つものはどれですか？",
        choices: [
        "水かきのある足",
        "音が出にくいやわらかな羽",
        "かたい甲ら",
        "長い鼻"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『音が出にくいやわらかな羽』です。フクロウは羽音を小さくして飛ぶことができます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、体の表面をおおうものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ヘビ", match: "うろこ"),
        QuizMatchingPair(prompt: "カメ", match: "かたい甲ら"),
        QuizMatchingPair(prompt: "ウサギ", match: "やわらかな毛"),
        QuizMatchingPair(prompt: "カエル", match: "しめった皮ふ")
        ],
        choices: [
        "しめった皮ふ",
        "やわらかな毛",
        "うろこ",
        "かたい甲ら"
        ],
        explanation: "ヘビは『うろこ』、カメは『かたい甲ら』、ウサギは『やわらかな毛』、カエルは『しめった皮ふ』で体の表面がおおわれています。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】図かんで調べた卵の長さを、長い順に並べましょう。",
        choices: [
        "ウズラ（30mm）",
        "メダカ（1mm）",
        "ダチョウ（150mm）",
        "ニワトリ（60mm）"
        ],
        rankedChoices: [
        "ダチョウ（150mm）",
        "ニワトリ（60mm）",
        "ウズラ（30mm）",
        "メダカ（1mm）"
        ],
        explanation: "卵の長さが長い順は、『ダチョウ（150mm）』『ニワトリ（60mm）』『ウズラ（30mm）』『メダカ（1mm）』です。"
        ),

        QuizQuestion(
        question: "雨がやんだあと、太陽が出ているときに、にじが見えやすい空はどちらですか？",
        choices: [
        "太陽と同じ方向の空",
        "いつも真上の空",
        "太陽と反対方向の空",
        "地面の真下"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『太陽と反対方向の空』です。太陽を背にして、雨つぶが残る空を見ると、にじが見えることがあります。"
        ),

        QuizQuestion(
        question: "夏に大きな入道雲が高く育ったとき、そのあと起こりやすい天気はどれですか？",
        choices: [
        "一日中、雲がなくなる",
        "必ず雪がふる",
        "風がまったくなくなる",
        "急な強い雨や雷になる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『急な強い雨や雷になる』です。大きく育った入道雲は、強い雨や雷をもたらすことがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】風がふいてくる向きを表す言葉を、答えましょう。",
        answer: "ふうこう",
        acceptableAnswers: ["風向"],
        explanation: "風がふいてくる向きを表す言葉は『ふうこう』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】空からふるものを『水のつぶ』『氷のつぶや結晶』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "雨", match: "水のつぶ"),
        QuizMatchingPair(prompt: "雪", match: "氷のつぶや結晶"),
        QuizMatchingPair(prompt: "あられ", match: "氷のつぶや結晶"),
        QuizMatchingPair(prompt: "ひょう", match: "氷のつぶや結晶")
        ],
        categories: ["水のつぶ", "氷のつぶや結晶"],
        explanation: "雨は『水のつぶ』、雪、あられ、ひょうは『氷のつぶや結晶』です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】風速計ではかった風の強さを、強い順に並べましょう。",
        choices: [
        "東門（毎秒3m）",
        "校庭（毎秒7m）",
        "花だん（毎秒1m）",
        "屋上（毎秒5m）"
        ],
        rankedChoices: [
        "校庭（毎秒7m）",
        "屋上（毎秒5m）",
        "東門（毎秒3m）",
        "花だん（毎秒1m）"
        ],
        explanation: "風が強い順は、『校庭（毎秒7m）』『屋上（毎秒5m）』『東門（毎秒3m）』『花だん（毎秒1m）』です。"
        ),

        QuizQuestion(
        question: "巣の中のひなが、親鳥が近づくと大きく口を開ける主な理由はどれですか？",
        choices: [
        "親鳥からえさをもらうため",
        "空気を全部飲みこむため",
        "巣をこわすため",
        "羽をぬくため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『親鳥からえさをもらうため』です。ひなは大きく口を開け、親鳥が運んできたえさをもらいます。"
        ),

        QuizQuestion(
        question: "生まれたばかりの子ネコが、主に飲んで育つものはどれですか？",
        choices: [
        "花のみつ",
        "母ネコの乳",
        "木のしる",
        "海の水"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『母ネコの乳』です。生まれたばかりの子ネコは、母ネコの乳を飲んで育ちます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】子どものころに生え、成長するとぬけて大人の歯に生えかわる歯を、答えましょう。",
        answer: "にゅうし",
        acceptableAnswers: ["乳歯"],
        explanation: "子どものころに生え、のちに大人の歯へ生えかわる歯は『にゅうし』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】成長途中の生き物と、よく食べるものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "モンシロチョウの幼虫", match: "キャベツなどの葉"),
        QuizMatchingPair(prompt: "オタマジャクシ", match: "水中の藻など"),
        QuizMatchingPair(prompt: "ツバメのひな", match: "親鳥が運ぶ小さな虫"),
        QuizMatchingPair(prompt: "子ウシ", match: "母ウシの乳")
        ],
        choices: [
        "母ウシの乳",
        "親鳥が運ぶ小さな虫",
        "水中の藻など",
        "キャベツなどの葉"
        ],
        explanation: "モンシロチョウの幼虫は『キャベツなどの葉』、オタマジャクシは『水中の藻など』、ツバメのひなは『親鳥が運ぶ小さな虫』、子ウシは『母ウシの乳』を食べたり飲んだりして育ちます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ニワトリのたまごからひよこが育つようすを、はじめから順に並べましょう。",
        choices: [
        "ひよこの羽がふえて体が大きくなる",
        "たまごを親鳥があたためる",
        "成長してニワトリになる",
        "からをわってひよこが出てくる"
        ],
        orderedChoices: [
        "たまごを親鳥があたためる",
        "からをわってひよこが出てくる",
        "ひよこの羽がふえて体が大きくなる",
        "成長してニワトリになる"
        ],
        explanation: "『たまごを親鳥があたためる』『からをわってひよこが出てくる』『ひよこの羽がふえて体が大きくなる』『成長してニワトリになる』の順です。"
        ),

        QuizQuestion(
        question: "冬の林で、葉を落とした木の下まで日光が届きやすいのはなぜですか？",
        choices: [
        "葉が少なく、枝の間から光が通りやすいから",
        "木が土の中にもぐるから",
        "冬は太陽が二つになるから",
        "枝が自分で光を出すから"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『葉が少なく、枝の間から光が通りやすいから』です。冬に葉を落とす木では、枝の間を日光が通りやすくなります。"
        ),

        QuizQuestion(
        question: "春先に同じ大きさの雪が日なたと日かげに残っていました。先にとけやすいのはどこですか？",
        choices: [
        "日かげ",
        "夜にだけ見える場所",
        "日なた",
        "どこでも必ず同時"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『日なた』です。日なたは日光であたためられるため、雪が先にとけやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】春の終わりから夏の初めにかけて、雨の日が多くなる時期を、答えましょう。",
        answer: "つゆ",
        acceptableAnswers: ["梅雨"],
        explanation: "春の終わりから夏の初めにかけて、雨の日が多くなる時期は『つゆ』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、その季節に見られやすい自然のようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "モンシロチョウが菜の花のまわりを飛ぶ"),
        QuizMatchingPair(prompt: "夏", match: "ヘチマのつるが長く伸びる"),
        QuizMatchingPair(prompt: "秋", match: "ススキの穂が風にゆれる"),
        QuizMatchingPair(prompt: "冬", match: "ロウバイが黄色い花をさかせる")
        ],
        choices: [
        "ススキの穂が風にゆれる",
        "ロウバイが黄色い花をさかせる",
        "ヘチマのつるが長く伸びる",
        "モンシロチョウが菜の花のまわりを飛ぶ"
        ],
        explanation: "春は『モンシロチョウが菜の花のまわりを飛ぶ』、夏は『ヘチマのつるが長く伸びる』、秋は『ススキの穂が風にゆれる』、冬は『ロウバイが黄色い花をさかせる』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】一本の木の下で一日に拾った落ち葉の数を、多い順に並べましょう。",
        choices: [
        "9月（8枚）",
        "11月（60枚）",
        "12月（18枚）",
        "10月（25枚）"
        ],
        rankedChoices: [
        "11月（60枚）",
        "10月（25枚）",
        "12月（18枚）",
        "9月（8枚）"
        ],
        explanation: "落ち葉の数が多い順は、『11月（60枚）』『10月（25枚）』『12月（18枚）』『9月（8枚）』です。"
        ),

        QuizQuestion(
        question: "ミニトマトの茎のそばに支柱を立てる主な理由はどれですか？",
        choices: [
        "土の色を変えるため",
        "茎が倒れないように支えるため",
        "実を土の中へ入れるため",
        "葉をすべてかくすため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『茎が倒れないように支えるため』です。支柱は、伸びた茎を支えて倒れにくくします。"
        ),

        QuizQuestion(
        question: "芽がせまい場所にたくさん出てきました。元気に育てるための世話として、もっともよいものはどれですか？",
        choices: [
        "芽の上に石を置く",
        "すべての芽を同じ場所へ集める",
        "水をまったくやめる",
        "元気な芽を残し、間をあけるように一部を抜く"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『元気な芽を残し、間をあけるように一部を抜く』です。芽の間をあけると、日光や水を受けやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】たねから出たばかりの小さな植物を、答えましょう。",
        answer: "めばえ",
        acceptableAnswers: ["芽生え"],
        explanation: "たねから出たばかりの小さな植物は『めばえ』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】野菜を『実を食べる』『葉を食べる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "トマト", match: "実を食べる"),
        QuizMatchingPair(prompt: "キュウリ", match: "実を食べる"),
        QuizMatchingPair(prompt: "コマツナ", match: "葉を食べる"),
        QuizMatchingPair(prompt: "レタス", match: "葉を食べる")
        ],
        categories: ["実を食べる", "葉を食べる"],
        explanation: "トマトとキュウリは『実を食べる』、コマツナとレタスは『葉を食べる』野菜です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ダイコンの育ち方を、はじめから順に並べましょう。",
        choices: [
        "葉がふえる",
        "たねをまく",
        "土の中の根が太くなる",
        "芽が出る"
        ],
        orderedChoices: [
        "たねをまく",
        "芽が出る",
        "葉がふえる",
        "土の中の根が太くなる"
        ],
        explanation: "『たねをまく』『芽が出る』『葉がふえる』『土の中の根が太くなる』の順に育ちます。"
        ),

        QuizQuestion(
        question: "クモの足は何本ありますか？",
        choices: [
        "6本",
        "10本",
        "8本",
        "4本"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『8本』です。クモには足が8本あり、足が6本のこん虫とは体のつくりがちがいます。"
        ),

        QuizQuestion(
        question: "ミツバチが花粉のだんごをつけて運ぶことが多い場所はどこですか？",
        choices: [
        "後ろあし",
        "触角の先",
        "はねの先",
        "おなかの中"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『後ろあし』です。ミツバチは、後ろあしに花粉を集めて巣へ運びます。"
        ),

        QuizQuestion(
        question: "コオロギは、どのようにして鳴き声を出しますか？",
        choices: [
        "地面を前あしでたたく",
        "はねをこすり合わせる",
        "口で笛のようにふく",
        "触角を木に当てる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『はねをこすり合わせる』です。コオロギは、はねをこすり合わせて音を出します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】アリが仲間とくらし、たまごや幼虫を育てる場所を、答えましょう。",
        answer: "す",
        acceptableAnswers: ["巣", "ありのす", "アリの巣"],
        explanation: "アリが仲間とくらし、たまごや幼虫を育てる場所は『す』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】大人のこん虫を『はねが2枚』『はねが4枚』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ハエ", match: "はねが2枚"),
        QuizMatchingPair(prompt: "カ", match: "はねが2枚"),
        QuizMatchingPair(prompt: "トンボ", match: "はねが4枚"),
        QuizMatchingPair(prompt: "モンシロチョウ", match: "はねが4枚")
        ],
        categories: ["はねが2枚", "はねが4枚"],
        explanation: "ハエとカは『はねが2枚』、トンボとモンシロチョウは『はねが4枚』です。"
        ),

        QuizQuestion(
        question: "カエルの後ろあしが長いのは、どんな動きに役立ちますか？",
        choices: [
        "木の実をかじる",
        "空を飛ぶ",
        "土を細かく切る",
        "遠くへ跳ぶ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『遠くへ跳ぶ』です。カエルは長い後ろあしで地面を強くけって跳びます。"
        ),

        QuizQuestion(
        question: "リスの大きくふさふさしたしっぽは、木の枝を移動するときに何に役立ちますか？",
        choices: [
        "体のバランスをとる",
        "土を深くほる",
        "水の中で息をする",
        "木を切り倒す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『体のバランスをとる』です。リスはしっぽを使って、木の上で体のバランスをとります。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】生き物と、見つけたあとや落とし物を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ネコ", match: "肉球の形が残る足あと"),
        QuizMatchingPair(prompt: "スズメ", match: "落ちた小さな羽"),
        QuizMatchingPair(prompt: "ウサギ", match: "丸いふん"),
        QuizMatchingPair(prompt: "カタツムリ", match: "光るようなねばねばしたあと")
        ],
        choices: [
        "丸いふん",
        "光るようなねばねばしたあと",
        "肉球の形が残る足あと",
        "落ちた小さな羽"
        ],
        explanation: "ネコは『肉球の形が残る足あと』、スズメは『落ちた小さな羽』、ウサギは『丸いふん』、カタツムリは『光るようなねばねばしたあと』から、いたことがわかります。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、子どもを育てるときのようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カンガルー", match: "おなかのふくろで子どもを育てる"),
        QuizMatchingPair(prompt: "ツバメ", match: "くちばしでひなにえさを運ぶ"),
        QuizMatchingPair(prompt: "ネコ", match: "子ネコの体をなめてきれいにする"),
        QuizMatchingPair(prompt: "ニホンザル", match: "子どもを体につかまらせて運ぶ")
        ],
        choices: [
        "子どもを体につかまらせて運ぶ",
        "子ネコの体をなめてきれいにする",
        "おなかのふくろで子どもを育てる",
        "くちばしでひなにえさを運ぶ"
        ],
        explanation: "カンガルーは『おなかのふくろで子どもを育てる』、ツバメは『くちばしでひなにえさを運ぶ』、ネコは『子ネコの体をなめてきれいにする』、ニホンザルは『子どもを体につかまらせて運ぶ』が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】動物を『毛でおおわれている』『羽毛でおおわれている』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "イヌ", match: "毛でおおわれている"),
        QuizMatchingPair(prompt: "ウサギ", match: "毛でおおわれている"),
        QuizMatchingPair(prompt: "カモ", match: "羽毛でおおわれている"),
        QuizMatchingPair(prompt: "スズメ", match: "羽毛でおおわれている")
        ],
        categories: ["毛でおおわれている", "羽毛でおおわれている"],
        explanation: "イヌとウサギは『毛でおおわれている』、カモとスズメは『羽毛でおおわれている』動物です。"
        ),

        QuizQuestion(
        question: "外の気温を温度計で調べるとき、置く場所としてもっともよいところはどこですか？",
        choices: [
        "日光が強く当たるコンクリートの上",
        "風通しのよい日かげ",
        "閉め切った自動車の中",
        "暖房の近く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『風通しのよい日かげ』です。直射日光や地面の熱をさけると、外の気温をくらべやすくなります。"
        ),

        QuizQuestion(
        question: "雨量計を置く場所として、もっともよいところはどこですか？",
        choices: [
        "屋根の下",
        "大きな木の真下",
        "まわりにさえぎる物がない平らな場所",
        "水が流れる坂道"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『まわりにさえぎる物がない平らな場所』です。屋根や木に雨をさえぎられない場所で調べます。"
        ),

        QuizQuestion(
        question: "雨のあと、校庭の低いところに水たまりができやすいのはなぜですか？",
        choices: [
        "低いところだけ雨が強くふるから",
        "土が低いところから空へ上がるから",
        "水が高いところへ集まるから",
        "水が高いところから低いところへ流れるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『水が高いところから低いところへ流れるから』です。流れてきた雨水が低いところに集まり、水たまりになります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】ふった雨の量を表す言葉を、答えましょう。",
        answer: "うりょう",
        acceptableAnswers: ["雨量"],
        explanation: "ふった雨の量を表す言葉は『うりょう』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】天気のようすと、安全のために気をつけることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "強い日ざし", match: "帽子をかぶり、こまめに水分をとる"),
        QuizMatchingPair(prompt: "大雨", match: "川や用水路に近づかない"),
        QuizMatchingPair(prompt: "強い風", match: "飛びそうな物や看板からはなれる"),
        QuizMatchingPair(prompt: "雪の朝", match: "凍った道を小さな歩幅で歩く")
        ],
        choices: [
        "飛びそうな物や看板からはなれる",
        "凍った道を小さな歩幅で歩く",
        "帽子をかぶり、こまめに水分をとる",
        "川や用水路に近づかない"
        ],
        explanation: "強い日ざしでは『帽子をかぶり、こまめに水分をとる』、大雨では『川や用水路に近づかない』、強い風では『飛びそうな物や看板からはなれる』、雪の朝では『凍った道を小さな歩幅で歩く』ことが大切です。"
        ),

        QuizQuestion(
        question: "3歳のときと7歳のときの手形をくらべました。体が成長したことをもっともよく表すものはどれですか？",
        choices: [
        "7歳の手形のほうが大きい",
        "手形を押した紙の色がちがう",
        "7歳の紙のほうが軽い",
        "どちらも同じ向きに置いてある"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『7歳の手形のほうが大きい』です。手が大きくなったことは、体が成長したようすの一つです。"
        ),

        QuizQuestion(
        question: "子どもの歯がぬけたあとに生えてくる、大人の歯を何といいますか？",
        choices: [
        "同じ乳歯",
        "永久歯",
        "羽毛",
        "角"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『永久歯』です。子どもの歯である乳歯がぬけると、大人の歯である永久歯が生えてきます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】たまごから子どもが出てくることを、答えましょう。",
        answer: "ふか",
        acceptableAnswers: ["ふ化", "孵化"],
        explanation: "たまごから子どもが出てくることを『ふか』といいます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ナナホシテントウの育ち方を、はじめから順に並べましょう。",
        choices: [
        "さなぎ",
        "成虫",
        "たまご",
        "幼虫"
        ],
        orderedChoices: [
        "たまご",
        "幼虫",
        "さなぎ",
        "成虫"
        ],
        explanation: "ナナホシテントウは、『たまご』『幼虫』『さなぎ』『成虫』の順に育ちます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ子犬の体重を、重い順に並べましょう。",
        choices: [
        "生後2か月（2.1kg）",
        "生後4か月（4.2kg）",
        "生後1か月（1.2kg）",
        "生後3か月（3.0kg）"
        ],
        rankedChoices: [
        "生後4か月（4.2kg）",
        "生後3か月（3.0kg）",
        "生後2か月（2.1kg）",
        "生後1か月（1.2kg）"
        ],
        explanation: "体重が重い順は、『生後4か月（4.2kg）』『生後3か月（3.0kg）』『生後2か月（2.1kg）』『生後1か月（1.2kg）』です。"
        ),

        QuizQuestion(
        question: "同じ場所で正午ごろの木の影を夏と冬にくらべると、冬の影はどうなりやすいですか？",
        choices: [
        "冬のほうが長くなりやすい",
        "冬のほうが短くなりやすい",
        "冬には影ができない",
        "夏と冬でいつも同じ長さになる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『冬のほうが長くなりやすい』です。冬は夏より太陽が低いところを通るため、正午ごろの影も長くなりやすいです。"
        ),

        QuizQuestion(
        question: "冬から春になって気温が上がると、池にはった氷はどうなりますか？",
        choices: [
        "さらに厚くなる",
        "とけて水になる",
        "土に変わる",
        "雲になって池に残る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『とけて水になる』です。春になってあたたかくなると、池の氷はとけて水に戻ります。"
        ),

        QuizQuestion(
        question: "梅雨のころ、雨でぬれたアジサイの葉の上などで見つけやすい生き物はどれですか？",
        choices: [
        "カブトムシ",
        "スズムシ",
        "カタツムリ",
        "トノサマバッタ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『カタツムリ』です。カタツムリは、梅雨のころのしめった場所で見つけやすい生き物です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、田んぼのようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "水を入れて苗を植える"),
        QuizMatchingPair(prompt: "夏", match: "青い稲がぐんぐん伸びる"),
        QuizMatchingPair(prompt: "秋", match: "穂が実って稲を刈る"),
        QuizMatchingPair(prompt: "冬", match: "稲を刈ったあとの田が休む")
        ],
        choices: [
        "穂が実って稲を刈る",
        "稲を刈ったあとの田が休む",
        "水を入れて苗を植える",
        "青い稲がぐんぐん伸びる"
        ],
        explanation: "春は『水を入れて苗を植える』、夏は『青い稲がぐんぐん伸びる』、秋は『穂が実って稲を刈る』、冬は『稲を刈ったあとの田が休む』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ大きさの氷がとけるまでにかかった時間を、短い順に並べましょう。",
        choices: [
        "秋の観察（22分）",
        "冬の観察（40分）",
        "夏の観察（8分）",
        "春の観察（15分）"
        ],
        rankedChoices: [
        "夏の観察（8分）",
        "春の観察（15分）",
        "秋の観察（22分）",
        "冬の観察（40分）"
        ],
        explanation: "時間が短い順は、『夏の観察（8分）』『春の観察（15分）』『秋の観察（22分）』『冬の観察（40分）』です。"
        ),

        QuizQuestion(
        question: "葉に見える、細いすじのような部分を何といいますか？",
        choices: [
        "根毛（こんもう）",
        "花粉（かふん）",
        "花びら",
        "葉脈（ようみゃく）"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『葉脈（ようみゃく）』です。葉脈は、葉に広がっている細いすじのような部分です。"
        ),

        QuizQuestion(
        question: "同じ植物を二つの鉢で育て、一方だけに毎日同じ量の水をあげました。数日後のようすとして、もっとも考えられるものはどれですか？",
        choices: [
        "水をあげた鉢のほうが元気に育つ",
        "水をあげない鉢だけ花がふえる",
        "どちらの鉢もすぐに石になる",
        "水をあげた鉢だけ根がなくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『水をあげた鉢のほうが元気に育つ』です。植物が育つためには水が必要です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】花の中にある、たねができることに関わる粉を、答えましょう。",
        answer: "かふん",
        acceptableAnswers: ["花粉"],
        explanation: "花の中にある、たねができることに関わる粉は『かふん』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】植物を、学校などで育て始めるときに『たねをまく』『球根を植える』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アサガオ", match: "たねをまく"),
        QuizMatchingPair(prompt: "ホウセンカ", match: "たねをまく"),
        QuizMatchingPair(prompt: "チューリップ", match: "球根を植える"),
        QuizMatchingPair(prompt: "スイセン", match: "球根を植える")
        ],
        categories: ["たねをまく", "球根を植える"],
        explanation: "アサガオとホウセンカは『たねをまく』、チューリップとスイセンは『球根を植える』に分けます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】チューリップの育ち方を、はじめから順に並べましょう。",
        choices: [
        "花がさく",
        "球根を土に植える",
        "花が終わり、葉がしだいにかれる",
        "芽が土の上に出る"
        ],
        orderedChoices: [
        "球根を土に植える",
        "芽が土の上に出る",
        "花がさく",
        "花が終わり、葉がしだいにかれる"
        ],
        explanation: "『球根を土に植える』『芽が土の上に出る』『花がさく』『花が終わり、葉がしだいにかれる』の順です。"
        ),

        QuizQuestion(
        question: "チョウが花のみつを吸うときに使うものはどれですか？",
        choices: [
        "かたいはさみ",
        "細長くのびる口",
        "大きな前歯",
        "水かきのある足"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『細長くのびる口』です。チョウは、細長くのびる口を花に入れてみつを吸います。"
        ),

        QuizQuestion(
        question: "ナナホシテントウが飛ぶとき、赤くてかたいはねを開くと、その下はどうなっていますか？",
        choices: [
        "足がもう六本かくれている",
        "小さな角が二本生えている",
        "うすいはねがたたまれている",
        "たまごがならんでいる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『うすいはねがたたまれている』です。ナナホシテントウは、かたいはねの下のうすいはねを広げて飛びます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】夜に光ることで知られているこん虫を、答えましょう。",
        answer: "ほたる",
        acceptableAnswers: ["ホタル", "蛍"],
        explanation: "夜に光ることで知られているこん虫は『ほたる』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫と、体の色や形の特ちょうを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ナナフシ", match: "木の枝に似た細長い体"),
        QuizMatchingPair(prompt: "ナナホシテントウ", match: "赤いはねに七つの黒い点"),
        QuizMatchingPair(prompt: "モンシロチョウ", match: "白いはね"),
        QuizMatchingPair(prompt: "アブラゼミ", match: "茶色いもようのあるはね")
        ],
        choices: [
        "白いはね",
        "茶色いもようのあるはね",
        "木の枝に似た細長い体",
        "赤いはねに七つの黒い点"
        ],
        explanation: "ナナフシは『木の枝に似た細長い体』、ナナホシテントウは『赤いはねに七つの黒い点』、モンシロチョウは『白いはね』、アブラゼミは『茶色いもようのあるはね』が特ちょうです。"
        ),

        QuizQuestion.classification(
        question: "【分類】こん虫を、育つ途中で『さなぎになる』『さなぎにならない』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カブトムシ", match: "さなぎになる"),
        QuizMatchingPair(prompt: "モンシロチョウ", match: "さなぎになる"),
        QuizMatchingPair(prompt: "バッタ", match: "さなぎにならない"),
        QuizMatchingPair(prompt: "セミ", match: "さなぎにならない")
        ],
        categories: ["さなぎになる", "さなぎにならない"],
        explanation: "カブトムシとモンシロチョウは『さなぎになる』、バッタとセミは『さなぎにならない』に分けます。"
        ),

        QuizQuestion(
        question: "カメのかたい甲らは、何に役立ちますか？",
        choices: [
        "空を高く飛ぶ",
        "水の中で息をする",
        "遠くの音を聞く",
        "やわらかい体を守る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『やわらかい体を守る』です。カメのかたい甲らは、体を外から守るのに役立ちます。"
        ),

        QuizQuestion(
        question: "魚が口を開けたり、えらぶたを動かしたりするのは、主に何のためですか？",
        choices: [
        "えらに水を通して、水の中の酸素を取り入れるため",
        "体のうろこを全部ぬぐため",
        "水をおなかにためて大きくなるため",
        "尾びれをかわかすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『えらに水を通して、水の中の酸素を取り入れるため』です。魚は、えらを使って水の中で息をします。"
        ),

        QuizQuestion(
        question: "ペンギンは、翼を主に何に使いますか？",
        choices: [
        "空を高く飛ぶ",
        "水の中をおよぐ",
        "土の中に穴をほる",
        "遠くの音を聞く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『水の中をおよぐ』です。ペンギンは翼を動かして、水の中を進みます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】魚の体の表面をおおっている、小さくてかたいものを、答えましょう。",
        answer: "うろこ",
        acceptableAnswers: ["鱗"],
        explanation: "魚の体の表面をおおっている、小さくてかたいものは『うろこ』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、体のつくりを生かしてすることを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ゾウ", match: "長い鼻で水や食べ物をつかむ"),
        QuizMatchingPair(prompt: "キリン", match: "長い首で高い木の葉を食べる"),
        QuizMatchingPair(prompt: "ラッコ", match: "前足で石を持って貝を割る"),
        QuizMatchingPair(prompt: "ビーバー", match: "大きな前歯で木をかじる")
        ],
        choices: [
        "大きな前歯で木をかじる",
        "長い鼻で水や食べ物をつかむ",
        "前足で石を持って貝を割る",
        "長い首で高い木の葉を食べる"
        ],
        explanation: "ゾウは『長い鼻で水や食べ物をつかむ』、キリンは『長い首で高い木の葉を食べる』、ラッコは『前足で石を持って貝を割る』、ビーバーは『大きな前歯で木をかじる』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "晴れた日にできる影は、太陽から見てどちら側にできますか？",
        choices: [
        "太陽と同じ向き",
        "いつも北だけ",
        "太陽と反対の向き",
        "物の真上だけ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『太陽と反対の向き』です。光を物がさえぎるため、影は太陽と反対の向きにできます。"
        ),

        QuizQuestion(
        question: "外にいるときに雷の音が聞こえ始めました。もっとも安全な行動はどれですか？",
        choices: [
        "高い木のすぐ下に入る",
        "広い運動場のまん中に立つ",
        "川や池の近くへ行く",
        "近くのしっかりした建物の中へ入る"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『近くのしっかりした建物の中へ入る』です。雷が近づいたときは、高い木や水辺をさけ、建物の中へひなんします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】風の強さを数字ではかる道具を、答えましょう。",
        answer: "ふうそくけい",
        acceptableAnswers: ["風速計"],
        explanation: "風の強さを数字ではかる道具は『ふうそくけい』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】ものを『弱い風でも動きやすい』『弱い風では動きにくい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ティッシュペーパー", match: "弱い風でも動きやすい"),
        QuizMatchingPair(prompt: "かれ葉", match: "弱い風でも動きやすい"),
        QuizMatchingPair(prompt: "大きな石", match: "弱い風では動きにくい"),
        QuizMatchingPair(prompt: "水がいっぱい入ったペットボトル", match: "弱い風では動きにくい")
        ],
        categories: ["弱い風でも動きやすい", "弱い風では動きにくい"],
        explanation: "ティッシュペーパーとかれ葉は『弱い風でも動きやすい』、大きな石と水がいっぱい入ったペットボトルは『弱い風では動きにくい』に分けます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】雨量計ではかった雨の量を、多い順に並べましょう。",
        choices: [
        "火曜日（5mm）",
        "木曜日（0mm）",
        "月曜日（18mm）",
        "水曜日（12mm）"
        ],
        rankedChoices: [
        "月曜日（18mm）",
        "水曜日（12mm）",
        "火曜日（5mm）",
        "木曜日（0mm）"
        ],
        explanation: "雨の量が多い順は、『月曜日（18mm）』『水曜日（12mm）』『火曜日（5mm）』『木曜日（0mm）』です。"
        ),

        QuizQuestion(
        question: "カマキリのたまごのかたまりから、春に出てくるものはどれですか？",
        choices: [
        "小さなカマキリ",
        "おたまじゃくし",
        "ひよこ",
        "メダカの子ども"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『小さなカマキリ』です。カマキリのたまごのかたまりからは、春になると小さなカマキリが出てきます。"
        ),

        QuizQuestion(
        question: "巣の中の鳥のひなが育ち、巣立つ前に見られる変化として正しいものはどれですか？",
        choices: [
        "羽がすべてぬけて足がなくなる",
        "羽が生えそろい、羽ばたく練習をする",
        "えらができて水の中だけでくらす",
        "体がたまごの中へ戻る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『羽が生えそろい、羽ばたく練習をする』です。ひなは成長すると羽が生えそろい、飛ぶための動きをするようになります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】カイコが、さなぎになる前に糸で作るものを、答えましょう。",
        answer: "まゆ",
        acceptableAnswers: ["繭"],
        explanation: "カイコが、さなぎになる前に糸で作るものは『まゆ』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】生き物と、成長するときに見られる変化を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "子犬", match: "体が大きくなり、歯が生えかわる"),
        QuizMatchingPair(prompt: "ツバメのひな", match: "羽が生えそろって巣立つ"),
        QuizMatchingPair(prompt: "カブトムシの幼虫", match: "さなぎをへて成虫になる"),
        QuizMatchingPair(prompt: "ザリガニ", match: "何度もからをぬいで大きくなる")
        ],
        choices: [
        "何度もからをぬいで大きくなる",
        "羽が生えそろって巣立つ",
        "体が大きくなり、歯が生えかわる",
        "さなぎをへて成虫になる"
        ],
        explanation: "子犬は『体が大きくなり、歯が生えかわる』、ツバメのひなは『羽が生えそろって巣立つ』、カブトムシの幼虫は『さなぎをへて成虫になる』、ザリガニは『何度もからをぬいで大きくなる』が正しい組み合わせです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】鳥が巣を作ってから、ひなが巣立つまでを順に並べましょう。",
        choices: [
        "ひながたまごからかえる",
        "親鳥が巣を作る",
        "ひなが巣立つ",
        "親鳥がたまごをうむ"
        ],
        orderedChoices: [
        "親鳥が巣を作る",
        "親鳥がたまごをうむ",
        "ひながたまごからかえる",
        "ひなが巣立つ"
        ],
        explanation: "『親鳥が巣を作る』『親鳥がたまごをうむ』『ひながたまごからかえる』『ひなが巣立つ』の順です。"
        ),

        QuizQuestion(
        question: "冬のあいだ、木の枝に小さくついていた冬芽は、春になるとどうなることが多いですか？",
        choices: [
        "ふくらんで葉や花になる",
        "土の中にもぐる",
        "石のようにかたくなる",
        "枝から水になって落ちる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『ふくらんで葉や花になる』です。冬芽は春のあたたかさでふくらみ、葉や花になります。"
        ),

        QuizQuestion(
        question: "同じサクラの木を春・夏・秋・冬にくらべるとき、いちばんよい観察のしかたはどれですか？",
        choices: [
        "季節ごとに別の木を見る",
        "毎回ちがう向きから少しだけ見る",
        "同じ場所と向きから同じ木を見る",
        "一つの季節だけをくわしく見る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『同じ場所と向きから同じ木を見る』です。同じ条件で観察すると、季節による変化をくらべやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】夏のつぎにくる季節を、答えましょう。",
        answer: "あき",
        acceptableAnswers: ["秋"],
        explanation: "夏のつぎにくる季節は『あき』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、葉を落とす木のようすを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "冬芽がひらいて若い葉が出る"),
        QuizMatchingPair(prompt: "夏", match: "葉がたくさんしげる"),
        QuizMatchingPair(prompt: "秋", match: "葉が赤や黄色に変わる"),
        QuizMatchingPair(prompt: "冬", match: "葉が落ちて枝が目立つ")
        ],
        choices: [
        "葉が落ちて枝が目立つ",
        "葉がたくさんしげる",
        "冬芽がひらいて若い葉が出る",
        "葉が赤や黄色に変わる"
        ],
        explanation: "春は『冬芽がひらいて若い葉が出る』、夏は『葉がたくさんしげる』、秋は『葉が赤や黄色に変わる』、冬は『葉が落ちて枝が目立つ』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある場所で調べた日の入りの時刻を、遅い順に並べましょう。",
        choices: [
        "秋（午後5時30分）",
        "冬（午後4時40分）",
        "夏（午後7時00分）",
        "春（午後6時10分）"
        ],
        rankedChoices: [
        "夏（午後7時00分）",
        "春（午後6時10分）",
        "秋（午後5時30分）",
        "冬（午後4時40分）"
        ],
        explanation: "日の入りが遅い順は、『夏（午後7時00分）』『春（午後6時10分）』『秋（午後5時30分）』『冬（午後4時40分）』です。"
        ),

        QuizQuestion(
        question: "ヒマワリの花が終わったあと、花の中心にたくさんできるものはどれですか？",
        choices: [
        "球根",
        "たね",
        "新しい根",
        "とげ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『たね』です。ヒマワリの花が終わると、花の中心にたくさんのたねができます。"
        ),

        QuizQuestion(
        question: "鉢植えの葉がしおれ、土がかわいていました。まず行う世話として、もっともよいものはどれですか？",
        choices: [
        "葉を全部切る",
        "鉢を箱の中に入れる",
        "土を強く固める",
        "根元の土に水をやる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『根元の土に水をやる』です。土がかわいているときは、植物が水を吸えるように根元へ水をやります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】花や葉をささえ、根から吸った水の通り道にもなる部分を、答えましょう。",
        answer: "くき",
        acceptableAnswers: ["茎"],
        explanation: "花や葉をささえ、水の通り道にもなる部分は『くき』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】野菜を『主に根を食べる』『主に葉を食べる』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "にんじん", match: "主に根を食べる"),
        QuizMatchingPair(prompt: "だいこん", match: "主に根を食べる"),
        QuizMatchingPair(prompt: "キャベツ", match: "主に葉を食べる"),
        QuizMatchingPair(prompt: "ほうれんそう", match: "主に葉を食べる")
        ],
        categories: ["主に根を食べる", "主に葉を食べる"],
        explanation: "にんじんとだいこんは『主に根を食べる』、キャベツとほうれんそうは『主に葉を食べる』野菜です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】ミニトマトの育ち方を、はじめから順に並べましょう。",
        choices: [
        "緑色の実ができる",
        "苗を土に植える",
        "実が赤くなる",
        "黄色い花がさく"
        ],
        orderedChoices: [
        "苗を土に植える",
        "黄色い花がさく",
        "緑色の実ができる",
        "実が赤くなる"
        ],
        explanation: "『苗を土に植える』『黄色い花がさく』『緑色の実ができる』『実が赤くなる』の順に育ちます。"
        ),

        QuizQuestion(
        question: "こん虫の体は、あたま・むね・はらの大きくいくつの部分に分かれていますか？",
        choices: [
        "3つ",
        "2つ",
        "4つ",
        "6つ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『3つ』です。こん虫の体は、あたま・むね・はらの3つの部分に分かれています。"
        ),

        QuizQuestion(
        question: "バッタの後ろあしが長くて太いのは、どんな動きに役立ちますか？",
        choices: [
        "水に深くもぐる",
        "木を切る",
        "遠くへ跳ぶ",
        "土を飲む"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『遠くへ跳ぶ』です。バッタは長くて太い後ろあしを使って、勢いよく跳びます。"
        ),

        QuizQuestion(
        question: "カマキリがえものをつかまえるときに使う体の部分はどれですか？",
        choices: [
        "うしろあし",
        "かまのような前あし",
        "はねの先",
        "はら"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『かまのような前あし』です。カマキリは、かまのような前あしでえものをつかまえます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】こん虫のあたまにある、においやまわりのようすを感じる二本のものを、答えましょう。",
        answer: "しょっかく",
        acceptableAnswers: ["触角"],
        explanation: "こん虫のあたまにある二本のものは『しょっかく』です。においやまわりのようすを感じるのに役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫と、見つけやすい場所を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アメンボ", match: "池や水たまりの水面"),
        QuizMatchingPair(prompt: "コオロギ", match: "草むら"),
        QuizMatchingPair(prompt: "カブトムシ", match: "樹液が出る木"),
        QuizMatchingPair(prompt: "アリ", match: "地面の巣穴")
        ],
        choices: [
        "草むら",
        "地面の巣穴",
        "池や水たまりの水面",
        "樹液が出る木"
        ],
        explanation: "アメンボは『池や水たまりの水面』、コオロギは『草むら』、カブトムシは『樹液が出る木』、アリは『地面の巣穴』で見つけやすいこん虫です。"
        ),

        QuizQuestion(
        question: "魚が水の中で前へ進むとき、左右に動かして役立てる部分はどれですか？",
        choices: [
        "耳",
        "つの",
        "前足",
        "尾びれ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『尾びれ』です。魚は尾びれを左右に動かして、水の中を前へ進みます。"
        ),

        QuizQuestion(
        question: "モグラの前足が大きく、外向きについているのは、何をするためですか？",
        choices: [
        "土をほって進むため",
        "空を飛ぶため",
        "水面をすべるため",
        "木の実を割るため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『土をほって進むため』です。モグラの大きな前足は、土をかき分けて進むのに役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、その子どもの呼び方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ウマ", match: "こうま"),
        QuizMatchingPair(prompt: "ウシ", match: "こうし"),
        QuizMatchingPair(prompt: "イヌ", match: "こいぬ"),
        QuizMatchingPair(prompt: "ネコ", match: "こねこ")
        ],
        choices: [
        "こねこ",
        "こうし",
        "こうま",
        "こいぬ"
        ],
        explanation: "ウマの子どもは『こうま』、ウシは『こうし』、イヌは『こいぬ』、ネコは『こねこ』と呼びます。"
        ),

        QuizQuestion.classification(
        question: "【分類】動物を『足が2本』『足が4本』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ニワトリ", match: "足が2本"),
        QuizMatchingPair(prompt: "スズメ", match: "足が2本"),
        QuizMatchingPair(prompt: "ウサギ", match: "足が4本"),
        QuizMatchingPair(prompt: "イヌ", match: "足が4本")
        ],
        categories: ["足が2本", "足が4本"],
        explanation: "ニワトリとスズメは『足が2本』、ウサギとイヌは『足が4本』です。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】ある動物園で調べた体の長さを、長い順に並べましょう。",
        choices: [
        "カピバラ（110cm）",
        "ハムスター（15cm）",
        "キリン（480cm）",
        "シマウマ（240cm）"
        ],
        rankedChoices: [
        "キリン（480cm）",
        "シマウマ（240cm）",
        "カピバラ（110cm）",
        "ハムスター（15cm）"
        ],
        explanation: "体の長さが長い順は、『キリン（480cm）』『シマウマ（240cm）』『カピバラ（110cm）』『ハムスター（15cm）』です。"
        ),

        QuizQuestion(
        question: "風の強さをくらべるとき、見るとわかりやすいものはどれですか？",
        choices: [
        "月の形",
        "旗や木の枝のゆれ方",
        "石の重さ",
        "花の色"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『旗や木の枝のゆれ方』です。風が強いほど、旗や木の枝は大きくゆれます。"
        ),

        QuizQuestion(
        question: "雨がふっていない朝、草の葉に小さな水滴がついていました。この水滴を何といいますか？",
        choices: [
        "つらら",
        "しもばしら",
        "あられ",
        "朝つゆ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『朝つゆ』です。朝、草の葉などについている小さな水滴を朝つゆといいます。"
        ),

        QuizQuestion(
        question: "雲がどちらへ動いているかを調べるには、どの方法がよいですか？",
        choices: [
        "目を閉じて風の音だけを聞く",
        "雲を一度だけ見てすぐに決める",
        "建物など動かないものを目印にして、時間をあけて見る",
        "温度計を水につけて数字を見る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『建物など動かないものを目印にして、時間をあけて見る』です。雲の位置の変化から、動く向きがわかります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】空の多くが雲でおおわれ、雨や雪はふっていない天気を、答えましょう。",
        answer: "くもり",
        acceptableAnswers: ["曇り"],
        explanation: "空の多くが雲でおおわれ、雨や雪がふっていない天気は『くもり』です。"
        ),

        QuizQuestion.classification(
        question: "【分類】空や地面のようすを『晴れているときに見られやすい』『雨がふっているときに見られやすい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "地面にくっきりした影ができる", match: "晴れているときに見られやすい"),
        QuizMatchingPair(prompt: "青空が広がる", match: "晴れているときに見られやすい"),
        QuizMatchingPair(prompt: "水たまりに雨つぶの輪ができる", match: "雨がふっているときに見られやすい"),
        QuizMatchingPair(prompt: "雨どいから水が流れる", match: "雨がふっているときに見られやすい")
        ],
        categories: ["晴れているときに見られやすい", "雨がふっているときに見られやすい"],
        explanation: "『地面にくっきりした影ができる』『青空が広がる』は晴れているとき、『水たまりに雨つぶの輪ができる』『雨どいから水が流れる』は雨がふっているときに見られやすいようすです。"
        ),

        QuizQuestion(
        question: "モンシロチョウのさなぎから出てくるものはどれですか？",
        choices: [
        "モンシロチョウの成虫",
        "オタマジャクシ",
        "カブトムシの幼虫",
        "メダカの子ども"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『モンシロチョウの成虫』です。モンシロチョウは、さなぎの中で体が変わり、成虫になって出てきます。"
        ),

        QuizQuestion(
        question: "同じヒマワリの高さを毎週くらべるとき、正しく測る方法はどれですか？",
        choices: [
        "毎回ちがう場所から目で見る",
        "土の表面から茎のいちばん高いところまで同じものさしで測る",
        "鉢の底からいちばん大きい葉の横幅まで測る",
        "花の数だけを数える"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『土の表面から茎のいちばん高いところまで同じものさしで測る』です。同じ場所と方法で測ると、高さの変化を正しくくらべられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】生き物の体が大きくなったり、できることがふえたりすることを、答えましょう。",
        answer: "せいちょう",
        acceptableAnswers: ["成長"],
        explanation: "生き物の体が大きくなったり、できることがふえたりすることを『せいちょう』といいます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】生き物の子どもと、成長したあとのすがたを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ヤゴ", match: "トンボ"),
        QuizMatchingPair(prompt: "ボウフラ", match: "蚊（か）"),
        QuizMatchingPair(prompt: "オタマジャクシ", match: "カエル"),
        QuizMatchingPair(prompt: "ひよこ", match: "ニワトリ")
        ],
        choices: [
        "ニワトリ",
        "トンボ",
        "カエル",
        "蚊（か）"
        ],
        explanation: "ヤゴは『トンボ』、ボウフラは『蚊（か）』、オタマジャクシは『カエル』、ひよこは『ニワトリ』に成長します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】メダカがたまごの中で育ち、次のたまごをうむまでのようすを順に並べましょう。",
        choices: [
        "成長したメダカがたまごをうむ",
        "たまごの中に目が見えてくる",
        "たまごから小さなメダカがかえる",
        "小さなメダカがえさを食べて育つ"
        ],
        orderedChoices: [
        "たまごの中に目が見えてくる",
        "たまごから小さなメダカがかえる",
        "小さなメダカがえさを食べて育つ",
        "成長したメダカがたまごをうむ"
        ],
        explanation: "『たまごの中に目が見えてくる』『たまごから小さなメダカがかえる』『小さなメダカがえさを食べて育つ』『成長したメダカがたまごをうむ』の順です。"
        ),

        QuizQuestion(
        question: "冬の朝、土の中の水がこおって、細い氷が地面をおし上げてできるものはどれですか？",
        choices: [
        "つらら",
        "水たまり",
        "しもばしら",
        "にじ"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『しもばしら』です。土の中の水がこおり、細い氷が地面をおし上げてできます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】冬のつぎにくる季節を、答えましょう。",
        answer: "はる",
        acceptableAnswers: ["春"],
        explanation: "冬のつぎにくる季節は『はる』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】季節と、その季節に見つけやすいものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "春", match: "つくしが出る"),
        QuizMatchingPair(prompt: "夏", match: "アブラゼミの声が聞こえる"),
        QuizMatchingPair(prompt: "秋", match: "ドングリが落ちる"),
        QuizMatchingPair(prompt: "冬", match: "池に氷がはる")
        ],
        choices: [
        "池に氷がはる",
        "ドングリが落ちる",
        "つくしが出る",
        "アブラゼミの声が聞こえる"
        ],
        explanation: "春は『つくしが出る』、夏は『アブラゼミの声が聞こえる』、秋は『ドングリが落ちる』、冬は『池に氷がはる』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "同じ場所でくらべると、夏は冬より夕方まで明るい時間がどうなりますか？",
        choices: [
        "長くなる",
        "短くなる",
        "昼がなくなる",
        "いつも同じになる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『長くなる』です。夏は冬より昼の時間が長く、夕方まで明るい時間も長くなります。"
        ),

        QuizQuestion.classification(
        question: "【分類】自然のようすを『春から夏に見られやすい』『秋から冬に見られやすい』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ツバメが巣を作る", match: "春から夏に見られやすい"),
        QuizMatchingPair(prompt: "セミが羽化する", match: "春から夏に見られやすい"),
        QuizMatchingPair(prompt: "ドングリが地面に落ちる", match: "秋から冬に見られやすい"),
        QuizMatchingPair(prompt: "しもばしらができる", match: "秋から冬に見られやすい")
        ],
        categories: ["春から夏に見られやすい", "秋から冬に見られやすい"],
        explanation: "ツバメが巣を作ることとセミが羽化することは『春から夏に見られやすい』、ドングリが地面に落ちることとしもばしらができることは『秋から冬に見られやすい』ようすです。"
        ),

        QuizQuestion(
        question: "アサガオの花がしぼんだあと、たねが入った何ができることがありますか？",
        choices: [
        "球根",
        "新しい根",
        "大きな葉",
        "実"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『実』です。アサガオは花がしぼんだあとに実ができ、その中にたねができます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】タンポポの白いわた毛のついた実を運ぶものを、答えましょう。",
        answer: "かぜ",
        acceptableAnswers: ["風"],
        explanation: "タンポポの実は、白いわた毛で『かぜ』に運ばれます。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】植物と、たねの広がり方を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "タンポポ", match: "風に運ばれる"),
        QuizMatchingPair(prompt: "オナモミ", match: "動物の毛につく"),
        QuizMatchingPair(prompt: "ホウセンカ", match: "実がはじける"),
        QuizMatchingPair(prompt: "ドングリ", match: "木から地面に落ちる")
        ],
        choices: [
        "実がはじける",
        "木から地面に落ちる",
        "動物の毛につく",
        "風に運ばれる"
        ],
        explanation: "タンポポは『風に運ばれる』、オナモミは『動物の毛につく』、ホウセンカは『実がはじける』、ドングリは『木から地面に落ちる』が正しい組み合わせです。"
        ),

        QuizQuestion.classification(
        question: "【分類】植物を『木』『草』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "サクラ", match: "木"),
        QuizMatchingPair(prompt: "ヒマワリ", match: "草"),
        QuizMatchingPair(prompt: "マツ", match: "木"),
        QuizMatchingPair(prompt: "タンポポ", match: "草")
        ],
        categories: ["木", "草"],
        explanation: "サクラとマツは『木』、ヒマワリとタンポポは『草』のなかまです。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】エダマメの育ち方を、はじめから順に並べましょう。",
        choices: [
        "花がさく",
        "さやの中のまめがふくらむ",
        "たねをまく",
        "芽が出る"
        ],
        orderedChoices: [
        "たねをまく",
        "芽が出る",
        "花がさく",
        "さやの中のまめがふくらむ"
        ],
        explanation: "『たねをまく』『芽が出る』『花がさく』『さやの中のまめがふくらむ』の順に育ちます。"
        ),

        QuizQuestion(
        question: "こん虫のあしは、何本ありますか？",
        choices: [
        "4本",
        "6本",
        "8本",
        "10本"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『6本』です。こん虫には、むねから出るあしが6本あります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】セミが成長するときにぬいで、木などに残るものを、答えましょう。",
        answer: "ぬけがら",
        acceptableAnswers: ["抜け殻", "ぬけ殻"],
        explanation: "セミが成長するときにぬいだものは『ぬけがら』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】こん虫と、よく食べるものを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ナナホシテントウ", match: "アブラムシ"),
        QuizMatchingPair(prompt: "カイコ", match: "クワの葉"),
        QuizMatchingPair(prompt: "チョウ", match: "花のみつ"),
        QuizMatchingPair(prompt: "カブトムシ", match: "木のしる")
        ],
        choices: [
        "花のみつ",
        "木のしる",
        "アブラムシ",
        "クワの葉"
        ],
        explanation: "ナナホシテントウは『アブラムシ』、カイコは『クワの葉』、チョウは『花のみつ』、カブトムシは『木のしる』をよく食べます。"
        ),

        QuizQuestion(
        question: "トンボがたまごをうむ場所として、もっとも合うものはどれですか？",
        choices: [
        "かわいた砂の中",
        "高い木のてっぺん",
        "家の中",
        "水の中や水べ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『水の中や水べ』です。トンボの多くは、水の中や水べにたまごをうみます。"
        ),

        QuizQuestion(
        question: "こん虫の6本のあしがついている体の部分はどれですか？",
        choices: [
        "むね",
        "あたま",
        "はら",
        "はね"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『むね』です。こん虫の6本のあしは、むねについています。"
        ),

        QuizQuestion(
        question: "鳥の体をおおっているものはどれですか？",
        choices: [
        "うろこ",
        "羽毛",
        "ぬるぬるした皮ふ",
        "かたいこうら"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『羽毛』です。鳥の体は羽毛でおおわれています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】カエルの子どもを、答えましょう。",
        answer: "おたまじゃくし",
        acceptableAnswers: ["オタマジャクシ"],
        explanation: "カエルの子どもは『おたまじゃくし』です。"
        ),

        QuizQuestion.related(
        question: "【関連づけ】動物と、体のつくりを生かした動きを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カモ", match: "水かきでおよぐ"),
        QuizMatchingPair(prompt: "キツツキ", match: "くちばしで木をつつく"),
        QuizMatchingPair(prompt: "ウサギ", match: "大きな耳で音を聞く"),
        QuizMatchingPair(prompt: "リス", match: "前歯で木の実をかじる")
        ],
        choices: [
        "前歯で木の実をかじる",
        "水かきでおよぐ",
        "大きな耳で音を聞く",
        "くちばしで木をつつく"
        ],
        explanation: "カモは『水かきでおよぐ』、キツツキは『くちばしで木をつつく』、ウサギは『大きな耳で音を聞く』、リスは『前歯で木の実をかじる』が正しい組み合わせです。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】同じ長さの道を進んだとき、かかった時間が短い動物から順に並べましょう。",
        choices: [
        "リクガメ（20秒）",
        "チーター（2秒）",
        "カタツムリ（40秒）",
        "ウサギ（4秒）"
        ],
        rankedChoices: [
        "チーター（2秒）",
        "ウサギ（4秒）",
        "リクガメ（20秒）",
        "カタツムリ（40秒）"
        ],
        explanation: "かかった時間が短いほど速いので、『チーター（2秒）』『ウサギ（4秒）』『リクガメ（20秒）』『カタツムリ（40秒）』の順です。"
        ),

        QuizQuestion(
        question: "カモの足にある水かきは、何をするときに役立ちますか？",
        choices: [
        "木の枝にしがみつく",
        "土に深い穴をほる",
        "水をおしておよぐ",
        "木の枝を切る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『水をおしておよぐ』です。カモは水かきで水をおし、進みやすくしています。"
        ),

        QuizQuestion(
        question: "風がふいてくる向きを調べる道具はどれですか？",
        choices: [
        "温度計",
        "雨量計",
        "虫めがね",
        "風向計"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『風向計』です。風向計を使うと、風がふいてくる向きを調べられます。"
        ),

        QuizQuestion(
        question: "今にも雨がふりそうな空で見られやすい雲はどれですか？",
        choices: [
        "黒っぽくて厚い雲",
        "細くて白い雲だけ",
        "雲が一つもない空",
        "うすいにじ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『黒っぽくて厚い雲』です。今にも雨がふりそうなときは、空を広くおおう黒っぽくて厚い雲が見られます。"
        ),

        QuizQuestion.classification(
        question: "【分類】道具を『天気の観察に使う』『天気の観察には使わない』に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "温度計", match: "天気の観察に使う"),
        QuizMatchingPair(prompt: "雨量計", match: "天気の観察に使う"),
        QuizMatchingPair(prompt: "風向計", match: "天気の観察に使う"),
        QuizMatchingPair(prompt: "絵の具", match: "天気の観察には使わない")
        ],
        categories: ["天気の観察に使う", "天気の観察には使わない"],
        explanation: "温度計、雨量計、風向計は『天気の観察に使う』、絵の具は『天気の観察には使わない』に分けます。"
        ),

        QuizQuestion.ranking(
        question: "【ランキング】気温が高い順に並べましょう。",
        choices: [
        "秋の朝（12℃）",
        "冬の朝（1℃）",
        "夏の昼（32℃）",
        "春の昼（20℃）"
        ],
        rankedChoices: [
        "夏の昼（32℃）",
        "春の昼（20℃）",
        "秋の朝（12℃）",
        "冬の朝（1℃）"
        ],
        explanation: "『夏の昼（32℃）』『春の昼（20℃）』『秋の朝（12℃）』『冬の朝（1℃）』の順です。"
        ),

        QuizQuestion(
        question: "同じ大きさの水たまりが、もっとも早くかわきやすい天気はどれですか？",
        choices: [
        "くもっていて風がない日",
        "晴れていて風が強い日",
        "雨がふっている日",
        "雪がふっている日"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『晴れていて風が強い日』です。日光で水があたためられ、風もあると水たまりはかわきやすくなります。"
        ),

        QuizQuestion(
        question: "マメのたねが育ち始めるとき、はじめに外へ出ることが多い部分はどれですか？",
        choices: [
        "花",
        "実",
        "根",
        "葉"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『根』です。マメのたねは、はじめに根が出て土の中へ伸びていきます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】にわとりのたまごからかえる子どもを、答えましょう。",
        answer: "ひよこ",
        acceptableAnswers: ["ヒヨコ"],
        explanation: "にわとりのたまごからかえる子どもは『ひよこ』です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】カエルの育ち方を、はじめから順に並べましょう。",
        choices: [
        "足が生える",
        "たまご",
        "しっぽが短くなったカエル",
        "おたまじゃくし"
        ],
        orderedChoices: [
        "たまご",
        "おたまじゃくし",
        "足が生える",
        "しっぽが短くなったカエル"
        ],
        explanation: "『たまご』『おたまじゃくし』『足が生える』『しっぽが短くなったカエル』の順に育ちます。"
        ),

        QuizQuestion(
        question: "ヒヨコが育つときの変化として、正しいものはどれですか？",
        choices: [
        "体が大きくなり、羽がふえる",
        "体がだんだん小さくなる",
        "足がなくなって魚になる",
        "石のようにかたくなる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『体が大きくなり、羽がふえる』です。ヒヨコは食べて育ち、体が大きくなって羽もふえていきます。"
        ),

        QuizQuestion(
        question: "こん虫のよう虫が、体を大きくしながら古い皮をぬぐことを何といいますか？",
        choices: [
        "羽化",
        "脱皮",
        "冬眠",
        "発芽"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『脱皮』です。こん虫のよう虫は、成長するときに古い皮をぬぐことがあります。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika2, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika2ListView(isPresenting: .constant(false))
    }
}
