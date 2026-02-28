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

import ObjectiveC
import JobsSwiftBaseDefines
// MARK: - 基础链式
private var _jobsTitleFontDictKey: UInt8 = 0
private var _jobsTitleColorDictKey: UInt8 = 0
private var _jobsTitleFontHandlerInstalledKey: UInt8 = 0
private var _jobsConfigPatchHandlerInstalledKey: UInt8 = 0
private var _jobsConfigPatchListKey: UInt8 = 0
private var _jobsLegacyImagePlacementKey: UInt8 = 0
private var _jobsTitleEdgeInsets15Key: UInt8 = 0
private var kBgColorMapKey: UInt8 = 0
extension UIButton {
    // MARK: - iOS12 legacy imagePlacement 标记（用于让后续 contentEdgeInsets.top 真正生效）
    private enum _JobsLegacyImagePlacement: Int {
        case none = 0
        case top = 1
        case bottom = 2
        case left = 3
        case right = 4
    }
        
    private var _jobsLegacyImagePlacement: _JobsLegacyImagePlacement {
        get {
            let v = (objc_getAssociatedObject(self, &_jobsLegacyImagePlacementKey) as? Int) ?? 0
            return _JobsLegacyImagePlacement(rawValue: v) ?? .none
        }
        set {
            objc_setAssociatedObject(self, &_jobsLegacyImagePlacementKey, newValue.rawValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // MARK: - Legacy Insets Shift Helper (iOS 14 and below)
    private func _jobsShiftEdgeInsets(_ e: UIEdgeInsets, dx: CGFloat, dy: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: e.top + dy,
                     left: e.left + dx,
                     bottom: e.bottom - dy,
                     right: e.right - dx)
    }
    /// When legacy imagePlacement(.top/.bottom/.left/.right) has been applied on iOS 12,
    /// changing contentEdgeInsets should also shift image/title insets, otherwise the legacy negative offsets can "push back".
    private func _jobsSyncLegacyInsetsIfNeeded(old: UIEdgeInsets, new: UIEdgeInsets) {
        switch _jobsLegacyImagePlacement {
        case .top, .bottom:
            let dy = new.top - old.top
            guard dy != 0 else { return }
            self.imageEdgeInsets = _jobsShiftEdgeInsets(self.imageEdgeInsets, dx: 0, dy: dy)
            self.titleEdgeInsets = _jobsShiftEdgeInsets(self.titleEdgeInsets, dx: 0, dy: dy)
        case .left:
            _jobsLegacyImagePlacement = .left
            let dx = new.left - old.left
            guard dx != 0 else { return }
            self.imageEdgeInsets = _jobsShiftEdgeInsets(self.imageEdgeInsets, dx: dx, dy: 0)
            self.titleEdgeInsets = _jobsShiftEdgeInsets(self.titleEdgeInsets, dx: dx, dy: 0)
        case .right:
            _jobsLegacyImagePlacement = .right
            // Increasing right inset should shift content to the left (negative dx)
            let dx = -(new.right - old.right)
            guard dx != 0 else { return }
            self.imageEdgeInsets = _jobsShiftEdgeInsets(self.imageEdgeInsets, dx: dx, dy: 0)
            self.titleEdgeInsets = _jobsShiftEdgeInsets(self.titleEdgeInsets, dx: dx, dy: 0)
        case .none:
            return
        }
    }
    
    @discardableResult
    public func byTitle(_ title: String?, for state: UIControl.State = .normal) -> Self {
        // ✅ 不管什么系统版本，先把 legacy title 写进去，给 handler 同步用
        self.setTitle(title, for: state)
        if #available(iOS 15.0, *) {
            var cfg = self.configuration ?? .plain()
            // ✅ 立即让当前显示的 title 生效：
            // - normal：直接写 cfg.title
            // - selected：如果当前已经 selected，也写 cfg.title
            if state == .normal {
                cfg.title = title
            } else if state == .selected, self.isSelected {
                cfg.title = title
            }
            self.configuration = cfg
            _ensureUnifiedUpdateHandlerInstalled()
            byUpdateConfig()
        };return self
    }
    
    @discardableResult
    public func byAttributedTitle(_ text: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(text, for: state)
        return self
    }
    /// 记录某个 state 的标题字体（iOS15+ 会在 handler 内生效；iOS14- 同步 titleLabel.font + attributedTitle）
    @discardableResult
    public func byTitleFont(_ font: UIFont?, for state: UIControl.State = .normal) -> Self {

        // 记录 state -> font（给 iOS15+ update handler 使用）
        if let font {
            _titleFontDict[state.rawValue] = font
        } else {
            _titleFontDict.removeValue(forKey: state.rawValue)
        }

        // iOS15+：走 configurationUpdateHandler，不要再用 legacy attributedTitle 去覆盖
        if #available(iOS 15.0, tvOS 15.0, *) {
            // 这句不是必须，但加上更稳：有些场景 titleLabel 仍然参与计算/展示
            self.titleLabel?.font = font

            _ensureUnifiedUpdateHandlerInstalled()
            byUpdateConfig()
            return self
        }
        // iOS14 及以下：legacy
        // 1) 先把 titleLabel.font 设置上（你要的“肯定需要”就在这里）
        self.titleLabel?.font = font
        // 2) 用 attributedTitle 补齐常用状态，避免按下/选中/禁用时回系统字体
        let syncStates: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for st in syncStates {
            // 如果该状态你已经手动设置过 attributedTitle，就别覆盖
            if self.attributedTitle(for: st) != nil { continue }
            // 优先取该状态的 title，取不到回退 normal
            let t = self.title(for: st) ?? self.title(for: .normal) ?? ""
            if t.isEmpty { continue }

            var attrs: [NSAttributedString.Key: Any] = [
                .font: font ?? UIFont.systemFont(ofSize: 15)
            ]
            // 颜色：优先该状态，取不到回退 normal
            if let c = self.titleColor(for: st) ?? self.titleColor(for: .normal) {
                attrs[.foregroundColor] = c
            }
            self.setAttributedTitle(NSAttributedString(string: t, attributes: attrs), for: st)
        };return self
    }
    /// 记录某个 state 的标题颜色（iOS15+ 走 configuration；iOS14- 走 setTitleColor）
    @discardableResult
    public func byTitleColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        if #available(iOS 15.0, tvOS 15.0, *) {
            // iOS15+：不要 setTitleColor（会和 configuration 打架）
            if let color {
                _titleColorDict[state.rawValue] = color
            } else {
                _titleColorDict.removeValue(forKey: state.rawValue)
            }
            _ensureUnifiedUpdateHandlerInstalled()
            byUpdateConfig()
        } else {
            setTitleColor(color, for: state)
        };return self
    }
    /// 主标题和副标题之间的距离（兼容 iOS12+）
    @discardableResult
    public func byTitlePadding(_ value: CGFloat) -> Self {
        _jobsTitlePadding = value
        if #available(iOS 15.0, *) {
            configuration = (configuration ?? .plain()).byTitlePadding(value)
            byUpdateConfig()
        } else {
            // iOS 12–14：重新应用 legacy composite
            _applyLegacyComposite(for: .normal)
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
        if #available(iOS 15.0, *) {
            self.configuration = (self.configuration ?? .plain()).byImage(self.image(for: self.isSelected ? .selected : .normal) ?? self.image(for: .normal) ?? image)
            _ensureUnifiedUpdateHandlerInstalled()
            byUpdateConfig()
        };return self
    }
    
    @discardableResult
    public func byBgImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func byPreferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?,
                                               forImageIn state: UIControl.State = .normal) -> Self {
        self.setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }
    
    @available(iOS 15.0, *)
    @discardableResult
    public func byConfiguration(_ cfg: UIButton.Configuration?) -> Self {
        self.configuration = cfg
        return self
    }

    @discardableResult
    public func byBackgroundImageContentMode(_ mode: UIView.ContentMode) -> Self {
        if #available(iOS 15.0, *), var cfg = self.configuration {
            self.configuration = cfg.byBackground(cfg.background.byImageContentMode(mode))// .scaleAspectFill / .scaleAspectFit
        };return self
    }

    @discardableResult
    public func byTintColor(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }
    /// UIButton：按下高亮时是否自动调整图片（默认 true，会变暗/发亮）
    @discardableResult
    public func byAdjustsImageWhenHighlighted(_ on: Bool?) -> Self {
        adjustsImageWhenHighlighted = on ?? false
        return self
    }
    /// UIButton：按下时是否显示系统“触摸高亮”（默认 false，但你项目里可能被打开过）
    @discardableResult
    public func byShowsTouchWhenHighlighted(_ on: Bool?) -> Self {
        showsTouchWhenHighlighted = on ?? false
        return self
    }
    
    @discardableResult
    public func byUpdateConfig() -> Self {
        if #available(iOS 15.0, *) {
            self.setNeedsUpdateConfiguration()
            self.updateConfiguration()
            self.automaticallyUpdatesConfiguration = true
        } else {
            // iOS14-：走 legacy 刷新，足够让 title/image 切换
            self.setNeedsLayout()
            self.layoutIfNeeded()
        };return self
    }
}

extension UIButton {
    // MARK: - state -> UIFont
    private var _titleFontDict: [UInt: UIFont] {
        get { (objc_getAssociatedObject(self, &_jobsTitleFontDictKey) as? [UInt: UIFont]) ?? [:] }
        set { objc_setAssociatedObject(self, &_jobsTitleFontDictKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    // MARK: - state -> UIColor (Title color)
    private var _titleColorDict: [UInt: UIColor] {
        get { (objc_getAssociatedObject(self, &_jobsTitleColorDictKey) as? [UInt: UIColor]) ?? [:] }
        set { objc_setAssociatedObject(self, &_jobsTitleColorDictKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    // MARK: - Configuration patch list
    @available(iOS 15.0, tvOS 15.0, *)
    typealias _JobsCfgPatch = (UIButton.Configuration) -> UIButton.Configuration

    @available(iOS 15.0, tvOS 15.0, *)
    private var _jobsCfgPatches: [_JobsCfgPatch] {
        get { (objc_getAssociatedObject(self, &_jobsConfigPatchListKey) as? [_JobsCfgPatch]) ?? [] }
        set { objc_setAssociatedObject(self, &_jobsConfigPatchListKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    /// iOS15+：注册一个 configuration patch（会在 update handler 内执行）
    @available(iOS 15.0, tvOS 15.0, *)
    @discardableResult
    func ensureConfigUpdateHandler(_ patch: @escaping _JobsCfgPatch) -> Self {
        _jobsCfgPatches.append(patch)
        _ensureUnifiedUpdateHandlerInstalled()
        return self
    }
    // MARK: - Install unified configurationUpdateHandler (iOS15+)
    @available(iOS 15.0, tvOS 15.0, *)
    private func _ensureUnifiedUpdateHandlerInstalled() {
        if (objc_getAssociatedObject(self, &_jobsConfigPatchHandlerInstalledKey) as? Bool) == true { return }
        objc_setAssociatedObject(
            self,
            &_jobsConfigPatchHandlerInstalledKey,
            true,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.automaticallyUpdatesConfiguration = true
        // 保存旧 handler（避免递归）
        let previousHandler = self.configurationUpdateHandler
        self.configurationUpdateHandler = { [weak self] btn in
            previousHandler?(btn)
            guard let self else { return }
            var cfg = btn.configuration ?? .plain()
            // ---------- title：拆状态优先级（避免组合态取不到） ----------
            func pickTitle() -> String? {
                if !btn.isEnabled, let t = btn.title(for: .disabled), !t.isEmpty { return t }
                if btn.isSelected, let t = btn.title(for: .selected), !t.isEmpty { return t }
                if btn.isHighlighted, let t = btn.title(for: .highlighted), !t.isEmpty { return t }
                if let t = btn.title(for: .normal), !t.isEmpty { return t }
                return nil
            }
            if let t = pickTitle() {
                cfg.title = t
            }
            // 查不到就别动 cfg.title，避免把字清空
            // ---------- image：拆状态优先级 ----------
            func pickImage() -> UIImage? {
                if !btn.isEnabled, let i = btn.image(for: .disabled) { return i }
                if btn.isSelected, let i = btn.image(for: .selected) { return i }
                if btn.isHighlighted, let i = btn.image(for: .highlighted) { return i }
                return btn.image(for: .normal)
            }
            if let img = pickImage() {
                cfg.image = img
            }
            // ---------- patches ----------
            let patches = self._jobsCfgPatches
            if !patches.isEmpty {
                for p in patches { cfg = p(cfg) }
            }
            // ---------- font：拆状态优先级 ----------
            let font =
                (!btn.isEnabled ? self._titleFontDict[UIControl.State.disabled.rawValue] : nil)
                ?? (btn.isSelected ? self._titleFontDict[UIControl.State.selected.rawValue] : nil)
                ?? (btn.isHighlighted ? self._titleFontDict[UIControl.State.highlighted.rawValue] : nil)
                ?? self._titleFontDict[UIControl.State.normal.rawValue]
            // ---------- color：拆状态优先级 ----------
            let color =
                (!btn.isEnabled ? self._titleColorDict[UIControl.State.disabled.rawValue] : nil)
                ?? (btn.isSelected ? self._titleColorDict[UIControl.State.selected.rawValue] : nil)
                ?? (btn.isHighlighted ? self._titleColorDict[UIControl.State.highlighted.rawValue] : nil)
                ?? self._titleColorDict[UIControl.State.normal.rawValue]
            // ---------- 合并 transformer：font + color 同时写（避免互相覆盖） ----------
            if font != nil || color != nil {
                cfg = cfg
                    .byTitleTextAttributesTransformer(
                        UIConfigurationTextAttributesTransformer { incoming in
                            var a = incoming
                            if let font { a.font = font }
                            if let color { a.foregroundColor = color }
                            return a
                        }
                    )
            };btn.configuration = cfg
        }
    }
}
// MARK: - 进阶：按 state 的链式代理
extension UIButton {
    
    public func `for`(_ state: UIControl.State) -> StateProxy {
        StateProxy(button: self, state: state)
    }
    
    public final class StateProxy {
        
        fileprivate let button: UIButton
        let state: UIControl.State

        init(button: UIButton, state: UIControl.State) {
            self.button = button
            self.state = state
        }

        @discardableResult
        public func title(_ text: String?) -> UIButton {
            button.setTitle(text, for: state)
            return button
        }
        
        @discardableResult
        public func attributedTitle(_ text: NSAttributedString?) -> UIButton {
            button.setAttributedTitle(text, for: state)
            return button
        }
        
        @discardableResult
        public func titleColor(_ color: UIColor?) -> UIButton {
            button.setTitleColor(color, for: state)
            return button
        }
        
        @discardableResult
        public func titleShadowColor(_ color: UIColor?) -> UIButton {
            button.setTitleShadowColor(color, for: state)
            return button
        }
        
        @discardableResult
        public func image(_ image: UIImage?) -> UIButton {
            button.setImage(image, for: state)
            return button
        }

        @available(iOS 13.0, *)
        @discardableResult
        public func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) -> UIButton {
            button.setPreferredSymbolConfiguration(configuration, forImageIn: state)
            return button
        }

        @discardableResult
        public func backgroundColor(_ color: UIColor) -> UIButton {
            if #available(iOS 15.0, *), state == .normal {
                // ✅ 只写 baseBackgroundColor，避免触发 UIBackgroundConfiguration 的 dynamicMember
                button.byConfiguration((button.configuration ?? .plain()).byBaseBackgroundColor(color))
                    .byBackgroundColor(color)// 保险：某些 style 下 baseBackgroundColor 不会立刻体现在 layer 上
                    .byUpdateConfig()
            } else {
                button.setBackgroundColor(color, forState: state)
            };return button
        }

        @discardableResult
        public func backgroundImage(_ image: UIImage?) -> UIButton { button.setBackgroundImage(image, for: state); return button
        }

        @discardableResult
        public func subTitle(_ text: String?) -> UIButton { button.bySubTitle(text, for: state) }
        /// 副标题富文本（按 state）
        @discardableResult
        public func attributedSubTitle(_ text: NSAttributedString?) -> UIButton {
            button.byAttributedSubTitle(text, for: state)
        }

        @discardableResult
        public func subTitleFont(_ font: UIFont) -> UIButton {
            button.bySubTitleFont(font, for: state)
        }
        
        @discardableResult
        public func subTitleColor(_ color: UIColor) -> UIButton {
            button.bySubTitleColor(color, for: state)
        }
    }
}
// MARK: - 布局 / 外观
extension UIButton {
    @discardableResult
    public func byClearConfigurationBackground() -> Self {
        if #available(iOS 15.0, *) {
            return byConfiguration { cfg in
                var c = cfg
                c.background = .clear()
                return c
            }
        };return self
    }
    
    @discardableResult
    public func byNormalBgColor(_ color: UIColor) -> Self {
        byBackgroundColor(color, for: .normal)
    }

    @discardableResult
    public func byNumberOfLines(_ lines: Int) -> Self {
        titleLabel?.numberOfLines = lines; return self
    }

    @discardableResult
    public func byLineBreakMode(_ mode: NSLineBreakMode) -> Self {
        titleLabel?.lineBreakMode = mode; return self
    }

    @discardableResult
    public func byTitleAlignment(_ alignment: NSTextAlignment) -> Self {
        titleLabel?.textAlignment = alignment; return self
    }

    @discardableResult
    public func byContentInsets(_ insets: NSDirectionalEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            configuration = (configuration ?? .plain()).byContentInsets(insets)
            byUpdateConfig()
        } else {
            let newInset = UIEdgeInsets(top: insets.top,
                                        left: insets.leading,
                                        bottom: insets.bottom,
                                        right: insets.trailing)
            self.contentEdgeInsets = newInset
            _jobsSyncLegacyInsetsIfNeeded(old: self.contentEdgeInsets,new: newInset)
        };return self
    }
    
    @discardableResult
    public func byContentEdgeInsets(_ insets: UIEdgeInsets?) -> Self {
        let inset = insets ?? (UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        if #available(iOS 15.0, *) {
            configuration = (configuration ?? .plain()).byContentInsets(NSDirectionalEdgeInsets(top: inset.top,
                                                                                                leading: inset.left,
                                                                                                bottom: inset.bottom,
                                                                                                trailing: inset.right))
            byUpdateConfig()
        } else {
            // iOS 14 and below: keep legacy behavior.
            // If legacy imagePlacement has been applied (esp. .top/.bottom with negative offsets),
            // updating contentEdgeInsets should also shift image/title insets to avoid being "pushed back".
            self.contentEdgeInsets = inset
            _jobsSyncLegacyInsetsIfNeeded(old: self.contentEdgeInsets, new: inset)
        };return self
    }

    @discardableResult
    public func byImageEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            configuration = (configuration ?? .plain()).byImagePadding((insets.left + insets.right) / 2)
            byUpdateConfig()
        } else {
            self.imageEdgeInsets = insets
        };return self
    }

    @discardableResult
    public func byTitleEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            // UIButton.Configuration 本身并没有真正的 titleEdgeInsets
            // 这里先记录这个需求，然后在 update handler 中通过 baselineOffset 的方式近似实现标题的垂直偏移效果。
            objc_setAssociatedObject(
                self,
                &_jobsTitleEdgeInsets15Key,
                insets,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            _ensureUnifiedUpdateHandlerInstalled()
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
    public func byMasksToBounds(_ radius: Bool) -> Self {
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
    @discardableResult
    public func byImagePlacement(_ placement: JobsDirection,
                                 padding: CGFloat = 8.0) -> Self {
        if #available(iOS 13.0, *) {
            return byImagePlacement(placement.toDirectionalEdge, padding: padding)
        } else {
            return byImagePlacementLegacy(placement, padding: padding)
        }
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func byImagePlacement(_ placement: NSDirectionalRectEdge?, padding: CGFloat?) -> Self {
        let p = placement ?? .top
        let pad = padding ?? 8.0
        if #available(iOS 15.0, *) {
            var cfg = configuration ?? .plain()
            // ✅ 同步：老式 API 设置过的 title/image → cfg
            let state: UIControl.State = isSelected ? .selected : .normal
            // title
            if cfg.title == nil || cfg.title?.isEmpty == true {
                if let t = title(for: state), !t.isEmpty {
                    cfg.title = t
                } else if let t = title(for: .normal), !t.isEmpty {
                    cfg.title = t
                }
            }
            // image
            if cfg.image == nil {
                cfg.image = image(for: state) ?? image(for: .normal)
            }
            // ✅ 同步：颜色/字体（Configuration 更推荐 attributedTitle）
            // 如果你不想做复杂的 attributedTitle，这段可以先不加；
            // 但你现在“没字”的问题，title 同步就够解决大多数情况。
            if cfg.attributedTitle == nil {
                let t = cfg.title ?? ""
                if !t.isEmpty {
                    var attrs: [NSAttributedString.Key: Any] = [:]
                    if let font = titleLabel?.font { attrs[.font] = font }
                    let color = titleColor(for: state) ?? titleColor(for: .normal)
                    if let color { attrs[.foregroundColor] = color }
                    cfg.attributedTitle = AttributedString(NSAttributedString(string: t, attributes: attrs))
                    // 注意：你如果设置了 attributedTitle，系统会优先用它
                }
            }
            cfg.imagePlacement = p // 图文关系
            cfg.imagePadding = pad // 图文距离
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
    public func byImagePlacementLegacy(_ placement: JobsDirection,
                                       padding: CGFloat) -> Self {
        // iOS12: 用 edgeInsets 模拟 imagePlacement
        // 依赖 imageView/titleLabel 的尺寸，所以先 layout 一次
        layoutIfNeeded()
        let imageW = imageView?.bounds.width ?? 0
        let imageH = imageView?.bounds.height ?? 0
        let titleW = titleLabel?.bounds.width ?? 0
        let titleH = titleLabel?.bounds.height ?? 0
        // 兜底：避免 0 尺寸导致算不出（尤其是刚 setTitle/setImage 但还没 layout）
        // 这里不强行 sizeToFit，尽量不破坏外部约束体系
        func safeImageSize() -> (w: CGFloat, h: CGFloat) {
            if imageW > 0, imageH > 0 { return (imageW, imageH) }
            let s = imageView?.intrinsicContentSize ?? .zero
            return (max(0, s.width), max(0, s.height))
        }
        func safeTitleSize() -> (w: CGFloat, h: CGFloat) {
            if titleW > 0, titleH > 0 { return (titleW, titleH) }
            let s = titleLabel?.intrinsicContentSize ?? .zero
            return (max(0, s.width), max(0, s.height))
        }
        let img = safeImageSize()
        let ttl = safeTitleSize()
        _jobsLegacyImagePlacement = .none
        switch placement {
        case .left:
            _jobsLegacyImagePlacement = .left
            _jobsLegacyImagePlacement = .none
            // 默认就是左图右文：只做间距 + 轻量内边距
            imageEdgeInsets = .zero
            titleEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: -padding)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: padding / 2, bottom: 0, right: padding / 2)
        case .right:
            _jobsLegacyImagePlacement = .right
            _jobsLegacyImagePlacement = .none
            // 右图左文：互换位置（靠 insets 平移）
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: ttl.w + padding / 2,
                                           bottom: 0,
                                           right: -(ttl.w + padding / 2))
            titleEdgeInsets = UIEdgeInsets(top: 0,
                                           left: -(img.w + padding / 2),
                                           bottom: 0,
                                           right: img.w + padding / 2)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: padding / 2, bottom: 0, right: padding / 2)
        case .top:
            _jobsLegacyImagePlacement = .top
            _jobsLegacyImagePlacement = .top
            // 上图下文：
            imageEdgeInsets = UIEdgeInsets(top: -(ttl.h + padding) / 2,
                                           left: (ttl.w) / 2,
                                           bottom: (ttl.h + padding) / 2,
                                           right: -(ttl.w) / 2)
            titleEdgeInsets = UIEdgeInsets(top: (img.h + padding) / 2,
                                           left: -(img.w) / 2,
                                           bottom: -(img.h + padding) / 2,
                                           right: (img.w) / 2)
            let vPad = (img.h + ttl.h + padding) / 2
            let hPad = max(img.w, ttl.w) / 2
            contentEdgeInsets = UIEdgeInsets(top: vPad / 2,
                                             left: hPad / 2,
                                             bottom: vPad / 2,
                                             right: hPad / 2)
        case .bottom:
            _jobsLegacyImagePlacement = .bottom
            _jobsLegacyImagePlacement = .bottom
            imageEdgeInsets = UIEdgeInsets(top: (ttl.h + padding) / 2,
                                           left: (ttl.w) / 2,
                                           bottom: -(ttl.h + padding) / 2,
                                           right: -(ttl.w) / 2)

            titleEdgeInsets = UIEdgeInsets(top: -(img.h + padding) / 2,
                                           left: -(img.w) / 2,
                                           bottom: (img.h + padding) / 2,
                                           right: (img.w) / 2)
            let vPad = (img.h + ttl.h + padding) / 2
            let hPad = max(img.w, ttl.w) / 2
            contentEdgeInsets = UIEdgeInsets(top: vPad / 2,
                                             left: hPad / 2,
                                             bottom: vPad / 2,
                                             right: hPad / 2)
        };return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func byImagePlacement(_ placement: NSDirectionalRectEdge) -> Self {
        byImagePlacement(placement, padding: 8.0)
    }

    @available(iOS 15.0, *)
    @discardableResult
    public func byConfiguration(_ build: @escaping (UIButton.Configuration) -> UIButton.Configuration) -> Self {
        _ensureUnifiedUpdateHandlerInstalled()
        var patches = _jobsCfgPatches
        patches.append(build)
        _jobsCfgPatches = patches
        let current = self.configuration ?? .plain()
        self.configuration = build(current)
        byUpdateConfig()
        return self
    }
}
// MARK: - 交互 / 菜单 / 角色 / Pointer / Config 生命周期
extension UIButton {
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
// MARK: - imageView 外观链式
extension UIButton {
    /// imageView 内容模式
    @discardableResult
    public func byImageViewContentMode(_ mode: UIView.ContentMode) -> Self {
        self.imageView?.contentMode = mode
        return self
    }
    /// imageView 背景色
    @discardableResult
    public func byImageViewBackgroundColor(_ color: UIColor?) -> Self {
        self.imageView?.backgroundColor = color
        return self
    }
    /// imageView 圆角（可配合 masksToBounds）
    @discardableResult
    public func byImageViewCornerRadius(_ radius: CGFloat) -> Self {
        self.imageView?.layer.cornerRadius = radius
        return self
    }
    /// imageView 是否裁剪
    @discardableResult
    public func byImageViewMasksToBounds(_ on: Bool) -> Self {
        self.imageView?.layer.masksToBounds = on
        return self
    }
    /// 一步到位：图标圆底（你现在那 4 行就用这个）
    @discardableResult
    public func byImageCircleBackground(_ bgColor: UIColor?,
                                        radius: CGFloat,
                                        contentMode: UIView.ContentMode = .center,
                                        masksToBounds: Bool = true) -> Self {
        self.imageView?.contentMode = contentMode
        self.imageView?.backgroundColor = bgColor
        self.imageView?.layer.cornerRadius = radius
        self.imageView?.layer.masksToBounds = masksToBounds
        return self
    }
}

extension UIButton {
    @available(iOS 15.0, *)
    public func byToNS(_ a: AttributedString) -> NSAttributedString {
        NSAttributedString(a)
    }

    @available(iOS 15.0, *)
    public func byToSwift(_ a: NSAttributedString) -> AttributedString {
        AttributedString(a)
    }
}
