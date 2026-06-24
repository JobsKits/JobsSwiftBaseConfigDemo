//
//  JXSegmentedNumberDataSource.swift
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
// MARK: - NumberDataSource
extension JXSegmentedNumberDataSource {

    @discardableResult
    public func byNumbers(_ v: [Int]) -> Self {
        numbers = v
        return self
    }

    @discardableResult
    public func byNumberWidthIncrement(_ v: CGFloat) -> Self {
        numberWidthIncrement = v
        return self
    }

    @discardableResult
    public func byNumberBackgroundColor(_ v: UIColor) -> Self {
        numberBackgroundColor = v
        return self
    }

    @discardableResult
    public func byNumberTextColor(_ v: UIColor) -> Self {
        numberTextColor = v
        return self
    }

    @discardableResult
    public func byNumberFont(_ v: UIFont) -> Self {
        numberFont = v
        return self
    }

    @discardableResult
    public func byNumberOffset(_ v: CGPoint) -> Self {
        numberOffset = v
        return self
    }

    @discardableResult
    public func byNumberHeight(_ v: CGFloat) -> Self {
        numberHeight = v
        return self
    }

    /// 自定义数字显示格式（比如 99+）
    @discardableResult
    public func byNumberStringFormatter(_ closure: ((Int) -> String)?) -> Self {
        numberStringFormatterClosure = closure
        return self
    }
}
#endif
