//
//  JXSegmentedIndicatorRainbowLineView.swift
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
// MARK: - RainbowLine
extension JXSegmentedIndicatorRainbowLineView {
    @discardableResult
    public func byIndicatorColors(_ v: [UIColor]) -> Self {
        indicatorColors = v
        return self
    }
}
#endif
