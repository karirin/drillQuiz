//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo2ListView: View {
    @Binding var isPresenting: Bool

    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『雨がやんだあと、そらに 七色の ＿＿ が かかりました。』",
            answer: "にじ",
            acceptableAnswers: ["虹"],
            explanation: "雨あがりの空に七色で見えるものは『にじ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『木の はが ゆれるほど、つめたい ＿＿ が ふいてきました。』",
            answer: "かぜ",
            acceptableAnswers: ["風"],
            explanation: "木の葉をゆらしてふいてくるものは『かぜ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『えんそくの ひるに、ふたを あけて ＿＿ を たべました。』",
            answer: "おべんとう",
            acceptableAnswers: ["べんとう", "お弁当", "弁当"],
            explanation: "えんそくの昼に、ふたをあけて食べるものは『おべんとう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『春』",
            answer: "はる",
            explanation: "『春』の読みは『はる』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『星』",
            answer: "ほし",
            explanation: "『星』の読みは『ほし』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、たろうが 見つけたものを そのまま ぬき出しましょう。\n『たろうは 校ていで 赤い ぼうしを 見つけました。』",
            answer: "赤い ぼうし",
            acceptableAnswers: ["赤いぼうし", "あかいぼうし", "赤い帽子", "あかい帽子"],
            explanation: "たろうが見つけたものは『赤い ぼうし』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「どこで」に あたることばを そのまま ぬき出しましょう。\n『まいこさんは 図書室で しずかに 本を 読みました。』",
            answer: "図書室で",
            acceptableAnswers: ["としょしつで"],
            explanation: "『どこで』にあたることばは『図書室で』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ゆうきが したことを そのまま ぬき出しましょう。\n『ゆうきは あさ 早く おきて、花に 水を あげました。』",
            answer: "花に 水を あげました",
            acceptableAnswers: ["花に水をあげました", "はなにみずをあげました", "花にみずをあげました"],
            explanation: "ゆうきがしたことは『花に 水を あげました』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「だれと」に あたることばを そのまま ぬき出しましょう。\n『わたしは 妹と こうえんへ 行きました。』",
            answer: "妹と",
            acceptableAnswers: ["いもうとと"],
            explanation: "『だれと』にあたることばは『妹と』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、うれしそうな ようすが わかることばを そのまま ぬき出しましょう。\n『先生は にこにこ わらって、「よくできました」と 言いました。』",
            answer: "にこにこ わらって",
            acceptableAnswers: ["にこにこわらって"],
            explanation: "うれしそうなようすがわかるのは『にこにこ わらって』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["いきました", "わたしは", "としょかんへ", "きょう"],
            orderedChoices: ["わたしは", "きょう", "としょかんへ", "いきました"],
            explanation: "『わたしは きょう としょかんへ いきました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["しました", "わたしたちは", "校庭で", "サッカーを"],
            orderedChoices: ["わたしたちは", "校庭で", "サッカーを", "しました"],
            explanation: "『わたしたちは 校庭で サッカーを しました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["さきました", "春に", "さくらが", "きれいに"],
            orderedChoices: ["春に", "さくらが", "きれいに", "さきました"],
            explanation: "『春に さくらが きれいに さきました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["あげました", "わたしは", "犬に", "えさを"],
            orderedChoices: ["わたしは", "犬に", "えさを", "あげました"],
            explanation: "『わたしは 犬に えさを あげました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["とびました", "大きな", "空へ", "鳥が"],
            orderedChoices: ["大きな", "鳥が", "空へ", "とびました"],
            explanation: "『大きな 鳥が 空へ とびました。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと あいさつが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "あさ", match: "おはよう"),
                QuizMatchingPair(prompt: "ひる", match: "こんにちは"),
                QuizMatchingPair(prompt: "よる", match: "こんばんは")
            ],
            choices: ["こんばんは", "こんにちは", "おはよう"],
            explanation: "『あさ=おはよう』『ひる=こんにちは』『よる=こんばんは』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "春", match: "はる"),
                QuizMatchingPair(prompt: "海", match: "うみ"),
                QuizMatchingPair(prompt: "雪", match: "ゆき")
            ],
            choices: ["ゆき", "はる", "うみ"],
            explanation: "『春=はる』『海=うみ』『雪=ゆき』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと はんたいの ことばが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "大きい", match: "小さい"),
                QuizMatchingPair(prompt: "明るい", match: "くらい"),
                QuizMatchingPair(prompt: "あつい", match: "さむい")
            ],
            choices: ["くらい", "小さい", "さむい"],
            explanation: "『大きい=小さい』『明るい=くらい』『あつい=さむい』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと なかまが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "りんご", match: "くだもの"),
                QuizMatchingPair(prompt: "ひまわり", match: "花"),
                QuizMatchingPair(prompt: "すずめ", match: "鳥")
            ],
            choices: ["鳥", "くだもの", "花"],
            explanation: "『りんご=くだもの』『ひまわり=花』『すずめ=鳥』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】文の はじめと つづきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "雨が ふったので", match: "かさを さしました"),
                QuizMatchingPair(prompt: "おなかが すいたので", match: "ごはんを たべました"),
                QuizMatchingPair(prompt: "本を かりたくて", match: "図書館へ 行きました")
            ],
            choices: ["図書館へ 行きました", "かさを さしました", "ごはんを たべました"],
            explanation: "前の文と後ろの文が自然につながるように組み合わせましょう。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『地図』",
            answer: "ちず",
            explanation: "『地図』の読みは『ちず』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『電気』",
            answer: "でんき",
            explanation: "『電気』の読みは『でんき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『東』",
            answer: "ひがし",
            explanation: "『東』の読みは『ひがし』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『西』",
            answer: "にし",
            explanation: "『西』の読みは『にし』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『南』",
            answer: "みなみ",
            explanation: "『南』の読みは『みなみ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『北』",
            answer: "きた",
            explanation: "『北』の読みは『きた』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『牛』",
            answer: "うし",
            explanation: "『牛』の読みは『うし』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『馬』",
            answer: "うま",
            explanation: "『馬』の読みは『うま』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『魚』",
            answer: "さかな",
            explanation: "『魚』の読みは『さかな』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『鳥』",
            answer: "とり",
            explanation: "『鳥』の読みは『とり』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『虫』",
            answer: "むし",
            explanation: "『虫』の読みは『むし』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『花』",
            answer: "はな",
            explanation: "『花』の読みは『はな』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『草』",
            answer: "くさ",
            explanation: "『草』の読みは『くさ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『山』",
            answer: "やま",
            explanation: "『山』の読みは『やま』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『川』",
            answer: "かわ",
            explanation: "『川』の読みは『かわ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『海』",
            answer: "うみ",
            explanation: "『海』の読みは『うみ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『空』",
            answer: "そら",
            explanation: "『空』の読みは『そら』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『雨』",
            answer: "あめ",
            explanation: "『雨』の読みは『あめ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『雪』",
            answer: "ゆき",
            explanation: "『雪』の読みは『ゆき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『風』",
            answer: "かぜ",
            explanation: "『風』の読みは『かぜ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『朝おきたら、まず ＿＿ をします。』",
            answer: "あいさつ",
            acceptableAnswers: ["挨拶"],
            explanation: "朝起きたら『あいさつ』をします。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『虫歯にならないように、毎日 ＿＿ をしましょう。』",
            answer: "はみがき",
            acceptableAnswers: ["歯みがき", "歯磨き"],
            explanation: "虫歯にならないよう毎日『はみがき』をしましょう。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『まちがえたときは、消しゴムで ＿＿ します。』",
            answer: "けす",
            acceptableAnswers: ["消す"],
            explanation: "まちがいは『けす』ことができます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『雨の日には ＿＿ をさします。』",
            answer: "かさ",
            acceptableAnswers: ["傘"],
            explanation: "雨の日には『かさ』をさします。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『お手紙を送るとき、ふうとうに ＿＿ をはります。』",
            answer: "きって",
            acceptableAnswers: ["切手"],
            explanation: "手紙を送るとき、ふうとうに『きって』をはります。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、はるかの ようすが 分かることばを そのまま ぬき出しましょう。\n『はるかは 走りながら、たのしそうに うたを うたった。』",
            answer: "たのしそうに",
            acceptableAnswers: ["楽しそうに"],
            explanation: "はるかのようすが分かることばは『たのしそうに』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、けんじが したことを そのまま ぬき出しましょう。\n『けんじは 学校から 帰ってきて、すぐに ランドセルを おろした。』",
            answer: "ランドセルを おろした",
            acceptableAnswers: ["ランドセルをおろした"],
            explanation: "けんじがしたことは『ランドセルを おろした』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「だれと」に あたることばを そのまま ぬき出しましょう。\n『ゆきこは 朝早く おきて、お母さんと 一しょに 花に 水を やった。』",
            answer: "お母さんと",
            acceptableAnswers: ["おかあさんと"],
            explanation: "『だれと』にあたることばは『お母さんと』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、先生の ようすが 分かることばを そのまま ぬき出しましょう。\n『先生は にっこり わらって、「よく がんばりました」と 言った。』",
            answer: "にっこり わらって",
            acceptableAnswers: ["にっこりわらって"],
            explanation: "先生のようすが分かることばは『にっこり わらって』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、かなこが 見つけたものを そのまま ぬき出しましょう。\n『かなこは 図書室で、大好きな むかしばなしを 見つけた。』",
            answer: "むかしばなし",
            acceptableAnswers: ["大好きな むかしばなし", "大好きなむかしばなし"],
            explanation: "かなこが見つけたものは『むかしばなし』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["食べました", "わたしは", "朝ごはんを", "はやく"],
            orderedChoices: ["わたしは", "はやく", "朝ごはんを", "食べました"],
            explanation: "『わたしは はやく 朝ごはんを 食べました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["あそびました", "友だちと", "こうえんで", "きのう"],
            orderedChoices: ["きのう", "友だちと", "こうえんで", "あそびました"],
            explanation: "『きのう 友だちと こうえんで あそびました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["かいました", "お母さんと", "スーパーで", "野さいを"],
            orderedChoices: ["お母さんと", "スーパーで", "野さいを", "かいました"],
            explanation: "『お母さんと スーパーで 野さいを かいました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["かきました", "ぼくは", "ていねいに", "作文を"],
            orderedChoices: ["ぼくは", "ていねいに", "作文を", "かきました"],
            explanation: "『ぼくは ていねいに 作文を かきました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["およいだ", "プールで", "わたしは", "気もちよく"],
            orderedChoices: ["わたしは", "プールで", "気もちよく", "およいだ"],
            explanation: "『わたしは プールで 気もちよく およいだ。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】季節と 行事が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "春", match: "入学式"),
                QuizMatchingPair(prompt: "夏", match: "プール開き"),
                QuizMatchingPair(prompt: "秋", match: "運動会")
            ],
            choices: ["運動会", "プール開き", "入学式"],
            explanation: "『春=入学式』『夏=プール開き』『秋=運動会』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "右", match: "みぎ"),
                QuizMatchingPair(prompt: "左", match: "ひだり"),
                QuizMatchingPair(prompt: "上", match: "うえ")
            ],
            choices: ["うえ", "みぎ", "ひだり"],
            explanation: "『右=みぎ』『左=ひだり』『上=うえ』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと はんたいの ことばが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "右", match: "左"),
                QuizMatchingPair(prompt: "前", match: "後ろ"),
                QuizMatchingPair(prompt: "上", match: "下")
            ],
            choices: ["下", "後ろ", "左"],
            explanation: "『右=左』『前=後ろ』『上=下』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "父", match: "ちち"),
                QuizMatchingPair(prompt: "母", match: "はは"),
                QuizMatchingPair(prompt: "兄", match: "あに")
            ],
            choices: ["あに", "ちち", "はは"],
            explanation: "『父=ちち』『母=はは』『兄=あに』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと なかまが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "えんぴつ", match: "ぶんぼうぐ"),
                QuizMatchingPair(prompt: "ひまわり", match: "花"),
                QuizMatchingPair(prompt: "きつね", match: "どうぶつ")
            ],
            choices: ["どうぶつ", "花", "ぶんぼうぐ"],
            explanation: "『えんぴつ=ぶんぼうぐ』『ひまわり=花』『きつね=どうぶつ』が正しい組み合わせです。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『日記』",
            answer: "にっき",
            explanation: "『日記』の読みは『にっき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『絵日記』",
            answer: "えにっき",
            explanation: "『絵日記』の読みは『えにっき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『音楽』",
            answer: "おんがく",
            explanation: "『音楽』の読みは『おんがく』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『国語』",
            answer: "こくご",
            explanation: "『国語』の読みは『こくご』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『算数』",
            answer: "さんすう",
            explanation: "『算数』の読みは『さんすう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『ほんを じゅんばんに よむところを ＿＿ という。』",
            answer: "目次",
            acceptableAnswers: ["もくじ"],
            explanation: "本のページをじゅんばんに示したものを『目次（もくじ）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『文の最後に 「。」をつかいます。これを ＿＿ といいます。』",
            answer: "句点",
            acceptableAnswers: ["くてん"],
            explanation: "文の終わりにつける「。」を『句点（くてん）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『文の中で、休むところに 「、」をつかいます。これを ＿＿ といいます。』",
            answer: "読点",
            acceptableAnswers: ["とうてん"],
            explanation: "文の中の区切りにつける「、」を『読点（とうてん）』といいます。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ひろしが もらったものを そのまま ぬき出しましょう。\n『ひろしは お父さんに もらった 青い ランドセルを うれしそうに せおった。』",
            answer: "青い ランドセル",
            acceptableAnswers: ["青いランドセル", "あおいランドセル", "あおい ランドセル"],
            explanation: "ひろしがもらったものは『青い ランドセル』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「どこで」に あたることばを そのまま ぬき出しましょう。\n『まきこさんは 音楽室で、先生の ピアノに 合わせて 大きな こえで うたった。』",
            answer: "音楽室で",
            acceptableAnswers: ["おんがくしつで"],
            explanation: "『どこで』にあたることばは『音楽室で』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["よみました", "ぼくは", "おもしろい", "本を", "図書館で"],
            orderedChoices: ["ぼくは", "図書館で", "おもしろい", "本を", "よみました"],
            explanation: "『ぼくは 図書館で おもしろい 本を よみました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["歌いました", "みんなで", "音楽室で", "大きな声で", "校歌を"],
            orderedChoices: ["みんなで", "音楽室で", "大きな声で", "校歌を", "歌いました"],
            explanation: "『みんなで 音楽室で 大きな声で 校歌を 歌いました。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "弟", match: "おとうと"),
                QuizMatchingPair(prompt: "妹", match: "いもうと"),
                QuizMatchingPair(prompt: "姉", match: "あね")
            ],
            choices: ["あね", "おとうと", "いもうと"],
            explanation: "『弟=おとうと』『妹=いもうと』『姉=あね』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】つなぎ言葉と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "だから", match: "理由の結果"),
                QuizMatchingPair(prompt: "しかし", match: "反対のことをいう"),
                QuizMatchingPair(prompt: "また", match: "つけたして言う")
            ],
            choices: ["つけたして言う", "反対のことをいう", "理由の結果"],
            explanation: "つなぎ言葉のはたらきを覚えましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】文の はじめと つづきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "雪がふったので", match: "外が白くなりました"),
                QuizMatchingPair(prompt: "おなかがすいたので", match: "ごはんを食べました"),
                QuizMatchingPair(prompt: "友だちが来たので", match: "いっしょに遊びました")
            ],
            choices: ["いっしょに遊びました", "外が白くなりました", "ごはんを食べました"],
            explanation: "前の文と後ろの文が自然につながるように組み合わせましょう。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『手紙』",
            answer: "てがみ",
            explanation: "『手紙』の読みは『てがみ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『先生』",
            answer: "せんせい",
            explanation: "『先生』の読みは『せんせい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『学校』",
            answer: "がっこう",
            explanation: "『学校』の読みは『がっこう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『友だち』",
            answer: "ともだち",
            explanation: "『友だち』の読みは『ともだち』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『元気』",
            answer: "げんき",
            explanation: "『元気』の読みは『げんき』です。"
        ),

        QuizQuestion(
        question: "【漢字の読み】つぎの文の『岩』の読みはどれでしょう。\n『川べに 大きな 岩が あります。』",
        choices: [
        "いわ",
        "かわ",
        "やま",
        "たに"
        ],
        correctAnswerIndex: 0,
        explanation: "『岩』の読みは『いわ』です。"
        ),

        QuizQuestion(
        question: "【漢字の書き】つぎの文の『ひかり』を漢字で書いたものはどれでしょう。\n『まどから 明るい ひかりが 入ります。』",
        choices: [
        "広",
        "光",
        "明",
        "星"
        ],
        correctAnswerIndex: 1,
        explanation: "『ひかり』は漢字で『光』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】つぎの漢字の読みを、ひらがなで答えましょう。\n『汽車』",
        answer: "きしゃ",
        explanation: "『汽車』の読みは『きしゃ』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の書き】つぎの文の『ひる』を、漢字一字で答えましょう。\n『ひるに おべんとうを 食べました。』",
        answer: "昼",
        explanation: "『ひる』は漢字で『昼』と書きます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】漢字を使った言葉と読みを、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "古い本", match: "ふるいほん"),
        QuizMatchingPair(prompt: "黄色い花", match: "きいろいはな"),
        QuizMatchingPair(prompt: "長い道", match: "ながいみち"),
        QuizMatchingPair(prompt: "丸い石", match: "まるいいし")
        ],
        choices: ["ながいみち", "まるいいし", "ふるいほん", "きいろいはな"],
        explanation: "『古い本=ふるいほん』『黄色い花=きいろいはな』『長い道=ながいみち』『丸い石=まるいいし』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『広い』と反対の意味の言葉はどれでしょう。",
        choices: [
        "大きい",
        "長い",
        "せまい",
        "近い"
        ],
        correctAnswerIndex: 2,
        explanation: "『広い』と反対の意味の言葉は『せまい』です。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『強い』と反対の意味の言葉はどれでしょう。",
        choices: [
        "かたい",
        "大きい",
        "太い",
        "弱い"
        ],
        correctAnswerIndex: 3,
        explanation: "『強い』と反対の意味の言葉は『弱い』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【反対の意味の言葉】『新しい』と反対の意味の言葉を答えましょう。",
        answer: "古い",
        acceptableAnswers: ["ふるい"],
        explanation: "『新しい』と反対の意味の言葉は『古い』です。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『しゅっぱつ』と反対の意味の言葉はどれでしょう。",
        choices: [
        "とうちゃく",
        "みおくり",
        "りょこう",
        "じゅんび"
        ],
        correctAnswerIndex: 0,
        explanation: "『しゅっぱつ』と反対の意味の言葉は『とうちゃく』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】反対の意味になる言葉を、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "太い", match: "細い"),
        QuizMatchingPair(prompt: "遠い", match: "近い"),
        QuizMatchingPair(prompt: "売る", match: "買う"),
        QuizMatchingPair(prompt: "朝", match: "夜")
        ],
        choices: ["買う", "夜", "細い", "近い"],
        explanation: "『太い=細い』『遠い=近い』『売る=買う』『朝=夜』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【似た意味の言葉】『おどろく』と似た意味の言葉はどれでしょう。",
        choices: [
        "わらう",
        "びっくりする",
        "こまる",
        "いそぐ"
        ],
        correctAnswerIndex: 1,
        explanation: "『おどろく』と似た意味の言葉は『びっくりする』です。"
        ),

        QuizQuestion(
        question: "【似た意味の言葉】『こわれた おもちゃを なおす。』の『なおす』と似た意味の言葉はどれでしょう。",
        choices: [
        "かくす",
        "すてる",
        "もとどおりにする",
        "よごす"
        ],
        correctAnswerIndex: 2,
        explanation: "この文の『なおす』と似た意味の言葉は『もとどおりにする』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【似た意味の言葉】つぎの ＿＿ に入る、『たくさん』と似た意味の四文字の言葉を答えましょう。最初と最後の文字は『い』です。\n『かごに りんごが ＿＿ あります。』",
        answer: "いっぱい",
        explanation: "『たくさん』と似た意味で、最初と最後の文字が『い』の四文字の言葉は『いっぱい』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『びっくりして』と似た意味の『おどろいて』を使い、『わたしは』から始まる文を作りましょう。",
        choices: ["ふりむきました", "わたしは", "大きな音に", "おどろいて"],
        orderedChoices: ["わたしは", "大きな音に", "おどろいて", "ふりむきました"],
        explanation: "『わたしは 大きな音に おどろいて ふりむきました。』が正しい順番です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】似た意味の言葉を、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "うつくしい景色", match: "きれいな景色"),
        QuizMatchingPair(prompt: "少し休む", match: "ちょっと休む"),
        QuizMatchingPair(prompt: "用意する", match: "じゅんびする"),
        QuizMatchingPair(prompt: "道をたずねる", match: "道をきく")
        ],
        choices: ["道をきく", "ちょっと休む", "きれいな景色", "じゅんびする"],
        explanation: "『うつくしい景色=きれいな景色』『少し休む=ちょっと休む』『用意する=じゅんびする』『道をたずねる=道をきく』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【主語と述語】つぎの文の主語はどれでしょう。\n『白い雲が 空に うかんでいます。』",
        choices: [
        "空に",
        "うかんで",
        "うかんでいます",
        "白い雲が"
        ],
        correctAnswerIndex: 3,
        explanation: "この文の主語は『白い雲が』です。"
        ),

        QuizQuestion(
        question: "【主語と述語】つぎの文の述語はどれでしょう。\n『弟は 毎朝 犬と 走ります。』",
        choices: [
        "走ります",
        "弟は",
        "毎朝",
        "犬と"
        ],
        correctAnswerIndex: 0,
        explanation: "この文の述語は『走ります』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【主語と述語】つぎの文の主語を、助詞もつけて答えましょう。\n『小鳥が 木のえだで 鳴きます。』",
        answer: "小鳥が",
        acceptableAnswers: ["ことりが"],
        explanation: "この文の主語は『小鳥が』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『わたしの』から始め、『今年』を述語『二年生です』のすぐ前に置いて、文を作りましょう。",
        choices: ["二年生です", "今年", "弟は", "わたしの"],
        orderedChoices: ["わたしの", "弟は", "今年", "二年生です"],
        explanation: "『わたしの 弟は 今年 二年生です。』が正しい順番です。主語は『わたしの弟は』、述語は『二年生です』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『雨が』から始め、『しずかに』を述語『ふっています』のすぐ前に置いて、文を作りましょう。",
        choices: ["ふっています", "雨が", "朝から", "しずかに"],
        orderedChoices: ["雨が", "朝から", "しずかに", "ふっています"],
        explanation: "『雨が 朝から しずかに ふっています。』が正しい順番です。主語は『雨が』、述語は『ふっています』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『わたしは 本（　）読みます。』",
        choices: [
        "が",
        "を",
        "に",
        "で"
        ],
        correctAnswerIndex: 1,
        explanation: "『本を読みます』となるので、助詞は『を』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『子どもたちは 公園（　）遊びます。』",
        choices: [
        "を",
        "に",
        "で",
        "と"
        ],
        correctAnswerIndex: 2,
        explanation: "遊ぶ場所を表すので、助詞は『で』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【助詞】つぎの文の ＿＿ に入る助詞を、ひらがな一文字で答えましょう。\n『えんぴつ ＿＿ 字を 書きます。』",
        answer: "で",
        explanation: "字を書くために使う道具を表すので、助詞は『で』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『空から 雨（　）ふりはじめました。』",
        choices: [
        "を",
        "に",
        "で",
        "が"
        ],
        correctAnswerIndex: 3,
        explanation: "ふり始めたものは雨なので、助詞は『が』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『わたしは』から始め、乗り物、行き先、動作の順になるように文を作りましょう。",
        choices: ["学校へ", "行きます", "わたしは", "バスで"],
        orderedChoices: ["わたしは", "バスで", "学校へ", "行きます"],
        explanation: "『わたしは バスで 学校へ 行きます。』が正しい順番です。『で』は乗り物、『へ』は行き先を表します。"
        ),

        QuizQuestion(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『土曜日、ゆうたは お父さんと 近くの池へ 行きました。池では、二人で 小さな魚を 見ました。』\nゆうたは、だれと池へ行きましたか。",
        choices: [
        "お父さん",
        "友だち",
        "弟",
        "先生"
        ],
        correctAnswerIndex: 0,
        explanation: "文に『ゆうたは お父さんと 近くの池へ 行きました』とあるので、正解は『お父さん』です。"
        ),

        QuizQuestion(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『みさきは 朝、空を 見ました。黒い雲が 広がり、風も 強くなってきました。みさきは、かさを 持って 家を 出ました。』\nみさきが、かさを持って出たのはなぜでしょう。",
        choices: [
        "日ざしが強いと思ったから",
        "雨がふりそうだと思ったから",
        "かさを友だちに見せたいから",
        "風でかさを飛ばしたいから"
        ],
        correctAnswerIndex: 1,
        explanation: "黒い雲が広がり、風も強くなったので、正解は『雨がふりそうだと思ったから』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『日曜日、けんたは 図書館で 本を 二さつ かりました。返す日は 来週の月曜日です。』\nけんたが本を返す日は何曜日ですか。",
        answer: "月曜日",
        acceptableAnswers: ["げつようび"],
        explanation: "文に『返す日は 来週の月曜日です』とあるので、答えは『月曜日』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】つぎの文を読み、できごとを起こった順に並べましょう。\n『朝になりました。あやは 花の種を うえました。そのあと 水を やり、最後に 名札を 立てました。』",
        choices: ["名札を立てました", "花の種をうえました", "朝になりました", "水をやりました"],
        orderedChoices: ["朝になりました", "花の種をうえました", "水をやりました", "名札を立てました"],
        explanation: "『朝になりました→花の種をうえました→水をやりました→名札を立てました』の順です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】つぎの文を読み、人としたことを正しく組み合わせましょう。\n『休み時間に、そうたは 本を 読み、りなは 絵を かき、たくみは 虫を 見つけ、ゆいは 花に 水を やりました。』",
        pairs: [
        QuizMatchingPair(prompt: "そうた", match: "本を読んだ"),
        QuizMatchingPair(prompt: "りな", match: "絵をかいた"),
        QuizMatchingPair(prompt: "たくみ", match: "虫を見つけた"),
        QuizMatchingPair(prompt: "ゆい", match: "花に水をやった")
        ],
        choices: ["虫を見つけた", "花に水をやった", "本を読んだ", "絵をかいた"],
        explanation: "『そうた=本を読んだ』『りな=絵をかいた』『たくみ=虫を見つけた』『ゆい=花に水をやった』が正しい組み合わせです。"
        ),
        QuizQuestion(
        question: "【漢字の読み】つぎの文の『羽』の読みはどれでしょう。\n『白い 羽が ふわりと 落ちました。』",
        choices: [
        "はね",
        "はな",
        "はる",
        "ほし"
        ],
        correctAnswerIndex: 0,
        explanation: "『羽』の読みは『はね』です。"
        ),

        QuizQuestion(
        question: "【漢字の書き】つぎの文の『こえ』を漢字で書いたものはどれでしょう。\n『名前を よばれて、大きな こえで 返事を しました。』",
        choices: [
        "言",
        "話",
        "声",
        "音"
        ],
        correctAnswerIndex: 2,
        explanation: "人が口から出す『こえ』は、漢字で『声』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】つぎの言葉の読みを、ひらがなで答えましょう。\n『親子』",
        answer: "おやこ",
        explanation: "『親子』の読みは『おやこ』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の書き】『はれ』を表す漢字を、一字で答えましょう。",
        answer: "晴",
        explanation: "天気がよく、空に雲が少ない『はれ』は、漢字で『晴』と書きます。"
        ),

        QuizQuestion.matching(
        question: "【漢字の読み】四つの言葉と読みを、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "内科", match: "ないか"),
        QuizMatchingPair(prompt: "半分", match: "はんぶん"),
        QuizMatchingPair(prompt: "来週", match: "らいしゅう"),
        QuizMatchingPair(prompt: "野原", match: "のはら")
        ],
        choices: ["らいしゅう", "のはら", "ないか", "はんぶん"],
        explanation: "『内科=ないか』『半分=はんぶん』『来週=らいしゅう』『野原=のはら』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『早い』と反対の意味の言葉はどれでしょう。",
        choices: [
        "近い",
        "おそい",
        "細い",
        "かるい"
        ],
        correctAnswerIndex: 1,
        explanation: "『早い』と反対の意味の言葉は『おそい』です。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『多い』と反対の意味の言葉はどれでしょう。",
        choices: [
        "長い",
        "近い",
        "広い",
        "少ない"
        ],
        correctAnswerIndex: 3,
        explanation: "『多い』と反対の意味の言葉は『少ない』です。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『入る』と反対の意味の言葉はどれでしょう。",
        choices: [
        "出る",
        "立つ",
        "来る",
        "見る"
        ],
        correctAnswerIndex: 0,
        explanation: "『入る』と反対の意味の言葉は『出る』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【反対の意味の言葉】『高い』と反対の意味の言葉を答えましょう。",
        answer: "低い",
        acceptableAnswers: ["ひくい"],
        explanation: "『高い』と反対の意味の言葉は『低い』です。"
        ),

        QuizQuestion.matching(
        question: "【反対の意味の言葉】左の言葉と反対になる言葉を、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "はじめる", match: "おわる"),
        QuizMatchingPair(prompt: "たつ", match: "すわる"),
        QuizMatchingPair(prompt: "あげる", match: "さげる"),
        QuizMatchingPair(prompt: "わらう", match: "なく")
        ],
        choices: ["さげる", "なく", "おわる", "すわる"],
        explanation: "『はじめる=おわる』『たつ=すわる』『あげる=さげる』『わらう=なく』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【似た意味の言葉】『話す』と似た意味の言葉はどれでしょう。",
        choices: [
        "ならべる",
        "かぞえる",
        "しゃべる",
        "しまう"
        ],
        correctAnswerIndex: 2,
        explanation: "『話す』と似た意味の言葉は『しゃべる』です。"
        ),

        QuizQuestion(
        question: "【似た意味の言葉】『ようやく』と似た意味の言葉はどれでしょう。",
        choices: [
        "いつも",
        "やっと",
        "たぶん",
        "もっと"
        ],
        correctAnswerIndex: 1,
        explanation: "『ようやく』と似た意味の言葉は『やっと』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【似た意味の言葉】『たいせつ』と似た意味の、ひらがな三文字の言葉を答えましょう。",
        answer: "だいじ",
        explanation: "『たいせつ』と似た意味の、ひらがな三文字の言葉は『だいじ』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『ゆっくり』と似た意味の『のんびり』を使い、『わたしは』から始め、『家で』を『休日を』の前に置いて文を作りましょう。",
        choices: ["休日を", "のんびり すごしました", "わたしは", "家で"],
        orderedChoices: ["わたしは", "家で", "休日を", "のんびり すごしました"],
        explanation: "『わたしは 家で 休日を のんびり すごしました。』が正しい順番です。"
        ),

        QuizQuestion.matching(
        question: "【似た意味の言葉】左の言葉と意味が近い言葉を、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "しらせる", match: "つたえる"),
        QuizMatchingPair(prompt: "たしかめる", match: "かくにんする"),
        QuizMatchingPair(prompt: "よろこぶ", match: "うれしく思う"),
        QuizMatchingPair(prompt: "かたづける", match: "きれいにしまう")
        ],
        choices: ["うれしく思う", "きれいにしまう", "つたえる", "かくにんする"],
        explanation: "『しらせる=つたえる』『たしかめる=かくにんする』『よろこぶ=うれしく思う』『かたづける=きれいにしまう』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【主語と述語】つぎの文の主語はどれでしょう。\n『大きな月が 山の上に 出ました。』",
        choices: [
        "山の上に",
        "出ました",
        "大きな",
        "大きな月が"
        ],
        correctAnswerIndex: 3,
        explanation: "この文の主語は『大きな月が』です。"
        ),

        QuizQuestion(
        question: "【主語と述語】つぎの文の述語はどれでしょう。\n『となりの家の犬は、夜になると ほえます。』",
        choices: [
        "ほえます",
        "となりの家の犬は",
        "夜になると",
        "犬は"
        ],
        correctAnswerIndex: 0,
        explanation: "この文の述語は『ほえます』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【主語と述語】つぎの文の主語を、助詞もつけて答えましょう。\n『赤い電車が 駅に 止まりました。』",
        answer: "赤い電車が",
        acceptableAnswers: ["あかいでんしゃが", "赤い 電車が"],
        explanation: "この文の主語は『赤い電車が』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『弟が』から始め、『大きな声で』を『名前を』の前に置いて、文を作りましょう。",
        choices: ["名前を", "よびました", "弟が", "大きな声で"],
        orderedChoices: ["弟が", "大きな声で", "名前を", "よびました"],
        explanation: "『弟が 大きな声で 名前を よびました。』が正しい順番です。主語は『弟が』、述語は『よびました』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『校庭の』から始め、そのすぐ後に『木の葉が』を置いて、文を作りましょう。",
        choices: ["風に", "ゆれています", "木の葉が", "校庭の"],
        orderedChoices: ["校庭の", "木の葉が", "風に", "ゆれています"],
        explanation: "『校庭の 木の葉が 風に ゆれています。』が正しい順番です。主語は『校庭の木の葉が』、述語は『ゆれています』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『わたしは 妹（　）いっしょに 買い物へ 行きました。』",
        choices: [
        "を",
        "と",
        "で",
        "が"
        ],
        correctAnswerIndex: 1,
        explanation: "いっしょに行動する相手を表すので、助詞は『と』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『机の上（　）ノートが あります。』",
        choices: [
        "を",
        "へ",
        "に",
        "で"
        ],
        correctAnswerIndex: 2,
        explanation: "ノートがある場所を表すので、助詞は『に』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『日曜日（　）家族で 動物園へ 行きます。』",
        choices: [
        "を",
        "で",
        "と",
        "に"
        ],
        correctAnswerIndex: 3,
        explanation: "行く日を表すので、助詞は『に』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【助詞】『何が とどきましたか』の答えになるように、＿＿ に入る助詞を、ひらがな一文字で答えましょう。\n『友だちから 手紙 ＿＿ とどきました。』",
        answer: "が",
        explanation: "とどいたものを表すので、『手紙が とどきました』となります。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『さやかさんは』から始め、『箱から』を『赤いリボンを』の前に置いて、文を作りましょう。",
        choices: ["取り出しました", "赤いリボンを", "さやかさんは", "箱から"],
        orderedChoices: ["さやかさんは", "箱から", "赤いリボンを", "取り出しました"],
        explanation: "『さやかさんは 箱から 赤いリボンを 取り出しました。』が正しい順番です。『から』は取り出した場所、『を』は取り出したものを表します。"
        ),

        QuizQuestion(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『水曜日、なおは 学校の帰りに パン屋に 入り、あんパンを 一つ 買いました。家に着くと、妹と 半分ずつ 食べました。』\nなおが学校の帰りによった場所はどこでしょう。",
        choices: [
        "パン屋",
        "本屋",
        "花屋",
        "文ぼう具屋"
        ],
        correctAnswerIndex: 0,
        explanation: "文に『学校の帰りに パン屋に 入り』とあるので、正解は『パン屋』です。"
        ),

        QuizQuestion(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『町の図書館が しまる十分前です。ゆうきは 読みかけの本に しおりを はさみ、貸し出しカウンターへ 急ぎました。』\nゆうきがカウンターへ急いだのはなぜでしょう。",
        choices: [
        "しおりを返したかったから",
        "図書館がもうすぐしまるから",
        "本を元の棚に置きたかったから",
        "友だちが外で待っていたから"
        ],
        correctAnswerIndex: 1,
        explanation: "正解は『図書館がもうすぐしまるから』です。図書館がしまる十分前だったので、ゆうきは本をかりるためにカウンターへ急ぎました。"
        ),

        QuizQuestion.fillInBlank(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『日曜日、りくたちは 朝九時に 学校の門へ 集まる やくそくを しました。りくは 八時五十分に とう着しました。』\nみんなが集まるやくそくの時こくを答えましょう。",
        answer: "九時",
        acceptableAnswers: ["9時", "朝九時", "朝9時"],
        explanation: "文に『朝九時に 学校の門へ 集まる』とあるので、答えは『九時』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】つぎの文を読み、したことを順に並べましょう。\n『あかりは コップに 牛乳を 入れました。つぎに ココアの粉を 加え、スプーンで よく まぜてから 飲みました。』",
        choices: ["ココアを飲みました", "牛乳を入れました", "スプーンでまぜました", "ココアの粉を加えました"],
        orderedChoices: ["牛乳を入れました", "ココアの粉を加えました", "スプーンでまぜました", "ココアを飲みました"],
        explanation: "『牛乳を入れました→ココアの粉を加えました→スプーンでまぜました→ココアを飲みました』の順です。"
        ),

        QuizQuestion.matching(
        question: "【文章読解】つぎの文を読み、四人とそれぞれがしたことを正しく組み合わせましょう。\n『朝の会の前に、こうたは 窓を 開け、えみは 黒板を 消し、りくは 本を 配り、あおいは 花びんの水を かえました。』",
        pairs: [
        QuizMatchingPair(prompt: "こうた", match: "窓を開けた"),
        QuizMatchingPair(prompt: "えみ", match: "黒板を消した"),
        QuizMatchingPair(prompt: "りく", match: "本を配った"),
        QuizMatchingPair(prompt: "あおい", match: "花びんの水をかえた")
        ],
        choices: ["本を配った", "花びんの水をかえた", "窓を開けた", "黒板を消した"],
        explanation: "『こうた=窓を開けた』『えみ=黒板を消した』『りく=本を配った』『あおい=花びんの水をかえた』が正しい組み合わせです。"
        ),
        QuizQuestion(
        question: "【漢字の読み】つぎの文の『船』の読みはどれでしょう。\n『海に 大きな 船が うかんでいます。』",
        choices: [
        "ふね",
        "ふえ",
        "ふで",
        "ふた"
        ],
        correctAnswerIndex: 0,
        explanation: "『船』の読みは『ふね』です。"
        ),

        QuizQuestion(
        question: "【漢字の書き】つぎの文の『むぎ』を漢字で書いたものはどれでしょう。\n『むぎを つかって パンを 作ります。』",
        choices: [
        "米",
        "豆",
        "麦",
        "茶"
        ],
        correctAnswerIndex: 2,
        explanation: "『むぎ』は漢字で『麦』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】つぎの言葉の読みを、ひらがなで答えましょう。\n『時計』",
        answer: "とけい",
        explanation: "『時計』の読みは『とけい』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の書き】つぎの文の『かたな』を、漢字一字で答えましょう。\n『むかしの かたなを 見ました。』",
        answer: "刀",
        explanation: "『かたな』は漢字で『刀』と書きます。"
        ),

        QuizQuestion.matching(
        question: "【漢字の読み】漢字と読みを、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "寺", match: "てら"),
        QuizMatchingPair(prompt: "弓", match: "ゆみ"),
        QuizMatchingPair(prompt: "米", match: "こめ"),
        QuizMatchingPair(prompt: "首", match: "くび")
        ],
        choices: ["くび", "こめ", "てら", "ゆみ"],
        explanation: "『寺=てら』『弓=ゆみ』『米=こめ』『首=くび』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『深い』と反対の意味の言葉はどれでしょう。",
        choices: [
        "広い",
        "浅い",
        "遠い",
        "重い"
        ],
        correctAnswerIndex: 1,
        explanation: "『深い』と反対の意味の言葉は『浅い』です。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『押す』と反対の意味の言葉はどれでしょう。",
        choices: [
        "持つ",
        "曲げる",
        "運ぶ",
        "引く"
        ],
        correctAnswerIndex: 3,
        explanation: "『押す』と反対の意味の言葉は『引く』です。"
        ),

        QuizQuestion(
        question: "【反対の意味の言葉】『勝つ』と反対の意味の言葉はどれでしょう。",
        choices: [
        "負ける",
        "走る",
        "休む",
        "守る"
        ],
        correctAnswerIndex: 0,
        explanation: "『勝つ』と反対の意味の言葉は『負ける』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【反対の意味の言葉】『外がわ』と反対の意味の言葉を答えましょう。",
        answer: "内がわ",
        acceptableAnswers: ["うちがわ", "内側"],
        explanation: "『外がわ』と反対の意味の言葉は『内がわ』です。"
        ),

        QuizQuestion.matching(
        question: "【反対の意味の言葉】反対の意味になる言葉を、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "開ける", match: "閉める"),
        QuizMatchingPair(prompt: "起きる", match: "ねる"),
        QuizMatchingPair(prompt: "行き", match: "帰り"),
        QuizMatchingPair(prompt: "笑う", match: "泣く")
        ],
        choices: ["帰り", "泣く", "閉める", "ねる"],
        explanation: "『開ける=閉める』『起きる=ねる』『行き=帰り』『笑う=泣く』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【似た意味の言葉】『かんたんな問題』と似た意味の言葉はどれでしょう。",
        choices: [
        "むずかしい問題",
        "長い問題",
        "やさしい問題",
        "新しい問題"
        ],
        correctAnswerIndex: 2,
        explanation: "『かんたんな問題』と似た意味の言葉は『やさしい問題』です。"
        ),

        QuizQuestion(
        question: "【似た意味の言葉】『りっぱな絵』と似た意味の言葉はどれでしょう。",
        choices: [
        "小さな絵",
        "すばらしい絵",
        "古い絵",
        "かわいた絵"
        ],
        correctAnswerIndex: 1,
        explanation: "『りっぱな絵』と似た意味の言葉は『すばらしい絵』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【似た意味の言葉】『すぐに』と似た意味の、ひらがな四文字の言葉を答えましょう。",
        answer: "ただちに",
        explanation: "『すぐに』と似た意味の、ひらがな四文字の言葉は『ただちに』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『きちんと』と似た意味の『ちゃんと』を使い、『わたしは』から始め、『ちゃんと』を『もどしました』のすぐ前に置いて文を作りましょう。",
        choices: ["もどしました", "ちゃんと", "使った道具を", "わたしは"],
        orderedChoices: ["わたしは", "使った道具を", "ちゃんと", "もどしました"],
        explanation: "『わたしは 使った道具を ちゃんと もどしました。』が正しい順番です。"
        ),

        QuizQuestion.matching(
        question: "【似た意味の言葉】意味が近い言い方を、正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "大声でよぶ", match: "大きな声でよぶ"),
        QuizMatchingPair(prompt: "そっと置く", match: "しずかに置く"),
        QuizMatchingPair(prompt: "急いで歩く", match: "はやく歩く"),
        QuizMatchingPair(prompt: "しっかり持つ", match: "強く持つ")
        ],
        choices: ["はやく歩く", "強く持つ", "大きな声でよぶ", "しずかに置く"],
        explanation: "『大声でよぶ=大きな声でよぶ』『そっと置く=しずかに置く』『急いで歩く=はやく歩く』『しっかり持つ=強く持つ』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【主語と述語】つぎの文の主語はどれでしょう。\n『校庭のさくらの木は、春に 花を 咲かせます。』",
        choices: [
        "春に",
        "花を",
        "花を咲かせます",
        "校庭のさくらの木は"
        ],
        correctAnswerIndex: 3,
        explanation: "この文の主語は『校庭のさくらの木は』です。"
        ),

        QuizQuestion(
        question: "【主語と述語】つぎの文の述語はどれでしょう。\n『小さなかえるが 石の上で 休んでいます。』",
        choices: [
        "休んでいます",
        "小さなかえるが",
        "石の上で",
        "小さな"
        ],
        correctAnswerIndex: 0,
        explanation: "この文の述語は『休んでいます』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【主語と述語】つぎの文の述語を答えましょう。\n『妹の赤いぼうしが 風に とばされました。』",
        answer: "とばされました",
        acceptableAnswers: ["飛ばされました"],
        explanation: "この文の述語は『とばされました』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『夏の夜に』から始め、そのすぐ後に『ほたるが』を置き、『飛びます』で終わる文を作りましょう。",
        choices: ["川べを", "飛びます", "夏の夜に", "ほたるが"],
        orderedChoices: ["夏の夜に", "ほたるが", "川べを", "飛びます"],
        explanation: "『夏の夜に ほたるが 川べを 飛びます。』が正しい順番です。主語は『ほたるが』、述語は『飛びます』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『ぼくのおじいさんは』から始め、『毎朝』を『新聞を』の前に置いて文を作りましょう。",
        choices: ["新聞を", "読みます", "ぼくのおじいさんは", "毎朝"],
        orderedChoices: ["ぼくのおじいさんは", "毎朝", "新聞を", "読みます"],
        explanation: "『ぼくのおじいさんは 毎朝 新聞を 読みます。』が正しい順番です。主語は『ぼくのおじいさんは』、述語は『読みます』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『わたしは 駅（　）電車を 待ちました。』",
        choices: [
        "に",
        "で",
        "を",
        "へ"
        ],
        correctAnswerIndex: 1,
        explanation: "電車を待った場所を表すので、助詞は『で』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『鳥が 屋根（　）空へ 飛び立ちました。』",
        choices: [
        "まで",
        "へ",
        "から",
        "と"
        ],
        correctAnswerIndex: 2,
        explanation: "飛び立った場所を表すので、助詞は『から』です。"
        ),

        QuizQuestion(
        question: "【助詞】つぎの文の（　）に入る助詞はどれでしょう。\n『このかばんは 兄（　）ものです。』",
        choices: [
        "と",
        "を",
        "に",
        "の"
        ],
        correctAnswerIndex: 3,
        explanation: "だれの持ち物かを表すので、助詞は『の』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【助詞】つぎの文の ＿＿ に入る助詞を、ひらがな二文字で答えましょう。\n『図書室は 月曜日 ＿＿ 金曜日まで 開いています。』",
        answer: "から",
        explanation: "始まりの日を表すので、『月曜日から 金曜日まで』となります。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『母は』から始め、『ナイフで』を『くだものを』のすぐ前に置き、『切りました』で終わる文を作りましょう。",
        choices: ["くだものを", "母は", "切りました", "ナイフで"],
        orderedChoices: ["母は", "ナイフで", "くだものを", "切りました"],
        explanation: "『母は ナイフで くだものを 切りました。』が正しい順番です。『で』は使った道具、『を』は切ったものを表します。"
        ),

        QuizQuestion(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『日曜日の朝、はるとは 家の前を そうじしました。ほうきで 落ち葉を 集めたあと、ごみぶくろに 入れました。』\nはるとは、何を使って落ち葉を集めましたか。",
        choices: [
        "ほうき",
        "ちりとり",
        "ぞうきん",
        "バケツ"
        ],
        correctAnswerIndex: 0,
        explanation: "文に『ほうきで 落ち葉を 集めた』とあるので、正解は『ほうき』です。"
        ),

        QuizQuestion(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『えりは、明日の図工で使う 空き箱が 見つかりませんでした。お母さんに たずねると、台所のたなに あると 教えてくれました。えりは すぐに 台所へ 行きました。』\nえりが台所へ行ったのはなぜでしょう。",
        choices: [
        "お皿を洗うため",
        "お母さんをよぶため",
        "空き箱を取りに行くため",
        "おやつを食べるため"
        ],
        correctAnswerIndex: 2,
        explanation: "図工で使う空き箱が台所のたなにあると聞いたので、正解は『空き箱を取りに行くため』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【文章読解】つぎの文を読み、答えましょう。\n『そうまは 遠足の日、青いハンカチと 白いタオルを 持っていきました。昼食の前に 手を洗い、青いハンカチで 手をふきました。』\nそうまが手をふくために使ったものを答えましょう。",
        answer: "青いハンカチ",
        acceptableAnswers: ["あおいハンカチ"],
        explanation: "文に『青いハンカチで 手をふきました』とあるので、答えは『青いハンカチ』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】つぎの文を読み、したことを順に並べましょう。\n『みおは 植木ばちに 土を 入れました。つぎに 種を まき、その上に 土を かぶせました。最後に じょうろで 水を やりました。』",
        choices: ["水をやりました", "種をまきました", "土をかぶせました", "植木ばちに土を入れました"],
        orderedChoices: ["植木ばちに土を入れました", "種をまきました", "土をかぶせました", "水をやりました"],
        explanation: "『植木ばちに土を入れました→種をまきました→土をかぶせました→水をやりました』の順です。"
        ),

        QuizQuestion.matching(
        question: "【文章読解】つぎの文を読み、四人とそれぞれがしたことを正しく組み合わせましょう。\n『帰りの会のあと、けいは 机を ふき、ななは 鉛筆を けずり、そうは 図かんを 本だなに もどし、まいは 水そうの魚に えさを やりました。』",
        pairs: [
        QuizMatchingPair(prompt: "けい", match: "机をふいた"),
        QuizMatchingPair(prompt: "なな", match: "鉛筆をけずった"),
        QuizMatchingPair(prompt: "そう", match: "図かんをもどした"),
        QuizMatchingPair(prompt: "まい", match: "魚にえさをやった")
        ],
        choices: ["魚にえさをやった", "図かんをもどした", "机をふいた", "鉛筆をけずった"],
        explanation: "『けい=机をふいた』『なな=鉛筆をけずった』『そう=図かんをもどした』『まい=魚にえさをやった』が正しい組み合わせです。"
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
        QuizView(
            quizzes: shuffledQuizList,
            quizLevel: .kokugo2,
            authManager: authManager,
            audioManager: audioManager,
            isPresenting: $isPresenting,
            interstitial: sharedInterstitial
        )
    }
}

struct Kokugo2ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo2ListView(isPresenting: .constant(false))
    }
}
