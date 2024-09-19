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
        QuizQuestion(
            question: "『破天荒』の意味はどれですか？",
            choices: [
                "今まで誰も成し遂げなかったことをすること",
                "天気が荒れること",
                "破れたものを直すこと",
                "大きな失敗をすること"
            ],
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 1,
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
            correctAnswerIndex: 2,
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
            correctAnswerIndex: 3,
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
        
    @State private var shuffledQuizList: [QuizQuestion]
    private var authManager = AuthManager()
    private var audioManager = AudioManager.shared

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
        _shuffledQuizList = State(initialValue: quizBeginnerList.shuffled())
    }
    @StateObject var sharedInterstitial = Interstitial()
    var body: some View {
        QuizView(quizzes: shuffledQuizList, quizLevel: .kokugo6, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Kokugo6ListView_Previews: PreviewProvider {
    static var previews: some View {
        Kokugo6ListView(isPresenting: .constant(false))
    }
}
