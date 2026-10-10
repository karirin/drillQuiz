import SwiftUI

struct AdventureMapCommand: Equatable {
    enum Action { case zoomIn, zoomOut, overview, locate }
    let action: Action
    private let id = UUID()

    init(action: Action) { self.action = action }
}

private struct AdventureMapPinchValue: Equatable {
    let magnification: CGFloat
    let anchor: UnitPoint
}

struct AdventureMapView: View {
    @ObservedObject var store: AdventureStore
    let avatarName: String
    var mapStyle: AdventureMapStyle = .illustrated
    var command: AdventureMapCommand?
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.displayScale) private var displayScale
    @State private var camera = CGPoint(x: 310, y: 700)
    @State private var zoom: CGFloat = 0.82
    @State private var fittingWorld = false
    @State private var interaction: AdventureMapInteraction?
    @GestureState private var isInteracting = false

    private var layout: AdventureMapLayout { AdventureMapLayout(style: mapStyle) }
    private var hudText: Color { mapStyle == .storybook ? .white : AdventurePalette.ink }
    private var hudSecondaryText: Color { mapStyle == .storybook ? .white.opacity(0.85) : AdventurePalette.muted }
    private var hudBackground: Color { mapStyle == .storybook ? .clear : AdventurePalette.paper }

    var body: some View {
        VStack(spacing: 0) {
            if mapStyle != .storybook {
                questCard.padding(.horizontal, 12).padding(.bottom, 10)
                    .background(hudBackground)
            }
            GeometryReader { reader in
                let size = CGSize(width: reader.size.width, height: max(1, reader.size.height - (mapStyle == .storybook ? 0 : 60)))
                let qualityLimit = mapStyle == .storybook
                    ? AdventureMapImageQuality.maximumScale(pixelSize: AdventureImageBackground.pixelSize,
                                                           worldSize: layout.worldSize, displayScale: displayScale)
                    : 1.6
                let geometry = AdventureMapGeometry(worldSize: layout.worldSize, viewportSize: size,
                                                    maximumAllowedScale: qualityLimit)
                let scale = interaction?.scale ?? geometry.clampedScale(zoom)
                VStack(spacing: 0) {
                    mapViewport(geometry: geometry, scale: scale)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                    if mapStyle != .storybook {
                        mapControls(geometry: geometry, scale: scale)
                            .frame(height: 60)
                    }
                }
                .onAppear { locate(geometry: geometry, resetZoom: true, animated: false) }
                .onChange(of: store.visualNodeID) { _ in locate(geometry: geometry) }
                .onChange(of: size) { _ in
                    interaction = nil
                    zoom = fittingWorld ? geometry.fitScale : geometry.clampedScale(zoom)
                    camera = geometry.clampedCamera(camera, scale: zoom)
                }
                .onChange(of: isInteracting) { active in
                    if !active { finishInteraction(geometry: geometry) }
                }
                .onChange(of: command) { command in
                    guard let command, !store.isMoving else { return }
                    switch command.action {
                    case .zoomIn: changeZoom(to: scale * 1.5, geometry: geometry)
                    case .zoomOut: changeZoom(to: scale / 1.5, geometry: geometry)
                    case .overview: showOverview(geometry: geometry)
                    case .locate: locate(geometry: geometry, resetZoom: true)
                    }
                }
            }
        }
    }

    private func mapViewport(geometry: AdventureMapGeometry, scale: CGFloat) -> some View {
        let effectiveCamera = interaction?.camera ?? geometry.clampedCamera(camera, scale: scale)
        let hero = AdventureWorld.node(store.visualNodeID) ?? AdventureWorld.nodes[0]
        return AdventureMapContents(store: store, avatarName: avatarName, mapStyle: mapStyle,
                                    camera: effectiveCamera, hero: layout.point(x: hero.x, y: hero.y),
                                    scale: scale, size: geometry.viewportSize) { point in
            withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.3)) {
                zoom = geometry.clampedScale(min(0.65, geometry.maximumScale * 0.85))
                fittingWorld = false
                camera = geometry.clampedCamera(point, scale: zoom)
            }
        }
        .background(mapStyle == .storybook ? Color.clear : AdventurePalette.ground)
        .contentShape(Rectangle())
        .accessibilityElement(children: .contain)
        .accessibilityLabel("冒険マップ")
        .accessibilityValue("拡大率 \(Int((scale * 100).rounded()))パーセント")
        .accessibilityIdentifier("adventure.map")
        .highPriorityGesture(DragGesture(minimumDistance: 8).simultaneously(with: pinchGesture)
            .updating($isInteracting) { _, state, _ in state = true }
            .onChanged { value in
                updateInteraction(translation: value.first?.translation, pinch: value.second, geometry: geometry)
            }
            .onEnded { value in
                // GestureState cancellation may already have committed this session.
                guard interaction != nil else { return }
                updateInteraction(translation: value.first?.translation, pinch: value.second, geometry: geometry)
                finishInteraction(geometry: geometry)
            })
    }

    private var pinchGesture: AnyGesture<AdventureMapPinchValue> {
        if #available(iOS 17.0, *) {
            return AnyGesture(MagnifyGesture(minimumScaleDelta: 0.005).map {
                AdventureMapPinchValue(magnification: $0.magnification, anchor: $0.startAnchor)
            })
        } else {
            return AnyGesture(MagnificationGesture(minimumScaleDelta: 0.005).map {
                AdventureMapPinchValue(magnification: $0, anchor: .center)
            })
        }
    }

    private func updateInteraction(translation: CGSize?, pinch: AdventureMapPinchValue?, geometry: AdventureMapGeometry) {
        guard !store.isMoving else { return }
        var current = interaction ?? AdventureMapInteraction(camera: geometry.clampedCamera(camera, scale: zoom),
                                                             scale: geometry.clampedScale(zoom))
        let anchor = pinch.map { CGPoint(x: $0.anchor.x * geometry.viewportSize.width,
                                         y: $0.anchor.y * geometry.viewportSize.height) }
        current.update(translation: translation, magnification: pinch?.magnification, anchor: anchor, geometry: geometry)
        interaction = current
    }

    private func finishInteraction(geometry: AdventureMapGeometry) {
        guard let current = interaction else { return }
        zoom = geometry.clampedScale(current.scale)
        camera = geometry.clampedCamera(current.camera, scale: zoom)
        fittingWorld = zoom <= geometry.fitScale * 1.01
        interaction = nil
    }

    private func mapControls(geometry: AdventureMapGeometry, scale: CGFloat) -> some View {
        HStack(spacing: 6) {
            mapButton("縮小する", symbol: "minus", id: "adventure.map.zoomOut") {
                changeZoom(to: scale / 1.5, geometry: geometry)
            }
            .disabled(scale <= geometry.fitScale * 1.01)
            Text("\(Int((scale * 100).rounded()))%")
                .font(.system(size: 11, weight: .semibold)).monospacedDigit()
                .frame(width: 38)
                .accessibilityLabel("地図の拡大率 \(Int((scale * 100).rounded()))パーセント")
            mapButton("拡大する", symbol: "plus", id: "adventure.map.zoomIn") {
                changeZoom(to: scale * 1.5, geometry: geometry)
            }
            .disabled(scale >= geometry.maximumScale * 0.99)
            Spacer(minLength: 4)
            mapButton("マップ全体を見る", symbol: "arrow.up.left.and.arrow.down.right", id: "adventure.map.overview", caption: "全体") {
                showOverview(geometry: geometry)
            }
            mapButton("現在地に戻る", symbol: "location.fill", id: "adventure.map.locate", caption: "現在地") {
                locate(geometry: geometry, resetZoom: true)
            }
        }
        .padding(.horizontal, 12)
        .foregroundColor(hudText)
        .background(hudBackground)
        .shadow(color: .black.opacity(mapStyle == .storybook ? 0.55 : 0), radius: 2, y: 1)
        .disabled(store.isMoving)
    }

    private var questCard: some View {
        HStack(spacing: 10) {
            Image(systemName: "book.closed.fill").font(.system(size: 18))
                .foregroundColor(AdventurePalette.gold).frame(width: 34, height: 38)
                .background(AdventurePalette.deep, in: RoundedRectangle(cornerRadius: 9))
            VStack(alignment: .leading, spacing: 3) {
                Text(store.progress.hasForestLight ? "ノートに色がもどった！" : "ノートのつづきを見つけよう").font(.system(size: 13, weight: .bold))
                Text(store.progress.hasForestLight ? "開かれた道を進んで、潮風の港町へ" : "森の主と考えて、港町への道をひらく")
                    .font(.system(size: 10)).foregroundColor(hudSecondaryText)
            }
            Spacer(minLength: 2)
            Text("\(store.progress.clearedNodeIDs.count) / \(AdventureWorld.nodes.count)")
                .font(.system(size: 11, weight: .medium)).monospacedDigit().foregroundColor(hudSecondaryText)
        }
        .foregroundColor(hudText).padding(11)
        .background(hudBackground, in: RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(mapStyle == .storybook ? 0.55 : 0.08), radius: mapStyle == .storybook ? 2 : 8, y: 1)
        .accessibilityElement(children: .combine)
    }

    private func mapButton(_ title: String, symbol: String, id: String, caption: String? = nil, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 3) {
                Image(systemName: symbol).font(.system(size: 15, weight: .semibold))
                if let caption { Text(caption).font(.system(size: 8, weight: .semibold)) }
            }
                .frame(width: 44, height: 44).foregroundColor(hudText)
                .background(hudBackground, in: Circle())
        }
        .buttonStyle(.plain).accessibilityLabel(title).accessibilityIdentifier(id)
    }

    private func changeZoom(to scale: CGFloat, geometry: AdventureMapGeometry) {
        withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.25)) {
            zoom = geometry.clampedScale(scale)
            fittingWorld = zoom <= geometry.fitScale * 1.01
            camera = geometry.clampedCamera(camera, scale: zoom)
        }
    }

    private func showOverview(geometry: AdventureMapGeometry) {
        withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.35)) {
            zoom = geometry.fitScale
            fittingWorld = true
            camera = geometry.worldCenter
        }
    }

    private func locate(geometry: AdventureMapGeometry, resetZoom: Bool = false, animated: Bool = true) {
        guard let node = AdventureWorld.node(store.visualNodeID) else { return }
        withAnimation(animated && !reduceMotion ? .easeInOut(duration: 0.38) : nil) {
            if resetZoom {
                zoom = geometry.clampedScale(min(0.82, geometry.maximumScale * 0.75))
                fittingWorld = false
            }
            let scale = geometry.clampedScale(zoom)
            let point = layout.point(x: node.x, y: node.y)
            camera = geometry.clampedCamera(CGPoint(x: point.x, y: point.y - geometry.viewportSize.height / scale / 5), scale: scale)
        }
    }

}

private struct AdventureMapContents: View, Animatable {
    @ObservedObject var store: AdventureStore
    let avatarName: String
    let mapStyle: AdventureMapStyle
    var camera: CGPoint
    var hero: CGPoint
    var scale: CGFloat
    let size: CGSize
    let focus: (CGPoint) -> Void

    private var layout: AdventureMapLayout { AdventureMapLayout(style: mapStyle) }
    private var isOverview: Bool { scale * layout.coordinateScale < 0.65 }

    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat>> {
        get { AnimatablePair(AnimatablePair(camera.x, camera.y), AnimatablePair(AnimatablePair(hero.x, hero.y), scale)) }
        set {
            camera = CGPoint(x: newValue.first.first, y: newValue.first.second)
            hero = CGPoint(x: newValue.second.first.first, y: newValue.second.first.second)
            scale = newValue.second.second
        }
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            Canvas { context, _ in
                var painter = AdventurePainter(context: context)
                painter.context.translateBy(x: size.width / 2, y: size.height / 2)
                painter.context.scaleBy(x: scale, y: scale)
                painter.context.translateBy(x: -camera.x, y: -camera.y)
                painter.context.scaleBy(x: layout.coordinateScale, y: layout.coordinateScale)
                if mapStyle == .storybook {
                    painter.storybookPaths(clearedNodeIDs: store.progress.clearedNodeIDs)
                } else {
                    painter.terrain(hasLight: store.progress.hasForestLight)
                }
            }
            .allowsHitTesting(false)
            ForEach(AdventureWorld.nodes) { node in
                let point = position(layout.point(x: node.x, y: node.y))
                let visible = point.x > -20 && point.x < size.width + 20 && point.y > 10 && point.y < size.height - 10
                nodeButton(node).position(point)
                    .opacity(visible ? 1 : 0).allowsHitTesting(visible && !store.isMoving).accessibilityHidden(!visible)
            }
            if !isOverview {
                AdventurePawn(avatarName: avatarName, wearsHat: store.progress.wearsHat, showsLabel: mapStyle != .storybook)
                    .position(x: position(hero).x, y: position(hero).y - 42)
                    .allowsHitTesting(false).accessibilityHidden(true)
            }
        }
        .frame(width: size.width, height: size.height)
        .anchorPreference(key: AdventureMapBackdropPreferenceKey.self, value: .bounds) { bounds in
            mapStyle == .storybook ? AdventureMapBackdropProjection(bounds: bounds, camera: camera, scale: scale) : nil
        }
    }

    private func position(_ point: CGPoint) -> CGPoint { CGPoint(x: size.width / 2 + (point.x - camera.x) * scale, y: size.height / 2 + (point.y - camera.y) * scale) }

    private func nodeButton(_ node: AdventureNode) -> some View {
        let cleared = store.progress.clearedNodeIDs.contains(node.id)
        let reachable = store.progress.route(to: node.id) != nil
        let showsName = mapStyle != .storybook || node.id == store.selectedNodeID || node.id == store.progress.currentNodeID
        return Button {
            store.selectedNodeID = node.id
            UISelectionFeedbackGenerator().selectionChanged()
            if isOverview { focus(layout.point(x: node.x, y: node.y)) }
        } label: {
            if isOverview {
                compactMarker(node, cleared: cleared)
            } else {
            VStack(spacing: 0) {
                AdventureIllustration(kind: node.kind, completed: cleared || (node.kind == .bridge && store.progress.hasKey), nodeID: node.id)
                    .frame(width: node.kind == .boss ? 80 : 64, height: node.kind == .boss ? 78 : 68)
                    .overlay {
                        if store.selectedNodeID == node.id { Circle().stroke(.white.opacity(0.95), style: StrokeStyle(lineWidth: 2, dash: [5, 3])).frame(width: 61, height: 61) }
                        else if reachable && !cleared { Circle().stroke(.white.opacity(0.8), lineWidth: 1.5).frame(width: 57, height: 57) }
                    }
                HStack(spacing: 3) {
                    if cleared { Image(systemName: "checkmark").foregroundColor(AdventurePalette.leaf) }
                    Text(node.name)
                }
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(AdventurePalette.ink).padding(.horizontal, 6).padding(.vertical, 3)
                .background(AdventurePalette.paper, in: RoundedRectangle(cornerRadius: 5))
                .fixedSize()
                .opacity(showsName ? 1 : 0)
                .accessibilityHidden(!showsName)
            }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(node.name)\(node.id == store.progress.currentNodeID ? "、現在地" : "")\(cleared ? "、探索済み" : "")")
        .accessibilityHint(isOverview ? "この地点を拡大します" : reachable ? "行き先に選びます" : store.progress.blockedReason(for: node.id) ?? "行き先に選びます")
        .accessibilityIdentifier("adventure.node.\(node.id)")
    }

    private func compactMarker(_ node: AdventureNode, cleared: Bool) -> some View {
        let current = node.id == store.progress.currentNodeID
        return ZStack {
            Circle().fill(AdventurePalette.paper)
            if current {
                Image(avatarName).resizable().scaledToFit().padding(3)
            } else {
                AdventureIllustration(kind: node.kind, completed: cleared || (node.kind == .bridge && store.progress.hasKey), nodeID: node.id)
                    .padding(1)
            }
        }
        .frame(width: 32, height: 32)
        .overlay(Circle().stroke(current || node.id == store.selectedNodeID ? AdventurePalette.gold : .white, lineWidth: 2))
        .overlay(alignment: .bottomTrailing) {
            if cleared && !current {
                Image(systemName: "checkmark").font(.system(size: 7, weight: .bold)).foregroundColor(.white)
                    .frame(width: 12, height: 12).background(AdventurePalette.deep, in: Circle())
            }
        }
        .shadow(color: .black.opacity(0.18), radius: 2, y: 1)
        .frame(width: 44, height: 44)
        .contentShape(Circle())
    }
}

struct AdventurePawn: View {
    let avatarName: String
    var wearsHat = false
    var showsLabel = true

    var body: some View {
        VStack(spacing: 1) {
            if showsLabel {
                Text("YOU").font(.system(size: 9, weight: .bold)).padding(.horizontal, 7).padding(.vertical, 2)
                    .background(AdventurePalette.deep, in: Capsule()).foregroundColor(.white)
            }
            Image(avatarName.isEmpty ? "defaultIcon" : avatarName)
                .resizable().scaledToFit().frame(width: 47, height: 49)
                .shadow(color: .black.opacity(0.25), radius: 2, y: 3)
                .overlay(alignment: .top) {
                    if wearsHat { Image(systemName: "graduationcap.fill").foregroundColor(AdventurePalette.gold).font(.system(size: 22)).offset(y: -5) }
                }
        }
    }
}
