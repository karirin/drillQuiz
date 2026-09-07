//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Kokugo1ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『そらに もくもくした しろい ＿＿ が うかんでいます。』",
            answer: "くも",
            explanation: "『そらに もくもくした しろい くも が うかんでいます。』が自然です。"
        ),

        QuizQuestion.fillInBlank(
            question: "【穴うめ】つぎの文の ＿＿ に入ることばを ひらがなで答えましょう。\n『ねるまえに えを みながら ＿＿ を よみます。』",
            answer: "えほん",
            acceptableAnswers: ["絵本"],
            explanation: "『ねるまえに えを みながら えほん を よみます。』が自然です。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「あかい はな」と書いてあるところを そのまま ぬき出しましょう。\n『にわに あかい はな が さいています。』",
            answer: "あかい はな",
            acceptableAnswers: ["あかいはな"],
            explanation: "文の中では『あかい はな』と書かれています。"
        ),

        QuizQuestion.extractText(
            question: "【抜き出し】つぎの文を読み、「どこへ いきますか」に答えることばを そのまま ぬき出しましょう。\n『ゆうたは がっこうへ いきます。』",
            answer: "がっこうへ",
            explanation: "『どこへ』にあたることばは『がっこうへ』です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["よみます", "わたしは", "ほんを"],
            orderedChoices: ["わたしは", "ほんを", "よみます"],
            explanation: "『わたしは ほんを よみます。』が正しい順番です。"
        ),

        QuizQuestion.reorder(
            question: "【並べ替え】ことばを ただしい じゅんに ならべて 文を つくりましょう。",
            choices: ["はしります", "いぬが", "こうえんを"],
            orderedChoices: ["いぬが", "こうえんを", "はしります"],
            explanation: "『いぬが こうえんを はしります。』が正しい順番です。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと よみかたが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "山", match: "やま"),
                QuizMatchingPair(prompt: "川", match: "かわ"),
                QuizMatchingPair(prompt: "空", match: "そら")
            ],
            choices: ["そら", "かわ", "やま"],
            explanation: "『山=やま』『川=かわ』『空=そら』の組み合わせです。"
        ),

        QuizQuestion.matching(
            question: "【組み合わせ】ことばと いみが 合うように えらびましょう。",
            pairs: [
                QuizMatchingPair(prompt: "あさ", match: "ひるより まえ"),
                QuizMatchingPair(prompt: "よる", match: "ねる じかん"),
                QuizMatchingPair(prompt: "はる", match: "さくらの きせつ")
            ],
            choices: ["ねる じかん", "さくらの きせつ", "ひるより まえ"],
            explanation: "『あさ=ひるより まえ』『よる=ねる じかん』『はる=さくらの きせつ』が正しい組み合わせです。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『雲』",
            choices: [
                "くも",
                "うみ",
                "ほし",
                "やま"
            ],
            correctAnswerIndex: 0,
            explanation: "『雲』の正しい読みは「くも」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『山』",
            choices: [
                "かわ",
                "もり",
                "やま",
                "うみ"
            ],
            correctAnswerIndex: 2,
            explanation: "『山』の正しい読みは「やま」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『風』",
            choices: [
                "から",
                "かぜ",
                "そら",
                "はな"
            ],
            correctAnswerIndex: 1,
            explanation: "『風』の正しい読みは「かぜ」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『石』",
            choices: [
                "いし",
                "ほし",
                "き",
                "かわ"
            ],
            correctAnswerIndex: 0,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『空』",
            choices: [
                "おり",
                "こん",
                "そら",
                "ほし"
            ],
            correctAnswerIndex: 2,
            explanation: "『空』の正しい読みは「そら」です。"
        ),
        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『山＿＿登ります』",
            choices: [
                "が",
                "た",
                "と",
                "を"
            ],
            correctAnswerIndex: 3,
            explanation: "『山を登ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『星』",
            choices: [
                "ひし",
                "ほし",
                "はな",
                "ほう"
            ],
            correctAnswerIndex: 1,
            explanation: "『星』の正しい読みは「ほし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『川＿＿泳ぎます』",
            choices: [
                "で",
                "ぱ",
                "に",
                "が"
            ],
            correctAnswerIndex: 0,
            explanation: "『川で泳ぎます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『花』",
            choices: [
                "はな",
                "かき",
                "は",
                "なし"
            ],
            correctAnswerIndex: 0,
            explanation: "『花』の正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『友だち＿＿遊びます』",
            choices: [
                "と",
                "に",
                "を",
                "へ"
            ],
            correctAnswerIndex: 0,
            explanation: "『友だちと遊びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『月』",
            choices: [
                "かつ",
                "つき",
                "ひ",
                "ほし"
            ],
            correctAnswerIndex: 1,
            explanation: "『月』の正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『鳥＿＿飛んでいます』",
            choices: [
                "に",
                "が",
                "を",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『鳥が飛んでいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『川』",
            choices: [
                "かわ",
                "か",
                "かわら",
                "せん"
            ],
            correctAnswerIndex: 0,
            explanation: "『川』の正しい読みは「かわ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『空＿＿見上げます』",
            choices: [
                "が",
                "を",
                "に",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『空を見上げます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『石』",
            choices: [
                "らん",
                "いし",
                "こいし",
                "もり"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『犬＿＿散歩します』",
            choices: [
                "に",
                "を",
                "で",
                "が"
            ],
            correctAnswerIndex: 1,
            explanation: "『犬を散歩します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『木』",
            choices: [
                "き",
                "くう",
                "こ",
                "はやし"
            ],
            correctAnswerIndex: 0,
            explanation: "『木』の正しい読みは「き」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『ねこ＿＿います』",
            choices: [
                "に",
                "を",
                "が",
                "へ"
            ],
            correctAnswerIndex: 2,
            explanation: "『ねこがいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『火』",
            choices: [
                "あか",
                "き",
                "ひ",
                "ほ"
            ],
            correctAnswerIndex: 2,
            explanation: "『火』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『本＿＿読みます』",
            choices: [
                "に",
                "を",
                "が",
                "で"
            ],
            correctAnswerIndex: 1,
            explanation: "『本を読みます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『月』",
            choices: [
                "ほし",
                "つき",
                "ひ",
                "ほ"
            ],
            correctAnswerIndex: 1,
            explanation: "『月』の正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『友だち＿＿話します』",
            choices: [
                "を",
                "な",
                "か",
                "と"
            ],
            correctAnswerIndex: 3,
            explanation: "『友だちと話します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『花』",
            choices: [
                "はな",
                "かき",
                "ばな",
                "は"
            ],
            correctAnswerIndex: 0,
            explanation: "『花』の正しい読みは「はな」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『学校＿＿行きます』",
            choices: [
                "を",
                "で",
                "に",
                "が"
            ],
            correctAnswerIndex: 2,
            explanation: "『学校に行きます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『風』",
            choices: [
                "はやし",
                "おり",
                "かぜ",
                "ふ"
            ],
            correctAnswerIndex: 2,
            explanation: "『風』の正しい読みは「かぜ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『花＿＿咲いています』",
            choices: [
                "が",
                "を",
                "で",
                "へ"
            ],
            correctAnswerIndex: 0,
            explanation: "『花が咲いています』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『空』",
            choices: [
                "そら",
                "けい",
                "さん",
                "あお"
            ],
            correctAnswerIndex: 0,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『家＿＿帰ります』",
            choices: [
                "を",
                "が",
                "で",
                "へ"
            ],
            correctAnswerIndex: 3,
            explanation: "『家へ帰ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『木』",
            choices: [
                "かき",
                "き",
                "はやし",
                "こ"
            ],
            correctAnswerIndex: 1,
            explanation: "『木』の正しい読みは「き」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『山＿＿登ります』",
            choices: [
                "や",
                "は",
                "が",
                "に"
            ],
            correctAnswerIndex: 3,
            explanation: "『山に登ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『雨』",
            choices: [
                "はれ",
                "かん",
                "あめ",
                "あお"
            ],
            correctAnswerIndex: 2,
            explanation: "『雨』の正しい読みは「あめ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『空＿＿飛びます』",
            choices: [
                "を",
                "が",
                "ぽ",
                "ぬ"
            ],
            correctAnswerIndex: 0,
            explanation: "『空を飛びます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『火』",
            choices: [
                "ひ",
                "な",
                "ほ",
                "あか"
            ],
            correctAnswerIndex: 0,
            explanation: "『火』の正しい読みは「ひ」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『川＿＿泳ぎます』",
            choices: [
                "は",
                "に",
                "で",
                "な"
            ],
            correctAnswerIndex: 2,
            explanation: "『川で泳ぎます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『石』",
            choices: [
                "こいし",
                "いし",
                "かん",
                "いわ"
            ],
            correctAnswerIndex: 1,
            explanation: "『石』の正しい読みは「いし」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『犬＿＿走ります』",
            choices: [
                "を",
                "が",
                "で",
                "に"
            ],
            correctAnswerIndex: 1,
            explanation: "『犬が走ります』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『山』",
            choices: [
                "やま",
                "かん",
                "もり",
                "かわ"
            ],
            correctAnswerIndex: 0,
            explanation: "『山』の正しい読みは「やま」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『お母さん＿＿話します』",
            choices: [
                "と",
                "を",
                "が",
                "じ"
            ],
            correctAnswerIndex: 0,
            explanation: "『お母さんと話します』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『空』",
            choices: [
                "たま",
                "みず",
                "そら",
                "あお"
            ],
            correctAnswerIndex: 2,
            explanation: "『空』の正しい読みは「そら」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『先生＿＿会います』",
            choices: [
                "ぽ",
                "を",
                "に",
                "で"
            ],
            correctAnswerIndex: 2,
            explanation: "『先生に会います』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『月』",
            choices: [
                "つき",
                "ほし",
                "ひ",
                "かげ"
            ],
            correctAnswerIndex: 0,
            explanation: "『月』の正しい読みは「つき」です。"
        ),

        QuizQuestion(
            question: "次の文に正しい助詞を入れましょう。\n『ねこ＿＿います』",
            choices: [
                "に",
                "が",
                "を",
                "へ"
            ],
            correctAnswerIndex: 1,
            explanation: "『ねこがいます』が正しい文です。"
        ),

        QuizQuestion(
            question: "次の漢字の読みはどれですか？\n　　　　　『木』",
            choices: [
                "き",
                "こ",
                "りん",
                "はやし"
            ],
            correctAnswerIndex: 0,
            explanation: "『木』の正しい読みは「き」です。"
        ),

        QuizQuestion(
        question: "『きって』に つかわれている 小さい ひらがなは どれですか？",
        choices: [
        "っ",
        "つ",
        "ゅ",
        "ょ"
        ],
        correctAnswerIndex: 0,
        explanation: "『きって』では、小さい『っ』を つかいます。"
        ),

        QuizQuestion(
        question: "『ぱん』の さいしょの ひらがなは どれですか？",
        choices: [
        "は",
        "ぱ",
        "ば",
        "ぴ"
        ],
        correctAnswerIndex: 1,
        explanation: "『ぱん』の さいしょの ひらがなは『ぱ』です。"
        ),

        QuizQuestion(
        question: "ひらがな『ぬ』と おなじ 音の カタカナは どれですか？",
        choices: [
        "ネ",
        "ノ",
        "ヌ",
        "メ"
        ],
        correctAnswerIndex: 2,
        explanation: "ひらがな『ぬ』と おなじ 音の カタカナは『ヌ』です。"
        ),

        QuizQuestion(
        question: "『バス』の さいごの カタカナは どれですか？",
        choices: [
        "バ",
        "サ",
        "ズ",
        "ス"
        ],
        correctAnswerIndex: 3,
        explanation: "『バス』の さいごの カタカナは『ス』です。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『糸』",
        choices: [
        "いと",
        "うた",
        "かい",
        "たけ"
        ],
        correctAnswerIndex: 0,
        explanation: "『糸』の 読みは『いと』です。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『貝』",
        choices: [
        "いし",
        "かい",
        "くさ",
        "むし"
        ],
        correctAnswerIndex: 1,
        explanation: "『貝』の 読みは『かい』です。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『竹』",
        choices: [
        "いと",
        "つち",
        "たけ",
        "まち"
        ],
        correctAnswerIndex: 2,
        explanation: "『竹』の 読みは『たけ』です。"
        ),

        QuizQuestion(
        question: "『そっと』の いみとして いちばん よいものは どれですか？",
        choices: [
        "大きな こえで",
        "いそいで",
        "何度も",
        "しずかに やさしく"
        ],
        correctAnswerIndex: 3,
        explanation: "『そっと』は、しずかに やさしく する ようすを あらわします。"
        ),

        QuizQuestion(
        question: "『ぴかぴか』の いみとして いちばん よいものは どれですか？",
        choices: [
        "光って きれいな ようす",
        "音が 小さい ようす",
        "ゆっくり 歩く ようす",
        "雨が ふる ようす"
        ],
        correctAnswerIndex: 0,
        explanation: "『ぴかぴか』は、光って きれいな ようすを あらわします。"
        ),

        QuizQuestion(
        question: "『ならぶ』の いみとして いちばん よいものは どれですか？",
        choices: [
        "一人で はしる",
        "じゅんに つらなる",
        "ものを かくす",
        "声を 出して よむ"
        ],
        correctAnswerIndex: 1,
        explanation: "『ならぶ』は、ものや 人が じゅんに つらなることです。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『つくえの うえ ＿＿ 本が あります。』",
        choices: [
        "を",
        "で",
        "に",
        "へ"
        ],
        correctAnswerIndex: 2,
        explanation: "『つくえの うえに 本が あります。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『雨 ＿＿ ふったので、かさを さしました。』",
        choices: [
        "を",
        "に",
        "で",
        "が"
        ],
        correctAnswerIndex: 3,
        explanation: "『雨が ふったので、かさを さしました。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『えんぴつ ＿＿ 字を かきます。』",
        choices: [
        "で",
        "を",
        "が",
        "へ"
        ],
        correctAnswerIndex: 0,
        explanation: "『えんぴつで 字を かきます。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『みおは 朝、あさがおに 水を やりました。昼に 見ると、花が ひらいていました。みおは うれしく なりました。』\nみおが 朝に したことは どれですか？",
        choices: [
        "花を つみました",
        "あさがおに 水を やりました",
        "はちを うごかしました",
        "たねを まきました"
        ],
        correctAnswerIndex: 1,
        explanation: "みおが 朝に したことは『あさがおに 水を やりました』です。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『こうたは 青い ぼうしを かぶり、黄色い かばんを もって 出かけました。』\nこうたの かばんは 何色ですか？",
        choices: [
        "青",
        "赤",
        "黄色",
        "白"
        ],
        correctAnswerIndex: 2,
        explanation: "こうたの かばんは『黄色』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『きゃく』の ＿＿ に 入る 小さい ひらがなを 答えましょう。\n『き ＿＿ く』",
        answer: "ゃ",
        explanation: "『きゃく』では、小さい『ゃ』を 入れます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『テレビ』の ＿＿ に 入る カタカナを 答えましょう。\n『テ ＿＿ ビ』",
        answer: "レ",
        explanation: "『テレビ』の ＿＿ に 入る カタカナは『レ』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『うれしい』と はんたいの いみの ことばを 答えましょう。",
        answer: "かなしい",
        acceptableAnswers: ["悲しい"],
        explanation: "『うれしい』と はんたいの いみの ことばは『かなしい』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】つぎの 文の ＿＿ に 入る 助詞を 答えましょう。\n『おとうとは こうえん ＿＿ あそびます。』",
        answer: "で",
        explanation: "『おとうとは こうえんで あそびます。』が 正しい 文です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『りなは 白い うさぎに にんじんを あげました。うさぎは すぐに 食べました。』\nうさぎが 食べたものは ＿＿ です。",
        answer: "にんじん",
        explanation: "うさぎが 食べたものは『にんじん』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『あきらは 月よう日に 本を かりました。金よう日に かえしました。』\nあきらが 本を かえしたのは ＿＿ です。",
        answer: "きんようび",
        acceptableAnswers: ["金よう日", "金曜日"],
        explanation: "あきらが 本を かえしたのは『きんようび』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『さきは つくえの ひきだしに はさみを しまいました。』\nはさみが ある ところは ＿＿ です。",
        answer: "ひきだし",
        acceptableAnswers: ["つくえのひきだし", "つくえの ひきだし"],
        explanation: "はさみが ある ところは『ひきだし』です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『だれが・どこで・なにを・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["かきます", "きょうしつで", "ゆいが", "えを"],
        orderedChoices: ["ゆいが", "きょうしつで", "えを", "かきます"],
        explanation: "『ゆいが きょうしつで えを かきます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・だれが・どこへ・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["どうぶつえんへ", "あした", "いきます", "ぼくは"],
        orderedChoices: ["あした", "ぼくは", "どうぶつえんへ", "いきます"],
        explanation: "『あした ぼくは どうぶつえんへ いきます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・どこで・なにが・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["すべります", "きょう", "こおりの うえで", "ペンギンが"],
        orderedChoices: ["きょう", "こおりの うえで", "ペンギンが", "すべります"],
        explanation: "『きょう こおりの うえで ペンギンが すべります。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・だれと・どこで・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["あそびます", "いもうとと", "ほうかご", "にわで"],
        orderedChoices: ["ほうかご", "いもうとと", "にわで", "あそびます"],
        explanation: "『ほうかご いもうとと にわで あそびます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『どんな・ものが・どこに・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["みちに", "とまっています", "あかい", "くるまが"],
        orderedChoices: ["あかい", "くるまが", "みちに", "とまっています"],
        explanation: "『あかい くるまが みちに とまっています。』が 正しい じゅんです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】ことばと、さいしょの ひらがなを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "えんぴつ", match: "え"),
        QuizMatchingPair(prompt: "おにぎり", match: "お"),
        QuizMatchingPair(prompt: "うでどけい", match: "う"),
        QuizMatchingPair(prompt: "かさ", match: "か")
        ],
        choices: ["お", "か", "う", "え"],
        explanation: "『えんぴつ=え』『おにぎり=お』『うでどけい=う』『かさ=か』の 組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】カタカナの ことばと いみを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "アイスクリーム", match: "つめたい おかし"),
        QuizMatchingPair(prompt: "ドア", match: "でいりぐちを あけしめする もの"),
        QuizMatchingPair(prompt: "コップ", match: "のみものを 入れる もの"),
        QuizMatchingPair(prompt: "テレビ", match: "えいぞうを うつす もの")
        ],
        choices: [
        "えいぞうを うつす もの",
        "のみものを 入れる もの",
        "つめたい おかし",
        "でいりぐちを あけしめする もの"
        ],
        explanation: "『アイスクリーム=つめたい おかし』『ドア=でいりぐちを あけしめする もの』『コップ=のみものを 入れる もの』『テレビ=えいぞうを うつす もの』の 組み合わせです。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】漢字と 読みかたを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "足", match: "あし"),
        QuizMatchingPair(prompt: "目", match: "め"),
        QuizMatchingPair(prompt: "口", match: "くち"),
        QuizMatchingPair(prompt: "手", match: "て")
        ],
        choices: ["くち", "て", "あし", "め"],
        explanation: "『足=あし』『目=め』『口=くち』『手=て』の 組み合わせです。"
        ),
        QuizQuestion(
        question: "『ぎゅうにゅう』で、さいしょに つかわれている 小さい ひらがなは どれですか？",
        choices: [
        "ゅ",
        "ゃ",
        "ょ",
        "っ"
        ],
        correctAnswerIndex: 0,
        explanation: "『ぎゅうにゅう』で、さいしょに つかわれている 小さい ひらがなは『ゅ』です。"
        ),

        QuizQuestion(
        question: "『ぼうし』の さいしょの ひらがなは どれですか？",
        choices: [
        "ほ",
        "ぼ",
        "ぽ",
        "は"
        ],
        correctAnswerIndex: 1,
        explanation: "『ぼうし』の さいしょの ひらがなは『ぼ』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『ちょきん』の ＿＿ に 入る 小さい ひらがなを 答えましょう。\n『ち ＿＿ きん』",
        answer: "ょ",
        explanation: "『ちょきん』では、小さい『ょ』を 入れます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】ことばと、さいごの ひらがなを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "すいか", match: "か"),
        QuizMatchingPair(prompt: "たぬき", match: "き"),
        QuizMatchingPair(prompt: "くるま", match: "ま"),
        QuizMatchingPair(prompt: "ねずみ", match: "み")
        ],
        choices: ["み", "か", "ま", "き"],
        explanation: "『すいか=か』『たぬき=き』『くるま=ま』『ねずみ=み』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "ひらがな『れ』と おなじ 音の カタカナは どれですか？",
        choices: [
        "ル",
        "ロ",
        "レ",
        "ワ"
        ],
        correctAnswerIndex: 2,
        explanation: "ひらがな『れ』と おなじ 音の カタカナは『レ』です。"
        ),

        QuizQuestion(
        question: "『ジュース』で、小さく 書く カタカナは どれですか？",
        choices: [
        "ユ",
        "ヨ",
        "ョ",
        "ュ"
        ],
        correctAnswerIndex: 3,
        explanation: "『ジュース』では、小さい『ュ』を つかいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『カメラ』の ＿＿ に 入る カタカナを 答えましょう。\n『カ ＿＿ ラ』",
        answer: "メ",
        explanation: "『カメラ』の ＿＿ に 入る カタカナは『メ』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】カタカナの ことばと、さいごの カタカナを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ピアノ", match: "ノ"),
        QuizMatchingPair(prompt: "トマト", match: "ト"),
        QuizMatchingPair(prompt: "コアラ", match: "ラ"),
        QuizMatchingPair(prompt: "バナナ", match: "ナ")
        ],
        choices: ["ラ", "ナ", "ノ", "ト"],
        explanation: "『ピアノ=ノ』『トマト=ト』『コアラ=ラ』『バナナ=ナ』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『耳』",
        choices: [
        "みみ",
        "くち",
        "め",
        "はな"
        ],
        correctAnswerIndex: 0,
        explanation: "『耳』の 読みは『みみ』です。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『森』",
        choices: [
        "はやし",
        "もり",
        "そら",
        "やま"
        ],
        correctAnswerIndex: 1,
        explanation: "『森』の 読みは『もり』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】つぎの 漢字の 読みを ひらがなで 答えましょう。\n『男』",
        answer: "おとこ",
        explanation: "『男』の 読みは『おとこ』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】漢字と 読みかたを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "町", match: "まち"),
        QuizMatchingPair(prompt: "村", match: "むら"),
        QuizMatchingPair(prompt: "赤", match: "あか"),
        QuizMatchingPair(prompt: "青", match: "あお")
        ],
        choices: ["あお", "むら", "まち", "あか"],
        explanation: "『町=まち』『村=むら』『赤=あか』『青=あお』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "『からっぽ』の いみとして いちばん よいものは どれですか？",
        choices: [
        "ものが 一つだけ 入っている ようす",
        "中が いっぱいの ようす",
        "中に 何も 入っていない ようす",
        "そとが 明るい ようす"
        ],
        correctAnswerIndex: 2,
        explanation: "『からっぽ』は、中に 何も 入っていない ようすを あらわします。"
        ),

        QuizQuestion(
        question: "『まぶしい』の いみとして いちばん よいものは どれですか？",
        choices: [
        "音が 大きくて みみを ふさぐ ようす",
        "さむくて からだが ふるえる ようす",
        "においが つよくて はなを おさえる ようす",
        "ひかりが つよくて 目を あけにくい ようす"
        ],
        correctAnswerIndex: 3,
        explanation: "『まぶしい』は、ひかりが つよくて 目を あけにくい ようすを あらわします。"
        ),

        QuizQuestion(
        question: "『しっかり』の いみとして いちばん よいものは どれですか？",
        choices: [
        "きちんと している ようす",
        "とても ゆっくりな ようす",
        "すこしだけの ようす",
        "こえを 出さない ようす"
        ],
        correctAnswerIndex: 0,
        explanation: "『しっかり』は、『きちんと している ようす』という いみです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『はやい』と はんたいの いみの ことばを 答えましょう。",
        answer: "おそい",
        acceptableAnswers: ["遅い"],
        explanation: "『はやい』と はんたいの いみの ことばは『おそい』です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『はさみ ＿＿ かみを きります。』",
        choices: [
        "を",
        "で",
        "に",
        "と"
        ],
        correctAnswerIndex: 1,
        explanation: "『はさみで かみを きります。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『おさら ＿＿ ケーキを のせます。』",
        choices: [
        "で",
        "を",
        "に",
        "が"
        ],
        correctAnswerIndex: 2,
        explanation: "『おさらに ケーキを のせます。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『えき ＿＿ でんしゃに のります。』",
        choices: [
        "へ",
        "を",
        "と",
        "で"
        ],
        correctAnswerIndex: 3,
        explanation: "『えきで でんしゃに のります。』が 正しい 文です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】つぎの 文の ＿＿ に 入る 助詞を 答えましょう。\n『いぬ ＿＿ いっしょに さんぽします。』",
        answer: "と",
        explanation: "『いぬと いっしょに さんぽします。』が 正しい 文です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『だれが・だれと・なにを・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["つくります", "おかあさんと", "ぼくが", "サンドイッチを"],
        orderedChoices: ["ぼくが", "おかあさんと", "サンドイッチを", "つくります"],
        explanation: "『ぼくが おかあさんと サンドイッチを つくります。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・だれが・どこで・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["うたいます", "あした", "みんなが", "たいいくかんで"],
        orderedChoices: ["あした", "みんなが", "たいいくかんで", "うたいます"],
        explanation: "『あした みんなが たいいくかんで うたいます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『だれが・どんな・なにを・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["えを", "小さな", "かきます", "いもうとが"],
        orderedChoices: ["いもうとが", "小さな", "えを", "かきます"],
        explanation: "『いもうとが 小さな えを かきます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『どこから・なにが・どこへ・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["ころがりました", "ボールが", "さかの うえから", "みちへ"],
        orderedChoices: ["さかの うえから", "ボールが", "みちへ", "ころがりました"],
        explanation: "『さかの うえから ボールが みちへ ころがりました。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・どこで・だれが・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["くつを はきます", "げんかんで", "朝", "おとうとが"],
        orderedChoices: ["朝", "げんかんで", "おとうとが", "くつを はきます"],
        explanation: "『朝 げんかんで おとうとが くつを はきます。』が 正しい じゅんです。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『あやは 赤い おりがみで つるを おり、きいろい おりがみで ほしを おりました。』\nあやが きいろい おりがみで おったものは どれですか？",
        choices: [
        "ほし",
        "つる",
        "ふね",
        "はこ"
        ],
        correctAnswerIndex: 0,
        explanation: "あやが きいろい おりがみで おったものは『ほし』です。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『けんは 学校から 帰ると、手を あらいました。そのあと、しゅくだいを しました。』\nけんが さいしょに したことは どれですか？",
        choices: [
        "しゅくだいを しました",
        "手を あらいました",
        "おやつを 食べました",
        "本を 読みました"
        ],
        correctAnswerIndex: 1,
        explanation: "けんが さいしょに したことは『手を あらいました』です。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『こうえんの ベンチの 下に、赤い ボールが ありました。みきは その ボールを ひろいました。』\nボールは どこに ありましたか？",
        choices: [
        "木の 下",
        "ベンチの 上",
        "ベンチの 下",
        "すべりだいの 下"
        ],
        correctAnswerIndex: 2,
        explanation: "ボールが あった ところは『ベンチの 下』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『しゅんは お店で ぎゅうにゅうと パンを 買いました。家に 帰ると、ぎゅうにゅうを のみました。』\nしゅんが のんだものは ＿＿ です。",
        answer: "ぎゅうにゅう",
        acceptableAnswers: ["牛乳"],
        explanation: "しゅんが のんだものは『ぎゅうにゅう』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『ゆきは 火よう日に ピアノを ならい、木よう日に すいえいを ならいます。』\nゆきが 木よう日に ならうものは ＿＿ です。",
        answer: "すいえい",
        acceptableAnswers: ["水泳"],
        explanation: "ゆきが 木よう日に ならうものは『すいえい』です。"
        ),

        QuizQuestion(
        question: "『ざぶとん』の さいしょの ひらがなは どれですか？",
        choices: [
        "ざ",
        "さ",
        "だ",
        "ぞ"
        ],
        correctAnswerIndex: 0,
        explanation: "『ざぶとん』の さいしょの ひらがなは『ざ』です。"
        ),

        QuizQuestion(
        question: "『おちゃ』で、小さく 書く ひらがなは どれですか？",
        choices: [
        "や",
        "ゃ",
        "ゅ",
        "ょ"
        ],
        correctAnswerIndex: 1,
        explanation: "『おちゃ』では、小さい『ゃ』を つかいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『しんぶん』の ＿＿ に 入る ひらがなを 答えましょう。\n『しん ＿＿ ん』",
        answer: "ぶ",
        explanation: "『しんぶん』の ＿＿ に 入る ひらがなは『ぶ』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】ことばと、その ことばで つかわれている 小さい ひらがなを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "しゃしん", match: "ゃ"),
        QuizMatchingPair(prompt: "ちゅうい", match: "ゅ"),
        QuizMatchingPair(prompt: "きょり", match: "ょ"),
        QuizMatchingPair(prompt: "きっぷ", match: "っ")
        ],
        choices: ["ょ", "っ", "ゃ", "ゅ"],
        explanation: "『しゃしん=ゃ』『ちゅうい=ゅ』『きょり=ょ』『きっぷ=っ』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "『ケーキ』で、音を のばす しるしは どれですか？",
        choices: [
        "キ",
        "ケ",
        "ー",
        "イ"
        ],
        correctAnswerIndex: 2,
        explanation: "『ケーキ』で、音を のばす しるしは『ー』です。"
        ),

        QuizQuestion(
        question: "『ロボット』の さいしょの カタカナは どれですか？",
        choices: [
        "ボ",
        "ト",
        "ッ",
        "ロ"
        ],
        correctAnswerIndex: 3,
        explanation: "『ロボット』の さいしょの カタカナは『ロ』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『サラダ』の ＿＿ に 入る カタカナを 答えましょう。\n『サ ＿＿ ダ』",
        answer: "ラ",
        explanation: "『サラダ』の ＿＿ に 入る カタカナは『ラ』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】カタカナと、おなじ 音の ひらがなを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "ガ", match: "が"),
        QuizMatchingPair(prompt: "ペ", match: "ぺ"),
        QuizMatchingPair(prompt: "ゾ", match: "ぞ"),
        QuizMatchingPair(prompt: "ビ", match: "び")
        ],
        choices: ["ぞ", "び", "が", "ぺ"],
        explanation: "『ガ=が』『ペ=ぺ』『ゾ=ぞ』『ビ=び』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『力』",
        choices: [
        "ちから",
        "おとこ",
        "いし",
        "た"
        ],
        correctAnswerIndex: 0,
        explanation: "『力』の 読みは『ちから』です。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『田』",
        choices: [
        "かわ",
        "た",
        "もり",
        "むら"
        ],
        correctAnswerIndex: 1,
        explanation: "『田』の 読みは『た』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『女』は なんと よみますか。ひらがなで 答えましょう。",
        answer: "おんな",
        explanation: "『女』の 読みは『おんな』です。"
        ),

        QuizQuestion(
        question: "つぎの 漢字の 読みは どれですか？\n『虫』",
        choices: [
        "くさ",
        "いぬ",
        "むし",
        "とり"
        ],
        correctAnswerIndex: 2,
        explanation: "『虫』の 読みは『むし』です。"
        ),

        QuizQuestion(
        question: "『ぐんぐん』の いみとして いちばん よいものは どれですか？",
        choices: [
        "音を 立てずに する ようす",
        "少しずつ 小さくなる ようす",
        "同じ ところで とまる ようす",
        "いきおいよく のびたり すすんだりする ようす"
        ],
        correctAnswerIndex: 3,
        explanation: "『ぐんぐん』は、いきおいよく のびたり すすんだりする ようすを あらわします。"
        ),

        QuizQuestion(
        question: "『こっそり』の いみとして いちばん よいものは どれですか？",
        choices: [
        "人に 気づかれない ように",
        "みんなに 聞こえる ように",
        "何度も くりかえして",
        "とても はやく"
        ],
        correctAnswerIndex: 0,
        explanation: "『こっそり』は、人に 気づかれない ように することです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『あかるい』と はんたいの いみの ことばを 答えましょう。",
        answer: "くらい",
        acceptableAnswers: ["暗い"],
        explanation: "『あかるい』と はんたいの いみの ことばは『くらい』です。"
        ),

        QuizQuestion(
        question: "『ほどく』の いみとして いちばん よいものは どれですか？",
        choices: [
        "ものを かたく むすぶ",
        "むすんだものを ゆるめて はなす",
        "ものを 高く つみ上げる",
        "ものを 小さく おる"
        ],
        correctAnswerIndex: 1,
        explanation: "『ほどく』は、むすんだものを ゆるめて はなすことです。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『ノート ＿＿ 名前を 書きます。』",
        choices: [
        "を",
        "で",
        "に",
        "が"
        ],
        correctAnswerIndex: 2,
        explanation: "『ノートに 名前を 書きます。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『みず ＿＿ のみます。』",
        choices: [
        "に",
        "で",
        "が",
        "を"
        ],
        correctAnswerIndex: 3,
        explanation: "『みずを のみます。』が 正しい 文です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】つぎの 文の ＿＿ に 入る 助詞を 答えましょう。\n『いえ ＿＿ 学校まで あるきます。』",
        answer: "から",
        explanation: "『いえから 学校まで あるきます。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『おとうさんは 車 ＿＿ 会社へ 行きます。』",
        choices: [
        "で",
        "を",
        "に",
        "が"
        ],
        correctAnswerIndex: 0,
        explanation: "『おとうさんは 車で 会社へ 行きます。』が 正しい 文です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『人・場所・もの・動き』の じゅんに ならべて、文を つくりましょう。",
        choices: ["さらを", "なおが", "あらいます", "だいどころで"],
        orderedChoices: ["なおが", "だいどころで", "さらを", "あらいます"],
        explanation: "『なおが だいどころで さらを あらいます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・だれが・なにに・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["花に", "夕方", "水を やります", "あねが"],
        orderedChoices: ["夕方", "あねが", "花に", "水を やります"],
        explanation: "『夕方 あねが 花に 水を やります。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『どこで・どんな・なにが・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["およぎます", "小さな", "池で", "かえるが"],
        orderedChoices: ["池で", "小さな", "かえるが", "およぎます"],
        explanation: "『池で 小さな かえるが およぎます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『だれの・なにが・どこから・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["ポケットから", "ハンカチが", "おちました", "ぼくの"],
        orderedChoices: ["ぼくの", "ハンカチが", "ポケットから", "おちました"],
        explanation: "『ぼくの ハンカチが ポケットから おちました。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『いつ・だれが・だれと・どうする』の じゅんに ならべて、文を つくりましょう。",
        choices: ["いとこと", "日よう日", "あそびます", "ぼくは"],
        orderedChoices: ["日よう日", "ぼくは", "いとこと", "あそびます"],
        explanation: "『日よう日 ぼくは いとこと あそびます。』が 正しい じゅんです。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『なつきは 赤い クレヨンで りんごを かき、みどりの クレヨンで 木を かきました。』\nなつきが 赤い クレヨンで かいたものは どれですか？",
        choices: [
        "木",
        "りんご",
        "花",
        "家"
        ],
        correctAnswerIndex: 1,
        explanation: "なつきが 赤い クレヨンで かいたものは『りんご』です。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『りくは 朝、パンやへ 行きました。昼からは こうえんで 友だちと あそびました。』\nりくが 昼から いた ところは どこですか？",
        choices: [
        "パンや",
        "学校",
        "こうえん",
        "いえ"
        ],
        correctAnswerIndex: 2,
        explanation: "りくが 昼から いた ところは『こうえん』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『雨が やんだので、かのんは かさを たたみ、げんかんの かさたてに 入れました。』\nかのんが かさを 入れた ところは ＿＿ です。",
        answer: "かさたて",
        acceptableAnswers: ["げんかんのかさたて", "げんかんの かさたて"],
        explanation: "かのんが かさを 入れた ところは『かさたて』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『えまは カレーパンと メロンパンを 買いました。メロンパンを おとうとに あげ、カレーパンは 自分で 食べました。』\nえまが おとうとに あげたものは ＿＿ です。",
        answer: "メロンパン",
        explanation: "えまが おとうとに あげたものは『メロンパン』です。"
        ),

        QuizQuestion.matching(
        question: "【短文読解・組み合わせ】文を 読み、人と 休み時間に したことを 正しく 組み合わせましょう。\n『休み時間、あおいは なわとびを しました。れんは けんだまで あそびました。みなは えを かきました。たくみは 本を よみました。』",
        pairs: [
        QuizMatchingPair(prompt: "あおい", match: "なわとび"),
        QuizMatchingPair(prompt: "れん", match: "けんだま"),
        QuizMatchingPair(prompt: "みな", match: "えを かく"),
        QuizMatchingPair(prompt: "たくみ", match: "本を よむ")
        ],
        choices: ["本を よむ", "えを かく", "なわとび", "けんだま"],
        explanation: "『あおい=なわとび』『れん=けんだま』『みな=えを かく』『たくみ=本を よむ』の 組み合わせです。"
        ),
        QuizQuestion(
        question: "『でんわ』の さいしょの ひらがなは どれですか？",
        choices: [
        "で",
        "て",
        "ぜ",
        "ど"
        ],
        correctAnswerIndex: 0,
        explanation: "『でんわ』の さいしょの ひらがなは『で』です。"
        ),

        QuizQuestion(
        question: "『きょうしつ』で、小さく 書く ひらがなは どれですか？",
        choices: [
        "よ",
        "ょ",
        "ゅ",
        "ゃ"
        ],
        correctAnswerIndex: 1,
        explanation: "『きょうしつ』では、小さい『ょ』を つかいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『はっぱ』の ＿＿ に 入る 小さい ひらがなを 答えましょう。\n『は ＿＿ ぱ』",
        answer: "っ",
        explanation: "『はっぱ』では、小さい『っ』を 入れます。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】ひらがなと、その ひらがなから はじまる ことばを 正しく 組み合わせましょう。",
        pairs: [
        QuizMatchingPair(prompt: "め", match: "めがね"),
        QuizMatchingPair(prompt: "ろ", match: "ろうそく"),
        QuizMatchingPair(prompt: "わ", match: "わに"),
        QuizMatchingPair(prompt: "へ", match: "へび")
        ],
        choices: ["わに", "へび", "めがね", "ろうそく"],
        explanation: "『め=めがね』『ろ=ろうそく』『わ=わに』『へ=へび』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "ひらがな『む』と おなじ 音の カタカナは どれですか？",
        choices: [
        "マ",
        "ミ",
        "ム",
        "メ"
        ],
        correctAnswerIndex: 2,
        explanation: "ひらがな『む』と おなじ 音の カタカナは『ム』です。"
        ),

        QuizQuestion(
        question: "『キャベツ』で、小さく 書く カタカナは どれですか？",
        choices: [
        "ヤ",
        "ユ",
        "ヨ",
        "ャ"
        ],
        correctAnswerIndex: 3,
        explanation: "『キャベツ』では、小さい『ャ』を つかいます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『ホテル』の ＿＿ に 入る カタカナを 答えましょう。\n『ホ ＿＿ ル』",
        answer: "テ",
        explanation: "『ホテル』の ＿＿ に 入る カタカナは『テ』です。"
        ),

        QuizQuestion.matching(
        question: "【組み合わせ】カタカナの ことばと、もじの 数を 正しく 組み合わせましょう。『ー』も 1もじとして 数えます。",
        pairs: [
        QuizMatchingPair(prompt: "メモ", match: "2もじ"),
        QuizMatchingPair(prompt: "ラジオ", match: "3もじ"),
        QuizMatchingPair(prompt: "エプロン", match: "4もじ"),
        QuizMatchingPair(prompt: "オルゴール", match: "5もじ")
        ],
        choices: ["4もじ", "2もじ", "5もじ", "3もじ"],
        explanation: "『メモ=2もじ』『ラジオ=3もじ』『エプロン=4もじ』『オルゴール=5もじ』の 組み合わせです。"
        ),

        QuizQuestion(
        question: "つぎの 文の『玉』は なんと よみますか？\n『赤い 玉を なげます。』",
        choices: [
        "たま",
        "かね",
        "いし",
        "つち"
        ],
        correctAnswerIndex: 0,
        explanation: "『赤い 玉』の『玉』は『たま』と よみます。"
        ),

        QuizQuestion(
        question: "つぎの 文の『金』は なんと よみますか？\n『お金を ためます。』",
        choices: [
        "きん",
        "かね",
        "たま",
        "えん"
        ],
        correctAnswerIndex: 1,
        explanation: "『お金』の『金』は『かね』と よみます。"
        ),

        QuizQuestion(
        question: "つぎの 文の『林』は なんと よみますか？\n『林の 中を あるきます。』",
        choices: [
        "もり",
        "やま",
        "はやし",
        "かわ"
        ],
        correctAnswerIndex: 2,
        explanation: "『林』は『はやし』と よみます。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】つぎの ことばの 読みを ひらがなで 答えましょう。\n『白い』",
        answer: "しろい",
        explanation: "『白い』の 読みは『しろい』です。"
        ),

        QuizQuestion(
        question: "『ひろう』の いみとして いちばん よいものは どれですか？",
        choices: [
        "ものを おとす",
        "ものを かくす",
        "ものを なげる",
        "おちている ものを とる"
        ],
        correctAnswerIndex: 3,
        explanation: "『ひろう』は、おちている ものを とることです。"
        ),

        QuizQuestion(
        question: "『たっぷり』の いみとして いちばん よいものは どれですか？",
        choices: [
        "たくさん ある ようす",
        "まったく ない ようす",
        "すぐに なくなる ようす",
        "一つだけ ある ようす"
        ],
        correctAnswerIndex: 0,
        explanation: "『たっぷり』は、たくさん ある ようすを あらわします。"
        ),

        QuizQuestion(
        question: "『かさねる』の いみとして いちばん よいものは どれですか？",
        choices: [
        "ものを よこに はなす",
        "ものの うえに ものを おく",
        "ものを 水に うかべる",
        "ものを こまかく きる"
        ],
        correctAnswerIndex: 1,
        explanation: "『かさねる』は、ものの うえに ものを おくことです。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】『ながい』と はんたいの いみの ことばを 答えましょう。",
        answer: "みじかい",
        acceptableAnswers: ["短い"],
        explanation: "『ながい』と はんたいの いみの ことばは『みじかい』です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『いもうと ＿＿ 手紙を わたします。』",
        choices: [
        "を",
        "で",
        "に",
        "が"
        ],
        correctAnswerIndex: 2,
        explanation: "『いもうとに 手紙を わたします。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『きょうしつ ＿＿ きゅうしょくを 食べます。』",
        choices: [
        "を",
        "に",
        "が",
        "で"
        ],
        correctAnswerIndex: 3,
        explanation: "『きょうしつで きゅうしょくを 食べます。』が 正しい 文です。"
        ),

        QuizQuestion(
        question: "つぎの 文の ＿＿ に 入る 助詞は どれですか？\n『赤い くつ ＿＿ はきます。』",
        choices: [
        "を",
        "に",
        "で",
        "と"
        ],
        correctAnswerIndex: 0,
        explanation: "『赤い くつを はきます。』が 正しい 文です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【穴うめ】つぎの 文の ＿＿ に 入る 助詞を 答えましょう。\n『あねは 一年生です。わたし ＿＿ 一年生です。』",
        answer: "も",
        explanation: "『あねは 一年生です。わたしも 一年生です。』が 正しい 文です。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『ひるやすみ』から はじまり、『ずかんを よみます』で おわる 文に ならべましょう。",
        choices: ["ずかんを よみます", "としょしつで", "まいが", "ひるやすみ"],
        orderedChoices: ["ひるやすみ", "まいが", "としょしつで", "ずかんを よみます"],
        explanation: "『ひるやすみ まいが としょしつで ずかんを よみます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『大きな』から はじまる 文に なるように、ことばを ならべましょう。",
        choices: ["空を", "とびます", "大きな", "ひこうきが"],
        orderedChoices: ["大きな", "ひこうきが", "空を", "とびます"],
        explanation: "『大きな ひこうきが 空を とびます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『土よう日に』から はじまる 文に なるように、ことばを ならべましょう。",
        choices: ["うみへ", "行きます", "家族で", "土よう日に"],
        orderedChoices: ["土よう日に", "家族で", "うみへ", "行きます"],
        explanation: "『土よう日に 家族で うみへ 行きます。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『まどの そばで』から はじまる 文に なるように、ことばを ならべましょう。",
        choices: ["ねています", "白い", "まどの そばで", "ねこが"],
        orderedChoices: ["まどの そばで", "白い", "ねこが", "ねています"],
        explanation: "『まどの そばで 白い ねこが ねています。』が 正しい じゅんです。"
        ),

        QuizQuestion.reorder(
        question: "【並べ替え】『おじいさんから』から はじまる 文に なるように、ことばを ならべましょう。",
        choices: ["手紙が", "とどきました", "わたしに", "おじいさんから"],
        orderedChoices: ["おじいさんから", "わたしに", "手紙が", "とどきました"],
        explanation: "『おじいさんから わたしに 手紙が とどきました。』が 正しい じゅんです。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『まことは、青い はこに つみきを、きいろい はこに ぬいぐるみを しまいました。』\nきいろい はこに しまったものは どれですか？",
        choices: [
        "えほん",
        "ぬいぐるみ",
        "つみき",
        "ボール"
        ],
        correctAnswerIndex: 1,
        explanation: "きいろい はこに しまったものは『ぬいぐるみ』です。"
        ),

        QuizQuestion(
        question: "【短文読解】文を 読んで 答えましょう。\n『うんどうかいで、はじめに かけっこを しました。そのあと、つなひきを しました。さいごに ダンスを しました。』\nかけっこの あとに したことは どれですか？",
        choices: [
        "ダンス",
        "玉入れ",
        "つなひき",
        "おひるごはん"
        ],
        correctAnswerIndex: 2,
        explanation: "かけっこの あとに したことは『つなひき』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『みさきは えんそくに おにぎりと みかんを もっていきました。おにぎりは 昼に 食べ、みかんは 帰りの バスで 食べました。』\nみさきが 帰りの バスで 食べたものは ＿＿ です。",
        answer: "みかん",
        explanation: "みさきが 帰りの バスで 食べたものは『みかん』です。"
        ),

        QuizQuestion.fillInBlank(
        question: "【短文読解・穴うめ】文を 読んで 答えましょう。\n『たけるは 朝、青い くつしたを はきました。夜、白い パジャマに きがえました。』\nたけるが 夜に きがえたものは ＿＿ です。",
        answer: "しろいパジャマ",
        acceptableAnswers: ["白いパジャマ", "しろい パジャマ", "白い パジャマ"],
        explanation: "たけるが 夜に きがえたものは『しろいパジャマ』です。"
        ),

        QuizQuestion.matching(
        question: "【短文読解・組み合わせ】文を 読み、人と そうじで したことを 正しく 組み合わせましょう。\n『そうじの 時間、さなは 黒板を ふきました。とうまは 本だなを ととのえました。えりは ゆかを はきました。かいは まどを ふきました。』",
        pairs: [
        QuizMatchingPair(prompt: "さな", match: "黒板を ふく"),
        QuizMatchingPair(prompt: "とうま", match: "本だなを ととのえる"),
        QuizMatchingPair(prompt: "えり", match: "ゆかを はく"),
        QuizMatchingPair(prompt: "かい", match: "まどを ふく")
        ],
        choices: ["ゆかを はく", "まどを ふく", "黒板を ふく", "本だなを ととのえる"],
        explanation: "『さな=黒板を ふく』『とうま=本だなを ととのえる』『えり=ゆかを はく』『かい=まどを ふく』の 組み合わせです。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo1, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo1ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo1ListView(isPresenting: .constant(false))
    }
}
