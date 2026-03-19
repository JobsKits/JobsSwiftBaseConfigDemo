//
//  UIScrollView+空态数据占位视图.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026/3/19.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBaseDefines
#if canImport(SnapKit)
import SnapKit

public enum JobsEmptyViewAuto {
    public enum Config {
        /// 全局默认空态视图提供器（可在 App 任意位置重写）
        /// 这是“View层”的默认能力；按钮文件依旧保留自己的按钮默认 provider。
        public static var defaultProvider: (() -> UIView)?
    }
}
var _jobsEmptyViewKey: UInt8 = 0
var _jobsEmptyViewProviderKey: UInt8 = 0
var _jobsEmptyViewLayoutKey: UInt8 = 0
public typealias JobsEmptyViewLayout = (UIView, ConstraintMaker, UIScrollView) -> Void
extension UIScrollView {
    // MARK: - Provider
    /// 链式：设置“本视图”的局部空态视图提供器
    /// 注意：这里会触发按钮系统的 swizzle，因为当前自动评估入口仍保留在按钮文件里
    @discardableResult
    public func byEmptyViewProvider(_ provider: @escaping () -> UIView) -> Self {
        JobsEmptyAuto.enable()
        objc_setAssociatedObject(
            self,
            &_jobsEmptyViewProviderKey,
            provider,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        )
        // 切换 provider 时，丢弃旧视图；下一次自动重建
        if let view = jobs_emptyView {
            view.removeFromSuperview()
            objc_setAssociatedObject(
                self,
                &_jobsEmptyViewKey,
                nil,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
        // 若当前挂着按钮，也一并移除，避免按钮/自定义View并存
        if let button = jobs_emptyButton {
            button.removeFromSuperview()
            objc_setAssociatedObject(
                self,
                &_jobsEmptyBtnKey,
                nil,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        };return self
    }
    /// 清除“本视图”的局部 View Provider（回退到全局默认）
    @discardableResult
    public func byClearEmptyViewProvider() -> Self {
        JobsEmptyAuto.enable()
        objc_setAssociatedObject(
            self,
            &_jobsEmptyViewProviderKey,
            nil,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        );return self
    }
    /// 内部读取：局部 View Provider
    var _jobs_localEmptyViewProvider: (() -> UIView)? {
        objc_getAssociatedObject(self, &_jobsEmptyViewProviderKey) as? (() -> UIView)
    }
    // MARK: - Layout
    /// 为当前 ScrollView 指定空态 View 布局
    @discardableResult
    public func byEmptyViewLayout(_ layout: @escaping JobsEmptyViewLayout) -> Self {
        JobsEmptyAuto.enable()
        objc_setAssociatedObject(
            self,
            &_jobsEmptyViewLayoutKey,
            layout,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        )

        if let view = jobs_emptyView {
            view.snp.remakeConstraints { [unowned self] make in
                layout(view, make, self)
            }
        };return self
    }
    /// 清除当前 ScrollView 的空态 View 布局
    @discardableResult
    public func byClearEmptyViewLayout() -> Self {
        objc_setAssociatedObject(
            self,
            &_jobsEmptyViewLayoutKey,
            nil,
            .OBJC_ASSOCIATION_COPY_NONATOMIC
        );return self
    }
    /// 内部读取：局部 View Layout
    var _jobs_emptyViewLayout: JobsEmptyViewLayout? {
        objc_getAssociatedObject(self, &_jobsEmptyViewLayoutKey) as? JobsEmptyViewLayout
    }
    // MARK: - State
    /// 当前挂载的空态 View（只读）
    public var jobs_emptyView: UIView? {
        objc_getAssociatedObject(self, &_jobsEmptyViewKey) as? UIView
    }
    // MARK: - Attach
    /// 挂载自定义空态 View（供按钮文件桥接调用）
    func _jobs_attachEmptyView(_ view: UIView) {
        // 若 view 原本挂在别处，先摘
        if let superview = view.superview, superview !== self {
            view.removeFromSuperview()
        }
        // 移除旧按钮
        if let oldButton = jobs_emptyButton {
            oldButton.removeFromSuperview()
            objc_setAssociatedObject(
                self,
                &_jobsEmptyBtnKey,
                nil,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
        // 移除旧 View
        if let oldView = jobs_emptyView {
            oldView.removeFromSuperview()
        }

        view
            .byAddTo(self) { [unowned self] make in
                if let layout = _jobs_emptyViewLayout {
                    layout(view, make, self)
                } else {
                    // 默认布局尽量对齐你按钮 attach 时的策略
                    make.centerY.equalToSuperview()
                    make.centerX.equalToSuperview().priority(.low)
                    make.width.lessThanOrEqualToSuperview().multipliedBy(0.9)
                    make.leading.greaterThanOrEqualToSuperview().offset(16).priority(.high)
                    make.trailing.lessThanOrEqualToSuperview().inset(16).priority(.high)
                }
            }
            .byBringToFront(self)
        objc_setAssociatedObject(
            self,
            &_jobsEmptyViewKey,
            view,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
    /// 当前正在使用的空态承载视图（内部桥接：优先 View，其次 Button）
    var _jobs_currentEmptyDisplayView: UIView? {
        jobs_emptyView ?? jobs_emptyButton
    }
}
#endif
