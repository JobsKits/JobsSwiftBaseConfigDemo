//
//  GestureUnlockConfiguration.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

import UIKit

public struct GestureUnlockConfiguration {
    public var gridDimension: Int = 3

    /// 节点直径（实际会按布局自动取 min(该值, spacing*0.65)）
    public var nodeDiameter: CGFloat = 56
    public var nodeBorderWidth: CGFloat = 2

    public var nodeNormalColor: UIColor = .systemGray3
    public var nodeSelectedColor: UIColor = .systemBlue
    public var nodeErrorColor: UIColor = .systemRed

    public var nodeFillSelectedColor: UIColor = UIColor.systemBlue.withAlphaComponent(0.22)
    public var nodeFillErrorColor: UIColor = UIColor.systemRed.withAlphaComponent(0.18)

    public var lineWidth: CGFloat = 6
    public var lineSelectedColor: UIColor = .systemBlue
    public var lineErrorColor: UIColor = .systemRed

    public var minimumPatternLength: Int = 4
    public var hapticsEnabled: Bool = true

    public init() {}
}
