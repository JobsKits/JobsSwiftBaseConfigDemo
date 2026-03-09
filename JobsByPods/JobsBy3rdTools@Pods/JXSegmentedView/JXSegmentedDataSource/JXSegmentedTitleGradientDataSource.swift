//
//  JXSegmentedTitleGradientDataSource.swift
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
// MARK: - TitleGradientDataSource
extension JXSegmentedTitleGradientDataSource {

    @discardableResult
    public func byTitleNormalGradientColors(_ v: [CGColor]) -> Self {
        titleNormalGradientColors = v
        return self
    }

    @discardableResult
    public func byTitleSelectedGradientColors(_ v: [CGColor]) -> Self {
        titleSelectedGradientColors = v
        return self
    }

    @discardableResult
    public func byTitleGradientStartPoint(_ v: CGPoint) -> Self {
        titleGradientStartPoint = v
        return self
    }

    @discardableResult
    public func byTitleGradientEndPoint(_ v: CGPoint) -> Self {
        titleGradientEndPoint = v
        return self
    }
}
#endif
