//
//  PhotoFilterRenderer.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import CoreImage

enum PhotoFilterRenderer {
    static func render(
        sourceImage: UIImage,
        preset: PhotoFilterPreset,
        intensity: Float
    ) -> UIImage? {
        guard preset != .original else { return sourceImage }
        let inputImage: CIImage?
        if let cgImage = sourceImage.cgImage {
            inputImage = CIImage(cgImage: cgImage)
        } else {
            inputImage = sourceImage.ciImage ?? CIImage(image: sourceImage)
        }
        guard let inputImage else { return nil }
        let value = min(max(intensity, 0), 1)
        guard let outputImage = outputImage(
            for: preset,
            inputImage: inputImage,
            intensity: value
        )?.cropped(to: inputImage.extent) else { return nil }
        let context = CIContext(options: [.cacheIntermediates: true])
        guard let cgImage = context.createCGImage(outputImage, from: inputImage.extent) else {
            return nil
        };return UIImage(
            cgImage: cgImage,
            scale: sourceImage.scale,
            orientation: sourceImage.imageOrientation
        )
    }

    private static func outputImage(
        for preset: PhotoFilterPreset,
        inputImage: CIImage,
        intensity: Float
    ) -> CIImage? {
        switch preset {
        /// 处理 .original 分支
        case .original:
            return inputImage
        /// 处理 .noir 分支
        case .noir:
            return effectImage(
                named: "CIPhotoEffectNoir",
                inputImage: inputImage,
                intensity: intensity
            )
        /// 处理 .chrome 分支
        case .chrome:
            return effectImage(
                named: "CIPhotoEffectChrome",
                inputImage: inputImage,
                intensity: intensity
            )
        /// 处理 .sepia 分支
        case .sepia:
            guard let filter = CIFilter(name: "CISepiaTone") else { return nil }
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            filter.setValue(intensity, forKey: kCIInputIntensityKey)
            return filter.outputImage
        /// 处理 .vivid 分支
        case .vivid:
            guard let filter = CIFilter(name: "CIColorControls") else { return nil }
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            filter.setValue(1 + 0.8 * intensity, forKey: kCIInputSaturationKey)
            filter.setValue(1 + 0.22 * intensity, forKey: kCIInputContrastKey)
            filter.setValue(0.03 * intensity, forKey: kCIInputBrightnessKey)
            return filter.outputImage
        /// 处理 .comic 分支
        case .comic:
            return effectImage(
                named: "CIComicEffect",
                inputImage: inputImage,
                intensity: intensity
            )
        }
    }

    private static func effectImage(
        named filterName: String,
        inputImage: CIImage,
        intensity: Float
    ) -> CIImage? {
        guard let filter = CIFilter(name: filterName) else { return nil }
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        guard let filteredImage = filter.outputImage else { return nil }
        guard intensity < 1,
              let dissolveFilter = CIFilter(name: "CIDissolveTransition") else {
            return filteredImage
        }
        dissolveFilter.setValue(inputImage, forKey: kCIInputImageKey)
        dissolveFilter.setValue(filteredImage, forKey: kCIInputTargetImageKey)
        dissolveFilter.setValue(intensity, forKey: kCIInputTimeKey)
        return dissolveFilter.outputImage
    }
}
