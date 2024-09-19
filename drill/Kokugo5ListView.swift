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
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo5, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo5ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo5ListView(isPresenting: .constant(false))
    }
}
