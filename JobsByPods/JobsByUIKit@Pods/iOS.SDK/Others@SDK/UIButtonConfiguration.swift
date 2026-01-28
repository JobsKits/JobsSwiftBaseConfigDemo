//
//  UIButtonConfiguration.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/8/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration {
    // ---------- 便捷风格切换 ----------
    @discardableResult public func byPlain() -> Self { .plain() }
    @discardableResult public func byGray() -> Self { .gray() }
    @discardableResult public func byTinted() -> Self { .tinted() }
    @discardableResult public func byFilled() -> Self { .filled() }
    @discardableResult public func byBorderless() -> Self { .borderless() }
    @discardableResult public func byBordered() -> Self { .bordered() }
    @discardableResult public func byBorderedTinted() -> Self { .borderedTinted() }
    @discardableResult public func byBorderedProminent() -> Self { .borderedProminent() }
    // ---------- 标题 / 副标题 ----------
    @discardableResult public func byTitle(_ title: String?) -> Self {
        var c = self; c.title = title; return c
    }
    @discardableResult public func byAttributedTitle(_ title: AttributedString?) -> Self {
        var c = self; c.attributedTitle = title; return c
    }
    @discardableResult public func bySubtitle(_ subtitle: String?) -> Self {
        var c = self; c.subtitle = subtitle; return c
    }
    @discardableResult public func byAttributedSubtitle(_ subtitle: AttributedString?) -> Self {
        var c = self; c.attributedSubtitle = subtitle; return c
    }
    @discardableResult public func byTitleAlignment(_ alignment: UIButton.Configuration.TitleAlignment) -> Self {
        var c = self; c.titleAlignment = alignment; return c
    }
    @discardableResult public func byTitlePadding(_ padding: CGFloat) -> Self {
        var c = self; c.titlePadding = padding; return c
    }
    // ---------- 颜色 ----------
    @discardableResult public func byBaseForegroundCor(_ color: UIColor?) -> Self {
        var c = self; c.baseForegroundColor = color; return c
    }
    @discardableResult public func byBaseBackgroundCor(_ color: UIColor?) -> Self {
        var c = self; c.baseBackgroundColor = color; return c
    }
    @discardableResult public func byImageColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var c = self; c.imageColorTransformer = transformer; return c
    }
    // ---------- 图像 ----------
    @discardableResult public func byImage(_ image: UIImage?) -> Self {
        var c = self; c.image = image; return c
    }
    @discardableResult public func byPreferredSymbolConfig(_ cfg: UIImage.SymbolConfiguration?) -> Self {
        var c = self; c.preferredSymbolConfigurationForImage = cfg; return c
    }
    /// 注意：类型是 NSDirectionalRectEdge（不是 UIButton.Configuration.ImagePlacement）
    @discardableResult public func byImagePlacement(_ placement: NSDirectionalRectEdge) -> Self {
        var c = self; c.imagePlacement = placement; return c
    }
    @discardableResult public func byImagePadding(_ padding: CGFloat) -> Self {
        var c = self; c.imagePadding = padding; return c
    }
    // ---------- 布局 / 尺寸 ----------
    @discardableResult public func byContentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        var c = self; c.contentInsets = insets; return c
    }
    @discardableResult public func bySetDefaultContentInsets() -> Self {
        var c = self; c.setDefaultContentInsets(); return c
    }
    @discardableResult public func byButtonSize(_ size: UIButton.Configuration.Size) -> Self {
        var c = self; c.buttonSize = size; return c
    }
    @discardableResult public func byCornerStyle(_ style: UIButton.Configuration.CornerStyle) -> Self {
        var c = self; c.cornerStyle = style; return c
    }
    // ---------- 行为 ----------
    @discardableResult public func byAutoUpdateForSelection(_ enabled: Bool) -> Self {
        var c = self; c.automaticallyUpdateForSelection = enabled; return c
    }
    @discardableResult public func byShowsActivity(_ show: Bool) -> Self {
        var c = self; c.showsActivityIndicator = show; return c
    }
    // ---------- iOS 16.0 + 指示器 ----------
    @available(iOS 16.0, tvOS 16.0, *)
    @discardableResult public func byIndicator(_ indicator: UIButton.Configuration.Indicator) -> Self {
        var c = self; c.indicator = indicator; return c
    }
    @available(iOS 16.0, tvOS 16.0, *)
    @discardableResult public func byIndicatorColorTransformer(_ transformer: UIConfigurationColorTransformer?) -> Self {
        var c = self; c.indicatorColorTransformer = transformer; return c
    }
    // ---------- iOS 26.0 + 符号转场 ----------
    @available(iOS 26.0, tvOS 26.0, *)
    @discardableResult public func bySymbolContentTransition(_ t: UISymbolContentTransition?) -> Self {
        var c = self; c.symbolContentTransition = t; return c
    }
    // ---------- 背景 ----------
    @discardableResult public func byBackground(_ background: UIBackgroundConfiguration) -> Self {
        var c = self; c.background = background; return c
    }
}
