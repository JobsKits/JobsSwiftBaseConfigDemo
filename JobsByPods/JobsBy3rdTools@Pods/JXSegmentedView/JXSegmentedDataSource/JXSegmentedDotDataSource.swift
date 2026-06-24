//
//  JXSegmentedDotDataSource.swift
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
// MARK: - DotDataSource
extension JXSegmentedDotDataSource {

    @discardableResult
    public func byDotStates(_ v: [Bool]) -> Self {
        dotStates = v
        return self
    }

    @discardableResult
    public func byDotSize(_ v: CGSize) -> Self {
        dotSize = v
        return self
    }

    @discardableResult
    public func byDotCornerRadius(_ v: CGFloat) -> Self {
        dotCornerRadius = v
        return self
    }

    @discardableResult
    public func byDotColor(_ v: UIColor) -> Self {
        dotColor = v
        return self
    }

    @discardableResult
    public func byDotOffset(_ v: CGPoint) -> Self {
        dotOffset = v
        return self
    }
}
#endif
