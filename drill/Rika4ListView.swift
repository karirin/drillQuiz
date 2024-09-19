//
//  QuizITTechnologyListView.swift
//  it
//
//  Created by Apple on 2024/03/10.
//

import SwiftUI

struct Rika4ListView: View {
    @Binding var isPresenting: Bool
    
    let quizBeginnerList: [QuizQuestion] = [
        QuizQuestion(
            question: "電気を通さないものはどれですか？",
            choices: [
                "鉄の釘",
                "ゴム",
                "銅線",
                "アルミニウム"
            ],
            correctAnswerIndex: 1,
            explanation: "ゴムは電気を通さない絶縁体です。"
        ),

        QuizQuestion(
            question: "乾電池を使うと何ができますか？",
            choices: [
                "豆電球を光らせる",
                "水を温める",
                "木を燃やす",
                "風を吹かせる"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "磁石が引き寄せないものはどれですか？",
            choices: [
                "アルミ缶",
                "鉄のネジ",
                "クリップ",
                "針金"
            ],
            correctAnswerIndex: 0,
            explanation: "アルミニウムは磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "カエルはどこで生活していますか？",
            choices: [
                "山の上",
                "海",
                "池や川",
                "砂漠"
            ],
            correctAnswerIndex: 2,
            explanation: "カエルは池や川などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "電気を流すと、どれが起こりますか？",
            choices: [
                "豆電球が光る",
                "風が吹く",
                "水が流れる",
                "音が鳴る"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "乾電池が無くなると、何が起こりますか？",
            choices: [
                "豆電球が消える",
                "水が溢れる",
                "音が鳴り始める",
                "風が強くなる"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池が無くなると豆電球が消えます。"
        ),

        QuizQuestion(
            question: "磁石で一番強く引き寄せられる場所はどこですか？",
            choices: [
                "真ん中",
                "端の部分",
                "底",
                "全体"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が一番強く引き寄せられます。"
        ),

        QuizQuestion(
            question: "電気が流れなくなった場合、何が考えられますか？",
            choices: [
                "豆電球が壊れている",
                "電池が切れている",
                "風が止まった",
                "音が鳴り始めた"
            ],
            correctAnswerIndex: 0,
            explanation: "電気が流れない原因として、豆電球が壊れている可能性があります。"
        ),

        QuizQuestion(
            question: "フクロウはどこで生活していますか？",
            choices: [
                "砂漠",
                "森",
                "川",
                "海"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは森や林に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池を使って光らせることができるものはどれですか？",
            choices: [
                "豆電球",
                "木の板",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うと豆電球を光らせることができます。"
        ),
        QuizQuestion(
            question: "電気を通すものはどれですか？",
            choices: [
                "木の棒",
                "鉄の釘",
                "プラスチック",
                "ゴム"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄の釘は電気を通す導体です。"
        ),

        QuizQuestion(
            question: "乾電池を使って何ができますか？",
            choices: [
                "水を凍らせる",
                "豆電球を光らせる",
                "火をつける",
                "風を起こす"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "フクロウが主に見られる場所はどこですか？",
            choices: [
                "砂漠",
                "森",
                "川",
                "海の中"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは森や林でよく見られます。"
        ),

        QuizQuestion(
            question: "磁石が引き寄せるものはどれですか？",
            choices: [
                "紙",
                "ガラス",
                "プラスチック",
                "鉄のネジ"
            ],
            correctAnswerIndex: 3,
            explanation: "鉄のネジは磁石に引き寄せられます。"
        ),

        QuizQuestion(
            question: "乾電池が無くなったとき、何が起こりますか？",
            choices: [
                "豆電球が消える",
                "水が流れる",
                "音が大きくなる",
                "風が強くなる"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池が無くなると、豆電球が消えます。"
        ),

        QuizQuestion(
            question: "電気を使うとどうなりますか？",
            choices: [
                "水が冷たくなる",
                "音が鳴る",
                "豆電球が光る",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "電気を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カエルが主に住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "池や川",
                "山の上",
                "海の底"
            ],
            correctAnswerIndex: 1,
            explanation: "カエルは池や川などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "電気が流れるためには何が必要ですか？",
            choices: [
                "プラスチック",
                "鉄の釘",
                "木の棒",
                "ガラス"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄の釘のような導体が電気を流すために必要です。"
        ),

        QuizQuestion(
            question: "磁石が一番強いのはどこですか？",
            choices: [
                "真ん中",
                "端の部分",
                "全体",
                "底"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が一番強い力を持っています。"
        ),

        QuizQuestion(
            question: "乾電池が使い終わったときにどうなりますか？",
            choices: [
                "豆電球が光る",
                "豆電球が消える",
                "音が出る",
                "風が強くなる"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池が使い終わると、豆電球が消えます。"
        ),
        QuizQuestion(
            question: "磁石が引き寄せる金属はどれですか？",
            choices: [
                "アルミニウム",
                "鉄",
                "銅",
                "プラスチック"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石は鉄などの金属を引き寄せます。"
        ),

        QuizQuestion(
            question: "乾電池を正しく使うと何が起こりますか？",
            choices: [
                "水が流れる",
                "音が鳴る",
                "豆電球が光る",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "乾電池を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "磁石に引き寄せられないものはどれですか？",
            choices: [
                "鉄の釘",
                "コバルト",
                "木の棒",
                "ニッケル"
            ],
            correctAnswerIndex: 2,
            explanation: "木の棒は磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "カエルが主に住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "海の中",
                "池や川",
                "山の上"
            ],
            correctAnswerIndex: 2,
            explanation: "カエルは池や川など、水のある場所に住んでいます。"
        ),

        QuizQuestion(
            question: "フクロウが住む場所はどこですか？",
            choices: [
                "砂漠",
                "川",
                "森",
                "海"
            ],
            correctAnswerIndex: 2,
            explanation: "フクロウは森や林に住んでいます。"
        ),

        QuizQuestion(
            question: "電気が流れるとどうなりますか？",
            choices: [
                "水が温まる",
                "音が鳴る",
                "豆電球が光る",
                "風が吹く"
            ],
            correctAnswerIndex: 2,
            explanation: "電気が流れると豆電球が光ります。"
        ),

        QuizQuestion(
            question: "乾電池が無くなると何が起こりますか？",
            choices: [
                "豆電球が消える",
                "風が止まる",
                "水が止まる",
                "音が消える"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池が無くなると、豆電球が消えます。"
        ),

        QuizQuestion(
            question: "電気を使って光らせることができるものはどれですか？",
            choices: [
                "豆電球",
                "木の板",
                "金属の棒",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "植物がよく育つために必要なものはどれですか？",
            choices: [
                "光",
                "砂",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成をするために光が必要です。"
        ),

        QuizQuestion(
            question: "磁石の力が最も強い場所はどこですか？",
            choices: [
                "真ん中",
                "端",
                "全体",
                "底"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が最も強い磁力を持っています。"
        ),
        QuizQuestion(
            question: "磁石に引き寄せられるものはどれですか？",
            choices: [
                "プラスチック",
                "鉄のくぎ",
                "ガラス",
                "紙"
            ],
            correctAnswerIndex: 1,
            explanation: "鉄のくぎは磁石に引き寄せられます。"
        ),

        QuizQuestion(
            question: "電気を流すとどうなるでしょうか？",
            choices: [
                "豆電球が光る",
                "水が流れる",
                "風が吹く",
                "音が出る"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "磁石で引き寄せられないものはどれですか？",
            choices: [
                "木の棒",
                "鉄のネジ",
                "コバルト",
                "ニッケル"
            ],
            correctAnswerIndex: 0,
            explanation: "木の棒は磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "乾電池を使うと何ができますか？",
            choices: [
                "電線を燃やす",
                "豆電球を光らせる",
                "水を沸かす",
                "風を作る"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと電気が流れて豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カエルが主に生活する場所はどこですか？",
            choices: [
                "砂漠",
                "海",
                "池や川",
                "山の上"
            ],
            correctAnswerIndex: 2,
            explanation: "カエルは池や川など、水のある場所に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池が無くなったときに起こることは何ですか？",
            choices: [
                "音が消える",
                "豆電球が消える",
                "風が止まる",
                "水が溢れる"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池が無くなると、豆電球が消えます。"
        ),

        QuizQuestion(
            question: "フクロウはどこに住んでいますか？",
            choices: [
                "川の中",
                "森",
                "砂漠",
                "山の上"
            ],
            correctAnswerIndex: 1,
            explanation: "フクロウは森や林に住んでいます。"
        ),

        QuizQuestion(
            question: "電気を流すと何が光りますか？",
            choices: [
                "風車",
                "豆電球",
                "スピーカー",
                "コンロ"
            ],
            correctAnswerIndex: 1,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "磁石の一番強い場所はどこですか？",
            choices: [
                "真ん中",
                "端の部分",
                "全体",
                "底"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が最も強く引き寄せます。"
        ),

        QuizQuestion(
            question: "植物が育つために必要な要素はどれですか？",
            choices: [
                "水",
                "砂",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は水がないと育ちません。"
        ),
        QuizQuestion(
            question: "乾電池を使うと動かせるものはどれですか？",
            choices: [
                "電気ストーブ",
                "扇風機",
                "豆電球",
                "自転車"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと扇風機のモーターを動かすことができます。"
        ),

        QuizQuestion(
            question: "金属であり、磁石に引き寄せられないものはどれですか？",
            choices: [
                "鉄",
                "コバルト",
                "アルミニウム",
                "ニッケル"
            ],
            correctAnswerIndex: 2,
            explanation: "アルミニウムは金属ですが、磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "電池を正しく使うとどうなるでしょうか？",
            choices: [
                "水が流れる",
                "豆電球が光る",
                "音が鳴る",
                "風が吹く"
            ],
            correctAnswerIndex: 1,
            explanation: "電池を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カメが主に住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "山の上",
                "池や川",
                "海の中"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは池や川などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池が切れたとき、何が起こりますか？",
            choices: [
                "風が吹く",
                "水が出る",
                "豆電球が消える",
                "音が鳴る"
            ],
            correctAnswerIndex: 2,
            explanation: "乾電池が切れると豆電球は消えます。"
        ),

        QuizQuestion(
            question: "電気を流すと、どれが起こりますか？",
            choices: [
                "植物が育つ",
                "豆電球が光る",
                "水が温まる",
                "風が吹く"
            ],
            correctAnswerIndex: 1,
            explanation: "電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "フクロウはどこでよく見られますか？",
            choices: [
                "砂漠",
                "川の中",
                "森",
                "海の中"
            ],
            correctAnswerIndex: 2,
            explanation: "フクロウは森や林でよく見られます。"
        ),

        QuizQuestion(
            question: "電池を使って光らせることができるものはどれですか？",
            choices: [
                "木の板",
                "豆電球",
                "金属の棒",
                "プラスチック"
            ],
            correctAnswerIndex: 1,
            explanation: "電池を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "磁石が最も強く引き寄せる場所はどこですか？",
            choices: [
                "真ん中",
                "端",
                "全体",
                "どこにも引き寄せられない"
            ],
            correctAnswerIndex: 1,
            explanation: "磁石の端の部分（極）が最も強く引き寄せます。"
        ),

        QuizQuestion(
            question: "電気が流れなくなった場合、何が考えられますか？",
            choices: [
                "豆電球が壊れている",
                "水が足りない",
                "風が止まった",
                "光が弱くなった"
            ],
            correctAnswerIndex: 0,
            explanation: "電気が流れない原因として、豆電球が壊れている可能性があります。"
        ),
        QuizQuestion(
            question: "磁石で引き寄せられる金属はどれですか？",
            choices: [
                "金",
                "銀",
                "鉄",
                "アルミニウム"
            ],
            correctAnswerIndex: 2,
            explanation: "磁石に引き寄せられる金属は鉄などです。"
        ),

        QuizQuestion(
            question: "電気を使って何ができるかを選びなさい。",
            choices: [
                "木を燃やす",
                "豆電球を光らせる",
                "水を凍らせる",
                "風を起こす"
            ],
            correctAnswerIndex: 1,
            explanation: "電気を使うと豆電球を光らせることができます。"
        ),

        QuizQuestion(
            question: "魚がよく住んでいる場所はどこですか？",
            choices: [
                "砂漠",
                "川",
                "山の頂上",
                "草原"
            ],
            correctAnswerIndex: 1,
            explanation: "魚は川や湖、海などの水中に住んでいます。"
        ),

        QuizQuestion(
            question: "乾電池を正しく使うと、どの現象が見られますか？",
            choices: [
                "紙が燃える",
                "風が吹く",
                "豆電球が光る",
                "花が咲く"
            ],
            correctAnswerIndex: 2,
            explanation: "乾電池を使うと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カメはどの場所に住むことが多いですか？",
            choices: [
                "山の上",
                "砂漠",
                "池や川",
                "海の底"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは池や川などの水辺に住むことが多いです。"
        ),

        QuizQuestion(
            question: "電池を使って何ができるか選んでください。",
            choices: [
                "音を鳴らす",
                "火をつける",
                "花を咲かせる",
                "水を沸かす"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うとスピーカーで音を鳴らすことができます。"
        ),

        QuizQuestion(
            question: "植物はどのような場所で育ちやすいですか？",
            choices: [
                "光が当たる場所",
                "暗い場所",
                "寒い場所",
                "砂漠"
            ],
            correctAnswerIndex: 1,
            explanation: "植物は光が当たる場所で育ちやすいです。"
        ),

        QuizQuestion(
            question: "乾電池を使って音を鳴らすために必要なものはどれですか？",
            choices: [
                "豆電球",
                "スピーカー",
                "磁石",
                "水"
            ],
            correctAnswerIndex: 1,
            explanation: "音を鳴らすためにはスピーカーが必要です。"
        ),

        QuizQuestion(
            question: "カタツムリが好んで住む場所はどこですか？",
            choices: [
                "乾いた砂地",
                "湿った草むら",
                "山の上",
                "砂漠"
            ],
            correctAnswerIndex: 1,
            explanation: "カタツムリは湿った場所を好んで住んでいます。"
        ),

        QuizQuestion(
            question: "電池を使って動かせるものはどれですか？",
            choices: [
                "風車",
                "電気ストーブ",
                "豆電球",
                "モーター"
            ],
            correctAnswerIndex: 3,
            explanation: "電池を使うとモーターを動かすことができます。"
        ),
        QuizQuestion(
            question: "磁石が引き寄せないものはどれですか？",
            choices: [
                "アルミ缶",
                "鉄の釘",
                "クリップ",
                "ネジ"
            ],
            correctAnswerIndex: 0,
            explanation: "アルミニウムは磁石に引き寄せられません。"
        ),

        QuizQuestion(
            question: "電気を流すために必要なものはどれですか？",
            choices: [
                "電線",
                "水",
                "紙",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "電気を流すには電線や導電性のある物質が必要です。"
        ),

        QuizQuestion(
            question: "電池を使うと電気が流れて何ができますか？",
            choices: [
                "音が鳴る",
                "風が吹く",
                "豆電球が光る",
                "水が沸く"
            ],
            correctAnswerIndex: 2,
            explanation: "電池で電気を流すと豆電球が光ります。"
        ),

        QuizQuestion(
            question: "フクロウはどこで生活していますか？",
            choices: [
                "森",
                "砂漠",
                "海の中",
                "川の中"
            ],
            correctAnswerIndex: 0,
            explanation: "フクロウは森や林で生活しています。"
        ),

        QuizQuestion(
            question: "植物が育つために必要なものはどれですか？",
            choices: [
                "光",
                "砂",
                "ガラス",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "植物は光合成をするために光が必要です。"
        ),

        QuizQuestion(
            question: "乾電池を使って電気が流れるときに点灯するものはどれですか？",
            choices: [
                "豆電球",
                "風車",
                "スピーカー",
                "電気ストーブ"
            ],
            correctAnswerIndex: 0,
            explanation: "乾電池を使うと電気が流れて豆電球が点灯します。"
        ),

        QuizQuestion(
            question: "磁石のどこに最も強い力がありますか？",
            choices: [
                "端の部分",
                "真ん中の部分",
                "全体",
                "磁石には力がない"
            ],
            correctAnswerIndex: 0,
            explanation: "磁石の端の部分（極）に最も強い磁力があります。"
        ),

        QuizQuestion(
            question: "カメが主に住んでいる場所はどこですか？",
            choices: [
                "海",
                "砂漠",
                "川",
                "森"
            ],
            correctAnswerIndex: 2,
            explanation: "カメは主に川や池などの水辺に住んでいます。"
        ),

        QuizQuestion(
            question: "電気が流れるときに電球が光らない理由はどれですか？",
            choices: [
                "電池が切れている",
                "電線がない",
                "水が足りない",
                "豆電球が壊れている"
            ],
            correctAnswerIndex: 3,
            explanation: "豆電球が壊れていると、電気が流れても光りません。"
        ),

        QuizQuestion(
            question: "バッタが主に見られる場所はどこですか？",
            choices: [
                "草原",
                "海辺",
                "山の頂上",
                "砂漠"
            ],
            correctAnswerIndex: 0,
            explanation: "バッタは草原や草むらに多く見られます。"
        ),
        QuizQuestion(
            question: "磁石に引き寄せられるものはどれですか？",
            choices: [
                "鉄の釘",
                "木の板",
                "紙",
                "プラスチック"
            ],
            correctAnswerIndex: 0,
            explanation: "磁石に引き寄せられるのは鉄やニッケルなどの金属です。"
        ),

        QuizQuestion(
            question: "乾電池を使って電気を流すと何が起こりますか？",
            choices: [
                "水が流れる",
                "豆電球が光る",
                "風が吹く",
                "音が鳴る"
            ],
            correctAnswerIndex: 1,
            explanation: "乾電池を使うと、電気が流れて豆電球が光ります。"
        ),

        QuizQuestion(
            question: "カエルが住んでいる場所はどこですか？",
            choices: [
                "水の中",
                "砂漠",
                "山の上",
                "海の底"
            ],
            correctAnswerIndex: 0,
            explanation: "カエルは水辺や湿った場所に住んでいます。"
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
        QuizView(quizzes: shuffledQuizList, quizLevel: .rika4, authManager: authManager, audioManager: audioManager, isPresenting: $isPresenting, interstitial: sharedInterstitial)
    }
}

struct Rika4ListView_Previews: PreviewProvider {
    static var previews: some View {
        Rika4ListView(isPresenting: .constant(false))
    }
}
