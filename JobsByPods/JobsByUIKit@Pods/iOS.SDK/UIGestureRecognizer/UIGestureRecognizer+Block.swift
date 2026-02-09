//
//  UIGestureRecognizer+Block.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
// ================================== 闭包容器 ==================================
private final class _GestureClosureBox {
    let block: (UIGestureRecognizer) -> Void
    init(_ block: @escaping (UIGestureRecognizer) -> Void) { self.block = block }
}
// ================================== UIGestureRecognizer 链式 block 初始化 ==================================
private var GestureBlockKey: UInt8 = 0
extension UIGestureRecognizer {
    // MARK: - 通过闭包配置（替代 target/selector）
    public static func byConfig(_ block: @escaping (UIGestureRecognizer) -> Void) -> Self {
        let gesture = Self()
        gesture._setActionBlock(block)
        gesture.addTarget(gesture, action: #selector(_gestureInvoke(_:)))
        return gesture
    }
    /// 允许：UIPanGestureRecognizer.byConfig { (gr: UIPanGestureRecognizer) in ... }
    public static func byConfig<T: UIGestureRecognizer>(_ block: @escaping (T) -> Void) -> Self {
        let gesture = Self()
        gesture._setActionBlock { sender in
            guard let typed = sender as? T else { return }
            block(typed)
        }
        gesture.addTarget(gesture, action: #selector(_gestureInvoke(_:)))
        return gesture
    }
    // MARK: - 为已有手势添加 block（非静态）
    @discardableResult
    public func byAction(_ block: @escaping (UIGestureRecognizer) -> Void) -> Self {
        _setActionBlock(block)
        addTarget(self, action: #selector(_gestureInvoke(_:)))
        return self
    }

    @objc
    private func _gestureInvoke(_ sender: UIGestureRecognizer) {
        (objc_getAssociatedObject(self, &GestureBlockKey) as? _GestureClosureBox)?.block(sender)
    }

    private func _setActionBlock(_ block: @escaping (UIGestureRecognizer) -> Void) {
        objc_setAssociatedObject(self, &GestureBlockKey, _GestureClosureBox(block), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
