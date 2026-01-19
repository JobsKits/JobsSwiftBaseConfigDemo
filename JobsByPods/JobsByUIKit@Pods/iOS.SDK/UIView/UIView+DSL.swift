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
public extension UIView {
    // MARK: 设置UI
    /// 统一在一个回调里配置 layer
    @discardableResult
    func byLayer(_ config: (CALayer) -> Void) -> Self {
        config(layer)
        return self
    }

    @discardableResult
    func byAddArranged(to stack: UIStackView) -> Self {
        stack.addArrangedSubview(self)
        return self
    }

    @discardableResult
    func byBgColor(_ color: UIColor?) -> Self {
        backgroundColor = color
        return self
    }

    @discardableResult
    func byInsertSublayer(_ layer: CALayer, at index: UInt32) -> Self {
        layer.insertSublayer(layer, at: index)
        return self
    }

    @discardableResult
    func byInsertSublayer(_ layer: CALayer, below sibling: CALayer?) -> Self {
        layer.insertSublayer(layer, below: sibling)
        return self
    }

    @discardableResult
    func byInsertSublayer(_ layer: CALayer, above sibling: CALayer?) -> Self {
        layer.insertSublayer(layer, above: sibling)
        return self
    }

    @discardableResult
    func byHidden(_ hidden: Bool) -> Self {
        isHidden = hidden
        return self
    }

    @discardableResult
    func byAlpha(_ a: CGFloat) -> Self {
        alpha = a
        return self
    }
    /// 是否可见：true 显示；false 隐藏（折叠布局）
    @MainActor
    @discardableResult
    func byVisible(_ visible: Bool) -> Self {
        self.byHidden(!visible)
        self.byAlpha(visible ? 1 : 0)
        return self
    }
    /// 统一圆角：按钮走 UIButton.Configuration 方案，其他视图保持原始 layer 逻辑
    @discardableResult
    func byCornerRadius(_ radius: CGFloat?) -> Self {
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
    func byClipsToBounds(_ enabled: Bool = true) -> Self {
        clipsToBounds = enabled
        return self
    }

    @discardableResult
    func byMasksToBounds(_ masksToBounds: Bool?) -> Self {
        layer.masksToBounds = masksToBounds ?? false
        return self
    }

    @discardableResult
    func byBorderColor(_ color: UIColor?) -> Self {
        layer.borderColor = color?.cgColor   // 传 nil 会清掉边框颜色
         if color == nil { layer.borderWidth = 0 }
        return self
    }

    @discardableResult
    func byZPosition(_ z: CGFloat) -> Self {
        layer.zPosition = z
        return self
    }

    @discardableResult
    func byBorderWidth(_ width: CGFloat) -> Self {
        layer.borderWidth = width
        return self
    }
    // 单项：半径
    @discardableResult
    func byShadowRadius(_ radius: CGFloat) -> Self {
        layer.shadowRadius = radius
        return self
    }

    @discardableResult
    func byShadowColor(_ color: UIColor?) -> Self {
        layer.shadowColor = color?.cgColor
        return self
    }

    @discardableResult
    func byShadowOpacity(_ opacity: Float = 0.0) -> Self {
        layer.shadowOpacity = opacity
        return self
    }

    @discardableResult
    func byShadowOffset(_ offset: CGSize = CGSizeZero) -> Self {
        layer.shadowOffset = offset
        return self
    }
    // MARK: - UIView · Geometry / Transform / Scale / Touch
    /// 几何
    @discardableResult
    func byFrame(_ f: CGRect) -> Self {
        frame = f
        return self
    }

    @discardableResult
    func byBounds(_ b: CGRect) -> Self {
        bounds = b
        return self
    }

    @discardableResult
    func byCenter(_ c: CGPoint) -> Self {
        center = c
        return self
    }
    /// 2D/3D 变换
    @discardableResult
    func byTransform(_ transf: CGAffineTransform) -> Self {
        transform = transf
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func byTransform3D(_ t3d: CATransform3D) -> Self {
        transform3D = t3d
        return self
    }
    /// 缩放因子（渲染分辨率）
    @available(iOS 4.0, *)
    @discardableResult
    func byContentScaleFactor(_ scale: CGFloat) -> Self {
        contentScaleFactor = scale
        return self
    }
    /// 锚点（注意：会影响 frame，需要配合 position/center 调整）
    @available(iOS 16.0, *)
    @discardableResult
    func byAnchorPoint(_ anchor: CGPoint) -> Self {
        anchorPoint = anchor
        return self
    }
    /// 触摸行为
    @discardableResult
    func byMultipleTouchEnabled(_ enabled: Bool) -> Self {
        isMultipleTouchEnabled = enabled
        return self
    }

    @discardableResult
    func byExclusiveTouch(_ enabled: Bool) -> Self {
        isExclusiveTouch = enabled
        return self
    }
    // MARK: 尺寸@绝对设置
    @discardableResult
    func bySize(_ size: CGSize) -> Self {
        frame.size = size
        return self
    }
    /// 允许在链式调用里“根据自身当前状态”计算 size
    @discardableResult
    func bySize(_ make: (Self) -> CGSize) -> Self {
        sizeToFit()
        frame.size = make(self)
        return self
    }

    @discardableResult
    func bySize(width: CGFloat, height: CGFloat) -> Self {
        frame.size = CGSize(width: width, height: height)
        return self
    }

    @discardableResult
    func byWidth(_ width: CGFloat) -> Self {
        var f = frame; f.size.width = width; frame = f
        return self
    }

    @discardableResult
    func byHeight(_ height: CGFloat) -> Self {
        var f = frame; f.size.height = height; frame = f
        return self
    }
    // MARK: 尺寸@相对偏移叠加
    /// 在当前宽度基础上叠加偏移（正负皆可）
    @discardableResult
    func byWidthOffset(_ delta: CGFloat) -> Self {
        var f = frame; f.size.width += delta; frame = f
        return self
    }
    /// 在当前高度基础上叠加偏移（正负皆可）
    @discardableResult
    func byHeightOffset(_ delta: CGFloat) -> Self {
        var f = frame; f.size.height += delta; frame = f
        return self
    }
    /// 同时对宽高做偏移（正负皆可）
    @discardableResult
    func bySizeOffset(width dw: CGFloat = 0, height dh: CGFloat = 0) -> Self {
        var f = frame; f.size.width += dw; f.size.height += dh; frame = f
        return self
    }
    // MARK: Frame@绝对设置
    @discardableResult
    func byFrame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
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
    func byOriginOffset(dx: CGFloat = 0, dy: CGFloat = 0) -> Self {
        var f = frame; f.origin.x += dx; f.origin.y += dy; frame = f
        return self
    }
    @discardableResult
    func byOriginXOffset(_ dx: CGFloat = 0) -> Self {
        var f = frame; f.origin.x += dx; frame = f
        return self
    }
    @discardableResult
    func byOriginYOffset(_ dy: CGFloat = 0) -> Self {
        var f = frame; f.origin.y += dy; frame = f
        return self
    }
    /// 在当前 frame 基础上整体偏移（位置 + 尺寸）
    @discardableResult
    func byFrameOffset(dx: CGFloat = 0, dy: CGFloat = 0, dw: CGFloat = 0, dh: CGFloat = 0) -> Self {
        var f = frame
        f.origin.x += dx; f.origin.y += dy
        f.size.width += dw; f.size.height += dh
        frame = f
        return self
    }
    // MARK: 位置
    @discardableResult
    func byOrigin(_ point: CGPoint) -> Self {
        frame.origin = point
        return self
    }
    /// 在当前中心点基础上叠加偏移
    @discardableResult
    func byCenterOffset(dx: CGFloat = 0, dy: CGFloat = 0) -> Self {
        center = CGPoint(x: center.x + dx, y: center.y + dy)
        return self
    }
    // MARK: - UIView · Subview Hierarchy
    /// 添加子视图（链式）✅ 返回调用者（父视图）
    @discardableResult
    func byAddSubviewRetSuper(_ view: UIView) -> Self {
        addSubview(view)
        return self //
    }
    /// 添加子视图（链式）✅ 返回子视图
    @discardableResult
    func byAddSubviewRetSub<T: UIView>(_ view: T) -> T {
        addSubview(view)
        return view
    }
    /// 在指定层级插入 ✅ 返回调用者（父视图）
    @discardableResult
    func byInsertSubview(_ view: UIView, at index: Int) -> Self {
        insertSubview(view, at: index)
        return self
    }
    /// 在指定层级插入 ✅ 返回子视图
    @discardableResult
    func byInsertSubviewRetSub<T: UIView>(_ view: T, at index: Int) -> T {
        insertSubview(view, at: index)
        return view
    }
    /// 在某视图之下插入 ✅ 返回调用者（父视图）
    @discardableResult
    func byInsertSubview(_ view: UIView, below sibling: UIView) -> Self {
        insertSubview(view, belowSubview: sibling)
        return self
    }
    /// 在某视图之下插入 ✅ 返回子视图
    @discardableResult
    func byInsertSubviewRetSub<T: UIView>(_ view: T, below sibling: UIView) -> T {
        insertSubview(view, belowSubview: sibling)
        return view
    }
    /// 在某视图之上插入 ✅ 返回调用者（父视图）
    @discardableResult
    func byInsertSubview(_ view: UIView, above sibling: UIView) -> Self {
        insertSubview(view, aboveSubview: sibling)
        return self
    }
    /// 在某视图之上插入 ✅ 返回子视图
    @discardableResult
    func byInsertSubviewRetSub<T: UIView>(_ view: T, above sibling: UIView) -> T {
        insertSubview(view, aboveSubview: sibling)
        return view
    }
    /// 交换两个下标的子视图 ✅ 返回调用者（父视图）
    @discardableResult
    func byExchangeSubview(at i: Int, with j: Int) -> Self {
        exchangeSubview(at: i, withSubviewAt: j)
        return self
    }
    /// 置顶 ✅ 返回调用者（父视图）
    @discardableResult
    func byBringToFront(_ view: UIView) -> Self {
        bringSubviewToFront(view)
        return self
    }
    /// 置顶 ✅ 返回子视图
    @discardableResult
    func byBringToFrontRetSub<T: UIView>(_ view: T) -> T {
        bringSubviewToFront(view)
        return view
    }
    /// 置底 ✅ 返回调用者（父视图）
    @discardableResult
    func bySendToBack(_ view: UIView) -> Self {
        sendSubviewToBack(view)
        return self
    }
    /// 置底 ✅ 返回子视图
    @discardableResult
    func bySendToBackRetSub<T: UIView>(_ view: T) -> T {
        sendSubviewToBack(view)
        return view
    }
    /// 移除自身 ✅ 返回调用者（父视图）
    @discardableResult
    func byRemoveFromSuperview() -> Self {
        removeFromSuperview()
        return self
    }
    /// 移除所有子视图（便捷）
    @discardableResult
    func byRemoveAllSubviews() -> Self {
        subviews.forEach { $0.removeFromSuperview() }
        return self
    }
    // MARK: - UIView · Autoresizing / Layout Margins / Safe Area
    /// 是否对子视图做 autoresize
    @discardableResult
    func byAutoresizesSubviews(_ enabled: Bool) -> Self {
        autoresizesSubviews = enabled
        return self
    }
    /// 自伸缩掩码
    @discardableResult
    func byAutoresizingMask(_ mask: UIView.AutoresizingMask) -> Self {
        autoresizingMask = mask
        return self
    }
    /// 传统 layoutMargins
    @available(iOS 8.0, *)
    @discardableResult
    func byLayoutMargins(_ insets: UIEdgeInsets) -> Self {
        layoutMargins = insets
        return self
    }
    /// 方向化的 layoutMargins（更现代）
    @available(iOS 11.0, *)
    @discardableResult
    func byDirectionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = insets
        return self
    }
    /// 是否继承父视图的 layoutMargins
    @available(iOS 8.0, *)
    @discardableResult
    func byPreservesSuperviewLayoutMargins(_ enabled: Bool) -> Self {
        preservesSuperviewLayoutMargins = enabled
        return self
    }
    /// 是否将 safeArea 纳入 layoutMargins 计算
    @available(iOS 11.0, *)
    @discardableResult
    func byInsetsLayoutMarginsFromSafeArea(_ enabled: Bool) -> Self {
        insetsLayoutMarginsFromSafeArea = enabled
        return self
    }
    // MARK: - UIView · Layout Triggers
    /// 标记需要布局
    @discardableResult
    func bySetNeedsLayout() -> Self {
        setNeedsLayout()
        return self
    }
    /// 立即布局
    @discardableResult
    func byLayoutIfNeeded() -> Self {
        layoutIfNeeded()
        return self
    }
    /// 自适应到指定尺寸（仅设置，不触发布局）
    @discardableResult
    func bySizeThatFits(_ size: CGSize) -> Self {
        _ = sizeThatFits(size)
        return self
    }
    /// 自身尺寸适配
    @discardableResult
    func bySizeToFit() -> Self {
        sizeToFit()
        return self
    }
    // MARK: 其他
    @discardableResult
    func byContentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode;
        return self
    }

    @discardableResult
    func byTag(_ T: Int) -> Self {
        tag = T
        return self
    }

    @discardableResult
    func byUserInteractionEnabled(_ enabled: Bool?) -> Self {
        isUserInteractionEnabled = enabled ?? false
        return self
    }
    /// 手势封装：添加手势以后返回这个手势本身@常用于链式调用
    @discardableResult
    func jobs_addGestureRetView<T: UIGestureRecognizer>(_ gesture: T?) -> Self {
        guard let gesture = gesture else { return self }
        addGestureRecognizer(gesture)
        return self
    }
    /// 手势封装：添加手势以后返回这个手势本身@常用于链式调用
    @discardableResult
    func jobs_addGesture<T: UIGestureRecognizer>(_ gesture: T?) -> T? {
        guard let gesture = gesture else { return nil }
        addGestureRecognizer(gesture)
        return gesture
    }
    /// 刷新UI@标记即可（让系统合帧处理）：适合大多数情况
    @MainActor
    @discardableResult
    func refresh()-> Self{
        setNeedsLayout()  // 下帧再布局
        layoutIfNeeded()  // 立刻完成布局（当前 runloop）
        return self
    }
    /// 刷新UI@标记即可（让系统合帧处理）：适合大多数情况
    @MainActor
    @discardableResult
    func refreshNow() -> Self {
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
    func byAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    /// 直接设置 translatesAutoresizingMaskIntoConstraints
    @discardableResult
    func byTranslatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = value
        return self
    }
     /// 激活约束（链式）
    @discardableResult
    func byConstraints(_ block: (Self) -> [NSLayoutConstraint]) -> Self {
        NSLayoutConstraint.activate(block(self))
        return self
    }
}
