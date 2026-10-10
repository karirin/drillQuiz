import AppKit
import CoreImage
import Foundation
import Vision

enum BackgroundRemovalError: Error, CustomStringConvertible {
    case invalidArguments
    case unreadableImage(String)
    case missingCGImage(String)
    case noForeground(String)
    case missingColorSpace

    var description: String {
        switch self {
        case .invalidArguments:
            return "Usage: remove_image_background <input.png> <output.png>"
        case .unreadableImage(let path):
            return "Unable to read image: \(path)"
        case .missingCGImage(let path):
            return "Unable to decode image: \(path)"
        case .noForeground(let path):
            return "No foreground instance detected: \(path)"
        case .missingColorSpace:
            return "Unable to create sRGB color space"
        }
    }
}

func removeBackground(inputPath: String, outputPath: String) throws {
    guard let image = NSImage(contentsOfFile: inputPath) else {
        throw BackgroundRemovalError.unreadableImage(inputPath)
    }
    guard let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
        throw BackgroundRemovalError.missingCGImage(inputPath)
    }

    let request = VNGenerateForegroundInstanceMaskRequest()
    let handler = VNImageRequestHandler(cgImage: cgImage)
    try handler.perform([request])

    guard let observation = request.results?.first,
          !observation.allInstances.isEmpty else {
        throw BackgroundRemovalError.noForeground(inputPath)
    }

    let maskBuffer = try observation.generateScaledMaskForImage(
        forInstances: observation.allInstances,
        from: handler
    )
    let source = CIImage(cgImage: cgImage)
    // Pull the matte a few pixels inward before a very small feather.  ImageGen
    // previews sometimes contain a painted checkerboard, and a raw Vision mask
    // otherwise leaves that background visible as a grey fringe at the outline.
    let mask = CIImage(cvPixelBuffer: maskBuffer)
        .applyingFilter(
            "CIMorphologyMinimum",
            parameters: ["inputRadius": 8.0]
        )
        .applyingFilter(
            "CIGaussianBlur",
            parameters: [kCIInputRadiusKey: 0.6]
        )
        .cropped(to: source.extent)
    let transparent = CIImage(color: .clear).cropped(to: source.extent)
    let output = source.applyingFilter(
        "CIBlendWithMask",
        parameters: [
            kCIInputBackgroundImageKey: transparent,
            kCIInputMaskImageKey: mask
        ]
    )

    guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB) else {
        throw BackgroundRemovalError.missingColorSpace
    }
    let context = CIContext(options: [.useSoftwareRenderer: false])
    let url = URL(fileURLWithPath: outputPath)
    try context.writePNGRepresentation(
        of: output,
        to: url,
        format: .RGBA8,
        colorSpace: colorSpace
    )
}

do {
    guard CommandLine.arguments.count == 3 else {
        throw BackgroundRemovalError.invalidArguments
    }
    try removeBackground(
        inputPath: CommandLine.arguments[1],
        outputPath: CommandLine.arguments[2]
    )
} catch {
    FileHandle.standardError.write(Data("\(error)\n".utf8))
    exit(1)
}
