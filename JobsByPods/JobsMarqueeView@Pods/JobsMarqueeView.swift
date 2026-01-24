//
//  JobsMarqueeView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/10/12.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import SnapKit

#if canImport(SDWebImage)
import SDWebImage
#endif

#if canImport(Kingfisher)
import Kingfisher
#endif

import JobsSwiftTimer
import JobsByUIKit
import JobsSwiftBaseDefines
/// 统一「跑马灯」&「轮播图」的视图组件
/// 数据源：`[UIButton]`
/// 滚动载体：内部 `UIScrollView` + 若干个按钮副本
public final class JobsMarqueeView: UIView {
    // ================================== ScrollMode ==================================
    /// 滚动模式
    public enum ScrollMode {
        /// 按频率滚动（间隔滚动）：interval = 每次触发时间（秒）
        case frequency(interval: TimeInterval)
        /// 一直滚动（连续滚动）：speed = 每秒滚动的点数（pt/s）
        case continuous(speed: CGFloat)
    }
    // ================================== Direction ==================================
    /// 滚动方向
    public enum Direction {
        case left
        case right
        case up
        case down

        var isHorizontal: Bool {
            switch self {
            case .left, .right: return true
            case .up, .down:    return false
            }
        }
    }
    // ================================== ItemSizeMode ==================================
    /// item 尺寸模式
    /// - fitContent: 使用按钮本身内容尺寸（跑马灯）
    /// - fillBounds: 每个按钮尺寸 = JobsMarqueeView 的宽/高（轮播图）
    public enum ItemSizeMode {
        case fitContent
        case fillBounds
    }

    private struct Metrics {
        static let defaultFrequency: TimeInterval = 1.0
        static let defaultContinuousSpeed: CGFloat = 40.0  // pt/s
        static let continuousInterval: TimeInterval = 1.0 / 60.0 // 60fps
    }
    // ================================== Public Properties ==================================
    /// 滚动模式（默认：连续向左滚动）
    public var scrollMode: ScrollMode = .continuous(speed: Metrics.defaultContinuousSpeed) {
        didSet { handleScrollModeChanged() }
    }
    /// 滚动方向（默认水平向左）
    public var direction: Direction = .left {
        didSet {
            needsRebuildContent = true
            setNeedsLayout()
        }
    }
    /// item 尺寸模式（默认：fitContent 跑马灯）
    public var itemSizeMode: ItemSizeMode = .fitContent {
        didSet {
            needsRebuildContent = true
            setNeedsLayout()
        }
    }
    /// 数据源：按钮数组
    public var dataSourceButtons: [UIButton] = [] {
        didSet {
            needsRebuildContent = true
            setNeedsLayout()
        }
    }
    /// 按频率滚动时使用的定时器内核（默认 GCD）
    public var timerKindForFrequency: JobsTimerKind = .gcd {
        didSet { resetTimerIfNeeded() }
    }
    /// 连续滚动时使用的定时器内核（默认 CADisplayLink）
    public var timerKindForContinuous: JobsTimerKind = .displayLink {
        didSet { resetTimerIfNeeded() }
    }
    public var isRunning: Bool { timer?.isRunning ?? false }
    // ================================== ScrollView ==================================
    private lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
        v.bounces = false
        v.isPagingEnabled = false
        v.isScrollEnabled = false   // 全程由 JobsSwiftTimer 驱动
        v.scrollsToTop = false
        return v
    }()
    // ================================== PageControl (iOS/tvOS only) ==================================
    public enum PageControlPosition {
        /// 左下
        case leftBottom
        /// 底部居中（默认）
        case bottomCenter
        /// 右下
        case rightBottom
    }
    /// 是否启用 PageControl（默认 false）
    public var isPageControlEnabled: Bool = false {
        didSet {
            // ✅ 关键：先确保 lazy 已完成初始化（避免后续函数里触发 getter 递归）
            let _ = pageControl
            pageControl.isHidden = !isPageControlEnabled
            if isPageControlEnabled {
                // ✅ 启用后再安装约束 / 同步页数 / 同步当前页
                installDefaultPageControlConstraintsIfNeeded()
                updatePageControlPages()
                updatePageControlCurrentPage()
            }
        }
    }
    /// 模式配置（不设置则默认 bottomCenter）
    public var pageControlPosition: PageControlPosition = .bottomCenter {
        didSet { updatePageControlConstraintsIfNeeded() }
    }
    /// 手动配置约束：外界传入闭包即可完全自定义（覆盖 pageControlPosition）
    /// ⚠️ SnapKit 版本：外界在闭包内用 pc.snp.remakeConstraints(...)
    public var pageControlConstraintsProvider: ((UIPageControl, JobsMarqueeView) -> Void)? {
        didSet { updatePageControlConstraintsIfNeeded() }
    }
    /// 懒加载点语法：独立对象，但挂在 JobsMarqueeView 上
    /// ✅ 注意：这里不再调用 installDefaultPageControlConstraintsIfNeeded()，避免递归 getter
    public private(set) lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.isHidden = true
        pc.isUserInteractionEnabled = false
        addSubview(pc)
        return pc
    }()
    private var realPageCount: Int { dataSourceButtons.count }
    // ================================== Internal State ==================================
    private var internalButtons: [UIButton] = []
    private var needsRebuildContent = false
    private var lastBoundsSize: CGSize = .zero
    /// 一个英文字符在系统按钮字体下的最小尺寸 S1/S2
    private var minButtonSize: CGSize = JobsMarqueeView.computeMinButtonSize()
    /// 离散滚动时每一步的位移（横向=宽度, 纵向=高度）
    private var stepLength: CGFloat = 0
    /// 连续滚动的速度（pt/s）
    private var continuousSpeed: CGFloat = Metrics.defaultContinuousSpeed
    /// 连续滚动定时器 tick 间隔
    private var continuousInterval: TimeInterval = Metrics.continuousInterval
    /// 按频率滚动的触发间隔
    private var frequencyInterval: TimeInterval = Metrics.defaultFrequency
    /// JobsSwiftTimer
    private var timer: JobsSwiftTimerProtocol?
    // ================================== Init ==================================
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        clipsToBounds = true
        addSubview(scrollView)
    }
    // ================================== Layout ==================================
    public override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = bounds
        guard bounds.width > 0, bounds.height > 0 else { return }
        if bounds.size != lastBoundsSize || needsRebuildContent {
            lastBoundsSize = bounds.size
            rebuildContent()
        }
        
        if isPageControlEnabled {
            updatePageControlCurrentPage()
        }
    }
    // ================================== Rebuild Content ==================================
    /// 重建内部按钮 & contentSize
    private func rebuildContent() {
        needsRebuildContent = false
        // 清空旧内容
        scrollView.layer.removeAllAnimations()
        scrollView.contentOffset = .zero
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        internalButtons.removeAll()
        guard !dataSourceButtons.isEmpty else {
            scrollView.contentSize = bounds.size
            if isPageControlEnabled {
                updatePageControlPages()
                updatePageControlConstraintsIfNeeded()
                updatePageControlCurrentPage()
                pageControl.isHidden = false
            };return
        }

        let isHorizontal = direction.isHorizontal
        minButtonSize = JobsMarqueeView.computeMinButtonSize()
        // 计算需要的按钮个数
        let source = dataSourceButtons
        let sourceCount = source.count
        let targetCount: Int
        switch (isHorizontal, itemSizeMode) {
        case (true, .fillBounds):
            // 水平 & 轮播图：多复制 1 个，形成 1,2,3,1 这种结构，方便无感循环
            targetCount = max(3, sourceCount + 1)
        case (false, .fillBounds):
            // 垂直 & 轮播图：同理，多复制 1 个
            targetCount = max(3, sourceCount + 1)
        case (true, .fitContent):
            // 水平 & 按内容：个数 = 视图宽 / S1
            let s1 = max(minButtonSize.width, 1.0)
            let base = Int(ceil(bounds.width / s1))
            targetCount = max(base, sourceCount)
        case (false, .fitContent):
            // 垂直 & 按内容：个数 = 视图高 / S2
            let s2 = max(minButtonSize.height, 1.0)
            let base = Int(ceil(bounds.height / s2))
            targetCount = max(base, sourceCount)
        }
        internalButtons = buildButtons(from: source, targetCount: targetCount)
        // 布局
        var contentWidth: CGFloat = 0
        var contentHeight: CGFloat = 0
        if isHorizontal {
            var x: CGFloat = 0
            for button in internalButtons {
                button.sizeToFit()
                var size = button.bounds.size
                size.width  = max(size.width, minButtonSize.width)
                size.height = bounds.height
                if itemSizeMode == .fillBounds {
                    size.width = bounds.width
                }
                button.frame = CGRect(x: x, y: 0, width: size.width, height: size.height)
                scrollView.addSubview(button)
                x += size.width
            }
            contentWidth = max(bounds.width, x)
            contentHeight = bounds.height
        } else {
            var y: CGFloat = 0
            for button in internalButtons {
                button.sizeToFit()
                var size = button.bounds.size
                size.height = max(size.height, minButtonSize.height)
                size.width  = bounds.width
                if itemSizeMode == .fillBounds {
                    size.height = bounds.height
                }
                button.frame = CGRect(x: 0, y: y, width: size.width, height: size.height)
                scrollView.addSubview(button)
                y += size.height
            }
            contentHeight = max(bounds.height, y)
            contentWidth = bounds.width
        }
        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        // 更新 stepLength
        if itemSizeMode == .fillBounds {
            stepLength = isHorizontal ? bounds.width : bounds.height
        } else {
            stepLength = isHorizontal ? minButtonSize.width : minButtonSize.height
        }
        scrollView.contentOffset = .zero
        if isPageControlEnabled {
            // ✅ 顺序：pages -> constraints -> current
            updatePageControlPages()
            updatePageControlConstraintsIfNeeded()
            updatePageControlCurrentPage()
            pageControl.isHidden = false
        }
    }
    // ================================== Public Controls ==================================
    /// 开始滚动
    public func start() {
        guard !dataSourceButtons.isEmpty else { return }
        if timer == nil { createTimer() }
        timer?.start()
    }
    /// 暂停滚动
    public func pause() {
        timer?.pause()
    }
    /// 恢复计时器
    public func resume() {
        timer?.resume()
    }
    /// 停止并销毁定时器
    public func stop() {
        timer?.stop()
        timer = nil
    }
    // ================================== Timer Core ==================================
    private func resetTimerIfNeeded() {
        // ✅ 你原来是 `timer = nil`，但不 stop 会残留运行；这里彻底清理
        timer?.stop()
        timer = nil
    }

    private func handleScrollModeChanged() {
        switch scrollMode {
        case .frequency(let interval):
            frequencyInterval = max(0.01, interval)
        case .continuous(let speed):
            continuousSpeed = max(0, speed)
        }
        resetTimerIfNeeded()
    }

    private func createTimer() {
        switch scrollMode {
        case .frequency:
            let config = JobsSwiftTimerConfig(
                interval: frequencyInterval,
                repeats: true,
                tolerance: 0.0,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: true,
                autoManageAppState: true
            )
            timer = JobsTimer(kind: timerKindForFrequency, config: config) { [weak self] in
                jobsRunOnMain(self) { _ in
                    self?.tickFrequency()
                }
            }
        case .continuous:
            let config = JobsSwiftTimerConfig(
                interval: continuousInterval,
                repeats: true,
                tolerance: 0.0,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: true,
                autoManageAppState: true
            )
            timer = JobsTimer(kind: timerKindForContinuous, config: config) { [weak self] in
                jobsRunOnMain(self) { _ in
                    self?.tickContinuous()
                }
            }
        }
    }
    // ================================== Tick: Frequency ==================================
    /// 按频率滚动（间隔滚动）
    @MainActor
    private func tickFrequency() {
        guard !internalButtons.isEmpty, stepLength > 0 else { return }
        let current = scrollView.contentOffset
        let maxOffsetX = max(0, scrollView.contentSize.width  - scrollView.bounds.width)
        let maxOffsetY = max(0, scrollView.contentSize.height - scrollView.bounds.height)
        var target = current
        var needResetAfterAnimation = false
        var resetOffset = current
        switch direction {
        case .left:
            guard maxOffsetX > 0 else { return }
            let next = current.x + stepLength
            if itemSizeMode == .fillBounds {
                if next >= maxOffsetX {
                    target.x = maxOffsetX
                    resetOffset.x = 0
                    needResetAfterAnimation = true
                } else {
                    target.x = next
                }
            } else {
                target.x = (next > maxOffsetX) ? 0 : next
            }
        case .right:
            guard maxOffsetX > 0 else { return }
            let next = current.x - stepLength
            if itemSizeMode == .fillBounds {
                if next <= 0 {
                    target.x = 0
                    resetOffset.x = maxOffsetX
                    needResetAfterAnimation = true
                } else {
                    target.x = next
                }
            } else {
                target.x = (next < 0) ? maxOffsetX : next
            }
        case .up:
            guard maxOffsetY > 0 else { return }
            let next = current.y + stepLength
            if itemSizeMode == .fillBounds {
                if next >= maxOffsetY {
                    target.y = maxOffsetY
                    resetOffset.y = 0
                    needResetAfterAnimation = true
                } else {
                    target.y = next
                }
            } else {
                target.y = (next > maxOffsetY) ? 0 : next
            }
        case .down:
            guard maxOffsetY > 0 else { return }
            let next = current.y - stepLength
            if itemSizeMode == .fillBounds {
                if next <= 0 {
                    target.y = 0
                    resetOffset.y = maxOffsetY
                    needResetAfterAnimation = true
                } else {
                    target.y = next
                }
            } else {
                target.y = (next < 0) ? maxOffsetY : next
            }
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.scrollView.contentOffset = target
        }, completion: { finished in
            guard finished else { return }
            if needResetAfterAnimation {
                self.scrollView.contentOffset = resetOffset
            }
            if self.isPageControlEnabled {
                self.updatePageControlCurrentPage()
            }
        })
    }
    // ================================== Tick: Continuous ==================================
    /// 连续滚动
    @MainActor
    private func tickContinuous() {
        guard !internalButtons.isEmpty else { return }
        let distance = CGFloat(continuousInterval) * continuousSpeed
        guard distance > 0 else { return }
        var offset = scrollView.contentOffset
        let maxOffsetX = max(0, scrollView.contentSize.width  - scrollView.bounds.width)
        let maxOffsetY = max(0, scrollView.contentSize.height - scrollView.bounds.height)
        switch direction {
        case .left:
            guard maxOffsetX > 0 else { return }
            offset.x += distance
            if offset.x > maxOffsetX { offset.x -= maxOffsetX }
        case .right:
            guard maxOffsetX > 0 else { return }
            offset.x -= distance
            if offset.x < 0 { offset.x += maxOffsetX }
        case .up:
            guard maxOffsetY > 0 else { return }
            offset.y += distance
            if offset.y > maxOffsetY { offset.y -= maxOffsetY }
        case .down:
            guard maxOffsetY > 0 else { return }
            offset.y -= distance
            if offset.y < 0 { offset.y += maxOffsetY }
        }
        scrollView.contentOffset = offset
        if isPageControlEnabled {
            updatePageControlCurrentPage()
        }
    }
    // ================================== Utils ==================================
    /// 计算 S1/S2：系统默认按钮字体下，一个英文字符的宽高
    private static func computeMinButtonSize() -> CGSize {
        #if os(OSX)
        return CGSize(width: 10, height: 10)
        #else
        let font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        let text = "A" as NSString
        let size = text.size(withAttributes: [.font: font])
        return size
        #endif
    }
    /// 按需求数量构造按钮数组（不足则复制）
    private func buildButtons(from source: [UIButton], targetCount: Int) -> [UIButton] {
        guard !source.isEmpty else { return [] }
        var result: [UIButton] = []
        var index = 0
        while result.count < targetCount {
            let template = source[index % source.count]
            let clone = cloneButton(from: template)
            result.append(clone)
            index += 1
        };return result
    }
    /// 复制 UIButton 的外观 & 行为（尽量复制标题、图片、颜色、事件）
    private func cloneButton(from source: UIButton) -> UIButton {
        // 1. 用的工厂方法创建按钮
        let button = UIButton.sys()
        button.jobs_isClone = true    // 给 SD / KF 背景图克隆那一套用
        // 2. 标题 & 图片（链式）
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for state in states {
            if let title = source.title(for: state) {
                button.byTitle(title, for: state)
            }
            if let attrTitle = source.attributedTitle(for: state) {
                button.byAttributedTitle(attrTitle, for: state)
            }
            if let color = source.titleColor(for: state) {
                button.byTitleColor(color, for: state)
            }
            if let image = source.image(for: state) {
                button.byImage(image, for: state)
            }
            if let bgImage = source.backgroundImage(for: state) {
                button.byBackgroundImage(bgImage, for: state)
            }
        }
        // 3. 字体
        if let font = source.titleLabel?.font {
            button.byTitleFont(font)
        }
        // 4. 内边距 / configuration（避免 iOS 15 之后的 deprecated 警告）
        if #available(iOS 15.0, *), let cfg = source.configuration {
            button.configuration = cfg
        } else {
            button
                .byContentEdgeInsets(source.contentEdgeInsets)
                .byTitleEdgeInsets(source.titleEdgeInsets)
                .byImageEdgeInsets(source.imageEdgeInsets)
        }
        // 5. 背景色
        if let bgColor = source.backgroundColor {
            button.byBackgroundColor(bgColor, for: .normal)
        }
        // 6. 对齐方式
        button.contentHorizontalAlignment = source.contentHorizontalAlignment
        button.contentVerticalAlignment   = source.contentVerticalAlignment
        // 7. layer 样式
        button.layer.cornerRadius  = source.layer.cornerRadius
        button.layer.masksToBounds = source.layer.masksToBounds
        button.layer.borderWidth   = source.layer.borderWidth
        button.layer.borderColor   = source.layer.borderColor
        // 8. 远程图片：SDWebImage / Kingfisher 配置克隆
        #if canImport(SDWebImage)
        source.sd_cloneBackground(to: button,
                                  for: .normal,
                                  allowNetworkIfMissing: true)
        #endif

        #if canImport(Kingfisher)
        source.kf_cloneBackground(to: button,
                                  for: .normal,
                                  allowNetworkIfMissing: true)
        #endif
        // 9. 复制 target-action（兼容老式 addTarget，包括 jobs_addTapClosure 那一套）
        var hasTapTarget = false
        for target in source.allTargets {
            for event in [
                UIControl.Event.touchUpInside,
                .touchDown,
                .touchUpOutside,
                .touchCancel,
                .valueChanged,
                .primaryActionTriggered
            ] {
                guard let actions = source.actions(forTarget: target,
                                                   forControlEvent: event) else { continue }
                for action in actions {
                    button.addTarget(target, action: Selector(action), for: event)
                    if event == .touchUpInside {
                        hasTapTarget = true
                    }
                }
            }
        }
        // 10. 兼容 onTap / byTapSound：它们在 iOS 14+ 用的是 UIAction，看不到 target-action
        if #available(iOS 14.0, *), !hasTapTarget {
            button.addAction(
                UIAction { [weak source] _ in
                    source?.sendActions(for: .touchUpInside)
                },
                for: .touchUpInside
            )
        }
        // 11. 复制长按手势（onLongPress）
        if let recognizers = source.gestureRecognizers {
            for recognizer in recognizers {
                guard let lp = recognizer as? UILongPressGestureRecognizer else { continue }
                let cloneGR = UILongPressGestureRecognizer()
                cloneGR.minimumPressDuration    = lp.minimumPressDuration
                cloneGR.numberOfTapsRequired    = lp.numberOfTapsRequired
                cloneGR.numberOfTouchesRequired = lp.numberOfTouchesRequired
                cloneGR.allowableMovement       = lp.allowableMovement
                cloneGR.cancelsTouchesInView    = lp.cancelsTouchesInView
                cloneGR.delaysTouchesBegan      = lp.delaysTouchesBegan
                cloneGR.delaysTouchesEnded      = lp.delaysTouchesEnded
                cloneGR.isEnabled               = lp.isEnabled
                if let sleeve = objc_getAssociatedObject(lp, &kJobsUIButtonLongPressSleeveKey) {
                    cloneGR.addTarget(sleeve, action: NSSelectorFromString("invoke:"))
                    objc_setAssociatedObject(
                        cloneGR,
                        &kJobsUIButtonLongPressSleeveKey,
                        sleeve,
                        .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                    )
                }
                button.addGestureRecognizer(cloneGR)
            }
        };return button
    }
}
// MARK: - DSL
extension JobsMarqueeView {
    @discardableResult
    public func byDirection(_ direction: Direction) -> Self {
        self.direction = direction
        return self
    }

    @discardableResult
    public func byScrollMode(_ mode: ScrollMode) -> Self {
        self.scrollMode = mode
        return self
    }

    @discardableResult
    public func byItemSizeMode(_ mode: ItemSizeMode) -> Self {
        self.itemSizeMode = mode
        return self
    }

    @discardableResult
    public func byDataSourceButtons(_ buttons: [UIButton]) -> Self {
        self.dataSourceButtons = buttons
        return self
    }
}
// MARK: - PageControl Core (SnapKit)
private extension JobsMarqueeView {

    func installDefaultPageControlConstraintsIfNeeded() {
        updatePageControlConstraintsIfNeeded()
    }

    func updatePageControlConstraintsIfNeeded() {
        guard isPageControlEnabled else { return }
        // 手动约束优先：外界自己在闭包里用 pc.snp.remakeConstraints(...)
        if let manual = pageControlConstraintsProvider {
            manual(pageControl, self)
            return
        }
        let paddingX: CGFloat = 0
        let paddingY: CGFloat = 0
        // ✅ 关键：给一个「按页数计算的最小宽度」，避免被 AutoLayout 压缩到只剩 1 个点
        let dotDiameter: CGFloat = 10
        let dotSpacing: CGFloat = 6
        let pages = max(1, pageControl.numberOfPages)
        let minWidth = CGFloat(pages) * dotDiameter + CGFloat(max(0, pages - 1)) * dotSpacing
        pageControl.snp.remakeConstraints { make in
            make.height.greaterThanOrEqualTo(10.h).priority(.required)
            make.width.greaterThanOrEqualTo(minWidth).priority(.required)
            make.width.lessThanOrEqualToSuperview().priority(.required)

            switch pageControlPosition {
            case .leftBottom:
                make.leading.equalToSuperview().offset(paddingX)
                make.bottom.equalToSuperview().inset(paddingY).priority(.required)

            case .bottomCenter:
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(paddingY).priority(.required)

            case .rightBottom:
                make.trailing.equalToSuperview().inset(paddingX)
                make.bottom.equalToSuperview().inset(paddingY).priority(.required)
            }
        }
    }

    func updatePageControlPages() {
        guard isPageControlEnabled else { return }
        pageControl.numberOfPages = max(0, realPageCount)
        pageControl.currentPage = 0
        pageControl.setNeedsLayout()
        pageControl.layoutIfNeeded()
        pageControl.jobs_applyIndicatorImagesIfNeeded()
    }

    func updatePageControlCurrentPage() {
        guard isPageControlEnabled else { return }
        guard realPageCount > 0, stepLength > 0 else {
            pageControl.currentPage = 0
            pageControl.jobs_applyIndicatorImagesIfNeeded()
            return
        }
        let isHorizontal = direction.isHorizontal
        let rawOffset = isHorizontal ? scrollView.contentOffset.x : scrollView.contentOffset.y
        let maxOffset = isHorizontal
        ? max(0, scrollView.contentSize.width - scrollView.bounds.width)
        : max(0, scrollView.contentSize.height - scrollView.bounds.height)
        var page = Int(round(rawOffset / stepLength))
        if itemSizeMode == .fillBounds {
            // 最后一页是“首个副本”，显示应回到 0
            if rawOffset >= maxOffset - 0.5 {
                page = 0
            } else {
                page = max(0, min(realPageCount - 1, page))
            }
        } else {
            // 跑马灯模式没“页”概念：如果你开了，就按 offset 映射一下
            page = max(0, min(realPageCount - 1, page))
        }
        pageControl.currentPage = page
        pageControl.jobs_applyIndicatorImagesIfNeeded()
    }
}
