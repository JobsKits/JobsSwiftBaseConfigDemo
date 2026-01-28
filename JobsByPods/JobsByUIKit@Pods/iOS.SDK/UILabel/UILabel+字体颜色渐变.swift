//
//  UILabel+字体颜色渐变.swift
//  Pods
//
//  Created by Jobs on 23/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines

extension UILabel {
    public func jobs_setGradientText(
        colors: [UIColor],
        direction: JobsGradientDirection = .leftToRight) {
        guard let text, !text.isEmpty else { return }
        let textLayer = CATextLayer()
        textLayer.string = text
        textLayer.font = font
        textLayer.fontSize = font.pointSize
        textLayer.alignmentMode = .center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.frame = bounds

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)

        let p = direction.points
        gradientLayer.startPoint = p.start
        gradientLayer.endPoint   = p.end

        gradientLayer.mask = textLayer

        layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        layer.addSublayer(gradientLayer)

        textColor = .clear
    }
}
