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
import JobsByQuartzCore

extension UILabel {
    public func jobs_setGradientText(
        colors: [UIColor],
        direction: JobsGradientDirection = .leftToRight) {
        guard let text, !text.isEmpty else { return }
        layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        layer.addSublayer(
            CAGradientLayer()
                .byFrame(bounds)
                .byColors(colors.map(\.cgColor))
                .byStartPoint(direction.points.start)
                .byEndPoint(direction.points.end)
                .byMask(
                    CATextLayer()
                        .byString(text)
                        .byFont(font)
                        .byFontSize(font.pointSize)
                        .byAlignmentMode(.center)
                        .byContentsScale(UIScreen.main.scale)))
            byTextColor(.clear)
    }
}
