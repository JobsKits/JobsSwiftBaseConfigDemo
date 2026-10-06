//
//  JobsSplashGIFDecoder.swift
//  JobsSwiftSplash
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import ImageIO

enum JobsSplashGIFDecoder {
    static func image(data: Data, maxPixelSize: Int = 1024,
                      maxFrames: Int = 120, maxDecodedBytes: Int = 64 * 1024 * 1024) -> UIImage? {
        guard data.count <= 32 * 1024 * 1024,
              let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        let count = CGImageSourceGetCount(source)
        guard count > 0, count <= 10_000 else { return nil }
        let frameLimit = max(1, min(120, maxFrames))
        let step = max(1, Int(ceil(Double(count) / Double(frameLimit))))
        let options = [kCGImageSourceCreateThumbnailFromImageAlways: true,
                       kCGImageSourceCreateThumbnailWithTransform: true,
                       kCGImageSourceThumbnailMaxPixelSize: max(1, min(4096, maxPixelSize))] as CFDictionary
        var frames: [UIImage] = []
        var duration: TimeInterval = 0
        var bytes = 0
        for index in 0..<count {
            duration += frameDuration(source: source, index: index)
            guard index % step == 0 else { continue }
            guard let image = CGImageSourceCreateThumbnailAtIndex(source, index, options) else { return nil }
            let cost = image.bytesPerRow.multipliedReportingOverflow(by: image.height)
            guard !cost.overflow, cost.partialValue <= max(0, maxDecodedBytes) - bytes else { break }
            bytes += cost.partialValue
            frames.append(UIImage(cgImage: image))
        }
        guard let first = frames.first else { return nil }
        return frames.count == 1 ? first : UIImage.animatedImage(with: frames, duration: max(0.1, duration))
    }

    private static func frameDuration(source: CGImageSource, index: Int) -> TimeInterval {
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [CFString: Any],
              let gif = properties[kCGImagePropertyGIFDictionary] as? [CFString: Any] else {
            return 0.1
        }
        let unclamped = gif[kCGImagePropertyGIFUnclampedDelayTime] as? Double
        let clamped = gif[kCGImagePropertyGIFDelayTime] as? Double
        let value = unclamped ?? clamped ?? 0.1
        return value.isFinite ? max(0.02, min(60, value)) : 0.1
    }
}
