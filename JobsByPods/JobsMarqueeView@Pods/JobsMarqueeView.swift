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

import JobsByUIKit
import JobsSwiftTimer
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
    public var direction: JobsDirection = .left {
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
            applyManualScrollConfig()
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
    // ================================== Manual Scroll ==================================
    /// 是否允许手动拖拽滚动（默认 false：完全由定时器驱动）
    /// - Note:
    ///   - 拖拽开始 -> pause()
    ///   - 拖拽结束/减速结束 -> resume()（仅当拖拽前正在运行）
    ///   - 在 `itemSizeMode == .fillBounds` 下会自动开启 `isPagingEnabled`，体验更像轮播图
    public var isManualScrollEnabled: Bool = false {
        didSet { applyManualScrollConfig() }
    }
    // ================================== ScrollView ==================================
    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byShowsHorizontalScrollIndicator(false)
            .byShowsVerticalScrollIndicator(false)
            .byBounces(false)
            .byPagingEnabled(false)
            .byScrollEnabled(false) // 默认全程由 JobsSwiftTimer 驱动（开启 isManualScrollEnabled 后会打开）
            .byScrollsToTop(false)
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
            let _ = pageControl
            pageControl.isHidden = !isPageControlEnabled
            if isPageControlEnabled {
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
    public private(set) lazy var pageControl: UIPageControl = {
        UIPageControl()
            .byHidden(true)
            .byUserInteractionEnabled(false)
            .byAddTo(self)
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
    /// 手动拖拽时：记录拖拽开始前的运行状态（用于决定是否需要 resume）
    private var shouldResumeAfterUserInteraction: Bool = false
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
        scrollView.delegate = self
        applyManualScrollConfig()
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
            }
            return
        }
        let isHorizontal = direction.isHorizontal
        minButtonSize = JobsMarqueeView.computeMinButtonSize()
        let source = dataSourceButtons
        let sourceCount = source.count
        let targetCount: Int
        switch (isHorizontal, itemSizeMode) {
        case (true, .fillBounds):
            targetCount = max(3, sourceCount + 1)
        case (false, .fillBounds):
            targetCount = max(3, sourceCount + 1)
        case (true, .fitContent):
            let s1 = max(minButtonSize.width, 1.0)
            let base = Int(ceil(bounds.width / s1))
            targetCount = max(base, sourceCount)
        case (false, .fitContent):
            let s2 = max(minButtonSize.height, 1.0)
            let base = Int(ceil(bounds.height / s2))
            targetCount = max(base, sourceCount)
        }
        internalButtons = buildButtons(from: source, targetCount: targetCount)
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
        if itemSizeMode == .fillBounds {
            stepLength = isHorizontal ? bounds.width : bounds.height
        } else {
            stepLength = isHorizontal ? minButtonSize.width : minButtonSize.height
        }
        scrollView.contentOffset = .zero
        if isPageControlEnabled {
            updatePageControlPages()
            updatePageControlConstraintsIfNeeded()
            updatePageControlCurrentPage()
            pageControl.isHidden = false
        }
    }
    // ================================== Manual Scroll Helpers ==================================
    private func applyManualScrollConfig() {
        scrollView.byScrollEnabled(isManualScrollEnabled)
        // 轮播图模式：paging 体验更自然
        scrollView.byPagingEnabled(isManualScrollEnabled && (itemSizeMode == .fillBounds))
    }
    /// 手动拖拽结束后：如果是轮播图（fillBounds），对齐到最近页
    @MainActor
    private func snapToNearestPageIfNeeded(completion: (() -> Void)? = nil) {
        guard isManualScrollEnabled else { completion?(); return }
        guard itemSizeMode == .fillBounds else { completion?(); return }
        guard realPageCount > 0, stepLength > 0 else { completion?(); return }

        let isHorizontal = direction.isHorizontal
        let rawOffset = isHorizontal ? scrollView.contentOffset.x : scrollView.contentOffset.y
        let maxOffset = isHorizontal
        ? max(0, scrollView.contentSize.width - scrollView.bounds.width)
        : max(0, scrollView.contentSize.height - scrollView.bounds.height)

        // 最后一页是复制的「第 0 页」，到尾部就直接无动画跳回 0
        if rawOffset >= maxOffset - 0.5 {
            scrollView.contentOffset = .zero
            if isPageControlEnabled { updatePageControlCurrentPage() }
            completion?()
            return
        }

        var page = Int(round(rawOffset / stepLength))
        page = max(0, min(realPageCount - 1, page))

        var target = scrollView.contentOffset
        if isHorizontal {
            target.x = CGFloat(page) * stepLength
        } else {
            target.y = CGFloat(page) * stepLength
        }

        UIView.animate(withDuration: 0.25, animations: {
            self.scrollView.contentOffset = target
        }, completion: { _ in
            if self.isPageControlEnabled { self.updatePageControlCurrentPage() }
            completion?()
        })
    }
    // ================================== Public Controls ==================================
    public func start() {
        guard !dataSourceButtons.isEmpty else { return }
        if timer == nil { createTimer() }
        timer?.start()
    }
    
    public func pause() {
        timer?.pause()
    }

    public func resume() {
        timer?.resume()
    }
    /// 确保自动滚动定时器处于运行状态（用于手动拖拽结束后恢复）
    /// - Note:
    ///   - 某些 timer 内核在 pause 之后，resume 可能不会重新进入 running（取决于实现）
    ///   - 因此这里做一次兜底：能 resume 就 resume；否则直接 start
    private func ensureAutoScrollRunning() {
        guard !dataSourceButtons.isEmpty else { return }
        if timer == nil { createTimer() }

        if timer?.isRunning == true {
            timer?.resume()
        } else {
            timer?.start()
        }
    }

    public func stop() {
        timer?.stop()
        timer = nil
    }
    // ================================== Timer Core ==================================
    private func resetTimerIfNeeded() {
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
        case .top:
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
        case .bottom:
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
        case .top:
            guard maxOffsetY > 0 else { return }
            offset.y += distance
            if offset.y > maxOffsetY { offset.y -= maxOffsetY }
        case .bottom:
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

    private func cloneButton(from source: UIButton) -> UIButton {
        let button = UIButton.sys()
        button.jobs_isClone = true
        // 0) 先处理 iOS15+ configuration（放最前，避免后续把字体/样式冲掉）
        if #available(iOS 15.0, *) {
            if let cfg = source.configuration {
                button.configuration = cfg
                // 如果你希望 clone 的配置更新策略和 source 一致，可以打开：
                // button.automaticallyUpdatesConfiguration = source.automaticallyUpdatesConfiguration
            }
        } else {
            // iOS14-：拷贝 legacy inset
            button
                .byContentEdgeInsets(source.contentEdgeInsets)
                .byTitleEdgeInsets(source.titleEdgeInsets)
                .byImageEdgeInsets(source.imageEdgeInsets)
        }
        // 1) 复制常用状态下的 title / attributedTitle / color / image / backgroundImage
        let states: [UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for st in states {

            if let title = source.title(for: st) {
                button.byTitle(title, for: st)
            }
            // ✅ 写法1：iOS15+ 且 source 有 configuration 时，不拷贝 legacy attributedTitle
            if #available(iOS 15.0, *) {
                if source.configuration == nil {
                    if let att = source.attributedTitle(for: st) {
                        button.byAttributedTitle(att, for: st)
                    }
                }
            } else {
                if let att = source.attributedTitle(for: st) {
                    button.byAttributedTitle(att, for: st)
                }
            }

            if let color = source.titleColor(for: st) {
                button.byTitleColor(color, for: st)
            }

            if let image = source.image(for: st) {
                button.byImage(image, for: st)
            }

            if let bgImage = source.backgroundImage(for: st) {
                button.byBackgroundImage(bgImage, for: st)
            }
        }
        // 2) 背景色（按你的原逻辑只拷 normal）
        if let bgColor = source.backgroundColor {
            button.byBackgroundColor(bgColor, for: .normal)
        }
        // 3) 对齐/布局相关
        button.contentHorizontalAlignment = source.contentHorizontalAlignment
        button.contentVerticalAlignment   = source.contentVerticalAlignment
        button.semanticContentAttribute   = source.semanticContentAttribute
        button.tintColor                  = source.tintColor
        // 4) layer 外观
        button.layer.cornerRadius  = source.layer.cornerRadius
        button.layer.masksToBounds = source.layer.masksToBounds
        button.layer.borderWidth   = source.layer.borderWidth
        button.layer.borderColor   = source.layer.borderColor
        // 5) 网络背景图 clone（你原逻辑保留）
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
        // ✅ 6) 字体一定最后刷（关键！）
        for st in states {
             if let f = source.jobs_titleFont(for: st) {
                 button.byTitleFont(f, for: st)
             }
        }
        // ✅ 7) iOS15+ 强制触发一次配置更新（让 DSL 的 update handler / transformer 生效）
        button.byUpdateConfig()
        
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

        if #available(iOS 14.0, *), !hasTapTarget {
            button.addAction(
                UIAction { [weak source] _ in
                    source?.sendActions(for: .touchUpInside)
                },
                for: .touchUpInside
            )
        }

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
// MARK: - UIScrollViewDelegate (Manual Drag)
extension JobsMarqueeView: UIScrollViewDelegate {

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        guard isManualScrollEnabled else { return }
        // 拖拽开始：暂停定时器（仅记录“拖拽前是否在跑”）
        shouldResumeAfterUserInteraction = isRunning
        if shouldResumeAfterUserInteraction {
            pause()
        }
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isManualScrollEnabled else { return }
        if isPageControlEnabled {
            updatePageControlCurrentPage()
        }
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard isManualScrollEnabled else { return }
        // 没有减速：直接视为结束
        if !decelerate {
            finishUserInteraction()
        }
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard isManualScrollEnabled else { return }
        finishUserInteraction()
    }

    private func finishUserInteraction() {
        DispatchQueue.main.async {
            self.snapToNearestPageIfNeeded {
                if self.shouldResumeAfterUserInteraction {
                    self.ensureAutoScrollRunning()
                }
                self.shouldResumeAfterUserInteraction = false
            }
        }
    }
}
// MARK: - DSL
extension JobsMarqueeView {

    @discardableResult
    public func byDirection(_ direction: JobsDirection) -> Self {
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

    @discardableResult
    public func byManualScrollEnabled(_ enabled: Bool) -> Self {
        self.isManualScrollEnabled = enabled
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
        if let manual = pageControlConstraintsProvider {
            manual(pageControl, self)
            return
        }
        let paddingX: CGFloat = 0
        let paddingY: CGFloat = 0
        // ✅ 关键：给一个按页数计算的最小宽度，避免被压缩到只剩 1 个点
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
            if rawOffset >= maxOffset - 0.5 {
                page = 0
            } else {
                page = max(0, min(realPageCount - 1, page))
            }
        } else {
            page = max(0, min(realPageCount - 1, page))
        }

        pageControl.currentPage = page
        pageControl.jobs_applyIndicatorImagesIfNeeded()
    }
}
