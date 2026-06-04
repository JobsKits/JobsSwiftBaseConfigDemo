//
//  JobsRefreshDefaultSkins.swift
//  JobsRefresher
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines

#if canImport(Lottie)
import Lottie
#endif

// MARK: - 文案配置
@MainActor
public enum JobsRefreshConfig {
    public enum common {
        public static let readyRefresh = "松开立即刷新".tr
        public static let readyLoadingMore = "松开立即加载更多".tr
        /// 兼容：JobsDefaultIndicatorView 会读取 readyLoading
        public static let readyLoading = readyLoadingMore

        public static let refreshing = "正在刷新...".tr
        public static let loadingMore = "正在加载更多的数据...".tr

        public static let noMore = "没有更多了".tr
        public static let lastRefreshPrefix = "最后更新：".tr
        public static let updatePrefixVertical = "更新：".tr // 横向拆列用
    }

    public enum v {
        public enum header {
            public static let idle = "下拉可以刷新".tr
            public static let goOn = "继续下拉".tr
        }
        public enum footer {
            public static let idle = "上拉可以加载更多".tr
            public static let goOn = "继续上拉".tr
        }
    }

    public enum h {
        public enum header {
            public static let idle = "右拉可以刷新".tr
            public static let goOn = "继续右拉".tr
        }
        public enum footer {
            public static let idle = "左拉可以加载".tr
            public static let goOn = "继续左拉".tr
        }
    }
}
// MARK: - Lottie 配置（全局 + 单独优先级）
// 你可以继续用你现有的 DSL（setHeaderLottie / setRightLottie ...）给 view 注入 per-slot 配置。
// 这里提供一个“兜底全局配置”（可选）：没单独配才会用它。
@MainActor
public struct JobsRefreshLottieSetting: Equatable {
    public var animationName: String
    public var bundle: Bundle
    public var loopMode: JobsRefreshLottieLoopMode
    public var speed: CGFloat
    public init(animationName: String,
                bundle: Bundle = .main,
                loopMode: JobsRefreshLottieLoopMode = .loop,
                speed: CGFloat = 1) {
        self.animationName = animationName
        self.bundle = bundle
        self.loopMode = loopMode
        self.speed = speed
    }
}

@MainActor
public enum JobsRefreshLottieLoopMode: Equatable {
    case playOnce
    case loop
    case autoReverse
}

@MainActor
public enum JobsRefreshLottiePreference: Equatable {
    /// 继承：优先用全局；没有全局就回退菊花
    case inherit
    /// 强制禁用：无论全局怎么配，都回退菊花
    case disabled
    /// 自定义：该 slot 单独用这个动画（优先级最高）
    case custom(JobsRefreshLottieSetting)
}
// 让“外部/DSL”可以把 per-slot 配置注入到皮肤 view 上
@MainActor
public protocol JobsRefreshLottieConfigurable: AnyObject {
    func setLottiePreference(_ pref: JobsRefreshLottiePreference?)
}
// MARK: - Loading 指示器（Lottie 优先 / 回退菊花）
// 重点：无论 AutoLayout 与否，都会在 layoutSubviews 里设置子视图 frame，保证显示。
@MainActor
final class JobsLoadingIndicator: UIView {
    // public
    var preferredSize: CGFloat = 18 {
        didSet { setNeedsLayout() }
    }
    /// per-slot 配置：nil 等价于 `.inherit`
    var lottiePreference: JobsLottiePreference? {
        didSet { rebuildIfNeeded() }
    }
    // subviews
    private let spinner: UIActivityIndicatorView = {
        let v: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            v = UIActivityIndicatorView(style: .medium)
        } else {
            v = UIActivityIndicatorView(style: .gray)
        };return v.byHidesWhenStopped(YES)
    }()

    #if canImport(Lottie) && JOBS_MODERN_LOTTIE
    private var lottieView: LottieAnimationView?
    #endif

    private var isRefreshing = false
    
    required init?(coder: NSCoder) { fatalError() }
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .clear
        addSubview(spinner)
        spinner.stopAnimating()
    }
    // MARK: - State
    func showRefreshing() {
        isRefreshing = true
        rebuildIfNeeded()
        if usesLottie {
            #if canImport(Lottie) && JOBS_MODERN_LOTTIE
            lottieView?.isHidden = false
            lottieView?.play()
            #endif
            spinner.stopAnimating()
        } else {
            spinner.startAnimating()
        };isHidden = false
    }

    func hideRefreshing() {
        isRefreshing = false
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        lottieView?.stop()
        lottieView?.isHidden = true
        #endif
        spinner.stopAnimating()
        isHidden = true
    }

    var usesLottie: Bool {
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        return lottieView != nil
        #else
        return false
        #endif
    }
    // MARK: - Build
    private func rebuildIfNeeded() {
        guard isRefreshing else {
            // 非 refreshing：永远隐藏，避免你截图那种“pulling 还在转”
            hideRefreshing()
            return
        }

        let resolved = resolveSetting()
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        if let setting = resolved, let anim = loadAnimation(setting) {
            // 需要 Lottie
            if lottieView == nil {
                let v = LottieAnimationView(animation: anim)
                v.backgroundBehavior = .pauseAndRestore
                v.contentMode = .scaleAspectFit
                v.isUserInteractionEnabled = false
                addSubview(v)
                lottieView = v
            } else {
                lottieView?.animation = anim
            }
            lottieView?.animationSpeed = setting.speed
            lottieView?.loopMode = mapLoopMode(setting.loopMode)
            lottieView?.isHidden = false
            spinner.stopAnimating()
            spinner.isHidden = true
            setNeedsLayout()
            return
        }
        // 回退 spinner
        if lottieView != nil {
            lottieView?.removeFromSuperview()
            lottieView = nil
        }
        #endif

        spinner.isHidden = false
        setNeedsLayout()
    }

    private func resolveSetting() -> JobsLottieSetting? {
        // 单独（slot） > 全局（JobsLottieConfig） > nil
        let pref = lottiePreference ?? .inherit
        switch pref {
        case .disabled:
            return nil
        case .custom(let s):
            return s
        case .inherit:
            switch JobsLottieConfig.global {
            case .custom(let s):
                return s
            case .disabled, .inherit:
                return nil
            }
        }
    }

    #if canImport(Lottie) && JOBS_MODERN_LOTTIE
    private func loadAnimation(_ setting: JobsLottieSetting) -> LottieAnimation? {
        // 兼容 "xxx" / "xxx.json" / "folder/xxx.json"
        let raw = setting.animationName
        let stripped = raw
            .replacingOccurrences(of: ".json", with: "")
            .replacingOccurrences(of: ".lottie", with: "")
        // 先按 Lottie 的 named 加载（通常就是资源名，不带扩展）
        if let anim = LottieAnimation.named(stripped, bundle: setting.bundle) {
            return anim
        }
        // 再用 Bundle 查找 json 路径（和你的 Demo 写法一致）
        if setting.bundle.path(forResource: stripped, ofType: "json") != nil {
            return LottieAnimation.named(stripped, bundle: setting.bundle)
        };return nil
    }

    private func mapLoopMode(_ m: JobsLottieLoopMode) -> LottieLoopMode {
        switch m {
        case .playOnce:    return .playOnce
        case .loop:        return .loop
        case .autoReverse: return .autoReverse
        }
    }
    #endif

    override func layoutSubviews() {
        super.layoutSubviews()
        let side = min(preferredSize, min(bounds.width, bounds.height))
        let x = (bounds.width - side) * 0.5
        let y = (bounds.height - side) * 0.5
        let r = CGRect(x: x, y: y, width: side, height: side)
        spinner.frame = r
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        lottieView?.frame = r
        #endif
    }
}
// MARK: - 竖向 Header/Footer（箭头旋转 + Lottie 刷新）
@MainActor
public class JobsArrowIndicatorView: UIView,
                                     JobsAnimatable,
                                     JobsRefreshTimeTrackable,
                                     JobsLottieConfigurable {
    public enum Style { case header, footer }
    private enum ArrowDirection { case up, down }
    
    public var style: Style = .header {
        didSet { applyArrow(direction: idleArrowDirection(), animated: false); setNeedsLayout() }
    }

    public var heightOrWidth: CGFloat = 60
    private var lastRefreshedAt: Date?
    // per-slot Lottie 配置（由外部注入）；nil 表示继承全局
    public var lottiePreference: JobsLottiePreference = .inherit {
        didSet { loading.lottiePreference = lottiePreference }
    }

    private lazy var arrow: UIImageView = {
        let iv: UIImageView
        if #available(iOS 13.0, *) {
            iv = UIImageView(image: UIImage(systemName: "arrow.up"))
        } else {
            iv = UIImageView()
        };return self.byAddSubviewRetSub(iv.byContentMode(.scaleAspectFit).byTintColor(JobsCor.secondaryLabel))
    }()

    private lazy var loading: JobsLoadingIndicator = {
        let v = JobsLoadingIndicator()
        v.preferredSize = 18
        v.isHidden = true
        v.lottiePreference = lottiePreference
        return self.byAddSubviewRetSub(v)
    }()

    private lazy var label: UILabel = {
        self.byAddSubviewRetSub(
            UILabel()
                .byFont(.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    private let rotationDuration: TimeInterval = 0.18
    private var isArrowInReadyDirection: Bool = false

    private static let timeFormatter: DateFormatter = {
        DateFormatter()
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("HH:mm")
    }()
    private static let dateTimeFormatter: DateFormatter = {
        DateFormatter()
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("yyyy-MM-dd HH:mm")
    }()

    required public init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .clear
        applyArrow(direction: idleArrowDirection(), animated: false)
        loading.hideRefreshing()
    }

    public func markRefreshed(at date: Date) { lastRefreshedAt = date }

    public func apply(state: JobsState) {
        switch state {
        case .idle:
            loading.hideRefreshing()
            arrow.isHidden = false
            applyArrow(direction: idleArrowDirection(), animated: isArrowInReadyDirection)
            displayText(idleText())
        case .pulling(let p):
            loading.hideRefreshing() // 关键：pulling 一定不能显示 loading
            arrow.isHidden = false
            if p >= 1 {
                applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
                displayText(readyText())
            } else {
                applyArrow(direction: idleArrowDirection(), animated: false)
                displayText(String(format: "%@ %.0f%%", goOnText(), min(1, max(0, p)) * 100))
            }
        case .ready:
            loading.hideRefreshing()
            arrow.isHidden = false
            applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
            displayText(readyText())
        case .refreshing:
            arrow.isHidden = true
            loading.lottiePreference = lottiePreference
            loading.showRefreshing()
            displayText(refreshingText())
        case .noMore:
            loading.hideRefreshing()
            arrow.isHidden = true
            displayText(JobsRefreshConfig.common.noMore)
        case .removed:
            loading.hideRefreshing()
            arrow.isHidden = true
            label.text = nil
        };setNeedsLayout()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        let availableW = bounds.width
        let availableH = bounds.height

        let iconSide: CGFloat = 18
        let spacing: CGFloat = 10

        // label 尺寸
        let labelMaxW = max(10, availableW - 24)
        let labelSize = label.sizeThatFits(CGSize(width: labelMaxW, height: .greatestFiniteMagnitude))

        // “箭头/动画 + 间距 + label”整体水平居中
        let totalW = iconSide + spacing + labelSize.width
        let startX = (availableW - totalW) * 0.5
        let iconY = (availableH - iconSide) * 0.5

        arrow.frame = CGRect(x: startX, y: iconY, width: iconSide, height: iconSide)
        loading.frame = arrow.frame

        label.frame = CGRect(
            x: arrow.frame.maxX + spacing,
            y: (availableH - labelSize.height) * 0.5,
            width: labelSize.width,
            height: labelSize.height
        )
    }

    private func idleText() -> String {
        switch style {
        case .header: return JobsRefreshConfig.v.header.idle
        case .footer: return JobsRefreshConfig.v.footer.idle
        }
    }
    
    private func goOnText() -> String {
        switch style {
        case .header: return JobsRefreshConfig.v.header.goOn
        case .footer: return JobsRefreshConfig.v.footer.goOn
        }
    }
    
    private func readyText() -> String {
        switch style {
        case .header: return JobsRefreshConfig.common.readyRefresh
        case .footer: return JobsRefreshConfig.common.readyLoadingMore
        }
    }
    
    private func refreshingText() -> String {
        switch style {
        case .header: return JobsRefreshConfig.common.refreshing
        case .footer: return JobsRefreshConfig.common.loadingMore
        }
    }

    private func displayText(_ main: String) {
        if style == .header, let d = lastRefreshedAt {
            let calendar = Calendar.current
            let t: String
            if calendar.isDateInToday(d) {
                t = "今天".tr + Self.timeFormatter.string(from: d)
            } else {
                t = Self.dateTimeFormatter.string(from: d)
            }
            label.byText(main + "\n" + JobsRefreshConfig.common.lastRefreshPrefix + t)
        } else {
            label.byText(main)
        }
    }

    private func idleArrowDirection() -> ArrowDirection {
        switch style {
        case .header: return .down
        case .footer: return .up
        }
    }
    
    private func readyArrowDirection() -> ArrowDirection {
        switch style {
        case .header: return .up
        case .footer: return .down
        }
    }

    private func applyArrow(direction: ArrowDirection, animated: Bool) {
        let target: CGAffineTransform = {
            switch direction {
            case .up:   return .identity
            case .down: return CGAffineTransform(rotationAngle: .pi)
            }
        }()
        let willBeReadyDirection = (direction == readyArrowDirection())
        if animated {
            UIView.animate(withDuration: rotationDuration,
                           delay: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.arrow.transform = target
            }
        } else {
            arrow.transform = target
        }
        isArrowInReadyDirection = willBeReadyDirection
    }
}

@MainActor
public final class JobsDefaultHeader: JobsArrowIndicatorView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style = .header
        heightOrWidth = 60
    };required init?(coder: NSCoder) { fatalError() }
}

@MainActor
public final class JobsDefaultFooter: JobsArrowIndicatorView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style = .footer
        heightOrWidth = 60
    };required init?(coder: NSCoder) { fatalError() }
}
// MARK: - 横向（仿 XZMRefresh / MJRefresh）：竖排文案 + 底部箭头 + Lottie 刷新
@MainActor
public class JobsSideIndicatorView: UIView,
                                    JobsAnimatable,
                                    JobsRefreshTimeTrackable,
                                    JobsLottieConfigurable {
    public enum SideStyle { case left, right } // left=右拉刷新（头部组），right=左拉加载（尾部组）
    private enum ArrowDirection { case left, right }
    
    public var style: SideStyle = .left { didSet { setNeedsLayout() } }
    public var heightOrWidth: CGFloat = 60

    private var lastRefreshedAt: Date?
    public var lottiePreference: JobsLottiePreference = .inherit {
        didSet { loading.lottiePreference = lottiePreference }
    }
    public func markRefreshed(at date: Date) { lastRefreshedAt = date }

    private lazy var arrow: UIImageView = {
        let iv: UIImageView
        if #available(iOS 13.0, *) {
            iv = UIImageView(image: UIImage(systemName: "arrow.left"))
        } else {
            iv = UIImageView()
        };return self.byAddSubviewRetSub(iv.byContentMode(.scaleAspectFit).byTintColor(JobsCor.secondaryLabel))
    }()

    private lazy var loading: JobsLoadingIndicator = {
        let v = JobsLoadingIndicator()
        v.preferredSize = 18
        v.lottiePreference = lottiePreference
        v.isHidden = true
        return self.byAddSubviewRetSub(v)
    }()

    private lazy var statusLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel()
                .byFont(.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()
    // “更新：”单独一列 + “今天 22:05”一列
    private lazy var updatePrefixLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel()
                .byFont(.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()
    
    private lazy var updateValueLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel()
                .byFont(.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    private let rotationDuration: TimeInterval = 0.18
    private var isArrowInReadyDirection: Bool = false

    private static let timeFormatter: DateFormatter = {
        DateFormatter()
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("HH:mm")
    }()
    private static let dateTimeFormatter: DateFormatter = {
        DateFormatter()
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("yyyy-MM-dd HH:mm")
    }()

    required public init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .clear
        loading.hideRefreshing()
        applyArrow(direction: idleArrowDirection(), animated: false)
        setUpdateInfoVisible(false)
    }

    public func apply(state: JobsState) {
        switch state {
        case .idle:
            loading.hideRefreshing()
            arrow.isHidden = false
            applyArrow(direction: idleArrowDirection(), animated: isArrowInReadyDirection)
            setVertical(statusLabel, text: idleText())
            setUpdateInfoVisible(false)
        case .pulling(let p):
            loading.hideRefreshing()
            arrow.isHidden = false
            if p >= 1 {
                applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
                setVertical(statusLabel, text: readyText())
            } else {
                applyArrow(direction: idleArrowDirection(), animated: false)
                let percent = Int(min(1, max(0, p)) * 100)
                setVertical(statusLabel, text: "\(goOnText()) \(percent)%")
            };setUpdateInfoVisible(false)
        case .ready:
            loading.hideRefreshing()
            arrow.isHidden = false
            applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
            setVertical(statusLabel, text: readyText())
            setUpdateInfoVisible(false)
        case .refreshing:
            arrow.isHidden = true
            loading.lottiePreference = lottiePreference
            loading.showRefreshing()
            setVertical(statusLabel, text: refreshingText())
            // left（头部组）才显示“更新：时间”（仿你图1）
            setUpdateInfoVisible(style == .left)
            if style == .left { updateLabelsFromDate(lastRefreshedAt) }
        case .noMore:
            loading.hideRefreshing()
            arrow.isHidden = true
            setVertical(statusLabel, text: JobsRefreshConfig.common.noMore)
            setUpdateInfoVisible(false)
        case .removed:
            loading.hideRefreshing()
            arrow.isHidden = true
            statusLabel.text = nil
            setUpdateInfoVisible(false)
        };setNeedsLayout()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let w = bounds.width
        let h = bounds.height
        // ===== Layout goal =====
        // 横向时：把「箭头/Loading(Lottie/菊花)」放在文案之上；并且整体（icon + 文案）垂直居中。
        // 同时保证 3 列竖排文案在默认 width=60 时不会出界（动态计算列宽/间距）。
        let iconSide: CGFloat = 18
        let stackSpacing: CGFloat = 8
        let vPadding: CGFloat = 10

        let showUpdate = !updatePrefixLabel.isHidden && !updateValueLabel.isHidden
        let cols = showUpdate ? 3 : 1

        // ---- Horizontal sizing (avoid clipping when width is small, e.g. 60) ----
        let xPadding: CGFloat = 6
        let minColW: CGFloat = 14
        let maxColW: CGFloat = 22
        let minSpacing: CGFloat = 4
        let maxSpacing: CGFloat = 10

        var spacing = maxSpacing
        var colW = (w - 2 * xPadding - spacing * CGFloat(max(0, cols - 1))) / CGFloat(cols)
        if colW < minColW {
            spacing = minSpacing
            colW = (w - 2 * xPadding - spacing * CGFloat(max(0, cols - 1))) / CGFloat(cols)
        }
        colW = min(maxColW, max(minColW, colW))
        let totalW = CGFloat(cols) * colW + CGFloat(max(0, cols - 1)) * spacing
        let startX = (w - totalW) * 0.5
        // ---- Vertical sizing: center (icon + text) together ----
        let availableH = max(10, h - 2 * vPadding)
        let textH = max(10, availableH - iconSide - stackSpacing)
        let groupH = iconSide + stackSpacing + textH
        let groupY = (h - groupH) * 0.5
        // icon on top of text
        let iconFrame = CGRect(x: (w - iconSide) * 0.5,
                               y: groupY,
                               width: iconSide,
                               height: iconSide)
        arrow.frame = iconFrame
        loading.frame = iconFrame

        let textY = iconFrame.maxY + stackSpacing
        statusLabel.frame = CGRect(x: startX,
                                   y: textY,
                                   width: colW,
                                   height: textH)
        if showUpdate {
            updatePrefixLabel.frame = CGRect(x: startX + (colW + spacing),
                                             y: textY,
                                             width: colW,
                                             height: textH)
            updateValueLabel.frame = CGRect(x: startX + 2 * (colW + spacing),
                                            y: textY,
                                            width: colW,
                                            height: textH)
        }
    }
    // MARK: - Text helpers
    private func setVertical(_ label: UILabel, text: String) {
        label.text = text.verticalized
    }

    private func setUpdateInfoVisible(_ visible: Bool) {
        updatePrefixLabel.isHidden = !visible
        updateValueLabel.isHidden = !visible
        if visible {
            setVertical(updatePrefixLabel, text: JobsRefreshConfig.common.updatePrefixVertical)
        }
    }

    private func updateLabelsFromDate(_ d: Date?) {
        guard let d else { return }
        let calendar = Calendar.current
        let t: String
        if calendar.isDateInToday(d) {
            t = "今天 ".tr + Self.timeFormatter.string(from: d)
        } else {
            t = Self.dateTimeFormatter.string(from: d)
        };setVertical(updateValueLabel, text: t)
    }

    private func idleText() -> String {
        switch style {
        case .left:  return JobsRefreshConfig.h.header.idle
        case .right: return JobsRefreshConfig.h.footer.idle
        }
    }
    
    private func goOnText() -> String {
        switch style {
        case .left:  return JobsRefreshConfig.h.header.goOn
        case .right: return JobsRefreshConfig.h.footer.goOn
        }
    }
    
    private func readyText() -> String {
        switch style {
        case .left:  return JobsRefreshConfig.common.readyRefresh
        case .right: return JobsRefreshConfig.common.readyLoadingMore
        }
    }
    
    private func refreshingText() -> String {
        switch style {
        case .left:  return JobsRefreshConfig.common.refreshing
        case .right: return JobsRefreshConfig.common.loadingMore
        }
    }
    // MARK: - Arrow rotate
    private func idleArrowDirection() -> ArrowDirection {
        // 左侧控件（右拉）：idle 向左（指向内容外侧）；右侧控件（左拉）：idle 向右
        switch style {
        case .left:  return .left
        case .right: return .right
        }
    }
    
    private func readyArrowDirection() -> ArrowDirection {
        // ready 翻转
        switch style {
        case .left:  return .right
        case .right: return .left
        }
    }

    private func applyArrow(direction: ArrowDirection, animated: Bool) {
        // 以 arrow.left 为基准
        let base: CGAffineTransform = .identity
        let target: CGAffineTransform = {
            switch direction {
            case .left:  return base
            case .right: return CGAffineTransform(rotationAngle: .pi)
            }
        }()
        let willBeReadyDirection = (direction == readyArrowDirection())
        if animated {
            UIView.animate(withDuration: rotationDuration,
                           delay: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.arrow.transform = target
            }
        } else {
            arrow.transform = target
        };isArrowInReadyDirection = willBeReadyDirection
    }
}
// 默认横向
@MainActor
public final class JobsDefaultRightRefresher: JobsSideIndicatorView {
    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        heightOrWidth = 60
        style = .right
    }
}

@MainActor
public final class JobsDefaultLeftRefresher: JobsSideIndicatorView {
    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        heightOrWidth = 60
        style = .left
    }
}
