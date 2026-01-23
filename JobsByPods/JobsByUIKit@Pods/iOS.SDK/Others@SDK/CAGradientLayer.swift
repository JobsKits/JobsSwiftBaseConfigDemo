//
//  CAGradientLayer.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBaseDefines
// MARK: - Direction
public extension CAGradientLayer {
    /// 快捷设置渐变方向
    @discardableResult
    func byDirection(_ d: JobsGradientDirection) -> Self {
        switch d {
        case .leftToRight:
            startPoint = .init(x: 0, y: 0.5)
            endPoint   = .init(x: 1, y: 0.5)
        case .rightToLeft:
            startPoint = .init(x: 1, y: 0.5)
            endPoint   = .init(x: 0, y: 0.5)
        case .topToBottom:
            startPoint = .init(x: 0.5, y: 0)
            endPoint   = .init(x: 0.5, y: 1)
        case .bottomToTop:
            startPoint = .init(x: 0.5, y: 1)
            endPoint   = .init(x: 0.5, y: 0)
        case .topLeftToBottomRight:
            startPoint = .init(x: 0, y: 0)
            endPoint   = .init(x: 1, y: 1)
        case .bottomRightToTopLeft:
            startPoint = .init(x: 1, y: 1)
            endPoint   = .init(x: 0, y: 0)
        case .topRightToBottomLeft:
            startPoint = .init(x: 1, y: 0)
            endPoint   = .init(x: 0, y: 1)
        case .bottomLeftToTopRight:
            startPoint = .init(x: 0, y: 1)
            endPoint   = .init(x: 1, y: 0)
        case let .custom(start, end):
            startPoint = start
            endPoint   = end
        };return self
    }
}
