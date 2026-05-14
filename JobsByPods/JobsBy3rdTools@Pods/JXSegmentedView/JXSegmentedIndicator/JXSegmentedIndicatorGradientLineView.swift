//
//  JXSegmentedIndicatorGradientLineView.swift
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
// MARK: - GradientLine
extension JXSegmentedIndicatorGradientLineView {

    @discardableResult
    public func byColors(_ v: [UIColor]) -> Self {
        colors = v
        return self
    }

    @discardableResult
    public func byStartPoint(_ v: CGPoint) -> Self {
        startPoint = v
        return self
    }

    @discardableResult
    public func byEndPoint(_ v: CGPoint) -> Self {
        endPoint = v
        return self
    }

    @discardableResult
    public func byLocations(_ v: [NSNumber]?) -> Self {
        locations = v
        return self
    }
}
#endif
