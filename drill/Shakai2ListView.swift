//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Shakai2ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.related(
            question: "【関連づけ】はたらく人と しごとが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "けいさつかん", match: "まちの あんぜんを まもる"),
                QuizMatchingPair(prompt: "しょうぼうし", match: "かじを けす"),
                QuizMatchingPair(prompt: "えきいん", match: "でんしゃを あんないする")
            ],
            choices: ["かじを けす", "でんしゃを あんないする", "まちの あんぜんを まもる"],
            explanation: "それぞれの 人は、まちの くらしを ささえる しごとをしています。"
        ),

        QuizQuestion.classification(
            question: "【分類】ばしょを『何をするところか』で 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "としょかん", match: "本を よむ"),
                QuizMatchingPair(prompt: "こうばん", match: "あんぜんを まもる"),
                QuizMatchingPair(prompt: "スーパー", match: "かいものを する")
            ],
            categories: ["本を よむ", "あんぜんを まもる", "かいものを する"],
            explanation: "としょかん、こうばん、スーパーは それぞれ ちがう はたらきがあります。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】とおくまで はやく 行けるじゅんに ならべましょう。",
            choices: ["あるく", "じてんしゃ", "でんしゃ"],
            rankedChoices: ["でんしゃ", "じてんしゃ", "あるく"],
            explanation: "はやく とおくまで 行けるのは、でんしゃ、じてんしゃ、あるく の順です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】がっこうへ 行くまでの じゅんに ならべましょう。",
            choices: ["がっこうに つく", "こうさてんを わたる", "いえを 出る"],
            orderedChoices: ["いえを 出る", "こうさてんを わたる", "がっこうに つく"],
            explanation: "いえを 出てから こうさてんを わたり、そのあと がっこうに つきます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】ばしょと そこで できることが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "こうばん", match: "そうだんする"),
                QuizMatchingPair(prompt: "えき", match: "でんしゃに のる"),
                QuizMatchingPair(prompt: "としょかん", match: "本を かりる")
            ],
            choices: ["でんしゃに のる", "本を かりる", "そうだんする"],
            explanation: "こうばんでは そうだん、えきでは でんしゃ、としょかんでは 本を かりられます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】のりものと つかう ばしょが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "でんしゃ", match: "えき"),
                QuizMatchingPair(prompt: "ふね", match: "みなと"),
                QuizMatchingPair(prompt: "ひこうき", match: "くうこう")
            ],
            choices: ["えき", "くうこう", "みなと"],
            explanation: "でんしゃは えき、ふねは みなと、ひこうきは くうこうを つかいます。"
        ),

        QuizQuestion.classification(
            question: "【分類】ごみを 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しんぶんし", match: "しげんごみ"),
                QuizMatchingPair(prompt: "バナナの かわ", match: "もえるごみ"),
                QuizMatchingPair(prompt: "ペットボトル", match: "リサイクル")
            ],
            categories: ["しげんごみ", "もえるごみ", "リサイクル"],
            explanation: "ごみは なかまごとに 分けると、まちを きれいに たもてます。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】人を 多く はこべるじゅんに ならべましょう。",
            choices: ["くるま", "バス", "ひこうき"],
            rankedChoices: ["ひこうき", "バス", "くるま"],
            explanation: "たくさんの人を はこべるのは、ひこうき、バス、くるま の順です。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】ごみが はこばれる じゅんに ならべましょう。",
            choices: ["しょりじょうに つく", "しゅうしゅうしゃが くる", "ごみを だす"],
            orderedChoices: ["ごみを だす", "しゅうしゅうしゃが くる", "しょりじょうに つく"],
            explanation: "ごみは だしてから しゅうしゅうしゃが あつめ、しょりじょうに はこばれます。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】しせつと いる人が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "びょういん", match: "いしゃ"),
                QuizMatchingPair(prompt: "こうばん", match: "けいさつかん"),
                QuizMatchingPair(prompt: "がっこう", match: "せんせい")
            ],
            choices: ["いしゃ", "せんせい", "けいさつかん"],
            explanation: "びょういんには いしゃ、こうばんには けいさつかん、がっこうには せんせいが います。"
        ),

        QuizQuestion.classification(
            question: "【分類】ばしょを みんなのしせつ と おみせ に 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "としょかん", match: "みんなのしせつ"),
                QuizMatchingPair(prompt: "こうばん", match: "みんなのしせつ"),
                QuizMatchingPair(prompt: "すーぱー", match: "おみせ")
            ],
            categories: ["みんなのしせつ", "おみせ"],
            explanation: "としょかんや こうばんは みんなのしせつ、すーぱーは おみせです。"
        ),

        QuizQuestion.ranking(
            question: "【ランキング】はやく とおくへ 行けるじゅんに ならべましょう。",
            choices: ["あるく", "じてんしゃ", "でんしゃ"],
            rankedChoices: ["でんしゃ", "じてんしゃ", "あるく"],
            explanation: "はやく とおくへ 行けるのは、でんしゃ、じてんしゃ、あるく の順です。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】しせつと はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しやくしょ", match: "くらしを ささえる しごとを する"),
                QuizMatchingPair(prompt: "しょうぼうしょ", match: "かじから まちを まもる"),
                QuizMatchingPair(prompt: "としょかん", match: "本を かりる")
            ],
            choices: ["本を かりる", "かじから まちを まもる", "くらしを ささえる しごとを する"],
            explanation: "しやくしょ、しょうぼうしょ、としょかんは それぞれ ちがう はたらきで まちを ささえています。"
        ),

        QuizQuestion.classification(
            question: "【分類】ばしょを なかまで 分けましょう。",
            pairs: [
                QuizMatchingPair(prompt: "こうばん", match: "みんなのしせつ"),
                QuizMatchingPair(prompt: "えき", match: "のりものの ばしょ"),
                QuizMatchingPair(prompt: "ぱんや", match: "おみせ")
            ],
            categories: ["みんなのしせつ", "のりものの ばしょ", "おみせ"],
            explanation: "こうばんは みんなのしせつ、えきは のりものの ばしょ、ぱんやは おみせです。"
        ),

        QuizQuestion.chronological(
            question: "【年代順に並べる】としょかんで 本を かりる じゅんに ならべましょう。",
            choices: ["本を かりる", "本を えらぶ", "としょかんに 入る"],
            orderedChoices: ["としょかんに 入る", "本を えらぶ", "本を かりる"],
            explanation: "としょかんに 入って、本を えらび、さいごに 本を かります。"
        ),

        QuizQuestion.related(
            question: "【関連づけ】しせつと そこに あるものが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しょうぼうしょ", match: "しょうぼうしゃ"),
                QuizMatchingPair(prompt: "えき", match: "かいさつ"),
                QuizMatchingPair(prompt: "としょかん", match: "本だな")
            ],
            choices: ["本だな", "しょうぼうしゃ", "かいさつ"],
            explanation: "しょうぼうしょには しょうぼうしゃ、えきには かいさつ、としょかんには 本だなが あります。"
        ),

        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "本を借りる",
                "手紙を送る",
                "食事をする"
            ],
            correctAnswerIndex: 2,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "学校で学ぶことはどれですか？",
            choices: [
                "泳ぎ方",
                "勉強",
                "買い物",
                "電車の乗り方"
            ],
            correctAnswerIndex: 1,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "秋に行われる行事はどれですか？",
            choices: [
                "お月見",
                "節分",
                "クリスマス",
                "花火大会"
            ],
            correctAnswerIndex: 0,
            explanation: "お月見は秋に行われる行事です。"
        ),
        QuizQuestion(
            question: "飛行機が離陸するために必要なものはどれですか？",
            choices: [
                "船",
                "道路",
                "滑走路",
                "自転車"
            ],
            correctAnswerIndex: 2,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に相談する",
                "郵便物を送る",
                "ご飯を食べる",
                "買い物をする"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、相談することができます。"
        ),
        QuizQuestion(
            question: "冬に楽しめるものはどれですか？",
            choices: [
                "スキー",
                "花火",
                "プール",
                "運動会"
            ],
            correctAnswerIndex: 0,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "電車の運行に必要なものはどれですか？",
            choices: [
                "飛行機",
                "船",
                "線路",
                "自転車"
            ],
            correctAnswerIndex: 2,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局で送れるものはどれですか？",
            choices: [
                "手紙",
                "本",
                "自転車",
                "バス"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "クリスマスローズ"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "バスが走る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "泳ぐ",
                "本を借りる",
                "電車に乗る",
                "ご飯を食べる"
            ],
            correctAnswerIndex: 1,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "秋に収穫されるものはどれですか？",
            choices: [
                "米",
                "さくらんぼ",
                "スイカ",
                "たけのこ"
            ],
            correctAnswerIndex: 0,
            explanation: "秋には稲の収穫が行われ、お米が収穫されます。"
        ),
        QuizQuestion(
            question: "自転車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "自転車は道路の上を走ります。"
        ),
        QuizQuestion(
            question: "駅でできることはどれですか？",
            choices: [
                "本を読む",
                "電車に乗る",
                "野球をする",
                "勉強する"
            ],
            correctAnswerIndex: 1,
            explanation: "駅では電車に乗ることができます。"
        ),
        QuizQuestion(
            question: "夏に楽しめるものはどれですか？",
            choices: [
                "スキー",
                "プール",
                "雪だるま作り",
                "運動会"
            ],
            correctAnswerIndex: 1,
            explanation: "プールは夏に楽しめる活動です。"
        ),
        QuizQuestion(
            question: "船が進む場所はどこですか？",
            choices: [
                "空",
                "線路",
                "川や海",
                "道路"
            ],
            correctAnswerIndex: 2,
            explanation: "船は川や海の上を進みます。"
        ),
        QuizQuestion(
            question: "警察署でできることはどれですか？",
            choices: [
                "道を聞く",
                "ご飯を食べる",
                "電車に乗る",
                "買い物をする"
            ],
            correctAnswerIndex: 0,
            explanation: "警察署では道を聞いたり、相談することができます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "チューリップ",
                "ひまわり",
                "コスモス",
                "パンジー"
            ],
            correctAnswerIndex: 0,
            explanation: "チューリップは春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "冬に楽しめるものはどれですか？",
            choices: [
                "プール",
                "キャンプ",
                "スキー",
                "花火大会"
            ],
            correctAnswerIndex: 2,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "自動車が走るために必要なものはどれですか？",
            choices: [
                "空",
                "線路",
                "道路",
                "川"
            ],
            correctAnswerIndex: 2,
            explanation: "自動車は道路の上を走ります。"
        ),
        QuizQuestion(
            question: "動物園で見ることができるものはどれですか？",
            choices: [
                "魚",
                "象",
                "飛行機",
                "本"
            ],
            correctAnswerIndex: 1,
            explanation: "動物園では象などの動物を見ることができます。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "りんご",
                "ぶどう",
                "スイカ",
                "みかん"
            ],
            correctAnswerIndex: 2,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "泳ぐ",
                "映画を見る",
                "本を読む",
                "電車に乗る"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "本を借りる",
                "勉強をする",
                "遊具で遊ぶ"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "ご飯を食べる",
                "遊具で遊ぶ",
                "勉強をする"
            ],
            correctAnswerIndex: 2,
            explanation: "公園では遊具で遊んだり散歩をすることができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "花火大会",
                "お月見",
                "お正月"
            ],
            correctAnswerIndex: 1,
            explanation: "花火大会は夏に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "秋に楽しめるものはどれですか？",
            choices: [
                "桜",
                "雪だるま作り",
                "紅葉狩り",
                "プール"
            ],
            correctAnswerIndex: 2,
            explanation: "紅葉狩りは秋に楽しめる行事です。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "本を読む",
                "野球をする",
                "勉強する",
                "料理をする"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "飛行機が飛ぶために必要なものはどれですか？",
            choices: [
                "道路",
                "線路",
                "滑走路",
                "自転車"
            ],
            correctAnswerIndex: 2,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "運動会",
                "節分",
                "花火大会"
            ],
            correctAnswerIndex: 0,
            explanation: "クリスマスは冬の代表的な行事です。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "遊具で遊ぶ",
                "電車に乗る",
                "手紙を送る",
                "本を借りる"
            ],
            correctAnswerIndex: 0,
            explanation: "公園では遊具で遊んだり、散歩を楽しむことができます。"
        ),
        QuizQuestion(
            question: "バスが走るために必要なものはどれですか？",
            choices: [
                "船",
                "道路",
                "線路",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に道を聞く",
                "郵便物を送る",
                "映画を見る",
                "電車に乗る"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、困ったことを相談できます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "桜",
                "コスモス",
                "チューリップ"
            ],
            correctAnswerIndex: 1,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "駅でできることはどれですか？",
            choices: [
                "電車に乗る",
                "本を借りる",
                "郵便物を送る",
                "野球をする"
            ],
            correctAnswerIndex: 0,
            explanation: "駅では電車に乗ることができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "運動会",
                "お正月",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏の代表的な行事です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "手紙を送る",
                "本を借りる",
                "野球をする"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "秋に楽しめる行事はどれですか？",
            choices: [
                "節分",
                "運動会",
                "花火大会",
                "お正月"
            ],
            correctAnswerIndex: 1,
            explanation: "運動会は秋に開催されることが多い行事です。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "映画を見る",
                "手紙を送る",
                "本を借りる",
                "食事をする"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "冬に楽しめるスポーツはどれですか？",
            choices: [
                "スキー",
                "水泳",
                "サッカー",
                "テニス"
            ],
            correctAnswerIndex: 0,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "お正月",
                "花見",
                "花火大会"
            ],
            correctAnswerIndex: 2,
            explanation: "花見は春に行われる行事です。"
        ),
        QuizQuestion(
            question: "バスが通る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "夏に収穫される果物はどれですか？",
            choices: [
                "みかん",
                "いちご",
                "スイカ",
                "ぶどう"
            ],
            correctAnswerIndex: 2,
            explanation: "スイカは夏に収穫される代表的な果物です。"
        ),
        QuizQuestion(
            question: "飛行機が飛ぶために必要なものはどれですか？",
            choices: [
                "船",
                "滑走路",
                "道路",
                "自転車"
            ],
            correctAnswerIndex: 1,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "お月見",
                "花見",
                "お正月"
            ],
            correctAnswerIndex: 0,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "クリスマス",
                "運動会",
                "花火大会",
                "節分"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏の代表的な行事です。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "野球をする",
                "郵便物を送る",
                "勉強する",
                "買い物をする"
            ],
            correctAnswerIndex: 2,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "冬に楽しめる行事はどれですか？",
            choices: [
                "花見",
                "お正月",
                "花火大会",
                "運動会"
            ],
            correctAnswerIndex: 1,
            explanation: "お正月は冬に行われる行事の一つです。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を借りる",
                "映画を見る",
                "野球をする",
                "郵便物を送る"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を借りたり、読むことができます。"
        ),
        QuizQuestion(
            question: "バスが走る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "空",
                "川"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "桜",
                "クリスマスローズ",
                "チューリップ"
            ],
            correctAnswerIndex: 1,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "飛行機が離陸するために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "滑走路",
                "船"
            ],
            correctAnswerIndex: 2,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "秋に行われる行事はどれですか？",
            choices: [
                "節分",
                "クリスマス",
                "運動会",
                "お正月"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会は秋に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "手紙を送る",
                "本を借りる",
                "運動をする"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "りんご",
                "スイカ",
                "みかん",
                "いちご"
            ],
            correctAnswerIndex: 1,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "花火大会",
                "運動会",
                "クリスマス",
                "節分"
            ],
            correctAnswerIndex: 2,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "ひまわり",
                "コスモス",
                "桜",
                "チューリップ"
            ],
            correctAnswerIndex: 2,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に道を聞く",
                "本を借りる",
                "手紙を送る",
                "運動をする"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、困ったことを相談できます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "お正月",
                "花火大会",
                "クリスマス",
                "節分"
            ],
            correctAnswerIndex: 1,
            explanation: "花火大会は夏に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "道路",
                "滑走路",
                "線路",
                "川"
            ],
            correctAnswerIndex: 2,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "映画を見る",
                "手紙を送る",
                "本を借りる",
                "買い物をする"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "お正月",
                "入学式",
                "運動会",
                "花火大会"
            ],
            correctAnswerIndex: 1,
            explanation: "入学式は春（4月）に行われる行事です。"
        ),
        QuizQuestion(
            question: "バスが走る場所はどこですか？",
            choices: [
                "線路",
                "川",
                "道路",
                "空"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "本を借りる",
                "手紙を送る",
                "電車に乗る",
                "映画を見る"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "スイカ",
                "りんご",
                "いちご",
                "みかん"
            ],
            correctAnswerIndex: 0,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "春に楽しめる行事はどれですか？",
            choices: [
                "花火大会",
                "クリスマス",
                "花見",
                "運動会"
            ],
            correctAnswerIndex: 2,
            explanation: "花見は春に楽しめる行事です。"
        ),
        QuizQuestion(
            question: "夏に収穫される果物はどれですか？",
            choices: [
                "みかん",
                "スイカ",
                "いちご",
                "りんご"
            ],
            correctAnswerIndex: 1,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "勉強する",
                "買い物をする",
                "手紙を送る",
                "映画を見る"
            ],
            correctAnswerIndex: 0,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "冬に楽しめるものはどれですか？",
            choices: [
                "スキー",
                "プール",
                "花火",
                "キャンプ"
            ],
            correctAnswerIndex: 0,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "秋に行われる行事はどれですか？",
            choices: [
                "節分",
                "花火大会",
                "運動会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "運動会は秋に行われる行事の一つです。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "道を聞く",
                "買い物をする",
                "映画を見る",
                "本を借りる"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、相談することができます。"
        ),
        QuizQuestion(
            question: "飛行機が飛ぶために必要なものはどれですか？",
            choices: [
                "滑走路",
                "道路",
                "線路",
                "船"
            ],
            correctAnswerIndex: 0,
            explanation: "飛行機は滑走路を使って離陸します。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "本を借りる",
                "電車に乗る",
                "運動をする"
            ],
            correctAnswerIndex: 1,
            explanation: "図書館では本を借りたり、読むことができます。"
        ),
        QuizQuestion(
            question: "バスが走るために必要なものはどれですか？",
            choices: [
                "船",
                "道路",
                "線路",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局で送れるものはどれですか？",
            choices: [
                "手紙",
                "本",
                "野球道具",
                "洋服"
            ],
            correctAnswerIndex: 0,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "秋に楽しめるものはどれですか？",
            choices: [
                "雪だるま作り",
                "花火",
                "紅葉狩り",
                "プール"
            ],
            correctAnswerIndex: 2,
            explanation: "紅葉狩りは秋に楽しめる代表的な行事です。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "花火大会",
                "クリスマス",
                "運動会",
                "花見"
            ],
            correctAnswerIndex: 1,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "夏に収穫されるものはどれですか？",
            choices: [
                "スイカ",
                "りんご",
                "みかん",
                "いちご"
            ],
            correctAnswerIndex: 0,
            explanation: "スイカは夏に収穫される果物です。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "遊具で遊ぶ",
                "郵便物を送る",
                "電車に乗る",
                "勉強をする"
            ],
            correctAnswerIndex: 0,
            explanation: "公園では遊具で遊んだり、散歩を楽しむことができます。"
        ),
        QuizQuestion(
            question: "学校で学べることはどれですか？",
            choices: [
                "買い物",
                "勉強",
                "映画鑑賞",
                "手紙の発送"
            ],
            correctAnswerIndex: 1,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を借りる",
                "スポーツをする",
                "映画を見る",
                "郵便物を送る"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を借りたり、読むことができます。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "川",
                "道路",
                "空"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "夏に楽しめるものはどれですか？",
            choices: [
                "雪合戦",
                "花火",
                "クリスマス",
                "紅葉狩り"
            ],
            correctAnswerIndex: 1,
            explanation: "花火は夏の代表的な楽しみの一つです。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "警察官に道を聞く",
                "郵便物を送る",
                "本を借りる",
                "食事をする"
            ],
            correctAnswerIndex: 0,
            explanation: "交番では警察官に道を聞いたり、困ったことを相談できます。"
        ),
        QuizQuestion(
            question: "バスが通る場所はどこですか？",
            choices: [
                "線路",
                "道路",
                "川",
                "空"
            ],
            correctAnswerIndex: 1,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に行われる行事はどれですか？",
            choices: [
                "お正月",
                "花見",
                "クリスマス",
                "花火大会"
            ],
            correctAnswerIndex: 1,
            explanation: "花見は春に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "冬に楽しめるスポーツはどれですか？",
            choices: [
                "サッカー",
                "水泳",
                "スキー",
                "テニス"
            ],
            correctAnswerIndex: 2,
            explanation: "スキーは冬に楽しめるスポーツです。"
        ),
        QuizQuestion(
            question: "学校でできることはどれですか？",
            choices: [
                "勉強する",
                "郵便物を送る",
                "本を借りる",
                "電車に乗る"
            ],
            correctAnswerIndex: 0,
            explanation: "学校では主に勉強を学びます。"
        ),
        QuizQuestion(
            question: "秋に収穫されるものはどれですか？",
            choices: [
                "稲",
                "スイカ",
                "イチゴ",
                "ミカン"
            ],
            correctAnswerIndex: 0,
            explanation: "稲は秋に収穫される代表的な作物です。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "電車に乗る",
                "郵便物を送る",
                "本を読む",
                "勉強する"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "本を読む",
                "郵便物を送る",
                "料理をする",
                "電車に乗る"
            ],
            correctAnswerIndex: 0,
            explanation: "図書館では本を読むことができます。"
        ),
        QuizQuestion(
            question: "夏に行われる行事はどれですか？",
            choices: [
                "運動会",
                "お月見",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "バスが走るために必要なものはどれですか？",
            choices: [
                "川",
                "線路",
                "道路",
                "空"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "スイセン"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "警察官に道を聞く",
                "勉強する",
                "本を借りる"
            ],
            correctAnswerIndex: 1,
            explanation: "交番では警察官に道を聞いたり、困りごとを相談できます。"
        ),
        QuizQuestion(
            question: "夏に楽しめる行事はどれですか？",
            choices: [
                "お正月",
                "節分",
                "花火大会",
                "クリスマス"
            ],
            correctAnswerIndex: 2,
            explanation: "花火大会は夏に楽しめる行事の一つです。"
        ),
        QuizQuestion(
            question: "電車が走るために必要なものはどれですか？",
            choices: [
                "線路",
                "道路",
                "滑走路",
                "川"
            ],
            correctAnswerIndex: 0,
            explanation: "電車は線路の上を走ります。"
        ),
        QuizQuestion(
            question: "図書館でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "映画を見る",
                "本を借りる",
                "電車に乗る"
            ],
            correctAnswerIndex: 2,
            explanation: "図書館では本を借りたり読むことができます。"
        ),
        QuizQuestion(
            question: "冬に行われる行事はどれですか？",
            choices: [
                "節分",
                "お月見",
                "クリスマス",
                "花火大会"
            ],
            correctAnswerIndex: 2,
            explanation: "クリスマスは冬に行われる代表的な行事です。"
        ),
        QuizQuestion(
            question: "バスが通る場所はどこですか？",
            choices: [
                "川",
                "線路",
                "道路",
                "空"
            ],
            correctAnswerIndex: 2,
            explanation: "バスは道路の上を走ります。"
        ),
        QuizQuestion(
            question: "郵便局でできることはどれですか？",
            choices: [
                "本を借りる",
                "郵便物を送る",
                "電車に乗る",
                "食事をする"
            ],
            correctAnswerIndex: 1,
            explanation: "郵便局では手紙や荷物を送ることができます。"
        ),
        QuizQuestion(
            question: "春に咲く花はどれですか？",
            choices: [
                "桜",
                "ひまわり",
                "コスモス",
                "パンジー"
            ],
            correctAnswerIndex: 0,
            explanation: "桜は春に咲く代表的な花です。"
        ),
        QuizQuestion(
            question: "公園でできることはどれですか？",
            choices: [
                "郵便物を送る",
                "遊具で遊ぶ",
                "本を借りる",
                "買い物をする"
            ],
            correctAnswerIndex: 1,
            explanation: "公園では遊具で遊んだり、散歩を楽しむことができます。"
        ),
        QuizQuestion(
            question: "秋に楽しめるものはどれですか？",
            choices: [
                "雪だるま作り",
                "紅葉狩り",
                "スキー",
                "海水浴"
            ],
            correctAnswerIndex: 1,
            explanation: "紅葉狩りは秋に楽しめる代表的な活動です。"
        ),
        QuizQuestion(
            question: "交番でできることはどれですか？",
            choices: [
                "映画を見る",
                "手紙を送る",
                "警察官に道を聞く",
                "本を借りる"
            ],
            correctAnswerIndex: 2,
            explanation: "交番では警察官に道を聞いたり、困ったときに相談できます。"
        ),

        QuizQuestion(
        question: "町たんけんで、地図と実際の町を見くらべるとき、同じ場所を見つける手がかりとして役立つものはどれですか？",
        choices: [
        "その日の給食のメニュー",
        "自分の好きな遊び",
        "目立つ建物や道路の形",
        "昨日見たテレビ番組"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『目立つ建物や道路の形』です。目立つ建物や道路の曲がり方などを手がかりにすると、地図と実際の町を見くらべやすくなります。"
        ),

        QuizQuestion(
        question: "家や建物についている住所の表示を見ると、主に何がわかりますか？",
        choices: [
        "その建物がある場所",
        "明日の天気",
        "住んでいる人の好きな食べ物",
        "近くを通る車の台数"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『その建物がある場所』です。住所の表示は、その建物が町のどこにあるのかを知る手がかりになります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】二つ以上の道路が交わる場所を『＿＿』といいます。",
        answer: "交差点",
        acceptableAnswers: ["こうさてん"],
        explanation: "＿＿に入る言葉は『交差点』です。交差点では、いくつかの道路が交わっています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町で見かけるものと、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "車止め", match: "車が入ってはいけない場所への進入を防ぐ"),
        QuizMatchingPair(prompt: "押しボタン式信号のボタン", match: "道路を渡りたいことを信号に知らせる"),
        QuizMatchingPair(prompt: "道路名の表示", match: "道路の名前を知らせる"),
        QuizMatchingPair(prompt: "防火水槽の標識", match: "消火に使う水がある場所を知らせる")
        ],
        choices: [
        "道路の名前を知らせる",
        "消火に使う水がある場所を知らせる",
        "車が入ってはいけない場所への進入を防ぐ",
        "道路を渡りたいことを信号に知らせる"
        ],
        explanation: "車止めは『車が入ってはいけない場所への進入を防ぐ』、押しボタン式信号のボタンは『道路を渡りたいことを信号に知らせる』、道路名の表示は『道路の名前を知らせる』、防火水槽の標識は『消火に使う水がある場所を知らせる』役わりがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】町で見つけた場所を、その特徴に合う仲間へ分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "地下道", match: "道路を安全に通るための場所"),
        QuizMatchingPair(prompt: "用水路", match: "水を流す場所"),
        QuizMatchingPair(prompt: "畑", match: "作物を育てる場所"),
        QuizMatchingPair(prompt: "神社", match: "地域にある建物")
        ],
        categories: [
        "道路を安全に通るための場所",
        "水を流す場所",
        "作物を育てる場所",
        "地域にある建物"
        ],
        explanation: "地下道は『道路を安全に通るための場所』、用水路は『水を流す場所』、畑は『作物を育てる場所』、神社は『地域にある建物』です。"
        ),

        QuizQuestion(
        question: "スーパーで冷凍食品を冷凍ケースに入れておく大きな理由はどれですか？",
        choices: [
        "品物を温めるため",
        "品物を凍った状態に保つため",
        "値段を高くするため",
        "品物を重くするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『品物を凍った状態に保つため』です。冷凍食品は、冷凍ケースで低い温度に保って売られています。"
        ),

        QuizQuestion(
        question: "買い物をしたあとにもらうレシートを見ると、何を確かめることができますか？",
        choices: [
        "明日の営業時間だけ",
        "店員さんの好きな品物",
        "店の建物の高さ",
        "買った品物や支払った金額"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『買った品物や支払った金額』です。レシートには、買った品物や金額などが書かれています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】豆腐や油揚げなどを主に作ったり売ったりする店を『＿＿』といいます。",
        answer: "豆腐屋",
        acceptableAnswers: ["とうふや"],
        explanation: "＿＿に入る言葉は『豆腐屋』です。豆腐屋では、豆腐や油揚げなどを作ったり売ったりしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店と、そこで売っていることが多いものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "おもちゃ屋", match: "積み木"),
        QuizMatchingPair(prompt: "楽器店", match: "リコーダー"),
        QuizMatchingPair(prompt: "手芸店", match: "毛糸"),
        QuizMatchingPair(prompt: "園芸店", match: "花の苗")
        ],
        choices: [
        "花の苗",
        "積み木",
        "毛糸",
        "リコーダー"
        ],
        explanation: "おもちゃ屋では『積み木』、楽器店では『リコーダー』、手芸店では『毛糸』、園芸店では『花の苗』を売っていることが多いです。"
        ),

        QuizQuestion(
        question: "野菜や果物に『○○県産』などと書かれている表示からわかることはどれですか？",
        choices: [
        "その品物が作られた地域",
        "その店で働く人の人数",
        "品物を運んだ車の色",
        "店ができた年"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『その品物が作られた地域』です。『○○県産』などの産地表示を見ると、その品物がどこで作られたのかがわかります。"
        ),

        QuizQuestion(
        question: "郵便配達の人が雨の日に郵便物をぬらさないように気をつける理由はどれですか？",
        choices: [
        "郵便物を重くするため",
        "配る家を増やすため",
        "手紙や荷物をよい状態で届けるため",
        "道路をぬらさないため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『手紙や荷物をよい状態で届けるため』です。郵便配達の人は、大切な郵便物をできるだけ傷めずに届けるよう気をつけています。"
        ),

        QuizQuestion(
        question: "給食を作る調理員が、調理の前に手をよく洗う大きな理由はどれですか？",
        choices: [
        "料理の色を変えるため",
        "食べ物を清潔にあつかうため",
        "調理時間を長くするため",
        "食器を重くするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『食べ物を清潔にあつかうため』です。調理員は、食べる人が安心して食事をできるように衛生に気をつけています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】図書館で本を整理したり、利用する人の本探しを手伝ったりする人を『＿＿』といいます。",
        answer: "司書",
        acceptableAnswers: ["ししょ"],
        explanation: "＿＿に入る言葉は『司書』です。司書は、本を整理したり、本を探す人を手伝ったりする仕事をします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】働く人と、その人が働くことの多い場所が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "司書", match: "図書館"),
        QuizMatchingPair(prompt: "薬剤師", match: "薬局"),
        QuizMatchingPair(prompt: "飼育員", match: "動物園"),
        QuizMatchingPair(prompt: "郵便配達員", match: "地域の家や事業所")
        ],
        choices: [
        "動物園",
        "地域の家や事業所",
        "薬局",
        "図書館"
        ],
        explanation: "司書は『図書館』、薬剤師は『薬局』、飼育員は『動物園』で働きます。郵便配達員は『地域の家や事業所』を回って郵便物を届けます。"
        ),

        QuizQuestion.classification(
        question: "【分類】働く人を、その仕事の内容に合う仲間へ分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "家具職人", match: "物を作る"),
        QuizMatchingPair(prompt: "自転車修理店の人", match: "物を直す"),
        QuizMatchingPair(prompt: "観光案内所の人", match: "人を案内する"),
        QuizMatchingPair(prompt: "花を育てる農家", match: "植物を育てる")
        ],
        categories: [
        "物を作る",
        "物を直す",
        "人を案内する",
        "植物を育てる"
        ],
        explanation: "家具職人は『物を作る』、自転車修理店の人は『物を直す』、観光案内所の人は『人を案内する』、花を育てる農家は『植物を育てる』仕事をします。"
        ),

        QuizQuestion(
        question: "ごみ収集車が主に運ぶものはどれですか？",
        choices: [
        "図書館の本",
        "電車の乗客",
        "店で売る洋服",
        "決められた場所から集めたごみ"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『決められた場所から集めたごみ』です。ごみ収集車は、地域で出されたごみを集めて処理する施設などへ運びます。"
        ),

        QuizQuestion(
        question: "宅配便のトラックの主な役わりはどれですか？",
        choices: [
        "荷物をいろいろな場所へ運ぶ",
        "線路の上だけを走る",
        "道路の雪だけを取り除く",
        "火事を消す"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『荷物をいろいろな場所へ運ぶ』です。宅配便のトラックは、荷物を営業所や家などへ運ぶために使われます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】一つの乗り物から別の乗り物に乗りかえることを『＿＿』といいます。",
        answer: "乗り換え",
        acceptableAnswers: ["のりかえ", "乗換え", "乗換"],
        explanation: "＿＿に入る言葉は『乗り換え』です。電車やバスなどから別の乗り物へ移ることを乗り換えといいます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】特別な役わりをもつ車と、その仕事が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ごみ収集車", match: "ごみを集めて運ぶ"),
        QuizMatchingPair(prompt: "レッカー車", match: "動けなくなった自動車などを運ぶ"),
        QuizMatchingPair(prompt: "除雪車", match: "道路の雪を取り除く"),
        QuizMatchingPair(prompt: "移動販売車", match: "品物を載せて地域を回り販売する")
        ],
        choices: [
        "道路の雪を取り除く",
        "品物を載せて地域を回り販売する",
        "ごみを集めて運ぶ",
        "動けなくなった自動車などを運ぶ"
        ],
        explanation: "ごみ収集車は『ごみを集めて運ぶ』、レッカー車は『動けなくなった自動車などを運ぶ』、除雪車は『道路の雪を取り除く』、移動販売車は『品物を載せて地域を回り販売する』役わりがあります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】駅で電車を乗り換えるときの流れを順番に並べましょう。",
        choices: [
        "乗り換え案内の表示を確かめる",
        "次の電車のホームへ行く",
        "乗っていた電車を降りる",
        "次の電車に乗る"
        ],
        orderedChoices: [
        "乗っていた電車を降りる",
        "乗り換え案内の表示を確かめる",
        "次の電車のホームへ行く",
        "次の電車に乗る"
        ],
        explanation: "『乗っていた電車を降りる』→『乗り換え案内の表示を確かめる』→『次の電車のホームへ行く』→『次の電車に乗る』の順です。"
        ),

        QuizQuestion(
        question: "子育て支援センターでできることとして、いちばん合っているものはどれですか？",
        choices: [
        "自動車の修理をしてもらう",
        "小さい子どもと保護者が遊んだり相談したりする",
        "電車の荷物を積みこむ",
        "魚を売ってもらう"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『小さい子どもと保護者が遊んだり相談したりする』です。子育て支援センターは、子育て中の家庭を支えるための施設です。"
        ),

        QuizQuestion(
        question: "公共施設で、トイレや出口などを絵で表したマークを使うよさはどれですか？",
        choices: [
        "建物を大きく見せられる",
        "部屋の数を増やせる",
        "文字だけより意味を見分けやすくなる",
        "施設を暗くできる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『文字だけより意味を見分けやすくなる』です。絵で表したマークは、場所や設備の意味を多くの人に伝えやすくする工夫です。"
        ),

        QuizQuestion(
        question: "公共施設の受付で番号札を取って待つしくみには、どんなよさがありますか？",
        choices: [
        "建物の外へ早く出られる",
        "受付の机を小さくできる",
        "利用する人を少なくできる",
        "受付の順番がわかりやすくなる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『受付の順番がわかりやすくなる』です。番号札を使うと、自分の順番を確かめながら待つことができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】公共施設と、そこにあることが多い場所や設備が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市民体育館", match: "体育室"),
        QuizMatchingPair(prompt: "文化会館", match: "ホール"),
        QuizMatchingPair(prompt: "保健センター", match: "健康相談室"),
        QuizMatchingPair(prompt: "図書館", match: "閲覧席")
        ],
        choices: [
        "閲覧席",
        "健康相談室",
        "体育室",
        "ホール"
        ],
        explanation: "市民体育館には『体育室』、文化会館には『ホール』、保健センターには『健康相談室』、図書館には『閲覧席』があることがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】公共施設で見かけるマークを、その意味に合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "「i」と書かれた案内マーク", match: "案内"),
        QuizMatchingPair(prompt: "車いすのマーク", match: "車いすで利用しやすい設備"),
        QuizMatchingPair(prompt: "男女の人の形が描かれたマーク", match: "トイレ"),
        QuizMatchingPair(prompt: "階段を上る人が描かれたマーク", match: "階段")
        ],
        categories: [
        "案内",
        "車いすで利用しやすい設備",
        "トイレ",
        "階段"
        ],
        explanation: "『i』のマークは『案内』、車いすのマークは『車いすで利用しやすい設備』、男女の人の形が描かれたマークは『トイレ』、階段を上る人が描かれたマークは『階段』を表します。"
        ),

        QuizQuestion(
        question: "地域の音楽会で、ほかの人が演奏しているときの行動としてよいものはどれですか？",
        choices: [
        "静かに演奏を聴く",
        "会場を走り回る",
        "大きな声で話し続ける",
        "演奏中の人の前を何度も横切る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『静かに演奏を聴く』です。地域の音楽会では、演奏している人やほかの参加者のことを考えて行動します。"
        ),

        QuizQuestion(
        question: "地域のみんなで防災マップを作るとき、調べておくとよいことはどれですか？",
        choices: [
        "好きなお菓子を売る店だけ",
        "避難できる場所や危険に注意する場所",
        "家で見るテレビ番組",
        "学校の給食の順番"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『避難できる場所や危険に注意する場所』です。防災マップには、災害のときに役立つ場所や注意する場所を記録します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域のお祭りで、飾りをつけて人が引いたり動かしたりする大きな車を『＿＿』といいます。",
        answer: "山車",
        acceptableAnswers: ["だし"],
        explanation: "＿＿に入る言葉は『山車』です。地域によっては、お祭りで飾りをつけた山車を引いて町を進むことがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の行事や活動を、その主な目的に合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "避難訓練", match: "安全を守る"),
        QuizMatchingPair(prompt: "川のごみ拾い", match: "環境をきれいにする"),
        QuizMatchingPair(prompt: "地域交流会", match: "人どうしが交流する"),
        QuizMatchingPair(prompt: "伝統芸能の発表会", match: "地域の文化に親しむ")
        ],
        categories: [
        "安全を守る",
        "環境をきれいにする",
        "人どうしが交流する",
        "地域の文化に親しむ"
        ],
        explanation: "避難訓練は『安全を守る』、川のごみ拾いは『環境をきれいにする』、地域交流会は『人どうしが交流する』、伝統芸能の発表会は『地域の文化に親しむ』ことを主な目的とした活動です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域の運動会が始まってから終わるまでの流れを順番に並べましょう。",
        choices: [
        "競技に参加する",
        "閉会式に参加する",
        "開会式に参加する",
        "準備運動をする"
        ],
        orderedChoices: [
        "開会式に参加する",
        "準備運動をする",
        "競技に参加する",
        "閉会式に参加する"
        ],
        explanation: "『開会式に参加する』→『準備運動をする』→『競技に参加する』→『閉会式に参加する』の順です。"
        ),

        QuizQuestion(
        question: "町たんけんで、道のわきにある『側溝（そっこう）』を見つけました。側溝の主な役わりはどれですか？",
        choices: [
        "雨水などを流す",
        "電車を走らせる",
        "本を置く",
        "自転車を止める"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『雨水などを流す』です。側溝は、道路などにたまる雨水を流すために作られています。"
        ),

        QuizQuestion(
        question: "商店街の通りに屋根のようなアーケードがあると、どんなよさがありますか？",
        choices: [
        "車が空を飛べるようになる",
        "雨や強い日ざしをさけて歩きやすくなる",
        "道路が線路に変わる",
        "店の中が見えなくなる"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『雨や強い日ざしをさけて歩きやすくなる』です。アーケードの屋根は、買い物をする人などが歩きやすいように役立っています。"
        ),

        QuizQuestion(
        question: "交通量の多い道路に歩道橋が作られている大きな理由はどれですか？",
        choices: [
        "車を止めておくため",
        "店の商品を並べるため",
        "歩く人が車道を通らずに道路を渡れるようにするため",
        "雨水をためるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『歩く人が車道を通らずに道路を渡れるようにするため』です。歩道橋は、歩く人が道路を安全に渡るために役立ちます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町で見つける設備と、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "地域の掲示板", match: "地域のお知らせを伝える"),
        QuizMatchingPair(prompt: "消火栓", match: "消火に使う水を取り出せるようにする"),
        QuizMatchingPair(prompt: "雨水ます", match: "道路の雨水を流れこませる"),
        QuizMatchingPair(prompt: "横断旗", match: "道路を渡る人がいることを車に知らせやすくする")
        ],
        choices: [
        "道路の雨水を流れこませる",
        "地域のお知らせを伝える",
        "道路を渡る人がいることを車に知らせやすくする",
        "消火に使う水を取り出せるようにする"
        ],
        explanation: "地域の掲示板は『地域のお知らせを伝える』、消火栓は『消火に使う水を取り出せるようにする』、雨水ますは『道路の雨水を流れこませる』、横断旗は『道路を渡る人がいることを車に知らせやすくする』役わりがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】町たんけんで行う記録を、何を記録する方法かで分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "建物の写真を撮る", match: "見た目の記録"),
        QuizMatchingPair(prompt: "気づいたことを文章で書く", match: "言葉の記録"),
        QuizMatchingPair(prompt: "地図に見つけた場所の印をつける", match: "場所の記録"),
        QuizMatchingPair(prompt: "通ったバスの台数を数える", match: "数の記録")
        ],
        categories: [
        "見た目の記録",
        "言葉の記録",
        "場所の記録",
        "数の記録"
        ],
        explanation: "写真は『見た目の記録』、文章のメモは『言葉の記録』、地図の印は『場所の記録』、台数を数えることは『数の記録』になります。"
        ),

        QuizQuestion(
        question: "自転車のタイヤに穴があいて空気がぬけたとき、相談する店としていちばん合っているのはどれですか？",
        choices: [
        "お菓子屋",
        "花屋",
        "本屋",
        "自転車店"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『自転車店』です。自転車店では、自転車を売るだけでなく、パンクなどの修理をしていることがあります。"
        ),

        QuizQuestion(
        question: "電器店で売っていることが多いものはどれですか？",
        choices: [
        "照明器具",
        "生の魚",
        "切り花",
        "教科書"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『照明器具』です。電器店では、照明器具や家で使う電気製品などを売っています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】まんじゅうやようかんなど、日本で昔から親しまれてきたお菓子を主に売る店を『＿＿』といいます。",
        answer: "和菓子屋",
        acceptableAnswers: ["わがしや"],
        explanation: "＿＿に入る言葉は『和菓子屋』です。和菓子屋では、まんじゅうやようかんなどの和菓子を売っています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店と、そこで買ったり頼んだりできるものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "家具店", match: "机やいす"),
        QuizMatchingPair(prompt: "スポーツ用品店", match: "ボールや運動用具"),
        QuizMatchingPair(prompt: "ペットショップ", match: "ペットのえさや用品"),
        QuizMatchingPair(prompt: "写真店", match: "写真のプリント")
        ],
        choices: [
        "ペットのえさや用品",
        "写真のプリント",
        "机やいす",
        "ボールや運動用具"
        ],
        explanation: "家具店は『机やいす』、スポーツ用品店は『ボールや運動用具』、ペットショップは『ペットのえさや用品』、写真店では『写真のプリント』を頼むことができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】店で買う品物を、何に使うものかで分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "食パン", match: "食べ物"),
        QuizMatchingPair(prompt: "くつ下", match: "身につけるもの"),
        QuizMatchingPair(prompt: "消しゴム", match: "学習に使うもの"),
        QuizMatchingPair(prompt: "ティッシュペーパー", match: "生活に使うもの")
        ],
        categories: [
        "食べ物",
        "身につけるもの",
        "学習に使うもの",
        "生活に使うもの"
        ],
        explanation: "食パンは『食べ物』、くつ下は『身につけるもの』、消しゴムは『学習に使うもの』、ティッシュペーパーは『生活に使うもの』です。"
        ),

        QuizQuestion(
        question: "電気工事をする人が、電線やコンセントを安全に点検する理由はどれですか？",
        choices: [
        "建物を高くするため",
        "電気を安全に使えるようにするため",
        "道路を広くするため",
        "店の商品を増やすため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『電気を安全に使えるようにするため』です。電気工事をする人は、電気の設備を点検したり直したりして、安全なくらしを支えています。"
        ),

        QuizQuestion(
        question: "清掃の仕事をする人が、ぬれた床の近くに『すべりやすいので注意』という表示を置く理由はどれですか？",
        choices: [
        "床を暗くするため",
        "掃除道具をかくすため",
        "通る人がすべって転ばないようにするため",
        "人を集めるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『通る人がすべって転ばないようにするため』です。清掃中は、周りの人の安全にも気をつけて仕事をします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】病院などで、病気やけがをした人の世話をしたり、医師の仕事を助けたりする人を『＿＿』といいます。",
        answer: "看護師",
        acceptableAnswers: ["かんごし"],
        explanation: "＿＿に入る言葉は『看護師』です。看護師は、病気やけがをした人の世話をしたり、診療を助けたりします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域で働く人と、その仕事が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "看護師", match: "病気やけがをした人の世話をする"),
        QuizMatchingPair(prompt: "電気工事をする人", match: "電気の設備を取り付けたり直したりする"),
        QuizMatchingPair(prompt: "水道工事をする人", match: "水道管などを直す"),
        QuizMatchingPair(prompt: "保育士", match: "小さい子どもの生活や遊びを支える")
        ],
        choices: [
        "水道管などを直す",
        "小さい子どもの生活や遊びを支える",
        "電気の設備を取り付けたり直したりする",
        "病気やけがをした人の世話をする"
        ],
        explanation: "看護師は『病気やけがをした人の世話をする』、電気工事をする人は『電気の設備を取り付けたり直したりする』、水道工事をする人は『水道管などを直す』、保育士は『小さい子どもの生活や遊びを支える』仕事をします。"
        ),

        QuizQuestion.classification(
        question: "【分類】働く人が使うものを、その主な役わりに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "工事場所のカラーコーン", match: "危ない場所を知らせる"),
        QuizMatchingPair(prompt: "ぬれた床の注意表示", match: "すべる危険を知らせる"),
        QuizMatchingPair(prompt: "仕事用の名札", match: "名前や担当を知らせる"),
        QuizMatchingPair(prompt: "作業用の手袋", match: "手を守る")
        ],
        categories: [
        "危ない場所を知らせる",
        "すべる危険を知らせる",
        "名前や担当を知らせる",
        "手を守る"
        ],
        explanation: "カラーコーンは『危ない場所を知らせる』、ぬれた床の注意表示は『すべる危険を知らせる』、名札は『名前や担当を知らせる』、作業用の手袋は『手を守る』ために使います。"
        ),

        QuizQuestion(
        question: "地下鉄の大きな特徴として合っているものはどれですか？",
        choices: [
        "海の上だけを走る",
        "空を飛んで進む",
        "人が押して進む",
        "地下に作られた線路を走る区間が多い"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『地下に作られた線路を走る区間が多い』です。地下鉄は、町の地下を通る線路を利用して人を運びます。"
        ),

        QuizQuestion(
        question: "モノレールの特徴として合っているものはどれですか？",
        choices: [
        "一本のレールや一本の軌道を使って走る",
        "必ず海の中を走る",
        "翼を広げて空を飛ぶ",
        "人がペダルをこいで進む"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『一本のレールや一本の軌道を使って走る』です。モノレールは、一本のレールや細長い軌道に沿って走る乗り物です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】山などで、ロープにつながれた乗り物に乗って空中を移動するものを『＿＿』といいます。",
        answer: "ロープウェイ",
        acceptableAnswers: ["ロープウエー", "ろーぷうぇい"],
        explanation: "＿＿に入る言葉は『ロープウェイ』です。ロープウェイは、ロープにつながれたゴンドラなどで山の斜面や谷を移動します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】乗り物と、主に運ぶものや利用する人が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "スクールバス", match: "学校へ通う子どもたち"),
        QuizMatchingPair(prompt: "貨物列車", match: "たくさんの荷物"),
        QuizMatchingPair(prompt: "観光バス", match: "観光地をめぐる人たち"),
        QuizMatchingPair(prompt: "送迎バス", match: "施設などへ行き来する人たち")
        ],
        choices: [
        "観光地をめぐる人たち",
        "たくさんの荷物",
        "施設などへ行き来する人たち",
        "学校へ通う子どもたち"
        ],
        explanation: "スクールバスは『学校へ通う子どもたち』、貨物列車は『たくさんの荷物』、観光バスは『観光地をめぐる人たち』、送迎バスは『施設などへ行き来する人たち』を運びます。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】路線バスで目的の停留所に近づいてから降りるまでの流れを順番に並べましょう。",
        choices: [
        "バスが止まってから出口へ進む",
        "降りたい停留所の名前を確かめる",
        "安全を確かめてバスを降りる",
        "降車ボタンを押す"
        ],
        orderedChoices: [
        "降りたい停留所の名前を確かめる",
        "降車ボタンを押す",
        "バスが止まってから出口へ進む",
        "安全を確かめてバスを降りる"
        ],
        explanation: "『降りたい停留所の名前を確かめる』→『降車ボタンを押す』→『バスが止まってから出口へ進む』→『安全を確かめてバスを降りる』の順です。"
        ),

        QuizQuestion(
        question: "図書館にある返却ポストは、何をするためのものですか？",
        choices: [
        "新しい本を買う",
        "借りた本を返す",
        "電車の切符を買う",
        "荷物を預ける"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『借りた本を返す』です。返却ポストは、図書館で借りた本を返すために使います。"
        ),

        QuizQuestion(
        question: "公共施設の入口にスロープが作られている大きな理由はどれですか？",
        choices: [
        "建物を高く見せるため",
        "雨水をためるため",
        "車いすやベビーカーなどでも段差を通りやすくするため",
        "自動車を速く走らせるため"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『車いすやベビーカーなどでも段差を通りやすくするため』です。スロープは、さまざまな人が施設を利用しやすくするために役立ちます。"
        ),

        QuizQuestion(
        question: "公共施設で『非常口』の表示を確かめておくと、どんなときに役立ちますか？",
        choices: [
        "買い物の値段を比べるとき",
        "本を選ぶとき",
        "昼ごはんを決めるとき",
        "火事や地震などで建物の外へ避難するとき"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『火事や地震などで建物の外へ避難するとき』です。非常口は、緊急時に建物の外へ避難するための出口を示します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】公共施設にある設備と、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "エレベーター", match: "階と階の間を移動しやすくする"),
        QuizMatchingPair(prompt: "スロープ", match: "段差を通りやすくする"),
        QuizMatchingPair(prompt: "手すり", match: "歩いたり立ったりするときの支えになる"),
        QuizMatchingPair(prompt: "多目的トイレ", match: "さまざまな人が利用しやすいようにする")
        ],
        choices: [
        "歩いたり立ったりするときの支えになる",
        "さまざまな人が利用しやすいようにする",
        "階と階の間を移動しやすくする",
        "段差を通りやすくする"
        ],
        explanation: "エレベーターは『階と階の間を移動しやすくする』、スロープは『段差を通りやすくする』、手すりは『歩いたり立ったりするときの支えになる』、多目的トイレは『さまざまな人が利用しやすいようにする』設備です。"
        ),

        QuizQuestion.classification(
        question: "【分類】公共施設での行動を、その行動で大切にしていることに分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "廊下を走らない", match: "安全"),
        QuizMatchingPair(prompt: "大きな声を出さない", match: "静かさ"),
        QuizMatchingPair(prompt: "出したごみを決められた場所に捨てる", match: "清潔"),
        QuizMatchingPair(prompt: "受付で順番を守る", match: "順番")
        ],
        categories: [
        "安全",
        "静かさ",
        "清潔",
        "順番"
        ],
        explanation: "『廊下を走らない』は安全、『大きな声を出さない』は静かさ、『出したごみを決められた場所に捨てる』は清潔、『受付で順番を守る』は順番を大切にする行動です。"
        ),

        QuizQuestion(
        question: "地域の防犯パトロールで行うこととして、いちばん合っているものはどれですか？",
        choices: [
        "町を歩き、危ない場所や変わったことがないか見守る",
        "店の商品を勝手に持ち帰る",
        "道路にごみを置いていく",
        "信号を見ずに道路を渡る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『町を歩き、危ない場所や変わったことがないか見守る』です。防犯パトロールでは、地域の安全を守るために町のようすを見守ります。"
        ),

        QuizQuestion(
        question: "地域のマラソン大会で参加者がゼッケンをつける理由はどれですか？",
        choices: [
        "走る道を長くするため",
        "参加者を番号などで見分けやすくするため",
        "靴を重くするため",
        "会場を暗くするため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『参加者を番号などで見分けやすくするため』です。ゼッケンには番号などが書かれ、参加者を確認するときに役立ちます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】朝などに、音楽や号令に合わせてみんなで体を動かす活動を『＿＿』といいます。",
        answer: "ラジオ体操",
        acceptableAnswers: ["らじおたいそう"],
        explanation: "＿＿に入る言葉は『ラジオ体操』です。地域で朝に集まり、みんなでラジオ体操をすることがあります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】畑で土の中からサツマイモなどを掘り出して楽しむ地域の行事を『＿＿』といいます。",
        answer: "芋掘り",
        acceptableAnswers: ["いもほり", "いも掘り", "芋ほり"],
        explanation: "＿＿に入る言葉は『芋掘り』です。芋掘りでは、畑で育ったサツマイモなどを土の中から掘り出します。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域の作品展に作品を出すときの流れを順番に並べましょう。",
        choices: [
        "完成した作品と札を会場に並べる",
        "作品を完成させる",
        "展示期間が終わったら作品を片づける",
        "完成した作品の作品名と作者名の札を作る"
        ],
        orderedChoices: [
        "作品を完成させる",
        "完成した作品の作品名と作者名の札を作る",
        "完成した作品と札を会場に並べる",
        "展示期間が終わったら作品を片づける"
        ],
        explanation: "『作品を完成させる』→『完成した作品の作品名と作者名の札を作る』→『完成した作品と札を会場に並べる』→『展示期間が終わったら作品を片づける』の順です。"
        ),

        QuizQuestion(
        question: "町たんけんで『通学路』と書かれた標識を見つけました。この標識からわかることはどれですか？",
        choices: [
        "子どもたちが学校へ通うためによく使う道であること",
        "電車だけが通る道であること",
        "買い物をしてはいけない道であること",
        "夜だけ通れる道であること"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『子どもたちが学校へ通うためによく使う道であること』です。通学路は、子どもたちが学校へ通うときによく使う道です。"
        ),

        QuizQuestion(
        question: "町たんけんで、同じ種類の店が何軒あるか調べたいとき、いちばんよい方法はどれですか？",
        choices: [
        "店の前を走り抜ける",
        "見つけるたびに印をつけて数える",
        "一軒だけ見て全部を予想する",
        "店の名前を見ないで歩く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『見つけるたびに印をつけて数える』です。見つけた店を一つずつ記録すると、数えまちがいを減らせます。"
        ),

        QuizQuestion(
        question: "町たんけんで、歩道がない道を歩く必要があるときに大切なことはどれですか？",
        choices: [
        "友だちと横一列に広がって歩く",
        "道路のまんなかを歩く",
        "前を見ずにメモを取りながら歩く",
        "先生の指示を聞き、安全を確かめて歩く"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『先生の指示を聞き、安全を確かめて歩く』です。歩道がない場所では、周りの車などに十分注意して安全に歩くことが大切です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町で見かける表示と、そこからわかることが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "一方通行の標識", match: "車が進める向きが決まっている"),
        QuizMatchingPair(prompt: "避難場所の表示", match: "災害のときに避難する場所を示す"),
        QuizMatchingPair(prompt: "町内案内図", match: "近くの道や施設の位置を示す"),
        QuizMatchingPair(prompt: "工事中の看板", match: "近くで工事をしていることを知らせる")
        ],
        choices: [
        "近くで工事をしていることを知らせる",
        "近くの道や施設の位置を示す",
        "車が進める向きが決まっている",
        "災害のときに避難する場所を示す"
        ],
        explanation: "一方通行の標識は『車が進める向きが決まっている』、避難場所の表示は『災害のときに避難する場所を示す』、町内案内図は『近くの道や施設の位置を示す』、工事中の看板は『近くで工事をしていることを知らせる』ものです。"
        ),

        QuizQuestion.classification(
        question: "【分類】町で見つけた場所を、そこで見られる特徴に合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "商店街", match: "店が集まる場所"),
        QuizMatchingPair(prompt: "住宅地", match: "家が多い場所"),
        QuizMatchingPair(prompt: "田んぼ", match: "米を育てる場所"),
        QuizMatchingPair(prompt: "広場", match: "人が集まったり遊んだりできる場所")
        ],
        categories: [
        "店が集まる場所",
        "家が多い場所",
        "米を育てる場所",
        "人が集まったり遊んだりできる場所"
        ],
        explanation: "商店街は『店が集まる場所』、住宅地は『家が多い場所』、田んぼは『米を育てる場所』、広場は『人が集まったり遊んだりできる場所』です。"
        ),

        QuizQuestion(
        question: "めがね屋でしてもらえることとして、いちばん合っているものはどれですか？",
        choices: [
        "野菜を切ってもらう",
        "自転車のタイヤを直してもらう",
        "自分に合うめがねを選ぶ手伝いをしてもらう",
        "本を借りる"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『自分に合うめがねを選ぶ手伝いをしてもらう』です。めがね屋では、めがねを売ったり、選ぶ手伝いや調整をしたりします。"
        ),

        QuizQuestion(
        question: "洋服店で試着室を使う目的はどれですか？",
        choices: [
        "買う前に服の大きさや着た感じを確かめるため",
        "食べ物を冷やすため",
        "荷物を発送するため",
        "電車を待つため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『買う前に服の大きさや着た感じを確かめるため』です。試着室では、服を買う前に実際に着て確かめることができます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】茶葉やお茶の道具などを主に売る店を『＿＿』といいます。",
        answer: "お茶屋",
        acceptableAnswers: ["おちゃや"],
        explanation: "＿＿に入る言葉は『お茶屋』です。お茶屋では、いろいろな種類のお茶などを売っています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店と、そこで買うことが多いものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "めがね屋", match: "めがね"),
        QuizMatchingPair(prompt: "洋服店", match: "シャツ"),
        QuizMatchingPair(prompt: "金物店", match: "かなづち"),
        QuizMatchingPair(prompt: "お茶屋", match: "茶葉")
        ],
        choices: [
        "茶葉",
        "かなづち",
        "めがね",
        "シャツ"
        ],
        explanation: "めがね屋では『めがね』、洋服店では『シャツ』、金物店では『かなづち』、お茶屋では『茶葉』を買うことができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】店で見かける表示を、その役わりに合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "営業中", match: "今、店が開いていることを知らせる"),
        QuizMatchingPair(prompt: "入口", match: "店に入る場所を知らせる"),
        QuizMatchingPair(prompt: "特売", match: "いつもより安く売る品を知らせる"),
        QuizMatchingPair(prompt: "新商品", match: "新しく売り始めた品を知らせる")
        ],
        categories: [
        "今、店が開いていることを知らせる",
        "店に入る場所を知らせる",
        "いつもより安く売る品を知らせる",
        "新しく売り始めた品を知らせる"
        ],
        explanation: "『営業中』は店が開いていること、『入口』は店に入る場所、『特売』はいつもより安く売る品、『新商品』は新しく売り始めた品を知らせる表示です。"
        ),

        QuizQuestion(
        question: "道路工事をする人が、工事場所のまわりにコーンや柵を置く理由はどれですか？",
        choices: [
        "工事場所に人や車が入らないようにして安全を守るため",
        "道路をせまく見せるため",
        "工事の音を大きくするため",
        "道具をかくすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『工事場所に人や車が入らないようにして安全を守るため』です。コーンや柵は、工事をする人や通行する人の安全を守るために使われます。"
        ),

        QuizQuestion(
        question: "新聞配達の人が、家ごとに新聞を届けるために確かめることはどれですか？",
        choices: [
        "近くの木の高さ",
        "家の庭の広さ",
        "空の雲の形",
        "届ける家や部数"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『届ける家や部数』です。新聞配達の人は、どの家に何部届けるかを確かめながら配ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】海や川で魚などをとる仕事をする人を『＿＿』といいます。",
        answer: "漁師",
        acceptableAnswers: ["りょうし"],
        explanation: "＿＿に入る言葉は『漁師』です。漁師は、海や川などで魚や貝などをとる仕事をします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域で働く人と、その仕事の内容が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新聞配達員", match: "新聞を家に届ける"),
        QuizMatchingPair(prompt: "道路工事の作業員", match: "道路を直したり整えたりする"),
        QuizMatchingPair(prompt: "駅員", match: "駅で乗客を案内する"),
        QuizMatchingPair(prompt: "獣医師", match: "動物の病気やけがを診る")
        ],
        choices: [
        "駅で乗客を案内する",
        "動物の病気やけがを診る",
        "新聞を家に届ける",
        "道路を直したり整えたりする"
        ],
        explanation: "新聞配達員は『新聞を家に届ける』、道路工事の作業員は『道路を直したり整えたりする』、駅員は『駅で乗客を案内する』、獣医師は『動物の病気やけがを診る』仕事をします。"
        ),

        QuizQuestion.classification(
        question: "【分類】働く人を、その仕事の内容に合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "警備員", match: "安全を見守る"),
        QuizMatchingPair(prompt: "植木職人", match: "木や庭を手入れする"),
        QuizMatchingPair(prompt: "印刷所の人", match: "印刷物を作る"),
        QuizMatchingPair(prompt: "漁師", match: "魚などをとる")
        ],
        categories: [
        "安全を見守る",
        "木や庭を手入れする",
        "印刷物を作る",
        "魚などをとる"
        ],
        explanation: "警備員は『安全を見守る』、植木職人は『木や庭を手入れする』、印刷所の人は『印刷物を作る』、漁師は『魚などをとる』仕事をします。"
        ),

        QuizQuestion(
        question: "タクシーに乗った人が、運転手にまず伝えることとして大切なのはどれですか？",
        choices: [
        "好きな食べ物",
        "昨日の天気",
        "行きたい場所",
        "学校の時間割"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『行きたい場所』です。タクシーは、乗った人が伝えた行き先へ向かって走ります。"
        ),

        QuizQuestion(
        question: "路面電車の特徴として合っているものはどれですか？",
        choices: [
        "海の中だけを進む",
        "道路上などにある線路を走ることがある",
        "空港からだけ出発する",
        "ペダルをこいで進む"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『道路上などにある線路を走ることがある』です。路面電車は、町の道路上などに敷かれた線路を走る電車です。"
        ),

        QuizQuestion(
        question: "駅のホームで黄色い線の内側で待つ大きな理由はどれですか？",
        choices: [
        "電車の色を見やすくするため",
        "ホームを広く見せるため",
        "駅員さんの仕事を増やすため",
        "線路や電車から安全な距離をとるため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『線路や電車から安全な距離をとるため』です。ホームでは、電車に近づきすぎないよう安全な場所で待ちます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】決まった場所から乗り、乗った人の行き先に合わせて走る自動車を『＿＿』といいます。",
        answer: "タクシー",
        acceptableAnswers: [],
        explanation: "＿＿に入る言葉は『タクシー』です。タクシーは、乗った人の行き先に合わせて走る乗り物です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】タクシー乗り場からタクシーを利用するときの流れを順番に並べましょう。",
        choices: [
        "行き先を運転手に伝える",
        "目的地で降りる",
        "順番を守ってタクシーを待つ",
        "自分の番になったら乗る"
        ],
        orderedChoices: [
        "順番を守ってタクシーを待つ",
        "自分の番になったら乗る",
        "行き先を運転手に伝える",
        "目的地で降りる"
        ],
        explanation: "『順番を守ってタクシーを待つ』→『自分の番になったら乗る』→『行き先を運転手に伝える』→『目的地で降りる』の順です。"
        ),

        QuizQuestion(
        question: "科学館でできることとして、いちばん合っているものはどれですか？",
        choices: [
        "電車の切符を買う",
        "野菜を売る",
        "科学に関係する展示や実験を見る",
        "手紙を配る"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『科学に関係する展示や実験を見る』です。科学館では、展示や実験などを通して科学について学ぶことができます。"
        ),

        QuizQuestion(
        question: "リサイクルセンターの役わりとして、いちばん合っているものはどれですか？",
        choices: [
        "集めた資源を分け、もう一度使えるようにする",
        "電車を運転する",
        "本を貸し出す",
        "給食だけを作る"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『集めた資源を分け、もう一度使えるようにする』です。リサイクルセンターでは、びんや缶などの資源を分けて再利用につなげます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域を訪れた人に、見どころや道などを案内する場所を『＿＿』といいます。",
        answer: "観光案内所",
        acceptableAnswers: ["かんこうあんないじょ"],
        explanation: "＿＿に入る言葉は『観光案内所』です。観光案内所では、地域の見どころや行き方などを案内します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の施設と、そこでできることが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "科学館", match: "科学の展示を見る"),
        QuizMatchingPair(prompt: "観光案内所", match: "地域の見どころを教えてもらう"),
        QuizMatchingPair(prompt: "福祉センター", match: "生活や福祉について相談する"),
        QuizMatchingPair(prompt: "リサイクルセンター", match: "資源を分けて再利用につなげる")
        ],
        choices: [
        "資源を分けて再利用につなげる",
        "地域の見どころを教えてもらう",
        "科学の展示を見る",
        "生活や福祉について相談する"
        ],
        explanation: "科学館では『科学の展示を見る』、観光案内所では『地域の見どころを教えてもらう』、福祉センターでは『生活や福祉について相談する』、リサイクルセンターでは『資源を分けて再利用につなげる』ことができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】施設で見かけるものを、関係する場所に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "実験の展示", match: "科学館"),
        QuizMatchingPair(prompt: "地域の案内パンフレット", match: "観光案内所"),
        QuizMatchingPair(prompt: "生活相談の窓口", match: "福祉センター"),
        QuizMatchingPair(prompt: "分けられたびんや缶", match: "リサイクルセンター")
        ],
        categories: [
        "科学館",
        "観光案内所",
        "福祉センター",
        "リサイクルセンター"
        ],
        explanation: "『実験の展示』は科学館、『地域の案内パンフレット』は観光案内所、『生活相談の窓口』は福祉センター、『分けられたびんや缶』はリサイクルセンターに関係します。"
        ),

        QuizQuestion(
        question: "地域のフリーマーケットで行われることとして、いちばん合っているものはどれですか？",
        choices: [
        "電車の運転を練習する",
        "使わなくなった品などを売ったり買ったりする",
        "道路を通れなくする",
        "学校の授業だけを行う"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『使わなくなった品などを売ったり買ったりする』です。フリーマーケットでは、まだ使える品などを持ち寄って売買することがあります。"
        ),

        QuizQuestion(
        question: "地域のスタンプラリーに参加するとき、決められた場所を回るために役立つものはどれですか？",
        choices: [
        "給食のこんだて表",
        "会場やチェックポイントがわかる案内図",
        "家の中の見取り図",
        "テレビの番組表"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『会場やチェックポイントがわかる案内図』です。案内図を見ると、どこを回ればよいかを確かめられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の人が品物を持ち寄って売ったり買ったりする催しを『＿＿』といいます。",
        answer: "フリーマーケット",
        acceptableAnswers: ["フリマ"],
        explanation: "＿＿に入る言葉は『フリーマーケット』です。フリーマーケットでは、地域の人などが品物を持ち寄って売買します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の行事や活動と、その内容が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "スタンプラリー", match: "決められた場所を回って印を集める"),
        QuizMatchingPair(prompt: "フリーマーケット", match: "品物を持ち寄って売買する"),
        QuizMatchingPair(prompt: "地域の運動会", match: "住民が競技や応援を楽しむ"),
        QuizMatchingPair(prompt: "読み聞かせ会", match: "本や物語を読んでもらう")
        ],
        choices: [
        "本や物語を読んでもらう",
        "住民が競技や応援を楽しむ",
        "決められた場所を回って印を集める",
        "品物を持ち寄って売買する"
        ],
        explanation: "スタンプラリーは『決められた場所を回って印を集める』、フリーマーケットは『品物を持ち寄って売買する』、地域の運動会は『住民が競技や応援を楽しむ』、読み聞かせ会は『本や物語を読んでもらう』活動です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域のスタンプラリーに参加するときの流れを順番に並べましょう。",
        choices: [
        "最後の場所でゴールを確認してもらう",
        "案内図を見て次の場所へ進む",
        "受付で台紙を受け取る",
        "チェックポイントでスタンプを押す"
        ],
        orderedChoices: [
        "受付で台紙を受け取る",
        "案内図を見て次の場所へ進む",
        "チェックポイントでスタンプを押す",
        "最後の場所でゴールを確認してもらう"
        ],
        explanation: "『受付で台紙を受け取る』→『案内図を見て次の場所へ進む』→『チェックポイントでスタンプを押す』→『最後の場所でゴールを確認してもらう』の順です。"
        ),

        QuizQuestion(
        question: "町たんけんで、二つの道のようすをくらべるとき、記録するとよいことはどれですか？",
        choices: [
        "自分の好きな色",
        "家で食べた朝ごはん",
        "道の広さや車の多さ",
        "昨日見たテレビ番組"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『道の広さや車の多さ』です。道の広さや車の多さを記録すると、場所によるちがいをくらべることができます。"
        ),

        QuizQuestion(
        question: "町たんけんで見つけた案内板の文字をメモするのは、何のためですか？",
        choices: [
        "その場所についてあとで確かめるため",
        "文字を全部消すため",
        "案内板を持ち帰るため",
        "道を通れなくするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『その場所についてあとで確かめるため』です。案内板の文字を記録しておくと、場所の名前や役わりをあとで確かめられます。"
        ),

        QuizQuestion(
        question: "同じ道を朝と昼に町たんけんすると、気づきやすいことはどれですか？",
        choices: [
        "山の高さが変わること",
        "建物の場所が毎日変わること",
        "道路の長さが変わること",
        "人や車の多さが時間によって変わること"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『人や車の多さが時間によって変わること』です。同じ場所でも、時間によって人や車の多さが変わることがあります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町で見つけるものと、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "橋", match: "川などの向こう側へ渡れるようにする"),
        QuizMatchingPair(prompt: "街灯", match: "暗い道を明るくする"),
        QuizMatchingPair(prompt: "ガードレール", match: "歩く人と車が通る場所を分ける"),
        QuizMatchingPair(prompt: "公衆電話", match: "外出先から電話をかけられるようにする")
        ],
        choices: [
        "外出先から電話をかけられるようにする",
        "暗い道を明るくする",
        "川などの向こう側へ渡れるようにする",
        "歩く人と車が通る場所を分ける"
        ],
        explanation: "橋は『川などの向こう側へ渡れるようにする』、街灯は『暗い道を明るくする』、ガードレールは『歩く人と車が通る場所を分ける』、公衆電話は『外出先から電話をかけられるようにする』役わりがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】町たんけんで気づいたことを、何についての記録かで分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "鳥の鳴き声が聞こえた", match: "音"),
        QuizMatchingPair(prompt: "赤い花が咲いていた", match: "色"),
        QuizMatchingPair(prompt: "時計が丸かった", match: "形"),
        QuizMatchingPair(prompt: "案内板に公園と書いてあった", match: "文字")
        ],
        categories: [
        "音",
        "色",
        "形",
        "文字"
        ],
        explanation: "『鳥の鳴き声が聞こえた』は音、『赤い花が咲いていた』は色、『時計が丸かった』は形、『案内板に公園と書いてあった』は文字についての記録です。"
        ),

        QuizQuestion(
        question: "薬局で売っていることが多いものはどれですか？",
        choices: [
        "上ばき",
        "ばんそうこう",
        "魚",
        "えんぴつ"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『ばんそうこう』です。薬局では、薬のほかに、ばんそうこうなどの衛生用品も売っています。"
        ),

        QuizQuestion(
        question: "米屋で、お米の袋に書かれた『5kg』という表示からわかることはどれですか？",
        choices: [
        "お米を作った時刻",
        "店までのきょり",
        "お米の重さ",
        "店員さんの人数"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『お米の重さ』です。『kg』は重さを表すときに使われ、お米がどのくらい入っているかを知る手がかりになります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】りんごやみかんなどの果物を主に売っている店を『＿＿』といいます。",
        answer: "くだもの屋",
        acceptableAnswers: ["くだものや", "果物屋"],
        explanation: "＿＿に入る言葉は『くだもの屋』です。くだもの屋では、いろいろな果物を売っています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店と、そこで主にあつかうものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "時計店", match: "時計"),
        QuizMatchingPair(prompt: "薬局", match: "薬や衛生用品"),
        QuizMatchingPair(prompt: "お菓子屋", match: "お菓子"),
        QuizMatchingPair(prompt: "くだもの屋", match: "果物")
        ],
        choices: [
        "果物",
        "薬や衛生用品",
        "時計",
        "お菓子"
        ],
        explanation: "時計店は『時計』、薬局は『薬や衛生用品』、お菓子屋は『お菓子』、くだもの屋は『果物』を主にあつかいます。"
        ),

        QuizQuestion.classification(
        question: "【分類】店員さんの仕事を、その内容に合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "届いた商品を棚に並べる", match: "品出し"),
        QuizMatchingPair(prompt: "お客さんの質問に答える", match: "接客"),
        QuizMatchingPair(prompt: "代金を受け取る", match: "会計"),
        QuizMatchingPair(prompt: "床や棚をきれいにする", match: "清掃")
        ],
        categories: [
        "品出し",
        "接客",
        "会計",
        "清掃"
        ],
        explanation: "『届いた商品を棚に並べる』のは品出し、『お客さんの質問に答える』のは接客、『代金を受け取る』のは会計、『床や棚をきれいにする』のは清掃です。"
        ),

        QuizQuestion(
        question: "横断歩道で子どもたちの安全を見守る人が使うことがあるものはどれですか？",
        choices: [
        "黄色い旗",
        "フライパン",
        "じょうろ",
        "楽器"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『黄色い旗』です。交通安全を見守る人は、黄色い旗などを使って歩く人や車に注意をうながすことがあります。"
        ),

        QuizQuestion(
        question: "自動車整備士が車をていねいに点検する大きな理由はどれですか？",
        choices: [
        "車の色を毎日変えるため",
        "車を小さくするため",
        "荷物を全部取り出すため",
        "車を安全に使えるようにするため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『車を安全に使えるようにするため』です。自動車整備士は、車に問題がないかを点検し、安全に走れるよう整備します。"
        ),

        QuizQuestion(
        question: "野菜を育てる農家の仕事として合っているものはどれですか？",
        choices: [
        "電車を運転する",
        "畑の草を取ったり水をやったりする",
        "図書館の本を貸し出す",
        "道路の信号を作る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『畑の草を取ったり水をやったりする』です。農家は、作物がよく育つように世話をします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】田や畑で米や野菜などの作物を育てる人を『＿＿』といいます。",
        answer: "農家",
        acceptableAnswers: ["のうか"],
        explanation: "＿＿に入る言葉は『農家』です。農家は、田や畑などで作物を育てる仕事をしています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】働く人と、仕事で使うことが多いものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "自動車整備士", match: "レンチ"),
        QuizMatchingPair(prompt: "カメラマン", match: "カメラ"),
        QuizMatchingPair(prompt: "理容師", match: "はさみ"),
        QuizMatchingPair(prompt: "料理人", match: "なべ")
        ],
        choices: [
        "カメラ",
        "なべ",
        "レンチ",
        "はさみ"
        ],
        explanation: "自動車整備士は『レンチ』、カメラマンは『カメラ』、理容師は『はさみ』、料理人は『なべ』を仕事で使うことがあります。"
        ),

        QuizQuestion(
        question: "フェリーが進む場所はどこですか？",
        choices: [
        "空の上",
        "線路の上",
        "海や川などの水の上",
        "歩道の上"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『海や川などの水の上』です。フェリーは、水の上を進んで人や車などを運ぶ船です。"
        ),

        QuizQuestion(
        question: "自転車に乗るときにヘルメットをかぶる大きな理由はどれですか？",
        choices: [
        "転んだときなどに頭を守るため",
        "自転車を速くするため",
        "タイヤを大きくするため",
        "道路を広くするため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『転んだときなどに頭を守るため』です。ヘルメットは、事故や転倒のときに頭を守るために使います。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】電車などに乗るために買う券を『＿＿』といいます。",
        answer: "乗車券",
        acceptableAnswers: ["じょうしゃけん", "切符", "きっぷ"],
        explanation: "＿＿に入る言葉は『乗車券』です。乗車券は、電車などを利用するときに使う券です。"
        ),

        QuizQuestion.related(
        question: "【関連付け】乗り物と、その特徴が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "新幹線", match: "遠い町まで速く移動しやすい"),
        QuizMatchingPair(prompt: "フェリー", match: "水の上を進む"),
        QuizMatchingPair(prompt: "自転車", match: "ペダルをこいで進む"),
        QuizMatchingPair(prompt: "タクシー", match: "客の行き先に合わせて走る")
        ],
        choices: [
        "ペダルをこいで進む",
        "客の行き先に合わせて走る",
        "遠い町まで速く移動しやすい",
        "水の上を進む"
        ],
        explanation: "新幹線は『遠い町まで速く移動しやすい』、フェリーは『水の上を進む』、自転車は『ペダルをこいで進む』、タクシーは『客の行き先に合わせて走る』という特徴があります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】フェリーに乗って目的地へ行くときの流れを順番に並べましょう。",
        choices: [
        "係の人の案内にしたがって船に乗る",
        "目的地で船を降りる",
        "乗船券を用意する",
        "乗り場で船を待つ"
        ],
        orderedChoices: [
        "乗船券を用意する",
        "乗り場で船を待つ",
        "係の人の案内にしたがって船に乗る",
        "目的地で船を降りる"
        ],
        explanation: "『乗船券を用意する』→『乗り場で船を待つ』→『係の人の案内にしたがって船に乗る』→『目的地で船を降りる』の順です。"
        ),

        QuizQuestion(
        question: "浄水場では、主にどのようなことをしていますか？",
        choices: [
        "電車を修理する",
        "本を作る",
        "野菜を売る",
        "水をきれいにして使えるようにする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『水をきれいにして使えるようにする』です。浄水場では、川などから取り入れた水をきれいにして、くらしに使える水にします。"
        ),

        QuizQuestion(
        question: "給食センターの仕事として合っているものはどれですか？",
        choices: [
        "道路に信号をつける",
        "学校などに届ける給食を作る",
        "電車を動かす",
        "手紙を配る"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『学校などに届ける給食を作る』です。給食センターでは、多くの人が食べる給食を作り、学校などへ届けます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】集められたごみを燃やすなどして処理する施設を『＿＿』といいます。",
        answer: "清掃工場",
        acceptableAnswers: ["せいそうこうじょう"],
        explanation: "＿＿に入る言葉は『清掃工場』です。清掃工場では、集められたごみを安全に処理します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】くらしを支える施設と、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "浄水場", match: "水をきれいにする"),
        QuizMatchingPair(prompt: "給食センター", match: "給食を作る"),
        QuizMatchingPair(prompt: "防災センター", match: "災害への備えについて学べるようにする"),
        QuizMatchingPair(prompt: "清掃工場", match: "ごみを処理する")
        ],
        choices: [
        "ごみを処理する",
        "災害への備えについて学べるようにする",
        "水をきれいにする",
        "給食を作る"
        ],
        explanation: "浄水場は『水をきれいにする』、給食センターは『給食を作る』、防災センターは『災害への備えについて学べるようにする』、清掃工場は『ごみを処理する』役わりがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】みんなが使う場所や設備を、その使いみちに合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "市民会館", match: "集会や発表"),
        QuizMatchingPair(prompt: "市営運動場", match: "スポーツ"),
        QuizMatchingPair(prompt: "防災倉庫", match: "災害への備え"),
        QuizMatchingPair(prompt: "公衆トイレ", match: "外出中のトイレ")
        ],
        categories: [
        "集会や発表",
        "スポーツ",
        "災害への備え",
        "外出中のトイレ"
        ],
        explanation: "市民会館は『集会や発表』、市営運動場は『スポーツ』、防災倉庫は『災害への備え』、公衆トイレは『外出中のトイレ』のために使われます。"
        ),

        QuizQuestion(
        question: "地域で行う古紙の資源回収で集めるものはどれですか？",
        choices: [
        "食べ残したごはん",
        "割れたお皿",
        "古新聞",
        "庭の土"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『古新聞』です。古新聞などの紙は資源として集め、もう一度利用できるようにすることがあります。"
        ),

        QuizQuestion(
        question: "地域のみんなで花を植える活動で、いちばん大切な行動はどれですか？",
        choices: [
        "植えた花をすぐに全部抜く",
        "花だんの中を走り回る",
        "使った道具を道路に置いたままにする",
        "決められた場所に植え、植えたあとも大切に世話をする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『決められた場所に植え、植えたあとも大切に世話をする』です。花を植えたあとも水やりなどをして、みんなで大切に育てます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域のお年寄りをお祝いしたり、みんなで交流したりする会を『＿＿』といいます。",
        answer: "敬老会",
        acceptableAnswers: ["けいろうかい"],
        explanation: "＿＿に入る言葉は『敬老会』です。敬老会では、地域のお年寄りをお祝いしたり、世代をこえて交流したりします。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域で行う活動と、その活動の名前が合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "古新聞などを集める", match: "資源回収"),
        QuizMatchingPair(prompt: "苗木を植える", match: "植樹活動"),
        QuizMatchingPair(prompt: "安全な横断歩道の渡り方を学ぶ", match: "交通安全教室"),
        QuizMatchingPair(prompt: "短冊に願いごとを書く", match: "七夕会")
        ],
        categories: [
        "資源回収",
        "植樹活動",
        "交通安全教室",
        "七夕会"
        ],
        explanation: "『古新聞などを集める』のは資源回収、『苗木を植える』のは植樹活動、『安全な横断歩道の渡り方を学ぶ』のは交通安全教室、『短冊に願いごとを書く』のは七夕会です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域のみんなで花の苗を植えるときの流れを順番に並べましょう。",
        choices: [
        "花の苗を植える",
        "植える場所を確かめる",
        "植えた苗に水をやる",
        "土をやわらかくする"
        ],
        orderedChoices: [
        "植える場所を確かめる",
        "土をやわらかくする",
        "花の苗を植える",
        "植えた苗に水をやる"
        ],
        explanation: "『植える場所を確かめる』→『土をやわらかくする』→『花の苗を植える』→『植えた苗に水をやる』の順です。"
        ),

        QuizQuestion(
        question: "町たんけんで、見つけた危ない場所をあとでみんなに伝えるための記録として、いちばんよいものはどれですか？",
        choices: [
        "近くの家の色だけを書く",
        "その日の天気だけを書く",
        "場所と危ないと思った理由をメモする",
        "いっしょに歩いた人の名前だけを書く"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『場所と危ないと思った理由をメモする』です。場所と理由を記録すると、どこにどんな危険があるのかをあとで正しく伝えられます。"
        ),

        QuizQuestion(
        question: "町たんけんで歩道を歩いているとき、立ち止まってメモを取るなら、どこがよいですか？",
        choices: [
        "歩く人のじゃまにならない歩道の端",
        "横断歩道のまんなか",
        "店の出入り口の前",
        "車道の近く"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『歩く人のじゃまにならない歩道の端』です。安全を確かめ、ほかの人の通行をじゃましない場所でメモを取ります。"
        ),

        QuizQuestion(
        question: "町たんけんで見学した店の人に質問するとき、よい聞き方はどれですか？",
        choices: [
        "仕事中でも大きな声で何度も呼ぶ",
        "答えを聞かずに次の質問をする",
        "何も言わずに店の奥へ入る",
        "あいさつをして、知りたいことを短くたずねる"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『あいさつをして、知りたいことを短くたずねる』です。相手の仕事のじゃまにならないよう、礼儀を守って質問します。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町で見かけるものと、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "カーブミラー", match: "曲がり角の向こうを見やすくする"),
        QuizMatchingPair(prompt: "町名表示板", match: "場所の名前を知らせる"),
        QuizMatchingPair(prompt: "横断歩道", match: "歩く人が道を横切る場所を示す"),
        QuizMatchingPair(prompt: "ベンチ", match: "座って休めるようにする")
        ],
        choices: [
        "座って休めるようにする",
        "歩く人が道を横切る場所を示す",
        "曲がり角の向こうを見やすくする",
        "場所の名前を知らせる"
        ],
        explanation: "カーブミラーは『曲がり角の向こうを見やすくする』、町名表示板は『場所の名前を知らせる』、横断歩道は『歩く人が道を横切る場所を示す』、ベンチは『座って休めるようにする』役わりがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】町たんけんで見つけたものを、正しい仲間に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "街路樹", match: "植物"),
        QuizMatchingPair(prompt: "くつ屋", match: "店"),
        QuizMatchingPair(prompt: "カーブミラー", match: "道路の安全設備"),
        QuizMatchingPair(prompt: "タクシー乗り場", match: "乗り物の場所")
        ],
        categories: [
        "植物",
        "店",
        "道路の安全設備",
        "乗り物の場所"
        ],
        explanation: "街路樹は『植物』、くつ屋は『店』、カーブミラーは『道路の安全設備』、タクシー乗り場は『乗り物の場所』です。"
        ),

        QuizQuestion(
        question: "クリーニング店に持っていくものとして、いちばん合っているものはどれですか？",
        choices: [
        "読み終わった本",
        "よごれた衣服",
        "こわれた自転車",
        "使い終わった電池"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『よごれた衣服』です。クリーニング店では、衣服などを洗ってきれいにする仕事をしています。"
        ),

        QuizQuestion(
        question: "店の棚に『売り切れ』と書かれた札があるとき、何を表していますか？",
        choices: [
        "その品物は今は買えない",
        "その品物は無料でもらえる",
        "その品物は店の外だけで買える",
        "その品物は必ず半額になる"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『その品物は今は買えない』です。『売り切れ』は、用意していた品物がなくなったことを表します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】牛肉や豚肉などの肉を主に売っている店を『＿＿』といいます。",
        answer: "肉屋",
        acceptableAnswers: ["にくや"],
        explanation: "＿＿に入る言葉は『肉屋』です。肉屋では、牛肉や豚肉など、いろいろな肉を売っています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店と、そこでしていることが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "クリーニング店", match: "衣服を洗ってきれいにする"),
        QuizMatchingPair(prompt: "くつ屋", match: "くつを売る"),
        QuizMatchingPair(prompt: "文房具店", match: "ノートやえんぴつを売る"),
        QuizMatchingPair(prompt: "ケーキ屋", match: "ケーキや洋菓子を売る")
        ],
        choices: [
        "ノートやえんぴつを売る",
        "ケーキや洋菓子を売る",
        "衣服を洗ってきれいにする",
        "くつを売る"
        ],
        explanation: "クリーニング店は『衣服を洗ってきれいにする』、くつ屋は『くつを売る』、文房具店は『ノートやえんぴつを売る』、ケーキ屋は『ケーキや洋菓子を売る』店です。"
        ),

        QuizQuestion.classification(
        question: "【分類】店で使うものを、その役わりに合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "買い物カート", match: "品物を運ぶ"),
        QuizMatchingPair(prompt: "レジ", match: "代金を計算する"),
        QuizMatchingPair(prompt: "はかり", match: "重さを量る"),
        QuizMatchingPair(prompt: "包装紙", match: "品物を包む")
        ],
        categories: [
        "品物を運ぶ",
        "代金を計算する",
        "重さを量る",
        "品物を包む"
        ],
        explanation: "買い物カートは『品物を運ぶ』、レジは『代金を計算する』、はかりは『重さを量る』、包装紙は『品物を包む』ために使います。"
        ),

        QuizQuestion(
        question: "本屋の店員さんが、本を種類ごとに分けて棚に並べる大きな理由はどれですか？",
        choices: [
        "本を重くするため",
        "店を暗くするため",
        "本の数を少なく見せるため",
        "お客さんがほしい本を見つけやすくするため"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『お客さんがほしい本を見つけやすくするため』です。種類ごとに整理すると、目的の本を探しやすくなります。"
        ),

        QuizQuestion(
        question: "ごみを集める仕事をする人が、決められた日にしていることはどれですか？",
        choices: [
        "公園で花を売る",
        "電車の切符を売る",
        "決められた場所のごみを集める",
        "図書館で本を貸し出す"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『決められた場所のごみを集める』です。ごみを集める仕事の人は、地域のごみを収集して町のくらしを支えています。"
        ),

        QuizQuestion(
        question: "家や建物の木の部分を作ったり直したりすることがある人はだれですか？",
        choices: [
        "美容師",
        "大工",
        "駅員",
        "店員"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『大工』です。大工は、木などを使って家や建物を作ったり直したりする仕事をします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】人の髪を切ったり、形を整えたりする仕事をする人を『＿＿』といいます。",
        answer: "美容師",
        acceptableAnswers: ["びようし"],
        explanation: "＿＿に入る言葉は『美容師』です。美容師は、髪を切ったり整えたりする仕事をします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】働く人と、その人が働くことの多い場所が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "美容師", match: "美容院"),
        QuizMatchingPair(prompt: "大工", match: "建築現場"),
        QuizMatchingPair(prompt: "保育士", match: "保育園"),
        QuizMatchingPair(prompt: "調理師", match: "飲食店の調理場")
        ],
        choices: [
        "保育園",
        "建築現場",
        "飲食店の調理場",
        "美容院"
        ],
        explanation: "美容師は『美容院』、大工は『建築現場』、保育士は『保育園』、調理師は『飲食店の調理場』で働くことが多いです。"
        ),

        QuizQuestion(
        question: "踏切の警報機が鳴り、遮断機が下りているときは、どうしますか？",
        choices: [
        "踏切の手前で止まって待つ",
        "急いで線路を渡る",
        "遮断機の下をくぐる",
        "線路の近くで遊ぶ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『踏切の手前で止まって待つ』です。遮断機が下りているときは電車が近づいているので、安全な場所で待ちます。"
        ),

        QuizQuestion(
        question: "駅で自分が乗る電車をまちがえないために、ホームで確かめるとよいものはどれですか？",
        choices: [
        "ホームの床の色だけ",
        "駅員さんのくつの色",
        "電車の行き先表示",
        "ベンチの数"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『電車の行き先表示』です。行き先表示を確かめると、自分が乗る電車かどうかを判断しやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】線路と道路が交わり、電車が来ると遮断機が下りる場所を『＿＿』といいます。",
        answer: "踏切",
        acceptableAnswers: ["ふみきり"],
        explanation: "＿＿に入る言葉は『踏切』です。踏切では、電車が来るときに警報機が鳴ったり遮断機が下りたりします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】乗り物と、その主な役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "救急車", match: "病人やけが人を運ぶ"),
        QuizMatchingPair(prompt: "消防車", match: "火事の現場へ向かう"),
        QuizMatchingPair(prompt: "路線バス", match: "決まった道を走って人を運ぶ"),
        QuizMatchingPair(prompt: "タクシー", match: "客の行き先まで人を運ぶ")
        ],
        choices: [
        "客の行き先まで人を運ぶ",
        "火事の現場へ向かう",
        "病人やけが人を運ぶ",
        "決まった道を走って人を運ぶ"
        ],
        explanation: "救急車は『病人やけが人を運ぶ』、消防車は『火事の現場へ向かう』、路線バスは『決まった道を走って人を運ぶ』、タクシーは『客の行き先まで人を運ぶ』役わりがあります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】駅で電車に乗るときの流れを順番に並べましょう。",
        choices: [
        "降りる人のあとに電車へ乗る",
        "行き先のホームへ行く",
        "駅に着く",
        "電車が止まるまで安全な場所で待つ"
        ],
        orderedChoices: [
        "駅に着く",
        "行き先のホームへ行く",
        "電車が止まるまで安全な場所で待つ",
        "降りる人のあとに電車へ乗る"
        ],
        explanation: "『駅に着く』→『行き先のホームへ行く』→『電車が止まるまで安全な場所で待つ』→『降りる人のあとに電車へ乗る』の順です。"
        ),

        QuizQuestion(
        question: "美術館で見ることが多いものはどれですか？",
        choices: [
        "電車の時刻表",
        "絵や彫刻などの作品",
        "野菜の値札",
        "道路工事の道具"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『絵や彫刻などの作品』です。美術館では、絵や彫刻など、さまざまな作品を見ることができます。"
        ),

        QuizQuestion(
        question: "図書館の本を、次に使う人も気持ちよく読めるようにする行動はどれですか？",
        choices: [
        "本に好きな絵をかき足す",
        "ページを折って目印にする",
        "借りた本を外に置いたままにする",
        "本を大切に使い、決められた日までに返す"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『本を大切に使い、決められた日までに返す』です。図書館の本はみんなで使うものなので、大切に扱い、期限を守って返します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】昔の道具や地域の資料などを集めて展示する施設を『＿＿』といいます。",
        answer: "博物館",
        acceptableAnswers: ["はくぶつかん"],
        explanation: "＿＿に入る言葉は『博物館』です。博物館では、昔の道具や地域に関係する資料などを見ることができます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】施設と、そこでできることが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "美術館", match: "絵や彫刻などの作品を見る"),
        QuizMatchingPair(prompt: "博物館", match: "昔の道具や資料を見る"),
        QuizMatchingPair(prompt: "市民プール", match: "泳ぐ"),
        QuizMatchingPair(prompt: "公園", match: "遊んだり休んだりする")
        ],
        choices: [
        "泳ぐ",
        "昔の道具や資料を見る",
        "遊んだり休んだりする",
        "絵や彫刻などの作品を見る"
        ],
        explanation: "美術館では『絵や彫刻などの作品を見る』、博物館では『昔の道具や資料を見る』、市民プールでは『泳ぐ』、公園では『遊んだり休んだりする』ことができます。"
        ),

        QuizQuestion.classification(
        question: "【分類】施設で守ることを、関係する施設に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "借りた本を決められた日までに返す", match: "図書館"),
        QuizMatchingPair(prompt: "展示されている資料を勝手にさわらない", match: "博物館"),
        QuizMatchingPair(prompt: "運動する場所の決まりを守る", match: "体育館"),
        QuizMatchingPair(prompt: "泳ぐ前にシャワーをあびる", match: "市民プール")
        ],
        categories: [
        "図書館",
        "博物館",
        "体育館",
        "市民プール"
        ],
        explanation: "『借りた本を決められた日までに返す』は図書館、『展示されている資料を勝手にさわらない』は博物館、『運動する場所の決まりを守る』は体育館、『泳ぐ前にシャワーをあびる』は市民プールで大切なことです。"
        ),

        QuizQuestion(
        question: "地域の行事で、係を分けてみんなで準備する大きな理由はどれですか？",
        choices: [
        "行事を安全に進めやすくするため",
        "参加する人を少なくするため",
        "会場をわざと分かりにくくするため",
        "準備する物を増やすため"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『行事を安全に進めやすくするため』です。係を分けて協力すると、必要な準備や案内を行いやすくなります。"
        ),

        QuizQuestion(
        question: "地域の行事のお知らせを見て、参加する前に確かめることとして、いちばん大切なのはどれですか？",
        choices: [
        "紙の大きさ",
        "行事の日時と会場",
        "印刷に使った色の数",
        "お知らせを書いた人の好きな食べ物"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『行事の日時と会場』です。いつ、どこで行われるのかを確かめると、行事に参加しやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の祭りなどで、ばちでたたいて音を出す楽器を『＿＿』といいます。",
        answer: "太鼓",
        acceptableAnswers: ["たいこ"],
        explanation: "＿＿に入る言葉は『太鼓』です。地域の祭りでは、太鼓の音に合わせて踊ったり行列が進んだりすることがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】地域の行事で行うことを、その場面に合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "会場にいすを並べる", match: "準備"),
        QuizMatchingPair(prompt: "参加する人の名前を確かめる", match: "受付"),
        QuizMatchingPair(prompt: "みんなで踊りを楽しむ", match: "行事中"),
        QuizMatchingPair(prompt: "使った道具をしまう", match: "片づけ")
        ],
        categories: [
        "準備",
        "受付",
        "行事中",
        "片づけ"
        ],
        explanation: "『会場にいすを並べる』のは準備、『参加する人の名前を確かめる』のは受付、『みんなで踊りを楽しむ』のは行事中、『使った道具をしまう』のは片づけの場面です。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】地域のウォーキング大会に参加するときの流れを順番に並べましょう。",
        choices: [
        "決められたコースを歩く",
        "ゴールする",
        "受付をする",
        "出発前の説明を聞く"
        ],
        orderedChoices: [
        "受付をする",
        "出発前の説明を聞く",
        "決められたコースを歩く",
        "ゴールする"
        ],
        explanation: "『受付をする』→『出発前の説明を聞く』→『決められたコースを歩く』→『ゴールする』の順です。"
        ),

        QuizQuestion(
        question: "町たんけんで、あとから道じゅんを思い出すために見つけておくとよいものはどれですか？",
        choices: [
        "目じるしになる建物",
        "空に見えた雲",
        "家で見たテレビ番組",
        "給食のメニュー"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『目じるしになる建物』です。目じるしを覚えておくと、歩いた道じゅんを思い出しやすくなります。"
        ),

        QuizQuestion(
        question: "町たんけんのあとで、見つけたことを友だちに正しく伝えるためのメモはどれですか？",
        choices: [
        "好きな食べ物だけを書く",
        "場所の名前と気づいたことを書く",
        "何も書かずに覚えておく",
        "家で遊んだことを書く"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『場所の名前と気づいたことを書く』です。場所と気づきをいっしょに記録すると、町のようすを伝えやすくなります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】町の道や建物の場所を、上から見たように表したものを『＿＿』といいます。",
        answer: "地図",
        acceptableAnswers: ["ちず"],
        explanation: "＿＿に入る言葉は『地図』です。地図を見ると、道や建物の場所がわかります。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町たんけんで見つけたものと、その役わりが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "点字ブロック", match: "目の不自由な人の歩行を助ける"),
        QuizMatchingPair(prompt: "バス停の標識", match: "バスが止まる場所を知らせる"),
        QuizMatchingPair(prompt: "郵便ポスト", match: "手紙を入れる場所を示す"),
        QuizMatchingPair(prompt: "信号機", match: "人や車が安全に進むための合図を出す")
        ],
        choices: [
        "人や車が安全に進むための合図を出す",
        "手紙を入れる場所を示す",
        "目の不自由な人の歩行を助ける",
        "バスが止まる場所を知らせる"
        ],
        explanation: "『点字ブロック』は『目の不自由な人の歩行を助ける』、『バス停の標識』は『バスが止まる場所を知らせる』、『郵便ポスト』は『手紙を入れる場所を示す』、『信号機』は『人や車が安全に進むための合図を出す』という役わりがあります。"
        ),

        QuizQuestion.classification(
        question: "【分類】町たんけんで見つけたものを、正しい仲間に分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "川", match: "自然"),
        QuizMatchingPair(prompt: "本屋", match: "店"),
        QuizMatchingPair(prompt: "公民館", match: "公共施設"),
        QuizMatchingPair(prompt: "信号機", match: "道路の設備")
        ],
        categories: [
        "自然",
        "店",
        "公共施設",
        "道路の設備"
        ],
        explanation: "川は『自然』、本屋は『店』、公民館は『公共施設』、信号機は『道路の設備』です。"
        ),

        QuizQuestion(
        question: "パン屋で、パンを焼くために使うことが多いものはどれですか？",
        choices: [
        "冷蔵庫",
        "レジ",
        "オーブン",
        "本だな"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『オーブン』です。パン屋では、作った生地をオーブンで焼いてパンにします。"
        ),

        QuizQuestion(
        question: "店で品物を買う前に、その品物の値段を売り場で確かめるときに見るものはどれですか？",
        choices: [
        "営業時間の看板",
        "買い物かご",
        "レシート",
        "値札"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『値札』です。値札には、品物の名前や値段などが書かれています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】魚を主に売っている店を『＿＿』といいます。",
        answer: "魚屋",
        acceptableAnswers: ["さかなや"],
        explanation: "＿＿に入る言葉は『魚屋』です。魚屋では、いろいろな魚や魚を使った品物を売っています。"
        ),

        QuizQuestion.related(
        question: "【関連付け】店と、そこで主に売っているものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "八百屋", match: "野菜"),
        QuizMatchingPair(prompt: "魚屋", match: "魚"),
        QuizMatchingPair(prompt: "花屋", match: "花"),
        QuizMatchingPair(prompt: "本屋", match: "本")
        ],
        choices: [
        "花",
        "本",
        "野菜",
        "魚"
        ],
        explanation: "八百屋は『野菜』、魚屋は『魚』、花屋は『花』、本屋は『本』を主に売っています。"
        ),

        QuizQuestion.classification(
        question: "【分類】店のくふうと、その目的が合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "冷たい食品を冷蔵ケースに入れる", match: "品物を冷たく保つ"),
        QuizMatchingPair(prompt: "値札を見やすい場所につける", match: "値段を伝える"),
        QuizMatchingPair(prompt: "通路を広くあける", match: "店の中を歩きやすくする"),
        QuizMatchingPair(prompt: "おすすめの品を目立つ場所に置く", match: "品物に気づいてもらう")
        ],
        categories: [
        "品物を冷たく保つ",
        "値段を伝える",
        "店の中を歩きやすくする",
        "品物に気づいてもらう"
        ],
        explanation: "『冷たい食品を冷蔵ケースに入れる』のは『品物を冷たく保つ』ため、『値札を見やすい場所につける』のは『値段を伝える』ため、『通路を広くあける』のは『店の中を歩きやすくする』ため、『おすすめの品を目立つ場所に置く』のは『品物に気づいてもらう』ためです。"
        ),

        QuizQuestion(
        question: "バスの運転士がいちばん大切にしていることはどれですか？",
        choices: [
        "乗っている人を安全に運ぶこと",
        "店の品物を並べること",
        "本を貸し出すこと",
        "手紙を仕分けること"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『乗っている人を安全に運ぶこと』です。バスの運転士は、安全を確かめながらバスを運転します。"
        ),

        QuizQuestion(
        question: "店員さんが、お客さんから「この品物はどこですか」と聞かれたときにすることはどれですか？",
        choices: [
        "店を閉める",
        "売り場を案内する",
        "バスを運転する",
        "道路をそうじする"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『売り場を案内する』です。店員さんは、お客さんが買い物をしやすいように手助けします。"
        ),

        QuizQuestion(
        question: "宅配便の配達員が、荷物をまちがえずに届けるために特に確かめるものはどれですか？",
        choices: [
        "荷物の色",
        "空の天気",
        "あて先",
        "近くの公園"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『あて先』です。あて先の名前や住所を確かめることで、正しい場所に荷物を届けます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】町で働く人と、その仕事でよく使うものが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "花屋の人", match: "花を包む紙"),
        QuizMatchingPair(prompt: "パン屋の人", match: "パンを取るトング"),
        QuizMatchingPair(prompt: "配達員", match: "荷物を運ぶ台車"),
        QuizMatchingPair(prompt: "清掃員", match: "ほうき")
        ],
        choices: [
        "ほうき",
        "荷物を運ぶ台車",
        "花を包む紙",
        "パンを取るトング"
        ],
        explanation: "花屋の人は『花を包む紙』、パン屋の人は『パンを取るトング』、配達員は『荷物を運ぶ台車』、清掃員は『ほうき』を仕事でよく使います。"
        ),

        QuizQuestion.classification(
        question: "【分類】働く人を、仕事の内容に合う仲間へ分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "パン職人", match: "食べ物を作る"),
        QuizMatchingPair(prompt: "バス運転士", match: "人を運ぶ"),
        QuizMatchingPair(prompt: "配達員", match: "品物を届ける"),
        QuizMatchingPair(prompt: "清掃員", match: "町をきれいにする")
        ],
        categories: [
        "食べ物を作る",
        "人を運ぶ",
        "品物を届ける",
        "町をきれいにする"
        ],
        explanation: "パン職人は『食べ物を作る』、バス運転士は『人を運ぶ』、配達員は『品物を届ける』、清掃員は『町をきれいにする』仕事です。"
        ),

        QuizQuestion(
        question: "路線バスに乗る場所を見つけるとき、目印になるものはどれですか？",
        choices: [
        "駅の改札",
        "空港の搭乗口",
        "駐車場の番号",
        "バス停の標識"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『バス停の標識』です。路線バスは、バス停の標識がある場所で乗り降りします。"
        ),

        QuizQuestion(
        question: "バスの中で、次に止まる停留所を確かめるのにいちばん役立つものはどれですか？",
        choices: [
        "次の停留所を知らせる車内表示",
        "運転士の帽子",
        "座席の色",
        "タイヤの大きさ"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『次の停留所を知らせる車内表示』です。車内表示を見ると、次に止まる停留所を確かめられます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】バスや電車が来る時刻が書かれたものを『＿＿』といいます。",
        answer: "時刻表",
        acceptableAnswers: ["じこくひょう"],
        explanation: "＿＿に入る言葉は『時刻表』です。時刻表を見ると、バスや電車が来る予定の時刻を確かめられます。"
        ),

        QuizQuestion.related(
        question: "【関連付け】乗り物と、その乗り物を使うときに関係する場所や設備が合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "路線バス", match: "バス停"),
        QuizMatchingPair(prompt: "電車", match: "ホーム"),
        QuizMatchingPair(prompt: "自転車", match: "駐輪場"),
        QuizMatchingPair(prompt: "自動車", match: "駐車場")
        ],
        choices: [
        "駐輪場",
        "バス停",
        "駐車場",
        "ホーム"
        ],
        explanation: "路線バスは『バス停』、電車は『ホーム』、自転車は『駐輪場』、自動車は『駐車場』と関係があります。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】バス停から路線バスに乗り、目的の停留所で降りるまでを順番に並べましょう。",
        choices: [
        "目的の停留所で降りる",
        "バス停で待つ",
        "バスが来たら乗る",
        "降りる停留所を確かめる"
        ],
        orderedChoices: [
        "バス停で待つ",
        "バスが来たら乗る",
        "降りる停留所を確かめる",
        "目的の停留所で降りる"
        ],
        explanation: "『バス停で待つ』→『バスが来たら乗る』→『降りる停留所を確かめる』→『目的の停留所で降りる』の順です。"
        ),

        QuizQuestion(
        question: "公民館は、主にどのようなことに使われる場所ですか？",
        choices: [
        "電車に乗る",
        "地域の人が集まって活動する",
        "野菜だけを売る",
        "飛行機を動かす"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『地域の人が集まって活動する』です。公民館では、地域の人が集まって学習や交流などを行います。"
        ),

        QuizQuestion(
        question: "消防署では、火事が起きていないときにもどのようなことをしていますか？",
        choices: [
        "商品を売る",
        "電車の切符を作る",
        "訓練や道具の点検をする",
        "本の貸し出しだけをする"
        ],
        correctAnswerIndex: 2,
        explanation: "正解は『訓練や道具の点検をする』です。消防士は、いつでも出動できるように訓練や道具の点検をしています。"
        ),

        QuizQuestion(
        question: "児童館でできることとして、いちばん合っているものはどれですか？",
        choices: [
        "荷物を発送する",
        "電車に乗る",
        "魚を買う",
        "子どもが遊んだり活動したりする"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『子どもが遊んだり活動したりする』です。児童館は、子どもが遊んだり、いろいろな活動をしたりできる施設です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】市に住む人が、くらしについて相談したり、いろいろな手続きをしたりする公共施設を『＿＿』といいます。",
        answer: "市役所",
        acceptableAnswers: ["しやくしょ"],
        explanation: "＿＿に入る言葉は『市役所』です。市役所では、市のくらしに関係する相談や手続きなどを行います。"
        ),

        QuizQuestion.classification(
        question: "【分類】公共施設と、そこでできることが合うように分けましょう。",
        pairs: [
        QuizMatchingPair(prompt: "保健センター", match: "健康について相談する"),
        QuizMatchingPair(prompt: "体育館", match: "運動する"),
        QuizMatchingPair(prompt: "文化会館", match: "発表会や催しを見る"),
        QuizMatchingPair(prompt: "図書館", match: "本や資料を読む")
        ],
        categories: [
        "健康について相談する",
        "運動する",
        "発表会や催しを見る",
        "本や資料を読む"
        ],
        explanation: "保健センターは『健康について相談する』、体育館は『運動する』、文化会館は『発表会や催しを見る』、図書館は『本や資料を読む』ことに使われます。"
        ),

        QuizQuestion(
        question: "地域のお祭りで、みんなで力を合わせてかつぐことがあるものはどれですか？",
        choices: [
        "みこし",
        "ランドセル",
        "信号機",
        "本だな"
        ],
        correctAnswerIndex: 0,
        explanation: "正解は『みこし』です。地域のお祭りでは、みこしをみんなでかつぐことがあります。"
        ),

        QuizQuestion(
        question: "地域の防災訓練を行う大きな目的はどれですか？",
        choices: [
        "買い物の練習をするため",
        "災害のときに安全に行動できるよう練習するため",
        "速く走る競争をするため",
        "新しい本を借りるため"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『災害のときに安全に行動できるよう練習するため』です。防災訓練では、避難のしかたなどを練習します。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】地域の人がいっしょに道路や公園のごみを拾う活動を『地域＿＿』といいます。",
        answer: "清掃",
        acceptableAnswers: ["せいそう"],
        explanation: "＿＿に入る言葉は『清掃』です。地域清掃では、みんなで道路や公園などをきれいにします。"
        ),

        QuizQuestion.related(
        question: "【関連付け】地域の行事と、そこで行うことが合うように選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "盆踊り", match: "輪になって踊る"),
        QuizMatchingPair(prompt: "朝市", match: "朝に品物を売る"),
        QuizMatchingPair(prompt: "収穫祭", match: "とれた作物をよろこぶ"),
        QuizMatchingPair(prompt: "もちつき会", match: "きねとうすでもちをつく")
        ],
        choices: [
        "朝に品物を売る",
        "きねとうすでもちをつく",
        "輪になって踊る",
        "とれた作物をよろこぶ"
        ],
        explanation: "盆踊りでは『輪になって踊る』、朝市では『朝に品物を売る』、収穫祭では『とれた作物をよろこぶ』、もちつき会では『きねとうすでもちをつく』ことを行います。"
        ),

        QuizQuestion.chronological(
        question: "【順番に並べる】受付のある地域の行事に参加するときの流れを順番に並べましょう。",
        choices: [
        "受付をする",
        "お知らせで日時を確かめる",
        "行事に参加する",
        "決められた時間に会場へ行く"
        ],
        orderedChoices: [
        "お知らせで日時を確かめる",
        "決められた時間に会場へ行く",
        "受付をする",
        "行事に参加する"
        ],
        explanation: "『お知らせで日時を確かめる』→『決められた時間に会場へ行く』→『受付をする』→『行事に参加する』の順です。"
        ),

    ]
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: sociallyBalancedShuffledQuizList(quizBeginnerList))
    }
    @StateObject var sharedInterstitial = Interstitial()
    var body: some View {
        QuizView(quizzes: shuffledQuizList, quizLevel: .shakai2, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Shakai2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Shakai2ListView(isPresenting: .constant(false))
    }
}
