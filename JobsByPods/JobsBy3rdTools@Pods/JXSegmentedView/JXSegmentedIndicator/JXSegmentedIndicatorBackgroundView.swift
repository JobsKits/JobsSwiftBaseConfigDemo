//
//  JXSegmentedIndicatorBackgroundView.swift
//  Pods
//
//  Created by Jobs on 9/3/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
// MARK: - Background
extension JXSegmentedIndicatorBackgroundView {
    /// 兼容旧命名：backgroundWidthIncrement（内部会同步到 indicatorWidthIncrement）
    @discardableResult
    public func byBackgroundWidthIncrement(_ v: CGFloat) -> Self {
        backgroundWidthIncrement = v
        return self
    }
}
#endif
