//
//  JXSegmentedIndicatorRainbowLineView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
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
