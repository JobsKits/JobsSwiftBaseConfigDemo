//
//  UIEdgeInsets.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

extension UIEdgeInsets {

    @discardableResult
    public mutating func byTop(_ value: CGFloat) -> Self {
        top = value
        return self
    }

    @discardableResult
    public mutating func byLeft(_ value: CGFloat) -> Self {
        left = value
        return self
    }

    @discardableResult
    public mutating func byBottom(_ value: CGFloat) -> Self {
        bottom = value
        return self
    }

    @discardableResult
    public mutating func byRight(_ value: CGFloat) -> Self {
        right = value
        return self
    }
}
