//
//  UINavigationBarAppearance.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 11/28/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
@available(iOS 15.0, *)
extension UINavigationBarAppearance {
    // ================================== 标题（inline title） ==================================
    /// 设置普通标题字体
    @discardableResult
    public func byTitleFont(_ font: UIFont?) -> Self {
        if let font {
            titleTextAttributes[.font] = font
        } else {
            titleTextAttributes.removeValue(forKey: .font)
        };return self
    }
    /// 设置普通标题颜色
    @discardableResult
    public func byTitleColor(_ color: UIColor?) -> Self {
        if let color {
            titleTextAttributes[.foregroundColor] = color
        } else {
            titleTextAttributes.removeValue(forKey: .foregroundColor)
        };return self
    }
    /// 整体设置普通标题的 attributes
    @discardableResult
    public func byTitleAttributes(_ attrs: [NSAttributedString.Key: Any]) -> Self {
        titleTextAttributes = attrs
        return self
    }
    /// 标题位置微调
    @discardableResult
    public func byTitlePositionAdjustment(_ offset: UIOffset) -> Self {
        titlePositionAdjustment = offset
        return self
    }
    // ================================== 大标题（large title） ==================================
    /// 设置大标题字体
    @discardableResult
    public func byLargeTitleFont(_ font: UIFont?) -> Self {
        if let font {
            largeTitleTextAttributes[.font] = font
        } else {
            largeTitleTextAttributes.removeValue(forKey: .font)
        };return self
    }
    /// 设置大标题颜色
    @discardableResult
    public func byLargeTitleColor(_ color: UIColor?) -> Self {
        if let color {
            largeTitleTextAttributes[.foregroundColor] = color
        } else {
            largeTitleTextAttributes.removeValue(forKey: .foregroundColor)
        };return self
    }
    /// 整体设置大标题 attributes
    @discardableResult
    public func byLargeTitleAttributes(_ attrs: [NSAttributedString.Key: Any]) -> Self {
        largeTitleTextAttributes = attrs
        return self
    }
    // ================================== 副标题（iOS 26+） ==================================
    /// 副标题文本 attributes
    @discardableResult
    @available(iOS 26.0, *)
    public func bySubtitleAttributes(_ attrs: [NSAttributedString.Key: Any]) -> Self {
        subtitleTextAttributes = attrs
        return self
    }

    @discardableResult
    @available(iOS 26.0, *)
    public func bySubtitleFont(_ font: UIFont?) -> Self {
        if let font {
            subtitleTextAttributes[.font] = font
        } else {
            subtitleTextAttributes.removeValue(forKey: .font)
        };return self
    }

    @discardableResult
    @available(iOS 26.0, *)
    public func bySubtitleColor(_ color: UIColor?) -> Self {
        if let color {
            subtitleTextAttributes[.foregroundColor] = color
        } else {
            subtitleTextAttributes.removeValue(forKey: .foregroundColor)
        };return self
    }
    /// 大标题下副标题
    @discardableResult
    @available(iOS 26.0, *)
    public func byLargeSubtitleAttributes(_ attrs: [NSAttributedString.Key: Any]) -> Self {
        largeSubtitleTextAttributes = attrs
        return self
    }
    // ================================== Back 指示图标 ==================================
    /// 同时设置 backIndicatorImage / transitionMaskImage
    @discardableResult
    public func byBackIndicator(_ image: UIImage?, mask: UIImage? = nil) -> Self {
        setBackIndicatorImage(image, transitionMaskImage: mask ?? image)
        return self
    }
    // ================================== 按钮外观 ==================================
    /// 配置普通按钮外观
    @discardableResult
    public func byButtonAppearance(_ builder: jobsByBarButtonItemAppearanceBlock) -> Self {
        builder(buttonAppearance)
        return self
    }
    /// 配置「突出」按钮外观（UIBarButtonItemStyleProminent）
    @discardableResult
    public func byProminentButtonAppearance(_ builder: jobsByBarButtonItemAppearanceBlock) -> Self {
        builder(prominentButtonAppearance)
        return self
    }
    /// 配置返回按钮外观
    @discardableResult
    public func byBackButtonAppearance(_ builder: jobsByBarButtonItemAppearanceBlock) -> Self {
        builder(backButtonAppearance)
        return self
    }
    /// 配置 done 按钮外观（13.0~25.x）
    @discardableResult
    public func byDoneButtonAppearance(_ builder: jobsByBarButtonItemAppearanceBlock) -> Self {
        builder(doneButtonAppearance)
        return self
    }
}
