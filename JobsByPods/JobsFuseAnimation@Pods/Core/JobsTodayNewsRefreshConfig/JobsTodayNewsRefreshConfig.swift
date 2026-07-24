//
//  JobsTodayNewsRefreshConfig.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftDSL

/// 今日头条红色轮廓形变刷新动画配置。
public struct JobsTodayNewsRefreshConfig {
    public var strokeColor: UIColor
    public var lineWidth: CGFloat
    public var triangleWidth: CGFloat
    public var triangleHeight: CGFloat
    public var centerGap: CGFloat
    public var cycleDuration: TimeInterval

    public init(
        strokeColor: UIColor = UIColor(hex: 0xFF4B4B),
        lineWidth: CGFloat = 1.8,
        triangleWidth: CGFloat = 15,
        triangleHeight: CGFloat = 16,
        centerGap: CGFloat = 1,
        cycleDuration: TimeInterval = 0.65
    ) {
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth.isFinite ? max(0.5, lineWidth) : 1.8
        self.triangleWidth = triangleWidth.isFinite ? max(4, triangleWidth) : 15
        self.triangleHeight = triangleHeight.isFinite ? max(4, triangleHeight) : 16
        self.centerGap = centerGap.isFinite ? max(0, centerGap) : 1
        self.cycleDuration = cycleDuration.isFinite ? max(0.3, cycleDuration) : 0.65
    }

    public var indicatorSize: CGSize {
        CGSize(
            width: triangleWidth * 2 + centerGap + lineWidth * 2,
            height: triangleHeight + lineWidth * 2
        )
    }
}
