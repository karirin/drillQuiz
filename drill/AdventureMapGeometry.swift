import Foundation
import CoreGraphics

enum AdventureMapStyle: String, Identifiable {
    case illustrated, storybook
    var id: String { rawValue }
}

/// Presentation coordinates only: saved node IDs, routes and rewards stay unchanged.
struct AdventureMapLayout {
    let style: AdventureMapStyle
    var coordinateScale: CGFloat { style == .storybook ? 3 : 1 }
    var worldSize: CGSize {
        CGSize(width: AdventureWorld.width * coordinateScale, height: AdventureWorld.height * coordinateScale)
    }
    func point(x: Double, y: Double) -> CGPoint {
        CGPoint(x: x * coordinateScale, y: y * coordinateScale)
    }
}

struct AdventureMapGeometry {
    let worldSize: CGSize
    let viewportSize: CGSize
    var maximumAllowedScale: CGFloat = 1.6

    var fitScale: CGFloat {
        max(0.01, min(max(1, viewportSize.width - 40) / worldSize.width,
                      max(1, viewportSize.height - 48) / worldSize.height))
    }
    var maximumScale: CGFloat { max(fitScale, min(1.6, maximumAllowedScale)) }
    var worldCenter: CGPoint { CGPoint(x: worldSize.width / 2, y: worldSize.height / 2) }

    func clampedScale(_ scale: CGFloat) -> CGFloat { min(maximumScale, max(fitScale, scale)) }

    func clampedCamera(_ camera: CGPoint, scale: CGFloat) -> CGPoint {
        let safeScale = clampedScale(scale)
        let halfWidth = min(worldSize.width / 2, viewportSize.width / safeScale / 2)
        let halfHeight = min(worldSize.height / 2, viewportSize.height / safeScale / 2)
        return CGPoint(x: min(worldSize.width - halfWidth, max(halfWidth, camera.x)),
                       y: min(worldSize.height - halfHeight, max(halfHeight, camera.y)))
    }

    func screenPoint(_ point: CGPoint, camera: CGPoint, scale: CGFloat) -> CGPoint {
        CGPoint(x: viewportSize.width / 2 + (point.x - camera.x) * scale,
                y: viewportSize.height / 2 + (point.y - camera.y) * scale)
    }

    func pannedCamera(_ camera: CGPoint, translation: CGSize, scale: CGFloat) -> CGPoint {
        let safeScale = clampedScale(scale)
        return clampedCamera(CGPoint(x: camera.x - translation.width / safeScale,
                                     y: camera.y - translation.height / safeScale), scale: safeScale)
    }

    func zoomedCamera(_ camera: CGPoint, from startScale: CGFloat, to endScale: CGFloat, anchor: CGPoint) -> CGPoint {
        let start = clampedScale(startScale)
        let end = clampedScale(endScale)
        let offset = CGPoint(x: anchor.x - viewportSize.width / 2, y: anchor.y - viewportSize.height / 2)
        return clampedCamera(CGPoint(x: camera.x + offset.x / start - offset.x / end,
                                     y: camera.y + offset.y / start - offset.y / end), scale: end)
    }
}

/// A single gesture session owns both pan and pinch, so they cannot commit
/// competing camera positions when two fingers leave the screen.
struct AdventureMapInteraction {
    private let startCamera: CGPoint
    private let startScale: CGFloat
    private var pinchCamera: CGPoint?
    private var pinchAnchor: CGPoint?
    private(set) var camera: CGPoint
    private(set) var scale: CGFloat

    init(camera: CGPoint, scale: CGFloat) {
        startCamera = camera
        startScale = scale
        self.camera = camera
        self.scale = scale
    }

    mutating func update(translation: CGSize?, magnification: CGFloat?, anchor: CGPoint?, geometry: AdventureMapGeometry) {
        if let magnification, let anchor {
            if pinchCamera == nil {
                pinchCamera = camera
                pinchAnchor = anchor
            }
            scale = geometry.clampedScale(startScale * magnification)
            camera = geometry.zoomedCamera(pinchCamera ?? startCamera, from: startScale, to: scale,
                                           anchor: pinchAnchor ?? anchor)
        } else if pinchCamera == nil, let translation {
            camera = geometry.pannedCamera(startCamera, translation: translation, scale: startScale)
        }
    }
}

enum AdventureMapImageQuality {
    /// Limit source-pixel enlargement on Retina displays. Larger replacement
    /// images automatically unlock more zoom without changing the world size.
    static func maximumScale(pixelSize: CGSize, worldSize: CGSize, displayScale: CGFloat) -> CGFloat {
        guard pixelSize.width > 0, pixelSize.height > 0, worldSize.width > 0, worldSize.height > 0 else { return 0.01 }
        let pixelsPerWorldPoint = min(pixelSize.width / worldSize.width, pixelSize.height / worldSize.height)
        return pixelsPerWorldPoint * 2 / max(1, displayScale)
    }
}
