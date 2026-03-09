//
//  JXSegmentedIndicatorDotLineView.swift
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
// MARK: - DotLine
extension JXSegmentedIndicatorDotLineView {
    @discardableResult
    public func byLineMaxWidth(_ v: CGFloat) -> Self {
        lineMaxWidth = v
        return self
    }
}
#endif
