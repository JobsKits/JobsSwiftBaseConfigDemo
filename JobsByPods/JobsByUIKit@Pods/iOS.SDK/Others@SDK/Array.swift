//
//  Array.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 11/19/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC

extension Array {
    /// 安全读：越界返回 nil，不 crash
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    /// 不改原数组，返回一个新数组
    @discardableResult
    public func add(_ element: Element) -> [Element] {
        var copy = self
        copy.append(element)
        return copy
    }
    /// 改原数组
    public mutating func addBy(_ element: Element) {
        append(element)
    }
}
