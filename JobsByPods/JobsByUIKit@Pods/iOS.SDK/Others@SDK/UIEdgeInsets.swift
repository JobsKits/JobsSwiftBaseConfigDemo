//
//  UIEdgeInsets.swift
//  Pods
//
//  Created by Jobs on 19/3/26.
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
