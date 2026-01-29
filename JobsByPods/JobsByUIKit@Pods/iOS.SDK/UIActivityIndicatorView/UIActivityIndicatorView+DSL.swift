//
//  UIActivityIndicatorView+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/16.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

extension UIActivityIndicatorView {
    @discardableResult
    public func byStyle(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }

    @discardableResult
    public func byColor(_ color: UIColor) -> Self {
        self.color = color
        return self
    }

    @discardableResult
    public func start() -> Self {
        self.startAnimating()
        return self
    }

    @discardableResult
    public func stop() -> Self {
        self.stopAnimating()
        return self
    }

    @discardableResult
    public func byHidesWhenStopped(_ hides: Bool) -> Self {
        self.hidesWhenStopped = hides
        return self
    }
}
