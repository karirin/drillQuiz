//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo5ListView: View {
    @Binding var isPresenting: Bool

    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『相手に名誉をゆずることを、花を ＿＿ という。』",
            answer: "もたせる",
            acceptableAnswers: ["持たせる"],
            explanation: "『花を持たせる』は、相手に栄誉をゆずるという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『相手の話を しっかり聞くことを、耳を ＿＿ という。』",
            answer: "傾ける",
            acceptableAnswers: ["かたむける"],
            explanation: "『耳を傾ける』は、注意してよく聞くことを表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『失敗は ＿＿。』",
            answer: "成功のもと",
            acceptableAnswers: ["成功の元", "せいこうのもと"],
            explanation: "『失敗は成功のもと』は、失敗を次に生かせばよいという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『説明文で、文章全体の 中心になる内容を ＿＿ といいます。』",
            answer: "要旨",
            acceptableAnswers: ["ようし"],
            explanation: "文章全体の中心になる内容を『要旨』といいます。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、さくらの気持ちを表す言葉を そのまま ぬき出しましょう。\n『発表が終わったあと、さくらは大きく息をはいて安心した。』",
            answer: "安心した",
            acceptableAnswers: ["安心", "あんしん", "あんしんした"],
            explanation: "さくらの気持ちを表す言葉は『安心した』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、りなが メモしたものを そのまま ぬき出しましょう。\n『りなは 深く うなずきながら、相手の意見の よいところを メモした。』",
            answer: "相手の意見の よいところ",
            acceptableAnswers: ["相手の意見のよいところ", "あいてのいけんのよいところ"],
            explanation: "りながメモしたものは『相手の意見の よいところ』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者が のべている場所が分かることばを そのまま ぬき出しましょう。\n『筆者は 最後の段落で、読者への 問いかけを のべている。』",
            answer: "最後の段落で",
            acceptableAnswers: ["最後の 段落で", "さいごのだんらくで"],
            explanation: "筆者がのべている場所が分かることばは『最後の段落で』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、読み比べて 分かったことを そのまま ぬき出しましょう。\n『資料を 読み比べると、それぞれの ちがいが はっきり見えてきた。』",
            answer: "それぞれの ちがい",
            acceptableAnswers: ["それぞれのちがい"],
            explanation: "読み比べて分かったことは『それぞれの ちがい』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["まとめた", "資料を読んでから", "自分の考えを", "筆者は"],
            orderedChoices: ["筆者は", "資料を読んでから", "自分の考えを", "まとめた"],
            explanation: "『筆者は 資料を読んでから 自分の考えを まとめた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["深めていった", "筆者は", "自分の考えを", "二つの 資料を 比べて"],
            orderedChoices: ["筆者は", "二つの 資料を 比べて", "自分の考えを", "深めていった"],
            explanation: "『筆者は 二つの 資料を 比べて 自分の考えを 深めていった。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["よく 分かる", "相手の立場を 考えると", "ちがう意見も"],
            orderedChoices: ["相手の立場を 考えると", "ちがう意見も", "よく 分かる"],
            explanation: "『相手の立場を 考えると ちがう意見も よく 分かる。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["まとめた", "図や表を使って", "調べたことを", "わかりやすく"],
            orderedChoices: ["調べたことを", "図や表を使って", "わかりやすく", "まとめた"],
            explanation: "『調べたことを 図や表を使って わかりやすく まとめた。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】慣用句と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "気を配る", match: "注意を払う"),
                QuizMatchingPair(prompt: "頭を冷やす", match: "落ち着く"),
                QuizMatchingPair(prompt: "足が棒になる", match: "足が疲れて動きにくい")
            ],
            choices: ["足が疲れて動きにくい", "落ち着く", "注意を払う"],
            explanation: "『気を配る=注意を払う』『頭を冷やす=落ち着く』『足が棒になる=足が疲れて動きにくい』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "要旨", match: "文章全体の 中心になる内容"),
                QuizMatchingPair(prompt: "引用", match: "文を そのまま 使うこと"),
                QuizMatchingPair(prompt: "資料", match: "調べるための 情報")
            ],
            choices: ["文を そのまま 使うこと", "調べるための 情報", "文章全体の 中心になる内容"],
            explanation: "説明文でよく使う国語のことばを確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】つなぎ言葉と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "つまり", match: "言いかえる"),
                QuizMatchingPair(prompt: "一方", match: "くらべる"),
                QuizMatchingPair(prompt: "そのため", match: "理由からの 結果をいう")
            ],
            choices: ["くらべる", "理由からの 結果をいう", "言いかえる"],
            explanation: "つなぎ言葉のはたらきが分かると、文章の流れがつかみやすくなります。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】敬語と 元の言い方が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "いらっしゃる", match: "来る・行く・いる"),
                QuizMatchingPair(prompt: "いただく", match: "もらう"),
                QuizMatchingPair(prompt: "申す", match: "言う")
            ],
            choices: ["言う", "来る・行く・いる", "もらう"],
            explanation: "敬語がどの言い方にあたるかを確かめましょう。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『百聞は ＿＿ にしかず。』",
            answer: "一見",
            acceptableAnswers: ["いっけん"],
            explanation: "『百聞は一見にしかず』は、何度も聞くより一度見るほうがよく分かるという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『文章の内容を 短くまとめたものを ＿＿ といいます。』",
            answer: "要約",
            acceptableAnswers: ["ようやく"],
            explanation: "文章の内容を短くまとめたものを『要約』といいます。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者が 線で囲んだものを そのまま ぬき出しましょう。\n『筆者は 二つの資料を 比べて、共通する点を 線で囲んだ。』",
            answer: "共通する点",
            acceptableAnswers: ["共通する 点", "きょうつうするてん"],
            explanation: "筆者が線で囲んだものは『共通する点』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、けんたが 気づいたことを そのまま ぬき出しましょう。\n『話し合いのあと、けんたは 相手の意見にも よさがあると 気づいた。』",
            answer: "相手の意見にも よさがある",
            acceptableAnswers: ["相手の意見にもよさがある", "あいてのいけんにもよさがある"],
            explanation: "けんたが気づいたことは『相手の意見にも よさがある』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["質問を", "するとよい", "相手の話を", "最後まで聞いてから"],
            orderedChoices: ["相手の話を", "最後まで聞いてから", "質問を", "するとよい"],
            explanation: "『相手の話を 最後まで聞いてから 質問を するとよい。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["はっきりする", "資料のちがいを", "筆者の考えが", "比べると"],
            orderedChoices: ["資料のちがいを", "比べると", "筆者の考えが", "はっきりする"],
            explanation: "『資料のちがいを 比べると 筆者の考えが はっきりする。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】敬語と 元の言い方が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "拝見する", match: "見る"),
                QuizMatchingPair(prompt: "うかがう", match: "行く・聞く"),
                QuizMatchingPair(prompt: "くださる", match: "くれる")
            ],
            choices: ["くれる", "見る", "行く・聞く"],
            explanation: "『拝見する=見る』『うかがう=行く・聞く』『くださる=くれる』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "要約", match: "大事なところを 短くまとめること"),
                QuizMatchingPair(prompt: "事実", match: "本当に あったこと"),
                QuizMatchingPair(prompt: "意見", match: "自分の考え")
            ],
            choices: ["自分の考え", "本当に あったこと", "大事なところを 短くまとめること"],
            explanation: "説明文や意見文で使うことばを確かめましょう。"
        ),

        // --- 追加問題 (56問) ---

        // 漢字の読み (1〜12)
        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『批判』",
            answer: "ひはん",
            explanation: "『批判』の読みは『ひはん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『推薦』",
            answer: "すいせん",
            explanation: "『推薦』の読みは『すいせん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『貢献』",
            answer: "こうけん",
            explanation: "『貢献』の読みは『こうけん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『環境』",
            answer: "かんきょう",
            explanation: "『環境』の読みは『かんきょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『可能』",
            answer: "かのう",
            explanation: "『可能』の読みは『かのう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『判断』",
            answer: "はんだん",
            explanation: "『判断』の読みは『はんだん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『議論』",
            answer: "ぎろん",
            explanation: "『議論』の読みは『ぎろん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『展開』",
            answer: "てんかい",
            explanation: "『展開』の読みは『てんかい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『確認』",
            answer: "かくにん",
            explanation: "『確認』の読みは『かくにん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『提案』",
            answer: "ていあん",
            explanation: "『提案』の読みは『ていあん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『発揮』",
            answer: "はっき",
            explanation: "『発揮』の読みは『はっき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『比較』",
            answer: "ひかく",
            explanation: "『比較』の読みは『ひかく』です。"
        ),

        // 穴埋め (13〜20)
        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『好きこそ ＿＿。』",
            answer: "物の上手なれ",
            acceptableAnswers: ["ものの上手なれ", "ものの じょうずなれ"],
            explanation: "『好きこそ物の上手なれ』は、好きなことは上手になるという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『虎穴に入らずんば ＿＿。』",
            answer: "虎子を得ず",
            acceptableAnswers: ["とらこをえず", "とらごをえず"],
            explanation: "『虎穴に入らずんば虎子を得ず』は、危険を犯さなければ大きな成果は得られないという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『とても忙しいことを、手が ＿＿ という。』",
            answer: "離せない",
            acceptableAnswers: ["はなせない", "手が離せない"],
            explanation: "とても忙しくて別のことができないことを『手が離せない』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『我慢の限界が来ることを、堪忍袋の ＿＿ が切れる という。』",
            answer: "緒",
            acceptableAnswers: ["お"],
            explanation: "我慢の限界が来ることを『堪忍袋の緒が切れる』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】敬語を答えましょう。\n『「食べる」の尊敬語は ＿＿ です。』",
            answer: "召し上がる",
            acceptableAnswers: ["めしあがる"],
            explanation: "『食べる』の尊敬語は『召し上がる（めしあがる）』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】敬語を答えましょう。\n『「見る」の謙譲語は ＿＿ です。』",
            answer: "拝見する",
            acceptableAnswers: ["はいけんする"],
            explanation: "『見る』の謙譲語は『拝見する（はいけんする）』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『説明文で、筆者が最も伝えたい考えを ＿＿ といいます。』",
            answer: "要旨",
            acceptableAnswers: ["ようし"],
            explanation: "筆者が最も伝えたい考えを『要旨（ようし）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『他の人の文をそのまま使うことを ＿＿ といいます。』",
            answer: "引用",
            acceptableAnswers: ["いんよう"],
            explanation: "他の人の文をそのまま使うことを『引用（いんよう）』といいます。"
        ),

        // 抜き出し (21〜26)
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ともこさんが語ったことを そのまま ぬき出しましょう。\n『ともこさんは 読書を通して、今まで 知らなかった 多くのことを 学んだと 語った。』",
            answer: "今まで 知らなかった 多くのことを 学んだ",
            acceptableAnswers: ["今まで知らなかった多くのことを学んだ"],
            explanation: "ともこさんが語ったことは『今まで 知らなかった 多くのことを 学んだ』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者が問いかけた内容を そのまま ぬき出しましょう。\n『筆者は この本の 最初の 段落で、現代の 環境問題について 問いかけている。』",
            answer: "現代の 環境問題",
            acceptableAnswers: ["現代の環境問題", "かんきょうもんだい"],
            explanation: "筆者が問いかけた内容は『現代の 環境問題』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、はるとが練習した理由を そのまま ぬき出しましょう。\n『はるとは 発表の前に、相手に伝わりやすいように 何度も 声に 出して 練習した。』",
            answer: "相手に伝わりやすいように",
            acceptableAnswers: [],
            explanation: "はるとが練習した理由は『相手に伝わりやすいように』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、二つの資料に共通することを そのまま ぬき出しましょう。\n『二つの資料を 読み比べると、どちらも 環境保護の 大切さを 訴えていることが 分かった。』",
            answer: "環境保護の 大切さを 訴えている",
            acceptableAnswers: ["環境保護の大切さを訴えている", "かんきょうほごのたいせつさ"],
            explanation: "二つに共通することは『環境保護の 大切さを 訴えている』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、先生が大切だと言ったことを そのまま ぬき出しましょう。\n『先生は 話し合いの 進め方について、まず 司会者を 決めることが 大切だと 言った。』",
            answer: "司会者を 決めること",
            acceptableAnswers: ["司会者を決めること", "しかいしゃをきめること"],
            explanation: "先生が大切だと言ったことは『司会者を 決めること』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、彼女が大きく成長できた理由を そのまま ぬき出しましょう。\n『彼女は つらい 経験を バネにして、努力を 続けた 結果、大きく 成長した。』",
            answer: "つらい 経験を バネにして、努力を 続けた",
            acceptableAnswers: ["つらい経験をバネにして努力を続けた", "努力を続けた"],
            explanation: "彼女が大きく成長できた理由は『つらい 経験を バネにして、努力を 続けた』です。"
        ),

        // 並べ替え (27〜32)
        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["考えた", "自分なりの意見を", "資料を 十分に読んでから", "くわしく", "筆者は"],
            orderedChoices: ["筆者は", "資料を 十分に読んでから", "くわしく", "自分なりの意見を", "考えた"],
            explanation: "『筆者は 資料を 十分に読んでから くわしく 自分なりの意見を 考えた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["つながります", "豊かな人間関係が", "相手を尊重することで", "だれとでも"],
            orderedChoices: ["相手を尊重することで", "だれとでも", "豊かな人間関係が", "つながります"],
            explanation: "『相手を尊重することで だれとでも 豊かな人間関係が つながります。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["まとめることが大切だ", "調べた事実と", "しっかり区別して", "自分の考えを"],
            orderedChoices: ["調べた事実と", "自分の考えを", "しっかり区別して", "まとめることが大切だ"],
            explanation: "『調べた事実と 自分の考えを しっかり区別して まとめることが大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["気づいた", "ちがう立場から見ると", "しかし", "新しいことに", "一方"],
            orderedChoices: ["しかし", "一方", "ちがう立場から見ると", "新しいことに", "気づいた"],
            explanation: "『しかし 一方 ちがう立場から見ると 新しいことに 気づいた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["まとめることができた", "みんなで話し合って", "意見を出し合い", "よりよい考えに"],
            orderedChoices: ["みんなで話し合って", "意見を出し合い", "よりよい考えに", "まとめることができた"],
            explanation: "『みんなで話し合って 意見を出し合い よりよい考えに まとめることができた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["なれる", "積み重ねることで", "少しずつ", "よりよい自分に", "経験を"],
            orderedChoices: ["経験を", "少しずつ", "積み重ねることで", "よりよい自分に", "なれる"],
            explanation: "『経験を 少しずつ 積み重ねることで よりよい自分に なれる。』が正しい順番です。"
        ),

        // 組み合わせ (33〜37)
        QuizQuestion.matching(
            question: "【組み合わせ】敬語と 元の言い方が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "おっしゃる", match: "言う"),
                QuizMatchingPair(prompt: "ご覧になる", match: "見る"),
                QuizMatchingPair(prompt: "なさる", match: "する")
            ],
            choices: ["する", "言う", "見る"],
            explanation: "『おっしゃる=言う』『ご覧になる=見る』『なさる=する』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことわざと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "好きこそ物の上手なれ", match: "好きなことは上手になる"),
                QuizMatchingPair(prompt: "石の上にも三年", match: "辛抱すれば成果が出る"),
                QuizMatchingPair(prompt: "失敗は成功のもと", match: "失敗を生かすとよい")
            ],
            choices: ["失敗を生かすとよい", "好きなことは上手になる", "辛抱すれば成果が出る"],
            explanation: "ことわざの意味を正しく結びつけましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】慣用句と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "耳を傾ける", match: "注意して聞く"),
                QuizMatchingPair(prompt: "手を貸す", match: "助ける"),
                QuizMatchingPair(prompt: "目を向ける", match: "注目する")
            ],
            choices: ["注目する", "注意して聞く", "助ける"],
            explanation: "慣用句の意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語のことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "要旨", match: "筆者が最も伝えたいこと"),
                QuizMatchingPair(prompt: "引用", match: "他の文をそのまま使うこと"),
                QuizMatchingPair(prompt: "要約", match: "大切なところをまとめること")
            ],
            choices: ["大切なところをまとめること", "他の文をそのまま使うこと", "筆者が最も伝えたいこと"],
            explanation: "国語のことばの意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】接続語と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "一方", match: "比べていう"),
                QuizMatchingPair(prompt: "なぜなら", match: "理由をいう"),
                QuizMatchingPair(prompt: "したがって", match: "結論をいう")
            ],
            choices: ["結論をいう", "比べていう", "理由をいう"],
            explanation: "接続語のはたらきを確かめましょう。"
        ),

        // さらに漢字読み (38〜43)
        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『主張』",
            answer: "しゅちょう",
            explanation: "『主張』の読みは『しゅちょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『情報』",
            answer: "じょうほう",
            explanation: "『情報』の読みは『じょうほう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『解決』",
            answer: "かいけつ",
            explanation: "『解決』の読みは『かいけつ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『対話』",
            answer: "たいわ",
            explanation: "『対話』の読みは『たいわ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『知識』",
            answer: "ちしき",
            explanation: "『知識』の読みは『ちしき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『表現』",
            answer: "ひょうげん",
            explanation: "『表現』の読みは『ひょうげん』です。"
        ),

        // さらに抜き出し (44〜45)
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、要旨がまとめられている場所を そのまま ぬき出しましょう。\n『この説明文の 要旨は、最後の 段落に まとめられている。』",
            answer: "最後の 段落",
            acceptableAnswers: ["最後の段落", "さいごのだんらく"],
            explanation: "要旨がまとめられている場所は『最後の 段落』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、発表者が心がけたことを そのまま ぬき出しましょう。\n『聴衆に 伝わるよう、発表者は ゆっくり はっきりした 声で 話した。』",
            answer: "ゆっくり はっきりした 声で 話した",
            acceptableAnswers: ["ゆっくりはっきりした声で話した"],
            explanation: "発表者が心がけたことは『ゆっくり はっきりした 声で 話した』です。"
        ),

        // さらに並べ替え (46〜48)
        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["大切だ", "根拠を 示しながら", "自分の考えを 述べることが", "説得力を 持たせるには"],
            orderedChoices: ["説得力を 持たせるには", "根拠を 示しながら", "自分の考えを 述べることが", "大切だ"],
            explanation: "『説得力を 持たせるには 根拠を 示しながら 自分の考えを 述べることが 大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["深めることができる", "ちがう考えを 受け入れることで", "物事を 多角的に", "視野が 広がり"],
            orderedChoices: ["ちがう考えを 受け入れることで", "視野が 広がり", "物事を 多角的に", "深めることができる"],
            explanation: "『ちがう考えを 受け入れることで 視野が 広がり 物事を 多角的に 深めることができる。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["役立てることが大切だ", "振り返ることで", "自分の 発表の 内容を", "次の学びに"],
            orderedChoices: ["自分の 発表の 内容を", "振り返ることで", "次の学びに", "役立てることが大切だ"],
            explanation: "『自分の 発表の 内容を 振り返ることで 次の学びに 役立てることが大切だ。』が正しい順番です。"
        ),

        // さらに組み合わせ (49〜51)
        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "環境", match: "かんきょう"),
                QuizMatchingPair(prompt: "提案", match: "ていあん"),
                QuizMatchingPair(prompt: "情報", match: "じょうほう")
            ],
            choices: ["じょうほう", "かんきょう", "ていあん"],
            explanation: "『環境=かんきょう』『提案=ていあん』『情報=じょうほう』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "判断", match: "はんだん"),
                QuizMatchingPair(prompt: "議論", match: "ぎろん"),
                QuizMatchingPair(prompt: "確認", match: "かくにん")
            ],
            choices: ["かくにん", "はんだん", "ぎろん"],
            explanation: "『判断=はんだん』『議論=ぎろん』『確認=かくにん』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "貢献", match: "役立てること"),
                QuizMatchingPair(prompt: "可能", match: "できること"),
                QuizMatchingPair(prompt: "発揮", match: "力をうまく出すこと")
            ],
            choices: ["力をうまく出すこと", "役立てること", "できること"],
            explanation: "『貢献=役立てること』『可能=できること』『発揮=力をうまく出すこと』が正しい組み合わせです。"
        ),

        // さらに穴埋め (52〜54)
        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『どんな困難にも負けず、くじけずに立ち向かう心を ＿＿ という。』",
            answer: "不撓不屈",
            acceptableAnswers: ["ふとうふくつ", "ふとうふくつの精神"],
            explanation: "どんな困難にも屈しないことを『不撓不屈（ふとうふくつ）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『非常に驚くことを、度肝を ＿＿ という。』",
            answer: "抜かれる",
            acceptableAnswers: ["ぬかれる"],
            explanation: "非常に驚くことを『度肝を抜かれる』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『相手を高める言い方を ＿＿ 語といいます。』",
            answer: "尊敬",
            acceptableAnswers: ["そんけい"],
            explanation: "相手を高める言い方を『尊敬（そんけい）語』といいます。"
        ),

        // さらに抜き出し (55〜56)
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、資料を読むときに大切なことを そのまま ぬき出しましょう。\n『資料を 読むとき、事実と 筆者の 意見を 区別しながら 読む ことが 大切だ。』",
            answer: "事実と 筆者の 意見を 区別しながら 読む こと",
            acceptableAnswers: ["事実と筆者の意見を区別しながら読むこと", "じじつとひっしゃのいけんをくべつしながらよむこと"],
            explanation: "資料を読むときに大切なことは『事実と 筆者の 意見を 区別しながら 読む こと』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、説得力を高めるために必要なことを そのまま ぬき出しましょう。\n『説得力を 高めるには、自分の 意見を 裏付ける 根拠を 示す 必要がある。』",
            answer: "根拠を 示す 必要がある",
            acceptableAnswers: ["根拠を示す必要がある", "こんきょをしめすひつようがある"],
            explanation: "説得力を高めるために必要なことは『根拠を 示す 必要がある』です。"
        ),

        QuizQuestion(
        question: "【漢字】『災害』の読みとして正しいものはどれですか？",
        choices: [
        "さいがい",
        "さいかい",
        "ざいかい",
        "ざいがい"
        ],
        correctAnswerIndex: 0,
        explanation: "『災害』の正しい読みは『さいがい』です。"
        ),

        QuizQuestion(
        question: "【熟語の構成】『増減』の熟語の構成として正しいものはどれですか？",
        choices: [
        "似た意味をもつ漢字を組み合わせた熟語",
        "反対の意味をもつ漢字を組み合わせた熟語",
        "上の漢字が下の漢字をくわしくする熟語",
        "下の漢字が上の漢字の目的語になる熟語"
        ],
        correctAnswerIndex: 1,
        explanation: "『増』と『減』は反対の意味なので、正解は『反対の意味をもつ漢字を組み合わせた熟語』です。"
        ),

        QuizQuestion(
        question: "【敬語】『校長先生が会場に来ました。』を、校長先生を高める言い方に直した文はどれですか？",
        choices: [
        "校長先生が会場に参りました。",
        "校長先生が会場にうかがいました。",
        "校長先生が会場にいらっしゃいました。",
        "校長先生が会場に申しました。"
        ],
        correctAnswerIndex: 2,
        explanation: "『来る』の尊敬語を使った『校長先生が会場にいらっしゃいました。』が正解です。"
        ),

        QuizQuestion(
        question: "【同音異義語】『委員会で新しい案について、けんとうする。』の『けんとう』に当てはまる漢字はどれですか？",
        choices: [
        "見当",
        "健闘",
        "拳闘",
        "検討"
        ],
        correctAnswerIndex: 3,
        explanation: "案についてよく調べて考えることを表す『検討』が正解です。"
        ),

        QuizQuestion(
        question: "【原因と結果】『朝から強い雨が降り続いた。そのため、校庭で予定していた集会は体育館で行われた。』結果に当たるものはどれですか？",
        choices: [
        "朝から雨が降り始めたこと",
        "集会が体育館で行われたこと",
        "校庭で集会を予定したこと",
        "雨がすぐにやんだこと"
        ],
        correctAnswerIndex: 1,
        explanation: "強い雨が降り続いた結果は『集会が体育館で行われたこと』です。"
        ),

        QuizQuestion(
        question: "【要旨】次の文章の要旨として最も適切なものはどれですか？\n『地域の図書館では、本を借りられるだけでなく、資料を検索したり、調べ方を相談したりできる。図書館は、必要な情報を見つけるためにも役立つ場所だ。』",
        choices: [
        "図書館は必要な情報を見つけるためにも役立つ場所である。",
        "図書館では本を何冊でも借りられる。",
        "図書館では資料を検索することだけができる。",
        "図書館では調べ方を自分だけで考える。"
        ],
        correctAnswerIndex: 0,
        explanation: "文章全体の中心をまとめた『図書館は必要な情報を見つけるためにも役立つ場所である。』が正解です。"
        ),

        QuizQuestion(
        question: "【漢字】『衛生』の読みとして正しいものはどれですか？",
        choices: [
        "えいしょう",
        "えせい",
        "えいぜい",
        "えいせい"
        ],
        correctAnswerIndex: 3,
        explanation: "『衛生』の正しい読みは『えいせい』です。"
        ),

        QuizQuestion(
        question: "【敬語】『私は先生を体育館へ案内しました。』を、『私』を低める言い方に直した文はどれですか？",
        choices: [
        "私は先生を体育館へご案内になりました。",
        "私は先生を体育館へ案内なさいました。",
        "私は先生を体育館へご案内しました。",
        "私は先生を体育館へ案内されました。"
        ],
        correctAnswerIndex: 2,
        explanation: "自分の『案内する』という動作を低めた『私は先生を体育館へご案内しました。』が正解です。"
        ),

        QuizQuestion(
        question: "【同音異義語】『相手と条件について、こうしょうする。』の『こうしょう』に当てはまる漢字はどれですか？",
        choices: [
        "交渉",
        "高尚",
        "校章",
        "鉱床"
        ],
        correctAnswerIndex: 0,
        explanation: "相手と条件について話し合うことを表す『交渉』が正解です。"
        ),

        QuizQuestion(
        question: "【文章構成】次の四つの文を段落として並べるとき、最も自然な順番はどれですか？\nア『そこで、川の水質を調べることにした。』\nイ『調査すると、上流より下流の方が水のにごりが強かった。』\nウ『この結果から、下流では生活排水への注意が必要だと考えた。』\nエ『わたしたちの町を流れる川は、場所によって水の様子がちがう。』",
        choices: [
        "ア→エ→イ→ウ",
        "エ→ア→イ→ウ",
        "エ→イ→ウ→ア",
        "イ→ア→エ→ウ"
        ],
        correctAnswerIndex: 1,
        explanation: "話題を示すエ、調査の目的を示すア、結果を示すイ、考察を示すウの順なので、『エ→ア→イ→ウ』が正解です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】つぎの漢字の読みを、ひらがなで答えましょう。\n『資源』",
        answer: "しげん",
        explanation: "『資源』の読みは『しげん』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【熟語の構成】文の ＿＿ に入る言葉を答えましょう。\n『「左右」は、意味が ＿＿ の漢字を組み合わせた熟語です。』",
        answer: "反対",
        explanation: "『左』と『右』は反対の意味なので、＿＿に入る言葉は『反対』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【敬語】『知っている』の尊敬語として、教科書で用いられる言い方を答えましょう。",
        answer: "ご存じだ",
        acceptableAnswers: [
        "ご存じです",
        "ご存知だ",
        "ご存知です"
        ],
        explanation: "『知っている』の尊敬語は『ご存じだ』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【同音異義語】文の（すすめる）を漢字で答えましょう。\n『話し合いを前へ（すすめる）。』",
        answer: "進める",
        explanation: "物事を前へ動かす意味なので、『進める』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【原因と結果】文の ＿＿ に入る国語の言葉を答えましょう。\n『原因となる事がらのあとに起こった事がらを ＿＿ といいます。』",
        answer: "結果",
        acceptableAnswers: [
        "けっか"
        ],
        explanation: "原因となる事がらのあとに起こった事がらを『結果』といいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【要旨】文章を読み、要旨をまとめた文の ＿＿ に入る言葉を答えましょう。\n『植物を育てると、毎日の小さな変化に気づく。観察を続けることは、命への理解を深めることにつながる。』\n『観察を続けることは、＿＿につながる。』",
        answer: "命への理解を深めること",
        explanation: "文章の中心をまとめると、『観察を続けることは、命への理解を深めることにつながる。』となります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、見学で最も心に残ったことを、そのまま抜き出しましょう。\n『工房を見学した。見学で最も心に残ったのは、職人が一本の木を丁寧に削る姿だった。』",
        answer: "職人が一本の木を丁寧に削る姿",
        acceptableAnswers: [],
        explanation: "見学で最も心に残ったことは『職人が一本の木を丁寧に削る姿』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・原因と結果】次の文を読み、作業が予定より早く終わった原因を、そのまま抜き出しましょう。\n『班のみんなが事前に役割を決めていたので、作業は予定より早く終わった。』",
        answer: "班のみんなが事前に役割を決めていた",
        acceptableAnswers: [],
        explanation: "作業が予定より早く終わった原因は『班のみんなが事前に役割を決めていた』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・要旨】次の文章を読み、筆者の中心の考えを表す一文を、そのまま抜き出しましょう。\n『公園の木々は夏の強い日差しをやわらげ、鳥や虫のすみかにもなる。町の自然を守るために、公園の木々を大切に育てていく必要がある。』",
        answer: "町の自然を守るために、公園の木々を大切に育てていく必要がある。",
        acceptableAnswers: [],
        explanation: "筆者の中心の考えを表す一文は『町の自然を守るために、公園の木々を大切に育てていく必要がある。』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、『この工夫』が指す内容を、そのまま抜き出しましょう。\n『発表では、写真の下に短い説明を添えた。この工夫により、聞き手は内容をすぐに理解できた。』",
        answer: "写真の下に短い説明を添えた",
        acceptableAnswers: [],
        explanation: "『この工夫』が指す内容は『写真の下に短い説明を添えた』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・文章構成】次の文を読み、まとめの部分が始まることを示す言葉を、そのまま抜き出しましょう。\n『はじめに調査の目的を述べ、次に結果を示した。以上のことから、節水を続けることが大切だと分かった。』",
        answer: "以上のことから",
        acceptableAnswers: [],
        explanation: "まとめの部分が始まることを示す言葉は『以上のことから』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・熟語の構成】『未完成』の熟語の構成を説明する文になるように並べましょう。",
        choices: [
        "熟語である",
        "意味を打ち消す",
        "上の漢字が",
        "下の漢字の"
        ],
        orderedChoices: [
        "上の漢字が",
        "下の漢字の",
        "意味を打ち消す",
        "熟語である"
        ],
        explanation: "『未完成』は、『上の漢字が 下の漢字の 意味を打ち消す 熟語である』と説明できます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・原因と結果】原因と結果が正しくつながる文になるように並べましょう。",
        choices: [
        "次の週に",
        "朝から雨が降った。",
        "延期になった。",
        "そのため、遠足は"
        ],
        orderedChoices: [
        "朝から雨が降った。",
        "そのため、遠足は",
        "次の週に",
        "延期になった。"
        ],
        explanation: "『朝から雨が降った。 そのため、遠足は 次の週に 延期になった。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・要旨】四つの文を、最後の文が文章の要旨になるように並べましょう。",
        choices: [
        "このままでは、海の生き物に悪い影響を与えるおそれがある。",
        "だから、海へ流れ出るごみを減らすため、日ごろから正しく分別することが大切だ。",
        "その多くは、町で捨てられ、川を通って海へ運ばれたものだ。",
        "海岸では、さまざまなプラスチックごみが見つかっている。"
        ],
        orderedChoices: [
        "海岸では、さまざまなプラスチックごみが見つかっている。",
        "その多くは、町で捨てられ、川を通って海へ運ばれたものだ。",
        "このままでは、海の生き物に悪い影響を与えるおそれがある。",
        "だから、海へ流れ出るごみを減らすため、日ごろから正しく分別することが大切だ。"
        ],
        explanation: "『海岸では、さまざまなプラスチックごみが見つかっている。 その多くは、町で捨てられ、川を通って海へ運ばれたものだ。 このままでは、海の生き物に悪い影響を与えるおそれがある。 だから、海へ流れ出るごみを減らすため、日ごろから正しく分別することが大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】調べたことを報告する文章の基本的な構成になるように並べましょう。",
        choices: [
        "考えたことをまとめる",
        "分かったことを示す",
        "調べたきっかけを述べる",
        "調べ方を説明する"
        ],
        orderedChoices: [
        "調べたきっかけを述べる",
        "調べ方を説明する",
        "分かったことを示す",
        "考えたことをまとめる"
        ],
        explanation: "『調べたきっかけを述べる 調べ方を説明する 分かったことを示す 考えたことをまとめる』の順が基本的な構成です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・熟語の構成】『読書』の熟語の構成を説明する文になるように並べましょう。",
        choices: [
        "目的語になっている",
        "上の漢字の",
        "熟語である",
        "下の漢字が"
        ],
        orderedChoices: [
        "下の漢字が",
        "上の漢字の",
        "目的語になっている",
        "熟語である"
        ],
        explanation: "『読書』は、『下の漢字が 上の漢字の 目的語になっている 熟語である』と説明できます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・漢字】漢字と読みが合うように組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "税金", match: "ぜいきん"),
        QuizMatchingPair(prompt: "貿易", match: "ぼうえき"),
        QuizMatchingPair(prompt: "燃料", match: "ねんりょう"),
        QuizMatchingPair(prompt: "輸送", match: "ゆそう")
        ],
        choices: [
        "ゆそう",
        "ねんりょう",
        "ぜいきん",
        "ぼうえき"
        ],
        explanation: "『税金＝ぜいきん』『貿易＝ぼうえき』『燃料＝ねんりょう』『輸送＝ゆそう』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・敬語】動作をする人に合う敬語を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "先生が会う", match: "お会いになる"),
        QuizMatchingPair(prompt: "先生が帰る", match: "お帰りになる"),
        QuizMatchingPair(prompt: "私が説明する", match: "ご説明する"),
        QuizMatchingPair(prompt: "私が待つ", match: "お待ちする")
        ],
        choices: [
        "ご説明する",
        "お待ちする",
        "お帰りになる",
        "お会いになる"
        ],
        explanation: "先生の動作には尊敬語の『お会いになる』『お帰りになる』、自分の動作には謙譲語の『ご説明する』『お待ちする』を使います。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・同音異義語】説明に合う『かいほう』を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "閉め切っていた施設を使えるようにする", match: "開放"),
        QuizMatchingPair(prompt: "捕らわれていた人を自由にする", match: "解放"),
        QuizMatchingPair(prompt: "けがの具合がよくなる方向へ進む", match: "快方"),
        QuizMatchingPair(prompt: "算数の問題を解く方法", match: "解法")
        ],
        choices: [
        "快方",
        "解法",
        "開放",
        "解放"
        ],
        explanation: "施設を使えるようにするのは『開放』、人を自由にするのは『解放』、具合がよくなる方向は『快方』、問題を解く方法は『解法』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・抜き出し】各文の問いに合う言葉を、本文からそのまま選びましょう。",
        pairs: [
        QuizMatchingPair(prompt: "『健太は、発表で使う写真を三枚選んだ。』健太が選んだもの", match: "発表で使う写真を三枚"),
        QuizMatchingPair(prompt: "『美咲は、風で倒れた植木鉢を元に戻した。』美咲が戻したもの", match: "風で倒れた植木鉢"),
        QuizMatchingPair(prompt: "『先生は、資料の数字が示す変化に注目した。』先生が注目したもの", match: "資料の数字が示す変化"),
        QuizMatchingPair(prompt: "『委員会は、昼休みに校内放送で結果を知らせた。』結果を知らせた方法", match: "校内放送で")
        ],
        choices: [
        "資料の数字が示す変化",
        "校内放送で",
        "風で倒れた植木鉢",
        "発表で使う写真を三枚"
        ],
        explanation: "それぞれ本文から、『発表で使う写真を三枚』『風で倒れた植木鉢』『資料の数字が示す変化』『校内放送で』と抜き出します。"
        ),
        QuizQuestion(
        question: "【漢字】『耕地』の読みとして正しいものはどれですか？",
        choices: [
        "こうち",
        "こうじ",
        "きょうち",
        "きょうじ"
        ],
        correctAnswerIndex: 0,
        explanation: "『耕地』の正しい読みは『こうち』です。"
        ),

        QuizQuestion(
        question: "【漢字】『船は港を出て、決められたこうろを進んだ。』の『こうろ』に当てはまる漢字はどれですか？",
        choices: [
        "行路",
        "航路",
        "港路",
        "向路"
        ],
        correctAnswerIndex: 1,
        explanation: "船や飛行機が進む道筋を表す『航路』が正解です。"
        ),

        QuizQuestion(
        question: "【熟語の構成】『大小』の熟語の構成として正しいものはどれですか？",
        choices: [
        "上の漢字が下の漢字を詳しくする",
        "下の漢字が上の漢字の目的語になる",
        "反対の意味をもつ漢字を組み合わせる",
        "似た意味をもつ漢字を組み合わせる"
        ],
        correctAnswerIndex: 2,
        explanation: "『大』と『小』は反対の意味なので、『反対の意味をもつ漢字を組み合わせる』が正解です。"
        ),

        QuizQuestion(
        question: "【熟語の構成】『造船』の熟語の構成として正しいものはどれですか？",
        choices: [
        "似た意味をもつ漢字を組み合わせる",
        "反対の意味をもつ漢字を組み合わせる",
        "上の漢字が下の漢字を詳しくする",
        "下の漢字が上の漢字の目的語になる"
        ],
        correctAnswerIndex: 3,
        explanation: "『造船』は『船を造る』と読む関係なので、『下の漢字が上の漢字の目的語になる』が正解です。"
        ),

        QuizQuestion(
        question: "【敬語】『教頭先生が資料を読みました。』を、『お〜になる』の形を使った尊敬語に直した文はどれですか？",
        choices: [
        "教頭先生が資料をお読みになりました。",
        "教頭先生が資料をお読みしました。",
        "教頭先生が資料を拝読しました。",
        "教頭先生が資料を読んで差し上げました。"
        ],
        correctAnswerIndex: 0,
        explanation: "『読む』を『お読みになる』に直した『教頭先生が資料をお読みになりました。』が正解です。"
        ),

        QuizQuestion(
        question: "【敬語】『私は明日、先生のお宅へ行きます。』を、自分の動作を低める言い方に直した文はどれですか？",
        choices: [
        "私は明日、先生のお宅へいらっしゃいます。",
        "私は明日、先生のお宅へうかがいます。",
        "私は明日、先生のお宅へお越しになります。",
        "私は明日、先生のお宅へ行かれます。"
        ],
        correctAnswerIndex: 1,
        explanation: "自分の『行く』という動作を低めた『私は明日、先生のお宅へうかがいます。』が正解です。"
        ),

        QuizQuestion(
        question: "【同音異義語】『毎晩、日記を書くしゅうかんが身についた。』の『しゅうかん』に当てはまる漢字はどれですか？",
        choices: [
        "週間",
        "週刊",
        "習慣",
        "収監"
        ],
        correctAnswerIndex: 2,
        explanation: "繰り返し行うことで身についた行動を表す『習慣』が正解です。"
        ),

        QuizQuestion(
        question: "【同音異義語】『研究のせいかを発表する。』の『せいか』に当てはまる漢字はどれですか？",
        choices: [
        "製菓",
        "生家",
        "聖歌",
        "成果"
        ],
        correctAnswerIndex: 3,
        explanation: "研究によって得られた結果を表す『成果』が正解です。"
        ),

        QuizQuestion(
        question: "【原因と結果】『教室の窓が開いたままだった。そのため、掲示物が風で床に落ちた。』結果に当たるものはどれですか？",
        choices: [
        "掲示物が風で床に落ちたこと",
        "窓を開けた人が分からないこと",
        "風が弱くなったこと",
        "掲示物を新しく作ったこと"
        ],
        correctAnswerIndex: 0,
        explanation: "窓が開いたままだったことによる結果は、『掲示物が風で床に落ちたこと』です。"
        ),

        QuizQuestion(
        question: "【要旨】次の文章の要旨として最も適切なものはどれですか？\n『学校の花壇では、児童が水やり当番を決め、植物の変化を記録している。世話を続けることで、小さな変化に気づき、責任をもつ心も育つ。』",
        choices: [
        "花壇には多くの種類の植物を植えるべきである。",
        "植物の世話を続けることは、変化への気づきと責任感につながる。",
        "水やりは毎日一人だけで行うべきである。",
        "記録には植物の名前だけを書けばよい。"
        ],
        correctAnswerIndex: 1,
        explanation: "文章全体の中心をまとめた『植物の世話を続けることは、変化への気づきと責任感につながる。』が正解です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】つぎの漢字の読みを、ひらがなで答えましょう。\n『貯える』",
        answer: "たくわえる",
        explanation: "『貯える』の読みは『たくわえる』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【熟語の構成】文の ＿＿ に入る言葉を答えましょう。\n『「地震」は、「地が震える」という ＿＿ の関係でできた熟語です。』",
        answer: "主語と述語",
        acceptableAnswers: ["主語・述語"],
        explanation: "『地震』は『地が震える』という関係なので、＿＿に入る言葉は『主語と述語』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【敬語】文の ＿＿ に入る謙譲語を答えましょう。\n『私は先生から助言を ＿＿。』",
        answer: "いただきました",
        acceptableAnswers: ["頂きました"],
        explanation: "自分の『もらう』という動作を低めるので、『いただきました』が入ります。"
        ),

        QuizQuestion.fillInBlank(
        question: "【同音異義語】文の（しせつ）を漢字で答えましょう。\n『図書館は、市の大切な文化（しせつ）です。』",
        answer: "施設",
        explanation: "ある目的のために設けられた建物や設備を表すので、『施設』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【原因と結果】次の文の結果に当たる部分を答えましょう。\n『寒さで水道管がこおったので、水が出なくなった。』",
        answer: "水が出なくなった",
        explanation: "寒さで水道管がこおった結果は、『水が出なくなった』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【要旨】文章を読み、まとめた文の ＿＿ に入る言葉を答えましょう。\n『駅前の歩道に自転車が置かれると、歩く人や車いすの人が通りにくい。だれもが安全に通れるよう、自転車は決められた場所に止める必要がある。』\n『自転車は、＿＿に止める必要がある。』",
        answer: "決められた場所",
        explanation: "文章の中心をまとめると、『自転車は、決められた場所に止める必要がある。』となります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、班長が確かめたことを、そのまま抜き出しましょう。\n『班長は、発表に必要な資料がそろっているかを確かめてから、練習を始めた。』",
        answer: "発表に必要な資料がそろっているか",
        acceptableAnswers: [],
        explanation: "班長が確かめたことは『発表に必要な資料がそろっているか』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、『この方法』が指す内容を、そのまま抜き出しましょう。\n『まことは、読んだページごとに一文で内容をメモした。この方法のおかげで、話の流れをすぐに思い出せた。』",
        answer: "読んだページごとに一文で内容をメモした",
        acceptableAnswers: [],
        explanation: "『この方法』が指す内容は『読んだページごとに一文で内容をメモした』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、委員が予想の根拠にしたものを、そのまま抜き出しましょう。\n『委員は、先月より利用者が増えているという記録を根拠に、来月も利用者が増えると予想した。』",
        answer: "先月より利用者が増えているという記録",
        acceptableAnswers: [],
        explanation: "委員が予想の根拠にしたものは『先月より利用者が増えているという記録』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・原因と結果】次の文を読み、試合の開始が遅れた原因を、そのまま抜き出しましょう。\n『会場へ向かうバスが渋滞に巻き込まれたため、試合の開始が二十分遅れた。』",
        answer: "会場へ向かうバスが渋滞に巻き込まれた",
        acceptableAnswers: [],
        explanation: "試合の開始が遅れた原因は『会場へ向かうバスが渋滞に巻き込まれた』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・要旨】次の文章を読み、筆者の考えを最も直接表す一文を、そのまま抜き出しましょう。\n『道具は、使ううちに少しずつ汚れたり、ゆるんだりする。使った後に汚れを落とし、ゆるみを確かめれば、傷みを早く見つけられる。だから、道具を長く使うためには、日ごろの手入れを続けることが大切だ。』",
        answer: "だから、道具を長く使うためには、日ごろの手入れを続けることが大切だ。",
        acceptableAnswers: [],
        explanation: "筆者の考えを最も直接表す一文は『だから、道具を長く使うためには、日ごろの手入れを続けることが大切だ。』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】調査報告の文章として自然な順番に並べましょう。",
        choices: [
        "最後に、結果から考えたことをまとめる。",
        "そのあと、調査結果を述べる。",
        "はじめに、調査の目的を示す。",
        "次に、調べ方を説明する。"
        ],
        orderedChoices: [
        "はじめに、調査の目的を示す。",
        "次に、調べ方を説明する。",
        "そのあと、調査結果を述べる。",
        "最後に、結果から考えたことをまとめる。"
        ],
        explanation: "『はじめに、調査の目的を示す。 次に、調べ方を説明する。 そのあと、調査結果を述べる。 最後に、結果から考えたことをまとめる。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】具体例を使って考えを説明する文章として自然な順番に並べましょう。",
        choices: [
        "さらに、別の例を加える。",
        "このように、二つの例から考えをまとめる。",
        "まず、身近な問題を取り上げる。",
        "たとえば、具体的な例を示す。"
        ],
        orderedChoices: [
        "まず、身近な問題を取り上げる。",
        "たとえば、具体的な例を示す。",
        "さらに、別の例を加える。",
        "このように、二つの例から考えをまとめる。"
        ],
        explanation: "『まず、身近な問題を取り上げる。 たとえば、具体的な例を示す。 さらに、別の例を加える。 このように、二つの例から考えをまとめる。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】二つの資料を比べて考察する文章として自然な順番に並べましょう。",
        choices: [
        "したがって、資料の条件を確かめて比べる必要がある。",
        "一方、別の資料では、紙の使用量が増えている。",
        "この違いは、調べた地域のちがいによると考えられる。",
        "ある資料では、紙の使用量が減っている。"
        ],
        orderedChoices: [
        "ある資料では、紙の使用量が減っている。",
        "一方、別の資料では、紙の使用量が増えている。",
        "この違いは、調べた地域のちがいによると考えられる。",
        "したがって、資料の条件を確かめて比べる必要がある。"
        ],
        explanation: "『ある資料では、紙の使用量が減っている。 一方、別の資料では、紙の使用量が増えている。 この違いは、調べた地域のちがいによると考えられる。 したがって、資料の条件を確かめて比べる必要がある。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・原因と結果】原因と結果のつながりが自然になるように並べましょう。",
        choices: [
        "その結果、夕方には通行できるようになった。",
        "強風で木の枝が折れた。",
        "そこで、市の職員が枝を取り除いた。",
        "そのため、道の一部が通れなくなった。"
        ],
        orderedChoices: [
        "強風で木の枝が折れた。",
        "そのため、道の一部が通れなくなった。",
        "そこで、市の職員が枝を取り除いた。",
        "その結果、夕方には通行できるようになった。"
        ],
        explanation: "『強風で木の枝が折れた。 そのため、道の一部が通れなくなった。 そこで、市の職員が枝を取り除いた。 その結果、夕方には通行できるようになった。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・要旨】最後の文が文章全体の要旨になるように並べましょう。",
        choices: [
        "作り直せば、ごみを減らし、資源も大切にできる。",
        "だから、古い布をすぐに捨てず、再利用することが大切だ。",
        "町では、使われなくなった布が多く捨てられている。",
        "しかし、布は袋や雑巾に作り直して使える。"
        ],
        orderedChoices: [
        "町では、使われなくなった布が多く捨てられている。",
        "しかし、布は袋や雑巾に作り直して使える。",
        "作り直せば、ごみを減らし、資源も大切にできる。",
        "だから、古い布をすぐに捨てず、再利用することが大切だ。"
        ],
        explanation: "『町では、使われなくなった布が多く捨てられている。 しかし、布は袋や雑巾に作り直して使える。 作り直せば、ごみを減らし、資源も大切にできる。 だから、古い布をすぐに捨てず、再利用することが大切だ。』が自然な順番です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・漢字】四つの漢字を、それぞれ正しい読みと組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "版画", match: "はんが"),
        QuizMatchingPair(prompt: "豊富", match: "ほうふ"),
        QuizMatchingPair(prompt: "規則", match: "きそく"),
        QuizMatchingPair(prompt: "貯金", match: "ちょきん")
        ],
        choices: [
        "きそく",
        "ちょきん",
        "はんが",
        "ほうふ"
        ],
        explanation: "『版画＝はんが』『豊富＝ほうふ』『規則＝きそく』『貯金＝ちょきん』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・熟語の構成】熟語と構成が合うように組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "勝敗", match: "反対の意味を組み合わせる"),
        QuizMatchingPair(prompt: "道路", match: "似た意味を組み合わせる"),
        QuizMatchingPair(prompt: "急流", match: "上の漢字が下の漢字を詳しくする"),
        QuizMatchingPair(prompt: "防火", match: "下の漢字が上の漢字の目的語になる")
        ],
        choices: [
        "上の漢字が下の漢字を詳しくする",
        "似た意味を組み合わせる",
        "下の漢字が上の漢字の目的語になる",
        "反対の意味を組み合わせる"
        ],
        explanation: "『勝敗＝反対の意味』『道路＝似た意味』『急流＝上の漢字が下の漢字を詳しくする』『防火＝下の漢字が上の漢字の目的語になる』という構成です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・敬語】敬語と元の言い方が合うように組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "お越しになる", match: "来る"),
        QuizMatchingPair(prompt: "お使いになる", match: "使う"),
        QuizMatchingPair(prompt: "承る", match: "聞く・引き受ける"),
        QuizMatchingPair(prompt: "お目にかかる", match: "会う")
        ],
        choices: [
        "会う",
        "使う",
        "聞く・引き受ける",
        "来る"
        ],
        explanation: "『お越しになる＝来る』『お使いになる＝使う』『承る＝聞く・引き受ける』『お目にかかる＝会う』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・同音異義語】説明に合う『こうせい』を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "文章の誤字や表記を直すこと", match: "校正"),
        QuizMatchingPair(prompt: "文章の組み立て", match: "構成"),
        QuizMatchingPair(prompt: "かたよりがなく正しいこと", match: "公正"),
        QuizMatchingPair(prompt: "生活や行いを改めて立ち直ること", match: "更生")
        ],
        choices: [
        "更生",
        "公正",
        "校正",
        "構成"
        ],
        explanation: "誤字や表記を直すのは『校正』、文章の組み立ては『構成』、かたよりがなく正しいことは『公正』、生活や行いを改めて立ち直ることは『更生』です。"
        ),
        QuizQuestion(
        question: "【漢字】『銅像』の読みとして正しいものはどれですか？",
        choices: [
        "どうぞう",
        "とうぞう",
        "どうそう",
        "とうそう"
        ],
        correctAnswerIndex: 0,
        explanation: "『銅像』の正しい読みは『どうぞう』です。"
        ),

        QuizQuestion(
        question: "【漢字】『公園に休憩所を設ける。』の『設ける』の読みとして正しいものはどれですか？",
        choices: [
        "せつける",
        "もうける",
        "そなける",
        "まかせる"
        ],
        correctAnswerIndex: 1,
        explanation: "『設ける』の正しい読みは『もうける』です。"
        ),

        QuizQuestion(
        question: "【熟語の構成】『日没』の熟語の構成として正しいものはどれですか？",
        choices: [
        "似た意味をもつ漢字を組み合わせる",
        "反対の意味をもつ漢字を組み合わせる",
        "主語と述語の関係になっている",
        "下の漢字が上の漢字の目的語になっている"
        ],
        correctAnswerIndex: 2,
        explanation: "『日没』は『日が没する』という関係なので、『主語と述語の関係になっている』が正解です。"
        ),

        QuizQuestion(
        question: "【熟語の構成】『登山』の熟語の構成として正しいものはどれですか？",
        choices: [
        "似た意味をもつ漢字を組み合わせる",
        "反対の意味をもつ漢字を組み合わせる",
        "上の漢字が下の漢字を詳しくする",
        "下の漢字が上の漢字の目的語や補語になっている"
        ],
        correctAnswerIndex: 3,
        explanation: "『登山』は『山に登る』という関係なので、『下の漢字が上の漢字の目的語や補語になっている』が正解です。"
        ),

        QuizQuestion(
        question: "【敬語】『先生が廊下で待っています。』を、『お〜になる』の形を使った尊敬語に直した文はどれですか？",
        choices: [
        "先生が廊下でお待ちになっています。",
        "先生が廊下でお待ちしています。",
        "先生が廊下で待っております。",
        "先生が廊下でお待ち申し上げています。"
        ],
        correctAnswerIndex: 0,
        explanation: "『待つ』を『お待ちになる』に直した『先生が廊下でお待ちになっています。』が正解です。"
        ),

        QuizQuestion(
        question: "【敬語】『私は校長先生から本を借りました。』を、『借りる』の謙譲語を使った文に直すとどれですか？",
        choices: [
        "私は校長先生から本をお借りになりました。",
        "私は校長先生から本を拝借しました。",
        "私は校長先生から本を借りられました。",
        "私は校長先生から本をお貸ししました。"
        ],
        correctAnswerIndex: 1,
        explanation: "『借りる』の謙譲語『拝借する』を使った『私は校長先生から本を拝借しました。』が正解です。"
        ),

        QuizQuestion(
        question: "【同音異義語】『博物館の特別展示が行われるきかんは一か月だ。』の『きかん』に当てはまる漢字はどれですか？",
        choices: [
        "帰還",
        "器官",
        "期間",
        "機関"
        ],
        correctAnswerIndex: 2,
        explanation: "ある時から別の時までの間を表す『期間』が正解です。"
        ),

        QuizQuestion(
        question: "【同音異義語】『二つの写真をたいしょうすると、季節による違いが分かった。』の『たいしょう』に当てはまる漢字はどれですか？",
        choices: [
        "大賞",
        "対象",
        "大将",
        "対照"
        ],
        correctAnswerIndex: 3,
        explanation: "二つのものを比べ合わせることを表す『対照』が正解です。"
        ),

        QuizQuestion(
        question: "【原因と結果】『給食室の工事で給食を作れなかった。そのため、その日は児童が弁当を持参した。』結果に当たるものはどれですか？",
        choices: [
        "児童が弁当を持参したこと",
        "給食室でいつもどおり調理したこと",
        "工事が予定より早く終わったこと",
        "児童が給食を残したこと"
        ],
        correctAnswerIndex: 0,
        explanation: "給食を作れなかったことによる結果は、『児童が弁当を持参したこと』です。"
        ),

        QuizQuestion(
        question: "【要旨】次の文章の要旨として最も適切なものはどれですか？\n『駅の案内板には、文字だけでなく、絵記号や複数の言語が使われている。こうした工夫によって、子どもや外国から来た人にも、行き先が伝わりやすくなる。』",
        choices: [
        "駅の案内板には文字を使わない方がよい。",
        "案内板には、さまざまな人に行き先を伝えやすくする工夫がある。",
        "絵記号は子どもだけのために使われている。",
        "外国語の表示だけがあれば、行き先は必ず伝わる。"
        ],
        correctAnswerIndex: 1,
        explanation: "文章全体の中心をまとめた『案内板には、さまざまな人に行き先を伝えやすくする工夫がある。』が正解です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】つぎの漢字の読みを、ひらがなで答えましょう。\n『領域』",
        answer: "りょういき",
        explanation: "『領域』の読みは『りょういき』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【熟語の構成】文の ＿＿ に入る言葉を答えましょう。\n『「開閉」は、意味が ＿＿ の漢字を組み合わせた熟語です。』",
        answer: "反対",
        explanation: "『開』と『閉』は反対の意味なので、＿＿に入る言葉は『反対』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【敬語】『ここが受付です。』をより丁寧にした文の ＿＿ に入る言葉を答えましょう。\n『ここが受付で ＿＿。』",
        answer: "ございます",
        explanation: "『ある』の丁寧語『ございます』を使い、『ここが受付でございます。』とします。"
        ),

        QuizQuestion.fillInBlank(
        question: "【同音異義語】文の（えんちょう）を漢字で答えましょう。\n『話し合いが終わらなかったので、時間を（えんちょう）した。』",
        answer: "延長",
        explanation: "時間を予定より長くすることを表すので、『延長』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【原因と結果】次の文を読み、校内放送が聞こえなかった原因を答えましょう。\n『スピーカーの電源が切れていたため、校内放送が聞こえなかった。』",
        answer: "スピーカーの電源が切れていた",
        explanation: "校内放送が聞こえなかった原因は、『スピーカーの電源が切れていた』ことです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【要旨】文章を読み、まとめた文の ＿＿ に入る言葉を答えましょう。\n『異なる意見を聞くと、自分では気づかなかった見方に出会える。そのため、話し合いは自分の考えを広げたり深めたりするのに役立つ。』\n『話し合いは、自分の考えを ＿＿ のに役立つ。』",
        answer: "広げたり深めたりする",
        explanation: "文章の中心をまとめると、『話し合いは、自分の考えを広げたり深めたりするのに役立つ。』となります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、『これらの情報』が指す内容を、そのまま抜き出しましょう。\n『観察ノートには、観察した日時と天気を書いた。これらの情報があると、植物の変化を比べやすい。』",
        answer: "観察した日時と天気",
        acceptableAnswers: [],
        explanation: "『これらの情報』が指す内容は『観察した日時と天気』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、学級アンケートで最も多かった意見を、そのまま抜き出しましょう。\n『学級アンケートでは、「休み時間に外で遊びたい」という意見が最も多かった。奈央は、その結果を発表した。』",
        answer: "休み時間に外で遊びたい",
        acceptableAnswers: [],
        explanation: "学級アンケートで最も多かった意見は『休み時間に外で遊びたい』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し】次の文を読み、太一が説明を聞いた後にしたことを、そのまま抜き出しましょう。\n『説明を聞いた後、太一は実物を手に取って重さを確かめた。』",
        answer: "実物を手に取って重さを確かめた",
        acceptableAnswers: [],
        explanation: "太一が説明を聞いた後にしたことは『実物を手に取って重さを確かめた』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・原因と結果】次の文を読み、橋が通行止めになった原因を、そのまま抜き出しましょう。\n『前日の大雨で川の水位が上がったため、歩行者用の橋が通行止めになった。』",
        answer: "前日の大雨で川の水位が上がった",
        acceptableAnswers: [],
        explanation: "橋が通行止めになった原因は『前日の大雨で川の水位が上がった』ことです。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・要旨】次の文章を読み、筆者の中心の考えを表す一文を、そのまま抜き出しましょう。\n『紙の地図は、地域全体を一目で見渡せる。一方、デジタル地図は、現在地や目的地までの道順を調べやすい。目的に合わせて、二つの地図を使い分けることが大切だ。』",
        answer: "目的に合わせて、二つの地図を使い分けることが大切だ。",
        acceptableAnswers: [],
        explanation: "筆者の中心の考えを表す一文は『目的に合わせて、二つの地図を使い分けることが大切だ。』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】意見文として自然な順番に並べましょう。",
        choices: [
        "例えば、夏の休み時間には暑さで外遊びを控える人がいる。",
        "以上の理由から、私は校庭に日陰を増やすべきだと考える。",
        "私は、校庭に日陰を増やすべきだと考える。",
        "なぜなら、暑い日でも安全に外で過ごしやすくなるからだ。"
        ],
        orderedChoices: [
        "私は、校庭に日陰を増やすべきだと考える。",
        "なぜなら、暑い日でも安全に外で過ごしやすくなるからだ。",
        "例えば、夏の休み時間には暑さで外遊びを控える人がいる。",
        "以上の理由から、私は校庭に日陰を増やすべきだと考える。"
        ],
        explanation: "『私は、校庭に日陰を増やすべきだと考える。 なぜなら、暑い日でも安全に外で過ごしやすくなるからだ。 例えば、夏の休み時間には暑さで外遊びを控える人がいる。 以上の理由から、私は校庭に日陰を増やすべきだと考える。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】調査の目的、方法、結果、考察の順になるように並べましょう。",
        choices: [
        "測定すると、日陰は日なたより平均で三度低かった。",
        "この結果から、日陰には暑さをやわらげる働きがあると分かった。",
        "日なたと日陰の温度差を調べたいと考えた。",
        "まず、校庭の四か所で気温を測ることにした。"
        ],
        orderedChoices: [
        "日なたと日陰の温度差を調べたいと考えた。",
        "まず、校庭の四か所で気温を測ることにした。",
        "測定すると、日陰は日なたより平均で三度低かった。",
        "この結果から、日陰には暑さをやわらげる働きがあると分かった。"
        ],
        explanation: "『日なたと日陰の温度差を調べたいと考えた。 まず、校庭の四か所で気温を測ることにした。 測定すると、日陰は日なたより平均で三度低かった。 この結果から、日陰には暑さをやわらげる働きがあると分かった。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文章構成】二つの辞書の特徴を比べ、結論を述べる文章になるように並べましょう。",
        choices: [
        "そのため、目的に合わせて使い分けるとよい。",
        "紙の辞書は、近くにある言葉も同時に目に入る。",
        "このように、それぞれに異なる長所がある。",
        "一方、電子辞書は、調べたい言葉をすばやく検索できる。"
        ],
        orderedChoices: [
        "紙の辞書は、近くにある言葉も同時に目に入る。",
        "一方、電子辞書は、調べたい言葉をすばやく検索できる。",
        "このように、それぞれに異なる長所がある。",
        "そのため、目的に合わせて使い分けるとよい。"
        ],
        explanation: "『紙の辞書は、近くにある言葉も同時に目に入る。 一方、電子辞書は、調べたい言葉をすばやく検索できる。 このように、それぞれに異なる長所がある。 そのため、目的に合わせて使い分けるとよい。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・原因と結果】出来事のつながりが自然になるように並べましょう。",
        choices: [
        "その結果、本の貸出冊数も増えた。",
        "そして、図書室を訪れる人が増えた。",
        "図書委員が新しい本の紹介カードを掲示した。",
        "そのため、多くの児童が本に興味をもった。"
        ],
        orderedChoices: [
        "図書委員が新しい本の紹介カードを掲示した。",
        "そのため、多くの児童が本に興味をもった。",
        "そして、図書室を訪れる人が増えた。",
        "その結果、本の貸出冊数も増えた。"
        ],
        explanation: "『図書委員が新しい本の紹介カードを掲示した。 そのため、多くの児童が本に興味をもった。 そして、図書室を訪れる人が増えた。 その結果、本の貸出冊数も増えた。』が自然な順番です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・要旨】最後の文が文章全体の要旨になるように並べましょう。",
        choices: [
        "また、生産者の顔が分かりやすいというよさもある。",
        "そのため、運ぶために使う燃料を減らせる。",
        "だから、地元の食材を選ぶことには、環境と地域を支えるよさがある。",
        "地元で作られた野菜は、店まで運ぶ距離が短い。"
        ],
        orderedChoices: [
        "地元で作られた野菜は、店まで運ぶ距離が短い。",
        "そのため、運ぶために使う燃料を減らせる。",
        "また、生産者の顔が分かりやすいというよさもある。",
        "だから、地元の食材を選ぶことには、環境と地域を支えるよさがある。"
        ],
        explanation: "『地元で作られた野菜は、店まで運ぶ距離が短い。 そのため、運ぶために使う燃料を減らせる。 また、生産者の顔が分かりやすいというよさもある。 だから、地元の食材を選ぶことには、環境と地域を支えるよさがある。』が自然な順番です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・漢字】漢字と読みが合うように組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "演説", match: "えんぜつ"),
        QuizMatchingPair(prompt: "混雑", match: "こんざつ"),
        QuizMatchingPair(prompt: "証拠", match: "しょうこ"),
        QuizMatchingPair(prompt: "期限", match: "きげん")
        ],
        choices: [
        "しょうこ",
        "きげん",
        "えんぜつ",
        "こんざつ"
        ],
        explanation: "『演説＝えんぜつ』『混雑＝こんざつ』『証拠＝しょうこ』『期限＝きげん』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・熟語の構成】熟語と構成が合うように組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "救助", match: "似た意味をもつ漢字を組み合わせる"),
        QuizMatchingPair(prompt: "多少", match: "反対の意味をもつ漢字を組み合わせる"),
        QuizMatchingPair(prompt: "鉄橋", match: "上の漢字が下の漢字を詳しくする"),
        QuizMatchingPair(prompt: "着席", match: "下の漢字が上の漢字の目的語や補語になっている")
        ],
        choices: [
        "上の漢字が下の漢字を詳しくする",
        "下の漢字が上の漢字の目的語や補語になっている",
        "似た意味をもつ漢字を組み合わせる",
        "反対の意味をもつ漢字を組み合わせる"
        ],
        explanation: "『救助＝似た意味をもつ漢字を組み合わせる』『多少＝反対の意味をもつ漢字を組み合わせる』『鉄橋＝上の漢字が下の漢字を詳しくする』『着席＝下の漢字が上の漢字の目的語や補語になっている』という構成です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・敬語】敬語と元の言い方が合うように組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "お尋ねになる", match: "尋ねる"),
        QuizMatchingPair(prompt: "申し上げる", match: "言う"),
        QuizMatchingPair(prompt: "お届けする", match: "届ける"),
        QuizMatchingPair(prompt: "ございます", match: "ある")
        ],
        choices: [
        "届ける",
        "ある",
        "尋ねる",
        "言う"
        ],
        explanation: "『お尋ねになる＝尋ねる』『申し上げる＝言う』『お届けする＝届ける』『ございます＝ある』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・同音異義語】説明に合う『きしょう』を組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "天気や大気の状態", match: "気象"),
        QuizMatchingPair(prompt: "朝、眠りから起きること", match: "起床"),
        QuizMatchingPair(prompt: "数が少なく、めずらしいこと", match: "希少"),
        QuizMatchingPair(prompt: "生まれつきの性質", match: "気性")
        ],
        choices: [
        "希少",
        "気性",
        "気象",
        "起床"
        ],
        explanation: "『天気や大気の状態＝気象』『朝、眠りから起きること＝起床』『数が少なく、めずらしいこと＝希少』『生まれつきの性質＝気性』が正しい組み合わせです。"
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
            quizLevel: .kokugo5,
            authManager: authManager,
            audioManager: audioManager,
            isPresenting: $isPresenting,
            interstitial: sharedInterstitial
        )
    }
}

struct Kokugo5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo5ListView(isPresenting: .constant(false))
    }
}
