//
//  CABasicAnimation.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/9/25.
//

import QuartzCore

extension CABasicAnimation {
    /// fromValue
    @discardableResult
    public func byFromValue(_ value: Any?) -> Self {
        self.fromValue = value
        return self
    }
    /// toValue
    @discardableResult
    public func byToValue(_ value: Any?) -> Self {
        self.toValue = value
        return self
    }
    /// byValue
    @discardableResult
    public func byByValue(_ value: Any?) -> Self {
        self.byValue = value
        return self
    }
}
