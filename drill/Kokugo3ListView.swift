//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo3ListView: View {
    @Binding var isPresenting: Bool

    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『その日に あったことを 日ごとに 書きのこすものを ＿＿ といいます。』",
            answer: "日記",
            acceptableAnswers: ["にっき"],
            explanation: "その日にあったことを日ごとに書きのこすものは『日記』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『ことばの いみや つかい方を しらべる 本を ＿＿ といいます。』",
            answer: "辞典",
            acceptableAnswers: ["じてん"],
            explanation: "ことばの意味や使い方を調べる本は『辞典』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『坂』",
            answer: "さか",
            explanation: "『坂』の読みは『さか』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『深い』",
            answer: "ふかい",
            explanation: "『深い』の読みは『ふかい』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、しょうたが 見つけたものを そのまま ぬき出しましょう。\n『しょうたは 雨上がりの 校庭で 大きな みずたまりを 見つけました。』",
            answer: "大きな みずたまり",
            acceptableAnswers: ["大きなみずたまり", "みずたまり", "水たまり", "大きな水たまり"],
            explanation: "しょうたが見つけたものは『大きな みずたまり』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「どこで」に あたることばを そのまま ぬき出しましょう。\n『朝早く、あやさんは ベランダで あさがおに 水を やりました。』",
            answer: "ベランダで",
            explanation: "『どこで』にあたることばは『ベランダで』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、弟の ようすが 分かることばを そのまま ぬき出しましょう。\n『弟は うれしそうに 新しい じてん車を おしました。』",
            answer: "うれしそうに",
            explanation: "弟のようすが分かることばは『うれしそうに』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、先生が 書いたものを そのまま ぬき出しましょう。\n『先生は 黒板に 大切な 言葉を 赤い チョークで 書きました。』",
            answer: "大切な 言葉",
            acceptableAnswers: ["大切な言葉", "たいせつなことば", "たいせつな 言葉"],
            explanation: "先生が書いたものは『大切な 言葉』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["本を", "読みました", "わたしは", "しずかに", "図書館で"],
            orderedChoices: ["わたしは", "図書館で", "しずかに", "本を", "読みました"],
            explanation: "『わたしは 図書館で しずかに 本を 読みました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["しました", "理科の じっけんを", "ぼくは", "教室で", "昨日"],
            orderedChoices: ["ぼくは", "昨日", "教室で", "理科の じっけんを", "しました"],
            explanation: "『ぼくは 昨日 教室で 理科の じっけんを しました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["見えました", "大きな", "やんだあと", "にじが", "雨が"],
            orderedChoices: ["雨が", "やんだあと", "大きな", "にじが", "見えました"],
            explanation: "『雨が やんだあと 大きな にじが 見えました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["しました", "友だちと", "楽しく", "おにごっこを", "公園で"],
            orderedChoices: ["友だちと", "公園で", "楽しく", "おにごっこを", "しました"],
            explanation: "『友だちと 公園で 楽しく おにごっこを しました。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しずか", match: "音が少ない"),
                QuizMatchingPair(prompt: "うれしい", match: "心が明るい"),
                QuizMatchingPair(prompt: "すばやい", match: "とても速い")
            ],
            choices: ["心が明るい", "とても速い", "音が少ない"],
            explanation: "『しずか=音が少ない』『うれしい=心が明るい』『すばやい=とても速い』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "坂", match: "さか"),
                QuizMatchingPair(prompt: "島", match: "しま"),
                QuizMatchingPair(prompt: "深い", match: "ふかい")
            ],
            choices: ["ふかい", "しま", "さか"],
            explanation: "『坂=さか』『島=しま』『深い=ふかい』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "題名", match: "話や文の 名前"),
                QuizMatchingPair(prompt: "段落", match: "内容の まとまり"),
                QuizMatchingPair(prompt: "会話文", match: "かぎかっこで 書く 文")
            ],
            choices: ["内容の まとまり", "かぎかっこで 書く 文", "話や文の 名前"],
            explanation: "『題名=話や文の 名前』『段落=内容の まとまり』『会話文=かぎかっこで 書く 文』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】つなぎ言葉と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "まず", match: "はじめに いうとき"),
                QuizMatchingPair(prompt: "つぎに", match: "順番を つづけるとき"),
                QuizMatchingPair(prompt: "たとえば", match: "れいを 出すとき")
            ],
            choices: ["順番を つづけるとき", "れいを 出すとき", "はじめに いうとき"],
            explanation: "つなぎ言葉は、文と文のつながりを分かりやすくします。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの説明に 合うことばを答えましょう。\n『人が かぎかっこの中で しゃべっている文を ＿＿ といいます。』",
            answer: "会話文",
            acceptableAnswers: ["かいわぶん"],
            explanation: "人がかぎかっこの中でしゃべっている文を『会話文』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『港』",
            answer: "みなと",
            explanation: "『港』の読みは『みなと』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、かおりさんが ひろったものを そのまま ぬき出しましょう。\n『かおりさんは 理科室で 光る 石を 大事そうに ひろった。』",
            answer: "光る 石",
            acceptableAnswers: ["光る石", "ひかる石", "ひかる 石"],
            explanation: "かおりさんがひろったものは『光る 石』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、おじいさんの ようすが分かることばを そのまま ぬき出しましょう。\n『おじいさんは ゆっくり うなずいて、むかしの話を はじめた。』",
            answer: "ゆっくり うなずいて",
            acceptableAnswers: ["ゆっくりうなずいて"],
            explanation: "おじいさんのようすが分かることばは『ゆっくり うなずいて』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["校庭で", "わたしたちは", "元気よく", "長なわを", "しました"],
            orderedChoices: ["わたしたちは", "校庭で", "元気よく", "長なわを", "しました"],
            explanation: "『わたしたちは 校庭で 元気よく 長なわを しました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["きらきらと", "光っていた", "夜空に", "星が"],
            orderedChoices: ["夜空に", "星が", "きらきらと", "光っていた"],
            explanation: "『夜空に 星が きらきらと 光っていた。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "主語", match: "文の中心となる 人やもの"),
                QuizMatchingPair(prompt: "修飾語", match: "ようすを くわしくする ことば"),
                QuizMatchingPair(prompt: "段落", match: "内容の まとまり")
            ],
            choices: ["内容の まとまり", "文の中心となる 人やもの", "ようすを くわしくする ことば"],
            explanation: "『主語=文の中心となる 人やもの』『修飾語=ようすを くわしくする ことば』『段落=内容の まとまり』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】本の 名前と つかい方が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "国語辞典", match: "ことばの意味を 調べる"),
                QuizMatchingPair(prompt: "漢字辞典", match: "漢字の 読みや意味を 調べる"),
                QuizMatchingPair(prompt: "図かん", match: "絵や写真で くわしく 調べる")
            ],
            choices: ["絵や写真で くわしく 調べる", "ことばの意味を 調べる", "漢字の 読みや意味を 調べる"],
            explanation: "それぞれの本には、ちがう調べ方があります。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『湖』",
            answer: "みずうみ",
            explanation: "『湖』の読みは『みずうみ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『調べる』",
            answer: "しらべる",
            explanation: "『調べる』の読みは『しらべる』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『温かい』",
            answer: "あたたかい",
            acceptableAnswers: ["暖かい"],
            explanation: "『温かい』の読みは『あたたかい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『植物』",
            answer: "しょくぶつ",
            explanation: "『植物』の読みは『しょくぶつ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『動物』",
            answer: "どうぶつ",
            explanation: "『動物』の読みは『どうぶつ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『練習』",
            answer: "れんしゅう",
            explanation: "『練習』の読みは『れんしゅう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『世界』",
            answer: "せかい",
            explanation: "『世界』の読みは『せかい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『橋』",
            answer: "はし",
            explanation: "『橋』の読みは『はし』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『遠足』",
            answer: "えんそく",
            explanation: "『遠足』の読みは『えんそく』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『発表』",
            answer: "はっぴょう",
            explanation: "『発表』の読みは『はっぴょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『着る』",
            answer: "きる",
            explanation: "『着る』の読みは『きる』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『待つ』",
            answer: "まつ",
            explanation: "『待つ』の読みは『まつ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『文の中で、誰が・何が にあたることばを ＿＿ といいます。』",
            answer: "主語",
            acceptableAnswers: ["しゅご"],
            explanation: "文の中の『誰が・何が』にあたることばを『主語』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『文の中で、どうする・どんなだ にあたることばを ＿＿ といいます。』",
            answer: "述語",
            acceptableAnswers: ["じゅつご"],
            explanation: "文の中の『どうする・どんなだ』にあたることばを『述語』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『接続語で、前と反対の内容を続けるときは ＿＿ を使います。』",
            answer: "しかし",
            explanation: "前と反対の内容を続けるときは『しかし』を使います。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『接続語で、前の内容の結果を続けるときは ＿＿ を使います。』",
            answer: "だから",
            acceptableAnswers: ["そのため"],
            explanation: "前の内容の結果を続けるときは『だから』『そのため』を使います。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『手紙の書き方で、相手への気持ちを伝えるまとめの部分を ＿＿ といいます。』",
            answer: "むすび",
            acceptableAnswers: ["結び"],
            explanation: "手紙の最後のまとめの部分を『むすび（結び）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『詩で、同じ言葉やリズムを繰り返すことを ＿＿ といいます。』",
            answer: "くりかえし",
            acceptableAnswers: ["反復", "はんぷく"],
            explanation: "詩で同じ言葉を繰り返すことを『くりかえし（反復）』といいます。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、主語を そのまま ぬき出しましょう。\n『たかしは 毎朝 早くおきて、犬と 元気よく 散歩をします。』",
            answer: "たかしは",
            acceptableAnswers: ["たかし"],
            explanation: "この文の主語は『たかしは』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、述語を そのまま ぬき出しましょう。\n『あかねさんは 放課後、図書室で ていねいに 日記を 書いた。』",
            answer: "書いた",
            acceptableAnswers: ["日記を 書いた", "日記を書いた"],
            explanation: "この文の述語は『書いた』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「どこで」に あたることばを そのまま ぬき出しましょう。\n『校庭のすみに、先生が植えた 小さな 花が さいていた。』",
            answer: "校庭のすみに",
            acceptableAnswers: ["校庭のすみ"],
            explanation: "『どこで』にあたることばは『校庭のすみに』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「いつ」に あたることばを そのまま ぬき出しましょう。\n『雨の日の朝、ゆいは かさをさして 学校へ むかった。』",
            answer: "雨の日の朝",
            acceptableAnswers: ["雨の日の 朝"],
            explanation: "『いつ』にあたることばは『雨の日の朝』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「だれと」に あたることばを そのまま ぬき出しましょう。\n『たろうは 兄と いっしょに、大きな声で 音読の れんしゅうをした。』",
            answer: "兄と",
            acceptableAnswers: ["お兄さんと", "おにいさんと"],
            explanation: "『だれと』にあたることばは『兄と』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、修飾語（どのように）を そのまま ぬき出しましょう。\n『先生が 大切なことを 黒板に 赤い チョークで 書いた。』",
            answer: "赤い チョークで",
            acceptableAnswers: ["赤いチョークで"],
            explanation: "修飾語（どのように）は『赤い チョークで』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["作りました", "わたしたちは", "工作で", "ていねいに", "木の船を"],
            orderedChoices: ["わたしたちは", "工作で", "ていねいに", "木の船を", "作りました"],
            explanation: "『わたしたちは 工作で ていねいに 木の船を 作りました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["見えた", "山の向こうに", "夕日が", "美しい", "大きな"],
            orderedChoices: ["山の向こうに", "大きな", "美しい", "夕日が", "見えた"],
            explanation: "『山の向こうに 大きな 美しい 夕日が 見えた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["読みました", "先生の", "クラスで", "はじめに", "好きな本を"],
            orderedChoices: ["クラスで", "はじめに", "先生の", "好きな本を", "読みました"],
            explanation: "『クラスで はじめに 先生の 好きな本を 読みました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["しました", "公園で", "みんなで", "楽しく", "虫とりを"],
            orderedChoices: ["みんなで", "公園で", "楽しく", "虫とりを", "しました"],
            explanation: "『みんなで 公園で 楽しく 虫とりを しました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["かりました", "図書館で", "ぼくは", "昨日", "図かんを"],
            orderedChoices: ["ぼくは", "昨日", "図書館で", "図かんを", "かりました"],
            explanation: "『ぼくは 昨日 図書館で 図かんを かりました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["書いた", "手紙を", "友だちへ", "ていねいに", "わたしは"],
            orderedChoices: ["わたしは", "友だちへ", "ていねいに", "手紙を", "書いた"],
            explanation: "『わたしは 友だちへ ていねいに 手紙を 書いた。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】接続語と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しかし", match: "反対のことを言う"),
                QuizMatchingPair(prompt: "だから", match: "理由からの結果"),
                QuizMatchingPair(prompt: "そして", match: "つけたして言う")
            ],
            choices: ["つけたして言う", "反対のことを言う", "理由からの結果"],
            explanation: "接続語のはたらきを確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "植物", match: "しょくぶつ"),
                QuizMatchingPair(prompt: "動物", match: "どうぶつ"),
                QuizMatchingPair(prompt: "温かい", match: "あたたかい")
            ],
            choices: ["あたたかい", "しょくぶつ", "どうぶつ"],
            explanation: "『植物=しょくぶつ』『動物=どうぶつ』『温かい=あたたかい』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "主語", match: "文の中心となる人やもの"),
                QuizMatchingPair(prompt: "述語", match: "どうする・どんなだを表す"),
                QuizMatchingPair(prompt: "修飾語", match: "ようすをくわしくする")
            ],
            choices: ["ようすをくわしくする", "文の中心となる人やもの", "どうする・どんなだを表す"],
            explanation: "国語の文法ことばの意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと なかまが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "辞典", match: "調べる本"),
                QuizMatchingPair(prompt: "物語", match: "楽しむ本"),
                QuizMatchingPair(prompt: "図かん", match: "絵で見る本")
            ],
            choices: ["絵で見る本", "調べる本", "楽しむ本"],
            explanation: "『辞典=調べる本』『物語=楽しむ本』『図かん=絵で見る本』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "橋", match: "はし"),
                QuizMatchingPair(prompt: "遠足", match: "えんそく"),
                QuizMatchingPair(prompt: "発表", match: "はっぴょう")
            ],
            choices: ["はっぴょう", "はし", "えんそく"],
            explanation: "『橋=はし』『遠足=えんそく』『発表=はっぴょう』が正しい組み合わせです。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『音読』",
            answer: "おんどく",
            explanation: "『音読』の読みは『おんどく』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『感想』",
            answer: "かんそう",
            explanation: "『感想』の読みは『かんそう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『説明』",
            answer: "せつめい",
            explanation: "『説明』の読みは『せつめい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『問題』",
            answer: "もんだい",
            explanation: "『問題』の読みは『もんだい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『文章の内容が変わるまとまりの単位を ＿＿ といいます。』",
            answer: "段落",
            acceptableAnswers: ["だんらく"],
            explanation: "内容のまとまりを『段落（だんらく）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『詩で、言葉を人がするように表すことを ＿＿ といいます。』",
            answer: "ぎじんほう",
            acceptableAnswers: ["擬人法"],
            explanation: "物を人のように表す表現を『擬人法（ぎじんほう）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを答えましょう。\n『何かにたとえる表現を ＿＿ といいます。』",
            answer: "ひゆ",
            acceptableAnswers: ["比喩", "たとえ"],
            explanation: "何かにたとえる表現を『比喩（ひゆ）』といいます。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、みちこさんの ようすが 分かることばを そのまま ぬき出しましょう。\n『みちこさんは、きれいな声で いっしょうけんめい 歌を 歌った。』",
            answer: "いっしょうけんめい",
            acceptableAnswers: ["一生けんめい", "いっしょうけんめいに"],
            explanation: "みちこさんのようすが分かることばは『いっしょうけんめい』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「いつ」に あたることばを そのまま ぬき出しましょう。\n『午後から、みんなで 学校の花だんの 草むしりを した。』",
            answer: "午後から",
            acceptableAnswers: ["午後"],
            explanation: "『いつ』にあたることばは『午後から』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["かきました", "みんなの前で", "はっきりと", "黒板に", "先生が"],
            orderedChoices: ["先生が", "みんなの前で", "黒板に", "はっきりと", "かきました"],
            explanation: "『先生が みんなの前で 黒板に はっきりと かきました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["した", "教室の外で", "みんなで", "春に", "植物かんさつを"],
            orderedChoices: ["みんなで", "春に", "教室の外で", "植物かんさつを", "した"],
            explanation: "『みんなで 春に 教室の外で 植物かんさつを した。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "感想", match: "かんそう"),
                QuizMatchingPair(prompt: "説明", match: "せつめい"),
                QuizMatchingPair(prompt: "音読", match: "おんどく")
            ],
            choices: ["おんどく", "かんそう", "せつめい"],
            explanation: "『感想=かんそう』『説明=せつめい』『音読=おんどく』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと はんたいの ことばが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "明るい", match: "暗い"),
                QuizMatchingPair(prompt: "広い", match: "せまい"),
                QuizMatchingPair(prompt: "速い", match: "おそい")
            ],
            choices: ["おそい", "暗い", "せまい"],
            explanation: "『明るい=暗い』『広い=せまい』『速い=おそい』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "題名", match: "文章の名前"),
                QuizMatchingPair(prompt: "会話文", match: "かぎかっこで書く文"),
                QuizMatchingPair(prompt: "まとめ", match: "全体をたばねる部分")
            ],
            choices: ["全体をたばねる部分", "文章の名前", "かぎかっこで書く文"],
            explanation: "国語のことばの意味を確かめましょう。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『屋根』",
            answer: "やね",
            explanation: "『屋根』の読みは『やね』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『礼儀』",
            answer: "れいぎ",
            explanation: "『礼儀』の読みは『れいぎ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『根元』",
            answer: "ねもと",
            explanation: "『根元』の読みは『ねもと』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『農業』",
            answer: "のうぎょう",
            explanation: "『農業』の読みは『のうぎょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『昭和』",
            answer: "しょうわ",
            explanation: "『昭和』の読みは『しょうわ』です。"
        ),

        QuizQuestion(
                question: "【漢字】つぎの文の『こおり』を漢字で書いたものはどれですか。\n『池の こおりが とけました。』",
                choices: [
                    "氷",
                    "水",
                    "雪",
                    "池"
                ],
                correctAnswerIndex: 0,
                explanation: "『こおり』は『氷』と書きます。『池の氷がとけました。』が正しい文です。"
            ),

            QuizQuestion(
                question: "【修飾語】つぎの文で、『鳥』をくわしくしている言葉はどれですか。\n『青い 鳥が 高い 木に 止まりました。』",
                choices: [
                    "高い",
                    "木に",
                    "青い",
                    "止まりました"
                ],
                correctAnswerIndex: 2,
                explanation: "『青い』が、どのような鳥なのかをくわしくしています。"
            ),

            QuizQuestion(
                question: "【指示語】つぎの文の『それ』が指しているものはどれですか。\n『わたしは 赤い おり紙で 船を 作りました。それを 水に 浮かべました。』",
                choices: [
                    "赤い色",
                    "おり紙",
                    "船を作ること",
                    "おり紙で作った船"
                ],
                correctAnswerIndex: 3,
                explanation: "水に浮かべたものは船なので、『それ』は『おり紙で作った船』を指しています。"
            ),

            QuizQuestion(
                question: "【接続語】つぎの文の ＿＿ に入る接続語はどれですか。\n『雨が 強く ふっていました。＿＿、試合は 予定どおり 行われました。』",
                choices: [
                    "しかし",
                    "だから",
                    "そして",
                    "たとえば"
                ],
                correctAnswerIndex: 0,
                explanation: "雨が強いことと、試合が予定どおり行われたことは反対の関係なので、『しかし』が入ります。"
            ),

            QuizQuestion(
                question: "【段落】つぎの文章で、新しい段落のはじめにするのがよい文はどれですか。\n①わたしの学校には大きな池があります。②池にはメダカが泳いでいます。③つぎに、図書館をしょうかいします。④図書館にはたくさんの本があります。",
                choices: [
                    "①",
                    "③",
                    "②",
                    "④"
                ],
                correctAnswerIndex: 1,
                explanation: "話題が池から図書館に変わるので、『③』から新しい段落にするのがよいです。"
            ),

            QuizQuestion(
                question: "【ことわざ】『善は急げ』の意味として正しいものはどれですか。",
                choices: [
                    "急ぐと必ず失敗すること",
                    "よいことは人に任せること",
                    "よいと思ったことはすぐに行うこと",
                    "何事もゆっくり進めること"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『よいと思ったことはすぐに行うこと』です。『善は急げ』は、よいと思ったことはためらわず、すぐに行うのがよいという意味です。"
            ),

            QuizQuestion(
                question: "【物語文】つぎの文のとき、はるとの気持ちとしてもっとも合うものはどれですか。\n『発表を終えると、友だちが「とても分かりやすかったよ。」と言いました。はるとは、にっこり笑って席にもどりました。』",
                choices: [
                    "腹を立てている",
                    "さびしくなっている",
                    "困っている",
                    "ほっとして、うれしくなっている"
                ],
                correctAnswerIndex: 3,
                explanation: "友だちにほめられて、にっこり笑っているので、はるとは『ほっとして、うれしくなっている』と考えられます。"
            ),

            QuizQuestion(
                question: "【漢字】つぎの文の『薬』の読みとして正しいものはどれですか。\n『食後に 薬を 飲みます。』",
                choices: [
                    "くすり",
                    "ぐすり",
                    "やく",
                    "くす"
                ],
                correctAnswerIndex: 0,
                explanation: "『薬』の読みは『くすり』です。"
            ),

            QuizQuestion(
                question: "【修飾語】つぎの文で、『速く』をさらにくわしくしている言葉はどれですか。\n『弟は とても 速く 走りました。』",
                choices: [
                    "弟は",
                    "走りました",
                    "とても",
                    "速く"
                ],
                correctAnswerIndex: 2,
                explanation: "『とても』は、『速く』の程度をくわしくしています。"
            ),

            QuizQuestion(
                question: "【指示語】先生が手に持っている地図を指して話すとき、＿＿ に入る言葉はどれですか。\n『＿＿ 地図を 見てください。』",
                choices: [
                    "あの",
                    "その",
                    "どの",
                    "この"
                ],
                correctAnswerIndex: 3,
                explanation: "話し手である先生の近くにある地図なので、『この地図』と言います。"
            ),

            QuizQuestion.fillInBlank(
                question: "【漢字の読み】つぎの漢字の読みを、ひらがなで答えましょう。\n『係』",
                answer: "かかり",
                explanation: "『係』の読みは『かかり』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【接続語】つぎの文の ＿＿ に入る、『その』で始まり『ため』で終わる接続語を答えましょう。\n『電車が おくれました。＿＿、集合時刻に 間に合いませんでした。』",
                answer: "そのため",
                explanation: "電車がおくれたことが原因で、集合時刻に間に合わなかったので、『そのため』が入ります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【段落】つぎの文の ＿＿ に入る言葉を答えましょう。\n『新しい段落のはじめは、行のはじめを ＿＿ 下げて書きます。』",
                answer: "一字",
                acceptableAnswers: ["1字"],
                explanation: "新しい段落のはじめは、行のはじめを『一字』下げて書きます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【ことわざ】つぎのことわざの ＿＿ に入る言葉を答えましょう。\n『転ばぬ先の ＿＿ 』",
                answer: "杖",
                acceptableAnswers: ["つえ"],
                explanation: "ことわざは『転ばぬ先の杖』です。失敗しないように、前もって用心することが大切だという意味です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【物語文】つぎの説明に合う言葉を答えましょう。\n『物語の中で、出来事が大きく動き、読む人がもっとも引きつけられるところを ＿＿ といいます。』",
                answer: "山場",
                acceptableAnswers: ["やまば"],
                explanation: "物語の中で、出来事が大きく動くところを『山場』といいます。"
            ),

            QuizQuestion.extractText(
                question: "【修飾語・抜き出し】つぎの文を読み、『桜』をくわしくしている言葉をそのまま抜き出しましょう。\n『校庭の 桜が、春の風に ゆれています。』",
                answer: "校庭の",
                explanation: "『校庭の』が、どこの桜なのかをくわしくしています。"
            ),

            QuizQuestion.extractText(
                question: "【指示語・抜き出し】つぎの文を読み、『その本』が指している言葉をそのまま抜き出しましょう。\n『図書館で 科学の本を 借りました。その本には、星の写真が のっていました。』",
                answer: "科学の本",
                explanation: "『その本』は、前に出てきた『科学の本』を指しています。"
            ),

            QuizQuestion.extractText(
                question: "【段落・抜き出し】つぎの文章の、第2段落のはじめの一文をそのまま抜き出しましょう。\n『わたしの町には小さな川があります。夏には魚が元気に泳ぎます。\n\nこの川をきれいに保つため、町の人たちは毎月そうじをしています。わたしも家族と参加しています。』",
                answer: "この川をきれいに保つため、町の人たちは毎月そうじをしています。",
                explanation: "第2段落のはじめの一文は『この川をきれいに保つため、町の人たちは毎月そうじをしています。』です。"
            ),

            QuizQuestion.extractText(
                question: "【物語文・抜き出し】つぎの文を読み、ゆうきの気持ちが変わったことが分かる会話の内容を抜き出しましょう。\n『ゆうきは虫が苦手で、虫を見に行く会に参加したくありませんでした。けれど、友だちが見つけた美しい羽のトンボを見ると、「もう少し近くで見てみたい。」と言いました。』",
                answer: "もう少し近くで見てみたい。",
                explanation: "『もう少し近くで見てみたい。』という会話文から、ゆうきの気持ちが変わったことが分かります。"
            ),

            QuizQuestion.reorder(
                question: "【接続語・並べ替え】理由と結果が自然につながる文になるように並べましょう。",
                choices: [
                    "そのため、",
                    "道が ぬれていました。",
                    "ゆっくり 歩きました。",
                    "雨が ふったので、"
                ],
                orderedChoices: [
                    "雨が ふったので、",
                    "道が ぬれていました。",
                    "そのため、",
                    "ゆっくり 歩きました。"
                ],
                explanation: "『雨が ふったので、道が ぬれていました。そのため、ゆっくり 歩きました。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【段落・並べ替え】一つの段落として、考えが自然に伝わる順番に並べましょう。",
                choices: [
                    "また、物語の世界を 楽しめます。",
                    "だから、これからも 朝の読書を 続けたいです。",
                    "わたしは 朝の読書が 好きです。",
                    "本を読むと、知らない言葉に 出会えます。"
                ],
                orderedChoices: [
                    "わたしは 朝の読書が 好きです。",
                    "本を読むと、知らない言葉に 出会えます。",
                    "また、物語の世界を 楽しめます。",
                    "だから、これからも 朝の読書を 続けたいです。"
                ],
                explanation: "『わたしは 朝の読書が 好きです。本を読むと、知らない言葉に 出会えます。また、物語の世界を 楽しめます。だから、これからも 朝の読書を 続けたいです。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【ことわざ・並べ替え】分からないことは質問するのが大切だと教えることわざになるように並べましょう。",
                choices: [
                    "聞かぬは",
                    "一生の恥。",
                    "聞くは",
                    "一時の恥、"
                ],
                orderedChoices: [
                    "聞くは",
                    "一時の恥、",
                    "聞かぬは",
                    "一生の恥。"
                ],
                explanation: "『聞くは 一時の恥、聞かぬは 一生の恥。』が正しい順番です。分からないことを聞くのは一時だけですが、聞かずに知らないままでいるのは長く困るという意味です。"
            ),

            QuizQuestion.reorder(
                question: "【修飾語・並べ替え】『昨日読んだ』が『物語』をくわしくする文になるように並べましょう。",
                choices: [
                    "感想を",
                    "昨日読んだ",
                    "書きました。",
                    "物語の"
                ],
                orderedChoices: [
                    "昨日読んだ",
                    "物語の",
                    "感想を",
                    "書きました。"
                ],
                explanation: "『昨日読んだ 物語の 感想を 書きました。』が正しい順番です。『昨日読んだ』が『物語』をくわしくしています。"
            ),

            QuizQuestion.matching(
                question: "【漢字・組み合わせ】漢字と読みが合うように組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "歯", match: "は"),
                    QuizMatchingPair(prompt: "庭", match: "にわ"),
                    QuizMatchingPair(prompt: "笛", match: "ふえ"),
                    QuizMatchingPair(prompt: "羊", match: "ひつじ")
                ],
                choices: [
                    "ふえ",
                    "ひつじ",
                    "は",
                    "にわ"
                ],
                explanation: "『歯=は』『庭=にわ』『笛=ふえ』『羊=ひつじ』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【指示語・組み合わせ】指示語と、その言葉を使う場面を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "これ", match: "話し手の近くにある物"),
                    QuizMatchingPair(prompt: "それ", match: "聞き手の近くにある物"),
                    QuizMatchingPair(prompt: "あれ", match: "話し手と聞き手の両方から遠い物"),
                    QuizMatchingPair(prompt: "どれ", match: "いくつかの物からたずねるとき")
                ],
                choices: [
                    "いくつかの物からたずねるとき",
                    "聞き手の近くにある物",
                    "話し手と聞き手の両方から遠い物",
                    "話し手の近くにある物"
                ],
                explanation: "『これ=話し手の近くにある物』『それ=聞き手の近くにある物』『あれ=話し手と聞き手の両方から遠い物』『どれ=いくつかの物からたずねるとき』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【接続語・組み合わせ】接続語とはたらきが合うように組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "なぜなら", match: "理由を示す"),
                    QuizMatchingPair(prompt: "また", match: "内容を付け加える"),
                    QuizMatchingPair(prompt: "すると", match: "続いて起きたことを示す"),
                    QuizMatchingPair(prompt: "つまり", match: "前の内容をまとめて言いかえる")
                ],
                choices: [
                    "前の内容をまとめて言いかえる",
                    "続いて起きたことを示す",
                    "理由を示す",
                    "内容を付け加える"
                ],
                explanation: "『なぜなら=理由を示す』『また=内容を付け加える』『すると=続いて起きたことを示す』『つまり=前の内容をまとめて言いかえる』が正しい組み合わせです。"
            ),
            QuizQuestion(
                question: "【漢字】つぎの文の『ちゅうおう』を漢字で書いたものはどれですか。\n『野球場は町の ちゅうおう にあります。』",
                choices: [
                    "中央",
                    "中間",
                    "中心",
                    "仲間"
                ],
                correctAnswerIndex: 0,
                explanation: "『ちゅうおう』は『中央』と書きます。『野球場は町の中央にあります。』が正しい文です。"
            ),

            QuizQuestion(
                question: "【修飾語】つぎの文で、『空気』をくわしくしている言葉はどれですか。\n『わたしは 朝の 空気を 胸いっぱいに 吸いました。』",
                choices: [
                    "わたしは",
                    "胸いっぱいに",
                    "朝の",
                    "吸いました"
                ],
                correctAnswerIndex: 2,
                explanation: "『朝の』が、いつの空気なのかをくわしくしています。"
            ),

            QuizQuestion(
                question: "【指示語】つぎの文の『そこ』が指している場所はどれですか。\n『町の図書館のとなりに、小さな広場があります。そこで毎週日曜日に朝市が開かれます。』",
                choices: [
                    "町",
                    "図書館",
                    "図書館のとなり",
                    "小さな広場"
                ],
                correctAnswerIndex: 3,
                explanation: "朝市が開かれる場所は小さな広場なので、『そこ』は『小さな広場』を指しています。"
            ),

            QuizQuestion(
                question: "【接続語】前のことが原因となった結果を表す接続語を、＿＿ に入れましょう。\n『何度も音読の練習をしました。＿＿、発表では落ち着いて読むことができました。』",
                choices: [
                    "その結果",
                    "ところが",
                    "たとえば",
                    "それとも"
                ],
                correctAnswerIndex: 0,
                explanation: "練習したことによる結果を表しているので、『その結果』が入ります。"
            ),

            QuizQuestion(
                question: "【段落】つぎの文章の第2段落の中心となる内容はどれですか。\n『春になると、学校の花だんには色とりどりの花がさきます。\n\n花だんの世話は園芸委員がしています。朝の水やりや、週に一度の草取りを分担しています。』",
                choices: [
                    "花の色のちがい",
                    "園芸委員の花だんの世話",
                    "春の気温",
                    "学校の広さ"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『園芸委員の花だんの世話』です。第2段落には、水やりや草取りなど、園芸委員が行う花だんの世話について書かれています。"
            ),

            QuizQuestion(
                question: "【ことわざ】『早起きは三文の徳』の意味として正しいものはどれですか。",
                choices: [
                    "早起きすると必ずお金がもらえること",
                    "夜おそくまで起きていると得をすること",
                    "早起きをすると何かよいことがあること",
                    "朝は何もしないほうがよいこと"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『早起きをすると何かよいことがあること』です。『早起きは三文の徳』は、早起きをすると健康や時間などの面でよいことがあるという意味です。"
            ),

            QuizQuestion(
                question: "【物語文】つぎの文を読んで、最後のゆうたの気持ちとしてもっとも合うものはどれですか。\n『ゆうたは、大切に育てた朝顔の種を袋に入れ、転校する友達の机にそっと置きました。帰り道は少しさびしかったけれど、来年、二人の家で同じ花がさくところを思いうかべると、笑顔になりました。』",
                choices: [
                    "友達に種を返してほしいと怒っている",
                    "朝顔を育てたことを後悔している",
                    "友達のことを忘れて安心している",
                    "別れはさびしいが、同じ花がさくことを楽しみにしている"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『別れはさびしいが、同じ花がさくことを楽しみにしている』です。帰り道ではさびしさを感じていますが、同じ花がさくところを思いうかべて笑顔になっています。"
            ),

            QuizQuestion(
                question: "【漢字】つぎの文の『両手』の読みとして正しいものはどれですか。\n『箱を両手で持ちました。』",
                choices: [
                    "りょうて",
                    "りょて",
                    "りょうで",
                    "ふたて"
                ],
                correctAnswerIndex: 0,
                explanation: "『両手』の読みは『りょうて』です。"
            ),

            QuizQuestion(
                question: "【修飾語】つぎの文で、小鳥が飛び立ったようすを表している言葉はどれですか。\n『小鳥が 枝から 軽やかに 飛び立ちました。』",
                choices: [
                    "小鳥が",
                    "枝から",
                    "軽やかに",
                    "飛び立ちました"
                ],
                correctAnswerIndex: 2,
                explanation: "『軽やかに』が、小鳥がどのように飛び立ったのかをくわしくしています。"
            ),

            QuizQuestion(
                question: "【指示語】聞き手の手元にあるノートを指して話すとき、＿＿ に入る言葉はどれですか。\n『＿＿ ノートを見せてください。』",
                choices: [
                    "あの",
                    "どの",
                    "この",
                    "その"
                ],
                correctAnswerIndex: 3,
                explanation: "聞き手の近くにあるノートを指すので、『そのノート』と言います。"
            ),

            QuizQuestion.fillInBlank(
                question: "【接続語】二つのうち、どちらかをたずねるときに使う、『それ』で始まる接続語を答えましょう。\n『昼食はパンにしますか。＿＿、おにぎりにしますか。』",
                answer: "それとも",
                explanation: "二つのうち、どちらかをたずねるときは『それとも』を使います。"
            ),

            QuizQuestion.fillInBlank(
                question: "【段落】つぎの文の ＿＿ に入る言葉を答えましょう。\n『段落を変えるときに、行を変えて書くことを ＿＿ といいます。』",
                answer: "改行",
                acceptableAnswers: ["かいぎょう"],
                explanation: "段落を変えるときなどに、行を変えて書くことを『改行』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【ことわざ】つぎのことわざの ＿＿ に入る言葉を答えましょう。\n『二度あることは ＿＿ ある』",
                answer: "三度",
                acceptableAnswers: ["さんど", "3度"],
                explanation: "ことわざは『二度あることは三度ある』です。同じようなことは、くり返し起こることがあるという意味です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【漢字】つぎの文の『ひろ』に当てはまる漢字一字を答えましょう。\n『校庭で木の実を ひろいました。』",
                answer: "拾",
                explanation: "『ひろいました』は『拾いました』と書くので、当てはまる漢字は『拾』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【物語文】つぎの文の ＿＿ に入る言葉を答えましょう。\n『物語の中で、出来事が起こる場所や時のまとまりを ＿＿ といいます。』",
                answer: "場面",
                acceptableAnswers: ["ばめん"],
                explanation: "物語の場所や時などによって分けられるまとまりを『場面』といいます。"
            ),

            QuizQuestion.extractText(
                question: "【修飾語・抜き出し】つぎの文を読み、船がどのように汽笛を鳴らしたのかが分かる言葉を、そのまま抜き出しましょう。\n『港に着いた船が、長い汽笛を高らかに鳴らしました。』",
                answer: "高らかに",
                explanation: "『高らかに』が、船がどのように汽笛を鳴らしたのかをくわしくしています。"
            ),

            QuizQuestion.extractText(
                question: "【指示語・抜き出し】つぎの文を読み、『その音』が指している言葉をそのまま抜き出しましょう。\n『教室の後ろで紙が落ちる音がしました。みんながその音の方を見ました。』",
                answer: "紙が落ちる音",
                explanation: "『その音』は、前に出てきた『紙が落ちる音』を指しています。"
            ),

            QuizQuestion.extractText(
                question: "【段落・抜き出し】つぎの文章を読み、第2段落の中心となる一文をそのまま抜き出しましょう。\n『わたしは家で金魚を飼っています。赤い金魚と白い金魚が一匹ずついます。\n\n金魚の世話でいちばん大切なのは、水をきれいに保つことです。そのため、よごれを見つけたら水を少しずつ取りかえています。』",
                answer: "金魚の世話でいちばん大切なのは、水をきれいに保つことです。",
                explanation: "第2段落では金魚の水をきれいに保つことを説明しているので、中心となる一文は『金魚の世話でいちばん大切なのは、水をきれいに保つことです。』です。"
            ),

            QuizQuestion.extractText(
                question: "【物語文・抜き出し】つぎの文を読み、みおが話し始めるきっかけになった出来事を、そのまま抜き出しましょう。\n『発表の前、みおは手がふるえていました。顔を上げると、友達が笑顔でうなずくのが見えました。みおは背すじを伸ばし、はっきりした声で話し始めました。』",
                answer: "友達が笑顔でうなずくのが見えました。",
                explanation: "友達が笑顔でうなずくのを見たあとに、みおは背すじを伸ばして話し始めています。きっかけは『友達が笑顔でうなずくのが見えました。』です。"
            ),

            QuizQuestion.reorder(
                question: "【接続語・並べ替え】花の種をまく手順が自然につながるように並べましょう。",
                choices: [
                    "そして、土をうすくかぶせます。",
                    "最後に、じょうろで水をやります。",
                    "まず、土に小さな穴をあけます。",
                    "次に、穴へ種を入れます。"
                ],
                orderedChoices: [
                    "まず、土に小さな穴をあけます。",
                    "次に、穴へ種を入れます。",
                    "そして、土をうすくかぶせます。",
                    "最後に、じょうろで水をやります。"
                ],
                explanation: "『まず、土に小さな穴をあけます。次に、穴へ種を入れます。そして、土をうすくかぶせます。最後に、じょうろで水をやります。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【段落・並べ替え】図書室のよさを説明する一つの段落になるように並べましょう。",
                choices: [
                    "また、静かな場所で集中して読めます。",
                    "このように、図書室にはよいところがたくさんあります。",
                    "わたしは学校の図書室が好きです。",
                    "まず、読みたい本を自由に選べます。"
                ],
                orderedChoices: [
                    "わたしは学校の図書室が好きです。",
                    "まず、読みたい本を自由に選べます。",
                    "また、静かな場所で集中して読めます。",
                    "このように、図書室にはよいところがたくさんあります。"
                ],
                explanation: "はじめに考えを示し、『まず』『また』で理由を続け、最後に『このように』でまとめる順番が自然です。"
            ),

            QuizQuestion.reorder(
                question: "【ことわざ・並べ替え】明るく笑いのある家には幸せがやって来るということわざになるように並べましょう。",
                choices: [
                    "門には",
                    "来る。",
                    "笑う",
                    "福"
                ],
                orderedChoices: [
                    "笑う",
                    "門には",
                    "福",
                    "来る。"
                ],
                explanation: "『笑う門には福来る。』が正しい順番です。いつも明るく笑っている家には、自然と幸せがやって来るという意味です。"
            ),

            QuizQuestion.reorder(
                question: "【修飾語・並べ替え】『妹は』で始め、『絵にかきました。』で終わり、『庭に咲いた』が『赤い花』をくわしくする文になるように並べましょう。",
                choices: [
                    "赤い花を",
                    "絵にかきました。",
                    "庭に咲いた",
                    "妹は"
                ],
                orderedChoices: [
                    "妹は",
                    "庭に咲いた",
                    "赤い花を",
                    "絵にかきました。"
                ],
                explanation: "『妹は 庭に咲いた 赤い花を 絵にかきました。』が正しい順番です。『庭に咲いた』が『赤い花』をくわしくしています。"
            ),

            QuizQuestion.matching(
                question: "【漢字・組み合わせ】漢字の言葉と読みが合うように組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "反対", match: "はんたい"),
                    QuizMatchingPair(prompt: "坂道", match: "さかみち"),
                    QuizMatchingPair(prompt: "整列", match: "せいれつ"),
                    QuizMatchingPair(prompt: "役目", match: "やくめ")
                ],
                choices: [
                    "やくめ",
                    "せいれつ",
                    "はんたい",
                    "さかみち"
                ],
                explanation: "『反対=はんたい』『坂道=さかみち』『整列=せいれつ』『役目=やくめ』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【指示語・組み合わせ】場所を表す指示語と、その使い方を組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ここ", match: "話し手の近くの場所"),
                    QuizMatchingPair(prompt: "そこ", match: "聞き手の近くの場所"),
                    QuizMatchingPair(prompt: "あそこ", match: "話し手と聞き手の両方から遠い場所"),
                    QuizMatchingPair(prompt: "どこ", match: "場所をたずねる言葉")
                ],
                choices: [
                    "場所をたずねる言葉",
                    "話し手と聞き手の両方から遠い場所",
                    "話し手の近くの場所",
                    "聞き手の近くの場所"
                ],
                explanation: "『ここ=話し手の近くの場所』『そこ=聞き手の近くの場所』『あそこ=話し手と聞き手の両方から遠い場所』『どこ=場所をたずねる言葉』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【接続語・組み合わせ】接続語とはたらきが合うように組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "ところが", match: "予想とちがう結果を続ける"),
                    QuizMatchingPair(prompt: "そのうえ", match: "内容をさらに付け加える"),
                    QuizMatchingPair(prompt: "そこで", match: "前の事柄を受けた行動を続ける"),
                    QuizMatchingPair(prompt: "または", match: "どちらか一方を示す")
                ],
                choices: [
                    "どちらか一方を示す",
                    "前の事柄を受けた行動を続ける",
                    "内容をさらに付け加える",
                    "予想とちがう結果を続ける"
                ],
                explanation: "『ところが=予想とちがう結果を続ける』『そのうえ=内容をさらに付け加える』『そこで=前の事柄を受けた行動を続ける』『または=どちらか一方を示す』が正しい組み合わせです。"
            ),
            QuizQuestion(
                question: "【漢字】つぎの文の『岸』の読みとして正しいものはどれですか。\n『川の岸に黄色い花がさいています。』",
                choices: [
                    "きし",
                    "がん",
                    "きじ",
                    "かわ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『きし』です。『岸』は『きし』と読みます。"
            ),

            QuizQuestion(
                question: "【修飾語】つぎの文で、子ねこがどのように眠っているかを表す言葉はどれですか。\n『子ねこが 毛布の上で しずかに 眠っています。』",
                choices: [
                    "子ねこが",
                    "毛布の上で",
                    "しずかに",
                    "眠っています"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『しずかに』です。子ねこがどのように眠っているのかをくわしくしています。"
            ),

            QuizQuestion(
                question: "【指示語】つぎの文の『そこ』が指している場所はどれですか。\n『わたしたちは駅前の広場に集まりました。そこからバスに乗りました。』",
                choices: [
                    "駅の中",
                    "バスの中",
                    "駅のホーム",
                    "駅前の広場"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『駅前の広場』です。『そこ』は、バスに乗る前に集まった場所を指しています。"
            ),

            QuizQuestion(
                question: "【接続語】つぎの文の ＿＿ に入る接続語はどれですか。\n『目覚まし時計が鳴りませんでした。＿＿、朝ねぼうをしてしまいました。』",
                choices: [
                    "それで",
                    "ところが",
                    "または",
                    "たとえば"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『それで』です。目覚まし時計が鳴らなかったことが原因で、朝ねぼうをしたことをつないでいます。"
            ),

            QuizQuestion(
                question: "【段落】つぎの段落の中心となる内容はどれですか。\n『学校の屋上には百葉箱があります。中には温度計があり、毎日、係の人が決まった時刻に気温を調べています。』",
                choices: [
                    "学校の屋上から見える景色",
                    "百葉箱を使った気温の観察",
                    "温度計の作り方",
                    "係の人の服そう"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『百葉箱を使った気温の観察』です。この段落には、百葉箱の温度計を使って毎日気温を調べることが書かれています。"
            ),

            QuizQuestion(
                question: "【ことわざ】『ちりも積もれば山となる』の意味として正しいものはどれですか。",
                choices: [
                    "山ではごみを拾わなければならないこと",
                    "小さなことは気にしなくてよいこと",
                    "小さなものでも積み重なると大きなものになること",
                    "高い山にはたくさんの土があること"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『小さなものでも積み重なると大きなものになること』です。わずかな努力や物でも、積み重ねると大きな結果につながるという意味です。"
            ),

            QuizQuestion(
                question: "【物語文】つぎの文を読んで、最後のりんの気持ちとしてもっとも合うものはどれですか。\n『りんは、図工で作ったかざりを家へ持ち帰る途中、風で一部をこわしてしまいました。家で時間をかけて直し、次の日に先生から「前よりじょうぶになったね。」と言われると、りんは作品を胸の前にかかえてうなずきました。』",
                choices: [
                    "作品を作ったことを後悔している",
                    "先生に見つからず安心している",
                    "作品をすてたいと思っている",
                    "自分で直せたことをほこらしく思っている"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『自分で直せたことをほこらしく思っている』です。時間をかけて直した作品を先生にほめられ、胸の前にかかえてうなずいていることから分かります。"
            ),

            QuizQuestion(
                question: "【漢字】つぎの文の『筆』の読みとして正しいものはどれですか。\n『大きな紙に筆で文字を書きました。』",
                choices: [
                    "ふで",
                    "ふて",
                    "ひつ",
                    "ふみ"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『ふで』です。『筆』は『ふで』と読みます。"
            ),

            QuizQuestion(
                question: "【修飾語】つぎの文で、『山』をくわしくしている言葉はどれですか。\n『わたしたちは 遠い 山を 校庭から 見上げました。』",
                choices: [
                    "わたしたちは",
                    "校庭から",
                    "遠い",
                    "見上げました"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『遠い』です。どのような山なのかをくわしくしています。"
            ),

            QuizQuestion(
                question: "【指示語】つぎの文の『これ』が指しているものはどれですか。\n『昨日、青いかさを買いました。これは、開くと星のもようが見えます。』",
                choices: [
                    "昨日という日",
                    "星のもよう",
                    "かさを開くこと",
                    "青いかさ"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『青いかさ』です。開くと星のもようが見えるものは、前の文にある『青いかさ』なので、『これ』はそれを指しています。"
            ),

            QuizQuestion.fillInBlank(
                question: "【接続語】つぎの文の ＿＿ に入る、『一』で始まる接続語を答えましょう。\n『兄は家で本を読むのが好きです。＿＿、弟は外で遊ぶのが好きです。』",
                answer: "一方",
                acceptableAnswers: ["いっぽう"],
                explanation: "兄と弟のちがう好みをくらべているので、『一方』が入ります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【段落】つぎの文の ＿＿ に入る言葉を答えましょう。\n『段落の中で、いちばん伝えたいことが書かれた文を ＿＿ といいます。』",
                answer: "中心文",
                acceptableAnswers: ["ちゅうしんぶん"],
                explanation: "段落の中で、いちばん伝えたいことが書かれた文を『中心文』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【ことわざ】つぎのことわざの ＿＿ に入る漢字一字を答えましょう。\n『雨降って ＿＿ 固まる』",
                answer: "地",
                acceptableAnswers: ["ち"],
                explanation: "ことわざは『雨降って地固まる』です。もめごとなどがあったあと、かえって前よりよい関係になることを表します。"
            ),

            QuizQuestion.fillInBlank(
                question: "【漢字】つぎの文の『むかし』に当てはまる漢字を答えましょう。\n『むかし、この近くには大きな森がありました。』",
                answer: "昔",
                explanation: "『むかし』は『昔』と書きます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【物語文】つぎの文の ＿＿ に入る言葉を答えましょう。\n『物語に出てきて、行動したり話したりする人や動物を ＿＿ といいます。』",
                answer: "登場人物",
                acceptableAnswers: ["とうじょうじんぶつ"],
                explanation: "物語に出てきて、行動したり話したりする人や動物を『登場人物』といいます。"
            ),

            QuizQuestion.extractText(
                question: "【修飾語・抜き出し】つぎの文を読み、『虹』をくわしくしている言葉をそのまま抜き出しましょう。\n『雨上がりの空に、七色の虹が大きくかかりました。』",
                answer: "七色の",
                explanation: "『七色の』が、どのような虹なのかをくわしくしています。"
            ),

            QuizQuestion.extractText(
                question: "【指示語・抜き出し】つぎの文を読み、『それ』が指している言葉をそのまま抜き出しましょう。\n『祖母から運動会の写真が届きました。それには、わたしが走っているところも写っていました。』",
                answer: "運動会の写真",
                explanation: "『それ』は、前の文に出てきた『運動会の写真』を指しています。"
            ),

            QuizQuestion.extractText(
                question: "【段落・抜き出し】つぎの段落を読み、段落全体の話題を示している、はじめの一文をそのまま抜き出しましょう。\n『わたしの家では、毎週土曜日に家族全員でそうじをします。父はおふろ、母は台所、わたしと弟は自分たちの部屋を受け持ちます。みんなで分担すると、短い時間で家中がきれいになります。』",
                answer: "わたしの家では、毎週土曜日に家族全員でそうじをします。",
                explanation: "あとの二文は、家族全員でそうじをすることの具体的な分担やよさを説明しています。段落全体の話題を示す、はじめの一文は『わたしの家では、毎週土曜日に家族全員でそうじをします。』です。"
            ),

            QuizQuestion.extractText(
                question: "【物語文・抜き出し】つぎの文を読み、跳び箱を跳べたあとのけんの自信が分かる会話の内容を抜き出しましょう。\n『けんは跳び箱が苦手でした。放課後に何度も練習し、とうとう四段を跳べると、先生に向かって「次はもっと高い段にも挑戦したい。」と言いました。』",
                answer: "次はもっと高い段にも挑戦したい。",
                explanation: "四段を跳べたあとに『次はもっと高い段にも挑戦したい。』と言っていることから、けんが自信を持ったことが分かります。"
            ),

            QuizQuestion.reorder(
                question: "【接続語・並べ替え】出来事が自然につながるように並べましょう。",
                choices: [
                    "そこで、先生は窓を閉めました。",
                    "強い風が教室に入ってきました。",
                    "すると、机の上の紙が床に散らばりました。",
                    "休み時間に窓を開けました。"
                ],
                orderedChoices: [
                    "休み時間に窓を開けました。",
                    "強い風が教室に入ってきました。",
                    "すると、机の上の紙が床に散らばりました。",
                    "そこで、先生は窓を閉めました。"
                ],
                explanation: "『休み時間に窓を開けました。強い風が教室に入ってきました。すると、机の上の紙が床に散らばりました。そこで、先生は窓を閉めました。』が自然な順番です。"
            ),

            QuizQuestion.reorder(
                question: "【段落・並べ替え】給食当番について説明する一つの段落になるように並べましょう。",
                choices: [
                    "また、食器を数えて配ります。",
                    "このように、給食当番には大切な仕事があります。",
                    "給食当番は、みんなの昼食を用意します。",
                    "まず、手を洗って白衣を着ます。"
                ],
                orderedChoices: [
                    "給食当番は、みんなの昼食を用意します。",
                    "まず、手を洗って白衣を着ます。",
                    "また、食器を数えて配ります。",
                    "このように、給食当番には大切な仕事があります。"
                ],
                explanation: "『給食当番は、みんなの昼食を用意します。まず、手を洗って白衣を着ます。また、食器を数えて配ります。このように、給食当番には大切な仕事があります。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【ことわざ・並べ替え】好きなことには熱心に取り組むので、上達しやすいということわざになるように並べましょう。",
                choices: [
                    "上手",
                    "好きこそ",
                    "なれ。",
                    "物の"
                ],
                orderedChoices: [
                    "好きこそ",
                    "物の",
                    "上手",
                    "なれ。"
                ],
                explanation: "『好きこそ物の上手なれ。』が正しい順番です。好きなことには熱心に取り組むため、上達しやすいという意味です。"
            ),

            QuizQuestion.reorder(
                question: "【修飾語・並べ替え】『図書館で借りた』が『動物の本』をくわしくする文になるように並べましょう。",
                choices: [
                    "弟に",
                    "わたしは図書館で借りた",
                    "読んであげました。",
                    "動物の本を"
                ],
                orderedChoices: [
                    "わたしは図書館で借りた",
                    "動物の本を",
                    "弟に",
                    "読んであげました。"
                ],
                explanation: "『わたしは図書館で借りた 動物の本を 弟に 読んであげました。』が正しい順番です。『図書館で借りた』が『動物の本』をくわしくしています。"
            ),

            QuizQuestion.matching(
                question: "【漢字・組み合わせ】それぞれの漢字に、正しい読みをつなぎましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "君", match: "きみ"),
                    QuizMatchingPair(prompt: "炭", match: "すみ"),
                    QuizMatchingPair(prompt: "柱", match: "はしら"),
                    QuizMatchingPair(prompt: "秒", match: "びょう")
                ],
                choices: [
                    "はしら",
                    "びょう",
                    "きみ",
                    "すみ"
                ],
                explanation: "『君=きみ』『炭=すみ』『柱=はしら』『秒=びょう』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【指示語・組み合わせ】方向や場所を表す言葉を、正しい説明につなぎましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "こちら", match: "話し手に近い方向や場所を指す"),
                    QuizMatchingPair(prompt: "そちら", match: "聞き手に近い方向や場所を指す"),
                    QuizMatchingPair(prompt: "あちら", match: "話し手と聞き手の両方から遠い方向や場所を指す"),
                    QuizMatchingPair(prompt: "どちら", match: "方向や場所をたずねる")
                ],
                choices: [
                    "方向や場所をたずねる",
                    "聞き手に近い方向や場所を指す",
                    "話し手と聞き手の両方から遠い方向や場所を指す",
                    "話し手に近い方向や場所を指す"
                ],
                explanation: "『こちら=話し手に近い方向や場所を指す』『そちら=聞き手に近い方向や場所を指す』『あちら=話し手と聞き手の両方から遠い方向や場所を指す』『どちら=方向や場所をたずねる』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【接続語・組み合わせ】文と文をつなぐ言葉を、それぞれのはたらきにつなぎましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "けれども", match: "前と反対の内容を続ける"),
                    QuizMatchingPair(prompt: "さらに", match: "内容をもう一つ付け加える"),
                    QuizMatchingPair(prompt: "それでは", match: "次の話や行動へ移る"),
                    QuizMatchingPair(prompt: "このように", match: "前の内容をまとめる")
                ],
                choices: [
                    "前の内容をまとめる",
                    "次の話や行動へ移る",
                    "前と反対の内容を続ける",
                    "内容をもう一つ付け加える"
                ],
                explanation: "『けれども=前と反対の内容を続ける』『さらに=内容をもう一つ付け加える』『それでは=次の話や行動へ移る』『このように=前の内容をまとめる』が正しい組み合わせです。"
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
            quizLevel: .kokugo3,
            authManager: authManager,
            audioManager: audioManager,
            isPresenting: $isPresenting,
            interstitial: sharedInterstitial
        )
    }
}

struct Kokugo3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo3ListView(isPresenting: .constant(false))
    }
}
