import Foundation

struct CourseQuestionHistory: Codable, Equatable {
    var lastSeenAt: Date
    var correctCount = 0
    var incorrectCount = 0
}

/// Confirmed elementary-school questions. Unknown questions stay in normal review.
enum CourseQuestionIndex {
    static let sources: [(topicID: String, question: CourseQuestion)] = [
        ("addition", CourseQuestion(id: "addition.source1", prompt: "3 + 2 はいくつですか？", choices: ["4", "5", "6", "7"], correctIndex: 1, explanation: "3に2を足すと5になります。")),
        ("addition", CourseQuestion(id: "addition.source2", prompt: "7 - 3 はいくつですか？", choices: ["2", "3", "4", "5"], correctIndex: 2, explanation: "7から3を引くと4になります。")),
        ("multiplication", CourseQuestion(id: "multiplication.source1", prompt: "4 × 3 はいくつですか？", choices: ["9", "12", "16", "18"], correctIndex: 1, explanation: "4 × 3 は 12 です。")),
        ("multiplication", CourseQuestion(id: "multiplication.source2", prompt: "6 × 2 はいくつですか？", choices: ["8", "10", "12", "14"], correctIndex: 2, explanation: "6 × 2 は 12 です。")),
        ("fractions", CourseQuestion(id: "fractions.source1", prompt: "次の中で、2/7より大きい分数はどれですか？", choices: ["1/8", "3/7", "1/9", "1/10"], correctIndex: 1, explanation: "3/7は2/7より大きい分数です。")),
        ("fractions", CourseQuestion(id: "fractions.source2", prompt: "次の中で、3/8より小さい分数はどれですか？", choices: ["4/8", "2/8", "5/8", "6/8"], correctIndex: 1, explanation: "2/8は3/8より小さい分数です。")),
        ("ratio", CourseQuestion(id: "ratio.source1", prompt: "120mの道のうち96mを歩きました。道全体をもとにした、歩いた長さの割合を小数で表すといくつですか？", choices: ["0.2", "0.8", "1.25", "0.75"], correctIndex: 1, explanation: "歩いた長さ96mを、道全体の長さ120mでわります。96 ÷ 120 = 0.8なので、割合は0.8です。")),
        ("ratio", CourseQuestion(id: "ratio.source2", prompt: "120個のうち84個が合格品でした。全体の個数をもとにした合格品の割合を、小数で表すといくつですか？", choices: ["0.84", "1.4", "1.2", "0.7"], correctIndex: 3, explanation: "合格品の個数84を、全体の個数120でわります。84 ÷ 120 = 0.7なので、割合は0.7です。")),
        ("kanji", CourseQuestion(id: "kanji.source1", prompt: "次の漢字の読みはどれですか？\n　　　　　『山』", choices: ["かわ", "もり", "やま", "うみ"], correctIndex: 2, explanation: "『山』の正しい読みは「やま」です。")),
        ("kanji", CourseQuestion(id: "kanji.source2", prompt: "次の漢字の読みはどれですか？\n　　　　　『石』", choices: ["いし", "ほし", "き", "かわ"], correctIndex: 0, explanation: "『石』の正しい読みは「いし」です。")),
        ("grammar", CourseQuestion(id: "grammar.source1", prompt: "【主語と述語】つぎの文の主語はどれでしょう。\n『白い雲が 空に うかんでいます。』", choices: ["空に", "うかんで", "うかんでいます", "白い雲が"], correctIndex: 3, explanation: "この文の主語は『白い雲が』です。")),
        ("grammar", CourseQuestion(id: "grammar.source2", prompt: "【主語と述語】つぎの文の述語はどれでしょう。\n『弟は 毎朝 犬と 走ります。』", choices: ["走ります", "弟は", "毎朝", "犬と"], correctIndex: 0, explanation: "この文の述語は『走ります』です。")),
        ("plants", CourseQuestion(id: "plants.source1", prompt: "植物の根が行う役割はどれですか？", choices: ["酸素を出す", "水を吸い上げる", "花を咲かせる", "光を集める"], correctIndex: 1, explanation: "植物の根は土から水や栄養を吸い上げる役割を持っています。")),
        ("water", CourseQuestion(id: "water.source1", prompt: "少量の温かい水を入れたビーカーにラップをかけ、ラップの上に氷を置くと、ラップの内側に水滴ができました。この水滴について正しい説明はどれですか？", choices: ["氷がラップを通り抜けて落ちた水である", "水から出た水蒸気が冷やされ、再び水になったものである", "ラップが水を新しく作ったものである", "ビーカーの中の空気がすべて水になったものである"], correctIndex: 1, explanation: "正解は『水から出た水蒸気が冷やされ、再び水になったものである』です。温かい水から出た水蒸気が、氷で冷えたラップに触れて水滴になりました。")),
        ("map", CourseQuestion(id: "map.source1", prompt: "実際には長い道路や広い土地を、小さな地図の中に表すために使う考え方はどれですか？", choices: ["縮尺", "気温", "人口", "時刻"], correctIndex: 0, explanation: "正解は「縮尺」です。地図では、実際の長さを一定の割合で小さくして表します。その割合を縮尺といいます。")),
        ("map", CourseQuestion(id: "map.source2", prompt: "市や町の地図で、北がどちらかを確かめるときに見るものはどれですか？", choices: ["方位記号", "縮尺の数字", "道路の太さ", "地図の題名"], correctIndex: 0, explanation: "正解は「方位記号」です。方位記号を見ると、地図の上で北などの方角を確かめることができます。")),
        ("japan", CourseQuestion(id: "japan.source1", prompt: "日本で一番面積が広い都道府県はどこですか？", choices: ["東京都", "北海道", "青森県", "岩手県"], correctIndex: 1, explanation: "北海道は日本で一番面積が広い都道府県です。")),
        ("japan", CourseQuestion(id: "japan.source2", prompt: "日本で一番小さい面積を持つ都道府県はどこですか？", choices: ["香川県", "大阪府", "東京都", "沖縄県"], correctIndex: 0, explanation: "香川県は日本で最も面積が小さい都道府県です。"))
    ]

    static func question(_ id: String) -> CourseQuestion? {
        sources.first { $0.question.id == id }?.question
            ?? WeaknessCourseCatalog.topics.flatMap { $0.practice + $0.checks }.first { $0.id == id }
    }

    static func candidates(topicID: String) -> [CourseQuestion] {
        sources.filter { $0.topicID == topicID }.map(\.question)
    }

    static func source(prompt: String, choices: [String], correctIndex: Int, explanation: String)
        -> (topicID: String, question: CourseQuestion)? {
        guard let source = sources.first(where: {
            $0.question.prompt == prompt && $0.question.choices == choices && $0.question.correctIndex == correctIndex
        }) else { return nil }
        return (source.topicID, CourseQuestion(id: source.question.id, prompt: prompt,
            choices: choices, correctIndex: correctIndex, explanation: explanation))
    }

    static func select(topic: WeaknessCourseTopic, kind: CourseSessionKind,
                       original: CourseQuestion?, history: [String: CourseQuestionHistory]) -> [CourseQuestion] {
        let original = original.flatMap { $0.isValid ? $0 : nil }
        let preferredIDs = Set((kind == .practice ? topic.practice : topic.checks).map(\.id))
        let bank = candidates(topicID: topic.id)
        let bankIDs = Set(bank.map(\.id))
        let pool = (bank + topic.practice + topic.checks).filter { $0.isValid && $0.prompt != original?.prompt }
        let sorted = pool.sorted { left, right in
            let lSeen = history[left.id]?.lastSeenAt ?? .distantPast
            let rSeen = history[right.id]?.lastSeenAt ?? .distantPast
            if lSeen != rSeen { return lSeen < rSeen }
            if bankIDs.contains(left.id) != bankIDs.contains(right.id) { return bankIDs.contains(left.id) }
            if preferredIDs.contains(left.id) != preferredIDs.contains(right.id) { return preferredIDs.contains(left.id) }
            return left.id < right.id
        }
        var questions: [CourseQuestion] = kind == .practice ? original.map { [$0] } ?? [] : []
        let count = kind == .practice ? 3 : 2
        var prompts = Set(questions.map(\.prompt))
        for question in sorted where questions.count < count {
            if prompts.insert(question.prompt).inserted { questions.append(question) }
        }
        return questions
    }
}
