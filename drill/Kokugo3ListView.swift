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
        QuizQuestion(
            question: "次の文で正しい『はなす』の漢字はどれですか？『友達と＿＿』",
            choices: [
                "放す",
                "話す",
                "離す",
                "指す"
            ],
            correctAnswerIndex: 1,
            explanation: "『友達と話す』が正解です。"
        ),
        QuizQuestion(
            question: "『ふく』という言葉の意味として適切なものはどれですか？",
            choices: [
                "書く",
                "拭く",
                "折る",
                "払う"
            ],
            correctAnswerIndex: 1,
            explanation: "『ふく』は『拭く』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『空がだんだん暗くなってきたので…』",
            choices: [
                "風が吹き始めた",
                "雨が降り出した",
                "鳥が飛び始めた",
                "星が出始めた"
            ],
            correctAnswerIndex: 3,
            explanation: "『星が出始めた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『つかう』の漢字はどれですか？『道具を＿＿』",
            choices: [
                "伝う",
                "作う",
                "使う",
                "消う"
            ],
            correctAnswerIndex: 2,
            explanation: "『道具を使う』が正解です。"
        ),
        QuizQuestion(
            question: "『わらう』という言葉の意味として適切なものはどれですか？",
            choices: [
                "泣く",
                "怒る",
                "笑う",
                "走る"
            ],
            correctAnswerIndex: 2,
            explanation: "『わらう』は『笑う』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『公園で遊んでいたら、突然…』",
            choices: [
                "友達が来た",
                "風が強くなった",
                "雨が降り出した",
                "犬が吠え出した"
            ],
            correctAnswerIndex: 2,
            explanation: "『雨が降り出した』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『はこぶ』の漢字はどれですか？『荷物を＿＿』",
            choices: [
                "掃ぶ",
                "進ぶ",
                "運ぶ",
                "走ぶ"
            ],
            correctAnswerIndex: 2,
            explanation: "『荷物を運ぶ』が正解です。"
        ),
        QuizQuestion(
            question: "『あける』という言葉の意味として適切なものはどれですか？",
            choices: [
                "閉める",
                "開ける",
                "止める",
                "曲げる"
            ],
            correctAnswerIndex: 1,
            explanation: "『あける』は『開ける』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『今日はとても暑いので…』",
            choices: [
                "暖かい服を着た",
                "冷たい飲み物を飲んだ",
                "外で遊んだ",
                "窓を閉めた"
            ],
            correctAnswerIndex: 1,
            explanation: "『冷たい飲み物を飲んだ』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『のぼる』の漢字はどれですか？『山に＿＿』",
            choices: [
                "昇る",
                "登る",
                "伸る",
                "上る"
            ],
            correctAnswerIndex: 1,
            explanation: "『山に登る』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『たつ』の漢字はどれですか？『時間が＿＿』",
            choices: [
                "立つ",
                "経つ",
                "発つ",
                "建つ"
            ],
            correctAnswerIndex: 1,
            explanation: "『時間が経つ』が正解です。"
        ),
        QuizQuestion(
            question: "『しめる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "閉める",
                "開ける",
                "走る",
                "止まる"
            ],
            correctAnswerIndex: 0,
            explanation: "『しめる』は『閉める』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『友達と遊んでいたら、突然…』",
            choices: [
                "風が吹いてきた",
                "雨が降り出した",
                "先生が来た",
                "お腹が空いた"
            ],
            correctAnswerIndex: 1,
            explanation: "『雨が降り出した』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『はしる』の漢字はどれですか？『道を＿＿』",
            choices: [
                "歩く",
                "走る",
                "登る",
                "飛ぶ"
            ],
            correctAnswerIndex: 1,
            explanation: "『道を走る』が正解です。"
        ),
        QuizQuestion(
            question: "『つなぐ』という言葉の意味として適切なものはどれですか？",
            choices: [
                "切る",
                "結ぶ",
                "離す",
                "引っ張る"
            ],
            correctAnswerIndex: 1,
            explanation: "『つなぐ』は『結ぶ』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『今日はとても寒いので…』",
            choices: [
                "暖かい服を着た",
                "外で遊んだ",
                "窓を開けた",
                "冷たい飲み物を飲んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "『暖かい服を着た』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『おしえる』の漢字はどれですか？『道を＿＿』",
            choices: [
                "教える",
                "聞える",
                "伝える",
                "知らせる"
            ],
            correctAnswerIndex: 0,
            explanation: "『道を教える』が正解です。"
        ),
        QuizQuestion(
            question: "『みつける』という言葉の意味として適切なものはどれですか？",
            choices: [
                "探す",
                "見つける",
                "落とす",
                "忘れる"
            ],
            correctAnswerIndex: 1,
            explanation: "『みつける』は『見つける』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『空が暗くなり始めたので…』",
            choices: [
                "風が強くなった",
                "星が出てきた",
                "雨が降り出した",
                "雷が鳴った"
            ],
            correctAnswerIndex: 2,
            explanation: "『雨が降り出した』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『さく』の漢字はどれですか？『花が＿＿』",
            choices: [
                "裂く",
                "割く",
                "咲く",
                "作く"
            ],
            correctAnswerIndex: 2,
            explanation: "『花が咲く』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『あげる』の漢字はどれですか？『手を＿＿』",
            choices: [
                "上げる",
                "挙げる",
                "揚げる",
                "明げる"
            ],
            correctAnswerIndex: 0,
            explanation: "『手を上げる』が正解です。"
        ),
        QuizQuestion(
            question: "『とる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "引く",
                "取る",
                "割る",
                "進む"
            ],
            correctAnswerIndex: 1,
            explanation: "『とる』は『取る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『学校が終わって家に帰ると…』",
            choices: [
                "家族が迎えてくれた",
                "友達が遊びに来た",
                "鍵が閉まっていた",
                "雨が降り出した"
            ],
            correctAnswerIndex: 0,
            explanation: "『家族が迎えてくれた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『みる』の漢字はどれですか？『先生に＿＿てもらう』",
            choices: [
                "見てもらう",
                "診てもらう",
                "視てもらう",
                "観てもらう"
            ],
            correctAnswerIndex: 1,
            explanation: "『先生に診てもらう』が正解です。"
        ),
        QuizQuestion(
            question: "『たすける』という言葉の意味として適切なものはどれですか？",
            choices: [
                "助ける",
                "見守る",
                "追いかける",
                "話しかける"
            ],
            correctAnswerIndex: 0,
            explanation: "『たすける』は『助ける』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『公園で遊んでいたら、急に…』",
            choices: [
                "雨が降り出した",
                "友達が来た",
                "風が吹き始めた",
                "先生が来た"
            ],
            correctAnswerIndex: 0,
            explanation: "『雨が降り出した』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『のぼる』の漢字はどれですか？『山に＿＿』",
            choices: [
                "登る",
                "上る",
                "昇る",
                "伸る"
            ],
            correctAnswerIndex: 0,
            explanation: "『山に登る』が正解です。"
        ),
        QuizQuestion(
            question: "『つなぐ』という言葉の意味として適切なものはどれですか？",
            choices: [
                "離す",
                "結ぶ",
                "倒す",
                "引っ張る"
            ],
            correctAnswerIndex: 1,
            explanation: "『つなぐ』は『結ぶ』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『風が強くなってきたので…』",
            choices: [
                "傘を閉じた",
                "窓を開けた",
                "道を歩き続けた",
                "外で遊んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "『傘を閉じた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『あらう』の漢字はどれですか？『手を＿＿』",
            choices: [
                "洗う",
                "荒う",
                "拭う",
                "削う"
            ],
            correctAnswerIndex: 0,
            explanation: "『手を洗う』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『みる』の漢字はどれですか？『映画を＿＿』",
            choices: [
                "観る",
                "診る",
                "看る",
                "視る"
            ],
            correctAnswerIndex: 0,
            explanation: "『映画を観る』が正解です。"
        ),
        QuizQuestion(
            question: "『おこる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "泣く",
                "怒る",
                "笑う",
                "遊ぶ"
            ],
            correctAnswerIndex: 1,
            explanation: "『おこる』は『怒る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『今日は学校が休みなので…』",
            choices: [
                "友達と遊びに行った",
                "宿題をした",
                "家でのんびりした",
                "お昼寝をした"
            ],
            correctAnswerIndex: 0,
            explanation: "『友達と遊びに行った』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『おりる』の漢字はどれですか？『階段を＿＿』",
            choices: [
                "降りる",
                "折りる",
                "下りる",
                "跳りる"
            ],
            correctAnswerIndex: 0,
            explanation: "『階段を降りる』が正解です。"
        ),
        QuizQuestion(
            question: "『おしえる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "書く",
                "教える",
                "聞く",
                "見る"
            ],
            correctAnswerIndex: 1,
            explanation: "『おしえる』は『教える』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『雨が止んだので…』",
            choices: [
                "散歩に出かけた",
                "窓を閉めた",
                "傘をさした",
                "テレビを見た"
            ],
            correctAnswerIndex: 0,
            explanation: "『散歩に出かけた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『はしる』の漢字はどれですか？『道を＿＿』",
            choices: [
                "走る",
                "飛ぶ",
                "滑る",
                "歩く"
            ],
            correctAnswerIndex: 0,
            explanation: "『道を走る』が正解です。"
        ),
        QuizQuestion(
            question: "『みつける』という言葉の意味として適切なものはどれですか？",
            choices: [
                "逃げる",
                "見つける",
                "拾う",
                "追いかける"
            ],
            correctAnswerIndex: 1,
            explanation: "『みつける』は『見つける』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『太陽が沈み始めたので…』",
            choices: [
                "星が出始めた",
                "雨が降ってきた",
                "風が強くなった",
                "雲が広がった"
            ],
            correctAnswerIndex: 0,
            explanation: "『星が出始めた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『きく』の漢字はどれですか？『音楽を＿＿』",
            choices: [
                "聞く",
                "訊く",
                "効く",
                "利く"
            ],
            correctAnswerIndex: 0,
            explanation: "『音楽を聞く』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『きく』の漢字はどれですか？『音楽を＿＿』",
            choices: [
                "聞く",
                "効く",
                "利く",
                "訊く"
            ],
            correctAnswerIndex: 0,
            explanation: "『音楽を聞く』が正解です。"
        ),
        QuizQuestion(
            question: "『しる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "歩く",
                "知る",
                "忘れる",
                "書く"
            ],
            correctAnswerIndex: 1,
            explanation: "『しる』は『知る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『外は強い風が吹いていて…』",
            choices: [
                "木が大きく揺れていた",
                "猫が寝ていた",
                "鳥が飛んでいた",
                "誰もいなかった"
            ],
            correctAnswerIndex: 0,
            explanation: "『木が大きく揺れていた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『あける』の漢字はどれですか？『窓を＿＿』",
            choices: [
                "開ける",
                "明ける",
                "挙ける",
                "空ける"
            ],
            correctAnswerIndex: 0,
            explanation: "『窓を開ける』が正解です。"
        ),
        QuizQuestion(
            question: "『ふく』という言葉の意味として適切なものはどれですか？",
            choices: [
                "拭く",
                "書く",
                "進む",
                "折る"
            ],
            correctAnswerIndex: 0,
            explanation: "『ふく』は『拭く』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『今日は暑いので…』",
            choices: [
                "冷たい飲み物を飲んだ",
                "外で遊んだ",
                "上着を着た",
                "窓を閉めた"
            ],
            correctAnswerIndex: 0,
            explanation: "『冷たい飲み物を飲んだ』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『みる』の漢字はどれですか？『テレビを＿＿』",
            choices: [
                "観る",
                "診る",
                "看る",
                "視る"
            ],
            correctAnswerIndex: 0,
            explanation: "『テレビを観る』が正解です。"
        ),
        QuizQuestion(
            question: "『もどる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "進む",
                "戻る",
                "走る",
                "出る"
            ],
            correctAnswerIndex: 1,
            explanation: "『もどる』は『戻る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『電車が遅れて…』",
            choices: [
                "駅にたくさんの人がいた",
                "みんなが帰った",
                "誰もいなかった",
                "車が止まっていた"
            ],
            correctAnswerIndex: 0,
            explanation: "『駅にたくさんの人がいた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『たべる』の漢字はどれですか？『朝ごはんを＿＿』",
            choices: [
                "食べる",
                "飲べる",
                "吸べる",
                "消べる"
            ],
            correctAnswerIndex: 0,
            explanation: "『朝ごはんを食べる』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『さがす』の漢字はどれですか？『友達を＿＿』",
            choices: [
                "探す",
                "捜す",
                "査す",
                "覗す"
            ],
            correctAnswerIndex: 0,
            explanation: "『友達を探す』が正解です。"
        ),
        QuizQuestion(
            question: "『あつめる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "散らばる",
                "集める",
                "逃げる",
                "減る"
            ],
            correctAnswerIndex: 1,
            explanation: "『あつめる』は『集める』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『家の前に大きな犬が…』",
            choices: [
                "座っていた",
                "吠えていた",
                "走っていた",
                "寝ていた"
            ],
            correctAnswerIndex: 1,
            explanation: "『吠えていた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『あう』の漢字はどれですか？『事故に＿＿』",
            choices: [
                "会う",
                "合う",
                "遭う",
                "遇う"
            ],
            correctAnswerIndex: 2,
            explanation: "『事故に遭う』が正解です。"
        ),
        QuizQuestion(
            question: "『ふる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "降る",
                "登る",
                "広がる",
                "乾く"
            ],
            correctAnswerIndex: 0,
            explanation: "『ふる』は『降る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『太郎は学校から帰るとすぐに…』",
            choices: [
                "宿題を始めた",
                "テレビを見た",
                "友達に会った",
                "お菓子を食べた"
            ],
            correctAnswerIndex: 0,
            explanation: "『宿題を始めた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『ひく』の漢字はどれですか？『ピアノを＿＿』",
            choices: [
                "弾く",
                "引く",
                "轢く",
                "走く"
            ],
            correctAnswerIndex: 0,
            explanation: "『ピアノを弾く』が正解です。"
        ),
        QuizQuestion(
            question: "『わらう』という言葉の意味として適切なものはどれですか？",
            choices: [
                "怒る",
                "笑う",
                "泣く",
                "叫ぶ"
            ],
            correctAnswerIndex: 1,
            explanation: "『わらう』は『笑う』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『家を出ると、すぐに…』",
            choices: [
                "雨が降り始めた",
                "友達が待っていた",
                "車が走っていた",
                "風が強くなった"
            ],
            correctAnswerIndex: 1,
            explanation: "『友達が待っていた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『とまる』の漢字はどれですか？『バスが＿＿』",
            choices: [
                "止まる",
                "泊まる",
                "留まる",
                "泊める"
            ],
            correctAnswerIndex: 0,
            explanation: "『バスが止まる』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『あう』の漢字はどれですか？『友達に＿＿』",
            choices: [
                "会う",
                "合う",
                "遭う",
                "遇う"
            ],
            correctAnswerIndex: 0,
            explanation: "『友達に会う』が正解です。"
        ),
        QuizQuestion(
            question: "『ながれる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "止まる",
                "流れる",
                "上がる",
                "広がる"
            ],
            correctAnswerIndex: 1,
            explanation: "『ながれる』は『流れる』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『今日は空がとても青いです。だから…』",
            choices: [
                "外で遊びたい",
                "部屋で休みたい",
                "早く寝たい",
                "宿題をしたい"
            ],
            correctAnswerIndex: 0,
            explanation: "『外で遊びたい』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『ひく』の漢字はどれですか？『車を＿＿』",
            choices: [
                "引く",
                "弾く",
                "轢く",
                "低く"
            ],
            correctAnswerIndex: 2,
            explanation: "『車を轢く』が正解です。"
        ),
        QuizQuestion(
            question: "『つづける』という言葉の意味として適切なものはどれですか？",
            choices: [
                "終わる",
                "休む",
                "続ける",
                "止める"
            ],
            correctAnswerIndex: 2,
            explanation: "『つづける』は『続ける』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『お店に入ってみると、そこには…』",
            choices: [
                "たくさんの商品が並んでいた",
                "誰もいなかった",
                "大きな声が聞こえた",
                "店員が話しかけてきた"
            ],
            correctAnswerIndex: 0,
            explanation: "『たくさんの商品が並んでいた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『みる』の漢字はどれですか？『映画を＿＿』",
            choices: [
                "観る",
                "診る",
                "看る",
                "視る"
            ],
            correctAnswerIndex: 0,
            explanation: "『映画を観る』が正解です。"
        ),
        QuizQuestion(
            question: "『まもる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "守る",
                "破る",
                "攻める",
                "忘れる"
            ],
            correctAnswerIndex: 0,
            explanation: "『まもる』は『守る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『太郎は学校が終わると、すぐに…』",
            choices: [
                "公園で遊んだ",
                "宿題をした",
                "先生に挨拶した",
                "本を読んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "『公園で遊んだ』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『つかう』の漢字はどれですか？『道具を＿＿』",
            choices: [
                "使う",
                "作う",
                "捌う",
                "運う"
            ],
            correctAnswerIndex: 0,
            explanation: "『道具を使う』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『まつ』の漢字はどれですか？『友達を＿＿』",
            choices: [
                "待つ",
                "持つ",
                "末つ",
                "待う"
            ],
            correctAnswerIndex: 0,
            explanation: "『友達を待つ』が正解です。"
        ),
        QuizQuestion(
            question: "『とぶ』という言葉の意味として適切なものはどれですか？",
            choices: [
                "走る",
                "跳ねる",
                "飛ぶ",
                "泳ぐ"
            ],
            correctAnswerIndex: 2,
            explanation: "『とぶ』は『飛ぶ』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『朝早く起きて、外に出ると…』",
            choices: [
                "新鮮な空気が気持ちよかった",
                "風が強くなってきた",
                "雨が降り出した",
                "車がたくさん走っていた"
            ],
            correctAnswerIndex: 0,
            explanation: "『新鮮な空気が気持ちよかった』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『のる』の漢字はどれですか？『電車に＿＿』",
            choices: [
                "乗る",
                "登る",
                "載る",
                "延る"
            ],
            correctAnswerIndex: 0,
            explanation: "『電車に乗る』が正解です。"
        ),
        QuizQuestion(
            question: "『はしる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "歩く",
                "飛ぶ",
                "走る",
                "座る"
            ],
            correctAnswerIndex: 2,
            explanation: "『はしる』は『走る』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『今日はとても寒いです。だから…』",
            choices: [
                "暖かい服を着た",
                "窓を開けた",
                "川で泳いだ",
                "冷たい飲み物を飲んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "『暖かい服を着た』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『ひく』の漢字はどれですか？『車を＿＿』",
            choices: [
                "引く",
                "弾く",
                "轢く",
                "低く"
            ],
            correctAnswerIndex: 2,
            explanation: "『車を轢く』が正解です。"
        ),
        QuizQuestion(
            question: "『ふく』という言葉の意味として適切なものはどれですか？",
            choices: [
                "拭く",
                "蹴る",
                "投げる",
                "振る"
            ],
            correctAnswerIndex: 0,
            explanation: "『ふく』は『拭く』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『夜になって、街の明かりが…』",
            choices: [
                "だんだん消えていった",
                "明るくなった",
                "静かになった",
                "大きな音が聞こえた"
            ],
            correctAnswerIndex: 1,
            explanation: "『明るくなった』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『はらう』の漢字はどれですか？『お金を＿＿』",
            choices: [
                "拾う",
                "払う",
                "張る",
                "放つ"
            ],
            correctAnswerIndex: 1,
            explanation: "『お金を払う』が正解です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『つくる』の漢字はどれですか？『料理を＿＿』",
            choices: [
                "造る",
                "創る",
                "作る",
                "築る"
            ],
            correctAnswerIndex: 2,
            explanation: "『料理を作る』が正解です。"
        ),
        QuizQuestion(
            question: "『おちる』という言葉の意味として適切なものはどれですか？",
            choices: [
                "昇る",
                "飛ぶ",
                "落ちる",
                "上がる"
            ],
            correctAnswerIndex: 2,
            explanation: "『おちる』は『落ちる』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『学校から帰ってくると、そこには…』",
            choices: [
                "お母さんが迎えてくれた",
                "犬が寝ていた",
                "友達が遊びに来ていた",
                "部屋が散らかっていた"
            ],
            correctAnswerIndex: 0,
            explanation: "『お母さんが迎えてくれた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『かける』の漢字はどれですか？『メガネを＿＿』",
            choices: [
                "掛ける",
                "架ける",
                "欠ける",
                "賭ける"
            ],
            correctAnswerIndex: 0,
            explanation: "『メガネを掛ける』が正解です。"
        ),
        QuizQuestion(
            question: "『わらう』という言葉の意味として適切なものはどれですか？",
            choices: [
                "泣く",
                "叫ぶ",
                "笑う",
                "怒る"
            ],
            correctAnswerIndex: 2,
            explanation: "『わらう』は『笑う』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『突然、強い風が吹いてきた。すると…』",
            choices: [
                "傘が飛ばされた",
                "家に帰った",
                "道を歩き続けた",
                "誰かが叫んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "『傘が飛ばされた』が自然な展開です。"
        ),
        QuizQuestion(
            question: "次の文で正しい『とおる』の漢字はどれですか？『道を＿＿』",
            choices: [
                "取る",
                "通る",
                "飛る",
                "走る"
            ],
            correctAnswerIndex: 1,
            explanation: "『道を通る』が正解です。"
        ),
        QuizQuestion(
            question: "『あける』という言葉の意味として適切なものはどれですか？",
            choices: [
                "開ける",
                "閉める",
                "飛ぶ",
                "止める"
            ],
            correctAnswerIndex: 0,
            explanation: "『あける』は『開ける』という意味です。"
        ),
        QuizQuestion(
            question: "次の文に続く内容として最も適切なものはどれですか？『太陽が沈み始めた。すると…』",
            choices: [
                "星が出てきた",
                "雨が降り出した",
                "風が強くなった",
                "誰かが叫んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "『星が出てきた』が自然な展開です。"
        ),
           
            QuizQuestion(
                question: "次の文で正しい『かける』の漢字はどれですか？『電話を＿＿』",
                choices: [
                    "駆ける",
                    "掛ける",
                    "欠ける",
                    "賭ける"
                ],
                correctAnswerIndex: 1,
                explanation: "『電話を掛ける』が正解です。"
            ),
            QuizQuestion(
                question: "『まがる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "曲がる",
                    "伸びる",
                    "切る",
                    "折れる"
                ],
                correctAnswerIndex: 0,
                explanation: "『まがる』は『曲がる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『窓の外を見ると、そこには…』",
                choices: [
                    "大きな虹が見えた",
                    "友達が立っていた",
                    "猫が走っていた",
                    "空が真っ暗だった"
                ],
                correctAnswerIndex: 0,
                explanation: "『大きな虹が見えた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『たつ』の漢字はどれですか？『時間が＿＿』",
                choices: [
                    "経つ",
                    "立つ",
                    "建つ",
                    "発つ"
                ],
                correctAnswerIndex: 0,
                explanation: "『時間が経つ』が正解です。"
            ),
            QuizQuestion(
                question: "『かたむく』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "傾く",
                    "起きる",
                    "進む",
                    "走る"
                ],
                correctAnswerIndex: 0,
                explanation: "『かたむく』は『傾く』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『今日はお祭りの日です。そこで…』",
                choices: [
                    "たくさんの人が集まった",
                    "静かな一日が過ぎた",
                    "雨が降り始めた",
                    "家でのんびりした"
                ],
                correctAnswerIndex: 0,
                explanation: "『たくさんの人が集まった』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『はこぶ』の漢字はどれですか？『荷物を＿＿』",
                choices: [
                    "運ぶ",
                    "進ぶ",
                    "搬ぶ",
                    "送ぶ"
                ],
                correctAnswerIndex: 0,
                explanation: "『荷物を運ぶ』が正解です。"
            ),
            QuizQuestion(
                question: "『はしる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "歩く",
                    "走る",
                    "飛ぶ",
                    "登る"
                ],
                correctAnswerIndex: 1,
                explanation: "『はしる』は『走る』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『空が真っ黒になった。すると…』",
                choices: [
                    "雷が鳴り始めた",
                    "星が見えた",
                    "雨が止んだ",
                    "風が強くなった"
                ],
                correctAnswerIndex: 0,
                explanation: "『雷が鳴り始めた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『さす』の漢字はどれですか？『傘を＿＿』",
                choices: [
                    "挿す",
                    "指す",
                    "差す",
                    "刺す"
                ],
                correctAnswerIndex: 2,
                explanation: "『傘を差す』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『きる』の漢字はどれですか？『服を＿＿』",
                choices: [
                    "切る",
                    "着る",
                    "割る",
                    "裂く"
                ],
                correctAnswerIndex: 1,
                explanation: "『服を着る』が正解です。"
            ),
            QuizQuestion(
                question: "『みず』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "火",
                    "水",
                    "風",
                    "土"
                ],
                correctAnswerIndex: 1,
                explanation: "『みず』は『水』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『試験が終わって、太郎は…』",
                choices: [
                    "公園で遊んだ",
                    "友達と話した",
                    "家に帰った",
                    "泣いてしまった"
                ],
                correctAnswerIndex: 0,
                explanation: "『公園で遊んだ』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かえる』の漢字はどれですか？『家に＿＿』",
                choices: [
                    "変える",
                    "返る",
                    "帰る",
                    "替える"
                ],
                correctAnswerIndex: 2,
                explanation: "『家に帰る』が正解です。"
            ),
            QuizQuestion(
                question: "『たのしい』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "悲しい",
                    "嬉しい",
                    "楽しい",
                    "寂しい"
                ],
                correctAnswerIndex: 2,
                explanation: "『たのしい』は『楽しい』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『山の頂上に登ったら、そこには…』",
                choices: [
                    "美しい景色が広がっていた",
                    "大きな岩があった",
                    "湖が見えた",
                    "風が強く吹いていた"
                ],
                correctAnswerIndex: 0,
                explanation: "『美しい景色が広がっていた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『おりる』の漢字はどれですか？『階段を＿＿』",
                choices: [
                    "降りる",
                    "下りる",
                    "折りる",
                    "割りる"
                ],
                correctAnswerIndex: 0,
                explanation: "『階段を降りる』が正解です。"
            ),
            QuizQuestion(
                question: "『きこえる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "聞こえる",
                    "見える",
                    "感じる",
                    "触れる"
                ],
                correctAnswerIndex: 0,
                explanation: "『きこえる』は『聞こえる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『学校が終わると、子供たちは…』",
                choices: [
                    "友達と遊び始めた",
                    "宿題をした",
                    "家に帰った",
                    "先生に挨拶した"
                ],
                correctAnswerIndex: 0,
                explanation: "『友達と遊び始めた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『たつ』の漢字はどれですか？『＿＿を取る』",
                choices: [
                    "立つ",
                    "建つ",
                    "経つ",
                    "発つ"
                ],
                correctAnswerIndex: 0,
                explanation: "『立つを取る』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かぜ』の漢字はどれですか？『＿＿をひいた』",
                choices: [
                    "風",
                    "風邪",
                    "風速",
                    "風力"
                ],
                correctAnswerIndex: 1,
                explanation: "『風邪をひいた』が正解です。"
            ),
            QuizQuestion(
                question: "『あつい』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "冷たい",
                    "温かい",
                    "熱い",
                    "涼しい"
                ],
                correctAnswerIndex: 2,
                explanation: "『あつい』は『熱い』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『みんなで遠足に行きました。すると…』",
                choices: [
                    "バスが出発した",
                    "家に帰った",
                    "先生が怒った",
                    "雨が降り出した"
                ],
                correctAnswerIndex: 3,
                explanation: "『雨が降り出した』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かみ』の漢字はどれですか？『＿＿を切る』",
                choices: [
                    "神",
                    "紙",
                    "髪",
                    "上"
                ],
                correctAnswerIndex: 2,
                explanation: "『髪を切る』が正解です。"
            ),
            QuizQuestion(
                question: "『まもる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "破る",
                    "攻める",
                    "守る",
                    "逃げる"
                ],
                correctAnswerIndex: 2,
                explanation: "『まもる』は『守る』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『先生が教室に入ってきました。すると…』",
                choices: [
                    "みんなが座った",
                    "誰もいなくなった",
                    "ベルが鳴った",
                    "電気が消えた"
                ],
                correctAnswerIndex: 0,
                explanation: "『みんなが座った』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『みる』の漢字はどれですか？『テレビを＿＿』",
                choices: [
                    "観る",
                    "診る",
                    "看る",
                    "視る"
                ],
                correctAnswerIndex: 0,
                explanation: "『テレビを観る』が正解です。"
            ),
            QuizQuestion(
                question: "『あつまる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "散らばる",
                    "集まる",
                    "消える",
                    "走る"
                ],
                correctAnswerIndex: 1,
                explanation: "『あつまる』は『集まる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『公園で遊んでいたら、急に…』",
                choices: [
                    "お腹が空いた",
                    "風が強くなった",
                    "友達が帰った",
                    "遊具が壊れた"
                ],
                correctAnswerIndex: 1,
                explanation: "『風が強くなった』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『そと』の漢字はどれですか？『＿＿に出る』",
                choices: [
                    "家",
                    "外",
                    "空",
                    "川"
                ],
                correctAnswerIndex: 1,
                explanation: "『外に出る』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『はやし』の漢字はどれですか？『＿＿の中を歩く』",
                choices: [
                    "林",
                    "早",
                    "走",
                    "晴"
                ],
                correctAnswerIndex: 0,
                explanation: "『林の中を歩く』が正解です。"
            ),
            QuizQuestion(
                question: "『さけぶ』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "叫ぶ",
                    "笑う",
                    "走る",
                    "聞く"
                ],
                correctAnswerIndex: 0,
                explanation: "『さけぶ』は『叫ぶ』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『太郎は一生懸命勉強しました。すると…』",
                choices: [
                    "テストで良い点を取った",
                    "眠くなった",
                    "お腹が空いた",
                    "友達と遊びに行った"
                ],
                correctAnswerIndex: 0,
                explanation: "『テストで良い点を取った』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『おおきい』の漢字はどれですか？『＿＿家を建てる』",
                choices: [
                    "大きい",
                    "太い",
                    "多い",
                    "強い"
                ],
                correctAnswerIndex: 0,
                explanation: "『大きい家を建てる』が正解です。"
            ),
            QuizQuestion(
                question: "『たつ』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "立つ",
                    "座る",
                    "寝る",
                    "食べる"
                ],
                correctAnswerIndex: 0,
                explanation: "『たつ』は『立つ』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『お店でりんごを買いました。すると…』",
                choices: [
                    "友達に会った",
                    "雨が降り出した",
                    "財布を忘れた",
                    "お店が閉まった"
                ],
                correctAnswerIndex: 0,
                explanation: "『友達に会った』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『うまれる』の漢字はどれですか？『赤ちゃんが＿＿』",
                choices: [
                    "生まれる",
                    "動まれる",
                    "成まれる",
                    "生える"
                ],
                correctAnswerIndex: 0,
                explanation: "『赤ちゃんが生まれる』が正解です。"
            ),
            QuizQuestion(
                question: "『おしえる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "教える",
                    "聞く",
                    "書く",
                    "話す"
                ],
                correctAnswerIndex: 0,
                explanation: "『おしえる』は『教える』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『家族でピクニックに出かけました。すると…』",
                choices: [
                    "お弁当を広げた",
                    "雨が降り出した",
                    "お店に寄った",
                    "友達に会った"
                ],
                correctAnswerIndex: 0,
                explanation: "『お弁当を広げた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『そら』の漢字はどれですか？『＿＿が青い』",
                choices: [
                    "空",
                    "星",
                    "川",
                    "草"
                ],
                correctAnswerIndex: 0,
                explanation: "『空が青い』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『こう』の漢字はどれですか？『＿＿園に行く』",
                choices: [
                    "公",
                    "交",
                    "講",
                    "光"
                ],
                correctAnswerIndex: 0,
                explanation: "『公園に行く』が正解です。"
            ),
            QuizQuestion(
                question: "『まもる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "守る",
                    "破る",
                    "無視する",
                    "攻める"
                ],
                correctAnswerIndex: 0,
                explanation: "『まもる』は『守る』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『おばあちゃんは庭の花を見ていました。すると…』",
                choices: [
                    "鳥が花に止まった",
                    "風が吹き始めた",
                    "電話が鳴り出した",
                    "犬が吠えた"
                ],
                correctAnswerIndex: 0,
                explanation: "『鳥が花に止まった』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『しん』の漢字はどれですか？『友達を＿＿じる』",
                choices: [
                    "信",
                    "真",
                    "進",
                    "新"
                ],
                correctAnswerIndex: 0,
                explanation: "『友達を信じる』が正解です。"
            ),
            QuizQuestion(
                question: "『おさえる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "押さえる",
                    "引く",
                    "転がす",
                    "曲げる"
                ],
                correctAnswerIndex: 0,
                explanation: "『おさえる』は『押さえる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『夏休みの宿題が終わった。すると…』",
                choices: [
                    "遊びに行った",
                    "お昼ご飯を食べた",
                    "散歩に出かけた",
                    "テレビを見始めた"
                ],
                correctAnswerIndex: 0,
                explanation: "『遊びに行った』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『ひかり』の漢字はどれですか？『太陽の＿＿』",
                choices: [
                    "光",
                    "響",
                    "灯",
                    "影"
                ],
                correctAnswerIndex: 0,
                explanation: "『太陽の光』が正解です。"
            ),
            QuizQuestion(
                question: "『かぞえる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "数える",
                    "飛ぶ",
                    "消す",
                    "運ぶ"
                ],
                correctAnswerIndex: 0,
                explanation: "『かぞえる』は『数える』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『子どもたちは運動場で遊んでいました。すると…』",
                choices: [
                    "ベルが鳴った",
                    "雨が降り出した",
                    "お弁当を食べた",
                    "犬が走ってきた"
                ],
                correctAnswerIndex: 0,
                explanation: "『ベルが鳴った』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『せん』の漢字はどれですか？『勝負に＿＿する』",
                choices: [
                    "戦",
                    "選",
                    "線",
                    "船"
                ],
                correctAnswerIndex: 0,
                explanation: "『勝負に戦する』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『あう』の漢字はどれですか？『友達に＿＿』",
                choices: [
                    "会う",
                    "合う",
                    "遭う",
                    "遇う"
                ],
                correctAnswerIndex: 0,
                explanation: "『友達に会う』が正解です。"
            ),
            QuizQuestion(
                question: "『さがす』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "探す",
                    "減らす",
                    "学ぶ",
                    "止める"
                ],
                correctAnswerIndex: 0,
                explanation: "『さがす』は『探す』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『空はだんだん暗くなってきました。すると…』",
                choices: [
                    "星が見え始めた",
                    "雨が降ってきた",
                    "鳥が飛び始めた",
                    "風が吹き始めた"
                ],
                correctAnswerIndex: 0,
                explanation: "『星が見え始めた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かん』の漢字はどれですか？『時間＿＿を守る』",
                choices: [
                    "完",
                    "官",
                    "感",
                    "間"
                ],
                correctAnswerIndex: 3,
                explanation: "『時間間を守る』が正解です。"
            ),
            QuizQuestion(
                question: "『のばす』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "延ばす",
                    "縮める",
                    "削る",
                    "割る"
                ],
                correctAnswerIndex: 0,
                explanation: "『のばす』は『延ばす』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『朝起きたら、雪が積もっていました。すると…』",
                choices: [
                    "雪だるまを作り始めた",
                    "雨が降ってきた",
                    "すぐに学校に行った",
                    "友達に電話をした"
                ],
                correctAnswerIndex: 0,
                explanation: "『雪だるまを作り始めた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『たび』の漢字はどれですか？『＿＿に出る』",
                choices: [
                    "旅",
                    "度",
                    "鍛",
                    "扉"
                ],
                correctAnswerIndex: 0,
                explanation: "『旅に出る』が正解です。"
            ),
            QuizQuestion(
                question: "『あつめる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "集める",
                    "減らす",
                    "消す",
                    "並べる"
                ],
                correctAnswerIndex: 0,
                explanation: "『あつめる』は『集める』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『夕食の準備ができました。すると…』",
                choices: [
                    "みんなが食卓に集まった",
                    "犬が吠え始めた",
                    "窓を開けた",
                    "テレビをつけた"
                ],
                correctAnswerIndex: 0,
                explanation: "『みんなが食卓に集まった』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『せん』の漢字はどれですか？『＿＿を引く』",
                choices: [
                    "線",
                    "戦",
                    "選",
                    "船"
                ],
                correctAnswerIndex: 0,
                explanation: "『線を引く』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『はな』の漢字はどれですか？『＿＿が咲いた』",
                choices: [
                    "花",
                    "鼻",
                    "羽",
                    "話"
                ],
                correctAnswerIndex: 0,
                explanation: "『花が咲いた』が正解です。"
            ),
            QuizQuestion(
                question: "『さわぐ』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "静かになる",
                    "騒がしくする",
                    "歩く",
                    "笑う"
                ],
                correctAnswerIndex: 1,
                explanation: "『さわぐ』は『騒がしくする』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『弟はケーキを食べ終わった。すると…』",
                choices: [
                    "さらにおかわりをした",
                    "宿題を始めた",
                    "外で遊び始めた",
                    "テレビを見た"
                ],
                correctAnswerIndex: 0,
                explanation: "『さらにおかわりをした』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『しゅう』の漢字はどれですか？『学＿＿を終える』",
                choices: [
                    "終",
                    "収",
                    "習",
                    "修"
                ],
                correctAnswerIndex: 3,
                explanation: "『学修を終える』が正解です。"
            ),
            QuizQuestion(
                question: "『しんじる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "疑う",
                    "信じる",
                    "待つ",
                    "隠す"
                ],
                correctAnswerIndex: 1,
                explanation: "『しんじる』は『信じる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『学校が終わって、みんなが帰った。すると…』",
                choices: [
                    "先生が教室に残った",
                    "雨が降り出した",
                    "友達が遊びに来た",
                    "お店に寄った"
                ],
                correctAnswerIndex: 1,
                explanation: "『雨が降り出した』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『てい』の漢字はどれですか？『＿＿度の天気』",
                choices: [
                    "停",
                    "定",
                    "低",
                    "邸"
                ],
                correctAnswerIndex: 2,
                explanation: "『低度の天気』が正解です。"
            ),
            QuizQuestion(
                question: "『たすける』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "助ける",
                    "攻撃する",
                    "笑う",
                    "動かす"
                ],
                correctAnswerIndex: 0,
                explanation: "『たすける』は『助ける』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『授業中、急に先生が立ち上がった。すると…』",
                choices: [
                    "黒板に何かを書き始めた",
                    "窓を開けた",
                    "みんなに話をした",
                    "教室を出て行った"
                ],
                correctAnswerIndex: 0,
                explanation: "『黒板に何かを書き始めた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『そう』の漢字はどれですか？『計画＿＿に従う』",
                choices: [
                    "層",
                    "想",
                    "操",
                    "走"
                ],
                correctAnswerIndex: 2,
                explanation: "『計画操に従う』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かい』の漢字はどれですか？『＿＿を開く』",
                choices: [
                    "会",
                    "海",
                    "階",
                    "解"
                ],
                correctAnswerIndex: 0,
                explanation: "『会を開く』が正解です。"
            ),
            QuizQuestion(
                question: "『そだつ』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "大きくなる",
                    "小さくなる",
                    "遠くなる",
                    "近くなる"
                ],
                correctAnswerIndex: 0,
                explanation: "『そだつ』は『大きくなる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『花子は家に帰って宿題を始めました。すると…』",
                choices: [
                    "お母さんが部屋に入ってきた",
                    "友達が遊びに来た",
                    "雨が降ってきた",
                    "猫が鳴きだした"
                ],
                correctAnswerIndex: 0,
                explanation: "『お母さんが部屋に入ってきた』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『しん』の漢字はどれですか？『新しい＿＿を買う』",
                choices: [
                    "信",
                    "進",
                    "心",
                    "新"
                ],
                correctAnswerIndex: 3,
                explanation: "『新しい新を買う』が正解です。"
            ),
            QuizQuestion(
                question: "『くわしい』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "大まか",
                    "詳細",
                    "簡単",
                    "難しい"
                ],
                correctAnswerIndex: 1,
                explanation: "『くわしい』は『詳細』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『お店に着いたが、店内は真っ暗だった。すると…』",
                choices: [
                    "電気がついた",
                    "お客さんが増えた",
                    "風が吹いた",
                    "店員が出てきた"
                ],
                correctAnswerIndex: 0,
                explanation: "『電気がついた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『せい』の漢字はどれですか？『学＿＿を取る』",
                choices: [
                    "精",
                    "生",
                    "成",
                    "姓"
                ],
                correctAnswerIndex: 1,
                explanation: "『学生を取る』が正解です。"
            ),
            QuizQuestion(
                question: "『もえる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "燃える",
                    "冷える",
                    "濡れる",
                    "固まる"
                ],
                correctAnswerIndex: 0,
                explanation: "『もえる』は『燃える』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『夏休みが終わって、学校が始まった。すると…』",
                choices: [
                    "友達と再会した",
                    "試験が行われた",
                    "雨が降ってきた",
                    "家に帰った"
                ],
                correctAnswerIndex: 0,
                explanation: "『友達と再会した』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かん』の漢字はどれですか？『＿＿を感じる』",
                choices: [
                    "管",
                    "完",
                    "官",
                    "感"
                ],
                correctAnswerIndex: 3,
                explanation: "『感を感じる』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かん』の漢字はどれですか？『試験＿＿を終えた』",
                choices: [
                    "完",
                    "官",
                    "感",
                    "漢"
                ],
                correctAnswerIndex: 0,
                explanation: "『試験完を終えた』が正解です。"
            ),
            QuizQuestion(
                question: "『ふえる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "減る",
                    "多くなる",
                    "速くなる",
                    "少なくなる"
                ],
                correctAnswerIndex: 1,
                explanation: "『ふえる』は『多くなる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『今日の天気はとても良いです。なので…』",
                choices: [
                    "外で遊びたい",
                    "家で寝たい",
                    "宿題をしたい",
                    "映画を見たい"
                ],
                correctAnswerIndex: 0,
                explanation: "『外で遊びたい』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『せい』の漢字はどれですか？『＿＿がつく』",
                choices: [
                    "正",
                    "性",
                    "成",
                    "星"
                ],
                correctAnswerIndex: 0,
                explanation: "『正がつく』が正解です。"
            ),
            QuizQuestion(
                question: "『しごと』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "遊び",
                    "仕事",
                    "趣味",
                    "休み"
                ],
                correctAnswerIndex: 1,
                explanation: "『しごと』は『仕事』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『猫が窓の外を見ていました。すると…』",
                choices: [
                    "鳥が飛んできた",
                    "雨が降ってきた",
                    "ご飯ができた",
                    "友達が来た"
                ],
                correctAnswerIndex: 0,
                explanation: "『鳥が飛んできた』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かん』の漢字はどれですか？『図書＿＿に行く』",
                choices: [
                    "館",
                    "間",
                    "感",
                    "完"
                ],
                correctAnswerIndex: 0,
                explanation: "『図書館に行く』が正解です。"
            ),
            QuizQuestion(
                question: "『はたらく』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "休む",
                    "働く",
                    "遊ぶ",
                    "学ぶ"
                ],
                correctAnswerIndex: 1,
                explanation: "『はたらく』は『働く』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『兄は本を読んでいました。すると…』",
                choices: [
                    "眠くなった",
                    "お腹が空いた",
                    "電話が鳴った",
                    "遊びに行った"
                ],
                correctAnswerIndex: 2,
                explanation: "『電話が鳴った』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『たん』の漢字はどれですか？『＿＿を探す』",
                choices: [
                    "短",
                    "単",
                    "炭",
                    "探"
                ],
                correctAnswerIndex: 1,
                explanation: "『単を探す』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『しろ』の漢字はどれですか？『＿＿を見に行った』",
                choices: [
                    "城",
                    "白",
                    "代",
                    "仕"
                ],
                correctAnswerIndex: 0,
                explanation: "『城を見に行った』が正解です。"
            ),
            QuizQuestion(
                question: "『つよい』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "弱い",
                    "丈夫",
                    "速い",
                    "硬い"
                ],
                correctAnswerIndex: 1,
                explanation: "『つよい』は『丈夫』という意味に近いです。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『花子はお母さんと買い物に行きました。すると…』",
                choices: [
                    "大雨が降ってきた",
                    "野菜が安売りされていた",
                    "お店が閉まっていた",
                    "友達に会った"
                ],
                correctAnswerIndex: 3,
                explanation: "『友達に会った』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かき』の漢字はどれですか？『＿＿を食べた』",
                choices: [
                    "柿",
                    "書き",
                    "掻き",
                    "火気"
                ],
                correctAnswerIndex: 0,
                explanation: "『柿を食べた』が正解です。"
            ),
            QuizQuestion(
                question: "『広がる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "縮む",
                    "延びる",
                    "増える",
                    "広くなる"
                ],
                correctAnswerIndex: 3,
                explanation: "『広がる』は『広くなる』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『犬が庭で吠えています。すると…』",
                choices: [
                    "郵便屋さんが来た",
                    "雷が鳴った",
                    "ごはんができた",
                    "猫が逃げた"
                ],
                correctAnswerIndex: 0,
                explanation: "『郵便屋さんが来た』が自然な展開です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『かぜ』の漢字はどれですか？『＿＿が強い』",
                choices: [
                    "風",
                    "風邪",
                    "家",
                    "火事"
                ],
                correctAnswerIndex: 0,
                explanation: "『風が強い』が正解です。"
            ),
            QuizQuestion(
                question: "『しずか』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "騒がしい",
                    "静か",
                    "忙しい",
                    "寂しい"
                ],
                correctAnswerIndex: 1,
                explanation: "『しずか』は『静か』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『今日の学校は楽しかったです。だから…』",
                choices: [
                    "明日も学校に行きたい",
                    "宿題を忘れた",
                    "先生に怒られた",
                    "友達とケンカした"
                ],
                correctAnswerIndex: 0,
                explanation: "『明日も学校に行きたい』が自然な流れです。"
            ),
            QuizQuestion(
                question: "次の文で正しい『うみ』の漢字はどれですか？『夏に＿＿に行く』",
                choices: [
                    "海",
                    "梅",
                    "膿",
                    "産"
                ],
                correctAnswerIndex: 0,
                explanation: "『夏に海に行く』が正解です。"
            ),
            QuizQuestion(
                question: "次の文で正しい『はし』の漢字はどれですか？『あの＿＿をわたる』",
                choices: [
                    "橋",
                    "箸",
                    "端",
                    "走"
                ],
                correctAnswerIndex: 0,
                explanation: "『あの橋をわたる』が正解です。"
            ),
            QuizQuestion(
                question: "『つながる』という言葉の意味として適切なものはどれですか？",
                choices: [
                    "結びつく",
                    "離れる",
                    "動く",
                    "飛ぶ"
                ],
                correctAnswerIndex: 0,
                explanation: "『つながる』は『結びつく』という意味です。"
            ),
            QuizQuestion(
                question: "次の文に続く内容として最も適切なものはどれですか？『太郎は友達と公園で遊んでいました。すると…』",
                choices: [
                    "雨が降ってきた",
                    "家に帰った",
                    "遊具が壊れた",
                    "犬がやってきた"
                ],
                correctAnswerIndex: 3,
                explanation: "次の展開として『犬がやってきた』が自然な流れです。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo3, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo3ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo3ListView(isPresenting: .constant(false))
    }
}
