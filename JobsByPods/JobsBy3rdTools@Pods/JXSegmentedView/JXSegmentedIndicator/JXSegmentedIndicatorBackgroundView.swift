//
//  JXSegmentedIndicatorBackgroundView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
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
