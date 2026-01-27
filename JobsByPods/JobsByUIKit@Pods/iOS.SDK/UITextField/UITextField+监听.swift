//
//  UITextField+监听.swift
//  Pods
//
//  Created by Jobs on 27/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
// MARK: - UITextField 点语法
extension UITextField {
    /// 输入监听（默认不限制）
    @discardableResult
    public func jobs_onInput(limit: Int? = nil,
                             _ callback: @escaping (_ char: String,
                                                    _ value: String,
                                                    _ mode: JobsTextInputMode,
                                                    _ isLimited: Bool) -> Void) -> Self {
        let obs = jobs_textInputObserver
        obs.limit = limit
        obs.onInput = callback
        // 绑定 delegate（保留并转发原 delegate）
        if delegate !== obs {
            obs.originalTextFieldDelegate = delegate
            delegate = obs
        };return self
    }
    /// 激活到输入态回调
    @discardableResult
    public func jobs_onBeginEditing(_ callback: @escaping (_ value: String) -> Void) -> Self {
        let obs = jobs_textInputObserver
        obs.onBegin = callback
        if delegate !== obs {
            obs.originalTextFieldDelegate = delegate
            delegate = obs
        };return self
    }
    /// 失去激活状态回调
    @discardableResult
    public func jobs_onEndEditing(_ callback: @escaping (_ value: String) -> Void) -> Self {
        let obs = jobs_textInputObserver
        obs.onEnd = callback
        if delegate !== obs {
            obs.originalTextFieldDelegate = delegate
            delegate = obs
        };return self
    }
}

