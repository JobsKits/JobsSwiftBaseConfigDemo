//
//  UITextView+监听.swift
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
// MARK: - UITextView 点语法
extension UITextView {
    /// 输入监听（默认不限制）
    @discardableResult
    public func jobs_onInput(limit: Int? = nil,
                             _ callback: @escaping (_ char: String,
                                                    _ value: String,
                                                    _ mode: JobsTextInputMode,
                                                    _ isLimited: Bool,
                                                    _ text: String,
                                                    _ tv: UITextView) -> Void) -> Self {
        let obs = jobs_textInputObserver
        obs.limit = limit
        obs.onInput = { [weak self] char, value, mode, isLimited in
            guard let self else { return }
            callback(char, value, mode, isLimited, self.text ?? "", self)
        }
        if delegate !== obs {
            obs.originalTextViewDelegate = delegate
            delegate = obs
        };return self
    }
    /// 激活到输入态回调
    @discardableResult
    public func jobs_onBeginEditing(_ callback: @escaping (_ value: String) -> Void) -> Self {
        let obs = jobs_textInputObserver
        obs.onBegin = callback
        if delegate !== obs {
            obs.originalTextViewDelegate = delegate
            delegate = obs
        };return self
    }
    /// 失去激活状态回调
    @discardableResult
    public func jobs_onEndEditing(_ callback: @escaping (_ value: String) -> Void) -> Self {
        let obs = jobs_textInputObserver
        obs.onEnd = callback
        if delegate !== obs {
            obs.originalTextViewDelegate = delegate
            delegate = obs
        };return self
    }
}
