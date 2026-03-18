//
//  NSObject+Builder.swift
//  Pods
//
//  Created by Jobs on 18/3/26.
//

import Foundation

extension NSObject {
    /// 可选值构建：builder 返回 nil 时跳过设置
    @discardableResult
    func _byApplyOptional<Value>(
        _ builder: () -> Value?,
        setter: (Value) -> Void
    ) -> Self {
        if let value = builder() {
            setter(value)
        };return self
    }
    /// 非可选值构建：一定会执行设置
    @discardableResult
    func _byApplyValue<Value>(
        _ builder: () -> Value,
        setter: (Value) -> Void
    ) -> Self {
        setter(builder())
        return self
    }
}
