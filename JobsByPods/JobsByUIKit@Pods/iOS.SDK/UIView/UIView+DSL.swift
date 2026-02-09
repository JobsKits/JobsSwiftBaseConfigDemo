//
//  UIView+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: 语法糖🍬
extension UIView {
    // MARK: 设置UI
    /// 统一在一个回调里配置 layer
    @discardableResult
    public func byLayer(_ config: (CALayer) -> Void) -> Self {
        config(layer)
        return self
    }

    @discardableResult
    public func byAddArranged(to stack: UIStackView) -> Self {
        stack.addArrangedSubview(self)
        return self
    }

    @discardableResult
    public func byInsertSublayer(_ layer: CALayer, at index: UInt32) -> Self {
        layer.insertSublayer(layer, at: index)
        return self
    }

    @discardableResult
    public func byInsertSublayer(_ layer: CALayer, below sibling: CALayer?) -> Self {
        layer.insertSublayer(layer, below: sibling)
        return self
    }

    @discardableResult
    public func byInsertSublayer(_ layer: CALayer, above sibling: CALayer?) -> Self {
        layer.insertSublayer(layer, above: sibling)
        return self
    }

    @discardableResult
    public func byHidden(_ hidden: Bool) -> Self {
        isHidden = hidden
        return self
    }

    @discardableResult
    public func byAlpha(_ a: CGFloat) -> Self {
        alpha = a
        return self
    }
    /// 是否可见：true 显示；false 隐藏（折叠布局）
    @MainActor
    @discardableResult
    public func byVisible(_ visible: Bool) -> Self {
        self.byHidden(!visible)
        self.byAlpha(visible ? 1 : 0)
        return self
    }
    /// 统一圆角：按钮走 UIButton.Configuration 方案，其他视图保持原始 layer 逻辑
    @discardableResult
    public func byCornerRadius(_ radius: CGFloat?) -> Self {
        let r = max(0, radius ?? 0.0)
        // === 按钮：套用 byBtnCornerRadius 的实现（maskedCorners=nil, isContinuous=true） ===
        if let btn = self as? UIButton {
            if #available(iOS 15.0, *), var cfg = btn.configuration {
                cfg.cornerStyle = .fixed
                var bg = cfg.background
                bg.cornerRadius = r
                cfg.background = bg
                btn.configuration = cfg
            }
            btn.layer.cornerRadius = r
            if #available(iOS 13.0, *) {
                btn.layer.cornerCurve = .continuous
            }
            // maskedCorners 默认不传（等同 nil），因此这里不改 maskedCorners
            btn.clipsToBounds = (r > 0)
            return self
        }
        // === 非按钮 ===
        self.layer.cornerRadius = r
        return self
    }
    // MARK: 设置Layer
    /// 裁剪超出边界
    @discardableResult
    public func byClipsToBounds(_ enabled: Bool = true) -> Self {
        clipsToBounds = enabled
        return self
    }

    @discardableResult
    public func byMasksToBounds(_ masksToBounds: Bool?) -> Self {
        layer.masksToBounds = masksToBounds ?? false
        return self
    }

    @discardableResult
    public func byBorderColor(_ color: UIColor?) -> Self {
        layer.borderColor = color?.cgColor   // 传 nil 会清掉边框颜色
        if color == nil { layer.borderWidth = 0 }
        return self
    }

    @discardableResult
    public func byZPosition(_ z: CGFloat) -> Self {
        layer.zPosition = z
        return self
    }

    @discardableResult
    public func byBorderWidth(_ width: CGFloat) -> Self {
        layer.borderWidth = width
        return self
    }
    // 单项：半径
    @discardableResult
    public func byShadowRadius(_ radius: CGFloat) -> Self {
        layer.shadowRadius = radius
        return self
    }

    @discardableResult
    public func byShadowColor(_ color: UIColor?) -> Self {
        layer.shadowColor = color?.cgColor
        return self
    }

    @discardableResult
    public func byShadowOpacity(_ opacity: Float = 0.0) -> Self {
        layer.shadowOpacity = opacity
        return self
    }

    @discardableResult
    public func byShadowOffset(_ offset: CGSize = CGSizeZero) -> Self {
        layer.shadowOffset = offset
        return self
    }
    // MARK: - UIView · Geometry / Transform / Scale / Touch
    /// 几何
    @discardableResult
    public func byFrame(_ f: CGRect) -> Self {
        frame = f
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
    /// 2D/3D 变换
    @discardableResult
    public func byTransform(_ transf: CGAffineTransform) -> Self {
        transform = transf
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func byTransform3D(_ t3d: CATransform3D) -> Self {
        transform3D = t3d
        return self
    }
    /// 缩放因子（渲染分辨率）
    @available(iOS 4.0, *)
    @discardableResult
    public func byContentScaleFactor(_ scale: CGFloat) -> Self {
        contentScaleFactor = scale
        return self
    }
    /// 锚点（注意：会影响 frame，需要配合 position/center 调整）
    @available(iOS 16.0, *)
    @discardableResult
    public func byAnchorPoint(_ anchor: CGPoint) -> Self {
        anchorPoint = anchor
        return self
    }
    /// 触摸行为
    @discardableResult
    public func byMultipleTouchEnabled(_ enabled: Bool) -> Self {
        isMultipleTouchEnabled = enabled
        return self
    }

    @discardableResult
    public func byExclusiveTouch(_ enabled: Bool) -> Self {
        isExclusiveTouch = enabled
        return self
    }
    // MARK: 尺寸@绝对设置
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
    public func bySize(width: CGFloat, height: CGFloat) -> Self {
        frame.size = CGSize(width: width, height: height)
        return self
    }

    @discardableResult
    public func byWidth(_ width: CGFloat) -> Self {
        var f = frame; f.size.width = width; frame = f
        return self
    }

    @discardableResult
    public func byHeight(_ height: CGFloat) -> Self {
        var f = frame; f.size.height = height; frame = f
        return self
    }
    // MARK: 尺寸@相对偏移叠加
    /// 在当前宽度基础上叠加偏移（正负皆可）
    @discardableResult
    public func byWidthOffset(_ delta: CGFloat) -> Self {
        var f = frame; f.size.width += delta; frame = f
        return self
    }
    /// 在当前高度基础上叠加偏移（正负皆可）
    @discardableResult
    public func byHeightOffset(_ delta: CGFloat) -> Self {
        var f = frame; f.size.height += delta; frame = f
        return self
    }
    /// 同时对宽高做偏移（正负皆可）
    @discardableResult
    public func bySizeOffset(width dw: CGFloat = 0,height dh: CGFloat = 0) -> Self {
        var f = frame; f.size.width += dw; f.size.height += dh; frame = f
        return self
    }
    // MARK: Frame@绝对设置
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
    // MARK: Frame@相对偏移叠加
    /// 在当前 x/y 基础上叠加偏移
    @discardableResult
    public func byOriginOffset(dx: CGFloat = 0, dy: CGFloat = 0) -> Self {
        var f = frame; f.origin.x += dx; f.origin.y += dy; frame = f
        return self
    }
    @discardableResult
    public func byOriginXOffset(_ dx: CGFloat = 0) -> Self {
        var f = frame; f.origin.x += dx; frame = f
        return self
    }
    @discardableResult
    public func byOriginYOffset(_ dy: CGFloat = 0) -> Self {
        var f = frame; f.origin.y += dy; frame = f
        return self
    }
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
    // MARK: 位置
    @discardableResult
    public func byOrigin(_ point: CGPoint) -> Self {
        frame.origin = point
        return self
    }
    /// 在当前中心点基础上叠加偏移
    @discardableResult
    public func byCenterOffset(dx: CGFloat = 0, dy: CGFloat = 0) -> Self {
        center = CGPoint(x: center.x + dx, y: center.y + dy)
        return self
    }
    // MARK: - UIView · Subview Hierarchy
    /// 添加子视图（链式）✅ 返回调用者（父视图）
    @discardableResult
    public func byAddSubviewRetSuper(_ view: UIView) -> Self {
        addSubview(view)
        return self //
    }
    /// 添加子视图（链式）✅ 返回子视图
    @discardableResult
    public func byAddSubviewRetSub<T: UIView>(_ view: T) -> T {
        addSubview(view)
        return view
    }
    /// 在指定层级插入 ✅ 返回调用者（父视图）
    @discardableResult
    public func byInsertSubview(_ view: UIView, at index: Int) -> Self {
        insertSubview(view, at: index)
        return self
    }
    /// 在指定层级插入 ✅ 返回子视图
    @discardableResult
    public func byInsertSubviewRetSub<T: UIView>(_ view: T, at index: Int) -> T {
        insertSubview(view, at: index)
        return view
    }
    /// 在某视图之下插入 ✅ 返回调用者（父视图）
    @discardableResult
    public func byInsertSubview(_ view: UIView, below sibling: UIView) -> Self {
        insertSubview(view, belowSubview: sibling)
        return self
    }
    /// 在某视图之下插入 ✅ 返回子视图
    @discardableResult
    public func byInsertSubviewRetSub<T: UIView>(_ view: T, below sibling: UIView) -> T {
        insertSubview(view, belowSubview: sibling)
        return view
    }
    /// 在某视图之上插入 ✅ 返回调用者（父视图）
    @discardableResult
    public func byInsertSubview(_ view: UIView, above sibling: UIView) -> Self {
        insertSubview(view, aboveSubview: sibling)
        return self
    }
    /// 在某视图之上插入 ✅ 返回子视图
    @discardableResult
    public func byInsertSubviewRetSub<T: UIView>(_ view: T, above sibling: UIView) -> T {
        insertSubview(view, aboveSubview: sibling)
        return view
    }
    /// 交换两个下标的子视图 ✅ 返回调用者（父视图）
    @discardableResult
    public func byExchangeSubview(at i: Int, with j: Int) -> Self {
        exchangeSubview(at: i, withSubviewAt: j)
        return self
    }
    /// 置顶 ✅ 返回调用者（父视图）
    @discardableResult
    public func byBringToFront(_ view: UIView) -> Self {
        bringSubviewToFront(view)
        return self
    }
    /// 置顶 ✅ 返回子视图
    @discardableResult
    public func byBringToFrontRetSub<T: UIView>(_ view: T) -> T {
        bringSubviewToFront(view)
        return view
    }
    /// 置底 ✅ 返回调用者（父视图）
    @discardableResult
    public func bySendToBack(_ view: UIView) -> Self {
        sendSubviewToBack(view)
        return self
    }
    /// 置底 ✅ 返回子视图
    @discardableResult
    public func bySendToBackRetSub<T: UIView>(_ view: T) -> T {
        sendSubviewToBack(view)
        return view
    }
    /// 移除自身 ✅ 返回调用者（父视图）
    @discardableResult
    public func byRemoveFromSuperview() -> Self {
        removeFromSuperview()
        return self
    }
    /// 移除所有子视图（便捷）
    @discardableResult
    public func byRemoveAllSubviews() -> Self {
        subviews.forEach { $0.removeFromSuperview() }
        return self
    }
    // MARK: - UIView · Autoresizing / Layout Margins / Safe Area
    /// 是否对子视图做 autoresize
    @discardableResult
    public func byAutoresizesSubviews(_ enabled: Bool) -> Self {
        autoresizesSubviews = enabled
        return self
    }
    /// 自伸缩掩码
    @discardableResult
    public func byAutoresizingMask(_ mask: UIView.AutoresizingMask) -> Self {
        autoresizingMask = mask
        return self
    }
    /// 传统 layoutMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func byLayoutMargins(_ insets: UIEdgeInsets) -> Self {
        layoutMargins = insets
        return self
    }
    /// 方向化的 layoutMargins（更现代）
    @available(iOS 11.0, *)
    @discardableResult
    public func byDirectionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = insets
        return self
    }
    /// 是否继承父视图的 layoutMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func byPreservesSuperviewLayoutMargins(_ enabled: Bool) -> Self {
        preservesSuperviewLayoutMargins = enabled
        return self
    }
    /// 是否将 safeArea 纳入 layoutMargins 计算
    @available(iOS 11.0, *)
    @discardableResult
    public func byInsetsLayoutMarginsFromSafeArea(_ enabled: Bool) -> Self {
        insetsLayoutMarginsFromSafeArea = enabled
        return self
    }
    // MARK: - UIView · Layout Triggers
    /// 标记需要布局
    @discardableResult
    public func bySetNeedsLayout() -> Self {
        setNeedsLayout()
        return self
    }
    /// 立即布局
    @discardableResult
    public func byLayoutIfNeeded() -> Self {
        layoutIfNeeded()
        return self
    }
    /// 自适应到指定尺寸（仅设置，不触发布局）
    @discardableResult
    public func bySizeThatFits(_ size: CGSize) -> Self {
        _ = sizeThatFits(size)
        return self
    }
    /// 自身尺寸适配
    @discardableResult
    public func bySizeToFit() -> Self {
        sizeToFit()
        return self
    }
    // MARK: 其他
    @discardableResult
    public func byContentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode;
        return self
    }

    @discardableResult
    public func byTag(_ T: Int) -> Self {
        tag = T
        return self
    }

    @discardableResult
    public func byUserInteractionEnabled(_ enabled: Bool?) -> Self {
        isUserInteractionEnabled = enabled ?? false
        return self
    }
    /// 手势封装：添加手势以后返回这个手势本身@常用于链式调用
    @discardableResult
    public func jobs_addGestureRetView<T: UIGestureRecognizer>(_ gesture: T?) -> Self {
        guard let gesture = gesture else { return self }
        addGestureRecognizer(gesture)
        return self
    }
    /// 手势封装：添加手势以后返回这个手势本身@常用于链式调用
    @discardableResult
    public func jobs_addGesture<T: UIGestureRecognizer>(_ gesture: T?) -> T? {
        guard let gesture = gesture else { return nil }
        addGestureRecognizer(gesture)
        return gesture
    }
    /// 刷新UI@标记即可（让系统合帧处理）：适合大多数情况
    @MainActor
    @discardableResult
    public func refresh()-> Self{
        setNeedsLayout()  // 下帧再布局
        layoutIfNeeded()  // 立刻完成布局（当前 runloop）
        return self
    }
    /// 刷新UI@标记即可（让系统合帧处理）：适合大多数情况
    @MainActor
    @discardableResult
    public func refreshNow() -> Self {
        setNeedsLayout()     // 下帧再布局
        /// 最后同步布局会改变尺寸/路径，应在布局完成后再决定要画什么
        /// 所以把 setNeedsDisplay() 放到 layoutIfNeeded() 之后 更合理
        layoutIfNeeded()     // 立刻完成布局（当前 runloop）
        /// 只当确实重写了 draw(_:) /或者 使用自定义 layerClass 自绘时才需要 setNeedsDisplay()
        setNeedsDisplay()    // 标记（下帧）需要重绘（基于新布局），不是布局
        // 如必须同步把图也画出来（少用，重）：
        // layer.displayIfNeeded()
        return self
    }

    @discardableResult
    public func byActivate() -> Self {
        // 下一帧：让父视图先布局，再让自己重建，避免首帧 bounds==0 的问题
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            superview?.setNeedsLayout()
            superview?.layoutIfNeeded()
            setNeedsLayout()
        };return self
    }
    /// 开启 AutoLayout（等价于 translatesAutoresizingMaskIntoConstraints = false）
    @discardableResult
    public func byAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    /// 直接设置 translatesAutoresizingMaskIntoConstraints
    @discardableResult
    public func byTranslatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = value
        return self
    }
     /// 激活约束（链式）
    @discardableResult
    public func byConstraints(_ block: (Self) -> [NSLayoutConstraint]) -> Self {
        NSLayoutConstraint.activate(block(self))
        return self
    }
}
private var kBgColorMapKey: UInt8 = 0
public extension UIView {
    @discardableResult
    func byBackgroundColor(
        _ color: UIColor?,
        for state: UIControl.State = .normal
    ) -> Self {
        // ===== UIButton =====
        if let button = self as? UIButton {
            // -------- iOS 15+ --------
            if #available(iOS 15.0, *) {
                // 1. 存颜色
                var map = objc_getAssociatedObject(button, &kBgColorMapKey) as? [Int: UIColor] ?? [:]
                map[Int(state.rawValue)] = color
                objc_setAssociatedObject(
                    button,
                    &kBgColorMapKey,
                    map,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
                // 2. 初始化 configuration
                if button.configuration == nil {
                    var cfg = UIButton.Configuration.plain()
                    cfg.background.backgroundColor = .clear   // 关键
                    cfg.background.backgroundColorTransformer = nil // ✅禁用系统自动变换（可选）
                    button.configuration = cfg
                }
                // 3. 状态渲染
                button.configurationUpdateHandler = { btn in
                    guard var c = btn.configuration else { return }
                    let colors = objc_getAssociatedObject(btn, &kBgColorMapKey) as? [Int: UIColor]

                    let normalKey = Int(UIControl.State.normal.rawValue)
                    let highlightedKey = Int(UIControl.State.highlighted.rawValue)
                    let selectedKey = Int(UIControl.State.selected.rawValue)
                    let disabledKey = Int(UIControl.State.disabled.rawValue)

                    let wantedKey: Int
                    if !btn.isEnabled {
                        wantedKey = disabledKey
                    } else if btn.isHighlighted {
                        wantedKey = highlightedKey
                    } else if btn.isSelected {
                        wantedKey = selectedKey
                    } else {
                        wantedKey = normalKey
                    }
                    // ✅关键：没有设置对应状态色，就回退到 normal（避免变成 nil 触发系统蓝色高亮）
                    let resolvedColor =
                        colors?[wantedKey]
                        ?? colors?[normalKey]
                        ?? .clear

                    c.background.backgroundColor = resolvedColor
                    btn.configuration = c
                }
                // 4. 立刻生效
                button.updateConfiguration()
                return self
            }
            // -------- iOS14- --------
            button.byBackgroundImage(color?.byImage(), for: state)
            return self
        }
        // ===== UIView（无状态）=====
        self.backgroundColor = color
        return self
    }
}
