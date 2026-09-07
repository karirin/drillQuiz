//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo4ListView: View {
    @Binding var isPresenting: Bool

    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『石橋をたたいて ＿＿。』",
            answer: "わたる",
            acceptableAnswers: ["渡る"],
            explanation: "『石橋をたたいて渡る』は、用心深く進めることを表すことわざです。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『急がば ＿＿。』",
            answer: "回れ",
            acceptableAnswers: ["まわれ"],
            explanation: "『急がば回れ』は、急ぐときほど安全な方法をえらぶのがよいという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『説明文で、内容の まとまりごとに 分けた 一つ一つを ＿＿ といいます。』",
            answer: "段落",
            acceptableAnswers: ["だんらく"],
            explanation: "内容のまとまりごとに分けた一つ一つを『段落』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『努力』",
            answer: "どりょく",
            explanation: "『努力』の読みは『どりょく』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、みんなで力を合わせることを表す熟語を そのまま ぬき出しましょう。\n『みんなで力を合わせて仕事を進めることを「協力」といいます。』",
            answer: "協力",
            acceptableAnswers: ["きょうりょく"],
            explanation: "みんなで力を合わせることを表す熟語は『協力』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、みんなが 手をあげた きっかけが分かることばを そのまま ぬき出しましょう。\n『みんなは 先生の合図で 一せいに 手をあげた。』",
            answer: "先生の合図で",
            acceptableAnswers: ["先生の 合図で", "せんせいのあいずで"],
            explanation: "手をあげたきっかけが分かることばは『先生の合図で』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ゆうなの 気持ちが分かることばを そのまま ぬき出しましょう。\n『発表の前、ゆうなは 少し きんちょうした 顔で ノートを 見直した。』",
            answer: "きんちょうした 顔",
            acceptableAnswers: ["きんちょうした顔"],
            explanation: "ゆうなの気持ちが分かることばは『きんちょうした 顔』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ぼくたちが 片づけたものを そのまま ぬき出しましょう。\n『ぼくたちは 雨雲が近づく前に、急いで テントを 片づけた。』",
            answer: "テントを",
            explanation: "ぼくたちが片づけたものは『テントを』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["進めることが大切だ", "何事も", "あわてず", "じゅんばんに"],
            orderedChoices: ["何事も", "あわてず", "じゅんばんに", "進めることが大切だ"],
            explanation: "『何事も あわてず じゅんばんに 進めることが大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["始めた", "みんなで", "役わりを", "たしかめてから", "発表の れん習を"],
            orderedChoices: ["みんなで", "役わりを", "たしかめてから", "発表の れん習を", "始めた"],
            explanation: "『みんなで 役わりを たしかめてから 発表の れん習を 始めた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["のびていた", "ひこうき雲が", "秋の 空に", "まっすぐ"],
            orderedChoices: ["秋の 空に", "ひこうき雲が", "まっすぐ", "のびていた"],
            explanation: "『秋の 空に ひこうき雲が まっすぐ のびていた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["そえられていた", "わかりやすい", "その意見には", "理由が"],
            orderedChoices: ["その意見には", "わかりやすい", "理由が", "そえられていた"],
            explanation: "『その意見には わかりやすい 理由が そえられていた。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "改善", match: "前よりよくすること"),
                QuizMatchingPair(prompt: "努力", match: "一生けん命に取り組むこと"),
                QuizMatchingPair(prompt: "協力", match: "力を合わせること")
            ],
            choices: ["力を合わせること", "前よりよくすること", "一生けん命に取り組むこと"],
            explanation: "『改善=前よりよくすること』『努力=一生けん命に取り組むこと』『協力=力を合わせること』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことわざと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "急がば回れ", match: "急ぐときこそ安全な方法をえらぶ"),
                QuizMatchingPair(prompt: "石橋をたたいて渡る", match: "十分に用心して進める"),
                QuizMatchingPair(prompt: "習うより慣れよ", match: "経験しながら身につける")
            ],
            choices: ["十分に用心して進める", "経験しながら身につける", "急ぐときこそ安全な方法をえらぶ"],
            explanation: "ことわざの意味を場面と合わせて覚えましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "題名", match: "文章の 名前"),
                QuizMatchingPair(prompt: "段落", match: "内容の まとまり"),
                QuizMatchingPair(prompt: "要点", match: "とくに 大切な 点")
            ],
            choices: ["とくに 大切な 点", "文章の 名前", "内容の まとまり"],
            explanation: "国語のことばの意味を正しく結びつけましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】つなぎ言葉と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "しかし", match: "前と 反対のことをいう"),
                QuizMatchingPair(prompt: "そして", match: "つけたして いう"),
                QuizMatchingPair(prompt: "たとえば", match: "れいを 出す")
            ],
            choices: ["つけたして いう", "れいを 出す", "前と 反対のことをいう"],
            explanation: "つなぎ言葉のはたらきが分かると、文の関係が読み取りやすくなります。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『雨ふって ＿＿ 固まる。』",
            answer: "地",
            acceptableAnswers: ["じ"],
            explanation: "『雨ふって地固まる』は、もめごとのあとで かえってよい状態になることを表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『勇気』",
            answer: "ゆうき",
            explanation: "『勇気』の読みは『ゆうき』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、話し合いが 始まるきっかけが分かることばを そのまま ぬき出しましょう。\n『学級会では、司会の合図で 話し合いが 始まった。』",
            answer: "司会の合図で",
            acceptableAnswers: ["司会の 合図で", "しかいのあいずで"],
            explanation: "話し合いが始まるきっかけが分かることばは『司会の合図で』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ぼくの 気持ちが分かることばを そのまま ぬき出しましょう。\n『ぼくは 発表のあと、ほっとした 顔で いすに すわった。』",
            answer: "ほっとした 顔",
            acceptableAnswers: ["ほっとした顔"],
            explanation: "ぼくの気持ちが分かることばは『ほっとした 顔』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["生まれやすい", "みんなで", "よい考えが", "意見を 出し合うと"],
            orderedChoices: ["みんなで", "意見を 出し合うと", "よい考えが", "生まれやすい"],
            explanation: "『みんなで 意見を 出し合うと よい考えが 生まれやすい。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["見えていた", "白く", "遠くの山まで", "雪で"],
            orderedChoices: ["遠くの山まで", "雪で", "白く", "見えていた"],
            explanation: "『遠くの山まで 雪で 白く 見えていた。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "予習", match: "先に学んで おくこと"),
                QuizMatchingPair(prompt: "復習", match: "学んだことを 見直すこと"),
                QuizMatchingPair(prompt: "司会", match: "会の 進行をすること")
            ],
            choices: ["会の 進行をすること", "先に学んで おくこと", "学んだことを 見直すこと"],
            explanation: "『予習=先に学んで おくこと』『復習=学んだことを 見直すこと』『司会=会の 進行をすること』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】文の 種類と 説明が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "物語文", match: "出来事や 人物のようすを 書く文"),
                QuizMatchingPair(prompt: "説明文", match: "事実や 考えを 分かりやすく伝える文"),
                QuizMatchingPair(prompt: "詩", match: "リズムよく 気持ちを 表す文")
            ],
            choices: ["事実や 考えを 分かりやすく伝える文", "リズムよく 気持ちを 表す文", "出来事や 人物のようすを 書く文"],
            explanation: "文の種類ごとの特徴を結びつけて覚えましょう。"
        ),

        // --- 追加問題 (56問) ---

        // 漢字の読み (1〜12)
        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『変化』",
            answer: "へんか",
            explanation: "『変化』の読みは『へんか』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『特別』",
            answer: "とくべつ",
            explanation: "『特別』の読みは『とくべつ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『必要』",
            answer: "ひつよう",
            explanation: "『必要』の読みは『ひつよう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『健康』",
            answer: "けんこう",
            explanation: "『健康』の読みは『けんこう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『消費』",
            answer: "しょうひ",
            explanation: "『消費』の読みは『しょうひ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『経験』",
            answer: "けいけん",
            explanation: "『経験』の読みは『けいけん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『成長』",
            answer: "せいちょう",
            explanation: "『成長』の読みは『せいちょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『整理』",
            answer: "せいり",
            explanation: "『整理』の読みは『せいり』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『観察』",
            answer: "かんさつ",
            explanation: "『観察』の読みは『かんさつ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『比べる』",
            answer: "くらべる",
            explanation: "『比べる』の読みは『くらべる』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『望む』",
            answer: "のぞむ",
            explanation: "『望む』の読みは『のぞむ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『建てる』",
            answer: "たてる",
            explanation: "『建てる』の読みは『たてる』です。"
        ),

        // 穴埋め (13〜20)
        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『七転び ＿＿。』",
            answer: "八起き",
            acceptableAnswers: ["やおき", "はちおき", "八起"],
            explanation: "『七転び八起き』は、何度失敗しても立ち上がることを表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『二兎を追う者は ＿＿。』",
            answer: "一兎も得ず",
            acceptableAnswers: ["いっともえず"],
            explanation: "『二兎を追う者は一兎も得ず』は、欲張ると何も得られないという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『井の中の蛙 ＿＿ を知らず。』",
            answer: "大海",
            acceptableAnswers: ["たいかい", "大海（たいかい）"],
            explanation: "『井の中の蛙大海を知らず』は、せまい世界しか知らないことを表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『うそをついて良心がとがめることを、胸が ＿＿ という。』",
            answer: "痛む",
            acceptableAnswers: ["いたむ", "いたい"],
            explanation: "良心がとがめることを『胸が痛む』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『何かをするのに適した時のことを、潮時が ＿＿ という。』",
            answer: "来る",
            acceptableAnswers: ["くる"],
            explanation: "物事をするのにちょうどよい時を『潮時が来る』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『文章の中で、特に大切な部分を ＿＿ といいます。』",
            answer: "要点",
            acceptableAnswers: ["ようてん"],
            explanation: "特に大切な部分を『要点（ようてん）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『文章の中で、話題を変えるまとまりを ＿＿ といいます。』",
            answer: "段落",
            acceptableAnswers: ["だんらく"],
            explanation: "話題のまとまりを『段落（だんらく）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『二つの漢字を組み合わせた言葉を ＿＿ といいます。』",
            answer: "熟語",
            acceptableAnswers: ["じゅくご"],
            explanation: "二つ以上の漢字を組み合わせた言葉を『熟語（じゅくご）』といいます。"
        ),

        // 抜き出し (21〜26)
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、のぞみの変化が分かることばを そのまま ぬき出しましょう。\n『はじめは 緊張していた のぞみも、話し合いが進むにつれて 自信を持って 意見を 言えるようになった。』",
            answer: "自信を持って 意見を 言えるようになった",
            acceptableAnswers: ["自信を持って意見を言えるようになった"],
            explanation: "のぞみの変化が分かることばは『自信を持って 意見を 言えるようになった』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、わたしができたことを そのまま ぬき出しましょう。\n『先生は ていねいに 説明してくれたので、わたしは すぐに 理解することができた。』",
            answer: "理解することができた",
            acceptableAnswers: ["理解すること", "すぐに 理解することができた"],
            explanation: "わたしができたことは『理解することができた』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、りょうすけが何に取り組んだかを そのまま ぬき出しましょう。\n『りょうすけは 放課後、図書室で 難しい 算数の 問題に 取り組んだ。』",
            answer: "難しい 算数の 問題",
            acceptableAnswers: ["難しい算数の問題", "さんすうのもんだい", "算数の問題"],
            explanation: "りょうすけが取り組んだのは『難しい 算数の 問題』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、みんなのようすが分かることばを そのまま ぬき出しましょう。\n『春の遠足で、みんなは 広い 花畑に 感動して 歓声を あげた。』",
            answer: "感動して 歓声を あげた",
            acceptableAnswers: ["感動して歓声をあげた"],
            explanation: "みんなのようすが分かることばは『感動して 歓声を あげた』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、修飾語（どのように）にあたることばを そのまま ぬき出しましょう。\n『先生は 黒板に 丁寧な 文字で 本日の 目標を 書いた。』",
            answer: "丁寧な 文字で",
            acceptableAnswers: ["丁寧な文字で", "ていねいな文字で", "ていねいな もじで"],
            explanation: "修飾語（どのように）にあたることばは『丁寧な 文字で』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、ゆかが説明するときにしたことを そのまま ぬき出しましょう。\n『委員会の 話し合いで、ゆかは 分かりやすい 例を あげながら 説明した。』",
            answer: "分かりやすい 例を あげながら",
            acceptableAnswers: ["分かりやすい例をあげながら", "わかりやすいれいをあげながら"],
            explanation: "ゆかが説明するときにしたことは『分かりやすい 例を あげながら』です。"
        ),

        // 並べ替え (27〜32)
        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["発表した", "自分の考えを", "みんなの前で", "じゅんびしてから", "よく"],
            orderedChoices: ["よく", "じゅんびしてから", "みんなの前で", "自分の考えを", "発表した"],
            explanation: "『よく じゅんびしてから みんなの前で 自分の考えを 発表した。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["つかいました", "算数の勉強に", "ぼくは", "ノートを", "こまかく"],
            orderedChoices: ["ぼくは", "算数の勉強に", "ノートを", "こまかく", "つかいました"],
            explanation: "『ぼくは 算数の勉強に ノートを こまかく つかいました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["あります", "よい友人が", "大切に", "いることほど", "人生に"],
            orderedChoices: ["人生に", "よい友人が", "いることほど", "大切に", "あります"],
            explanation: "『人生に よい友人が いることほど 大切に あります。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["読んだ", "全員が", "ていねいに", "音読を", "教室で"],
            orderedChoices: ["教室で", "全員が", "ていねいに", "音読を", "読んだ"],
            explanation: "『教室で 全員が ていねいに 音読を 読んだ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["大切だ", "話すことが", "相手の目を見て", "人と話すとき", "しっかり"],
            orderedChoices: ["人と話すとき", "相手の目を見て", "しっかり", "話すことが", "大切だ"],
            explanation: "『人と話すとき 相手の目を見て しっかり 話すことが 大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["記録した", "気づいたことを", "ノートに", "観察しながら", "こまかく"],
            orderedChoices: ["観察しながら", "気づいたことを", "ノートに", "こまかく", "記録した"],
            explanation: "『観察しながら 気づいたことを ノートに こまかく 記録した。』が正しい順番です。"
        ),

        // 組み合わせ (33〜37)
        QuizQuestion.matching(
            question: "【組み合わせ】ことわざと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "七転び八起き", match: "何度でも立ち上がる"),
                QuizMatchingPair(prompt: "井の中の蛙", match: "せまい世界しか知らない"),
                QuizMatchingPair(prompt: "二兎を追う者は一兎も得ず", match: "欲張ると何も得られない")
            ],
            choices: ["欲張ると何も得られない", "何度でも立ち上がる", "せまい世界しか知らない"],
            explanation: "ことわざの意味を正しく結びつけましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "成長", match: "大きくなること"),
                QuizMatchingPair(prompt: "変化", match: "かわること"),
                QuizMatchingPair(prompt: "整理", match: "きちんとかたづけること")
            ],
            choices: ["きちんとかたづけること", "大きくなること", "かわること"],
            explanation: "『成長=大きくなること』『変化=かわること』『整理=きちんとかたづけること』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "健康", match: "けんこう"),
                QuizMatchingPair(prompt: "必要", match: "ひつよう"),
                QuizMatchingPair(prompt: "特別", match: "とくべつ")
            ],
            choices: ["とくべつ", "けんこう", "ひつよう"],
            explanation: "『健康=けんこう』『必要=ひつよう』『特別=とくべつ』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】慣用句と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "胸が痛む", match: "良心がとがめる"),
                QuizMatchingPair(prompt: "腹が立つ", match: "怒る"),
                QuizMatchingPair(prompt: "骨が折れる", match: "たいへん苦労する")
            ],
            choices: ["たいへん苦労する", "怒る", "良心がとがめる"],
            explanation: "慣用句の意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】接続語と はたらきが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "また", match: "つけたす"),
                QuizMatchingPair(prompt: "つまり", match: "言いかえる"),
                QuizMatchingPair(prompt: "なぜなら", match: "理由を言う")
            ],
            choices: ["理由を言う", "つけたす", "言いかえる"],
            explanation: "接続語のはたらきを確かめましょう。"
        ),

        // さらに漢字読み (38〜43)
        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『協力』",
            answer: "きょうりょく",
            explanation: "『協力』の読みは『きょうりょく』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『記録』",
            answer: "きろく",
            explanation: "『記録』の読みは『きろく』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『感謝』",
            answer: "かんしゃ",
            explanation: "『感謝』の読みは『かんしゃ』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『集中』",
            answer: "しゅうちゅう",
            explanation: "『集中』の読みは『しゅうちゅう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『目標』",
            answer: "もくひょう",
            explanation: "『目標』の読みは『もくひょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『失敗』",
            answer: "しっぱい",
            explanation: "『失敗』の読みは『しっぱい』です。"
        ),

        // さらに抜き出し (44〜45)
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、チューリップを育てたのは誰かを そのまま ぬき出しましょう。\n『学校の花壇に、一年生が丁寧に育てた チューリップが 美しく さいた。』",
            answer: "一年生が",
            acceptableAnswers: ["一年生"],
            explanation: "チューリップを育てたのは『一年生が』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、太陽のようすが分かることばを そのまま ぬき出しましょう。\n『夕暮れの空に、オレンジ色の 太陽が ゆっくりと しずんでいった。』",
            answer: "ゆっくりと しずんでいった",
            acceptableAnswers: ["ゆっくりとしずんでいった"],
            explanation: "太陽のようすが分かることばは『ゆっくりと しずんでいった』です。"
        ),

        // さらに並べ替え (46〜48)
        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["感じました", "秋の深まりを", "外を歩いていると", "冷たい風に"],
            orderedChoices: ["外を歩いていると", "冷たい風に", "秋の深まりを", "感じました"],
            explanation: "『外を歩いていると 冷たい風に 秋の深まりを 感じました。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["始めた", "じっくりと", "みんな", "問題に取り組みを", "考えながら"],
            orderedChoices: ["みんな", "じっくりと", "考えながら", "問題に取り組みを", "始めた"],
            explanation: "『みんな じっくりと 考えながら 問題に取り組みを 始めた。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、意味が通る文をつくりましょう。",
            choices: ["とめた", "大切なことを", "手帳に", "先生の話を聞きながら", "メモに"],
            orderedChoices: ["先生の話を聞きながら", "大切なことを", "手帳に", "メモに", "とめた"],
            explanation: "『先生の話を聞きながら 大切なことを 手帳に メモに とめた。』が正しい順番です。"
        ),

        // さらに組み合わせ (49〜51)
        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "失敗", match: "しっぱい"),
                QuizMatchingPair(prompt: "感謝", match: "かんしゃ"),
                QuizMatchingPair(prompt: "目標", match: "もくひょう")
            ],
            choices: ["もくひょう", "しっぱい", "かんしゃ"],
            explanation: "『失敗=しっぱい』『感謝=かんしゃ』『目標=もくひょう』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "観察", match: "じっくり見ること"),
                QuizMatchingPair(prompt: "経験", match: "実際にやってみること"),
                QuizMatchingPair(prompt: "協力", match: "力を合わせること")
            ],
            choices: ["力を合わせること", "実際にやってみること", "じっくり見ること"],
            explanation: "『観察=じっくり見ること』『経験=実際にやってみること』『協力=力を合わせること』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "記録", match: "きろく"),
                QuizMatchingPair(prompt: "集中", match: "しゅうちゅう"),
                QuizMatchingPair(prompt: "協力", match: "きょうりょく")
            ],
            choices: ["きょうりょく", "きろく", "しゅうちゅう"],
            explanation: "『記録=きろく』『集中=しゅうちゅう』『協力=きょうりょく』が正しい組み合わせです。"
        ),

        // さらに穴埋め (52〜54)
        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『ちりも ＿＿。』",
            answer: "つもれば山となる",
            acceptableAnswers: ["積もれば山となる"],
            explanation: "『ちりも積もれば山となる』は、小さなことも重なれば大きくなるという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】慣用句を完成させましょう。\n『一生けん命努力することを、骨を ＿＿ という。』",
            answer: "折る",
            acceptableAnswers: ["おる"],
            explanation: "たいへん苦労することを『骨を折る』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『文章を読んで、大事な部分を取り出してまとめることを ＿＿ といいます。』",
            answer: "要約",
            acceptableAnswers: ["ようやく"],
            explanation: "大事な部分を取り出してまとめることを『要約（ようやく）』といいます。"
        ),

        // さらに抜き出し (55〜56)
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、みなみさんが一番大切にしていることを そのまま ぬき出しましょう。\n『みなみさんは 作文で、自分が一番大切にしていることとして 友情を 書いた。』",
            answer: "友情",
            acceptableAnswers: ["ゆうじょう"],
            explanation: "みなみさんが一番大切にしていることは『友情』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、校長先生が言ったことを そのまま ぬき出しましょう。\n『校長先生は 全校集会で、「失敗をおそれず挑戦しよう」と 力強く 話した。』",
            answer: "失敗をおそれず挑戦しよう",
            acceptableAnswers: ["「失敗をおそれず挑戦しよう」"],
            explanation: "校長先生が言ったことは『失敗をおそれず挑戦しよう』です。"
        ),

        QuizQuestion(
        question: "【漢字】『はた』を漢字で書いたものはどれですか？",
        choices: [
        "旗",
        "旅",
        "島",
        "坂"
        ],
        correctAnswerIndex: 0,
        explanation: "『はた』は『旗』と書きます。"
        ),

        QuizQuestion(
        question: "【漢字】次の文の ＿＿ に入る『つく』の漢字はどれですか？\n『電車が目的地の駅に ＿＿。』",
        choices: [
        "付く",
        "着く",
        "就く",
        "点く"
        ],
        correctAnswerIndex: 1,
        explanation: "電車が目的地に着いたことを表すので、『電車が目的地の駅に着く』が正解です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】次の漢字の読みを、ひらがなで答えましょう。\n『博物館』",
        answer: "はくぶつかん",
        explanation: "『博物館』の読みは『はくぶつかん』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】漢字と読みを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "航海", match: "こうかい"),
        QuizMatchingPair(prompt: "貯金", match: "ちょきん"),
        QuizMatchingPair(prompt: "選手", match: "せんしゅ"),
        QuizMatchingPair(prompt: "祝う", match: "いわう")
        ],
        choices: ["せんしゅ", "いわう", "こうかい", "ちょきん"],
        explanation: "『航海＝こうかい』『貯金＝ちょきん』『選手＝せんしゅ』『祝う＝いわう』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【熟語】『建設』の意味として最も合うものはどれですか？",
        choices: [
        "こわれた物を元どおりに直すこと",
        "品物を店で売り買いすること",
        "建物や道路などを新しくつくること",
        "場所の広さや長さを調べること"
        ],
        correctAnswerIndex: 2,
        explanation: "『建設』は、建物や道路などを新しくつくることです。"
        ),

        QuizQuestion(
        question: "【熟語】『開始』と反対の意味を表す熟語はどれですか？",
        choices: [
        "休止",
        "途中",
        "準備",
        "終了"
        ],
        correctAnswerIndex: 3,
        explanation: "『開始』は始めることなので、反対の意味を表す熟語は『終了』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】熟語を完成させましょう。\n『二人以上がいっしょに行うことを「共 ＿＿」といいます。』",
        answer: "同",
        explanation: "『共同』は、二人以上がいっしょに行うことを表す熟語です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】熟語と意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "連続", match: "とぎれずに続くこと"),
        QuizMatchingPair(prompt: "固定", match: "動かないように決めること"),
        QuizMatchingPair(prompt: "改良", match: "直して、よりよくすること"),
        QuizMatchingPair(prompt: "周囲", match: "あるもののまわり")
        ],
        choices: ["あるもののまわり", "とぎれずに続くこと", "直して、よりよくすること", "動かないように決めること"],
        explanation: "『連続＝とぎれずに続くこと』『固定＝動かないように決めること』『改良＝直して、よりよくすること』『周囲＝あるもののまわり』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【慣用句】『目を丸くする』の意味として最も合うものはどれですか？",
        choices: [
        "とてもおどろく",
        "ねむくて目を閉じる",
        "注意深く見つめる",
        "悲しくて涙を流す"
        ],
        correctAnswerIndex: 0,
        explanation: "『目を丸くする』は、とてもおどろくことを表す慣用句です。"
        ),

        QuizQuestion(
        question: "【慣用句】『口がかたい』の意味として最も合うものはどれですか？",
        choices: [
        "食べ物をなかなかかめない",
        "秘密を他人に話さない",
        "言い方がきびしい",
        "話すのがとても速い"
        ],
        correctAnswerIndex: 1,
        explanation: "『口がかたい』は、秘密を他人に話さないことを表す慣用句です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】慣用句を完成させましょう。\n『がっかりすることを、肩を ＿＿ といいます。』",
        answer: "落とす",
        acceptableAnswers: ["おとす"],
        explanation: "『肩を落とす』は、がっかりすることを表す慣用句です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】慣用句と意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "腕を上げる", match: "わざが上手になる"),
        QuizMatchingPair(prompt: "耳をすます", match: "注意してよく聞く"),
        QuizMatchingPair(prompt: "腹を決める", match: "やると心に決める"),
        QuizMatchingPair(prompt: "心を打つ", match: "深く感動させる")
        ],
        choices: ["やると心に決める", "深く感動させる", "注意してよく聞く", "わざが上手になる"],
        explanation: "『腕を上げる＝わざが上手になる』『耳をすます＝注意してよく聞く』『腹を決める＝やると心に決める』『心を打つ＝深く感動させる』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【主語】次の文の主語はどれですか？\n『放課後、図書室で四年生の美咲さんが本を借りた。』",
        choices: [
        "放課後",
        "図書室で",
        "四年生の美咲さんが",
        "本を借りた"
        ],
        correctAnswerIndex: 2,
        explanation: "『だれが』に当たる『四年生の美咲さんが』が主語です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【修飾語】次の文で、『読んだ』を『どのように』の意味でくわしくしている言葉を答えましょう。\n『妹は、物語の本を静かに読んだ。』",
        answer: "静かに",
        acceptableAnswers: ["しずかに"],
        explanation: "『どのように読んだか』をくわしくしている修飾語は『静かに』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・述語】次の文の述語を、そのまま抜き出しましょう。\n『庭の桜のつぼみが、暖かい日差しを受けて、少しずつふくらんだ。』",
        answer: "ふくらんだ",
        explanation: "主語『庭の桜のつぼみが』について、どうしたかを表す述語は『ふくらんだ』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『主語→どこで→何を→述語』の順に並べて、正しい文をつくりましょう。",
        choices: ["新聞を", "父が", "読んだ", "居間で"],
        orderedChoices: ["父が", "居間で", "新聞を", "読んだ"],
        explanation: "『父が 居間で 新聞を 読んだ。』が、指定された順に並べた正しい文です。"
        ),

        QuizQuestion(
        question: "【段落】次の文章で、第二段落の役割として最も適切なものはどれですか？\n『第一段落　わたしたちの町では、毎月、古紙回収が行われている。\n\n第二段落　たとえば、新聞紙や段ボールを分けて集める。集めた紙は、新しい紙に生まれ変わる。』",
        choices: [
        "文章全体の結論をまとめている",
        "古紙回収に反対する意見を述べている",
        "古紙回収とは関係のない話をしている",
        "第一段落の内容を具体的に説明している"
        ],
        correctAnswerIndex: 3,
        explanation: "第二段落の役割は、『第一段落の内容を具体的に説明している』です。『たとえば』のあとに古紙回収の例を挙げています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ・段落】新しい段落を書き始めるときは、行の最初を ＿＿ 下げて書きます。",
        answer: "一字",
        acceptableAnswers: ["1字"],
        explanation: "新しい段落の書き始めは、行の最初を『一字』下げます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・段落】出来事が自然につながるように、文を正しい順に並べましょう。",
        choices: [
        "集めたごみは、種類ごとに分けてごみ箱に入れた。",
        "学校の池に、空き箱や紙くずが落ちているのを見つけた。",
        "その結果、池のまわりはすっかりきれいになった。",
        "そこで、わたしたちは池のまわりをそうじすることにした。"
        ],
        orderedChoices: [
        "学校の池に、空き箱や紙くずが落ちているのを見つけた。",
        "そこで、わたしたちは池のまわりをそうじすることにした。",
        "集めたごみは、種類ごとに分けてごみ箱に入れた。",
        "その結果、池のまわりはすっかりきれいになった。"
        ],
        explanation: "ごみを見つけ、そうじすることを決め、ごみを分け、最後にきれいになった結果を述べる順です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・段落】段落の役割と説明を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "話題を示す段落", match: "何について書くかを示す"),
        QuizMatchingPair(prompt: "理由を述べる段落", match: "なぜそう言えるかを示す"),
        QuizMatchingPair(prompt: "例を挙げる段落", match: "具体的な事例を示す"),
        QuizMatchingPair(prompt: "まとめの段落", match: "文章全体をしめくくる")
        ],
        choices: ["具体的な事例を示す", "文章全体をしめくくる", "何について書くかを示す", "なぜそう言えるかを示す"],
        explanation: "『話題を示す段落＝何について書くかを示す』『理由を述べる段落＝なぜそう言えるかを示す』『例を挙げる段落＝具体的な事例を示す』『まとめの段落＝文章全体をしめくくる』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【要点】次の段落の要点として最も適切なものはどれですか？\n『図書委員会では、返された本を毎日決まった棚に戻している。そうすると、読みたい本をすぐに見つけられ、図書室を利用しやすくなる。』",
        choices: [
        "本を決まった棚に戻すと、図書室を利用しやすくなる。",
        "図書委員は毎日たくさんの本を読んでいる。",
        "図書室には新しい棚を増やす必要がある。",
        "読みたい本は家で探したほうがよい。"
        ],
        correctAnswerIndex: 0,
        explanation: "この段落の要点は、『本を決まった棚に戻すと、図書室を利用しやすくなる。』です。"
        ),

        QuizQuestion(
        question: "【要点】次の段落の要点として最も適切なものはどれですか？\n『学校では、雨水タンクに屋根から流れる雨水をためている。ためた水は花だんの水やりに使えるので、水道の使用を減らせる。』",
        choices: [
        "雨の日には花だんに水をやらなくてよい。",
        "雨水を水やりに使うと、水道の使用を減らせる。",
        "屋根から流れる水は、すべて飲み水にできる。",
        "花だんには雨水より水道水を使うべきだ。"
        ],
        correctAnswerIndex: 1,
        explanation: "この段落の要点は、『雨水を水やりに使うと、水道の使用を減らせる。』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ・要点】本文の言葉を使って、要点を表す文を完成させましょう。\n『朝食を食べると、午前中に必要なエネルギーを補える。だから、一日を元気に始めるために朝食は大切だ。』\n『朝食は、一日を元気に始めるために ＿＿ だ。』",
        answer: "大切",
        acceptableAnswers: ["たいせつ"],
        explanation: "本文の要点は、『朝食は、一日を元気に始めるために大切だ』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・要点】次の文章から、筆者が最も伝えたい一文をそのまま抜き出しましょう。\n『地域の公園では、休日のあとに空き缶や紙くずが残っていることがある。ごみがあると、次に使う人が気持ちよく過ごせない。公園を気持ちよく使うためには、一人一人がごみを持ち帰ることが大切だ。』",
        answer: "公園を気持ちよく使うためには、一人一人がごみを持ち帰ることが大切だ",
        acceptableAnswers: ["公園を気持ちよく使うためには、一人一人がごみを持ち帰ることが大切だ。"],
        explanation: "筆者が最も伝えたい一文は、『公園を気持ちよく使うためには、一人一人がごみを持ち帰ることが大切だ』です。"
        ),

        QuizQuestion(
        question: "【物語文】次の文章から分かる真央の気持ちはどれですか？\n『発表会で名前を呼ばれると、真央は深く息を吸い、にぎっていた手をゆっくり開いた。舞台へ向かう足は少しふるえていた。』",
        choices: [
        "うれしくてたまらない",
        "腹を立てている",
        "緊張している",
        "退屈している"
        ],
        correctAnswerIndex: 2,
        explanation: "深く息を吸い、足が少しふるえている様子から、真央は『緊張している』と分かります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・物語文】次の文章から、健太が積極的になったことが分かる部分をそのまま抜き出しましょう。\n『劇の係を決めるとき、健太は初め、うつむいて何も言わなかった。けれども、友達の意見を聞くうちに、自分から大きな声で役を引き受けた。』",
        answer: "自分から大きな声で役を引き受けた",
        acceptableAnswers: ["自分から大きな声で役を引き受けた。"],
        explanation: "健太が積極的になったことは、『自分から大きな声で役を引き受けた』という行動に表れています。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・物語文】出来事が起こった順に並べましょう。",
        choices: [
        "先生が校内放送で持ち主をさがした。",
        "六年生が取りに来て、お礼を言った。",
        "校庭で小さなかぎを見つけた。",
        "見つけたかぎを職員室に届けた。"
        ],
        orderedChoices: [
        "校庭で小さなかぎを見つけた。",
        "見つけたかぎを職員室に届けた。",
        "先生が校内放送で持ち主をさがした。",
        "六年生が取りに来て、お礼を言った。"
        ],
        explanation: "かぎを見つけ、職員室に届け、放送で持ち主をさがし、最後に持ち主が取りに来る順です。"
        ),

        QuizQuestion(
        question: "【説明文】次の文章を読み、タンポポの種の白い毛が、種を遠くまで運ぶのに役立つ理由を選びましょう。\n『タンポポの種には、細くて白い毛がついている。この毛が空気を受けるため、種はゆっくり落ちながら風に運ばれる。』",
        choices: [
        "毛が地面を強く押すから",
        "毛が雨水をたくさんためるから",
        "毛が種を重くするから",
        "毛が空気を受け、種がゆっくり落ちるから"
        ],
        correctAnswerIndex: 3,
        explanation: "正解は『毛が空気を受け、種がゆっくり落ちるから』です。そのため、種は風に運ばれやすくなります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・説明文】次の文章から、アリが地面につけるものをそのまま抜き出しましょう。\n『アリは、えさを見つけると、においの道しるべを地面につけながら巣へ戻る。仲間のアリは、そのにおいをたどって、えさの場所へ向かう。』",
        answer: "においの道しるべ",
        explanation: "アリが地面につけるものは、『においの道しるべ』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・説明文】『話題→理由→具体例→まとめ』の順になるように、文を並べましょう。",
        choices: [
        "たとえば、ティッシュペーパーは水をすばやく吸う。",
        "このように、紙の性質は種類ごとに異なる。",
        "紙は、種類によって水のしみこみ方がちがう。",
        "これは、紙の表面のつくりがそれぞれ異なるからだ。"
        ],
        orderedChoices: [
        "紙は、種類によって水のしみこみ方がちがう。",
        "これは、紙の表面のつくりがそれぞれ異なるからだ。",
        "たとえば、ティッシュペーパーは水をすばやく吸う。",
        "このように、紙の性質は種類ごとに異なる。"
        ],
        explanation: "最初に話題を示し、次に理由を述べ、具体例を挙げ、最後に『このように』でまとめる順です。"
        ),
        QuizQuestion(
        question: "【漢字】次の文の『つつむ』を漢字で書いたものはどれですか？\n『おくり物を色紙でつつむ。』",
        choices: [
        "包む",
        "囲む",
        "積む",
        "畳む"
        ],
        correctAnswerIndex: 0,
        explanation: "おくり物を紙などでおおうことは、『包む』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】次の熟語の読みを、ひらがなで答えましょう。\n『周辺』",
        answer: "しゅうへん",
        explanation: "『周辺』の読みは『しゅうへん』です。"
        ),

        QuizQuestion(
        question: "【漢字】次の文の『あらためる』を漢字で書いたものはどれですか？\n『生活のしかたをあらためる。』",
        choices: [
        "求める",
        "改める",
        "認める",
        "進める"
        ],
        correctAnswerIndex: 1,
        explanation: "よくない点などを直すことは、『改める』と書きます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・漢字】漢字と読みを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "衣類", match: "いるい"),
        QuizMatchingPair(prompt: "無事", match: "ぶじ"),
        QuizMatchingPair(prompt: "兵隊", match: "へいたい"),
        QuizMatchingPair(prompt: "連なる", match: "つらなる")
        ],
        choices: ["へいたい", "つらなる", "いるい", "ぶじ"],
        explanation: "『衣類＝いるい』『無事＝ぶじ』『兵隊＝へいたい』『連なる＝つらなる』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【熟語】『未定』の意味として最も合うものはどれですか？",
        choices: [
        "前から決まっていること",
        "一度決めたことを変えること",
        "まだ決まっていないこと",
        "決めたことを知らせること"
        ],
        correctAnswerIndex: 2,
        explanation: "『未定』は、まだ決まっていないことを表す熟語です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【熟語】文の ＿＿ に入る漢字一字を答えましょう。\n『学校を休むことを「欠 ＿＿」といいます。』",
        answer: "席",
        explanation: "学校や会合などを休むことは、『欠席』といいます。"
        ),

        QuizQuestion(
        question: "【熟語】『長所』と反対の意味を表す熟語はどれですか？",
        choices: [
        "特長",
        "要所",
        "短期",
        "短所"
        ],
        correctAnswerIndex: 3,
        explanation: "『長所』はよいところを表すので、反対の意味を表す熟語は『短所』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・熟語】熟語と意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "往復", match: "行って帰ること"),
        QuizMatchingPair(prompt: "増加", match: "数や量が増えること"),
        QuizMatchingPair(prompt: "欠点", match: "足りないところ"),
        QuizMatchingPair(prompt: "名案", match: "すぐれた考え")
        ],
        choices: ["足りないところ", "すぐれた考え", "行って帰ること", "数や量が増えること"],
        explanation: "『往復＝行って帰ること』『増加＝数や量が増えること』『欠点＝足りないところ』『名案＝すぐれた考え』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【慣用句】『首を長くする』の意味として最も合うものはどれですか？",
        choices: [
        "楽しみに待つ",
        "遠くを見渡す",
        "姿勢をよくする",
        "急いで出かける"
        ],
        correctAnswerIndex: 0,
        explanation: "『首を長くする』は、今か今かと楽しみに待つことを表す慣用句です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【慣用句】慣用句を完成させましょう。\n『よい考えが出るように工夫して考えることを、頭を ＿＿ といいます。』",
        answer: "ひねる",
        acceptableAnswers: ["捻る"],
        explanation: "工夫しながら考えることを、『頭をひねる』といいます。"
        ),

        QuizQuestion(
        question: "【慣用句】『胸を張る』の意味として最も合うものはどれですか？",
        choices: [
        "深く息を吸って休む",
        "自信を持って堂々とする",
        "心配して落ち着かなくなる",
        "相手に強く言い返す"
        ],
        correctAnswerIndex: 1,
        explanation: "『胸を張る』は、自信を持って堂々とすることを表す慣用句です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・慣用句】慣用句と意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "力を貸す", match: "手伝う"),
        QuizMatchingPair(prompt: "息をのむ", match: "おどろきや感動で一瞬息が止まる"),
        QuizMatchingPair(prompt: "話に花が咲く", match: "会話がはずむ"),
        QuizMatchingPair(prompt: "歯が立たない", match: "相手が強くてかなわない")
        ],
        choices: ["会話がはずむ", "相手が強くてかなわない", "手伝う", "おどろきや感動で一瞬息が止まる"],
        explanation: "『力を貸す＝手伝う』『息をのむ＝おどろきや感動で一瞬息が止まる』『話に花が咲く＝会話がはずむ』『歯が立たない＝相手が強くてかなわない』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【修飾語】次の文で、『夕日』を『どのような』の意味で詳しくしている言葉はどれですか？\n『夕方、赤い夕日が西の山に沈んだ。』",
        choices: [
        "夕方",
        "西の山に",
        "赤い",
        "沈んだ"
        ],
        correctAnswerIndex: 2,
        explanation: "『どのような夕日か』を詳しくしている修飾語は、『赤い』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【述語】次の文の述語を答えましょう。\n『弟の作った紙飛行機が高く飛んだ。』",
        answer: "飛んだ",
        acceptableAnswers: ["とんだ"],
        explanation: "主語『弟の作った紙飛行機が』について、どうしたかを表す述語は『飛んだ』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・主語】次の文から、主語をそのまま抜き出しましょう。\n『雨上がりの道を、小さなかたつむりがゆっくり進んでいた。』",
        answer: "小さなかたつむりが",
        explanation: "『何が進んでいたか』に当たる主語は、『小さなかたつむりが』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文の組み立て】『主語→何を→どのように→述語』の順に並べて、正しい文をつくりましょう。",
        choices: ["古い写真を", "しまった", "姉が", "大切に"],
        orderedChoices: ["姉が", "古い写真を", "大切に", "しまった"],
        explanation: "『姉が 古い写真を 大切に しまった。』が正しい順番です。"
        ),

        QuizQuestion(
        question: "【段落】次の文章で、第三段落の役割として最も適切なものはどれですか？\n『第一段落　朝の読書では、毎日同じ時刻に本を読みます。\n\n第二段落　静かな時間に読むと、物語に集中しやすくなります。また、知らない言葉にも出会えます。\n\n第三段落　このように、朝の読書には、落ち着いて一日を始められるよさがあります。』",
        choices: [
        "朝の読書の具体例を新しく挙げている",
        "朝の読書に反対する意見を述べている",
        "朝の読書とは別の話題を示している",
        "前の段落までの内容をまとめている"
        ],
        correctAnswerIndex: 3,
        explanation: "第三段落は、『このように』に続けて、前の段落までの内容をまとめています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【段落】文の ＿＿ に入る言葉を答えましょう。\n『第一段落で問いを示し、次の段落でその ＿＿ を書く組み立てがあります。』",
        answer: "答え",
        acceptableAnswers: ["こたえ"],
        explanation: "問いを示した段落のあとに、その『答え』を書く組み立てがあります。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・段落】文章の流れが『全体の説明→一つ目→二つ目→まとめ』になるように並べましょう。",
        choices: [
        "どちらの方法でも、返す人が使いやすいように工夫されている。",
        "一つは、開館中に受付へ本を返す方法である。",
        "町の図書館には、本を返す方法が二つある。",
        "もう一つは、閉館後に返却ポストへ入れる方法である。"
        ],
        orderedChoices: [
        "町の図書館には、本を返す方法が二つある。",
        "一つは、開館中に受付へ本を返す方法である。",
        "もう一つは、閉館後に返却ポストへ入れる方法である。",
        "どちらの方法でも、返す人が使いやすいように工夫されている。"
        ],
        explanation: "最初に全体を説明し、一つ目と二つ目を順に示して、最後に共通するまとめを述べます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・段落】段落の内容と役割を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "原因を述べる段落", match: "なぜ起きたかを示す"),
        QuizMatchingPair(prompt: "結果を述べる段落", match: "そのあとどうなったかを示す"),
        QuizMatchingPair(prompt: "二つを比べる段落", match: "二つのちがいを示す"),
        QuizMatchingPair(prompt: "内容を補う段落", match: "前の説明に情報を付け加える")
        ],
        choices: ["二つのちがいを示す", "前の説明に情報を付け加える", "なぜ起きたかを示す", "そのあとどうなったかを示す"],
        explanation: "『原因＝なぜ起きたか』『結果＝そのあとどうなったか』『比較＝二つのちがい』『補足＝情報の付け加え』を表します。"
        ),

        QuizQuestion(
        question: "【要点】次の段落の要点として最も適切なものはどれですか？\n『校内放送では、話す速さが大切だ。速すぎると聞き取りにくく、遅すぎると内容が伝わりにくい。聞く人を考え、落ち着いた速さで話す必要がある。』",
        choices: [
        "校内放送は、聞く人を考えて落ち着いた速さで話すことが大切だ。",
        "校内放送では、できるだけ速く話すほうがよい。",
        "校内放送の内容は、短ければ何でもよい。",
        "校内放送は、聞く人より話す人の都合を優先する。"
        ],
        correctAnswerIndex: 0,
        explanation: "この段落の要点は、『校内放送は、聞く人を考えて落ち着いた速さで話すことが大切だ。』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【要点】国語の言葉を答えましょう。\n『段落の中で、内容の中心となる文を ＿＿ といいます。』",
        answer: "中心文",
        acceptableAnswers: ["ちゅうしんぶん"],
        explanation: "段落の内容の中心となる文を、『中心文』といいます。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・要点】次の文章から、筆者が最も伝えたい一文をそのまま抜き出しましょう。\n『学校のうさぎ小屋は、毎日当番がそうじしている。えさの量や水の様子も記録する。動物を元気に育てるには、毎日の世話を続けることが大切だ。』",
        answer: "動物を元気に育てるには、毎日の世話を続けることが大切だ",
        acceptableAnswers: ["動物を元気に育てるには、毎日の世話を続けることが大切だ。"],
        explanation: "筆者が最も伝えたい一文は、『動物を元気に育てるには、毎日の世話を続けることが大切だ』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・要点】要点が伝わる一文になるように、言葉を正しい順に並べましょう。",
        choices: ["節電につながる", "使わない教室の明かりを消すことは", "大切な行動だ", "電気のむだを減らし"],
        orderedChoices: ["使わない教室の明かりを消すことは", "電気のむだを減らし", "節電につながる", "大切な行動だ"],
        explanation: "『使わない教室の明かりを消すことは 電気のむだを減らし 節電につながる 大切な行動だ。』が正しい順番です。"
        ),

        QuizQuestion(
        question: "【物語文】次の文章から分かる遥の気持ちとして最も適切なものはどれですか？\n『転校する友達から手紙を受け取ると、遥は何度も読み返し、そっと机の引き出しにしまった。』",
        choices: [
        "手紙の内容に腹を立てている",
        "手紙を大切にしたいと思っている",
        "手紙をすぐに捨てたいと思っている",
        "手紙を読まずに忘れたいと思っている"
        ],
        correctAnswerIndex: 1,
        explanation: "何度も読み返して、そっとしまう様子から、遥は手紙を大切にしたいと思っていると分かります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・物語文】次の文章から、直人が安心したことが分かる部分をそのまま抜き出しましょう。\n『探していた子猫が物置の下から出てくると、直人はこわばっていた顔をゆるめた。』",
        answer: "こわばっていた顔をゆるめた",
        acceptableAnswers: ["こわばっていた顔をゆるめた。"],
        explanation: "直人が安心したことは、『こわばっていた顔をゆるめた』という様子に表れています。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・物語文】出来事が起こった順に並べましょう。",
        choices: [
        "夏になり、青い花が咲いた。",
        "翔は祖父から朝顔の種をもらった。",
        "植木鉢に種をまいた。",
        "毎朝、忘れずに水をやった。"
        ],
        orderedChoices: [
        "翔は祖父から朝顔の種をもらった。",
        "植木鉢に種をまいた。",
        "毎朝、忘れずに水をやった。",
        "夏になり、青い花が咲いた。"
        ],
        explanation: "種をもらい、植木鉢にまき、毎朝水をやり、最後に花が咲く順です。"
        ),

        QuizQuestion(
        question: "【説明文】次の文章を読み、冷たい容器の表面に水滴がつく理由を選びましょう。\n『冷たい水を入れた容器を置いておくと、外側に水滴がつく。これは、空気中の水蒸気が容器の近くで冷やされ、水に変わるためである。』",
        choices: [
        "容器の中の水が外へしみ出すから",
        "容器の表面の氷がとけるから",
        "空気中の水蒸気が冷やされて水に変わるから",
        "容器が新しく水をつくり出すから"
        ],
        correctAnswerIndex: 2,
        explanation: "水滴がつくのは、空気中の水蒸気が冷やされて水に変わるからです。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・説明文】次の文章から、渡り鳥が体にたくわえるものをそのまま抜き出しましょう。\n『渡り鳥の中には、長い旅に出る前にたくさんえさを食べ、体に脂肪をたくわえるものがいる。脂肪は飛び続けるためのエネルギーになる。』",
        answer: "脂肪",
        explanation: "渡り鳥が体にたくわえるものは、『脂肪』です。"
        ),

        QuizQuestion(
        question: "【説明文】次の文章で、第二文が果たしている役割として最も適切なものはどれですか？\n『竹の茎には、一定の間隔で節がある。節の部分はほかの部分よりかたく、強い風を受けたときに茎が折れにくくなる。』",
        choices: [
        "竹以外の植物の例を挙げている",
        "第一文と反対の意見を述べている",
        "竹が育つ順番を説明している",
        "節の働きと、茎が折れにくい理由を説明している"
        ],
        correctAnswerIndex: 3,
        explanation: "第二文は、節の部分の働きと、そのために竹の茎が折れにくくなることを説明しています。"
        ),
        QuizQuestion(
        question: "【漢字】次の文の『しお』を漢字で書いたものはどれですか？\n『海水からしおを作る。』",
        choices: [
        "塩",
        "岸",
        "湖",
        "港"
        ],
        correctAnswerIndex: 0,
        explanation: "海水から作る『しお』は、『塩』と書きます。"
        ),

        QuizQuestion(
        question: "【漢字】『うめ』を漢字で書いたものはどれですか？\n『庭のうめの花が開いた。』",
        choices: [
        "松",
        "梅",
        "桜",
        "桃"
        ],
        correctAnswerIndex: 1,
        explanation: "『うめ』は『梅』と書きます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【漢字の読み】次の熟語の読みを、ひらがなで答えましょう。\n『牧場』",
        answer: "ぼくじょう",
        explanation: "『牧場』の読みは『ぼくじょう』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・漢字】漢字と読みを正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "積む", match: "つむ"),
        QuizMatchingPair(prompt: "残る", match: "のこる"),
        QuizMatchingPair(prompt: "省く", match: "はぶく"),
        QuizMatchingPair(prompt: "清い", match: "きよい")
        ],
        choices: ["はぶく", "きよい", "つむ", "のこる"],
        explanation: "『積む＝つむ』『残る＝のこる』『省く＝はぶく』『清い＝きよい』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【熟語】『反省』の意味として最も合うものはどれですか？",
        choices: [
        "自分の考えを人に強く伝えること",
        "前にしたことをすっかり忘れること",
        "自分の行いを振り返り、よくなかった点を考えること",
        "これから行うことを細かく決めること"
        ],
        correctAnswerIndex: 2,
        explanation: "『反省』は、自分の行いを振り返り、よくなかった点を考えることです。"
        ),

        QuizQuestion(
        question: "【熟語】『共通』の意味として最も合うものはどれですか？",
        choices: [
        "一人だけが知っていること",
        "二つのものが正反対であること",
        "物事を順番に分けること",
        "二つ以上のものに同じ点があること"
        ],
        correctAnswerIndex: 3,
        explanation: "『共通』は、二つ以上のものに同じ点があることです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【熟語】文の ＿＿ に入る漢字一字を答えましょう。\n『品物を作り出すことを「生 ＿＿」といいます。』",
        answer: "産",
        explanation: "品物を作り出すことは、『生産』といいます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・熟語】熟語と意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "順序", match: "物事を行う決まった並び方"),
        QuizMatchingPair(prompt: "選択", match: "いくつかの中から選ぶこと"),
        QuizMatchingPair(prompt: "伝達", match: "知らせや考えを相手に伝えること"),
        QuizMatchingPair(prompt: "保存", match: "そのままの状態で残しておくこと")
        ],
        choices: [
        "知らせや考えを相手に伝えること",
        "そのままの状態で残しておくこと",
        "物事を行う決まった並び方",
        "いくつかの中から選ぶこと"
        ],
        explanation: "『順序＝物事を行う決まった並び方』『選択＝いくつかの中から選ぶこと』『伝達＝知らせや考えを相手に伝えること』『保存＝そのままの状態で残しておくこと』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【慣用句】『口をはさむ』の意味として最も合うものはどれですか？",
        choices: [
        "人が話している途中で意見を言う",
        "食べ物を口に入れたまま話す",
        "言いたいことを最後までがまんする",
        "同じ話を何度もくり返す"
        ],
        correctAnswerIndex: 0,
        explanation: "『口をはさむ』は、人が話している途中で意見を言うことです。"
        ),

        QuizQuestion(
        question: "【慣用句】『足を運ぶ』の意味として最も合うものはどれですか？",
        choices: [
        "荷物を足で動かす",
        "ある場所へわざわざ行く",
        "急いで走って帰る",
        "歩き方を練習する"
        ],
        correctAnswerIndex: 1,
        explanation: "『足を運ぶ』は、ある場所へわざわざ行くことです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【慣用句】慣用句を完成させましょう。\n『なかなか行動しなかった人が、やっと始めることを、腰を ＿＿ といいます。』",
        answer: "上げる",
        acceptableAnswers: ["あげる"],
        explanation: "やっと行動を始めることを、『腰を上げる』といいます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・慣用句】慣用句と意味を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "息が合う", match: "動きや考えがぴったり合う"),
        QuizMatchingPair(prompt: "目がない", match: "大好きで夢中になる"),
        QuizMatchingPair(prompt: "手に汗をにぎる", match: "はらはらして緊張する"),
        QuizMatchingPair(prompt: "口をそろえる", match: "多くの人が同じことを言う")
        ],
        choices: [
        "大好きで夢中になる",
        "多くの人が同じことを言う",
        "はらはらして緊張する",
        "動きや考えがぴったり合う"
        ],
        explanation: "『息が合う＝動きや考えがぴったり合う』『目がない＝大好きで夢中になる』『手に汗をにぎる＝はらはらして緊張する』『口をそろえる＝多くの人が同じことを言う』が正しい組み合わせです。"
        ),

        QuizQuestion(
        question: "【修飾語】次の文で、『流れた』を『どのように』の意味で詳しくしている言葉はどれですか？\n『青空を白い雲がゆっくり流れた。』",
        choices: [
        "青空を",
        "白い",
        "ゆっくり",
        "雲が"
        ],
        correctAnswerIndex: 2,
        explanation: "『どのように流れたか』を詳しくしている言葉は、『ゆっくり』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【述語】次の文の述語を答えましょう。\n『教室の時計は、昼休みから止まっていた。』",
        answer: "止まっていた",
        acceptableAnswers: ["とまっていた"],
        explanation: "主語『教室の時計は』について、どうしていたかを表す述語は『止まっていた』です。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・主語】次の文から、主語をそのまま抜き出しましょう。\n『夏休みの終わりに、兄から届いた絵はがきが机の上に置いてあった。』",
        answer: "兄から届いた絵はがきが",
        explanation: "『何が置いてあったか』に当たる主語は、『兄から届いた絵はがきが』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・文の組み立て】『主語→どこに→何を→どのように→述語』の順に並べて、正しい文をつくりましょう。",
        choices: ["ぬれたかさを", "置いた", "妹が", "静かに", "玄関に"],
        orderedChoices: ["妹が", "玄関に", "ぬれたかさを", "静かに", "置いた"],
        explanation: "『妹が 玄関に ぬれたかさを 静かに 置いた。』が正しい順番です。"
        ),

        QuizQuestion(
        question: "【段落】次の文章で、第二段落の役割として最も適切なものはどれですか？\n『第一段落　学校の屋上には、小さな気象観測の場所がある。\n\n第二段落　そこでは、毎日同じ時刻に気温や風向きを調べ、記録している。\n\n第三段落　記録を続けると、季節による天気の変化が分かる。』",
        choices: [
        "文章全体の結論だけを述べている",
        "屋上とは関係のない出来事を紹介している",
        "気象観測をやめる理由を述べている",
        "観測の場所で何をしているかを具体的に説明している"
        ],
        correctAnswerIndex: 3,
        explanation: "第二段落は、観測の場所で気温や風向きを調べ、記録していることを具体的に説明しています。"
        ),

        QuizQuestion.fillInBlank(
        question: "【段落】文章の内容に合うように、段落につける短い題を ＿＿ といいます。",
        answer: "小見出し",
        acceptableAnswers: ["こみだし"],
        explanation: "段落の内容が分かるようにつける短い題を、『小見出し』といいます。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・段落】文章の流れが自然になるように、文を正しい順に並べましょう。",
        choices: [
        "最後に、調べたことを地図と表にまとめた。",
        "まず、町にある安全な場所をみんなで予想した。",
        "その後、実際に町を歩いて確かめた。",
        "社会科の学習で、町の防災について調べることになった。"
        ],
        orderedChoices: [
        "社会科の学習で、町の防災について調べることになった。",
        "まず、町にある安全な場所をみんなで予想した。",
        "その後、実際に町を歩いて確かめた。",
        "最後に、調べたことを地図と表にまとめた。"
        ],
        explanation: "調べる課題を示し、『まず』『その後』『最後に』の順で学習の進み方を述べます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ・段落】段落どうしの関係と説明を正しく組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "問いと答え", match: "疑問を示したあとで、その答えを述べる"),
        QuizMatchingPair(prompt: "原因と結果", match: "起きたわけと、そのあとどうなったかを述べる"),
        QuizMatchingPair(prompt: "全体と部分", match: "全体を示したあとで、一つ一つを詳しく述べる"),
        QuizMatchingPair(prompt: "意見と理由", match: "考えを示したあとで、そう考えるわけを述べる")
        ],
        choices: [
        "全体を示したあとで、一つ一つを詳しく述べる",
        "考えを示したあとで、そう考えるわけを述べる",
        "疑問を示したあとで、その答えを述べる",
        "起きたわけと、そのあとどうなったかを述べる"
        ],
        explanation: "『問いと答え』『原因と結果』『全体と部分』『意見と理由』の関係を、それぞれの説明と結びつけます。"
        ),

        QuizQuestion(
        question: "【要点】次の段落の要点として最も適切なものはどれですか？\n『学校のくつ箱では、上ばきのかかとを手前にそろえて入れる決まりになっている。向きをそろえると、自分の上ばきを見つけやすく、出し入れもしやすい。』",
        choices: [
        "上ばきの向きをそろえると、見つけやすく出し入れもしやすい。",
        "上ばきは毎日新しいものに取り替えるとよい。",
        "くつ箱には外ばきだけを入れる決まりがある。",
        "上ばきの色は全員同じでなければならない。"
        ],
        correctAnswerIndex: 0,
        explanation: "この段落の要点は、『上ばきの向きをそろえると、見つけやすく出し入れもしやすい。』です。"
        ),

        QuizQuestion(
        question: "【要点】次の段落の要点として最も適切なものはどれですか？\n『校庭の木には、名前を書いた札がつけられている。札を見ると、木の名前だけでなく、花が咲く季節や実の特徴も知ることができる。』",
        choices: [
        "校庭の木は、すべて同じ季節に花が咲く。",
        "木の札を見ると、名前や花の季節、実の特徴が分かる。",
        "木の札は、校庭で遊ぶ場所を示している。",
        "校庭の木には、実がならないものはない。"
        ],
        correctAnswerIndex: 1,
        explanation: "この段落の要点は、『木の札を見ると、名前や花の季節、実の特徴が分かる。』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【要点】本文の言葉を使って、要点を表す文を完成させましょう。\n『給食で出た野菜くずを細かくして土に混ぜると、やがて植物を育てる肥料になる。ごみを減らしながら、土の栄養も増やせる。』\n『野菜くずを土に混ぜると、ごみを減らしながら、土の ＿＿ も増やせる。』",
        answer: "栄養",
        acceptableAnswers: ["えいよう"],
        explanation: "本文の要点は、野菜くずを土に混ぜると、ごみを減らしながら『土の栄養』も増やせることです。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・要点】次の文章から、筆者が最も伝えたい一文をそのまま抜き出しましょう。\n『朝の会で、その日の予定を全員で確かめている。予定を知っていると、次の行動を考えて準備できる。学校生活を落ち着いて送るためには、一日の見通しを持つことが大切だ。』",
        answer: "学校生活を落ち着いて送るためには、一日の見通しを持つことが大切だ",
        acceptableAnswers: ["学校生活を落ち着いて送るためには、一日の見通しを持つことが大切だ。"],
        explanation: "筆者が最も伝えたい一文は、『学校生活を落ち着いて送るためには、一日の見通しを持つことが大切だ』です。"
        ),

        QuizQuestion(
        question: "【物語文】次の文章から分かる陽菜の気持ちとして最も適切なものはどれですか？\n『陽菜は、なくしたと思っていたしおりを本の間に見つけた。しおりを胸に当てると、大きく息をはいた。』",
        choices: [
        "しおりを見つけて怒っている",
        "しおりをだれかにあげたいと思っている",
        "しおりが見つかって安心している",
        "しおりを見つけても困っている"
        ],
        correctAnswerIndex: 2,
        explanation: "しおりを胸に当てて大きく息をはく様子から、陽菜はしおりが見つかって安心していると分かります。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・物語文】次の文章から、悠斗が決心したことが分かる部分をそのまま抜き出しましょう。\n『リレーの選手に選ばれた悠斗は、初めは自信がなくて返事ができなかった。しばらく考えたあと、顔を上げて「やります」と答えた。』",
        answer: "顔を上げて「やります」と答えた",
        acceptableAnswers: ["顔を上げて「やります」と答えた。"],
        explanation: "悠斗が決心したことは、『顔を上げて「やります」と答えた』という行動に表れています。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・物語文】出来事が起こった順に並べましょう。",
        choices: [
        "翌朝、巣箱の近くで小鳥の声が聞こえた。",
        "木の板を切り、くぎで組み立てた。",
        "完成した巣箱を庭の木に取りつけた。",
        "祖母から巣箱の作り方を教わった。"
        ],
        orderedChoices: [
        "祖母から巣箱の作り方を教わった。",
        "木の板を切り、くぎで組み立てた。",
        "完成した巣箱を庭の木に取りつけた。",
        "翌朝、巣箱の近くで小鳥の声が聞こえた。"
        ],
        explanation: "作り方を教わり、巣箱を組み立て、木に取りつけ、翌朝に小鳥の声を聞く順です。"
        ),

        QuizQuestion(
        question: "【説明文】次の文章を読み、魔法瓶の中の飲み物が冷めにくい理由を選びましょう。\n『魔法瓶の内側は、二重の壁になっている。壁と壁の間は熱が伝わりにくい作りなので、中の飲み物の温度が変わりにくい。』",
        choices: [
        "外側の壁が飲み物を増やすから",
        "ふたから冷たい空気を入れるから",
        "中の飲み物が自分で熱を作るから",
        "二重の壁の間は熱が伝わりにくいから"
        ],
        correctAnswerIndex: 3,
        explanation: "魔法瓶の中の飲み物が冷めにくいのは、二重の壁の間は熱が伝わりにくいからです。"
        ),

        QuizQuestion.extractText(
        question: "【抜き出し・説明文】次の文章から、ヤモリの足の裏にあるものをそのまま抜き出しましょう。\n『ヤモリは、かべや天井を落ちずに歩くことができる。足の裏にある細かな毛が、かべの表面にくっつくためである。』",
        answer: "細かな毛",
        explanation: "ヤモリの足の裏にあるものは、『細かな毛』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え・説明文】『話題→仕組み→結果→まとめ』の順になるように、文を並べましょう。",
        choices: [
        "そのため、少ない力でも重い物を持ち上げやすくなる。",
        "このように、てこは小さい力で重い物を動かすのに役立つ道具である。",
        "てこは、棒を支点にして動かす仕組みである。",
        "支点から遠い所を押すと、力が大きく働く。"
        ],
        orderedChoices: [
        "てこは、棒を支点にして動かす仕組みである。",
        "支点から遠い所を押すと、力が大きく働く。",
        "そのため、少ない力でも重い物を持ち上げやすくなる。",
        "このように、てこは小さい力で重い物を動かすのに役立つ道具である。"
        ],
        explanation: "てこの仕組みを示し、力の働きとその結果を説明して、最後に役割をまとめる順です。"
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
            quizLevel: .kokugo4,
            authManager: authManager,
            audioManager: audioManager,
            isPresenting: $isPresenting,
            interstitial: sharedInterstitial
        )
    }
}

struct Kokugo4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo4ListView(isPresenting: .constant(false))
    }
}
