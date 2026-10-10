import SwiftUI

struct AdventureMapBackdropProjection {
    let bounds: Anchor<CGRect>
    let camera: CGPoint
    let scale: CGFloat
}

struct AdventureMapBackdropPreferenceKey: PreferenceKey {
    static var defaultValue: AdventureMapBackdropProjection?
    static func reduce(value: inout AdventureMapBackdropProjection?, nextValue: () -> AdventureMapBackdropProjection?) {
        if let next = nextValue() { value = next }
    }
}

/// Extends the live map behind the transparent HUD using its exact screen anchor.
/// The world is drawn once; zooming out reveals a plain forest-green surround.
struct AdventureScreenBackdrop: View {
    let projection: AdventureMapBackdropProjection?
    let enabled: Bool

    var body: some View {
        GeometryReader { reader in
            if enabled {
                ZStack {
                    AdventurePalette.deep
                    if let projection {
                        let mapFrame = reader[projection.bounds]
                        let camera = CGPoint(
                            x: projection.camera.x + (reader.size.width / 2 - mapFrame.midX) / projection.scale,
                            y: projection.camera.y + (reader.size.height / 2 - mapFrame.midY) / projection.scale)
                        AdventureImageBackground(camera: camera, scale: projection.scale)
                    }
                    LinearGradient(stops: [
                        .init(color: .black.opacity(0.64), location: 0),
                        .init(color: .black.opacity(0.35), location: 0.10),
                        .init(color: .clear, location: 0.20),
                        .init(color: .clear, location: 0.82),
                        .init(color: .black.opacity(0.58), location: 0.94),
                        .init(color: .black.opacity(0.78), location: 1)
                    ], startPoint: .top, endPoint: .bottom)
                }
            } else {
                AdventurePalette.paper
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

/// The image covers a 2280 × 3300 world; paths and nodes use the same transform.
/// Replace this asset to change the scenery without changing progression or rewards.
struct AdventureImageBackground: View {
    static let assetName = "StoryForestWorldSharpBackground"
    static let pixelSize: CGSize = {
        guard let image = UIImage(named: assetName)?.cgImage else { return .zero }
        return CGSize(width: image.width, height: image.height)
    }()

    let camera: CGPoint
    let scale: CGFloat

    var body: some View {
        Canvas { context, size in
            let world = AdventureMapLayout(style: .storybook).worldSize
            // Draw at the viewport's display resolution; do not magnify an
            // intermediate rasterized SwiftUI layer with scaleEffect.
            let destination = CGRect(
                x: size.width / 2 - camera.x * scale,
                y: size.height / 2 - camera.y * scale,
                width: world.width * scale, height: world.height * scale)
            let image = Image(Self.assetName).interpolation(.high)
            context.draw(image, in: destination)
        }
        .accessibilityHidden(true)
    }
}

struct StoryImageAdventureHomeCard: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("STORY QUEST · ANOTHER VIEW")
                        .font(.system(size: 9, weight: .bold)).tracking(1.2)
                        .foregroundColor(AdventurePalette.gold)
                    Text("絵本の地図で冒険する")
                        .font(.system(size: 20, weight: .bold, design: .serif))
                    Text("おともと広げる、発見いっぱいの地図。")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white.opacity(0.9))
                }
                Spacer(minLength: 0)
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 38, height: 38)
                    .background(.white.opacity(0.18), in: Circle())
            }
            .foregroundColor(.white)
            .padding(18)
            .frame(maxWidth: .infinity, minHeight: 115, alignment: .leading)
            .background {
                GeometryReader { geometry in
                    Image(AdventureImageBackground.assetName)
                        .resizable().scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .overlay {
                    LinearGradient(colors: [Color(hex: "173D2E").opacity(0.95), Color(hex: "173D2E").opacity(0.35)],
                                   startPoint: .leading, endPoint: .trailing)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(AdventurePalette.gold.opacity(0.5)))
        }
        .buttonStyle(.plain)
        .accessibilityIdentifier("home.storyImageAdventure")
    }
}
