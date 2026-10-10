import SwiftUI

struct AdventureEventSheet: View {
    @ObservedObject var store: AdventureStore
    let initialPresentation: AdventurePresentation
    var coinBalance = 0
    var avatarName = "defaultIcon"
    var onMapAction: (AdventureMapCommand.Action) -> Void = { _ in }
    @Environment(\.dismiss) private var dismiss

    private var route: AdventurePresentation { store.presentation ?? initialPresentation }

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 17) { content }
                        .padding(.horizontal, 24).padding(.top, 10).padding(.bottom, 28)
                        .frame(maxWidth: 520).frame(maxWidth: .infinity)
                }
                .onChange(of: store.progress.battle?.selectedAnswer) { answer in
                    if answer != nil { withAnimation { proxy.scrollTo("adventure.feedback", anchor: .bottom) } }
                }
            }
            .foregroundColor(AdventurePalette.ink)
            .background(AdventurePalette.paper.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(route.id == "battle" ? "中断" : "閉じる") { close() }
                        .foregroundColor(AdventurePalette.muted).accessibilityIdentifier("adventure.event.close")
                }
            }
        }
    }

    @ViewBuilder private var content: some View {
        switch route {
        case .battle: battleContent
        case .world: worldContent
        case .inventory: inventoryContent
        case .menu: menuContent
        case .journal: journalContent
        case .defeat:
            eventHero("TRY AGAIN", title: "少し休んで、もう一度。", kind: .camp)
            message("手に入れた宝と、開いた道はそのまま。\nHPを回復して、また挑戦しよう。")
            rewardBox("HPが全回復した！　100 / 100")
            AdventurePrimaryButton("冒険をつづける") { close() }
        case .treasure(let id):
            eventHero("TREASURE FOUND", title: "宝箱を見つけた！", kind: .treasure)
            message(id == 7 ? "旅人が残した、古い宝箱。\n中には何が入っているだろう？" : "木の根元に、小さな宝箱。\n少し寄り道して正解だった。")
            AdventurePrimaryButton("宝箱を開ける", symbol: "sparkles") { store.openTreasure() }
                .accessibilityIdentifier("adventure.treasure.open")
        case .reward(let id):
            eventHero("A LITTLE DISCOVERY", title: id == 7 ? "旅人の帽子を手に入れた！" : "お宝を手に入れた！", kind: .treasure, completed: true)
            rewardBox(id == 7 ? "150 コイン\n旅人の帽子 × 1" : "80 コイン\n冒険用の回復薬 × 1")
            message("コインはホームでも使えます。\n回復薬と帽子は、この冒険のもちものです。")
            AdventurePrimaryButton("冒険をつづける", symbol: "checkmark") { close() }
        case .victory(let id):
            eventHero(id == 9 ? "THE LIGHT RETURNS" : "VICTORY", title: id == 9 ? "ノートに、色がもどった！" : "道を切りひらいた！", kind: id == 9 ? .shrine : .treasure, completed: true)
            message(id == 9 ? "みんなの発見で、冒険ノートがよみがえった。\n港町へ続く道が、見えるようになった。" : "学んだことが、冒険の力になった。\nこの先には、何が待っているだろう。")
            rewardBox("\(AdventureWorld.node(id)?.coins ?? 0) コイン獲得\(id == 9 ? "\n冒険ノートを取り戻した！" : "")")
            AdventurePrimaryButton(id == 9 ? "港町を目指そう" : "冒険をつづける") { close() }
        case .encounter(let id): encounterContent(AdventureWorld.node(id) ?? AdventureWorld.nodes[0])
        }
    }

    private var menuContent: some View {
        VStack(alignment: .leading, spacing: 22) {
            Text("冒険メニュー").font(.system(size: 25, weight: .bold, design: .serif))
            VStack(alignment: .leading, spacing: 9) {
                Text("第1章 · クエスト").font(.system(size: 11, weight: .semibold)).foregroundColor(AdventurePalette.muted)
                Text(store.progress.hasForestLight ? "冒険ノートがもどった！" : "ノートのつづきを見つけよう")
                    .font(.system(size: 18, weight: .bold))
                Text(store.progress.hasForestLight ? "開かれた道を進んで、潮風の港町へ" : "森の主と考えて、港町への道をひらく")
                    .font(.system(size: 13)).foregroundColor(AdventurePalette.muted)
                Text("探索済み \(store.progress.clearedNodeIDs.count) / \(AdventureWorld.nodes.count)")
                    .font(.system(size: 12, weight: .semibold)).monospacedDigit()
            }
            .frame(maxWidth: .infinity, alignment: .leading).padding(18)
            .background(AdventurePalette.line.opacity(0.4), in: RoundedRectangle(cornerRadius: 16))

            HStack(spacing: 12) {
                Image(avatarName).resizable().scaledToFit().frame(width: 38, height: 42)
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(store.progress.course.title)の冒険者").font(.system(size: 12, weight: .semibold))
                    HStack {
                        Text("HP \(store.progress.hp) / 100")
                        Spacer()
                        Label(coinBalance.formatted(), systemImage: "circle.fill")
                            .accessibilityLabel("所持コイン \(coinBalance)")
                    }
                    .font(.system(size: 12)).monospacedDigit().foregroundColor(AdventurePalette.muted)
                    AdventureHPBar(value: store.progress.hp, maximum: 100)
                }
            }

            VStack(spacing: 8) {
                menuRow("冒険ノート", symbol: "book.closed", id: "adventure.journal") { store.presentation = .journal }
                menuRow("もちもの", symbol: "backpack", id: "adventure.inventory") { store.presentation = .inventory }
                menuRow("世界地図", symbol: "globe.asia.australia", id: "adventure.world") { store.presentation = .world }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("地図の操作").font(.system(size: 13, weight: .semibold))
                HStack(spacing: 8) {
                    mapMenuButton("縮小", symbol: "minus", action: .zoomOut, id: "adventure.map.zoomOut")
                    mapMenuButton("拡大", symbol: "plus", action: .zoomIn, id: "adventure.map.zoomIn")
                    mapMenuButton("全体", symbol: "arrow.up.left.and.arrow.down.right", action: .overview, id: "adventure.map.overview")
                    mapMenuButton("現在地", symbol: "location.fill", action: .locate, id: "adventure.map.locate")
                }
                Text("地図を指で広げて拡大、ドラッグで移動できます。")
                    .font(.system(size: 11)).foregroundColor(AdventurePalette.muted)
            }
            if !store.isPreview && !store.progress.pendingRewardIDs.isEmpty {
                Button { store.syncRewards() } label: {
                    Label(store.isDeliveringRewards ? "コイン報酬を受取中…" : "保管中のコイン報酬を受け取る", systemImage: "tray.and.arrow.down")
                        .font(.system(size: 13)).frame(minHeight: 44)
                }
                .disabled(store.isDeliveringRewards).accessibilityIdentifier("adventure.claimRewards")
            }
        }
        .padding(.top, 4)
    }

    private func menuRow(_ title: String, symbol: String, id: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: symbol).frame(width: 24)
                Text(title).fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 11, weight: .semibold)).foregroundColor(AdventurePalette.muted)
            }
            .font(.system(size: 15)).padding(16)
            .background(AdventurePalette.line.opacity(0.4), in: RoundedRectangle(cornerRadius: 13))
        }
        .buttonStyle(.plain).disabled(store.isMoving).accessibilityIdentifier(id)
    }

    private var journalContent: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("冒険ノート").font(.system(size: 28, weight: .bold, design: .serif))
            Text("第1章 · まっしろな冒険ノート").font(.subheadline).foregroundColor(AdventurePalette.muted)
            Text("おともとたどった物語を、もう一度。\n新しい場面は、冒険を進めると開きます。")
                .font(.subheadline).lineSpacing(4).foregroundColor(AdventurePalette.muted)
            ForEach(AdventureStoryScene.journalScenes) { scene in
                let unlocked = scene.isUnlocked(in: store.progress)
                Button { store.replayStory(scene) } label: {
                    HStack(spacing: 14) {
                        Text(String(format: "%02d", scene.number))
                            .font(.system(size: 23, weight: .medium, design: .serif))
                            .foregroundColor(AdventurePalette.muted).frame(width: 34)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(unlocked ? scene.title : "これからの物語").font(.headline)
                            Text(unlocked ? scene.location : "冒険を進めると開放")
                                .font(.caption).foregroundColor(AdventurePalette.muted)
                        }
                        Spacer(minLength: 4)
                        Image(systemName: unlocked ? "play.circle" : "lock.fill")
                            .font(.system(size: 21)).foregroundColor(AdventurePalette.leaf)
                    }
                    .padding(16).frame(maxWidth: .infinity, alignment: .leading)
                    .background(AdventurePalette.line.opacity(0.4), in: RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain).disabled(!unlocked || store.progress.battle != nil)
                .accessibilityIdentifier("adventure.story.replay.\(scene.id)")
            }
            if store.progress.battle != nil {
                Text("会話は戦闘が終わってから読み返せます。")
                    .font(.footnote).foregroundColor(AdventurePalette.muted)
            }
        }
    }

    private func mapMenuButton(_ title: String, symbol: String, action: AdventureMapCommand.Action, id: String) -> some View {
        Button {
            onMapAction(action)
            close()
        } label: {
            VStack(spacing: 7) {
                Image(systemName: symbol).font(.system(size: 17, weight: .semibold))
                Text(title).font(.system(size: 11, weight: .semibold))
            }
            .frame(maxWidth: .infinity, minHeight: 64)
            .background(AdventurePalette.line.opacity(0.4), in: RoundedRectangle(cornerRadius: 13))
        }
        .buttonStyle(.plain).disabled(store.isMoving).accessibilityIdentifier(id)
    }

    @ViewBuilder private func encounterContent(_ node: AdventureNode) -> some View {
        switch node.kind {
        case .monster, .boss:
            eventHero(node.kind == .boss ? "GUARDIAN OF THE FOREST" : "MONSTER ENCOUNTER", title: "\(node.name)が現れた！", kind: node.kind, nodeID: node.id)
            message(node.kind == .boss ? "「まちがえても、だいじょうぶ。」\n3回正解して、森の主とノートのつづきを書こう。" : "正解すると相手のHPが減り、まちがえると自分のHPが減るよ。\n2回正解して、新しい発見を届けよう。")
            rewardBox("勝利報酬　\(node.coins) コイン")
            coursePicker
            AdventurePrimaryButton("クイズに挑戦する", symbol: "bolt.shield.fill") { store.startBattle() }
                .accessibilityIdentifier("adventure.battle.start")
            Button("いったん引き返す") { store.retreat(); dismiss() }.foregroundColor(AdventurePalette.muted)
        case .camp:
            eventHero("A MOMENT OF REST", title: "焚き火でひと休み。", kind: .camp)
            message("「北の橋を渡るには、古い祠の鍵がいる」\n旅人が、道の先を教えてくれた。")
            rewardBox("HPが全回復した！　100 / 100")
            AdventurePrimaryButton("ありがとう、行ってくる") { close() }
        case .shrine:
            eventHero("AN ANCIENT SECRET", title: "図書室で見つけた、森の鍵。", kind: .shrine)
            message("石板のことばに、鍵が光り始めた。\nこの鍵があれば、北の橋を渡れそうだ。")
            rewardBox("ひらめきの鍵 × 1")
            AdventurePrimaryButton("鍵を受け取る", symbol: "key.fill") { store.takeKey(); dismiss() }
                .accessibilityIdentifier("adventure.key.claim")
        case .bridge:
            eventHero("A NEW PATH OPENS", title: "森の奥へ、道が開いた。", kind: .bridge, completed: true)
            message("ひらめきの鍵が光り、橋の封印が消えた。\nこの先で、森の主が待っている。")
            AdventurePrimaryButton("橋の向こうへ") { close() }
        case .port:
            eventHero("CHAPTER 01 COMPLETE", title: "冒険は、まだつづく。", kind: .port)
            message("森を抜けると、潮風が頬をなでた。\n船の向こうには、まだ知らない世界。")
            rewardBox("第1章「まっしろな冒険ノート」クリア")
            AdventurePrimaryButton("世界地図を見る", symbol: "globe.asia.australia") { store.presentation = .world }
            Button("森をもう少し探索する") { close() }.foregroundColor(AdventurePalette.muted)
        case .road:
            eventHero("THE ADVENTURE BEGINS", title: "道は、ひとつじゃない。", kind: .village)
            message("木陰には、きらりと光る宝箱。\n東の道には、見慣れないモンスター。\nどちらから進もう？")
            AdventurePrimaryButton("冒険をつづける") { close() }
        default:
            eventHero("HOME SWEET HOME", title: "出発の村", kind: .village)
            message("「おかえり。旅は順調かな？」\n村のみんなが、あなたを待っている。")
            rewardBox("HPが全回復した！　100 / 100")
            AdventurePrimaryButton("冒険に戻る") { close() }
        }
    }

    @ViewBuilder private var battleContent: some View {
        if let battle = store.progress.battle, let question = battle.currentQuestion,
           let node = AdventureWorld.node(battle.nodeID) {
            eyebrow(node.kind == .boss ? "BOSS BATTLE" : "QUIZ BATTLE")
            AdventureIllustration(kind: node.kind, nodeID: node.id).frame(width: 105, height: 95)
            VStack(spacing: 8) {
                HStack { Text(node.name).fontWeight(.bold); Spacer(); Text("\(battle.enemyHP) / \(node.enemyHP)").monospacedDigit() }.font(.system(size: 12))
                AdventureHPBar(value: battle.enemyHP, maximum: node.enemyHP, enemy: true)
                HStack { Text("あなたのHP"); Spacer(); Text("\(store.progress.hp) / 100") }.font(.system(size: 11)).foregroundColor(AdventurePalette.muted)
            }
            Text(question.question).font(.system(size: 17, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).fixedSize(horizontal: false, vertical: true)
            VStack(spacing: 10) {
                ForEach(question.choices.indices, id: \.self) { index in
                    answerButton(question, index: index, battle: battle)
                }
            }
            if let correct = battle.wasCorrect {
                VStack(alignment: .leading, spacing: 8) {
                    Text(correct ? "正解！ 30ダメージ！" : "おしい！ 解説を読んでもう一度（HP −20）").font(.system(size: 14, weight: .bold))
                    Text(question.explanation).font(.system(size: 13)).fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding(15)
                .background(AdventurePalette.line.opacity(0.5), in: RoundedRectangle(cornerRadius: 12))
                .accessibilityElement(children: .combine)
                if node.id == 9 {
                    Text(battle.wasCorrect == true ? "森の主「なるほど！ ノートに書いておこう。」" : "おとも「だいじょうぶ。考え方が、ひとつわかったね。」")
                        .font(.subheadline).foregroundColor(AdventurePalette.muted)
                        .fixedSize(horizontal: false, vertical: true)
                }
                AdventurePrimaryButton(store.progress.hp == 0 ? "休んだ場所へ戻る" : battle.enemyHP == 0 ? "勝利！ 報酬を見る" : "次の問題へ") { store.nextQuestion() }
                    .accessibilityIdentifier("adventure.battle.next").id("adventure.feedback")
            }
        }
    }

    private func answerButton(_ question: AdventureQuestion, index: Int, battle: AdventureBattle) -> some View {
        let answered = battle.selectedAnswer != nil
        let correct = answered && index == question.correctAnswerIndex
        let wrong = answered && index == battle.selectedAnswer && !correct
        return Button { store.answer(index) } label: {
            HStack(alignment: .top, spacing: 10) {
                Text(String(UnicodeScalar(65 + index) ?? "A")).font(.system(size: 11, weight: .bold))
                    .frame(width: 24, height: 25).background(AdventurePalette.line, in: RoundedRectangle(cornerRadius: 6))
                Text(question.choices[index]).font(.system(size: 14)).frame(maxWidth: .infinity, alignment: .leading).fixedSize(horizontal: false, vertical: true)
                if correct { Image(systemName: "checkmark.circle.fill").foregroundColor(AdventurePalette.leaf) }
                else if wrong { Image(systemName: "xmark.circle.fill").foregroundColor(.red.opacity(0.75)) }
            }
            .padding(13).frame(minHeight: 50).foregroundColor(AdventurePalette.ink)
            .background(correct ? AdventurePalette.leaf.opacity(0.17) : wrong ? Color.red.opacity(0.09) : AdventurePalette.paper, in: RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(correct ? AdventurePalette.leaf : wrong ? Color.red.opacity(0.5) : AdventurePalette.line))
        }
        .buttonStyle(.plain).disabled(answered).accessibilityIdentifier("adventure.answer.\(index)")
    }

    private var worldContent: some View {
        VStack(spacing: 19) {
            eyebrow("WORLD MAP")
            Text("まなびの世界").font(.system(size: 29, weight: .bold, design: .serif))
            message("「どうして？」を見つける、発見の旅。")
            worldRow("まなびの森", symbol: "leaf.fill", status: store.progress.isChapterComplete ? "踏破" : "探索中")
            worldRow("潮風の群島", symbol: "sailboat.fill", status: "今後追加予定")
            worldRow("かずの遺跡", symbol: "building.columns.fill", status: "今後追加予定")
            worldRow("星空の山脈", symbol: "mountain.2.fill", status: "今後追加予定")
            worldRow("ことばの王国", symbol: "building.2.fill", status: "今後追加予定")
            worldRow("ふしぎの雪原", symbol: "snowflake", status: "今後追加予定")
            AdventurePrimaryButton("まなびの森へ戻る") { close() }
        }
    }

    private var inventoryContent: some View {
        VStack(spacing: 18) {
            eyebrow("YOUR INVENTORY")
            Text("旅のもちもの").font(.system(size: 27, weight: .bold, design: .serif))
            worldRow("冒険用の回復薬", symbol: "cross.case.fill", status: "\(store.progress.potions) 個")
            AdventurePrimaryButton("回復薬を使う · HP＋50", symbol: "heart.fill") { store.usePotion() }
                .disabled(store.progress.potions == 0 || store.progress.hp == 100 || store.progress.battle != nil)
            worldRow("ひらめきの鍵", symbol: "key.fill", status: store.progress.hasKey ? "入手済み" : "未入手")
            worldRow("旅人の帽子", symbol: "graduationcap.fill", status: store.progress.hasHat ? "入手済み" : "未入手")
            if store.progress.hasHat { Toggle("帽子をかぶる", isOn: Binding(get: { store.progress.wearsHat }, set: { _ in store.toggleHat() })).tint(AdventurePalette.leaf) }
            Divider()
            coursePicker
            Text("この旅で獲得したコイン　\(store.progress.earnedCoins)").font(.system(size: 13))
            if let message = store.rewardMessage { Text(message).font(.system(size: 12)).foregroundColor(AdventurePalette.muted).multilineTextAlignment(.center) }
            Text("冒険の記録は、この端末に自動保存されます。").font(.system(size: 11)).foregroundColor(AdventurePalette.muted)
        }
    }

    private var coursePicker: some View {
        Picker("学習する教科", selection: Binding(get: { store.progress.course }, set: { store.changeCourse($0) })) {
            ForEach(AdventureCourse.allCases) { Text($0.title).tag($0) }
        }
        .pickerStyle(.menu).tint(AdventurePalette.ink).disabled(store.progress.battle != nil)
        .accessibilityIdentifier("adventure.course")
    }
    private func worldRow(_ title: String, symbol: String, status: String) -> some View {
        HStack(spacing: 12) { Image(systemName: symbol).frame(width: 23); Text(title).fontWeight(.semibold); Spacer(); Text(status).font(.system(size: 11)).foregroundColor(AdventurePalette.muted) }
            .font(.system(size: 13)).padding(15).background(AdventurePalette.line.opacity(0.4), in: RoundedRectangle(cornerRadius: 12))
    }
    private func eventHero(_ kicker: String, title: String, kind: AdventureNodeKind, completed: Bool = false, nodeID: Int? = nil) -> some View {
        VStack(spacing: 13) {
            eyebrow(kicker)
            AdventureIllustration(kind: kind, completed: completed, nodeID: nodeID).frame(width: 145, height: 135)
                .background(AdventurePalette.grass.opacity(0.6), in: Circle())
            Text(title).font(.system(size: 25, weight: .bold, design: .serif)).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
        }
    }
    private func eyebrow(_ text: String) -> some View { Text(text).font(.system(size: 10, weight: .bold)).tracking(1.8).foregroundColor(AdventurePalette.muted) }
    private func message(_ text: String) -> some View { Text(text).font(.system(size: 13)).lineSpacing(6).multilineTextAlignment(.center).foregroundColor(AdventurePalette.muted).fixedSize(horizontal: false, vertical: true) }
    private func rewardBox(_ text: String) -> some View { Text(text).font(.system(size: 15, weight: .semibold)).multilineTextAlignment(.center).lineSpacing(7).frame(maxWidth: .infinity).padding(17).background(AdventurePalette.line.opacity(0.5), in: RoundedRectangle(cornerRadius: 13)) }
    private func close() { store.presentation = nil; dismiss() }
}
