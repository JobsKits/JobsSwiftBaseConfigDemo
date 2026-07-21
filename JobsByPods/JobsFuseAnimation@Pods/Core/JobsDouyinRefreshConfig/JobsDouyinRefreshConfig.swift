//
//  JobsDouyinRefreshConfig.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftDSL

/// 抖音风格双球刷新动画配置。
public struct JobsDouyinRefreshConfig {
    public var redColor: UIColor
    public var greenColor: UIColor
    public var dotDiameter: CGFloat
    public var horizontalTravel: CGFloat
    public var jumpHeight: CGFloat
    public var cycleDuration: TimeInterval

    public init(
        redColor: UIColor = UIColor(hex: 0xFE2C55),
        greenColor: UIColor = UIColor(hex: 0x25F4EE),
        dotDiameter: CGFloat = 14,
        horizontalTravel: CGFloat = 24,
        jumpHeight: CGFloat = 8,
        cycleDuration: TimeInterval = 0.84
    ) {
        self.redColor = redColor
        self.greenColor = greenColor
        self.dotDiameter = dotDiameter.isFinite ? max(2, dotDiameter) : 14
        self.horizontalTravel = horizontalTravel.isFinite ? max(2, horizontalTravel) : 24
        self.jumpHeight = jumpHeight.isFinite ? max(0, jumpHeight) : 8
        self.cycleDuration = cycleDuration.isFinite ? max(0.36, cycleDuration) : 0.84
    }

    public var indicatorSize: CGSize {
        CGSize(
            width: horizontalTravel + dotDiameter,
            height: dotDiameter + jumpHeight * 2
        )
    }
}
