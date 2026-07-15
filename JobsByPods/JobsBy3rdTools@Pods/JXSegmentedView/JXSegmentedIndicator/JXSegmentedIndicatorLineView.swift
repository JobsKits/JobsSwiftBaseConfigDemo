//
//  JXSegmentedIndicatorLineView.swift
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
/// Line 指示器专属
 extension JXSegmentedIndicatorLineView {
    @discardableResult
    public func byLineStyle(_ s: JXSegmentedIndicatorLineStyle) -> Self {
        lineStyle = s
        return self
    }
    /// 仅对 `.lengthenOffset` 生效
    @discardableResult
     public func byLineScrollOffsetX(_ x: CGFloat) -> Self {
         lineScrollOffsetX = x
         return self
     }
}
#endif
