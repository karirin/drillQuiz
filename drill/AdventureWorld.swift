import Foundation

enum AdventureNodeKind: String, Codable {
    case village, road, treasure, monster, camp, shrine, bridge, boss, port

    var title: String {
        switch self {
        case .village: return "拠点"
        case .road: return "探索"
        case .treasure: return "お宝"
        case .monster: return "バトル"
        case .camp: return "休憩"
        case .shrine: return "古代の鍵"
        case .bridge: return "封印の橋"
        case .boss: return "BOSS"
        case .port: return "次の地方"
        }
    }

    var symbol: String {
        switch self {
        case .village: return "house.fill"
        case .road: return "leaf.fill"
        case .treasure: return "shippingbox.fill"
        case .monster: return "leaf.circle.fill"
        case .camp: return "tent.fill"
        case .shrine: return "building.columns.fill"
        case .bridge: return "key.fill"
        case .boss: return "crown.fill"
        case .port: return "sailboat.fill"
        }
    }
}

struct AdventureNode: Identifiable, Hashable {
    let id: Int
    let x: Double
    let y: Double
    let kind: AdventureNodeKind
    let name: String
    let detail: String
    var coins: Int = 0

    var isBattle: Bool { kind == .monster || kind == .boss }
    var enemyHP: Int { kind == .boss ? 90 : 60 }
}

enum AdventureWorld {
    // Separate elementary-school rewards from the IT quiz app's chapter.
    static let chapterID = "elementary-forest-v1"
    static let width: Double = 760
    static let height: Double = 1100
    static let nodes: [AdventureNode] = [
        .init(id: 0, x: 250, y: 925, kind: .village, name: "出発の村", detail: "まっしろな冒険ノートを持って、おともと出発しよう。"),
        .init(id: 1, x: 300, y: 825, kind: .road, name: "森の入口", detail: "葉っぱの道しるべをたどって、小さな発見を集めよう。"),
        .init(id: 2, x: 180, y: 710, kind: .treasure, name: "木陰の宝箱", detail: "木の根元に、金色の宝箱を見つけた。", coins: 80),
        .init(id: 3, x: 420, y: 690, kind: .monster, name: "モススライム", detail: "たからものを数えたい森の仲間。クイズで力くらべ。", coins: 40),
        .init(id: 4, x: 325, y: 555, kind: .camp, name: "旅人の野営地", detail: "焚き火を囲んでひと休み。HPを回復。"),
        .init(id: 5, x: 160, y: 440, kind: .shrine, name: "古い祠", detail: "森の小さな図書室で、ひらめきの鍵を見つけよう。"),
        .init(id: 6, x: 470, y: 445, kind: .monster, name: "リーフガード", detail: "森の奥へ進む道を守っている。", coins: 60),
        .init(id: 7, x: 525, y: 325, kind: .treasure, name: "旅人の宝箱", detail: "寄り道の先に、特別なお宝がありそう。", coins: 150),
        .init(id: 8, x: 340, y: 315, kind: .bridge, name: "封印の橋", detail: "古い祠の鍵で、封印された道をひらく。"),
        .init(id: 9, x: 285, y: 165, kind: .boss, name: "森の主", detail: "ノートが書けなくなった森の主と、いっしょに考えよう。", coins: 200),
        .init(id: 10, x: 455, y: 55, kind: .port, name: "潮風の港町", detail: "森を抜けた先に、新しい冒険が待っている。")
    ]
    static let edges: [(Int, Int)] = [(0, 1), (1, 2), (1, 3), (2, 4), (3, 4), (4, 5), (4, 6), (5, 8), (6, 7), (7, 8), (8, 9), (9, 10)]

    static func node(_ id: Int) -> AdventureNode? { nodes.first { $0.id == id } }
    static func neighbors(of id: Int) -> [Int] {
        edges.compactMap { a, b in a == id ? b : b == id ? a : nil }
    }

    static func rewardKey(for id: Int) -> String { "story-adventure.\(chapterID).node-\(id)" }
}

struct AdventureQuestion: Codable, Equatable, Identifiable {
    let id: String
    let question: String
    let choices: [String]
    let correctAnswerIndex: Int
    let explanation: String

    var isValid: Bool {
        !id.isEmpty && !question.isEmpty && choices.count >= 2 && choices.indices.contains(correctAnswerIndex)
    }
}

enum AdventureCourse: String, Codable, CaseIterable, Identifiable {
    case sansu, kokugo, shakai, rika
    var id: String { rawValue }
    var title: String {
        switch self {
        case .sansu: return "算数"
        case .kokugo: return "国語"
        case .shakai: return "社会"
        case .rika: return "理科"
        }
    }
}
