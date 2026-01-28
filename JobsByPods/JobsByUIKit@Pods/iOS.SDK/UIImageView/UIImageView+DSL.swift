//
//  UIImageView+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - UIImageView 链式封装
extension UIImageView {
    // MARK: 图片
    @discardableResult
    public func byImage(_ img: UIImage?) -> Self {
        image = img
        return self
    }
    // MARK: 高亮图片
    @discardableResult
    public func byHighlightedImage(_ image: UIImage?) -> Self {
        highlightedImage = image
        return self
    }
    // MARK: 是否可交互 UIView.byUserInteractionEnabled
    // MARK: 是否高亮
    @discardableResult
    public func byHighlighted(_ highlighted: Bool = true) -> Self {
        isHighlighted = highlighted
        return self
    }
    // MARK: 动画图片组
    @discardableResult
    public func byAnimationImages(_ images: [UIImage]?) -> Self {
        animationImages = images
        return self
    }
    // MARK: 高亮状态动画图片组
    @discardableResult
    public func byHighlightedAnimationImages(_ images: [UIImage]?) -> Self {
        highlightedAnimationImages = images
        return self
    }
    // MARK: 动画时长
    @discardableResult
    public func byAnimationDuration(_ duration: TimeInterval) -> Self {
        animationDuration = duration
        return self
    }
    // MARK: 动画重复次数
    @discardableResult
    public func byAnimationRepeatCount(_ count: Int) -> Self {
        animationRepeatCount = count
        return self
    }
    // MARK: Tint 颜色（支持 SF Symbol / 模板渲染）
    @discardableResult
    public func byTintColor(_ color: UIColor?) -> Self {
        tintColor = color
        return self
    }
    // MARK: iOS13+ Symbol 配置
    @available(iOS 13.0, *)
    @discardableResult
    public func bySymbolConfig(_ config: UIImage.SymbolConfiguration?) -> Self {
        preferredSymbolConfiguration = config
        return self
    }
    // MARK: - HDR 动态范围 (iOS17+)
    @available(iOS 17.0, *)
    @discardableResult
    public func byPreferredImageDynamicRange(_ range: UIImage.DynamicRange) -> Self {
        preferredImageDynamicRange = range
        return self
    }
    // MARK: - 启动动画
    @discardableResult
    public func startAnimation() -> Self {
        startAnimating()
        return self
    }
    // MARK: - 停止动画
    @discardableResult
    public func stopAnimation() -> Self {
        stopAnimating()
        return self
    }
}
