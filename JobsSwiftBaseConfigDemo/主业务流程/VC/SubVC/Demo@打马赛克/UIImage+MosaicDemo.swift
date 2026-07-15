//
//  UIImage+MosaicDemo.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import CoreImage

private enum MosaicDemoCIContext {
    static let shared = CIContext(options: nil)
}

enum MosaicDemoPointSampler {
    static func points(from start: CGPoint,
                       to end: CGPoint,
                       step: CGFloat) -> [CGPoint] {
        let dx = end.x - start.x
        let dy = end.y - start.y
        let distance = hypot(dx, dy)
        let count = max(1, Int(ceil(distance / max(1, step))))
        return (0...count).map { index in
            let progress = CGFloat(index) / CGFloat(count)
            return CGPoint(x: start.x + dx * progress, y: start.y + dy * progress)
        }
    }
}

extension UIImage {
    func jobs_mosaicNormalized() -> UIImage {
        guard imageOrientation != .up else { return self }
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }

    func jobs_mosaicPixelated(blockSize: CGFloat) -> UIImage {
        let normalized = jobs_mosaicNormalized()
        guard let ciImage = CIImage(image: normalized) else { return normalized }
        let filter = CIFilter(name: "CIPixellate")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(max(2, blockSize), forKey: kCIInputScaleKey)
        filter?.setValue(
            CIVector(x: ciImage.extent.midX, y: ciImage.extent.midY),
            forKey: kCIInputCenterKey
        )
        guard let output = filter?.outputImage?.cropped(to: ciImage.extent),
              let cgImage = MosaicDemoCIContext.shared.createCGImage(output, from: ciImage.extent) else {
            return normalized
        };return UIImage(cgImage: cgImage, scale: normalized.scale, orientation: .up)
    }

    func jobs_mosaicPainted(with mosaicImage: UIImage,
                            centers: [CGPoint],
                            brushDiameter: CGFloat) -> UIImage {
        let normalized = jobs_mosaicNormalized()
        let format = UIGraphicsImageRendererFormat()
        format.scale = normalized.scale
        format.opaque = false
        let imageRect = CGRect(origin: .zero, size: normalized.size)
        let renderer = UIGraphicsImageRenderer(size: normalized.size, format: format)
        return renderer.image { context in
            normalized.draw(in: imageRect)
            let path = CGMutablePath()
            centers.forEach { center in
                let rect = CGRect(
                    x: center.x - brushDiameter / 2,
                    y: center.y - brushDiameter / 2,
                    width: brushDiameter,
                    height: brushDiameter
                ).intersection(imageRect)
                if rect.isNull == false {
                    path.addEllipse(in: rect)
                }
            }
            context.cgContext.saveGState()
            context.cgContext.addPath(path)
            context.cgContext.clip()
            mosaicImage.draw(in: imageRect)
            context.cgContext.restoreGState()
        }
    }
}

extension UIImageView {
    func jobs_mosaicImageFrame(for imageSize: CGSize) -> CGRect {
        guard imageSize.width > 0, imageSize.height > 0, bounds.width > 0, bounds.height > 0 else {
            return .zero
        }
        let imageRatio = imageSize.width / imageSize.height
        let viewRatio = bounds.width / bounds.height
        if imageRatio > viewRatio {
            let height = bounds.width / imageRatio
            return CGRect(
                x: 0,
                y: (bounds.height - height) / 2,
                width: bounds.width,
                height: height
            )
        } else {
            let width = bounds.height * imageRatio
            return CGRect(
                x: (bounds.width - width) / 2,
                y: 0,
                width: width,
                height: bounds.height
            )
        }
    }

    func jobs_mosaicImagePoint(from viewPoint: CGPoint,
                               imageSize: CGSize) -> CGPoint? {
        let imageFrame = jobs_mosaicImageFrame(for: imageSize)
        guard imageFrame.contains(viewPoint), imageFrame.width > 0, imageFrame.height > 0 else {
            return nil
        };return CGPoint(
            x: ((viewPoint.x - imageFrame.minX) / imageFrame.width) * imageSize.width,
            y: ((viewPoint.y - imageFrame.minY) / imageFrame.height) * imageSize.height
        )
    }
}
