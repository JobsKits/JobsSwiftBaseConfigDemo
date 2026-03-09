//
//  JXSegmentedIndicatorDoubleLineView.swift
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
// MARK: - DoubleLine
extension JXSegmentedIndicatorDoubleLineView {
    /// 双线指示器：最细时的线宽比例（0~1）
    @discardableResult
    public func byMinLineWidthPercent(_ v: CGFloat) -> Self {
        minLineWidthPercent = v
        return self
    }
}
#endif
