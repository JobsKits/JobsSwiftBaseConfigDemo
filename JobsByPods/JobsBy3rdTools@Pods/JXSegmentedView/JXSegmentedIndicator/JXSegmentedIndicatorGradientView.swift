//
//  JXSegmentedIndicatorGradientView.swift
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
// MARK: - Gradient (background gradient view)
extension JXSegmentedIndicatorGradientView {
    /// 宽度增量（历史命名兼容：gradientViewWidthIncrement 会同步到 indicatorWidthIncrement）
    @discardableResult
    public func byGradientViewWidthIncrement(_ v: CGFloat) -> Self {
        gradientViewWidthIncrement = v
        return self
    }

    @discardableResult
    public func byGradientColors(_ v: [CGColor]) -> Self {
        gradientColors = v
        return self
    }
}
#endif
