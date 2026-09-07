//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo6ListView: View {
    @Binding var isPresenting: Bool

    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】説明を完成させましょう。\n『「光陰矢のごとし」は、時間がとても早く ＿＿ ことを表します。』",
            answer: "過ぎる",
            acceptableAnswers: ["すぎる"],
            explanation: "『光陰矢のごとし』は、時間がとても早く過ぎることを表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】ことわざを完成させましょう。\n『継続は ＿＿。』",
            answer: "力なり",
            acceptableAnswers: ["ちからなり"],
            explanation: "『継続は力なり』は、続けることで力がつくという意味です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『多くの人が 心を一つにして 取り組むことを ＿＿ といいます。』",
            answer: "一致団結",
            acceptableAnswers: ["いっちだんけつ"],
            explanation: "多くの人が心を一つにして取り組むことを『一致団結』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『文章の中で、筆者が 最も強く 伝えたい考えを ＿＿ といいます。』",
            answer: "主張",
            acceptableAnswers: ["しゅちょう"],
            explanation: "筆者が最も強く伝えたい考えを『主張』といいます。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、言葉にしなくても心が通じ合うことを表す四字熟語を そのまま ぬき出しましょう。\n『言葉にしなくても心が通じ合うことを「以心伝心」という。』",
            answer: "以心伝心",
            acceptableAnswers: ["いしんでんしん"],
            explanation: "言葉にしなくても心が通じ合うことを表す四字熟語は『以心伝心』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、先生が 送ったものを そのまま ぬき出しましょう。\n『卒業を前に、先生は 一人一人に 温かい言葉を 送った。』",
            answer: "温かい言葉",
            acceptableAnswers: ["温かい 言葉", "あたたかいことば", "あたたかい 言葉"],
            explanation: "先生が送ったものは『温かい言葉』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、発表者が 話したようすが分かることばを そのまま ぬき出しましょう。\n『発表者は 聞き手の反応を 見ながら、伝えたいことを ゆっくり話した。』",
            answer: "聞き手の反応を 見ながら",
            acceptableAnswers: ["聞き手の反応を見ながら", "ききてのはんのうをみながら"],
            explanation: "発表者が話したようすが分かることばは『聞き手の反応を 見ながら』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、表に まとめたものを そのまま ぬき出しましょう。\n『わたしたちは 資料を 読み取り、そこから 分かる変化を 表に まとめた。』",
            answer: "分かる変化",
            acceptableAnswers: ["分かる 変化", "わかるへんか", "わかる 変化"],
            explanation: "表にまとめたものは『分かる変化』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["見えなかったことが", "分かるようになる", "経験を重ねると", "少しずつ"],
            orderedChoices: ["経験を重ねると", "見えなかったことが", "少しずつ", "分かるようになる"],
            explanation: "『経験を重ねると 見えなかったことが 少しずつ 分かるようになる。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["大切だ", "事実と意見を", "分けて読むことが", "筆者の主張を 確かめるには"],
            orderedChoices: ["筆者の主張を 確かめるには", "事実と意見を", "分けて読むことが", "大切だ"],
            explanation: "『筆者の主張を 確かめるには 事実と意見を 分けて読むことが 大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["述べるようにした", "相手の考えを 受け止めた上で", "自分の意見を"],
            orderedChoices: ["相手の考えを 受け止めた上で", "自分の意見を", "述べるようにした"],
            explanation: "『相手の考えを 受け止めた上で 自分の意見を 述べるようにした。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["はっきり 見えてくる", "集めた情報を 整理すると", "問題の中心が"],
            orderedChoices: ["集めた情報を 整理すると", "問題の中心が", "はっきり 見えてくる"],
            explanation: "『集めた情報を 整理すると 問題の中心が はっきり 見えてくる。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】四字熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "画竜点睛", match: "最後の大事な仕上げ"),
                QuizMatchingPair(prompt: "以心伝心", match: "言葉にしなくても心が通じる"),
                QuizMatchingPair(prompt: "電光石火", match: "非常にすばやいこと")
            ],
            choices: ["最後の大事な仕上げ", "非常にすばやいこと", "言葉にしなくても心が通じる"],
            explanation: "『画竜点睛=最後の大事な仕上げ』『以心伝心=言葉にしなくても心が通じる』『電光石火=非常にすばやいこと』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】表現の しかたと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "比喩", match: "何かに たとえる 表現"),
                QuizMatchingPair(prompt: "反復", match: "同じことばを くり返す 表現"),
                QuizMatchingPair(prompt: "擬人法", match: "人のようすのように 表す 表現")
            ],
            choices: ["同じことばを くり返す 表現", "人のようすのように 表す 表現", "何かに たとえる 表現"],
            explanation: "表現のしかたと意味を結びつけて覚えましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "主張", match: "いちばん 伝えたい考え"),
                QuizMatchingPair(prompt: "事例", match: "説明のための 具体例"),
                QuizMatchingPair(prompt: "理由", match: "そう考える わけ")
            ],
            choices: ["そう考える わけ", "いちばん 伝えたい考え", "説明のための 具体例"],
            explanation: "説明文や意見文で使うことばの意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことわざと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "継続は力なり", match: "続けることで 力がつく"),
                QuizMatchingPair(prompt: "塵も積もれば山となる", match: "小さなことも 重なれば大きくなる"),
                QuizMatchingPair(prompt: "情けは人のためならず", match: "親切は めぐって 自分のためになる")
            ],
            choices: ["小さなことも 重なれば大きくなる", "親切は めぐって 自分のためになる", "続けることで 力がつく"],
            explanation: "ことわざの意味を場面と合わせて理解しましょう。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を完成させましょう。\n『温故 ＿＿』",
            answer: "知新",
            acceptableAnswers: ["ちしん"],
            explanation: "『温故知新』は、昔のことを学んで新しい知識を得ることを表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『尊重』",
            answer: "そんちょう",
            explanation: "『尊重』の読みは『そんちょう』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者が 冒頭で 問いかけた言葉を そのまま ぬき出しましょう。\n『筆者は 冒頭で、「本当に必要なものは何か」と 問いかけた。』",
            answer: "本当に必要なものは何か",
            acceptableAnswers: ["「本当に必要なものは何か」"],
            explanation: "筆者が冒頭で問いかけた言葉は『本当に必要なものは何か』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、わたしたちが 見つけたものを そのまま ぬき出しましょう。\n『わたしたちは 複数の資料を 見比べて、共通する課題を 見つけた。』",
            answer: "共通する課題",
            acceptableAnswers: ["共通する 課題", "きょうつうするかだい"],
            explanation: "わたしたちが見つけたものは『共通する課題』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["まとめることが", "大切だ", "事実を確かめてから", "自分の考えを"],
            orderedChoices: ["事実を確かめてから", "自分の考えを", "まとめることが", "大切だ"],
            explanation: "『事実を確かめてから 自分の考えを まとめることが 大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["組み立てた", "発表を", "読み手に伝わるように", "資料を選んで"],
            orderedChoices: ["読み手に伝わるように", "資料を選んで", "発表を", "組み立てた"],
            explanation: "『読み手に伝わるように 資料を選んで 発表を 組み立てた。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】表現の しかたと 役割が 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "体言止め", match: "印象を 強める 表現"),
                QuizMatchingPair(prompt: "倒置", match: "順序を 入れかえて 強調する 表現"),
                QuizMatchingPair(prompt: "反復", match: "同じことばを くり返す 表現")
            ],
            choices: ["順序を 入れかえて 強調する 表現", "同じことばを くり返す 表現", "印象を 強める 表現"],
            explanation: "表現のしかたごとの役割を結びつけて理解しましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "根拠", match: "考えを 支える 事実や理由"),
                QuizMatchingPair(prompt: "反論", match: "ちがう考えを のべること"),
                QuizMatchingPair(prompt: "提案", match: "こうしたらよいと 示すこと")
            ],
            choices: ["こうしたらよいと 示すこと", "考えを 支える 事実や理由", "ちがう考えを のべること"],
            explanation: "意見文や話し合いで使うことばの意味を確かめましょう。"
        ),

        // --- 追加問題 56問 ---

        // 漢字の読み（1〜12）
        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『展望』",
            answer: "てんぼう",
            explanation: "『展望』の読みは『てんぼう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『認識』",
            answer: "にんしき",
            explanation: "『認識』の読みは『にんしき』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『批評』",
            answer: "ひひょう",
            explanation: "『批評』の読みは『ひひょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『象徴』",
            answer: "しょうちょう",
            explanation: "『象徴』の読みは『しょうちょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『抽象』",
            answer: "ちゅうしょう",
            explanation: "『抽象』の読みは『ちゅうしょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『具体』",
            answer: "ぐたい",
            explanation: "『具体』の読みは『ぐたい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『矛盾』",
            answer: "むじゅん",
            explanation: "『矛盾』の読みは『むじゅん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『論理』",
            answer: "ろんり",
            explanation: "『論理』の読みは『ろんり』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『普遍』",
            answer: "ふへん",
            explanation: "『普遍』の読みは『ふへん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『背景』",
            answer: "はいけい",
            explanation: "『背景』の読みは『はいけい』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『傾向』",
            answer: "けいこう",
            explanation: "『傾向』の読みは『けいこう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『前提』",
            answer: "ぜんてい",
            explanation: "『前提』の読みは『ぜんてい』です。"
        ),

        // 穴埋め（13〜20）
        QuizQuestion.fillInBlank(
            question: "【穴うめ】説明を完成させましょう。\n『七転八倒は苦しみを表すが、七転八起は ＿＿ を表す。』",
            answer: "不屈の精神",
            acceptableAnswers: ["何度でも立ち上がること", "ふくつのせいしん"],
            explanation: "七転八起は、何度失敗しても立ち上がる『不屈の精神』を表します。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『物事が順調に進むことを ＿＿ という。』",
            answer: "順風満帆",
            acceptableAnswers: ["じゅんぷうまんぱん"],
            explanation: "物事が順調に進むことを『順風満帆（じゅんぷうまんぱん）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『目標を定めてひたすら進むことを ＿＿ という。』",
            answer: "一意専心",
            acceptableAnswers: ["いちいせんしん"],
            explanation: "一つのことに集中して取り組むことを『一意専心（いちいせんしん）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】説明を完成させましょう。\n『一つのことを聞いてすべてを理解することを ＿＿ という。』",
            answer: "一を聞いて十を知る",
            acceptableAnswers: ["いちをきいてじゅうをしる"],
            explanation: "一つのことから多くを理解することを『一を聞いて十を知る』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『苦しいことと楽しいことを共にすることを ＿＿ という。』",
            answer: "同甘共苦",
            acceptableAnswers: ["どうかんきょうく"],
            explanation: "苦しいことも楽しいことも共にすることを『同甘共苦（どうかんきょうく）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】表現技法を答えましょう。\n『「春風が笑う」のように、自然を人のように表す表現を ＿＿ といいます。』",
            answer: "擬人法",
            acceptableAnswers: ["ぎじんほう"],
            explanation: "自然などを人のように表す表現を『擬人法（ぎじんほう）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】表現技法を答えましょう。\n『「まるで雪のような白さ」のように、何かにたとえる表現を ＿＿ といいます。』",
            answer: "直喩",
            acceptableAnswers: ["ちょくゆ", "直喩法", "ちょくゆほう", "比喩", "ひゆ"],
            explanation: "「まるで～のような」という形のたとえを『直喩（ちょくゆ）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『自分の考えに反対する意見を ＿＿ といいます。』",
            answer: "反論",
            acceptableAnswers: ["はんろん"],
            explanation: "自分の考えに反対する意見を『反論（はんろん）』といいます。"
        ),

        // 抜き出し（21〜26）
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者が主張していることを そのまま ぬき出しましょう。\n『筆者は この文章で、情報を批判的に 読む 力の 大切さを 一貫して 主張している。』",
            answer: "情報を批判的に 読む 力の 大切さ",
            acceptableAnswers: ["情報を批判的に読む力の大切さ", "じょうほうをひはんてきによむちからのたいせつさ"],
            explanation: "筆者が主張していることは『情報を批判的に 読む 力の 大切さ』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、りなが語ったことを そのまま ぬき出しましょう。\n『発表の 最後に、りなは これまでの 学びを 振り返り、今後の 目標を 語った。』",
            answer: "今後の 目標",
            acceptableAnswers: ["今後の目標", "これからの目標"],
            explanation: "りなが語ったことは『今後の 目標』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者が挙げたものを そのまま ぬき出しましょう。\n『筆者は 具体的な 事例を 挙げながら、SDGsの 重要性を 分かりやすく 説いている。』",
            answer: "具体的な 事例",
            acceptableAnswers: ["具体的な事例", "ぐたいてきなじれい"],
            explanation: "筆者が挙げたものは『具体的な 事例』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、話し合いを深めるための重要なことを そのまま ぬき出しましょう。\n『話し合いを 深めるには、相手の 意見を 否定せず まず 受け止めることが 重要だ。』",
            answer: "相手の 意見を 否定せず まず 受け止めること",
            acceptableAnswers: ["相手の意見を否定せずまず受け止めること"],
            explanation: "話し合いを深めるための重要なことは『相手の 意見を 否定せず まず 受け止めること』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、中心的な主張が書かれている場所を そのまま ぬき出しましょう。\n『この論説文の 中心的な 主張は、第三段落の 冒頭文に 書かれている。』",
            answer: "第三段落の 冒頭文",
            acceptableAnswers: ["第三段落の冒頭文", "だいさんだんらくのぼうとうぶん"],
            explanation: "中心的な主張が書かれている場所は『第三段落の 冒頭文』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、合意形成のために必要なことを そのまま ぬき出しましょう。\n『みんなで 合意形成するためには、ちがう 意見も 大切にしながら 話し合うことが 必要だ。』",
            answer: "ちがう 意見も 大切にしながら 話し合うこと",
            acceptableAnswers: ["ちがう意見も大切にしながら話し合うこと"],
            explanation: "合意形成のために必要なことは『ちがう 意見も 大切にしながら 話し合うこと』です。"
        ),

        // 並べ替え（27〜32）
        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["ことが大切だ", "文章を読むとき", "その主張の根拠を確かめる", "筆者の主張だけでなく"],
            orderedChoices: ["文章を読むとき", "筆者の主張だけでなく", "その主張の根拠を確かめる", "ことが大切だ"],
            explanation: "『文章を読むとき 筆者の主張だけでなく その主張の根拠を確かめる ことが大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["形成するためには", "ちがう意見も", "合意を", "受け入れながら", "話し合うことが必要だ"],
            orderedChoices: ["合意を", "形成するためには", "ちがう意見も", "受け入れながら", "話し合うことが必要だ"],
            explanation: "『合意を 形成するためには ちがう意見も 受け入れながら 話し合うことが必要だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["表れる", "文章の論理的な組み立て方に", "その人の思考の深さが", "説得力のある文章では"],
            orderedChoices: ["説得力のある文章では", "その人の思考の深さが", "文章の論理的な組み立て方に", "表れる"],
            explanation: "『説得力のある文章では その人の思考の深さが 文章の論理的な組み立て方に 表れる。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["大きく変わることがある", "ちがう文化や価値観に触れることで", "自分の", "考え方が"],
            orderedChoices: ["ちがう文化や価値観に触れることで", "自分の", "考え方が", "大きく変わることがある"],
            explanation: "『ちがう文化や価値観に触れることで 自分の 考え方が 大きく 変わることがある。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["深まる", "複数の資料を比べることで", "物事の理解が", "より"],
            orderedChoices: ["複数の資料を比べることで", "物事の理解が", "より", "深まる"],
            explanation: "『複数の資料を比べることで 物事の理解が より 深まる。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["述べることが重要だ", "意見を伝えるとき", "根拠を明確にして", "自分の考えを"],
            orderedChoices: ["意見を伝えるとき", "根拠を明確にして", "自分の考えを", "述べることが重要だ"],
            explanation: "『意見を伝えるとき 根拠を明確にして 自分の考えを 述べることが重要だ。』が正しい順番です。"
        ),

        // 組み合わせ（33〜37）
        QuizQuestion.matching(
            question: "【組み合わせ】四字熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "温故知新", match: "昔を学んで新しい知識を得る"),
                QuizMatchingPair(prompt: "一致団結", match: "心を一つにして取り組む"),
                QuizMatchingPair(prompt: "以心伝心", match: "言葉なく心が通じる")
            ],
            choices: ["言葉なく心が通じる", "昔を学んで新しい知識を得る", "心を一つにして取り組む"],
            explanation: "四字熟語の意味を結びつけましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】四字熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "順風満帆", match: "物事が順調に進む"),
                QuizMatchingPair(prompt: "電光石火", match: "非常に速い"),
                QuizMatchingPair(prompt: "七転八起", match: "何度でも立ち上がる")
            ],
            choices: ["何度でも立ち上がる", "物事が順調に進む", "非常に速い"],
            explanation: "四字熟語の意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】表現技法と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "倒置", match: "語順を入れかえて強調する"),
                QuizMatchingPair(prompt: "対句", match: "似た構造の文を並べる"),
                QuizMatchingPair(prompt: "省略", match: "言葉を省いて余韻を出す")
            ],
            choices: ["言葉を省いて余韻を出す", "語順を入れかえて強調する", "似た構造の文を並べる"],
            explanation: "表現技法の意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】国語の ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "論拠", match: "根拠として示す理由"),
                QuizMatchingPair(prompt: "仮説", match: "まだ確かめていない考え"),
                QuizMatchingPair(prompt: "結論", match: "話の最後のまとめ")
            ],
            choices: ["話の最後のまとめ", "根拠として示す理由", "まだ確かめていない考え"],
            explanation: "国語のことばの意味を確かめましょう。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】敬語の種類と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "尊敬語", match: "相手を高める言い方"),
                QuizMatchingPair(prompt: "謙譲語", match: "自分を下げる言い方"),
                QuizMatchingPair(prompt: "丁寧語", match: "ていねいな言い方")
            ],
            choices: ["ていねいな言い方", "相手を高める言い方", "自分を下げる言い方"],
            explanation: "敬語の三種類の意味を確かめましょう。"
        ),

        // さらに漢字読み（38〜43）
        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『対称』",
            answer: "たいしょう",
            explanation: "『対称』の読みは『たいしょう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『均衡』",
            answer: "きんこう",
            explanation: "『均衡』の読みは『きんこう』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『概念』",
            answer: "がいねん",
            explanation: "『概念』の読みは『がいねん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『変遷』",
            answer: "へんせん",
            explanation: "『変遷』の読みは『へんせん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『源泉』",
            answer: "げんせん",
            explanation: "『源泉』の読みは『げんせん』です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【漢字の読み】つぎの 漢字の 読みを ひらがなで答えましょう。\n『尊厳』",
            answer: "そんげん",
            explanation: "『尊厳』の読みは『そんげん』です。"
        ),

        // さらに抜き出し（44〜45）
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、筆者の結論を そのまま ぬき出しましょう。\n『筆者は、情報社会においてメディアリテラシーを 高めることが 今後 最も 重要だと 結論づけている。』",
            answer: "メディアリテラシーを 高めることが 今後 最も 重要",
            acceptableAnswers: ["メディアリテラシーを高めることが今後最も重要", "メディアリテラシーを高めること"],
            explanation: "筆者の結論は『メディアリテラシーを 高めることが 今後 最も 重要』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、強調されているものを そのまま ぬき出しましょう。\n『この詩では、「時間」という言葉が 繰り返し 使われることで、時の流れの はかなさが 強調されている。』",
            answer: "時の流れの はかなさ",
            acceptableAnswers: ["時の流れのはかなさ", "ときのながれのはかなさ"],
            explanation: "強調されているものは『時の流れの はかなさ』です。"
        ),

        // さらに並べ替え（46〜48）
        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["なれる", "物事の 本質を 見抜く 力に", "ちがう視点から 考えることで", "より"],
            orderedChoices: ["ちがう視点から 考えることで", "物事の 本質を 見抜く 力に", "より", "なれる"],
            explanation: "『ちがう視点から 考えることで 物事の 本質を 見抜く 力に より なれる。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["示すことが 大切だ", "なぜそう考えるのかという", "意見を述べるときは", "根拠を 明確に"],
            orderedChoices: ["意見を述べるときは", "なぜそう考えるのかという", "根拠を 明確に", "示すことが 大切だ"],
            explanation: "『意見を述べるときは なぜそう考えるのかという 根拠を 明確に 示すことが 大切だ。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて、考えが伝わる文をつくりましょう。",
            choices: ["受け止めることから始まる", "お互いの理解は", "ちがいを 認め", "相手と 深めていく"],
            orderedChoices: ["お互いの理解は", "ちがいを 認め", "相手と 深めていく", "受け止めることから始まる"],
            explanation: "『お互いの理解は ちがいを 認め 相手と 深めていく 受け止めることから始まる。』が正しい順番です。"
        ),

        // さらに組み合わせ（49〜51）
        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "矛盾", match: "むじゅん"),
                QuizMatchingPair(prompt: "論理", match: "ろんり"),
                QuizMatchingPair(prompt: "概念", match: "がいねん")
            ],
            choices: ["がいねん", "むじゅん", "ろんり"],
            explanation: "『矛盾=むじゅん』『論理=ろんり』『概念=がいねん』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】漢字と 読みが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "象徴", match: "しょうちょう"),
                QuizMatchingPair(prompt: "批評", match: "ひひょう"),
                QuizMatchingPair(prompt: "前提", match: "ぜんてい")
            ],
            choices: ["ぜんてい", "しょうちょう", "ひひょう"],
            explanation: "『象徴=しょうちょう』『批評=ひひょう』『前提=ぜんてい』が正しい組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】四字熟語と いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "切磋琢磨", match: "友と競い合い高め合う"),
                QuizMatchingPair(prompt: "臥薪嘗胆", match: "苦しみに耐え復讐を誓う"),
                QuizMatchingPair(prompt: "初志貫徹", match: "最初の志を最後まで貫く")
            ],
            choices: ["最初の志を最後まで貫く", "友と競い合い高め合う", "苦しみに耐え復讐を誓う"],
            explanation: "四字熟語の意味を確かめましょう。"
        ),

        // さらに穴埋め（52〜54）
        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『どんな困難にも負けない心を ＿＿ という。』",
            answer: "不撓不屈",
            acceptableAnswers: ["ふとうふくつ", "不屈の精神", "ふくつのせいしん"],
            explanation: "どんな困難にも負けない心を『不撓不屈（ふとうふくつ）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】四字熟語を答えましょう。\n『友と励まし合い高め合うことを ＿＿ という。』",
            answer: "切磋琢磨",
            acceptableAnswers: ["せっさたくま"],
            explanation: "友と励まし合い高め合うことを『切磋琢磨（せっさたくま）』といいます。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】国語の ことばを答えましょう。\n『会話や文章で相手を敬う言い方を ＿＿ といいます。』",
            answer: "敬語",
            acceptableAnswers: ["けいご"],
            explanation: "相手を敬う言い方を『敬語（けいご）』といいます。"
        ),

        // さらに抜き出し（55〜56）
        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、発表に説得力を持たせるために欠かせないものを そのまま ぬき出しましょう。\n『発表に 説得力を 持たせるためには、主張を 支える 具体的な データを 示すことが 欠かせない。』",
            answer: "具体的な データを 示すこと",
            acceptableAnswers: ["具体的なデータを示すこと", "ぐたいてきなでーたをしめすこと"],
            explanation: "発表に説得力を持たせるために欠かせないものは『具体的な データを 示すこと』です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、特に印象的なものを そのまま ぬき出しましょう。\n『この作品では、主人公の 心の 成長が 描かれており、特に 第三場面の 会話文が 印象的だ。』",
            answer: "第三場面の 会話文",
            acceptableAnswers: ["第三場面の会話文", "だいさんばめんのかいわぶん"],
            explanation: "特に印象的なものは『第三場面の 会話文』です。"
        ),

        QuizQuestion(
                question: "次の漢字『簡潔』の読みとして正しいものはどれですか？",
                choices: [
                    "かんけつ",
                    "かんせつ",
                    "けんけつ",
                    "かんげつ"
                ],
                correctAnswerIndex: 0,
                explanation: "『簡潔』の正しい読みは『かんけつ』です。"
            ),

            QuizQuestion(
                question: "『公平無私』の意味として最も適切なものはどれですか？",
                choices: [
                    "自分の利益だけを優先すること",
                    "私情を交えず公平に判断すること",
                    "だれにでも同じ意見を言わせること",
                    "細かな違いを気にしないこと"
                ],
                correctAnswerIndex: 1,
                explanation: "『公平無私』は、私情を交えず公平に判断することを表します。"
            ),

            QuizQuestion(
                question: "目立たないところで人を支える人をたとえることわざはどれですか？",
                choices: [
                    "知らぬが仏",
                    "口は災いの元",
                    "縁の下の力持ち",
                    "果報は寝て待て"
                ],
                correctAnswerIndex: 2,
                explanation: "目立たないところで人を支える人をたとえることわざは『縁の下の力持ち』です。"
            ),

            QuizQuestion(
                question: "『先生がこの資料を見る』を尊敬語を使った文に直したものはどれですか？",
                choices: [
                    "先生がこの資料を拝見します",
                    "先生がこの資料をお見せになります",
                    "先生がこの資料を見ます",
                    "先生がこの資料をご覧になります"
                ],
                correctAnswerIndex: 3,
                explanation: "『見る』の尊敬語は『ご覧になる』なので、『先生がこの資料をご覧になります』が正解です。"
            ),

            QuizQuestion(
                question: "『走れ、走れ、ゴールはもうすぐだ。』で使われている表現技法はどれですか？",
                choices: [
                    "反復",
                    "倒置",
                    "体言止め",
                    "擬人法"
                ],
                correctAnswerIndex: 0,
                explanation: "同じ言葉の『走れ』を繰り返しているので、使われている表現技法は『反復』です。"
            ),

            QuizQuestion(
                question: "『学校図書館の開館時間を延ばすべきだ』という主張を最も強く支える根拠はどれですか？",
                choices: [
                    "わたしは本を読むことが好きだから",
                    "全校アンケートで、利用したいが時間が合わないと答えた児童が62％だったから",
                    "友達が開館時間を延ばしてほしいと言ったから",
                    "学校図書館は静かな場所だから"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『全校アンケートで、利用したいが時間が合わないと答えた児童が62％だったから』です。全校アンケートの結果は、多くの児童の状況を示す具体的な資料なので、主張を最も強く支える根拠になります。"
            ),

            QuizQuestion(
                question: "論説文で、筆者が具体的な事例を示す主な目的はどれですか？",
                choices: [
                    "文章の文字数を増やすため",
                    "登場人物を紹介するため",
                    "主張を具体的にして説得力を高めるため",
                    "結論を読み手に分からなくするため"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『主張を具体的にして説得力を高めるため』です。具体的な事例には、筆者の主張を分かりやすくし、説得力を高める役割があります。"
            ),

            QuizQuestion(
                question: "文のつながりに合う接続語はどれですか？\n『この方法には大きな利点がある。＿＿、費用がかかるという課題もある。』",
                choices: [
                    "つまり",
                    "たとえば",
                    "だから",
                    "一方"
                ],
                correctAnswerIndex: 3,
                explanation: "利点と課題を対照的に述べているので、接続語は『一方』が適切です。"
            ),

            QuizQuestion(
                question: "『基本的人権をほしょうする』の『ほしょう』に当てはまる漢字はどれですか？",
                choices: [
                    "保障",
                    "保証",
                    "補償",
                    "補章"
                ],
                correctAnswerIndex: 0,
                explanation: "権利や安全を守るという意味では『保障』を使うので、『基本的人権を保障する』が正解です。"
            ),

            QuizQuestion(
                question: "学校の職員が、外部から来た人に『校長先生はいらっしゃいますか』と聞かれたときの答えとして、最も適切なものはどれですか？",
                choices: [
                    "校長先生はただ今、会議室にいらっしゃいます",
                    "校長はただ今、会議室におります",
                    "校長様はただ今、会議室におられます",
                    "校長はただ今、会議室に参ります"
                ],
                correctAnswerIndex: 1,
                explanation: "外部の来校者には自分の側の校長を高めず、『校長はただ今、会議室におります』と答えるのが適切です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【漢字の読み】つぎの漢字の読みをひらがなで答えましょう。\n『創造』",
                answer: "そうぞう",
                explanation: "『創造』の読みは『そうぞう』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】四字熟語を答えましょう。\n『多くの人が口をそろえて同じことを言う様子を ＿＿ といいます。』",
                answer: "異口同音",
                acceptableAnswers: ["いくどうおん"],
                explanation: "多くの人が口をそろえて同じことを言う様子を『異口同音』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】ことわざを完成させましょう。\n『＿＿。準備しておけば、いざというときの心配が少なくなります。』",
                answer: "備えあれば憂いなし",
                acceptableAnswers: ["そなえあればうれいなし"],
                explanation: "前もって準備をしておけば心配が少ないという意味のことわざは『備えあれば憂いなし』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】『読む』の謙譲語を使って文を完成させましょう。\n『先生がお書きになった本を ＿＿。』",
                answer: "拝読します",
                acceptableAnswers: ["はいどくします", "拝読いたします", "はいどくいたします"],
                explanation: "『読む』の謙譲語は『拝読する』なので、『先生がお書きになった本を拝読します』となります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】表現技法を答えましょう。\n『「昼はにぎやかな駅前も、夜は静まり返る。」のように、異なる様子を並べて違いを際立たせる表現を ＿＿ といいます。』",
                answer: "対比",
                acceptableAnswers: ["たいひ"],
                explanation: "異なる様子を並べて違いを際立たせる表現を『対比』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】国語の言葉を答えましょう。\n『資料がどの程度信じられるかという性質を、資料の ＿＿ といいます。』",
                answer: "信頼性",
                acceptableAnswers: ["しんらいせい"],
                explanation: "資料がどの程度信じられるかという性質を『信頼性』といいます。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、『まちがって意味を受け取ること』を表す二字熟語をそのまま抜き出しましょう。\n『説明が短すぎると、読み手が内容を誤解することがある。』",
                answer: "誤解",
                explanation: "『まちがって意味を受け取ること』を表す二字熟語は『誤解』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、準備が細かなところまで行き届いていることを表す四字熟語をそのまま抜き出しましょう。\n『実行委員は用意周到に計画を立て、必要な道具も早めにそろえた。』",
                answer: "用意周到",
                explanation: "準備が細かなところまで行き届いていることを表す四字熟語は『用意周到』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、実力のある人ほどむやみに力を見せないことを表すことわざをそのまま抜き出しましょう。\n『優れた力を持つ人ほど、それを自慢しない。このことを「能ある鷹は爪を隠す」という。』",
                answer: "能ある鷹は爪を隠す",
                explanation: "実力のある人ほどむやみに力を見せないことを表すことわざは『能ある鷹は爪を隠す』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの論説文から、筆者の結論の内容をそのまま抜き出しましょう。\n『公園のベンチは夏になると表面が熱くなり、利用しにくい。昨年の調査でも、夏の利用者は春の半分だった。以上のことから、公園に日よけを増やす必要がある。』",
                answer: "公園に日よけを増やす必要がある",
                acceptableAnswers: ["公園に日よけを増やす必要がある。"],
                explanation: "『以上のことから』に続く結論の内容は『公園に日よけを増やす必要がある』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、主張を直接支える根拠をそのまま抜き出しましょう。\n『わたしは給水機を体育館前に増やすべきだと考える。昨年度、運動後に保健室を利用した児童のうち、半数以上が水分不足だった。体育館は校舎の南側にある。』",
                answer: "昨年度、運動後に保健室を利用した児童のうち、半数以上が水分不足だった",
                acceptableAnswers: ["昨年度、運動後に保健室を利用した児童のうち、半数以上が水分不足だった。"],
                explanation: "給水機を増やすという主張を直接支える根拠は、『昨年度、運動後に保健室を利用した児童のうち、半数以上が水分不足だった』という事実です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】まとまりのある段落になるように、文を正しい順番に並べましょう。",
                choices: [
                    "実際に、朝読書をした日は授業に集中しやすかった。",
                    "このように、朝読書には学習を始めやすくするよさがある。",
                    "わたしは朝読書を続けたい。",
                    "なぜなら、一日の始まりに心を落ち着けられるからだ。"
                ],
                orderedChoices: [
                    "わたしは朝読書を続けたい。",
                    "なぜなら、一日の始まりに心を落ち着けられるからだ。",
                    "実際に、朝読書をした日は授業に集中しやすかった。",
                    "このように、朝読書には学習を始めやすくするよさがある。"
                ],
                explanation: "『わたしは朝読書を続けたい。』『なぜなら、一日の始まりに心を落ち着けられるからだ。』『実際に、朝読書をした日は授業に集中しやすかった。』『このように、朝読書には学習を始めやすくするよさがある。』の順です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】来校者への丁寧なお願いになるように、言葉を正しい順番に並べましょう。",
                choices: [
                    "お名前を",
                    "ご記入ください",
                    "お手数ですが",
                    "こちらの用紙に"
                ],
                orderedChoices: [
                    "お手数ですが",
                    "こちらの用紙に",
                    "お名前を",
                    "ご記入ください"
                ],
                explanation: "『お手数ですが こちらの用紙に お名前を ご記入ください。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】表現の効果を説明する文になるように、言葉を正しい順番に並べましょう。",
                choices: [
                    "場面の緊張感を",
                    "高めている",
                    "短い文を重ねて",
                    "作者は"
                ],
                orderedChoices: [
                    "作者は",
                    "短い文を重ねて",
                    "場面の緊張感を",
                    "高めている"
                ],
                explanation: "『作者は 短い文を重ねて 場面の緊張感を 高めている。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】論説文の流れとして自然になるように、文を正しい順番に並べましょう。",
                choices: [
                    "正しく分別すれば、再利用できる資源が増えるからだ。",
                    "したがって、学校でも分別を学ぶ機会が必要である。",
                    "近年、地域のごみが増えている。",
                    "わたしたちは分別の方法を見直すべきだ。"
                ],
                orderedChoices: [
                    "近年、地域のごみが増えている。",
                    "わたしたちは分別の方法を見直すべきだ。",
                    "正しく分別すれば、再利用できる資源が増えるからだ。",
                    "したがって、学校でも分別を学ぶ機会が必要である。"
                ],
                explanation: "問題の提示、主張、理由、結論の順に並べると、論説文の流れが明確になります。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】主張と根拠のつながりが明確になるように、文を正しい順番に並べましょう。",
                choices: [
                    "実際に昨年は、暑さのため外遊びを控えた日が十日あった。",
                    "以上から、校庭に木陰を増やす必要がある。",
                    "わたしは校庭に木陰を増やすべきだと考える。",
                    "なぜなら、夏の休み時間に日差しを避ける場所が少ないからだ。"
                ],
                orderedChoices: [
                    "わたしは校庭に木陰を増やすべきだと考える。",
                    "なぜなら、夏の休み時間に日差しを避ける場所が少ないからだ。",
                    "実際に昨年は、暑さのため外遊びを控えた日が十日あった。",
                    "以上から、校庭に木陰を増やす必要がある。"
                ],
                explanation: "主張、理由、具体的な事実、結論の順に並べると、主張と根拠のつながりが明確になります。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】文章構成の言葉と役割を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "始め", match: "話題や問いを示す"),
                    QuizMatchingPair(prompt: "中", match: "理由や例を詳しく述べる"),
                    QuizMatchingPair(prompt: "終わり", match: "考えをまとめる"),
                    QuizMatchingPair(prompt: "段落", match: "内容のまとまりごとに分ける")
                ],
                choices: [
                    "考えをまとめる",
                    "内容のまとまりごとに分ける",
                    "話題や問いを示す",
                    "理由や例を詳しく述べる"
                ],
                explanation: "『始め=話題や問いを示す』『中=理由や例を詳しく述べる』『終わり=考えをまとめる』『段落=内容のまとまりごとに分ける』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】四字熟語と意味を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "公明正大", match: "公平で隠し事がない"),
                    QuizMatchingPair(prompt: "意気投合", match: "気持ちや考えがぴったり合う"),
                    QuizMatchingPair(prompt: "一念発起", match: "あることをしようと強く決心する"),
                    QuizMatchingPair(prompt: "前途洋々", match: "将来が明るく開けている")
                ],
                choices: [
                    "将来が明るく開けている",
                    "公平で隠し事がない",
                    "あることをしようと強く決心する",
                    "気持ちや考えがぴったり合う"
                ],
                explanation: "『公明正大=公平で隠し事がない』『意気投合=気持ちや考えがぴったり合う』『一念発起=あることをしようと強く決心する』『前途洋々=将来が明るく開けている』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】ことわざと意味を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "知らぬが仏", match: "知らなければ心配せずに済む"),
                    QuizMatchingPair(prompt: "口は災いの元", match: "不用意な発言が問題を招く"),
                    QuizMatchingPair(prompt: "三人寄れば文殊の知恵", match: "集まって考えるとよい知恵が出る"),
                    QuizMatchingPair(prompt: "雨降って地固まる", match: "もめ事の後に関係がよくなる")
                ],
                choices: [
                    "集まって考えるとよい知恵が出る",
                    "もめ事の後に関係がよくなる",
                    "知らなければ心配せずに済む",
                    "不用意な発言が問題を招く"
                ],
                explanation: "『知らぬが仏=知らなければ心配せずに済む』『口は災いの元=不用意な発言が問題を招く』『三人寄れば文殊の知恵=集まって考えるとよい知恵が出る』『雨降って地固まる=もめ事の後に関係がよくなる』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】表現技法と働きを正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "擬音語", match: "実際の音を文字で表す"),
                    QuizMatchingPair(prompt: "擬態語", match: "音のない状態や動きを表す"),
                    QuizMatchingPair(prompt: "対句", match: "似た形の文を並べて調子を整える"),
                    QuizMatchingPair(prompt: "体言止め", match: "名詞で文を終えて印象を強める")
                ],
                choices: [
                    "名詞で文を終えて印象を強める",
                    "実際の音を文字で表す",
                    "似た形の文を並べて調子を整える",
                    "音のない状態や動きを表す"
                ],
                explanation: "『擬音語=実際の音を文字で表す』『擬態語=音のない状態や動きを表す』『対句=似た形の文を並べて調子を整える』『体言止め=名詞で文を終えて印象を強める』が正しい組み合わせです。"
            ),
            QuizQuestion(
                question: "次の漢字『推測』の読みとして正しいものはどれですか？",
                choices: [
                    "すいさく",
                    "ついそく",
                    "すいそく",
                    "ついさく"
                ],
                correctAnswerIndex: 2,
                explanation: "『推測』の正しい読みは『すいそく』です。"
            ),

            QuizQuestion(
                question: "『一長一短』の意味として最も適切なものはどれですか？",
                choices: [
                    "よい点も悪い点もあること",
                    "長所だけが多いこと",
                    "短い時間で決めること",
                    "一つの長所だけを伸ばすこと"
                ],
                correctAnswerIndex: 0,
                explanation: "『一長一短』は、よい点も悪い点もあることを表します。"
            ),

            QuizQuestion(
                question: "『転ばぬ先の杖』の意味として最も適切なものはどれですか？",
                choices: [
                    "失敗した後で原因を考えること",
                    "転んでも何度も立ち上がること",
                    "急ぐときほど遠回りすること",
                    "失敗しないよう前もって備えること"
                ],
                correctAnswerIndex: 3,
                explanation: "『転ばぬ先の杖』は、失敗しないよう前もって備えることを表します。"
            ),

            QuizQuestion(
                question: "『担任の先生が教室に来る』を尊敬語を使った文に直したものはどれですか？",
                choices: [
                    "担任の先生が教室に参ります",
                    "担任の先生が教室にいらっしゃいます",
                    "担任の先生が教室におります",
                    "担任の先生が教室にうかがいます"
                ],
                correctAnswerIndex: 1,
                explanation: "『来る』の尊敬語は『いらっしゃる』なので、『担任の先生が教室にいらっしゃいます』が正解です。"
            ),

            QuizQuestion(
                question: "『返事を百年待った気がする。』で使われている表現技法はどれですか？",
                choices: [
                    "誇張法",
                    "擬人法",
                    "反復法",
                    "倒置法"
                ],
                correctAnswerIndex: 0,
                explanation: "実際よりも大げさに表して印象を強めているので、使われている表現技法は『誇張法』です。"
            ),

            QuizQuestion(
                question: "『登校時刻に合わせて、校門前の横断歩道に見守り員を増やすべきだ』という主張を最も強く支える根拠はどれですか？",
                choices: [
                    "わたしは朝の道が少し心配だから",
                    "友達も見守り員を増やしてほしいと言ったから",
                    "昨年度、登校時間帯に校門前で起きたヒヤリ事例が12件記録されたから",
                    "横断歩道の白線が目立つから"
                ],
                correctAnswerIndex: 2,
                explanation: "正解は『昨年度、登校時間帯に校門前で起きたヒヤリ事例が12件記録されたから』です。具体的な記録は、見守り員を増やす必要性を直接示す根拠になります。"
            ),

            QuizQuestion(
                question: "論説文で、筆者が反対意見を取り上げた後に自分の考えを示す主な効果はどれですか？",
                choices: [
                    "話題を別の方向に変える",
                    "異なる見方に応え、主張の説得力を高める",
                    "結論をあいまいにする",
                    "事実と意見の区別をなくす"
                ],
                correctAnswerIndex: 1,
                explanation: "正解は『異なる見方に応え、主張の説得力を高める』です。反対意見に応じて自分の考えを示すと、異なる見方にも対応できるため、主張の説得力が高まります。"
            ),

            QuizQuestion(
                question: "問題提起、主張、根拠、まとめの四つを使って意見文を書くとき、最も自然な順序はどれですか？",
                choices: [
                    "根拠→問題提起→まとめ→主張",
                    "主張→まとめ→問題提起→根拠",
                    "問題提起→根拠→まとめ→主張",
                    "問題提起→主張→根拠→まとめ"
                ],
                correctAnswerIndex: 3,
                explanation: "意見文は、『問題提起→主張→根拠→まとめ』の順に組み立てると、考えの流れが伝わりやすくなります。"
            ),

            QuizQuestion(
                question: "『先生の指示にしたがう』の『したがう』に当てはまる漢字はどれですか？",
                choices: [
                    "従う",
                    "補う",
                    "養う",
                    "失う"
                ],
                correctAnswerIndex: 0,
                explanation: "指示や規則に沿って行動するという意味では『従う』を使うので、『先生の指示に従う』が正解です。"
            ),

            QuizQuestion(
                question: "『わたしが先生に考えを言う』を謙譲語を使った文に直したものはどれですか？",
                choices: [
                    "わたしが先生に考えをお話しになります",
                    "わたしが先生に考えをおっしゃいます",
                    "わたしが先生に考えを申し上げます",
                    "わたしが先生に考えを話されます"
                ],
                correctAnswerIndex: 2,
                explanation: "『言う』の謙譲語は『申し上げる』なので、『わたしが先生に考えを申し上げます』が正解です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【漢字の読み】つぎの漢字の読みをひらがなで答えましょう。\n『厳密』",
                answer: "げんみつ",
                explanation: "『厳密』の読みは『げんみつ』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】四字熟語を答えましょう。\n『いろいろな方法を試し、失敗を重ねながら解決に近づくことを ＿＿ といいます。』",
                answer: "試行錯誤",
                acceptableAnswers: ["しこうさくご"],
                explanation: "いろいろな方法を試し、失敗を重ねながら解決に近づくことを『試行錯誤』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】ことわざを答えましょう。\n『身近なことほど、かえって気づきにくいことを ＿＿ といいます。』",
                answer: "灯台下暗し",
                acceptableAnswers: ["とうだいもとくらし"],
                explanation: "身近なことほど、かえって気づきにくいことを『灯台下暗し』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】『訪問する』の謙譲語を使って文を完成させましょう。\n『来週、わたしが先生のお宅へ ＿＿。』",
                answer: "伺います",
                acceptableAnswers: ["うかがいます"],
                explanation: "『訪問する』の謙譲語は『伺う』なので、『来週、わたしが先生のお宅へ伺います』となります。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】表現技法を答えましょう。\n『「彼の言葉は心に刺さる矢だ」のように、「〜のようだ」を使わずにたとえる表現を ＿＿ といいます。』",
                answer: "隠喩",
                acceptableAnswers: ["いんゆ", "暗喩", "あんゆ"],
                explanation: "「〜のようだ」などの言葉を使わずにたとえる表現を『隠喩』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】文章構成の言葉を答えましょう。\n『段落の中で、その段落の中心となる内容を表す文を ＿＿ といいます。』",
                answer: "中心文",
                acceptableAnswers: ["ちゅうしんぶん"],
                explanation: "段落の中心となる内容を表す文を『中心文』といいます。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、『十分によく考えること』を表す二字熟語をそのまま抜き出しましょう。\n『委員会では、出された案を十分に熟考してから結論を出した。』",
                answer: "熟考",
                explanation: "『十分によく考えること』を表す二字熟語は『熟考』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、困難な状況で必死に努力することを表す四字熟語をそのまま抜き出しましょう。\n『ロボット作りでは失敗が続いたが、班のみんなは悪戦苦闘しながら完成させた。』",
                answer: "悪戦苦闘",
                explanation: "困難な状況で必死に努力することを表す四字熟語は『悪戦苦闘』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、名人でも失敗することがあるという意味のことわざをそのまま抜き出しましょう。\n『書道の先生が字を一つ書きまちがえた。まさに「弘法にも筆の誤り」だ。』",
                answer: "弘法にも筆の誤り",
                explanation: "名人でも失敗することがあるという意味のことわざは『弘法にも筆の誤り』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文章から、主張を直接支える調査結果をそのまま抜き出しましょう。\n『わたしは、給食の量を選べる仕組みを取り入れるべきだと考える。先月の調査では、残した児童のうち68％が「量が多かった」と答えた。人気の献立はカレーだった。』",
                answer: "先月の調査では、残した児童のうち68％が「量が多かった」と答えた",
                acceptableAnswers: ["先月の調査では、残した児童のうち68％が「量が多かった」と答えた。"],
                explanation: "給食の量を選べる仕組みを取り入れるという主張を直接支える調査結果は、『先月の調査では、残した児童のうち68％が「量が多かった」と答えた』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの論説文から、筆者が認めている電子書籍の欠点をそのまま抜き出しましょう。\n『確かに、電子書籍は端末の電池が切れると読めない。しかし、文字を拡大でき、持ち運びやすいという利点もある。だから、目的に応じて紙の本と使い分けるべきだ。』",
                answer: "端末の電池が切れると読めない",
                acceptableAnswers: ["端末の電池が切れると読めない。"],
                explanation: "筆者が認めている電子書籍の欠点は、『端末の電池が切れると読めない』です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】来校者への対応として自然な流れになるように、文を正しい順番に並べましょう。",
                choices: [
                    "校長に予定を確認した後、受付の人は「校長室へご案内いたします」と声をかけた。",
                    "来校者が受付で校長との面会を希望した。",
                    "来校者は礼を言って案内に従った。",
                    "そこで、受付の人は「少々お待ちください」と伝えた。"
                ],
                orderedChoices: [
                    "来校者が受付で校長との面会を希望した。",
                    "そこで、受付の人は「少々お待ちください」と伝えた。",
                    "校長に予定を確認した後、受付の人は「校長室へご案内いたします」と声をかけた。",
                    "来校者は礼を言って案内に従った。"
                ],
                explanation: "来校者の希望を聞き、待つよう伝え、予定を確認してから案内し、来校者が案内に従う順です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】色を表す言葉の効果を説明する文章になるように、文を正しい順番に並べましょう。",
                choices: [
                    "このように、色彩語が情景を印象深くしている。",
                    "さらに、場面の温かい雰囲気も感じられる。",
                    "詩には「赤」「金色」などの色を表す言葉が使われている。",
                    "これらの色彩語によって、夕焼けの鮮やかさが伝わる。"
                ],
                orderedChoices: [
                    "詩には「赤」「金色」などの色を表す言葉が使われている。",
                    "これらの色彩語によって、夕焼けの鮮やかさが伝わる。",
                    "さらに、場面の温かい雰囲気も感じられる。",
                    "このように、色彩語が情景を印象深くしている。"
                ],
                explanation: "色彩語の提示、その効果の説明、追加の効果、まとめの順に並べると自然です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】主張と根拠のつながりが明確になるように、文を正しい順番に並べましょう。",
                choices: [
                    "また、外遊びには気分転換の効果もある。",
                    "以上から、外遊びの時間を確保する工夫が必要である。",
                    "その根拠は、全校アンケートで希望する児童が74％だったことだ。",
                    "わたしは、休み時間の外遊びを増やすべきだと考える。"
                ],
                orderedChoices: [
                    "わたしは、休み時間の外遊びを増やすべきだと考える。",
                    "その根拠は、全校アンケートで希望する児童が74％だったことだ。",
                    "また、外遊びには気分転換の効果もある。",
                    "以上から、外遊びの時間を確保する工夫が必要である。"
                ],
                explanation: "主張、調査による根拠、追加の理由、まとめの順に並べると、考えのつながりが明確になります。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】論説文の流れとして自然になるように、文を正しい順番に並べましょう。",
                choices: [
                    "このように、利点と課題の両方を考えて活用すべきである。",
                    "そこで、使用時間を決め、紙の教材と組み合わせることが重要だ。",
                    "タブレットは資料を拡大したり共有したりできるため、学校で使う機会が増えている。",
                    "一方で、目の疲れを心配する意見もある。"
                ],
                orderedChoices: [
                    "タブレットは資料を拡大したり共有したりできるため、学校で使う機会が増えている。",
                    "一方で、目の疲れを心配する意見もある。",
                    "そこで、使用時間を決め、紙の教材と組み合わせることが重要だ。",
                    "このように、利点と課題の両方を考えて活用すべきである。"
                ],
                explanation: "話題の提示、課題、対応策、まとめの順に並べると、論説文の流れが明確になります。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】調査報告の文章構成として自然になるように、文を正しい順番に並べましょう。",
                choices: [
                    "最後に、今後さらに調べたい点を述べた。",
                    "次に、調べ方を説明した。",
                    "はじめに、調査の目的を示した。",
                    "その後、結果から分かったことをまとめた。"
                ],
                orderedChoices: [
                    "はじめに、調査の目的を示した。",
                    "次に、調べ方を説明した。",
                    "その後、結果から分かったことをまとめた。",
                    "最後に、今後さらに調べたい点を述べた。"
                ],
                explanation: "調査報告は、目的、方法、結果から分かったこと、今後の課題の順にまとめると分かりやすくなります。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】四字熟語と意味を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "大同小異", match: "大体は同じで少しだけ違う"),
                    QuizMatchingPair(prompt: "日進月歩", match: "絶えず速い勢いで進歩する"),
                    QuizMatchingPair(prompt: "適材適所", match: "人の能力に合う役割を与える"),
                    QuizMatchingPair(prompt: "有言実行", match: "口にしたことを実際に行う")
                ],
                choices: [
                    "人の能力に合う役割を与える",
                    "口にしたことを実際に行う",
                    "大体は同じで少しだけ違う",
                    "絶えず速い勢いで進歩する"
                ],
                explanation: "『大同小異=大体は同じで少しだけ違う』『日進月歩=絶えず速い勢いで進歩する』『適材適所=人の能力に合う役割を与える』『有言実行=口にしたことを実際に行う』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】ことわざと意味を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "猫に小判", match: "価値が分からない相手には役立たない"),
                    QuizMatchingPair(prompt: "郷に入っては郷に従え", match: "その土地の習慣に合わせるのがよい"),
                    QuizMatchingPair(prompt: "かわいい子には旅をさせよ", match: "大切な子には苦労を経験させるのがよい"),
                    QuizMatchingPair(prompt: "朱に交われば赤くなる", match: "人は周囲から影響を受ける")
                ],
                choices: [
                    "人は周囲から影響を受ける",
                    "その土地の習慣に合わせるのがよい",
                    "価値が分からない相手には役立たない",
                    "大切な子には苦労を経験させるのがよい"
                ],
                explanation: "『猫に小判=価値が分からない相手には役立たない』『郷に入っては郷に従え=その土地の習慣に合わせるのがよい』『かわいい子には旅をさせよ=大切な子には苦労を経験させるのがよい』『朱に交われば赤くなる=人は周囲から影響を受ける』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】表現技法と働きを正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "列挙", match: "複数の事柄を並べて内容を強調する"),
                    QuizMatchingPair(prompt: "押韻", match: "似た音を繰り返してリズムを生む"),
                    QuizMatchingPair(prompt: "反語", match: "問いかけの形を用いて、強い肯定や否定を表す"),
                    QuizMatchingPair(prompt: "呼びかけ", match: "相手や物に直接語りかける")
                ],
                choices: [
                    "相手や物に直接語りかける",
                    "似た音を繰り返してリズムを生む",
                    "複数の事柄を並べて内容を強調する",
                    "問いかけの形を用いて、強い肯定や否定を表す"
                ],
                explanation: "『列挙=複数の事柄を並べて内容を強調する』『押韻=似た音を繰り返してリズムを生む』『反語=問いかけの形を用いて、強い肯定や否定を表す』『呼びかけ=相手や物に直接語りかける』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】主張を支える資料の種類と役割を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "統計資料", match: "多くの人や事例の傾向を数値で示す"),
                    QuizMatchingPair(prompt: "専門家の意見", match: "専門知識に基づく見方を示す"),
                    QuizMatchingPair(prompt: "実験結果", match: "条件をそろえて確かめた事実を示す"),
                    QuizMatchingPair(prompt: "体験談", match: "個人が実際に経験したことを示す")
                ],
                choices: [
                    "専門知識に基づく見方を示す",
                    "個人が実際に経験したことを示す",
                    "条件をそろえて確かめた事実を示す",
                    "多くの人や事例の傾向を数値で示す"
                ],
                explanation: "『統計資料=多くの人や事例の傾向を数値で示す』『専門家の意見=専門知識に基づく見方を示す』『実験結果=条件をそろえて確かめた事実を示す』『体験談=個人が実際に経験したことを示す』が正しい組み合わせです。"
            ),
            QuizQuestion(
                question: "次の漢字『熟練』の読みとして正しいものはどれですか？",
                choices: [
                    "じゅくれん",
                    "じゅうれん",
                    "しゅくれん",
                    "じゅくねん"
                ],
                correctAnswerIndex: 0,
                explanation: "『熟練』の正しい読みは『じゅくれん』です。"
            ),

            QuizQuestion(
                question: "『この活動には、社会の役に立つという大きな＿＿がある。』の＿＿に当てはまる漢字はどれですか？",
                choices: [
                    "異議",
                    "意義",
                    "威儀",
                    "意技"
                ],
                correctAnswerIndex: 1,
                explanation: "価値や大切さを表す言葉は『意義』なので、『大きな意義がある』が正解です。"
            ),

            QuizQuestion(
                question: "『一朝一夕』の意味として最も適切なものはどれですか？",
                choices: [
                    "朝から夕方まで休まず続けること",
                    "毎朝と毎夕に同じことをすること",
                    "わずかな期間や短い時間",
                    "一度決めたことを最後まで守ること"
                ],
                correctAnswerIndex: 2,
                explanation: "『一朝一夕』は、わずかな期間や短い時間を表します。"
            ),

            QuizQuestion(
                question: "『善は急げ』の意味として最も適切なものはどれですか？",
                choices: [
                    "よい行いでも十分に時間をかけるべきだ",
                    "急いで行動すると必ず失敗する",
                    "最もよい時期が来るまで何もしない",
                    "よいと思ったことはすぐに実行するのがよい"
                ],
                correctAnswerIndex: 3,
                explanation: "『善は急げ』は、よいと思ったことはすぐに実行するのがよいという意味です。"
            ),

            QuizQuestion(
                question: "『先生が大切なことを言いました』を尊敬語を使った文に直したものはどれですか？",
                choices: [
                    "先生が大切なことをおっしゃいました",
                    "先生が大切なことを申しました",
                    "先生が大切なことを申し上げました",
                    "先生が大切なことを言わせていただきました"
                ],
                correctAnswerIndex: 0,
                explanation: "『言う』の尊敬語は『おっしゃる』なので、『先生が大切なことをおっしゃいました』が正解です。"
            ),

            QuizQuestion(
                question: "『この景色を忘れられるだろうか。』で、忘れられないという気持ちを強く表すために使われている表現技法はどれですか？",
                choices: [
                    "倒置法",
                    "反語",
                    "擬人法",
                    "直喩"
                ],
                correctAnswerIndex: 1,
                explanation: "問いかけの形で『忘れられない』という反対の意味を強く表しているので、使われている表現技法は『反語』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【漢字の読み】つぎの漢字の読みをひらがなで答えましょう。\n『討論』",
                answer: "とうろん",
                explanation: "『討論』の読みは『とうろん』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】四字熟語を答えましょう。\n『何かに心を奪われ、我を忘れて熱中する様子を ＿＿ といいます。』",
                answer: "無我夢中",
                acceptableAnswers: ["むがむちゅう"],
                explanation: "何かに心を奪われ、我を忘れて熱中する様子を『無我夢中』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】ことわざを答えましょう。\n『人から教わるだけでなく、実際に何度も行うことで身につくという意味のことわざを ＿＿ といいます。』",
                answer: "習うより慣れよ",
                acceptableAnswers: ["ならうよりなれよ"],
                explanation: "実際に何度も行うことで身につくという意味のことわざは『習うより慣れよ』です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】『見せる』の謙譲語を使って文を完成させましょう。\n『これから、わたしの作品を先生に ＿＿。』",
                answer: "お目にかけます",
                acceptableAnswers: ["おめにかけます"],
                explanation: "『見せる』の謙譲語は『お目にかける』なので、『わたしの作品を先生にお目にかけます』となります。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、他人に頼らず自分の信じる道を進むことを表す四字熟語をそのまま抜き出しましょう。\n『周囲の意見も聞きながら、最後は独立独歩の姿勢で研究を続けた。』",
                answer: "独立独歩",
                explanation: "他人に頼らず自分の信じる道を進むことを表す四字熟語は『独立独歩』です。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】同じ読み方をする漢字の言葉と意味を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "意義", match: "物事の価値や大切さ"),
                    QuizMatchingPair(prompt: "異議", match: "反対の意見"),
                    QuizMatchingPair(prompt: "意思", match: "何かをしようとする考え"),
                    QuizMatchingPair(prompt: "医師", match: "病気やけがを診る人")
                ],
                choices: [
                    "病気やけがを診る人",
                    "物事の価値や大切さ",
                    "何かをしようとする考え",
                    "反対の意見"
                ],
                explanation: "『意義=物事の価値や大切さ』『異議=反対の意見』『意思=何かをしようとする考え』『医師=病気やけがを診る人』が正しい組み合わせです。"
            ),

            QuizQuestion(
                question: "家に来た客に、自分の母が後で電話すると伝える言い方として最も適切なものはどれですか？",
                choices: [
                    "お母様が後ほどお電話なさいます",
                    "母が後ほどお電話になります",
                    "母が後ほどお電話いたします",
                    "母上が後ほど電話されます"
                ],
                correctAnswerIndex: 2,
                explanation: "客に対して自分の母を高めず、母の動作をへりくだって表す『母が後ほどお電話いたします』が適切です。"
            ),

            QuizQuestion(
                question: "『校庭にベンチを増やすべきだ』という主張を最も強く支える根拠はどれですか？",
                choices: [
                    "わたしは外で友達と話すのが好きだから",
                    "ベンチの色を明るくすると楽しそうだから",
                    "近くの公園にはベンチがたくさんあるから",
                    "全校調査で、昼休みに座れなかった経験がある児童が71％だったから"
                ],
                correctAnswerIndex: 3,
                explanation: "正解は『全校調査で、昼休みに座れなかった経験がある児童が71％だったから』です。具体的な調査結果は、ベンチを増やす必要性を直接示す根拠になります。"
            ),

            QuizQuestion(
                question: "論説文の冒頭で『フードロスとは、まだ食べられる食品が捨てられることだ』と用語を定義する主な目的はどれですか？",
                choices: [
                    "用語の意味を読み手と共有し、後の説明を分かりやすくするため",
                    "筆者の結論を最後まで隠すため",
                    "具体例をすべて省略するため",
                    "反対意見だけを強調するため"
                ],
                correctAnswerIndex: 0,
                explanation: "正解は『用語の意味を読み手と共有し、後の説明を分かりやすくするため』です。用語を最初に定義すると、その後の説明が理解しやすくなります。"
            ),

            QuizQuestion(
                question: "第一段落で森林減少の問題を示し、第二・第三段落で原因と影響を説明し、第四段落で対策を提案しています。この文章の構成として正しいものはどれですか？",
                choices: [
                    "結論→具体例→問題提起",
                    "問題提起→原因と影響の説明→対策の提案",
                    "具体例→反対意見→用語の定義",
                    "対策の提案→問題提起→原因の説明"
                ],
                correctAnswerIndex: 1,
                explanation: "この文章は、『問題提起→原因と影響の説明→対策の提案』という構成です。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】表現に関する言葉を答えましょう。\n『「青い空、朱色の雲、金色の光」のように、色を表す言葉を ＿＿ といいます。』",
                answer: "色彩語",
                acceptableAnswers: ["しきさいご"],
                explanation: "色を表し、情景を鮮やかに伝える言葉を『色彩語』といいます。"
            ),

            QuizQuestion.fillInBlank(
                question: "【穴うめ】国語の言葉を答えましょう。\n『個人の好みや感情に左右されず、事実に基づいている性質を ＿＿ といいます。』",
                answer: "客観性",
                acceptableAnswers: ["きゃっかんせい"],
                explanation: "個人の好みや感情に左右されず、事実に基づいている性質を『客観性』といいます。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文から、分からないことはためらわず質問した方がよいという意味のことわざをそのまま抜き出しましょう。\n『質問するのを恥ずかしがる友達に、先生は「聞くは一時の恥、聞かぬは一生の恥」と伝えた。』",
                answer: "聞くは一時の恥、聞かぬは一生の恥",
                explanation: "分からないことはためらわず質問した方がよいという意味のことわざは『聞くは一時の恥、聞かぬは一生の恥』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの文章から、校内放送の音量を場所ごとに調整すべきだという主張を直接支える測定結果をそのまま抜き出しましょう。\n『校内放送の音量は場所ごとに調整すべきだ。先月の測定では、体育館では基準より小さく、図書室では基準より大きかった。放送委員は毎週水曜日に活動している。』",
                answer: "先月の測定では、体育館では基準より小さく、図書室では基準より大きかった",
                acceptableAnswers: ["先月の測定では、体育館では基準より小さく、図書室では基準より大きかった。"],
                explanation: "主張を直接支える測定結果は、『先月の測定では、体育館では基準より小さく、図書室では基準より大きかった』です。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの論説文から、水筒の利用を広げることに対する反対意見をそのまま抜き出しましょう。\n『学校では水筒の利用をさらに広げるべきだ。これに対して、水筒は毎日洗う手間がかかるという意見もある。しかし、使い捨て容器を減らせる利点は大きい。』",
                answer: "水筒は毎日洗う手間がかかる",
                acceptableAnswers: [
                    "水筒は毎日洗う手間がかかるという意見",
                    "水筒は毎日洗う手間がかかるという意見もある"
                ],
                explanation: "筆者が取り上げている反対意見は、『水筒は毎日洗う手間がかかる』です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】電話で相手に丁寧にお願いする文になるように、言葉を正しい順番に並べましょう。",
                choices: [
                    "お聞かせ",
                    "恐れ入りますが、",
                    "ください",
                    "お名前をもう一度"
                ],
                orderedChoices: [
                    "恐れ入りますが、",
                    "お名前をもう一度",
                    "お聞かせ",
                    "ください"
                ],
                explanation: "『恐れ入りますが、お名前をもう一度お聞かせください。』が正しい順番です。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】「遠く、遠く」という反復の効果を説明する文に並べましょう。",
                choices: [
                    "思いの強さを表している",
                    "詩人は",
                    "距離の広がりと",
                    "「遠く、遠く」と重ねることで"
                ],
                orderedChoices: [
                    "詩人は",
                    "「遠く、遠く」と重ねることで",
                    "距離の広がりと",
                    "思いの強さを表している"
                ],
                explanation: "『詩人は「遠く、遠く」と重ねることで、距離の広がりと思いの強さを表している。』が正しい順番です。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】四字熟語が表す内容を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "百戦錬磨", match: "多くの経験を積んで鍛えられている"),
                    QuizMatchingPair(prompt: "心機一転", match: "気持ちを切り替えて新しく始める"),
                    QuizMatchingPair(prompt: "前代未聞", match: "これまで聞いたことがないほど珍しい"),
                    QuizMatchingPair(prompt: "一目瞭然", match: "ひと目ではっきり分かる")
                ],
                choices: [
                    "ひと目ではっきり分かる",
                    "これまで聞いたことがないほど珍しい",
                    "多くの経験を積んで鍛えられている",
                    "気持ちを切り替えて新しく始める"
                ],
                explanation: "『百戦錬磨=多くの経験を積んで鍛えられている』『心機一転=気持ちを切り替えて新しく始める』『前代未聞=これまで聞いたことがないほど珍しい』『一目瞭然=ひと目ではっきり分かる』が正しい組み合わせです。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】LEDへの交換を提案する意見文として自然な順番に並べましょう。",
                choices: [
                    "実際に、同じ規模の隣校では交換後の電力使用量が前年より18％減った。",
                    "以上から、費用を検討しながら計画的に交換を進めるべきだ。",
                    "なぜなら、消費電力を減らせるからだ。",
                    "わたしは、教室の照明をLEDに交換すべきだと考える。"
                ],
                orderedChoices: [
                    "わたしは、教室の照明をLEDに交換すべきだと考える。",
                    "なぜなら、消費電力を減らせるからだ。",
                    "実際に、同じ規模の隣校では交換後の電力使用量が前年より18％減った。",
                    "以上から、費用を検討しながら計画的に交換を進めるべきだ。"
                ],
                explanation: "主張、理由、具体的なデータ、条件を加えた結論の順に並べると、主張と根拠のつながりが明確になります。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】反対意見に応じて結論を導く論説文になるように、文を正しい順番に並べましょう。",
                choices: [
                    "したがって、課題への対策を考えながら活用することが大切だ。",
                    "しかし、カメラの位置や話し方を工夫すれば、理解しやすくなる。",
                    "オンライン交流には、遠くの人と話せる利点がある。",
                    "一方で、相手の表情が伝わりにくいという意見もある。"
                ],
                orderedChoices: [
                    "オンライン交流には、遠くの人と話せる利点がある。",
                    "一方で、相手の表情が伝わりにくいという意見もある。",
                    "しかし、カメラの位置や話し方を工夫すれば、理解しやすくなる。",
                    "したがって、課題への対策を考えながら活用することが大切だ。"
                ],
                explanation: "利点、反対意見、反対意見への応答、結論の順に並べると、論説文の流れが明確になります。"
            ),

            QuizQuestion.reorder(
                question: "【並べ替え】川の水質調査を報告する文章として自然な順番に並べましょう。",
                choices: [
                    "最後に、その傾向から考えられる原因をまとめた。",
                    "続いて、数値を比較して分かった傾向を述べた。",
                    "まず、地域の川の水質を調べる目的を示した。",
                    "次に、三地点で行った調査方法を説明した。"
                ],
                orderedChoices: [
                    "まず、地域の川の水質を調べる目的を示した。",
                    "次に、三地点で行った調査方法を説明した。",
                    "続いて、数値を比較して分かった傾向を述べた。",
                    "最後に、その傾向から考えられる原因をまとめた。"
                ],
                explanation: "調査報告は、目的、方法、結果から分かった傾向、原因についての考察の順にまとめると分かりやすくなります。"
            ),

            QuizQuestion.extractText(
                question: "【抜き出し】つぎの段落から、段落全体の中心となる文をそのまま抜き出しましょう。\n『地域の行事を記録することには大切な意味がある。記録があれば、行事の由来や変化を次の世代に伝えられる。また、写真や聞き取りを残すことで、地域の人々の思いも共有できる。』",
                answer: "地域の行事を記録することには大切な意味がある",
                acceptableAnswers: ["地域の行事を記録することには大切な意味がある。"],
                explanation: "後の二文が具体的な理由を述べているため、段落全体の中心となる文は『地域の行事を記録することには大切な意味がある』です。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】ことわざが表す教えを正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "百聞は一見にしかず", match: "何度も聞くより一度実際に見る方がよく分かる"),
                    QuizMatchingPair(prompt: "論より証拠", match: "議論するより事実を示す方が確かである"),
                    QuizMatchingPair(prompt: "鉄は熱いうちに打て", match: "時機を逃さずに行動したり教えたりするのがよい"),
                    QuizMatchingPair(prompt: "失敗は成功のもと", match: "失敗から学ぶことが成功につながる")
                ],
                choices: [
                    "失敗から学ぶことが成功につながる",
                    "何度も聞くより一度実際に見る方がよく分かる",
                    "時機を逃さずに行動したり教えたりするのがよい",
                    "議論するより事実を示す方が確かである"
                ],
                explanation: "『百聞は一見にしかず=何度も聞くより一度実際に見る方がよく分かる』『論より証拠=議論するより事実を示す方が確かである』『鉄は熱いうちに打て=時機を逃さずに行動したり教えたりするのがよい』『失敗は成功のもと=失敗から学ぶことが成功につながる』が正しい組み合わせです。"
            ),

            QuizQuestion.matching(
                question: "【組み合わせ】感覚に訴える表現の種類と例を正しく組み合わせましょう。",
                pairs: [
                    QuizMatchingPair(prompt: "視覚表現", match: "きらきら光る銀色の波"),
                    QuizMatchingPair(prompt: "聴覚表現", match: "遠くで鐘の音が響く"),
                    QuizMatchingPair(prompt: "触覚表現", match: "氷のように冷たい風"),
                    QuizMatchingPair(prompt: "嗅覚表現", match: "焼きたてのパンの香り")
                ],
                choices: [
                    "焼きたてのパンの香り",
                    "氷のように冷たい風",
                    "きらきら光る銀色の波",
                    "遠くで鐘の音が響く"
                ],
                explanation: "『視覚表現=きらきら光る銀色の波』『聴覚表現=遠くで鐘の音が響く』『触覚表現=氷のように冷たい風』『嗅覚表現=焼きたてのパンの香り』が正しい組み合わせです。"
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
            quizLevel: .kokugo6,
            authManager: authManager,
            audioManager: audioManager,
            isPresenting: $isPresenting,
            interstitial: sharedInterstitial
        )
    }
}

struct Kokugo6ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo6ListView(isPresenting: .constant(false))
    }
}
