//
//  UIView+修改位置大小.swift
//  JobsByUIKit
//
//  Created by Jobs on 12/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
// MARK: 直接修改
extension UIView {
    
    @discardableResult
    public func byFrame(_ f: CGRect) -> Self {
        frame = f
        return self
    }
    
    @discardableResult
    public func byFrame(x: CGFloat? = nil,
                        y: CGFloat? = nil,
                        width: CGFloat? = nil,
                        height: CGFloat? = nil) -> Self {
        var f = frame
        if let x = x { f.origin.x = x }
        if let y = y { f.origin.y = y }
        if let w = width { f.size.width = w }
        if let h = height { f.size.height = h }
        frame = f
        return self
    }
    
    @discardableResult
    public func byFrame(origin: CGPoint? = nil,
                        size: CGSize? = nil) -> Self {
        var f = frame
        if let origin { f.origin = origin }
        if let size { f.size = size }
        frame = f
        return self
    }
    
    @discardableResult
    func byFrame(_ patch: FramePatch) -> Self {
        var f = frame
        if let x = patch.x { f.origin.x = x }
        if let y = patch.y { f.origin.y = y }
        if let w = patch.width { f.size.width = w }
        if let h = patch.height { f.size.height = h }
        frame = f
        return self
    }
    
    @discardableResult
    public func byOrigin(_ point: CGPoint) -> Self {
        frame.origin = point
        return self
    }
    
    @discardableResult
    public func bySize(_ size: CGSize) -> Self {
        frame.size = size
        return self
    }
    /// 允许在链式调用里“根据自身当前状态”计算 size
    @discardableResult
    public func bySize(_ make: (Self) -> CGSize) -> Self {
        sizeToFit()
        frame.size = make(self)
        return self
    }

    @discardableResult
    public func byBounds(_ b: CGRect) -> Self {
        bounds = b
        return self
    }

    @discardableResult
    public func byCenter(_ c: CGPoint) -> Self {
        center = c
        return self
    }

    @discardableResult
    public func bySize(width: CGFloat, height: CGFloat) -> Self {
        frame.size = CGSize(width: width, height: height)
        return self
    }

    @discardableResult
    public func byWidth(_ width: CGFloat) -> Self {
        var f = frame
        f.size.width = width
        frame = f
        return self
    }

    @discardableResult
    public func byHeight(_ height: CGFloat) -> Self {
        var f = frame
        f.size.height = height
        frame = f
        return self
    }
}
// MARK: 偏移量修改
extension UIView {
    /// 在当前 frame 基础上整体偏移（位置 + 尺寸）
    @discardableResult
    public func byFrameOffset(dx: CGFloat = 0,
                              dy: CGFloat = 0,
                              dw: CGFloat = 0,
                              dh: CGFloat = 0) -> Self {
        var f = frame
        f.origin.x += dx; f.origin.y += dy
        f.size.width += dw; f.size.height += dh
        frame = f
        return self
    }
    /// 在当前宽度基础上叠加偏移（正负皆可）
    @discardableResult
    public func byWidthOffset(_ delta: CGFloat) -> Self {
        var f = frame
        f.size.width += delta
        frame = f
        return self
    }
    /// 在当前高度基础上叠加偏移（正负皆可）
    @discardableResult
    public func byHeightOffset(_ delta: CGFloat) -> Self {
        var f = frame
        f.size.height += delta
        frame = f
        return self
    }
    /// 同时对宽高做偏移（正负皆可）
    @discardableResult
    public func bySizeOffset(width dw: CGFloat = 0,height dh: CGFloat = 0) -> Self {
        var f = frame
        f.size.width += dw
        f.size.height += dh
        frame = f
        return self
    }
    /// 在当前中心点基础上叠加偏移
    @discardableResult
    public func byCenterOffset(dx: CGFloat = 0, dy: CGFloat = 0) -> Self {
        center = CGPoint(x: center.x + dx, y: center.y + dy)
        return self
    }
    /// 在当前 x/y 基础上叠加偏移
    @discardableResult
    public func byOriginOffset(dx: CGFloat = 0, dy: CGFloat = 0) -> Self {
        var f = frame
        f.origin.x += dx
        f.origin.y += dy
        frame = f
        return self
    }
    @discardableResult
    public func byOriginXOffset(_ dx: CGFloat = 0) -> Self {
        var f = frame
        f.origin.x += dx
        frame = f
        return self
    }
    @discardableResult
    public func byOriginYOffset(_ dy: CGFloat = 0) -> Self {
        var f = frame; f.origin.y += dy; frame = f
        return self
    }
}
