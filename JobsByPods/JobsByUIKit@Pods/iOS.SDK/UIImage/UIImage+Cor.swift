//
//  UIImage+Cor.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import CoreImage
import JobsSwiftBaseDefines

extension UIImage {
    // MARK: 反转图片颜色（RGB 反转，Alpha 不变）
    public func invertedColors() -> UIImage? {
        guard let ciImage = CIImage(image: self) else { return nil }

        let filter = CIFilter(name: "CIColorInvert")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        guard
            let output = filter?.outputImage,
            let cgImage = CIContext(options: nil)
                .createCGImage(output, from: output.extent)
        else {
            return nil
        };return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
    }
    // MARK: 填充一个固定颜色
    public func filled(by color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }

        guard let ctx = UIGraphicsGetCurrentContext(),
              let cgImage = self.cgImage else { return jobsSolidBlue() }

        let rect = CGRect(origin: .zero, size: size)

        ctx.translateBy(x: 0, y: size.height)
        ctx.scaleBy(x: 1, y: -1)

        ctx.clip(to: rect, mask: cgImage)
        ctx.setFillColor(color.cgColor)
        ctx.fill(rect)

        return UIGraphicsGetImageFromCurrentImageContext() ?? jobsSolidBlue()
    }
}
