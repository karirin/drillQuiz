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
            question: "『部長に資料を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "さしあげます",
                "あげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動をへりくだって表現する丁寧語です。"
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
            question: "『先生に本を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "さしあげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 1,
            explanation: "『さしあげます』は、目上の人に物を渡す際に使う敬語です。"
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
            question: "『社長にお話を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "さしあげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動を謙遜して表現する敬語です。"
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
            question: "『お客様にお礼を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "いただきます",
                "さしあげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動をへりくだって表現する敬語です。"
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
            question: "『彼にお礼を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "さしあげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動をへりくだって表現する際に使う丁寧語です。"
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
            question: "『お客様に案内を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "もらいます",
                "いたします",
                "あげます",
                "さしあげます"
            ],
            correctAnswerIndex: 1,
            explanation: "『いたします』は、自分の行動を丁寧に表現する敬語です。"
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
            question: "『部長に報告を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "もらいます",
                "さしあげます",
                "いたします",
                "あげます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動を謙遜して表現する丁寧語です。"
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
            question: "『お客様に案内を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "もらいます",
                "いたします",
                "さしあげます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動を丁寧に表現する敬語です。"
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
            question: "『先生にお願いを＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "さしあげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動をへりくだって表現する丁寧語です。"
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
            question: "『ご家族にお話を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "いただきます",
                "さしあげます",
                "もらいます",
                "いたします"
            ],
            correctAnswerIndex: 3,
            explanation: "『いたします』は、自分の行動をへりくだって表現する際の丁寧語です。"
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
            question: "『先生にプレゼントを＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "さしあげます",
                "あげます",
                "いたします",
                "もらいます"
            ],
            correctAnswerIndex: 0,
            explanation: "『さしあげます』は、目上の人に何かを渡す際に使う適切な敬語です。"
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
            question: "『私はそれを＿＿いたします』の敬語として適切なものはどれですか？",
            choices: [
                "いたします",
                "思います",
                "さしあげます",
                "存じます"
            ],
            correctAnswerIndex: 0,
            explanation: "『いたします』は、自分の行動をへりくだって表現する丁寧語です。"
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
            question: "『お客様にお茶を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "さしあげます",
                "いたします",
                "いただきます"
            ],
            correctAnswerIndex: 1,
            explanation: "『さしあげます』は、目上の人に物を渡す際の丁寧な表現です。"
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
            question: "『先生にお礼を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "さしあげます",
                "いたします",
                "いただきます"
            ],
            correctAnswerIndex: 2,
            explanation: "『いたします』は、自分の行動をへりくだって表現する丁寧語です。"
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
            question: "『お客様にご案内を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "さしあげます",
                "いたします",
                "いただきます",
                "もらいます"
            ],
            correctAnswerIndex: 1,
            explanation: "『いたします』は、自分の行動を謙遜して表現する丁寧語です。"
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
            question: "『私はそれを＿＿と思います』の敬語として適切なものはどれですか？",
            choices: [
                "思います",
                "存じます",
                "考えます",
                "見ます"
            ],
            correctAnswerIndex: 1,
            explanation: "『存じます』は、『思います』の丁寧な表現です。"
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
            question: "『彼に手紙を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "いただきます",
                "さしあげます",
                "あげます",
                "もらいます"
            ],
            correctAnswerIndex: 1,
            explanation: "『さしあげます』は目上の人に物を渡す際に使う敬語です。"
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
            question: "『先生に質問を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "あげます",
                "いたします",
                "いただきます",
                "もらいます"
            ],
            correctAnswerIndex: 1,
            explanation: "『いたします』は、丁寧に自分の行動を表現する敬語です。"
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
            question: "『先生に本を＿＿します』の敬語として適切なものはどれですか？",
            choices: [
                "さしあげます",
                "あげます",
                "もらいます",
                "もらえます"
            ],
            correctAnswerIndex: 0,
            explanation: "敬語では、目上の人に対しては『さしあげます』が正しい表現です。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo4, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo4ListView(isPresenting: .constant(false))
    }
}
