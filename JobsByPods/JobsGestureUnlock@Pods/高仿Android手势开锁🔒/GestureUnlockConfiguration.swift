//
//  GestureUnlockConfiguration.swift
//  JobsGestureUnlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines

public struct GestureUnlockConfiguration {
    public var gridDimension: Int = 3
    /// 节点直径（实际会按布局自动取 min(该值, spacing*0.65)）
    public var nodeDiameter: CGFloat = 56
    public var nodeBorderWidth: CGFloat = 2

    public var nodeNormalColor: UIColor = JobsCor.systemGray3
    public var nodeSelectedColor: UIColor = JobsCor.systemBlue
    public var nodeErrorColor: UIColor = JobsCor.systemRed

    public var nodeFillSelectedColor: UIColor = JobsCor.systemBlue.withAlphaComponent(0.22)
    public var nodeFillErrorColor: UIColor = JobsCor.systemRed.withAlphaComponent(0.18)

    public var lineWidth: CGFloat = 6
    public var lineSelectedColor: UIColor = JobsCor.systemBlue
    public var lineErrorColor: UIColor = JobsCor.systemRed

    public var minimumPatternLength: Int = 4
    public var hapticsEnabled: Bool = true

    public init() {}
}
