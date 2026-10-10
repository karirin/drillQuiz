import Foundation

/// Stable scene identifiers connect the adapted elementary-school story to map progress.
enum AdventureStoryScene: String, Codable, CaseIterable, Identifiable {
    case departure
    case entrance
    case firstEncounter
    case shrine
    case keyAcquired
    case bridge
    case guardian
    case guardianVictory
    case port
    case villageReturn

    var id: String { rawValue }
    static var journalScenes: [Self] { allCases }
    var number: Int { (Self.journalScenes.firstIndex(of: self) ?? 0) + 1 }

    var title: String {
        switch self {
        case .departure: return "まっしろな冒険ノート"
        case .entrance: return "葉っぱの道しるべ"
        case .firstEncounter: return "スライムのたからもの"
        case .shrine: return "森の図書室"
        case .keyAcquired: return "「わかった！」の鍵"
        case .bridge: return "ことばをつなぐ橋"
        case .guardian: return "まちがえても、だいじょうぶ"
        case .guardianVictory: return "いっしょに書く、つづき"
        case .port: return "海からの招待状"
        case .villageReturn: return "ただいまの発表会"
        }
    }

    var nodeID: Int {
        switch self {
        case .departure, .villageReturn: return 0
        case .entrance: return 1
        case .firstEncounter: return 3
        case .shrine, .keyAcquired: return 5
        case .bridge: return 8
        case .guardian, .guardianVictory: return 9
        case .port: return 10
        }
    }

    var location: String {
        switch self {
        case .departure: return "出発の村・青空教室"
        case .villageReturn: return "出発の村"
        case .keyAcquired: return "古い祠"
        case .guardianVictory: return "森の大樹"
        default: return AdventureWorld.node(nodeID)?.name ?? "まなびの森"
        }
    }

    var artwork: String {
        switch self {
        case .departure, .villageReturn: return "StorySpriteVillage"
        case .entrance: return "StorySpriteForestEntrance"
        case .firstEncounter: return "StorySpriteMossSlime"
        case .shrine, .keyAcquired: return "StorySpriteShrine"
        case .bridge: return "StorySpriteBridge"
        case .guardian, .guardianVictory: return "StorySpriteForestGuardian"
        case .port: return "StorySpritePort"
        }
    }

    var destinationTitle: String {
        switch self {
        case .departure: return "森へ出発する"
        case .entrance: return "森を探索する"
        case .firstEncounter: return "クイズに挑戦する"
        case .shrine: return "祠の鍵を調べる"
        case .keyAcquired: return "鍵を持って進む"
        case .bridge: return "橋の向こうへ"
        case .guardian: return "いっしょに考える"
        case .guardianVictory: return "新しいページを開く"
        case .port: return "第1章を終える"
        case .villageReturn: return "冒険へ戻る"
        }
    }

    /// True once the player has physically reached this point. This also lets
    /// existing saves read scenes that happened before dialogue was installed.
    func wasReached(in progress: AdventureProgress) -> Bool {
        switch self {
        case .departure:
            return progress.currentNodeID != 0 || progress.clearedNodeIDs.count > 1 || progress.hasKey || progress.hasForestLight
        case .entrance:
            return progress.currentNodeID == 1 || progress.clearedNodeIDs.contains(1)
        case .firstEncounter:
            return progress.currentNodeID == 3 || progress.clearedNodeIDs.contains(3)
        case .shrine:
            return progress.currentNodeID == 5 || progress.clearedNodeIDs.contains(5)
        case .keyAcquired:
            return progress.hasKey
        case .bridge:
            return progress.currentNodeID == 8 || progress.clearedNodeIDs.contains(8)
        case .guardian:
            return progress.currentNodeID == 9 || progress.clearedNodeIDs.contains(9)
        case .guardianVictory:
            return progress.clearedNodeIDs.contains(9)
        case .port:
            return progress.currentNodeID == 10 || progress.clearedNodeIDs.contains(10)
        case .villageReturn:
            return progress.hasForestLight && progress.currentNodeID == 0
        }
    }

    func isUnlocked(in progress: AdventureProgress) -> Bool {
        self == .departure || progress.story?.completed.contains(self) == true || wasReached(in: progress)
    }

    static func arriving(at nodeID: Int) -> Self? {
        switch nodeID {
        case 1: return .entrance
        case 3: return .firstEncounter
        case 5: return .shrine
        case 8: return .bridge
        case 9: return .guardian
        case 10: return .port
        default: return nil
        }
    }

    var lines: [AdventureStoryLine] {
        switch self {
        case .departure:
            return [
                .init(.narrator, "青空教室に集まった朝。先生が広げた「冒険ノート」は、どのページもまっしろでした。"),
                .init(.character("先生"), "森のみんなと書いた、だいじなノートなの。木の名前も、港への地図も、消えてしまったのよ。"),
                .init(.companion, "あれ？　さいごのページに、小さな葉っぱがはさまってる！"),
                .init(.voice("葉っぱの手紙"), "「つづきが書けなくなりました。森の大きな木で、まっています。」"),
                .init(.character("先生"), "森の主からの手紙ね。どうして書けなくなったのか、会いにいってくれる？"),
                .init(.companion, "うん！　数えたり、読んだり、調べたり。学校で見つけた「わかった！」を、届けよう。"),
                .init(.character("先生"), "まちがえたことも、だいじな発見よ。あせらず、ひとつずつ進んでね。"),
                .init(.companion, "ノートはぼくが持つね。きみとなら、すてきなつづきが書けそう！")
            ]
        case .entrance:
            return [
                .init(.narrator, "森の入口には、形のちがう葉っぱがならんでいました。丸い葉っぱ、とがった葉っぱ、ハートの葉っぱ。"),
                .init(.companion, "よく見ると、同じ葉っぱが道の先までならんでる。森の道しるべだ！"),
                .init(.narrator, "見つけた葉っぱをノートにはさむと、白いページに、うす緑の線があらわれました。"),
                .init(.companion, "見つけたことを書くと、ページがもどるんだね。小さな発見でも、ちゃんと力になるんだ。"),
                .init(.companion, "木のかげには宝箱。右の道には、だれかいるみたい。行きたい場所を地図で選んでみよう！")
            ]
        case .firstEncounter:
            return [
                .init(.character("モススライム"), "ねえ、ぼくのたからもの、一緒に数えてくれる？"),
                .init(.narrator, "モススライムの前には、どんぐりや小石がごろごろ。数えるたびに、ころがってしまいます。"),
                .init(.companion, "同じなかまごとに分けてみよう。そうすれば、わかりやすくなるよ。"),
                .init(.character("モススライム"), "なるほど！　森の主にも教えたいな。でも最近、ずっとひとりで考えこんでるんだ。"),
                .init(.companion, "ぼくら、森の主に会いにいくところなんだ。きみの発見も届けるね。"),
                .init(.character("モススライム"), "じゃあ、その前にクイズで力くらべ！　わからなくても、一緒に答えを見つけよう。"),
                .init(.companion, "教科を選んで挑戦しよう。答えたあとは、解説も読んでみてね。")
            ]
        case .shrine:
            return [
                .init(.narrator, "古いほこらは、森の小さな図書室でした。石の本だなに、一冊だけ開かない本があります。"),
                .init(.voice("本の表紙"), "「森の主の、はじめてノート」"),
                .init(.companion, "「はじめて」って書いてある。森の主にも、わからないことがあったんだね。"),
                .init(.narrator, "となりの石板には、木の実を数える絵、ことばのメモ、葉っぱの観察、村の地図がほられていました。"),
                .init(.companion, "算数、国語、理科、社会。みんな、森のくらしにつながってる！"),
                .init(.voice("石板のことば"), "「答えを知るだけでなく、どうしてだろうと考えよう。その発見が、次の道をひらく。」"),
                .init(.narrator, "石板の下で、小さな鍵がきらりと光りました。")
            ]
        case .keyAcquired:
            return [
                .init(.narrator, "鍵を受け取ると、ノートに橋の絵がもどりました。"),
                .init(.companion, "森の奥へ渡る橋だ！　この鍵で、通れるようになるんだね。"),
                .init(.voice("鍵のもよう"), "「わかった！を、だれかとわけあおう。」"),
                .init(.companion, "ひとりで全部わからなくても、力を合わせればいいんだ。森の主にも伝えよう！")
            ]
        case .bridge:
            return [
                .init(.narrator, "橋の入口には、ところどころ文字の消えた案内板が立っていました。"),
                .init(.companion, "「ゆっくり」「いっしょに」「わたろう」。読めることばをつなぐと、道がわかるね。"),
                .init(.narrator, "鍵を差しこむと、橋の上に小さな光がならびました。向こう岸まで、やさしく照らしています。"),
                .init(.voice("森の主の声"), "だめだよ。この先のノートは、まだできていないんだ。"),
                .init(.companion, "できていなくても会いたいよ。一緒につづきを考えよう！"),
                .init(.narrator, "風がやみました。大きな木の向こうから、ページをめくる音が聞こえます。")
            ]
        case .guardian:
            return [
                .init(.narrator, "大きな木の下で、森の主がノートを抱えていました。足もとには、消しゴムのかすがいっぱい。"),
                .init(.character("森の主"), "みんなのために、まちがいのないノートを作りたかったんだ。でも、何度書いても、まちがえてしまって。"),
                .init(.companion, "それで、ぜんぶ消してしまったの？"),
                .init(.character("森の主"), "うん……。まちがえたページを見られるのが、はずかしかったんだ。"),
                .init(.companion, "ぼくらも、わからないことがいっぱいあるよ。でも、解説を読んだり、もう一度考えたりすればいいんだ。"),
                .init(.character("森の主"), "まちがえても、つづきを書いていいの？"),
                .init(.companion, "もちろん！　いっしょにクイズをやってみよう。正解までの考え方も、ノートに残そう。"),
                .init(.narrator, "森の主が、そっとえんぴつを持ちました。最後の力くらべが始まります。")
            ]
        case .guardianVictory:
            return [
                .init(.narrator, "最後の答えがわかると、ノートにたくさんの色がもどりました。消したあとの線も、きらきら光っています。"),
                .init(.character("森の主"), "できた……！　ひとりじゃわからなかったところも、一緒なら見つけられたね。"),
                .init(.companion, "まちがえたところにも、「どうしてかな？」ってメモをつけておこう。次に考えるヒントになるよ。"),
                .init(.character("森の主"), "そっか。これは、正解だけを集める本じゃない。ぼくらの発見を集めるノートなんだ。"),
                .init(.narrator, "森の主は、さいしょのページに大きな文字で書きました。"),
                .init(.voice("冒険ノート"), "「まちがえても、だいじょうぶ。わからないことから、冒険が始まる。」"),
                .init(.companion, "すてきな一ページだね！　あれ、港への地図も、もどってるよ。"),
                .init(.character("森の主"), "ありがとう。海にも、まだ知らないことがいっぱいあるよ。いってらっしゃい！")
            ]
        case .port:
            return [
                .init(.narrator, "森をぬけると、青い海が広がっていました。港のポストから、貝がらの手紙が顔を出しています。"),
                .init(.character("港の案内人"), "森のノートを直してくれたのは、きみたちだね。島の学校から、手紙が届いているよ。"),
                .init(.voice("島からの手紙"), "「海の生きもの、星の動き、船の行き先。調べたいことがいっぱいです。いつか一緒に、見つけにきてね。」"),
                .init(.companion, "まだまだ書けるね、ぼくらの冒険ノート！"),
                .init(.narrator, "潮風が、まっしろな次のページをめくりました。今度の白いページは、少しもさびしくありません。"),
                .init(.companion, "まずは村のみんなに、今日の発見を話そう。どの話から始めようかな。"),
                .init(.narrator, "第1章「まっしろな冒険ノート」おしまい。森の寄り道や、物語の読み返しは、いつでも楽しめます。")
            ]
        case .villageReturn:
            return [
                .init(.character("先生"), "おかえり！　ノートに、たくさんの色がもどったのね。"),
                .init(.companion, "葉っぱの道しるべも、スライムのたからものも、ぜんぶ話したい！"),
                .init(.character("先生"), "いちばん心に残った発見は、何だった？"),
                .init(.companion, "まちがえても、そこでおしまいじゃないってこと。考えなおせば、つづきが書けるんだ。"),
                .init(.narrator, "青空教室に、みんなの笑い声が広がりました。ノートには、まだまだたくさんの空きページ。"),
                .init(.companion, "今日の「わかった！」をひとつずつ。これからも、一緒に増やしていこうね！")
            ]
        }
    }
}

enum AdventureStorySpeaker {
    case narrator, companion, voice(String), character(String)

    func name(companion: String) -> String {
        switch self {
        case .narrator: return "ものがたり"
        case .companion: return companion
        case .voice(let name), .character(let name): return name
        }
    }

    var isCompanion: Bool { if case .companion = self { return true }; return false }
    var isCharacter: Bool { if case .character = self { return true }; return false }
}

struct AdventureStoryLine {
    let speaker: AdventureStorySpeaker
    let text: String
    init(_ speaker: AdventureStorySpeaker, _ text: String) { self.speaker = speaker; self.text = text }
}

struct AdventureStoryBookmark: Codable, Equatable {
    let scene: AdventureStoryScene
    var page: Int = 0
    var isValid: Bool { scene.lines.indices.contains(page) }
}

struct AdventureStoryProgress: Codable, Equatable {
    var completed: Set<AdventureStoryScene> = []
    var bookmark: AdventureStoryBookmark?
}

struct AdventureStoryPlayback: Identifiable {
    var bookmark: AdventureStoryBookmark
    let isReplay: Bool
    var id: String { bookmark.scene.id }
}
