//
//  UILabel+字体颜色渐变.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL
import ObjectiveC
import JobsSwiftBaseDefines
import JobsByQuartzCore

private var jobsGradientTextScaleKey: UInt8 = 0

extension UILabel {

    public func jobs_setGradientText(colors: [UIColor],
                                     direction: JobsGradientDirection = .leftToRight) {
        if #available(iOS 17.0, *), objc_getAssociatedObject(self,
                                                             &jobsGradientTextScaleKey) == nil {
            objc_setAssociatedObject(self,
                                     &jobsGradientTextScaleKey,
                                     true,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            registerForTraitChanges([UITraitDisplayScale.self]) { (label: UILabel, _: UITraitCollection) in
                for gradient in label.layer.sublayers?.compactMap({
                    $0 as? CAGradientLayer
                }) ?? [] {
                    gradient.mask?.contentsScale = label.traitCollection.displayScale
                }
            }
        }
        guard let text, !text.isEmpty else {
            return
        }
        layer.sublayers?.removeAll(where: {
            $0 is CAGradientLayer
        })
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
                    .byContentsScale(traitCollection.displayScale)))
        byTextColor(JobsCor.clear)
    }
}
