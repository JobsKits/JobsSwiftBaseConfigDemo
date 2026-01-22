//
//  UIButton+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
// MARK: - 基础链式
public var _jobsTitleFontDictKey: UInt8 = 0
public var _jobsTitleFontHandlerInstalledKey: UInt8 = 0
public extension UIButton {
    @discardableResult
    public func byTitle(_ title: String?, for state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        if #available(iOS 15.0, *), var cfg = self.configuration {
            if state == .normal { cfg.title = title }
            self.configuration = cfg
            byUpdateConfig()
        };return self
    }

    @discardableResult
    public func byAttributedTitle(_ text: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(text, for: state)
        return self
    }

    @discardableResult
    public func byTitleFont(_ font: UIFont?) -> Self {
        self.titleLabel?.font = font
        if #available(iOS 15.0, *), self.configuration != nil {
            var cfg = self.configuration ?? .filled()
            cfg.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var attrs = incoming
                attrs.font = font
                return attrs
            }
            self.configuration = cfg
            byUpdateConfig()
        };return self
    }

    @discardableResult
    public func byTitleFont(_ font: UIFont?, for state: UIControl.State = .normal) -> Self {
        // legacy：至少 normal 立刻生效
        if state == .normal { self.titleLabel?.font = font }
        if #available(iOS 15.0, *), self.configuration != nil {
            _ensureTitleFontHandlerInstalled()
            var d = _titleFontDict
            d[state.rawValue] = font
            _titleFontDict = d
            setNeedsUpdateConfiguration()
            updateConfiguration()
            automaticallyUpdatesConfiguration = true
            return self
        }
        // iOS14 及以下：尽量用 attributedTitle 做 state 区分（前提：先 setTitle 再调这个）
        let t = self.title(for: state) ?? self.attributedTitle(for: state)?.string ?? ""
        if !t.isEmpty {
            var attrs: [NSAttributedString.Key: Any] = [.font: font ?? UIFont.systemFont(ofSize: 15)]
            if let c = self.titleColor(for: state) { attrs[.foregroundColor] = c }
            self.setAttributedTitle(NSAttributedString(string: t, attributes: attrs), for: state)
        };return self
    }

    @discardableResult
    public func byTitleColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        if #available(iOS 15.0, *), var cfg = self.configuration {
            if state == .normal {
                cfg.baseForegroundColor = color
                self.configuration = cfg
                byUpdateConfig()
            }
        };return self
    }

    @discardableResult
    public func byTitleShadowColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        self.setTitleShadowColor(color, for: state)
        return self
    }

    @discardableResult
    public func byImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func byPreferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?,
                                       forImageIn state: UIControl.State = .normal) -> Self {
        self.setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }

    @discardableResult
    public func byBackgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        #if DEBUG
        if image == nil { print("❗️byBackgroundImage: image is nil for state=\(state)") }
        #endif
        if #available(iOS 15.0, *), state == .normal {
            var cfg = self.configuration ?? .filled()
            if cfg.title == nil, let t = self.title(for: .normal), !t.isEmpty { cfg.title = t }
            if cfg.baseForegroundColor == nil, let tc = self.titleColor(for: .normal) { cfg.baseForegroundColor = tc }
            var bg = cfg.background
            bg.image = image
            bg.imageContentMode = .scaleAspectFill
            cfg.background = bg
            self.configuration = cfg
            byUpdateConfig()
        } else {
            self.setBackgroundImage(image, for: state)
        };return self
    }

    @discardableResult
    public func byBackgroundImageContentMode(_ mode: UIView.ContentMode) -> Self {
        if #available(iOS 15.0, *), var cfg = self.configuration {
            var bg = cfg.background
            bg.imageContentMode = mode         // .scaleAspectFill / .scaleAspectFit
            cfg.background = bg
            self.configuration = cfg
        };return self
    }

    @discardableResult
    public func byTintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func byUpdateConfig() -> Self {
        self.setNeedsUpdateConfiguration()
        self.updateConfiguration()
        self.automaticallyUpdatesConfiguration = true
        return self
    }
}

private extension UIButton {
    // state -> UIFont
    var _titleFontDict: [UInt: UIFont] {
        get { (objc_getAssociatedObject(self, &_jobsTitleFontDictKey) as? [UInt: UIFont]) ?? [:] }
        set { objc_setAssociatedObject(self, &_jobsTitleFontDictKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    @available(iOS 15.0, *)
    public func _ensureTitleFontHandlerInstalled() {
        if (objc_getAssociatedObject(self, &_jobsTitleFontHandlerInstalledKey) as? Bool) == true { return }
        objc_setAssociatedObject(self, &_jobsTitleFontHandlerInstalledKey, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        let existing = self.configurationUpdateHandler
        self.automaticallyUpdatesConfiguration = true

        self.configurationUpdateHandler = { [weak self] btn in
            existing?(btn)
            guard let self else { return }

            let st = btn.state
            var cfg = btn.configuration ?? .plain()
            // 主标题防丢（跟你 subtitle 那套一致）
            if cfg.title == nil,
               let t = btn.title(for: .normal),
               !t.isEmpty {
                cfg.title = t
            }
            // 取 state 对应字体，没找到就回退 normal
            let font = self._titleFontDict[st.rawValue] ?? self._titleFontDict[UIControl.State.normal.rawValue]
            if let font {
                cfg.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var a = incoming
                    a.font = font
                    return a
                }
            }
            btn.configuration = cfg
        }
    }
}
// MARK: - 进阶：按 state 的链式代理
public extension UIButton {
    final class StateProxy {
        fileprivate let button: UIButton
        let state: UIControl.State

        init(button: UIButton, state: UIControl.State) {
            self.button = button
            self.state = state
        }

        @discardableResult
        public func title(_ text: String?) -> UIButton { button.setTitle(text, for: state); return button }
        @discardableResult
        public func attributedTitle(_ text: NSAttributedString?) -> UIButton { button.setAttributedTitle(text, for: state); return button }
        @discardableResult
        public func titleColor(_ color: UIColor?) -> UIButton { button.setTitleColor(color, for: state); return button }
        @discardableResult
        public func titleShadowColor(_ color: UIColor?) -> UIButton { button.setTitleShadowColor(color, for: state); return button }
        @discardableResult
        public func image(_ image: UIImage?) -> UIButton { button.setImage(image, for: state); return button }

        @available(iOS 13.0, *)
        @discardableResult
        public func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) -> UIButton {
            button.setPreferredSymbolConfiguration(configuration, forImageIn: state); return button
        }

        @discardableResult
        public func backgroundColor(_ color: UIColor) -> UIButton {
            if #available(iOS 15.0, *), state == .normal {
                // ✅ 只写 baseBackgroundColor，避免触发 UIBackgroundConfiguration 的 dynamicMember
                var cfg = button.configuration ?? .plain()
                cfg.baseBackgroundColor = color
                button.configuration = cfg
                // 保险：某些 style 下 baseBackgroundColor 不会立刻体现在 layer 上
                button.backgroundColor = color
                button.byUpdateConfig()
            } else {
                button.setBackgroundColor(color, forState: state)
            };return button
        }

        @discardableResult
        public func backgroundImage(_ image: UIImage?) -> UIButton { button.setBackgroundImage(image, for: state); return button }

        @discardableResult
        public func subTitle(_ text: String?) -> UIButton { button.bySubTitle(text, for: state) }
        @discardableResult
        public func subTitleFont(_ font: UIFont) -> UIButton { button.bySubTitleFont(font, for: state) }
        @discardableResult
        public func subTitleColor(_ color: UIColor) -> UIButton { button.bySubTitleColor(color, for: state) }
    }

    func `for`(_ state: UIControl.State) -> StateProxy { StateProxy(button: self, state: state) }
}
// MARK: - 布局 / 外观
public extension UIButton {

    @discardableResult
    func byBackgroundColor(_ color: UIColor?,
                           for state: UIControl.State = .normal) -> Self {
        let c = color ?? .clear   // ✅ 统一 nil 语义：当作清空背景
        if #available(iOS 15.0, *), state == .normal {
            var cfg = self.configuration ?? .plain()
            // ✅ 不碰 cfg.background.xxx，只用 baseBackgroundColor
            cfg.baseBackgroundColor = c
            if cfg.title == nil, let t = self.title(for: .normal), !t.isEmpty { cfg.title = t }
            if cfg.baseForegroundColor == nil, let tc = self.titleColor(for: .normal) { cfg.baseForegroundColor = tc }
            self.configuration = cfg
            // ✅ 保险：某些配置下 baseBackgroundColor 不会立刻体现在 layer 上
            // 这里是 UIButton 自身属性，不涉及 iOS15-only API
            self.backgroundColor = c
            byUpdateConfig()
        } else {
            self.setBgCor(c, forState: state)
        };return self
    }
    
    @discardableResult
    public func byNormalBgColor(_ color: UIColor) -> Self { byBackgroundColor(color, for: .normal) }

    @discardableResult
    public func byNumberOfLines(_ lines: Int) -> Self { titleLabel?.numberOfLines = lines; return self }

    @discardableResult
    public func byLineBreakMode(_ mode: NSLineBreakMode) -> Self { titleLabel?.lineBreakMode = mode; return self }

    @discardableResult
    public func byTitleAlignment(_ alignment: NSTextAlignment) -> Self { titleLabel?.textAlignment = alignment; return self }

    @discardableResult
    public func byContentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            var cfg = configuration ?? .filled()
            cfg.contentInsets = insets
            configuration = cfg
            byUpdateConfig()
        } else {
            contentEdgeInsets = UIEdgeInsets(top: insets.top,
                                             left: insets.leading,
                                             bottom: insets.bottom,
                                             right: insets.trailing)
        };return self
    }

    @discardableResult
    public func byContentEdgeInsets(_ insets: UIEdgeInsets?) -> Self {
        let inset = insets ?? (UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        if #available(iOS 15.0, *) {
            var cfg = configuration ?? .filled()
            cfg.contentInsets = NSDirectionalEdgeInsets(top: inset.top,
                                                        leading: inset.left,
                                                        bottom: inset.bottom,
                                                        trailing: inset.right)
            configuration = cfg
            byUpdateConfig()
        } else {
            self.contentEdgeInsets = inset
        };return self
    }

    @discardableResult
    public func byImageEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            var cfg = configuration ?? .filled()
            cfg.imagePadding = (insets.left + insets.right) / 2
            configuration = cfg
            byUpdateConfig()
        } else {
            self.imageEdgeInsets = insets
        };return self
    }

    @discardableResult
    public func byTitleEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            var cfg = configuration ?? .filled()
            cfg.contentInsets = NSDirectionalEdgeInsets(top: insets.top,
                                                        leading: insets.left,
                                                        bottom: insets.bottom,
                                                        trailing: insets.right)
            configuration = cfg
            byUpdateConfig()
        } else {
            self.titleEdgeInsets = insets
        };return self
    }

    @discardableResult
    public func byBorder(color: UIColor, width: CGFloat) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    // MARK: - 阴影
    @discardableResult
    public func byMasksToBounds(radius: Bool) -> Self {
        layer.masksToBounds = radius
        return self
    }

    @discardableResult
    public func byShadow(color: UIColor = .black,
                  opacity: Float = 0.15,
                  radius: CGFloat = 6,
                  offset: CGSize = .init(width: 0, height: 2)) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.masksToBounds = false
        return self
    }
    /// 图文位置关系
    @available(iOS 13.0, *)
    @discardableResult
    public func byImagePlacement(_ placement: NSDirectionalRectEdge?, padding: CGFloat?) -> Self {
        let p = placement ?? .top
        let pad = padding ?? 8.0
        if #available(iOS 15.0, *) {
            var cfg = configuration ?? .filled()
            cfg.imagePlacement = p
            cfg.imagePadding = pad
            configuration = cfg
            byUpdateConfig()
        } else {
            switch placement {
            case .leading:  semanticContentAttribute = .forceLeftToRight
            case .trailing: semanticContentAttribute = .forceRightToLeft
            case .top, .bottom:
                let inset = pad / 2
                contentEdgeInsets = UIEdgeInsets(top: inset,
                                                 left: inset,
                                                 bottom: inset,
                                                 right: inset)
            default: break
            }
        };return self
    }
    
    @discardableResult
    func byImagePlacement(_ placement: JobsDirection,
                          padding: CGFloat = 8.0) -> Self {
        if #available(iOS 13.0, *) {
            return byImagePlacement(placement.toDirectionalEdge, padding: padding)
        } else {
            return byImagePlacementLegacy(placement, padding: padding)
        }
    }

    @discardableResult
    func byImagePlacementLegacy(_ placement: JobsDirection,
                                padding: CGFloat) -> Self {
        // 这里写你自己的 iOS12 布局策略（可简版）
        // 常见做法：根据 imageView/titleLabel 的 size 调整 edgeInsets
        // 你如果只想“能用”，做 top/left/right/bottom 四种就够
        // 示例：只处理左右（最常用），上下你按需补
        switch placement {
        case .left:
            // 默认就是左图右文，padding 可通过 contentEdgeInsets 兜底
            contentEdgeInsets = UIEdgeInsets(top: 0, left: padding/2, bottom: 0, right: padding/2)
        case .right:
            // 右图左文：交换 inset（需要依赖当前 intrinsic size，建议 layoutIfNeeded）
            layoutIfNeeded()
            let imageW = imageView?.bounds.width ?? 0
            let titleW = titleLabel?.bounds.width ?? 0
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleW + padding/2, bottom: 0, right: -(titleW + padding/2))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageW + padding/2), bottom: 0, right: imageW + padding/2)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: padding/2, bottom: 0, right: padding/2)
        case .top, .bottom:
            // 上下布局在 iOS12 用 insets 也能做，但要算高度
            // 你要的话我给你补一个稳定版本
            break
        };return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    public func byImagePlacement(_ placement: NSDirectionalRectEdge) -> Self {
        byImagePlacement(placement, padding: 8.0)
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func byConfiguration(_ build: (UIButton.Configuration) -> UIButton.Configuration) -> Self {
        let current = self.configuration ?? .filled()
        self.configuration = build(current)
        byUpdateConfig()
        return self
    }
}
// MARK: - 交互 / 菜单 / 角色 / Pointer / Config 生命周期
public extension UIButton {
    @available(iOS 14.0, *)
    @discardableResult
    public func byMenu(_ menu: UIMenu?) -> Self {
        self.menu = menu;
        return self
    }

    @available(iOS 13.4, *)
    @discardableResult
    public func byPointerInteractionEnabled(_ on: Bool) -> Self {
        self.isPointerInteractionEnabled = on;
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func byRole(_ role: UIButton.Role) -> Self {
        self.role = role;
        return self
    }

    @available(iOS 16.0, *)
    @discardableResult
    public func byPreferredMenuElementOrder(_ order: UIContextMenuConfiguration.ElementOrder) -> Self {
        self.preferredMenuElementOrder = order; return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func byChangesSelectionAsPrimaryAction(_ on: Bool) -> Self {
        self.changesSelectionAsPrimaryAction = on;
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func byAutomaticallyUpdatesConfiguration(_ on: Bool) -> Self {
        self.automaticallyUpdatesConfiguration = on;
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func byConfigurationUpdateHandler(_ handler: @escaping UIButton.ConfigurationUpdateHandler) -> Self {
        self.configurationUpdateHandler = handler;
        return self
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func bySetNeedsUpdateConfiguration() -> Self {
        self.setNeedsUpdateConfiguration();
        return self
    }
}
