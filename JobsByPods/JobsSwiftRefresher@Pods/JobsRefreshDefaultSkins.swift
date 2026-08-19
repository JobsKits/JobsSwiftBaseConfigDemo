//
//  JobsRefreshDefaultSkins.swift
//  JobsSwiftRefresher
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ImageIO
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines

#if canImport(Lottie)
import Lottie
#endif

#if canImport(SDWebImage)
import SDWebImage
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
        public static let failed = "加载失败，松手重试".tr
        public static let disabled = "刷新已关闭".tr
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
        public enum left {
            public static let refreshIdle = "右拉可以刷新".tr
            public static let refreshGoOn = "继续右拉".tr
            public static let loadMoreIdle = "右拉可以加载更多".tr
            public static let loadMoreGoOn = "继续右拉".tr
        }
        public enum right {
            public static let refreshIdle = "左拉可以刷新".tr
            public static let refreshGoOn = "继续左拉".tr
            public static let loadMoreIdle = "左拉可以加载更多".tr
            public static let loadMoreGoOn = "继续左拉".tr
        }
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
// MARK: - Loading 指示器（Lottie 优先 / 回退菊花）
// 重点：无论 AutoLayout 与否，都会在 layoutSubviews 里设置子视图 frame，保证显示。
@MainActor
final class JobsLoadingIndicator: UIView {
    var preferredSize: CGFloat = 18 {
        didSet { setNeedsLayout() }
    }
    var lottiePreference: JobsLottiePreference? {
        didSet { rebuildIfNeeded() }
    }
    var imagePreference: JobsRefreshImagePreference? {
        didSet { rebuildIfNeeded() }
    }

    private let spinner: UIActivityIndicatorView = {
        let v: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            v = UIActivityIndicatorView(style: .medium)
        } else {
            v = UIActivityIndicatorView(style: .gray)
        };return v.byHidesWhenStopped(YES)
    }()

    private let imageView: UIImageView = {
        let v = UIImageView.jobsMake { _ in }
        v
            .byContentMode(.scaleAspectFit)
            .byClipsToBounds()
            .byHidden(true)
        return v
    }()

    #if canImport(Lottie) && JOBS_MODERN_LOTTIE
    private var lottieView: LottieAnimationView?
    #endif

    private var isRefreshing = false

    required init?(coder: NSCoder) { fatalError() }
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        self.byBackgroundColor(JobsCor.clear)
        spinner.byAddTo(self)
        imageView.byAddTo(self)
        spinner.stopAnimating()
    }
    // MARK: - State
    func showRefreshing() {
        isRefreshing = true
        rebuildIfNeeded()
        if usesCustomImage {
            spinner.stopAnimating()
        } else if usesLottie {
            #if canImport(Lottie) && JOBS_MODERN_LOTTIE
            lottieView?.byHidden(false)
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
        lottieView?.byHidden(true)
        #endif
        imageView.stopAnimating()
        imageView.byHidden(true)
        spinner.stopAnimating()
        isHidden = true
    }

    var usesCustomImage: Bool {
        imageView.isHidden == false
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
        if let setting = resolveImageSetting(), applyImage(setting) {
            hideLottieIfNeeded()
            spinner.stopAnimating()
            spinner.byHidden(true)
            imageView.byHidden(false)
            setNeedsLayout()
            return
        }
        imageView.stopAnimating()
        imageView
            .byAnimationImages(nil)
            .byImage(nil)
            .byHidden(true)
        let resolved = resolveLottieSetting()
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        if let setting = resolved, let anim = loadAnimation(setting) {
            // 需要 Lottie
            if lottieView == nil {
                let v = LottieAnimationView(animation: anim)
                v.backgroundBehavior = .pauseAndRestore
                v.byContentMode(.scaleAspectFit)
                v.isUserInteractionEnabled = false
                v.byAddTo(self)
                lottieView = v
            } else {
                lottieView?.animation = anim
            }
            lottieView?.animationSpeed = setting.speed
            lottieView?.loopMode = mapLoopMode(setting.loopMode)
            lottieView?.byHidden(false)
            spinner.stopAnimating()
            spinner.byHidden(true)
            setNeedsLayout()
            return
        }
        // 回退 spinner
        if lottieView != nil {
            lottieView?.removeFromSuperview()
            lottieView = nil
        }
        #endif
        spinner.byHidden(false)
        setNeedsLayout()
    }

    private func resolveLottieSetting() -> JobsLottieSetting? {
        // 单独（slot） > 全局（JobsLottieConfig） > nil
        let pref = lottiePreference ?? .inherit
        switch pref {
        /// 处理 .disabled 分支
        case .disabled:
            return nil
        /// 处理 .custom 分支
        case .custom(let s):
            return s
        /// 处理 .inherit 分支
        case .inherit:
            switch JobsLottieConfig.global {
            /// 处理 .custom 分支
            case .custom(let s):
                return s
            /// 合并处理 .disabled、.inherit 分支
            case .disabled, .inherit:
                return nil
            }
        }
    }

    private func resolveImageSetting() -> JobsRefreshImageSetting? {
        let pref = imagePreference ?? .inherit
        switch pref {
        /// 处理 .disabled 分支
        case .disabled:
            return nil
        /// 处理 .custom 分支
        case .custom(let setting):
            return setting
        /// 处理 .inherit 分支
        case .inherit:
            switch JobsRefreshImageConfig.global {
            /// 处理 .custom 分支
            case .custom(let setting):
                return setting
            /// 合并处理 .disabled、.inherit 分支
            case .disabled, .inherit:
                return nil
            }
        }
    }

    private func applyImage(_ setting: JobsRefreshImageSetting) -> Bool {
        imageView.stopAnimating()
        imageView.byAnimationImages(nil)
        switch setting.source {
        /// 处理 .gif 分支
        case .gif(let name, let bundle):
            guard let image = loadGIF(named: name, bundle: bundle) else { return false }
            imageView.byImage(image)
            imageView.startAnimating()
            return true
        /// 处理 .frames 分支
        case .frames(let names, let bundle, let interval):
            let images = names.compactMap {
                UIImage(named: $0, in: bundle, compatibleWith: nil)
            }
            guard !images.isEmpty else { return false }
            imageView
                .byAnimationImages(images)
                .byAnimationDuration(max(0.02, interval) * Double(images.count))
                .byAnimationRepeatCount(0)
                .byImage(images.first)
            imageView.startAnimating()
            return true
        /// 处理 .network 分支
        case .network(let url, let placeholderName):
            let placeholder = placeholderName.flatMap {
                UIImage(named: $0, in: .main, compatibleWith: nil)
            }
            #if canImport(SDWebImage)
            imageView.sd_setImage(with: url, placeholderImage: placeholder)
            return true
            #else
            guard let placeholder else { return false }
            imageView.byImage(placeholder)
            return true
            #endif
        }
    }

    private func loadGIF(named name: String, bundle: Bundle) -> UIImage? {
        let trimmed = name.replacingOccurrences(of: ".gif", with: "")
        guard let url = bundle.url(forResource: trimmed, withExtension: "gif"),
              let data = try? Data(contentsOf: url) else { return nil };return animatedGIFImage(data: data)
    }

    private func animatedGIFImage(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        let count = CGImageSourceGetCount(source)
        guard count > 0 else { return nil }
        var images: [UIImage] = []
        var duration: TimeInterval = 0
        for index in 0..<count {
            guard let cgImage = CGImageSourceCreateImageAtIndex(source, index, nil) else { continue }
            duration += gifDelay(source: source, index: index)
            images.append(UIImage(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up))
        }
        guard !images.isEmpty else { return nil };return UIImage.animatedImage(with: images, duration: max(duration, 0.08 * Double(images.count)))
    }

    private func gifDelay(source: CGImageSource, index: Int) -> TimeInterval {
        let defaultDelay = 0.08
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [CFString: Any],
              let gif = properties[kCGImagePropertyGIFDictionary] as? [CFString: Any] else {
            return defaultDelay
        }
        let unclamped = gif[kCGImagePropertyGIFUnclampedDelayTime] as? TimeInterval
        let clamped = gif[kCGImagePropertyGIFDelayTime] as? TimeInterval
        return max(0.02, unclamped ?? clamped ?? defaultDelay)
    }

    private func hideLottieIfNeeded() {
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        lottieView?.stop()
        lottieView?.byHidden(true)
        #endif
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
        /// 处理 .playOnce 分支
        case .playOnce:    return .playOnce
        /// 处理 .loop 分支
        case .loop:        return .loop
        /// 处理 .autoReverse 分支
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
        spinner.byFrame(r)
        imageView.byFrame(r)
        #if canImport(Lottie) && JOBS_MODERN_LOTTIE
        lottieView?.byFrame(r)
        #endif
    }
}
// MARK: - 竖向 Header/Footer（箭头旋转 + Lottie 刷新）
@MainActor
public class JobsArrowIndicatorView: UIView,
                                     JobsAnimatable,
                                     JobsRefreshTimeTrackable,
                                     JobsLottieConfigurable,
                                     JobsRefreshImageConfigurable {
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
    public var imagePreference: JobsRefreshImagePreference = .inherit {
        didSet { loading.imagePreference = imagePreference }
    }

    private lazy var arrow: UIImageView = {
        let iv: UIImageView
        if #available(iOS 13.0, *) {
            iv = UIImageView(image: UIImage(systemName: "arrow.up"))
        } else {
            iv = UIImageView.jobsMake { _ in }
        };return self.byAddSubviewRetSub(iv.byContentMode(.scaleAspectFit).byTintColor(JobsCor.secondaryLabel))
    }()

    private lazy var loading: JobsLoadingIndicator = {
        let v = JobsLoadingIndicator()
        v.preferredSize = 18
        v.byHidden(true)
        v.lottiePreference = lottiePreference
        v.imagePreference = imagePreference
        return self.byAddSubviewRetSub(v)
    }()

    private lazy var label: UILabel = {
        self.byAddSubviewRetSub(
            UILabel.jobsMake { _ in }
                .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    private let rotationDuration: TimeInterval = 0.18
    private var isArrowInReadyDirection: Bool = false

    private static let timeFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("HH:mm")
    }()
    private static let dateTimeFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("yyyy-MM-dd HH:mm")
    }()

    required public init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        self.byBackgroundColor(JobsCor.clear)
        applyArrow(direction: idleArrowDirection(), animated: false)
        loading.hideRefreshing()
    }

    public func markRefreshed(at date: Date) { lastRefreshedAt = date }

    public func apply(state: JobsState) {
        switch state {
        /// 处理 .idle 分支
        case .idle:
            loading.hideRefreshing()
            arrow.byHidden(false)
            applyArrow(direction: idleArrowDirection(), animated: isArrowInReadyDirection)
            displayText(idleText())
        /// 处理 .pulling 分支
        case .pulling(let p):
            loading.hideRefreshing() // 关键：pulling 一定不能显示 loading
            arrow.byHidden(false)
            if p >= 1 {
                applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
                displayText(readyText())
            } else {
                applyArrow(direction: idleArrowDirection(), animated: false)
                displayText(String(format: "%@ %.0f%%", goOnText(), min(1, max(0, p)) * 100))
            }
        /// 处理 .ready 分支
        case .ready:
            loading.hideRefreshing()
            arrow.byHidden(false)
            applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
            displayText(readyText())
        /// 处理 .refreshing 分支
        case .refreshing:
            arrow.byHidden(true)
            loading.lottiePreference = lottiePreference
            loading.imagePreference = imagePreference
            loading.showRefreshing()
            displayText(refreshingText())
        /// 处理 .ending 分支
        case .ending:
            arrow.byHidden(true)
            loading.hideRefreshing()
            displayText(refreshingText())
        /// 处理 .failed 分支
        case .failed:
            loading.hideRefreshing()
            arrow.byHidden(false)
            applyArrow(direction: idleArrowDirection(), animated: true)
            displayText(JobsRefreshConfig.common.failed)
        /// 处理 .disabled 分支
        case .disabled:
            loading.hideRefreshing()
            arrow.byHidden(true)
            displayText(JobsRefreshConfig.common.disabled)
        /// 处理 .noMore 分支
        case .noMore:
            loading.hideRefreshing()
            arrow.byHidden(true)
            displayText(JobsRefreshConfig.common.noMore)
        /// 处理 .removed 分支
        case .removed:
            loading.hideRefreshing()
            arrow.byHidden(true)
            label.byText(nil)
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
        arrow.byFrame(CGRect(x: startX, y: iconY, width: iconSide, height: iconSide))
        loading.byFrame(arrow.frame)
        label.byFrame(CGRect(
            x: arrow.frame.maxX + spacing,
            y: (availableH - labelSize.height) * 0.5,
            width: labelSize.width,
            height: labelSize.height
        ))
    }

    private func idleText() -> String {
        switch style {
        /// 处理 .header 分支
        case .header: return JobsRefreshConfig.v.header.idle
        /// 处理 .footer 分支
        case .footer: return JobsRefreshConfig.v.footer.idle
        }
    }

    private func goOnText() -> String {
        switch style {
        /// 处理 .header 分支
        case .header: return JobsRefreshConfig.v.header.goOn
        /// 处理 .footer 分支
        case .footer: return JobsRefreshConfig.v.footer.goOn
        }
    }

    private func readyText() -> String {
        switch style {
        /// 处理 .header 分支
        case .header: return JobsRefreshConfig.common.readyRefresh
        /// 处理 .footer 分支
        case .footer: return JobsRefreshConfig.common.readyLoadingMore
        }
    }

    private func refreshingText() -> String {
        switch style {
        /// 处理 .header 分支
        case .header: return JobsRefreshConfig.common.refreshing
        /// 处理 .footer 分支
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
        /// 处理 .header 分支
        case .header: return .down
        /// 处理 .footer 分支
        case .footer: return .up
        }
    }

    private func readyArrowDirection() -> ArrowDirection {
        switch style {
        /// 处理 .header 分支
        case .header: return .up
        /// 处理 .footer 分支
        case .footer: return .down
        }
    }

    private func applyArrow(direction: ArrowDirection, animated: Bool) {
        let target: CGAffineTransform = {
            switch direction {
            /// 处理 .up 分支
            case .up:   return .identity
            /// 处理 .down 分支
            case .down: return CGAffineTransform(rotationAngle: .pi)
            }
        }()
        let willBeReadyDirection = (direction == readyArrowDirection())
        if animated {
            UIView.jobsAnimateWithOptions(
                rotationDuration,
                delay: 0,
                options: [.beginFromCurrentState, .allowUserInteraction],
                animations: { self.arrow.transform = target }
            )
        } else {
            arrow.byTransform(target)
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
                                    JobsLottieConfigurable,
                                    JobsRefreshImageConfigurable,
                                    JobsRefreshRoleConfigurable {
    public enum SideStyle { case left, right } // left=右拉刷新（头部组），right=左拉加载（尾部组）
    private enum ArrowDirection { case left, right }

    public var style: SideStyle = .left { didSet { setNeedsLayout() } }
    public var refreshRole: JobsRefreshRole = .refresh { didSet { setNeedsLayout() } }
    public var heightOrWidth: CGFloat = 60

    private var lastRefreshedAt: Date?
    public var lottiePreference: JobsLottiePreference = .inherit {
        didSet { loading.lottiePreference = lottiePreference }
    }
    public var imagePreference: JobsRefreshImagePreference = .inherit {
        didSet { loading.imagePreference = imagePreference }
    }
    public func markRefreshed(at date: Date) { lastRefreshedAt = date }

    private lazy var arrow: UIImageView = {
        let iv: UIImageView
        if #available(iOS 13.0, *) {
            iv = UIImageView(image: UIImage(systemName: "arrow.left"))
        } else {
            iv = UIImageView.jobsMake { _ in }
        };return self.byAddSubviewRetSub(iv.byContentMode(.scaleAspectFit).byTintColor(JobsCor.secondaryLabel))
    }()

    private lazy var loading: JobsLoadingIndicator = {
        let v = JobsLoadingIndicator()
        v.preferredSize = 18
        v.lottiePreference = lottiePreference
        v.imagePreference = imagePreference
        v.byHidden(true)
        return self.byAddSubviewRetSub(v)
    }()

    private lazy var statusLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel.jobsMake { _ in }
                .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()
    // “更新：”单独一列 + “今天 22:05”一列
    private lazy var updatePrefixLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel.jobsMake { _ in }
                .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    private lazy var updateValueLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel.jobsMake { _ in }
                .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    private let rotationDuration: TimeInterval = 0.18
    private var isArrowInReadyDirection: Bool = false

    private static let timeFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("HH:mm")
    }()
    private static let dateTimeFormatter: DateFormatter = {
        DateFormatter.jobsMake { _ in }
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("yyyy-MM-dd HH:mm")
    }()

    required public init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        self.byBackgroundColor(JobsCor.clear)
        loading.hideRefreshing()
        applyArrow(direction: idleArrowDirection(), animated: false)
        setUpdateInfoVisible(false)
    }

    public func apply(state: JobsState) {
        switch state {
        /// 处理 .idle 分支
        case .idle:
            loading.hideRefreshing()
            arrow.byHidden(false)
            applyArrow(direction: idleArrowDirection(), animated: isArrowInReadyDirection)
            setVertical(statusLabel, text: idleText())
            setUpdateInfoVisible(false)
        /// 处理 .pulling 分支
        case .pulling(let p):
            loading.hideRefreshing()
            arrow.byHidden(false)
            if p >= 1 {
                applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
                setVertical(statusLabel, text: readyText())
            } else {
                applyArrow(direction: idleArrowDirection(), animated: false)
                let percent = Int(min(1, max(0, p)) * 100)
                setVertical(statusLabel, text: "\(goOnText()) \(percent)%")
            };setUpdateInfoVisible(false)
        /// 处理 .ready 分支
        case .ready:
            loading.hideRefreshing()
            arrow.byHidden(false)
            applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
            setVertical(statusLabel, text: readyText())
            setUpdateInfoVisible(false)
        /// 处理 .refreshing 分支
        case .refreshing:
            arrow.byHidden(true)
            loading.lottiePreference = lottiePreference
            loading.imagePreference = imagePreference
            loading.showRefreshing()
            setVertical(statusLabel, text: refreshingText())
            // left（头部组）才显示“更新：时间”（仿你图1）
            setUpdateInfoVisible(refreshRole == .refresh)
            if refreshRole == .refresh { updateLabelsFromDate(lastRefreshedAt) }
        /// 处理 .ending 分支
        case .ending:
            arrow.byHidden(true)
            loading.hideRefreshing()
            setVertical(statusLabel, text: refreshingText())
            setUpdateInfoVisible(false)
        /// 处理 .failed 分支
        case .failed:
            loading.hideRefreshing()
            arrow.byHidden(false)
            applyArrow(direction: idleArrowDirection(), animated: true)
            setVertical(statusLabel, text: JobsRefreshConfig.common.failed)
            setUpdateInfoVisible(false)
        /// 处理 .disabled 分支
        case .disabled:
            loading.hideRefreshing()
            arrow.byHidden(true)
            setVertical(statusLabel, text: JobsRefreshConfig.common.disabled)
            setUpdateInfoVisible(false)
        /// 处理 .noMore 分支
        case .noMore:
            loading.hideRefreshing()
            arrow.byHidden(true)
            setVertical(statusLabel, text: JobsRefreshConfig.common.noMore)
            setUpdateInfoVisible(false)
        /// 处理 .removed 分支
        case .removed:
            loading.hideRefreshing()
            arrow.byHidden(true)
            statusLabel.byText(nil)
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
        arrow.byFrame(iconFrame)
        loading.byFrame(iconFrame)
        let textY = iconFrame.maxY + stackSpacing
        statusLabel.byFrame(CGRect(x: startX,
                                   y: textY,
                                   width: colW,
                                   height: textH))
        if showUpdate {
            updatePrefixLabel.byFrame(CGRect(x: startX + (colW + spacing),
                                             y: textY,
                                             width: colW,
                                             height: textH))
            updateValueLabel.byFrame(CGRect(x: startX + 2 * (colW + spacing),
                                            y: textY,
                                            width: colW,
                                            height: textH))
        }
    }
    // MARK: - Text helpers
    private func setVertical(_ label: UILabel, text: String) {
        label.byText(text.verticalized)
    }

    private func setUpdateInfoVisible(_ visible: Bool) {
        updatePrefixLabel.byHidden(!visible)
        updateValueLabel.byHidden(!visible)
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
        switch (style, refreshRole) {
        /// 处理 .left 分支
        case (.left, .refresh):   return JobsRefreshConfig.h.left.refreshIdle
        /// 处理 .left 分支
        case (.left, .loadMore):  return JobsRefreshConfig.h.left.loadMoreIdle
        /// 处理 .right 分支
        case (.right, .refresh):  return JobsRefreshConfig.h.right.refreshIdle
        /// 处理 .right 分支
        case (.right, .loadMore): return JobsRefreshConfig.h.right.loadMoreIdle
        }
    }

    private func goOnText() -> String {
        switch (style, refreshRole) {
        /// 处理 .left 分支
        case (.left, .refresh):   return JobsRefreshConfig.h.left.refreshGoOn
        /// 处理 .left 分支
        case (.left, .loadMore):  return JobsRefreshConfig.h.left.loadMoreGoOn
        /// 处理 .right 分支
        case (.right, .refresh):  return JobsRefreshConfig.h.right.refreshGoOn
        /// 处理 .right 分支
        case (.right, .loadMore): return JobsRefreshConfig.h.right.loadMoreGoOn
        }
    }

    private func readyText() -> String {
        switch refreshRole {
        /// 处理 .refresh 分支
        case .refresh:  return JobsRefreshConfig.common.readyRefresh
        /// 处理 .loadMore 分支
        case .loadMore: return JobsRefreshConfig.common.readyLoadingMore
        }
    }

    private func refreshingText() -> String {
        switch refreshRole {
        /// 处理 .refresh 分支
        case .refresh:  return JobsRefreshConfig.common.refreshing
        /// 处理 .loadMore 分支
        case .loadMore: return JobsRefreshConfig.common.loadingMore
        }
    }
    // MARK: - Arrow rotate
    private func idleArrowDirection() -> ArrowDirection {
        // 左侧控件（右拉）：idle 向左（指向内容外侧）；右侧控件（左拉）：idle 向右
        switch style {
        /// 处理 .left 分支
        case .left:  return .left
        /// 处理 .right 分支
        case .right: return .right
        }
    }

    private func readyArrowDirection() -> ArrowDirection {
        // ready 翻转
        switch style {
        /// 处理 .left 分支
        case .left:  return .right
        /// 处理 .right 分支
        case .right: return .left
        }
    }

    private func applyArrow(direction: ArrowDirection, animated: Bool) {
        // 以 arrow.left 为基准
        let base: CGAffineTransform = .identity
        let target: CGAffineTransform = {
            switch direction {
            /// 处理 .left 分支
            case .left:  return base
            /// 处理 .right 分支
            case .right: return CGAffineTransform(rotationAngle: .pi)
            }
        }()
        let willBeReadyDirection = (direction == readyArrowDirection())
        if animated {
            UIView.jobsAnimateWithOptions(
                rotationDuration,
                delay: 0,
                options: [.beginFromCurrentState, .allowUserInteraction],
                animations: { self.arrow.transform = target }
            )
        } else {
            arrow.byTransform(target)
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
        refreshRole = .loadMore
    }
}

@MainActor
public final class JobsDefaultLeftRefresher: JobsSideIndicatorView {
    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        heightOrWidth = 60
        style = .left
        refreshRole = .refresh
    }
}
