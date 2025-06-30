//
//  StoryListView.swift
//  it
//
//  Created by Apple on 2024/11/16.
//

import SwiftUI

struct StoryKokugoListView: View {
    @Binding var isPresenting: Bool

    let quizBeginnerList: [QuizQuestion] = [
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
QuizQuestion(
        question: "次の熟語『完成』の意味はどれですか？",
        choices: [
            "途中でやめること",
            "最後まで仕上げること",
            "失敗すること",
            "始めること"
        ],
        correctAnswerIndex: 1,
        explanation: "『完成』とは、物事を最後まで仕上げることを意味します。"
    ),

    QuizQuestion(
        question: "『亀の甲より年の功』の意味はどれですか？",
        choices: [
            "亀の甲羅が硬いこと",
            "年を取ると知恵がつくこと",
            "年を取ると動きが遅くなること",
            "亀のように長生きすること"
        ],
        correctAnswerIndex: 1,
        explanation: "『亀の甲より年の功』は、年齢を重ねることで得られる知恵や経験が重要であることを意味します。"
    ),

    QuizQuestion(
        question: "次の熟語『改善』の意味はどれですか？",
        choices: [
            "何もしないこと",
            "物事をより良くすること",
            "悪くすること",
            "無視すること"
        ],
        correctAnswerIndex: 1,
        explanation: "『改善』とは、現状をより良くするための行動や変更を指します。"
    ),

    QuizQuestion(
        question: "『油断大敵』の意味はどれですか？",
        choices: [
            "油は危険であること",
            "敵を見逃すと危険であること",
            "油断すると大きな失敗を招くこと",
            "敵を侮ってはいけないこと"
        ],
        correctAnswerIndex: 2,
        explanation: "『油断大敵』は、油断すると思わぬ災難に遭うという意味です。"
    ),

    QuizQuestion(
        question: "次の熟語『協力』の意味はどれですか？",
        choices: [
            "一人で物事を進めること",
            "他人と競争すること",
            "みんなで力を合わせること",
            "他人を手助けしないこと"
        ],
        correctAnswerIndex: 2,
        explanation: "『協力』とは、複数の人が力を合わせて一つの目標に向かって取り組むことを意味します。"
    ),

    QuizQuestion(
        question: "『寝耳に水』の意味はどれですか？",
        choices: [
            "水が耳に入ること",
            "予想外の出来事に驚くこと",
            "寝ながら水を飲むこと",
            "水の音で目が覚めること"
        ],
        correctAnswerIndex: 1,
        explanation: "『寝耳に水』は、全く予想していなかったことが突然起こり、驚くことを意味します。"
    ),
    QuizQuestion(
        question: "次の熟語『努力』の意味はどれですか？",
        choices: [
            "怠けること",
            "頑張って物事に取り組むこと",
            "楽しむこと",
            "他人に任せること"
        ],
        correctAnswerIndex: 1,
        explanation: "『努力』とは、目標に向かって一生懸命に頑張ることを意味します。"
    ),

    QuizQuestion(
        question: "『猿も木から落ちる』の意味はどれですか？",
        choices: [
            "猿は木から落ちることがない",
            "どんなに上手な人でも失敗することがある",
            "失敗すると二度と成功できない",
            "猿のように素早く行動すること"
        ],
        correctAnswerIndex: 1,
        explanation: "『猿も木から落ちる』は、どんなに得意なことでも失敗することがあるという意味です。"
    ),

    QuizQuestion(
        question: "次の熟語『挑戦』の意味はどれですか？",
        choices: [
            "失敗を恐れること",
            "楽な道を選ぶこと",
            "困難に立ち向かうこと",
            "諦めること"
        ],
        correctAnswerIndex: 2,
        explanation: "『挑戦』とは、困難なことや新しいことに積極的に立ち向かうことを意味します。"
    ),

    QuizQuestion(
        question: "『石橋を叩いて渡る』の意味はどれですか？",
        choices: [
            "壊れた橋を渡ること",
            "慎重に物事を進めること",
            "急いで物事を進めること",
            "橋を修理してから渡ること"
        ],
        correctAnswerIndex: 1,
        explanation: "『石橋を叩いて渡る』は、慎重に物事を進めることを意味します。"
    ),

    QuizQuestion(
        question: "次の熟語『協力』の意味はどれですか？",
        choices: [
            "一人で物事を進めること",
            "他人と競争すること",
            "みんなで力を合わせること",
            "他人を手助けしないこと"
        ],
        correctAnswerIndex: 2,
        explanation: "『協力』とは、複数の人が力を合わせて一つの目標に向かって取り組むことを意味します。"
    ),

    QuizQuestion(
        question: "『立てば芍薬、座れば牡丹』の意味はどれですか？",
        choices: [
            "どの花も美しいということ",
            "美しい女性のしなやかな姿を例える言葉",
            "立っているときに気をつけること",
            "花を育てるのが難しいこと"
        ],
        correctAnswerIndex: 1,
        explanation: "『立てば芍薬、座れば牡丹』は、美しい女性の姿や立ち居振る舞いを美しい花に例えたことわざです。"
    ),
    QuizQuestion(
        question: "次の熟語『発表』の意味はどれですか？",
        choices: [
            "誰にも知らせないこと",
            "皆に知らせること",
            "情報を隠すこと",
            "秘密にすること"
        ],
        correctAnswerIndex: 1,
        explanation: "『発表』とは、みんなに情報や考えを知らせることを意味します。"
    ),

    QuizQuestion(
        question: "『針の穴から天をのぞく』の意味はどれですか？",
        choices: [
            "大きな目標を見ること",
            "狭い視野で物事を考えること",
            "小さな穴から空を見ること",
            "針で空を刺すこと"
        ],
        correctAnswerIndex: 1,
        explanation: "『針の穴から天をのぞく』は、狭い視野や知識で物事を判断することを意味します。"
    ),

    QuizQuestion(
        question: "次の熟語『改善』の意味はどれですか？",
        choices: [
            "物事をそのままにしておくこと",
            "悪くすること",
            "物事を良くすること",
            "何もしないこと"
        ],
        correctAnswerIndex: 2,
        explanation: "『改善』とは、今の状態をより良くすることを意味します。"
    ),

    QuizQuestion(
        question: "『覆水盆に返らず』の意味はどれですか？",
        choices: [
            "一度失ったものは取り戻せないこと",
            "水を返すことができること",
            "盆に水を入れること",
            "失敗したことをやり直すこと"
        ],
        correctAnswerIndex: 1,
        explanation: "『覆水盆に返らず』は、一度失ったものは取り戻せないという意味のことわざです。"
    ),

    QuizQuestion(
        question: "次の熟語『尊敬』の意味はどれですか？",
        choices: [
            "他人を見下すこと",
            "他人を褒めること",
            "他人をうやまうこと",
            "他人を無視すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『尊敬』とは、他人をうやまうことを意味します。"
    ),

    QuizQuestion(
        question: "『二階から目薬』の意味はどれですか？",
        choices: [
            "目薬をさすときのコツ",
            "効果がないこと",
            "少しは効き目があること",
            "やり方が非効率であること"
        ],
        correctAnswerIndex: 3,
        explanation: "『二階から目薬』は、やり方が非効率で効果が薄いことを意味することわざです。"
    ),
    QuizQuestion(
        question: "次の熟語『進歩』の意味はどれですか？",
        choices: [
            "何も変わらないこと",
            "一歩も動かないこと",
            "物事が前に進むこと",
            "後退すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『進歩』とは、物事が前に進んで発展することを意味します。"
    ),

    QuizQuestion(
        question: "『泣きっ面に蜂』の意味はどれですか？",
        choices: [
            "蜂に刺されて泣くこと",
            "泣いている人にさらに災難が降りかかること",
            "嬉しいことが続くこと",
            "泣くとすぐに解決すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『泣きっ面に蜂』は、悪いことが重なることを意味することわざです。"
    ),

    QuizQuestion(
        question: "次の熟語『発展』の意味はどれですか？",
        choices: [
            "物事が衰えること",
            "元に戻ること",
            "物事が大きく進むこと",
            "現状を維持すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『発展』とは、物事が大きく進んで、さらに良くなることを意味します。"
    ),

    QuizQuestion(
        question: "『明日は明日の風が吹く』の意味はどれですか？",
        choices: [
            "風が強く吹くという予測",
            "今日と明日は同じであること",
            "先のことは考えすぎずに、その時に任せること",
            "風が変われば運も変わること"
        ],
        correctAnswerIndex: 3,
        explanation: "『明日は明日の風が吹く』は、未来のことをあまり心配せず、その時その時で対処すればよいという意味です。"
    ),

    QuizQuestion(
        question: "次の熟語『確認』の意味はどれですか？",
        choices: [
            "何もしないこと",
            "考え直すこと",
            "事実や状況をしっかり確かめること",
            "結果を無視すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『確認』とは、事実や状況が正しいかどうかをしっかり確かめることを意味します。"
    ),

    QuizQuestion(
        question: "『一石二鳥』の意味はどれですか？",
        choices: [
            "一つの石を二つに割ること",
            "一人で二つのことをすること",
            "一つの行動で二つの利益を得ること",
            "鳥が石を持ち上げること"
        ],
        correctAnswerIndex: 2,
        explanation: "『一石二鳥』は、一つの行動で二つの成果を得ることを意味することわざです。"
    ),
    QuizQuestion(
        question: "次の熟語『冷静』の意味はどれですか？",
        choices: [
            "感情を抑えることができないこと",
            "すぐに感情的になること",
            "落ち着いて判断すること",
            "焦って行動すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『冷静』とは、感情に流されず、落ち着いて物事を判断することを意味します。"
    ),

    QuizQuestion(
        question: "『棚からぼたもち』の意味はどれですか？",
        choices: [
            "棚の上からぼたもちが落ちてくること",
            "他人に助けてもらうこと",
            "思いがけず幸運が舞い込むこと",
            "努力しなくても成功すること"
        ],
        correctAnswerIndex: 2,
        explanation: "『棚からぼたもち』は、思いがけず幸運が舞い込んでくることを意味することわざです。"
    ),

    QuizQuestion(
        question: "次の熟語『工夫』の意味はどれですか？",
        choices: [
            "同じことを繰り返すこと",
            "他人を真似すること",
            "新しいアイデアを考え出すこと",
            "何もしないこと"
        ],
        correctAnswerIndex: 2,
        explanation: "『工夫』とは、よりよい結果を得るために新しいアイデアを考えることを意味します。"
    ),

    QuizQuestion(
        question: "『覆水盆に返らず』の意味はどれですか？",
        choices: [
            "一度失敗するとやり直しができないこと",
            "水を戻すのが難しいこと",
            "一度したことは元に戻らないこと",
            "失敗してもやり直せること"
        ],
        correctAnswerIndex: 3,
        explanation: "『覆水盆に返らず』は、一度起こったことや失われたものは元に戻らないという意味のことわざです。"
    ),
        QuizQuestion(
            question: "次の熟語『挑戦』の意味はどれですか？",
            choices: [
                "成功したことを続けること",
                "新しいことを始めること",
                "困難なことに立ち向かうこと",
                "楽しいことを追いかけること"
            ],
            correctAnswerIndex: 2,
            explanation: "『挑戦』とは、困難や新しいことに積極的に取り組むことを意味します。"
        ),

        QuizQuestion(
            question: "『急いては事を仕損じる』の意味はどれですか？",
            choices: [
                "急いで行動することが成功の秘訣である",
                "速く行動すると成功しやすい",
                "急ぐと失敗しやすい",
                "ゆっくりやると失敗する"
            ],
            correctAnswerIndex: 2,
            explanation: "『急いては事を仕損じる』は、急いで行動すると失敗しやすいという意味のことわざです。"
        ),
        QuizQuestion(
            question: "次の熟語『協調』の意味はどれですか？",
            choices: [
                "自分だけで行動すること",
                "他人と協力し合って行動すること",
                "対立を避けること",
                "時間をかけて考えること"
            ],
            correctAnswerIndex: 1,
            explanation: "『協調』とは、他人と協力し合い、調和を図りながら行動することを意味します。"
        ),

        QuizQuestion(
            question: "『船頭多くして船山に上る』の意味はどれですか？",
            choices: [
                "船にたくさんの船頭がいること",
                "指示をする人が多いと物事がうまくいかないこと",
                "山に船を運ぶこと",
                "みんなで協力して山を登ること"
            ],
            correctAnswerIndex: 1,
            explanation: "『船頭多くして船山に上る』は、指示を出す人が多すぎると物事がうまくいかないことを意味します。"
        ),

        QuizQuestion(
            question: "次の熟語『成功』の意味はどれですか？",
            choices: [
                "失敗を恐れること",
                "目標を達成すること",
                "途中で諦めること",
                "準備をすること"
            ],
            correctAnswerIndex: 1,
            explanation: "『成功』とは、目標を達成することを意味します。"
        ),

        QuizQuestion(
            question: "『立つ鳥跡を濁さず』の意味はどれですか？",
            choices: [
                "鳥が飛び立つと跡が残らないこと",
                "去るときにはきちんと後始末をすること",
                "鳥が空をきれいに飛ぶこと",
                "跡を残さず物事を進めること"
            ],
            correctAnswerIndex: 1,
            explanation: "『立つ鳥跡を濁さず』は、去るときに後片付けをきちんとして、迷惑をかけないようにするという意味です。"
        ),

        QuizQuestion(
            question: "次の熟語『挑戦』の意味はどれですか？",
            choices: [
                "新しいことに取り組むこと",
                "失敗を避けること",
                "無理をしないこと",
                "安心して過ごすこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『挑戦』とは、困難なことや新しいことに積極的に取り組むことを意味します。"
        ),

        QuizQuestion(
            question: "『案ずるより産むが易し』の意味はどれですか？",
            choices: [
                "考えすぎると失敗しやすいこと",
                "心配するよりもやってみたほうが簡単なこと",
                "産むことは難しいこと",
                "何かを考えるときには慎重になること"
            ],
            correctAnswerIndex: 1,
            explanation: "『案ずるより産むが易し』は、心配しているよりも実際にやってみたほうが意外と簡単だという意味です。"
        ),
        QuizQuestion(
            question: "次の熟語『努力』の意味はどれですか？",
            choices: [
                "失敗を恐れること",
                "頑張って物事に取り組むこと",
                "楽しむために動くこと",
                "他人に頼ること"
            ],
            correctAnswerIndex: 1,
            explanation: "『努力』とは、目標に向かって頑張って取り組むことを意味します。"
        ),

        QuizQuestion(
            question: "『鶴の一声』の意味はどれですか？",
            choices: [
                "鳥が鳴く声",
                "非常に影響力のある人の一言",
                "大きな声で叫ぶこと",
                "歌を上手に歌うこと"
            ],
            correctAnswerIndex: 1,
            explanation: "『鶴の一声』は、非常に影響力のある人が発する一言のことを意味します。"
        ),

        QuizQuestion(
            question: "次の熟語『集中』の意味はどれですか？",
            choices: [
                "みんなで協力すること",
                "一つのことに注意を向けること",
                "たくさんのことを同時に行うこと",
                "時間をかけてゆっくり行うこと"
            ],
            correctAnswerIndex: 1,
            explanation: "『集中』とは、一つの物事に全ての注意や力を注ぐことを意味します。"
        ),

        QuizQuestion(
            question: "『以心伝心』の意味はどれですか？",
            choices: [
                "心がすぐに伝わること",
                "言葉にしなくてもお互いの心が通じ合うこと",
                "手紙を使って心を伝えること",
                "早く気持ちを伝えること"
            ],
            correctAnswerIndex: 1,
            explanation: "『以心伝心』は、言葉を使わなくてもお互いの気持ちが通じ合うことを意味します。"
        ),

        QuizQuestion(
            question: "次の熟語『感動』の意味はどれですか？",
            choices: [
                "感情が動かされること",
                "楽しい気持ちになること",
                "怒りを感じること",
                "悲しむこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『感動』とは、心が強く動かされることを意味します。"
        ),

        QuizQuestion(
            question: "『桃栗三年柿八年』の意味はどれですか？",
            choices: [
                "何事も結果が出るまで時間がかかるということ",
                "3年で木が実を結ぶということ",
                "果物を育てるのにかかる時間のこと",
                "待てば必ず成果が得られるということ"
            ],
            correctAnswerIndex: 0,
            explanation: "『桃栗三年柿八年』は、何事にも結果が出るまで時間がかかることを意味します。"
        ),
        QuizQuestion(
            question: "次の熟語『希望』の意味はどれですか？",
            choices: [
                "未来への期待",
                "現在の幸せ",
                "過去の思い出",
                "困難な状況"
            ],
            correctAnswerIndex: 0,
            explanation: "『希望』とは、未来に対する期待や望みを意味します。"
        ),

        QuizQuestion(
            question: "『井の中の蛙』の意味はどれですか？",
            choices: [
                "狭い世界に閉じこもっていること",
                "自由に飛び回ること",
                "蛙が井戸にいる様子",
                "水の中に住む動物のこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『井の中の蛙』は、狭い世界しか知らないことを意味します。"
        ),

        QuizQuestion(
            question: "次の熟語『勇気』の意味はどれですか？",
            choices: [
                "恐れずに物事に立ち向かう心",
                "賢く物事を考える力",
                "感謝の気持ち",
                "友達を助けること"
            ],
            correctAnswerIndex: 0,
            explanation: "『勇気』とは、困難や恐怖に負けずに立ち向かう強い心を指します。"
        ),

        QuizQuestion(
            question: "『石の上にも三年』の意味はどれですか？",
            choices: [
                "辛抱強く続けると成果が出ること",
                "石の上に座り続けること",
                "3年で石が変わること",
                "石を3年持ち続けること"
            ],
            correctAnswerIndex: 0,
            explanation: "『石の上にも三年』は、辛抱強く努力を続ければ、成果が得られるという意味です。"
        ),

        QuizQuestion(
            question: "次の熟語『協力』の意味はどれですか？",
            choices: [
                "みんなで力を合わせて何かをすること",
                "一人で物事を達成すること",
                "友達を作ること",
                "競争して勝つこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『協力』とは、複数の人が力を合わせて一つの目標に向かって取り組むことを意味します。"
        ),

        QuizQuestion(
            question: "『光陰矢のごとし』の意味はどれですか？",
            choices: [
                "時間が早く過ぎ去ること",
                "光が速いこと",
                "矢のように飛ぶこと",
                "暗闇の中で光が輝くこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『光陰矢のごとし』は、時間が速く過ぎ去ることを意味することわざです。"
        ),
        QuizQuestion(
            question: "次の熟語『友情』の意味はどれですか？",
            choices: [
                "友達との絆",
                "喜びの感情",
                "悲しみの感情",
                "楽しい出来事"
            ],
            correctAnswerIndex: 0,
            explanation: "『友情』とは、友達との絆や信頼のことを指します。"
        ),

        QuizQuestion(
            question: "『七転び八起き』の意味はどれですか？",
            choices: [
                "何度も失敗しても諦めないこと",
                "7回転んで8回起きること",
                "休まずに働くこと",
                "転んでも泣かないこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『七転び八起き』は、何度失敗しても諦めずに立ち上がるという意味です。"
        ),

        QuizQuestion(
            question: "次の熟語『挑戦』の意味はどれですか？",
            choices: [
                "何か新しいことに立ち向かうこと",
                "楽しみを見つけること",
                "失敗することを恐れること",
                "挑発して怒らせること"
            ],
            correctAnswerIndex: 0,
            explanation: "『挑戦』とは、困難や新しいことに立ち向かうことを意味します。"
        ),

        QuizQuestion(
            question: "『急がば回れ』の意味はどれですか？",
            choices: [
                "焦らず、遠回りでも確実な方法を取ること",
                "すぐに動き始めること",
                "早く行動する人が勝つこと",
                "急いでいるときにはまっすぐ進むこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『急がば回れ』は、急ぐときほど安全で確実な方法を取ることが大切だという意味です。"
        ),
        
        QuizQuestion(
                question: "『亀の甲より年の功』の意味はどれですか？",
                choices: [
                    "亀の甲羅が硬いこと",
                    "年を取ると知恵がつくこと",
                    "年を取ると動きが遅くなること",
                    "亀のように長生きすること"
                ],
                correctAnswerIndex: 1,
                explanation: "『亀の甲より年の功』は、年齢を重ねることで得られる知恵や経験が重要であることを意味します。"
            ),

            QuizQuestion(
                question: "『油断大敵』の意味はどれですか？",
                choices: [
                    "油は危険であること",
                    "敵を見逃すと危険であること",
                    "油断すると大きな失敗を招くこと",
                    "敵を侮ってはいけないこと"
                ],
                correctAnswerIndex: 2,
                explanation: "『油断大敵』は、油断すると思わぬ災難に遭うという意味です。"
            ),

            QuizQuestion(
                question: "『猿も木から落ちる』の意味はどれですか？",
                choices: [
                    "猿は木から落ちることがない",
                    "どんなに上手な人でも失敗することがある",
                    "失敗すると二度と成功できない",
                    "猿のように素早く行動すること"
                ],
                correctAnswerIndex: 1,
                explanation: "『猿も木から落ちる』は、どんなに得意なことでも失敗することがあるという意味です。"
            ),

            QuizQuestion(
                question: "『石橋を叩いて渡る』の意味はどれですか？",
                choices: [
                    "壊れた橋を渡ること",
                    "慎重に物事を進めること",
                    "急いで物事を進めること",
                    "橋を修理してから渡ること"
                ],
                correctAnswerIndex: 1,
                explanation: "『石橋を叩いて渡る』は、慎重に物事を進めることを意味します。"
            ),

            QuizQuestion(
                question: "『寝耳に水』の意味はどれですか？",
                choices: [
                    "水が耳に入ること",
                    "予想外の出来事に驚くこと",
                    "寝ながら水を飲むこと",
                    "水の音で目が覚めること"
                ],
                correctAnswerIndex: 1,
                explanation: "『寝耳に水』は、全く予想していなかったことが突然起こり、驚くことを意味します。"
            ),

            QuizQuestion(
                question: "『針の穴から天をのぞく』の意味はどれですか？",
                choices: [
                    "大きな目標を見ること",
                    "狭い視野で物事を考えること",
                    "小さな穴から空を見ること",
                    "針で空を刺すこと"
                ],
                correctAnswerIndex: 1,
                explanation: "『針の穴から天をのぞく』は、狭い視野や知識で物事を判断することを意味します。"
            ),

            QuizQuestion(
                question: "『二階から目薬』の意味はどれですか？",
                choices: [
                    "目薬をさすときのコツ",
                    "効果がないこと",
                    "少しは効き目があること",
                    "やり方が非効率であること"
                ],
                correctAnswerIndex: 3,
                explanation: "『二階から目薬』は、やり方が非効率で効果が薄いことを意味することわざです。"
            ),

            QuizQuestion(
                question: "『覆水盆に返らず』の意味はどれですか？",
                choices: [
                    "一度失ったものは取り戻せないこと",
                    "水を返すことができること",
                    "盆に水を入れること",
                    "失敗したことをやり直すこと"
                ],
                correctAnswerIndex: 1,
                explanation: "『覆水盆に返らず』は、一度失ったものは取り戻せないという意味のことわざです。"
            ),

            QuizQuestion(
                question: "『明日は明日の風が吹く』の意味はどれですか？",
                choices: [
                    "風が強く吹くという予測",
                    "今日と明日は同じであること",
                    "先のことは考えすぎずに、その時に任せること",
                    "風が変われば運も変わること"
                ],
                correctAnswerIndex: 3,
                explanation: "『明日は明日の風が吹く』は、未来のことをあまり心配せず、その時その時で対処すればよいという意味です。"
            ),

            QuizQuestion(
                question: "『光陰矢のごとし』の意味はどれですか？",
                choices: [
                    "時間が早く過ぎ去ること",
                    "光が速いこと",
                    "矢のように飛ぶこと",
                    "暗闇の中で光が輝くこと"
                ],
                correctAnswerIndex: 0,
                explanation: "『光陰矢のごとし』は、時間が速く過ぎ去ることを意味することわざです。"
            ),

        QuizQuestion(
            question: "次の熟語『努力』の意味はどれですか？",
            choices: [
                "頑張って物事に取り組むこと",
                "失敗を恐れること",
                "楽しむために動くこと",
                "他人に頼ること"
            ],
            correctAnswerIndex: 0,
            explanation: "『努力』とは、目標に向かって頑張って取り組むことを意味します。"
        ),

        QuizQuestion(
            question: "『雲をつかむよう』の意味はどれですか？",
            choices: [
                "つかむのが難しいこと",
                "簡単にできること",
                "雲の上に登ること",
                "空を飛ぶこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『雲をつかむよう』は、実現が難しく、捉えどころのないことを指します。"
        ),
        QuizQuestion(
            question: "次の熟語『感謝』の意味はどれですか？",
            choices: [
                "ありがとうと思う気持ち",
                "うれしい気持ち",
                "悲しい気持ち",
                "楽しい気持ち"
            ],
            correctAnswerIndex: 0,
            explanation: "『感謝』とは、他の人に対してありがとうと思う気持ちを表します。"
        ),

        QuizQuestion(
            question: "『二兎を追う者は一兎をも得ず』の意味はどれですか？",
            choices: [
                "欲張ると何も得られない",
                "2羽のうさぎを追いかける",
                "走るのが速い",
                "うさぎを大事にする"
            ],
            correctAnswerIndex: 0,
            explanation: "『二兎を追う者は一兎をも得ず』は、欲張りすぎると何も得られないという意味です。"
        ),
        QuizQuestion(
                question: "『亀の甲より年の功』の意味はどれですか？",
                choices: [
                    "亀の甲羅が硬いこと",
                    "年を取ると知恵がつくこと",
                    "年を取ると動きが遅くなること",
                    "亀のように長生きすること"
                ],
                correctAnswerIndex: 1,
                explanation: "『亀の甲より年の功』は、年齢を重ねることで得られる知恵や経験が重要であることを意味します。"
            ),

            QuizQuestion(
                question: "『油断大敵』の意味はどれですか？",
                choices: [
                    "油は危険であること",
                    "敵を見逃すと危険であること",
                    "油断すると大きな失敗を招くこと",
                    "敵を侮ってはいけないこと"
                ],
                correctAnswerIndex: 2,
                explanation: "『油断大敵』は、油断すると思わぬ災難に遭うという意味です。"
            ),

            QuizQuestion(
                question: "『猿も木から落ちる』の意味はどれですか？",
                choices: [
                    "猿は木から落ちることがない",
                    "どんなに上手な人でも失敗することがある",
                    "失敗すると二度と成功できない",
                    "猿のように素早く行動すること"
                ],
                correctAnswerIndex: 1,
                explanation: "『猿も木から落ちる』は、どんなに得意なことでも失敗することがあるという意味です。"
            ),

            QuizQuestion(
                question: "『石橋を叩いて渡る』の意味はどれですか？",
                choices: [
                    "壊れた橋を渡ること",
                    "慎重に物事を進めること",
                    "急いで物事を進めること",
                    "橋を修理してから渡ること"
                ],
                correctAnswerIndex: 1,
                explanation: "『石橋を叩いて渡る』は、慎重に物事を進めることを意味します。"
            ),

            QuizQuestion(
                question: "『寝耳に水』の意味はどれですか？",
                choices: [
                    "水が耳に入ること",
                    "予想外の出来事に驚くこと",
                    "寝ながら水を飲むこと",
                    "水の音で目が覚めること"
                ],
                correctAnswerIndex: 1,
                explanation: "『寝耳に水』は、全く予想していなかったことが突然起こり、驚くことを意味します。"
            ),

            QuizQuestion(
                question: "『針の穴から天をのぞく』の意味はどれですか？",
                choices: [
                    "大きな目標を見ること",
                    "狭い視野で物事を考えること",
                    "小さな穴から空を見ること",
                    "針で空を刺すこと"
                ],
                correctAnswerIndex: 1,
                explanation: "『針の穴から天をのぞく』は、狭い視野や知識で物事を判断することを意味します。"
            ),

            QuizQuestion(
                question: "『二階から目薬』の意味はどれですか？",
                choices: [
                    "目薬をさすときのコツ",
                    "効果がないこと",
                    "少しは効き目があること",
                    "やり方が非効率であること"
                ],
                correctAnswerIndex: 3,
                explanation: "『二階から目薬』は、やり方が非効率で効果が薄いことを意味することわざです。"
            ),

            QuizQuestion(
                question: "『覆水盆に返らず』の意味はどれですか？",
                choices: [
                    "一度失ったものは取り戻せないこと",
                    "水を返すことができること",
                    "盆に水を入れること",
                    "失敗したことをやり直すこと"
                ],
                correctAnswerIndex: 1,
                explanation: "『覆水盆に返らず』は、一度失ったものは取り戻せないという意味のことわざです。"
            ),

            QuizQuestion(
                question: "『明日は明日の風が吹く』の意味はどれですか？",
                choices: [
                    "風が強く吹くという予測",
                    "今日と明日は同じであること",
                    "先のことは考えすぎずに、その時に任せること",
                    "風が変われば運も変わること"
                ],
                correctAnswerIndex: 3,
                explanation: "『明日は明日の風が吹く』は、未来のことをあまり心配せず、その時その時で対処すればよいという意味です。"
            ),

            QuizQuestion(
                question: "『光陰矢のごとし』の意味はどれですか？",
                choices: [
                    "時間が早く過ぎ去ること",
                    "光が速いこと",
                    "矢のように飛ぶこと",
                    "暗闇の中で光が輝くこと"
                ],
                correctAnswerIndex: 0,
                explanation: "『光陰矢のごとし』は、時間が速く過ぎ去ることを意味することわざです。"
            ),
 QuizQuestion(
            question: "『彼はメガネをかけた』の『かけた』の漢字はどれですか？",
            choices: [
                "掛けた",
                "駆けた",
                "賭けた",
                "架けた"
            ],
            correctAnswerIndex: 0,
            explanation: "『メガネをかけた』の場合、『掛けた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『手が離せない』の意味はどれですか？",
            choices: [
                "手を怪我する",
                "忙しくて他のことができない",
                "手を洗う",
                "手を使って何かを持っている"
            ],
            correctAnswerIndex: 1,
            explanation: "『手が離せない』は、今していることに集中して他のことができない状態を意味します。"
        ),

        QuizQuestion(
            question: "『彼は書類をまとめた』の『まとめた』の意味はどれですか？",
            choices: [
                "整理した",
                "記入した",
                "混ぜた",
                "分けた"
            ],
            correctAnswerIndex: 0,
            explanation: "『書類をまとめた』は、『整理した』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『顔を出す』の意味はどれですか？",
            choices: [
                "顔を見せる",
                "驚く",
                "表情を作る",
                "逃げる"
            ],
            correctAnswerIndex: 0,
            explanation: "『顔を出す』は、姿を見せることを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『たろうは初めてのテストで高得点を取ったので…』",
            choices: [
                "落ち込んだ",
                "嬉しかった",
                "驚いた",
                "悲しかった"
            ],
            correctAnswerIndex: 1,
            explanation: "文の流れから、たろうは『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼は道をたずねた』の『たずねた』の漢字はどれですか？",
            choices: [
                "訪ねた",
                "尋ねた",
                "調ねた",
                "見ねた"
            ],
            correctAnswerIndex: 1,
            explanation: "『道をたずねた』の場合、『尋ねた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『頭を冷やす』の意味はどれですか？",
            choices: [
                "髪の毛を冷やす",
                "頭が痛くなる",
                "落ち着く",
                "涼しい場所に行く"
            ],
            correctAnswerIndex: 2,
            explanation: "『頭を冷やす』は、冷静になって落ち着くことを意味します。"
        ),

        QuizQuestion(
            question: "『彼は髪をきった』の『きった』の意味はどれですか？",
            choices: [
                "切った",
                "聞いた",
                "着た",
                "貸した"
            ],
            correctAnswerIndex: 0,
            explanation: "『髪をきった』は、『切った』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『花を持たせる』の意味はどれですか？",
            choices: [
                "褒める",
                "責任を負わせる",
                "目立たせる",
                "相手に栄誉を譲る"
            ],
            correctAnswerIndex: 3,
            explanation: "『花を持たせる』は、相手に名誉や栄誉を譲ることを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『ゆうこは友達から手紙をもらって…』",
            choices: [
                "悲しかった",
                "困った",
                "嬉しかった",
                "驚いた"
            ],
            correctAnswerIndex: 2,
            explanation: "文の流れから、ゆうこは『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼は道具をかりた』の『かりた』の漢字はどれですか？",
            choices: [
                "狩りた",
                "借りた",
                "刈りた",
                "駆りた"
            ],
            correctAnswerIndex: 1,
            explanation: "『道具をかりた』の場合、『借りた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『気を配る』の意味はどれですか？",
            choices: [
                "気にしない",
                "注意を払う",
                "疲れ果てる",
                "物を分配する"
            ],
            correctAnswerIndex: 1,
            explanation: "『気を配る』は、注意や配慮をすることを意味します。"
        ),

        QuizQuestion(
            question: "『彼はボールをなげた』の『なげた』の意味はどれですか？",
            choices: [
                "投げた",
                "流れた",
                "泣けた",
                "跳ねた"
            ],
            correctAnswerIndex: 0,
            explanation: "『ボールをなげた』は、『投げた』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『足が棒になる』の意味はどれですか？",
            choices: [
                "足が痩せる",
                "足が動かなくなる",
                "足が疲れて動かない",
                "足が早くなる"
            ],
            correctAnswerIndex: 2,
            explanation: "『足が棒になる』は、足が疲れて動かなくなる状態を意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『たろうはずっと探していた本をようやく見つけたので…』",
            choices: [
                "安心した",
                "驚いた",
                "悲しかった",
                "困った"
            ],
            correctAnswerIndex: 0,
            explanation: "文の流れから、たろうは『安心した』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼は声をあげた』の『あげた』の漢字はどれですか？",
            choices: [
                "上げた",
                "挙げた",
                "揚げた",
                "上った"
            ],
            correctAnswerIndex: 1,
            explanation: "『声をあげた』の場合、『挙げた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『馬が合う』の意味はどれですか？",
            choices: [
                "仲がいい",
                "競争に勝つ",
                "素早い",
                "疲れる"
            ],
            correctAnswerIndex: 0,
            explanation: "『馬が合う』は、気が合って仲が良いことを意味します。"
        ),

        QuizQuestion(
            question: "『彼は鉛筆をけずった』の『けずった』の意味はどれですか？",
            choices: [
                "削った",
                "剃った",
                "切った",
                "割った"
            ],
            correctAnswerIndex: 0,
            explanation: "『鉛筆をけずった』は、『削った』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『心が軽くなる』の意味はどれですか？",
            choices: [
                "気分が良くなる",
                "焦る",
                "驚く",
                "緊張する"
            ],
            correctAnswerIndex: 0,
            explanation: "『心が軽くなる』は、気持ちが楽になることを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『さくらは初めての発表を終えて…』",
            choices: [
                "安心した",
                "焦った",
                "驚いた",
                "困った"
            ],
            correctAnswerIndex: 0,
            explanation: "文の流れから、さくらは『安心した』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は時計をなおした』の『なおした』の漢字はどれですか？",
            choices: [
                "直した",
                "治した",
                "修した",
                "整えた"
            ],
            correctAnswerIndex: 0,
            explanation: "『時計をなおした』の場合、『直した』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『足が出る』の意味はどれですか？",
            choices: [
                "疲れる",
                "歩きすぎる",
                "予算をオーバーする",
                "足を怪我する"
            ],
            correctAnswerIndex: 2,
            explanation: "『足が出る』は、予算やお金が足りなくなることを意味します。"
        ),

        QuizQuestion(
            question: "『彼は紙をおった』の『おった』の意味はどれですか？",
            choices: [
                "終えた",
                "織った",
                "折った",
                "降った"
            ],
            correctAnswerIndex: 2,
            explanation: "『紙をおった』は、『折った』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『手に負えない』の意味はどれですか？",
            choices: [
                "簡単だ",
                "扱えない",
                "壊れやすい",
                "手で持てない"
            ],
            correctAnswerIndex: 1,
            explanation: "『手に負えない』は、自分では扱えないほど困難なことを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『太郎は久しぶりに友達と再会したので…』",
            choices: [
                "悲しかった",
                "驚いた",
                "嬉しかった",
                "困った"
            ],
            correctAnswerIndex: 2,
            explanation: "文の流れから、太郎は『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は部屋をかたづけた』の『かたづけた』の漢字はどれですか？",
            choices: [
                "肩付けた",
                "固付けた",
                "片付けた",
                "堅付けた"
            ],
            correctAnswerIndex: 2,
            explanation: "『部屋をかたづけた』の場合、『片付けた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『耳が早い』の意味はどれですか？",
            choices: [
                "耳がよく聞こえる",
                "噂を早く知る",
                "音楽が好き",
                "走るのが速い"
            ],
            correctAnswerIndex: 1,
            explanation: "『耳が早い』は、噂や情報を素早く知ることを意味します。"
        ),

        QuizQuestion(
            question: "『彼は本をとじた』の『とじた』の意味はどれですか？",
            choices: [
                "閉じた",
                "綴じた",
                "止じた",
                "束ねた"
            ],
            correctAnswerIndex: 0,
            explanation: "『本をとじた』は、『閉じた』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『気が乗らない』の意味はどれですか？",
            choices: [
                "やる気がない",
                "体調が悪い",
                "楽しくない",
                "急いでいる"
            ],
            correctAnswerIndex: 0,
            explanation: "『気が乗らない』は、やる気や興味が湧かないことを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『みほは大好きな本が売り切れていたので…』",
            choices: [
                "嬉しかった",
                "悲しかった",
                "怒っていた",
                "安心した"
            ],
            correctAnswerIndex: 1,
            explanation: "文の流れから、みほは『悲しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は道をきいた』の『きいた』の漢字はどれですか？",
            choices: [
                "聞いた",
                "聴いた",
                "訊いた",
                "伺った"
            ],
            correctAnswerIndex: 2,
            explanation: "『道をきいた』の場合、『訊いた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『足を洗う』の意味はどれですか？",
            choices: [
                "手を洗う",
                "悪事をやめる",
                "足をきれいにする",
                "逃げる"
            ],
            correctAnswerIndex: 1,
            explanation: "『足を洗う』は、悪事や悪い行いをやめるという意味です。"
        ),

        QuizQuestion(
            question: "『彼は釘をうった』の『うった』の意味はどれですか？",
            choices: [
                "討った",
                "打った",
                "売った",
                "撃った"
            ],
            correctAnswerIndex: 1,
            explanation: "『釘をうった』は、『打った』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『水に流す』の意味はどれですか？",
            choices: [
                "水を流す",
                "忘れる",
                "水を使う",
                "川をきれいにする"
            ],
            correctAnswerIndex: 1,
            explanation: "『水に流す』は、過去のことを忘れてしまうという意味です。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『太郎は友達とケンカをしてしまったが、友達から謝られたので…』",
            choices: [
                "嬉しかった",
                "怒っていた",
                "悲しかった",
                "驚いた"
            ],
            correctAnswerIndex: 0,
            explanation: "文の流れから、太郎は『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼は荷物をかたづけた』の『かたづけた』の漢字はどれですか？",
            choices: [
                "肩づけた",
                "固づけた",
                "片づけた",
                "堅づけた"
            ],
            correctAnswerIndex: 2,
            explanation: "『荷物をかたづけた』の場合、『片づけた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『胸がいっぱいになる』の意味はどれですか？",
            choices: [
                "食べ過ぎる",
                "感情があふれる",
                "疲れがたまる",
                "呼吸ができない"
            ],
            correctAnswerIndex: 1,
            explanation: "『胸がいっぱいになる』は、感情があふれて心が満たされることを意味します。"
        ),

        QuizQuestion(
            question: "『彼女は書類をとじた』の『とじた』の意味はどれですか？",
            choices: [
                "閉じた",
                "綴じた",
                "止じた",
                "綴った"
            ],
            correctAnswerIndex: 1,
            explanation: "『書類をとじた』は、『綴じた』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『手が空く』の意味はどれですか？",
            choices: [
                "忙しくなる",
                "手に物を持っている",
                "時間ができる",
                "力が入る"
            ],
            correctAnswerIndex: 2,
            explanation: "『手が空く』は、時間ができて自由になることを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『ゆみは長い間楽しみにしていた旅行に出かけたので…』",
            choices: [
                "不安だった",
                "嬉しかった",
                "驚いた",
                "悲しかった"
            ],
            correctAnswerIndex: 1,
            explanation: "文の流れから、ゆみは『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は手紙をおくった』の『おくった』の漢字はどれですか？",
            choices: [
                "送った",
                "贈った",
                "送り出した",
                "送別した"
            ],
            correctAnswerIndex: 0,
            explanation: "『手紙をおくった』の場合、『送った』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『気が済む』の意味はどれですか？",
            choices: [
                "疲れがとれる",
                "気分が良くなる",
                "満足する",
                "興奮する"
            ],
            correctAnswerIndex: 2,
            explanation: "『気が済む』は、納得して満足することを意味します。"
        ),

        QuizQuestion(
            question: "『彼女はボタンをはずした』の『はずした』の意味はどれですか？",
            choices: [
                "外した",
                "外れた",
                "外す",
                "離れた"
            ],
            correctAnswerIndex: 0,
            explanation: "『ボタンをはずした』は、『外した』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『目に見える』の意味はどれですか？",
            choices: [
                "視力が良い",
                "現実的である",
                "未来が明るい",
                "わかりやすい"
            ],
            correctAnswerIndex: 3,
            explanation: "『目に見える』は、結果や影響がはっきりわかるという意味です。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『たかしは誕生日プレゼントをもらったので…』",
            choices: [
                "寂しかった",
                "嬉しかった",
                "驚いた",
                "落ち込んだ"
            ],
            correctAnswerIndex: 1,
            explanation: "文の流れから、たかしは『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は髪をとかした』の『とかした』の漢字はどれですか？",
            choices: [
                "溶かした",
                "梳かした",
                "解かした",
                "研かした"
            ],
            correctAnswerIndex: 1,
            explanation: "『髪をとかした』の場合、『梳かした』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『水に流す』の意味はどれですか？",
            choices: [
                "何かを捨てる",
                "お金を使う",
                "過去のことを忘れる",
                "川に落ちる"
            ],
            correctAnswerIndex: 2,
            explanation: "『水に流す』は、過去のことを忘れ、問題にしないことを意味します。"
        ),

        QuizQuestion(
            question: "『彼はボールをけった』の『けった』の意味はどれですか？",
            choices: [
                "蹴った",
                "受けた",
                "転がした",
                "触った"
            ],
            correctAnswerIndex: 0,
            explanation: "『ボールをけった』は、『蹴った』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『気を落とす』の意味はどれですか？",
            choices: [
                "元気がなくなる",
                "落ち着く",
                "物を落とす",
                "集中する"
            ],
            correctAnswerIndex: 0,
            explanation: "『気を落とす』は、元気がなくなることを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『ゆうこは試合に負けてしまったので…』",
            choices: [
                "悔しかった",
                "嬉しかった",
                "ほっとした",
                "誇らしかった"
            ],
            correctAnswerIndex: 0,
            explanation: "文の流れから、ゆうこは『悔しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼は机をふいた』の『ふいた』の漢字はどれですか？",
            choices: [
                "吹いた",
                "拭いた",
                "払いた",
                "振いた"
            ],
            correctAnswerIndex: 1,
            explanation: "『机をふいた』の場合、『拭いた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『気が重い』の意味はどれですか？",
            choices: [
                "忙しい",
                "心配だ",
                "楽しい",
                "軽やかだ"
            ],
            correctAnswerIndex: 1,
            explanation: "『気が重い』は、何かを心配している様子を表します。"
        ),

        QuizQuestion(
            question: "『彼は会話をたった』の『たった』の意味はどれですか？",
            choices: [
                "立った",
                "断った",
                "経った",
                "飛んだ"
            ],
            correctAnswerIndex: 1,
            explanation: "『会話をたった』は、『断った』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『猫の手も借りたい』の意味はどれですか？",
            choices: [
                "動物が好きだ",
                "人手不足だ",
                "猫が役立つ",
                "無理なお願いだ"
            ],
            correctAnswerIndex: 1,
            explanation: "『猫の手も借りたい』は、人手が足りなくて誰でも助けて欲しいという意味です。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『佐藤さんは大切な書類をなくしてしまったので…』",
            choices: [
                "うれしかった",
                "ほっとした",
                "焦った",
                "驚いた"
            ],
            correctAnswerIndex: 2,
            explanation: "文の流れから、佐藤さんは『焦った』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼はドアをしめた』の『しめた』の漢字はどれですか？",
            choices: [
                "閉めた",
                "締めた",
                "占めた",
                "染めた"
            ],
            correctAnswerIndex: 1,
            explanation: "『ドアをしめた』の場合、『閉めた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『足をひっぱる』の意味はどれですか？",
            choices: [
                "急ぐ",
                "邪魔をする",
                "助ける",
                "転ぶ"
            ],
            correctAnswerIndex: 1,
            explanation: "『足をひっぱる』は、他人の成功や進展を妨げることを意味します。"
        ),

        QuizQuestion(
            question: "『彼は会話をさけた』の『さけた』の意味はどれですか？",
            choices: [
                "叫んだ",
                "避けた",
                "裂けた",
                "話した"
            ],
            correctAnswerIndex: 1,
            explanation: "『会話をさけた』は、『避けた』が正しい意味です。"
        ),

        QuizQuestion(
            question: "『手がかかる』の意味はどれですか？",
            choices: [
                "時間がかかる",
                "難しい",
                "助けが必要",
                "面倒くさい"
            ],
            correctAnswerIndex: 3,
            explanation: "『手がかかる』は、面倒や世話が多く、簡単ではないことを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『ケンは友達が約束を守らなかったので…』",
            choices: [
                "怒った",
                "悲しかった",
                "驚いた",
                "安心した"
            ],
            correctAnswerIndex: 0,
            explanation: "文の流れから、ケンは『怒った』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は話をきった』の『きった』の漢字はどれですか？",
            choices: [
                "切った",
                "聞いた",
                "切り捨てた",
                "着た"
            ],
            correctAnswerIndex: 2,
            explanation: "『話をきった』の場合、『切った』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『手を焼く』の意味はどれですか？",
            choices: [
                "手を怪我する",
                "助けを求める",
                "対処に困る",
                "料理をする"
            ],
            correctAnswerIndex: 2,
            explanation: "『手を焼く』は、対処に困る、どう扱ってよいか分からない状態を指します。"
        ),

        QuizQuestion(
            question: "『雨があがる』の『あがる』の意味はどれですか？",
            choices: [
                "停止する",
                "昇る",
                "乾燥する",
                "終わる"
            ],
            correctAnswerIndex: 3,
            explanation: "『雨があがる』の『あがる』は、雨が止むという意味です。"
        ),

        QuizQuestion(
            question: "『口が堅い』の意味はどれですか？",
            choices: [
                "口調が厳しい",
                "言葉が荒い",
                "秘密を守る",
                "食べ物を噛む力が強い"
            ],
            correctAnswerIndex: 2,
            explanation: "『口が堅い』は、秘密を守り、人に漏らさないことを意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『太郎は大雨の中、傘を忘れてしまったので…』",
            choices: [
                "うれしかった",
                "残念だった",
                "安心した",
                "驚いた"
            ],
            correctAnswerIndex: 1,
            explanation: "文の流れから、太郎は『残念だった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼は本をとじた』の『とじた』の漢字はどれですか？",
            choices: [
                "閉じた",
                "止じた",
                "戸じた",
                "止めた"
            ],
            correctAnswerIndex: 3,
            explanation: "『本をとじた』の場合、『閉じた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『目をつぶる』の意味はどれですか？",
            choices: [
                "考え込む",
                "許す",
                "眠る",
                "見えなくなる"
            ],
            correctAnswerIndex: 1,
            explanation: "『目をつぶる』は、何かを見逃して許すという意味です。"
        ),

        QuizQuestion(
            question: "『顔が広い』の意味はどれですか？",
            choices: [
                "顔が大きい",
                "友達が多い",
                "外見が良い",
                "笑顔が多い"
            ],
            correctAnswerIndex: 1,
            explanation: "『顔が広い』は、交友関係が広いことを意味します。"
        ),

        QuizQuestion(
            question: "『彼は時間をつぶした』の『つぶした』の意味はどれですか？",
            choices: [
                "時間を無駄にした",
                "時間を短縮した",
                "時間を止めた",
                "時間を使った"
            ],
            correctAnswerIndex: 0,
            explanation: "『時間をつぶした』は、時間を無駄にする、または暇を持て余すことを指します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『ゆかはコンクールで優勝した。自分の努力が報われたので…』",
            choices: [
                "驚いた",
                "感謝した",
                "うれしかった",
                "悔しかった"
            ],
            correctAnswerIndex: 2,
            explanation: "文の流れから、ゆかは『うれしかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は窓をしめた』の『しめた』の漢字はどれですか？",
            choices: [
                "閉めた",
                "締めた",
                "占めた",
                "染めた"
            ],
            correctAnswerIndex: 1,
            explanation: "『窓をしめた』の場合、『閉めた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『気が長い』の意味はどれですか？",
            choices: [
                "我慢強い",
                "疲れやすい",
                "せっかち",
                "優しい"
            ],
            correctAnswerIndex: 0,
            explanation: "『気が長い』は、我慢強く物事を待てることを意味します。"
        ),

        QuizQuestion(
            question: "『彼女は手紙を書いた』の『書いた』の意味はどれですか？",
            choices: [
                "書物を書いた",
                "何かを描いた",
                "文章を作成した",
                "情報を提供した"
            ],
            correctAnswerIndex: 2,
            explanation: "『手紙を書いた』の場合、『文章を作成した』が適切な意味です。"
        ),

        QuizQuestion(
            question: "『頭を抱える』の意味はどれですか？",
            choices: [
                "驚いている",
                "考え込んでいる",
                "楽しんでいる",
                "怒っている"
            ],
            correctAnswerIndex: 1,
            explanation: "『頭を抱える』は、何か問題に対して考え込んでいる様子を意味します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『ゆうじはテストの結果を心配していたが、結果は予想よりも良かったので…』",
            choices: [
                "嬉しかった",
                "驚いた",
                "悲しかった",
                "落ち込んだ"
            ],
            correctAnswerIndex: 0,
            explanation: "文の流れから、ゆうじは『嬉しかった』と考えられます。"
        ),
        QuizQuestion(
            question: "『彼女は服をきた』の『きた』の漢字はどれですか？",
            choices: [
                "着た",
                "来た",
                "切った",
                "木田"
            ],
            correctAnswerIndex: 1,
            explanation: "『服をきた』の場合、『着た』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『彼は絵をかいた』の『かいた』の漢字はどれですか？",
            choices: [
                "開いた",
                "描いた",
                "買いた",
                "書いた"
            ],
            correctAnswerIndex: 3,
            explanation: "『絵をかいた』の場合、『描いた』が正しい漢字です。"
        ),

        QuizQuestion(
            question: "『その意見にどう思う？』の『どう』の意味はどれですか？",
            choices: [
                "どのように",
                "どこで",
                "何が",
                "いつ"
            ],
            correctAnswerIndex: 0,
            explanation: "『どう』は『どのように』の意味です。"
        ),

        QuizQuestion(
            question: "『気が重い』の意味はどれですか？",
            choices: [
                "楽しみである",
                "不安である",
                "気分がいい",
                "頭が痛い"
            ],
            correctAnswerIndex: 1,
            explanation: "『気が重い』は、不安や憂鬱な気持ちを表します。"
        ),

        QuizQuestion(
            question: "次の文を読んで、登場人物がどう感じているか最も適切なものを選びなさい。『太郎は発表の準備を完璧に終えた。だが、結果は思ったほど良くなかったので…』",
            choices: [
                "嬉しかった",
                "驚いた",
                "落ち込んだ",
                "誇らしかった"
            ],
            correctAnswerIndex: 2,
            explanation: "文の流れから、太郎は結果が思ったほど良くなかったので『落ち込んだ』と考えられます。"
        ),
 QuizQuestion(
            question: "『破天荒』の意味はどれですか？",
            choices: [
                "今まで誰も成し遂げなかったことをすること",
                "天気が荒れること",
                "破れたものを直すこと",
                "大きな失敗をすること"
            ],
            correctAnswerIndex: 0,
            explanation: "『破天荒』は、今まで誰も成し遂げたことのないことを成すことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『挑戦』の読みはどれですか？",
            choices: [
                "ちょうせん",
                "ちょうせん",
                "とうせん",
                "ちょうせい"
            ],
            correctAnswerIndex: 0,
            explanation: "『挑戦』の正しい読みは『ちょうせん』です。"
        ),
        QuizQuestion(
            question: "『晴耕雨読』の意味はどれですか？",
            choices: [
                "晴れた日は畑を耕し、雨の日は読書をすること",
                "天気に合わせて行動を変えること",
                "日中は外で活動し、夜は読書をすること",
                "雨の日に仕事を休むこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『晴耕雨読』は、晴れた日は畑を耕し、雨の日は読書をするという、悠々自適な生活を表す言葉です。"
        ),
        QuizQuestion(
            question: "次の漢字『結果』の読みはどれですか？",
            choices: [
                "けっか",
                "けつか",
                "きっか",
                "けいか"
            ],
            correctAnswerIndex: 0,
            explanation: "『結果』の正しい読みは『けっか』です。"
        ),
        QuizQuestion(
            question: "『以心伝心』の意味はどれですか？",
            choices: [
                "言葉にしなくても心が通じ合うこと",
                "心の中で考えていることを伝えること",
                "伝えたいことを言葉で伝えること",
                "心を通して情報を伝えること"
            ],
            correctAnswerIndex: 0,
            explanation: "『以心伝心』は、言葉にしなくてもお互いの心が通じ合うことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『努力』の読みはどれですか？",
            choices: [
                "どりょく",
                "とりょく",
                "どろく",
                "どりゅく"
            ],
            correctAnswerIndex: 0,
            explanation: "『努力』の正しい読みは『どりょく』です。"
        ),
        QuizQuestion(
            question: "『奇想天外』の意味はどれですか？",
            choices: [
                "普通では考えられないほど奇抜なこと",
                "天から奇跡が降りること",
                "想像が天まで届くこと",
                "想像外の出来事が起こること"
            ],
            correctAnswerIndex: 0,
            explanation: "『奇想天外』は、常識では考えられないほど奇抜な発想や行動を意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『説明』の読みはどれですか？",
            choices: [
                "せつめい",
                "せつみょう",
                "せんめい",
                "せつみん"
            ],
            correctAnswerIndex: 0,
            explanation: "『説明』の正しい読みは『せつめい』です。"
        ),
        QuizQuestion(
            question: "『一期一会』の意味はどれですか？",
            choices: [
                "一生に一度しかない出会いを大切にすること",
                "一度出会ったら二度と会わないこと",
                "一期目で勝負を決めること",
                "一度の会話で全てを決めること"
            ],
            correctAnswerIndex: 0,
            explanation: "『一期一会』は、人生の中で一度だけの大切な出会いを意味します。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『朝露に濡れた花が輝いている…』",
            choices: [
                "感動",
                "怒り",
                "焦り",
                "悲しみ"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『感動』が最も適切です。"
        ),
        QuizQuestion(
            question: "『画竜点睛』の意味はどれですか？",
            choices: [
                "最後の重要な仕上げをすること",
                "竜の絵を描くこと",
                "竜が目を開けること",
                "絵に命を吹き込むこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『画竜点睛』は、最後の重要な仕上げをすることで、物事の完成に至ることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『尊敬』の読みはどれですか？",
            choices: [
                "そんけい",
                "そうけい",
                "せんけい",
                "そけい"
            ],
            correctAnswerIndex: 0,
            explanation: "『尊敬』の正しい読みは『そんけい』です。"
        ),
        QuizQuestion(
            question: "『時期尚早』の意味はどれですか？",
            choices: [
                "まだその時期ではないこと",
                "時期を逃してしまったこと",
                "時期がすでに過ぎたこと",
                "すぐに始めるべきこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『時期尚早』は、物事を始めるにはまだ早すぎることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『疑問』の読みはどれですか？",
            choices: [
                "ぎもん",
                "ぎも",
                "きもん",
                "ぎもう"
            ],
            correctAnswerIndex: 0,
            explanation: "『疑問』の正しい読みは『ぎもん』です。"
        ),
        QuizQuestion(
            question: "『温厚篤実』の意味はどれですか？",
            choices: [
                "人柄が穏やかで誠実なこと",
                "温かく実りあること",
                "厚い心を持つこと",
                "実直であること"
            ],
            correctAnswerIndex: 0,
            explanation: "『温厚篤実』は、穏やかで誠実な人柄を表します。"
        ),
        QuizQuestion(
            question: "次の漢字『理想』の読みはどれですか？",
            choices: [
                "りそう",
                "りしょう",
                "りそん",
                "りもん"
            ],
            correctAnswerIndex: 0,
            explanation: "『理想』の正しい読みは『りそう』です。"
        ),
        QuizQuestion(
            question: "『一刀両断』の意味はどれですか？",
            choices: [
                "物事をきっぱりと決断すること",
                "刀を二つに分けること",
                "一つの刀で戦うこと",
                "刀を両手で持つこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『一刀両断』は、物事を素早く決断し、迷わず実行することを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『友情』の読みはどれですか？",
            choices: [
                "ゆうじょう",
                "ゆうそう",
                "ゆうしん",
                "ゆうじょ"
            ],
            correctAnswerIndex: 0,
            explanation: "『友情』の正しい読みは『ゆうじょう』です。"
        ),
        QuizQuestion(
            question: "『電光石火』の意味はどれですか？",
            choices: [
                "非常に素早く行動すること",
                "雷と火が同時に発生すること",
                "石が火を起こすこと",
                "光と石を同時に見ること"
            ],
            correctAnswerIndex: 0,
            explanation: "『電光石火』は、非常に素早い行動や決断を意味します。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『風が吹き抜ける草原を歩くと、心が…』",
            choices: [
                "解放感",
                "不安",
                "焦り",
                "恐怖"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『解放感』が最も適切です。"
        ),
        QuizQuestion(
            question: "『竜頭蛇尾』の意味はどれですか？",
            choices: [
                "始めは勢いがあるが、終わりは振るわないこと",
                "竜と蛇が戦うこと",
                "頭が竜で尾が蛇であること",
                "竜の頭に蛇が乗っていること"
            ],
            correctAnswerIndex: 1,
            explanation: "『竜頭蛇尾』は、物事が始めは勢いがあるが、終わりがだめになることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『希望』の読みはどれですか？",
            choices: [
                "きぼう",
                "きもう",
                "きも",
                "きめい"
            ],
            correctAnswerIndex: 1,
            explanation: "『希望』の正しい読みは『きぼう』です。"
        ),
        QuizQuestion(
            question: "『羊頭狗肉』の意味はどれですか？",
            choices: [
                "表面と実態が異なること",
                "羊と犬の肉を食べること",
                "羊の頭を持った犬のこと",
                "犬が羊に変身すること"
            ],
            correctAnswerIndex: 1,
            explanation: "『羊頭狗肉』は、見かけと中身が違うことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『感激』の読みはどれですか？",
            choices: [
                "かんげき",
                "かんき",
                "かんせい",
                "かんけつ"
            ],
            correctAnswerIndex: 1,
            explanation: "『感激』の正しい読みは『かんげき』です。"
        ),
        QuizQuestion(
            question: "『泰然自若』の意味はどれですか？",
            choices: [
                "どんなことにも動じないこと",
                "自然の中で生活すること",
                "山で修行すること",
                "他人の目を気にしないこと"
            ],
            correctAnswerIndex: 1,
            explanation: "『泰然自若』は、どんな状況でも落ち着いていて動じない様子を意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『挑発』の読みはどれですか？",
            choices: [
                "ちょうはつ",
                "ちょうほつ",
                "とうはつ",
                "ちょうふつ"
            ],
            correctAnswerIndex: 1,
            explanation: "『挑発』の正しい読みは『ちょうはつ』です。"
        ),
        QuizQuestion(
            question: "『疾風迅雷』の意味はどれですか？",
            choices: [
                "非常に速く、激しい勢いで行動すること",
                "風が疾風のように吹くこと",
                "雷が鳴り響くこと",
                "激しい風と雷が同時に起こること"
            ],
            correctAnswerIndex: 1,
            explanation: "『疾風迅雷』は、素早く激しい行動や変化を意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『絶望』の読みはどれですか？",
            choices: [
                "ぜつぼう",
                "せつぼう",
                "せつむ",
                "ぜっむ"
            ],
            correctAnswerIndex: 1,
            explanation: "『絶望』の正しい読みは『ぜつぼう』です。"
        ),
        QuizQuestion(
            question: "『一喜一憂』の意味はどれですか？",
            choices: [
                "喜んだり心配したりすること",
                "喜びと悲しみを同時に感じること",
                "一つの喜びに浸ること",
                "心が一つにまとまること"
            ],
            correctAnswerIndex: 1,
            explanation: "『一喜一憂』は、物事の結果に一喜一憂することを意味します。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『山の頂上から見た景色は、まるで…』",
            choices: [
                "達成感",
                "恐怖",
                "不安",
                "怒り"
            ],
            correctAnswerIndex: 1,
            explanation: "詩の情景から、詩人の感じた気持ちは『達成感』が最も適切です。"
        ),
        QuizQuestion(
            question: "『五里霧中』の意味はどれですか？",
            choices: [
                "五里先が霧で見えないこと",
                "全く見通しが立たないこと",
                "五つの道に迷うこと",
                "霧の中で迷うこと"
            ],
            correctAnswerIndex: 1,
            explanation: "『五里霧中』は、物事の見通しが全く立たないことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『成功』の読みはどれですか？",
            choices: [
                "せいこう",
                "せいか",
                "せんこう",
                "せいきょう"
            ],
            correctAnswerIndex: 1,
            explanation: "『成功』の正しい読みは『せいこう』です。"
        ),
        QuizQuestion(
            question: "『自業自得』の意味はどれですか？",
            choices: [
                "自分で行ったことの報いを自分が受けること",
                "自分で得ることができる業",
                "自分の仕事を他人に任せること",
                "得意なことをして成功すること"
            ],
            correctAnswerIndex: 2,
            explanation: "『自業自得』は、自分の行いの結果が自分に返ってくることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『注意』の読みはどれですか？",
            choices: [
                "ちゅうい",
                "ちょうい",
                "つうい",
                "ちょい"
            ],
            correctAnswerIndex: 1,
            explanation: "『注意』の正しい読みは『ちゅうい』です。"
        ),
        QuizQuestion(
            question: "『後悔先に立たず』の意味はどれですか？",
            choices: [
                "悔やんでも過去には戻れないこと",
                "先のことを後悔すること",
                "悔いがない人生を送ること",
                "後から悔やむことを防ぐこと"
            ],
            correctAnswerIndex: 3,
            explanation: "『後悔先に立たず』は、後悔しても取り返しがつかないことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『困難』の読みはどれですか？",
            choices: [
                "こんなん",
                "こんねん",
                "こなん",
                "こなんい"
            ],
            correctAnswerIndex: 1,
            explanation: "『困難』の正しい読みは『こんなん』です。"
        ),
        QuizQuestion(
            question: "『二束三文』の意味はどれですか？",
            choices: [
                "非常に安い値段で売られていること",
                "二束の商品が三文で売られていること",
                "二つの束で三文の価値があること",
                "二文の束で三つの商品を買えること"
            ],
            correctAnswerIndex: 2,
            explanation: "『二束三文』は、非常に安い値段を意味します。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『静かな夜に、星が瞬く空を見上げると…』",
            choices: [
                "感動",
                "焦り",
                "恐怖",
                "喜び"
            ],
            correctAnswerIndex: 1,
            explanation: "詩の情景から、詩人の感じた気持ちは『感動』が最も適切です。"
        ),
        QuizQuestion(
            question: "『起死回生』の意味はどれですか？",
            choices: [
                "絶望的な状況から立ち直ること",
                "死んだ人を生き返らせること",
                "一度死んでから生まれ変わること",
                "死を覚悟して戦うこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『起死回生』は、絶望的な状況から立ち直ることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『安心』の読みはどれですか？",
            choices: [
                "あんしん",
                "あんじん",
                "あんせい",
                "あんさん"
            ],
            correctAnswerIndex: 1,
            explanation: "『安心』の正しい読みは『あんしん』です。"
        ),
        QuizQuestion(
            question: "『八方美人』の意味はどれですか？",
            choices: [
                "どんな人にも愛想よく接すること",
                "八つの方法で美しくなること",
                "八方向に顔がある人",
                "八つの方向から攻撃を受けること"
            ],
            correctAnswerIndex: 0,
            explanation: "『八方美人』は、どんな人にも愛想よく接しようとすることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『挑戦』の読みはどれですか？",
            choices: [
                "ちょうせん",
                "ちょせん",
                "とうせん",
                "ちょうてん"
            ],
            correctAnswerIndex: 0,
            explanation: "『挑戦』の正しい読みは『ちょうせん』です。"
        ),
        QuizQuestion(
            question: "『天真爛漫』の意味はどれですか？",
            choices: [
                "純粋で明るく無邪気なこと",
                "天空が満ちること",
                "光が輝くこと",
                "無駄に騒ぐこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『天真爛漫』は、純粋で明るく無邪気な様子を表します。"
        ),
        QuizQuestion(
            question: "次の漢字『結果』の読みはどれですか？",
            choices: [
                "けっか",
                "けつか",
                "けっこう",
                "かっけ"
            ],
            correctAnswerIndex: 0,
            explanation: "『結果』の正しい読みは『けっか』です。"
        ),
        QuizQuestion(
            question: "『東奔西走』の意味はどれですか？",
            choices: [
                "あちこち忙しく動き回ること",
                "東西に走り回ること",
                "同じ場所でじっとしていること",
                "東の方向へ走ること"
            ],
            correctAnswerIndex: 0,
            explanation: "『東奔西走』は、あちこち忙しく動き回ることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『感動』の読みはどれですか？",
            choices: [
                "かんどう",
                "かんど",
                "かんとう",
                "かんどく"
            ],
            correctAnswerIndex: 0,
            explanation: "『感動』の正しい読みは『かんどう』です。"
        ),
        QuizQuestion(
            question: "『一進一退』の意味はどれですか？",
            choices: [
                "前進と後退を繰り返すこと",
                "常に前進すること",
                "一歩進んで二歩下がること",
                "一度に二歩進むこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『一進一退』は、前進と後退を繰り返している状態を表します。"
        ),
        QuizQuestion(
            question: "次の漢字『責任』の読みはどれですか？",
            choices: [
                "せきにん",
                "せつにん",
                "せきめん",
                "せつめん"
            ],
            correctAnswerIndex: 0,
            explanation: "『責任』の正しい読みは『せきにん』です。"
        ),
        QuizQuestion(
            question: "『風林火山』の意味はどれですか？",
            choices: [
                "風のように素早く、林のように静かで、火のように激しく、山のように動かないこと",
                "風と林と火と山を象徴すること",
                "四季の移り変わりを表す言葉",
                "山火事が発生したこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『風林火山』は、風のように素早く、林のように静かで、火のように激しく、山のように動かないことを意味します。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『木漏れ日の下で、本を読んでいると…』",
            choices: [
                "落ち着き",
                "焦り",
                "怒り",
                "驚き"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『落ち着き』が最も適切です。"
        ),
        QuizQuestion(
            question: "『臨機応変』の意味はどれですか？",
            choices: [
                "変わった機会を待つこと",
                "状況に応じて柔軟に対応すること",
                "機会を逃さないこと",
                "変化を嫌うこと"
            ],
            correctAnswerIndex: 1,
            explanation: "『臨機応変』は、状況に応じて柔軟に対応することを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『課題』の読みはどれですか？",
            choices: [
                "かだい",
                "けだい",
                "かたい",
                "けたい"
            ],
            correctAnswerIndex: 0,
            explanation: "『課題』の正しい読みは『かだい』です。"
        ),
        QuizQuestion(
            question: "『優柔不断』の意味はどれですか？",
            choices: [
                "素早く決断すること",
                "決断が遅くて迷うこと",
                "優れた決断をすること",
                "判断を保留すること"
            ],
            correctAnswerIndex: 1,
            explanation: "『優柔不断』は、決断が遅く、迷ってしまう状態を指します。"
        ),
        QuizQuestion(
            question: "次の漢字『感謝』の読みはどれですか？",
            choices: [
                "かんさ",
                "かんしゃ",
                "かんじゃ",
                "かんあ"
            ],
            correctAnswerIndex: 1,
            explanation: "『感謝』の正しい読みは『かんしゃ』です。"
        ),
        QuizQuestion(
            question: "『針小棒大』の意味はどれですか？",
            choices: [
                "小さなことを大げさに言うこと",
                "小さな針と大きな棒を比べること",
                "小さいものを大きく育てること",
                "大きなものを小さくすること"
            ],
            correctAnswerIndex: 0,
            explanation: "『針小棒大』は、小さなことを大げさに言いふらすことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『情報』の読みはどれですか？",
            choices: [
                "じょうほう",
                "しょうほう",
                "じょほう",
                "じょうほ"
            ],
            correctAnswerIndex: 0,
            explanation: "『情報』の正しい読みは『じょうほう』です。"
        ),
        QuizQuestion(
            question: "『三日坊主』の意味はどれですか？",
            choices: [
                "物事をすぐにやめてしまうこと",
                "三日ごとに坊主になること",
                "三日間の修行をすること",
                "何事も続けることができること"
            ],
            correctAnswerIndex: 2,
            explanation: "『三日坊主』は、物事が長続きしないことを意味します。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『雨がやんで、虹が空にかかると…』",
            choices: [
                "安心",
                "焦り",
                "恐怖",
                "喜び"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『喜び』が最も適切です。"
        ),
        QuizQuestion(
            question: "『温故知新』の意味はどれですか？",
            choices: [
                "過去を忘れて新しいことを学ぶこと",
                "古いことを学び、新しい知識を得ること",
                "過去と未来を同時に考えること",
                "新しいことだけを学ぶこと"
            ],
            correctAnswerIndex: 1,
            explanation: "『温故知新』は、過去のことを学んで新しい知識や発見を得ることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『状況』の読みはどれですか？",
            choices: [
                "じょうけい",
                "じょうきょう",
                "じょうきん",
                "じょうじょう"
            ],
            correctAnswerIndex: 1,
            explanation: "『状況』の正しい読みは『じょうきょう』です。"
        ),
        QuizQuestion(
            question: "『四面楚歌』の意味はどれですか？",
            choices: [
                "敵に囲まれて孤立すること",
                "四方に友人がいること",
                "歌を四方に広めること",
                "楚国の歌を歌うこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『四面楚歌』は、四方を敵に囲まれて孤立し、助けがない状態を意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『挑戦』の読みはどれですか？",
            choices: [
                "ちょうせん",
                "ちょせん",
                "とうせん",
                "ちょうせい"
            ],
            correctAnswerIndex: 0,
            explanation: "『挑戦』の正しい読みは『ちょうせん』です。"
        ),
        QuizQuestion(
            question: "『馬耳東風』の意味はどれですか？",
            choices: [
                "人の意見を聞き流すこと",
                "馬が風の音を聞くこと",
                "風が東から吹くこと",
                "馬が風に驚くこと"
            ],
            correctAnswerIndex: 2,
            explanation: "『馬耳東風』は、他人の意見や批評をまったく気にせず、聞き流すことを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『機会』の読みはどれですか？",
            choices: [
                "きかい",
                "きか",
                "きっかい",
                "きあい"
            ],
            correctAnswerIndex: 0,
            explanation: "『機会』の正しい読みは『きかい』です。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『青空の下、鳥のさえずりを聞きながら、草原を歩くと…』",
            choices: [
                "開放感",
                "恐怖",
                "怒り",
                "寂しさ"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『開放感』が最も適切です。"
        ),
        QuizQuestion(
            question: "『一網打尽』の意味はどれですか？",
            choices: [
                "一度に多くの物を一気に捕まえること",
                "網を使って一匹の魚を捕まえること",
                "一つの目的を達成すること",
                "網を一度打ち直すこと"
            ],
            correctAnswerIndex: 0,
            explanation: "『一網打尽』は、一度に多くの物や人を一気に捕まえることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『挑発』の読みはどれですか？",
            choices: [
                "ちょうはつ",
                "ちょうばつ",
                "とうはつ",
                "ちょうかつ"
            ],
            correctAnswerIndex: 0,
            explanation: "『挑発』の正しい読みは『ちょうはつ』です。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『雨が降りしきる中、傘もなく歩くと…』",
            choices: [
                "寂しさ",
                "楽しさ",
                "怒り",
                "焦り"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『寂しさ』が最も適切です。"
        ),
        QuizQuestion(
            question: "『一石二鳥』の意味はどれですか？",
            choices: [
                "一つの行動で二つの利益を得る",
                "鳥が二羽いる",
                "石を二つ持つ",
                "鳥を見つける"
            ],
            correctAnswerIndex: 0,
            explanation: "『一石二鳥』は、一つの行動で二つの利益を得ることを意味します。"
        ),
        QuizQuestion(
            question: "次の漢字『責任』の読みはどれですか？",
            choices: [
                "せきにん",
                "せきめい",
                "せつにん",
                "せんにん"
            ],
            correctAnswerIndex: 0,
            explanation: "『責任』の正しい読みは『せきにん』です。"
        ),
        QuizQuestion(
            question: "次の詩を読んで、詩人の気持ちとして最も適切なものはどれですか？『夕日が沈む海辺で、一人佇むと…』",
            choices: [
                "寂しさ",
                "楽しさ",
                "怒り",
                "焦り"
            ],
            correctAnswerIndex: 0,
            explanation: "詩の情景から、詩人の感じた気持ちは『寂しさ』が最も適切です。"
        ),
    ]
    @ObservedObject var viewModel: PositionViewModel
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared
    let monsterName: String
    let backgroundName: String
    
    init(isPresenting: Binding<Bool>,monsterName: String,backgroundName: String, viewModel: PositionViewModel) {  //初期化メソッドに user を追加
        _isPresenting = isPresenting
        self.monsterName = monsterName
        self.backgroundName = backgroundName
        self.viewModel = viewModel
        _shuffledQuizList = State(initialValue: quizBeginnerList.shuffled())
    }
    
    @StateObject var sharedInterstitial = Interstitial()
    var body: some View {
        StoryQuizView(viewModel: viewModel, quizzes: shuffledQuizList, quizLevel: .advanced, monsterName: monsterName, backgroundName: backgroundName, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct StoryKokugoListView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedUser = User(id: "1", userName: "SampleUser", level: 1, experience: 100, avatars: [], userMoney: 1000, userHp: 100, userAttack: 20, userFlag: 0,adminFlag: 1, rankMatchPoint: 100, rank: 1)

        StoryKokugoListView(isPresenting: .constant(false), monsterName: "モンスター1", backgroundName: "背景1", viewModel: PositionViewModel.shared)
    }
}
