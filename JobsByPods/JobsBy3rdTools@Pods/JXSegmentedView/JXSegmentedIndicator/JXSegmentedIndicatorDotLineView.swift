//
//  JXSegmentedIndicatorDotLineView.swift
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
// MARK: - DotLine
extension JXSegmentedIndicatorDotLineView {
    @discardableResult
    public func byLineMaxWidth(_ v: CGFloat) -> Self {
        lineMaxWidth = v
        return self
    }
}
#endif
