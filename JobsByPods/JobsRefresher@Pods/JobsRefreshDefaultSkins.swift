//
//  JobsRefreshDefaultSkins.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/31/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines

@MainActor
public enum JobsRefreshConfig {
    // MARK: - 通用（可复用的状态文案）
    public enum common {
        /// Header/Left：达到阈值
        public static let readyRefresh = "松开立即刷新".tr
        /// Footer/Right：达到阈值
        public static let readyLoadingMore = "松开立即加载更多".tr
        // 兼容旧命名（JobsDefaultIndicatorView 等）
        public static let readyLoading = readyLoadingMore

        public static let refreshing = "正在刷新...".tr
        public static let loadingMore = "正在加载更多的数据...".tr

        public static let noMore = "没有更多了".tr
        public static let lastRefreshPrefix = "最后更新：".tr
    }

    // MARK: - 上下（Vertical）
    public enum v {
        /// 下拉刷新（Header）
        public enum header {
            public static let idle = "下拉可以刷新".tr
            public static let goOn = "继续下拉".tr
        }
        /// 上拉加载（Footer）
        public enum footer {
            public static let idle = "上拉可以加载更多".tr
            public static let goOn = "继续上拉".tr
        }
    }

    // MARK: - 左右（Side / Horizontal）
    public enum h {
        /// 右拉刷新（Left refresher：从左侧触发）
        public enum header {
            public static let idle = "右拉可以刷新".tr
            public static let goOn = "继续右拉".tr
        }
        /// 左拉加载（Right refresher：从右侧触发）
        public enum footer {
            public static let idle = "左拉可以加载".tr
            public static let goOn = "继续左拉".tr
        }
    }
}

// MARK: - Arrow + Spinner（竖向 Header/Footer 皮肤）
// 目标 UI：
// 1) idle：箭头 + 文案（Header：向下；Footer：向上）
// 2) ready：箭头旋转（Header：向上；Footer：向下）
// 3) refreshing：隐藏箭头，显示菊花 + 文案
// 4) Header：追加“最后更新：今天 HH:mm”
@MainActor
public class JobsArrowIndicatorView: UIView, JobsAnimatable, JobsRefreshTimeTrackable {

    public enum Style {
        case header
        case footer
    }

    /// 由外部（Header/Footer）设置
    public var style: Style = .header {
        didSet {
            // style 变化后，回到 idle 的箭头方向
            applyArrow(direction: idleArrowDirection(), animated: false)
            setNeedsLayout()
        }
    }

    public var heightOrWidth: CGFloat = 60

    private var lastRefreshedAt: Date?

    private lazy var arrow: UIImageView = {
        // 系统箭头：线条更接近 MJRefresh 的效果
        let iv: UIImageView
        if #available(iOS 13.0, *) {
            iv = UIImageView(image: UIImage(systemName: "arrow.up"))
        } else {
            // iOS 12：用空图占位（不引入额外资源）
            let v = UIImageView()
            v.backgroundColor = .clear
            iv = v
        }
        iv.contentMode = .scaleAspectFit
        iv.tintColor = JobsCor.secondaryLabel
        return self.byAddSubviewRetSub(iv)
    }()

    private lazy var indicator: UIActivityIndicatorView = {
        let v: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            v = UIActivityIndicatorView(style: .medium)
        } else {
            v = UIActivityIndicatorView(style: .gray)
        }
        v.byHidesWhenStopped(true)
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

    // 旋转控制
    private let rotationDuration: TimeInterval = 0.18
    private var isArrowInReadyDirection: Bool = false

    // 时间格式
    private static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = .current
        f.timeZone = .current
        f.dateFormat = "HH:mm"
        return f
    }()
    private static let dateTimeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = .current
        f.timeZone = .current
        f.dateFormat = "yyyy-MM-dd HH:mm"
        return f
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .clear
        indicator.stopAnimating()
        applyArrow(direction: idleArrowDirection(), animated: false)
    }

    required public init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - JobsRefreshTimeTrackable
    public func markRefreshed(at date: Date) {
        lastRefreshedAt = date
    }

    // MARK: - JobsAnimatable
    public func apply(state: JobsState) {
        switch state {
        case .idle:
            indicator.stopAnimating()
            arrow.isHidden = false
            applyArrow(direction: idleArrowDirection(), animated: isArrowInReadyDirection)
            displayText(idleText())

        case .pulling(let p):
            indicator.stopAnimating()
            arrow.isHidden = false
            if p >= 1 {
                applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
                displayText(readyText())
            } else {
                applyArrow(direction: idleArrowDirection(), animated: false)
                displayText(String(format: "%@ %.0f%%", goOnText(), min(1, max(0, p)) * 100))
            }

        case .ready:
            indicator.stopAnimating()
            arrow.isHidden = false
            applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
            displayText(readyText())

        case .refreshing:
            arrow.isHidden = true
            indicator.startAnimating()
            displayText(refreshingText())

        case .noMore:
            indicator.stopAnimating()
            arrow.isHidden = true
            displayText(JobsRefreshConfig.common.noMore)

        case .removed:
            indicator.stopAnimating()
            arrow.isHidden = true
            label.text = nil
        }
        setNeedsLayout()
    }

    // MARK: - Layout
    public override func layoutSubviews() {
        super.layoutSubviews()

        let availableW = bounds.width
        let availableH = bounds.height

        let iconSide: CGFloat = 18
        let spacing: CGFloat = 10
        let sidePadding: CGFloat = 12

        // 先按最大可用宽度测 label
        let maxLabelW = max(10, availableW - sidePadding * 2 - iconSide - spacing)
        let labelSize = label.sizeThatFits(CGSize(width: maxLabelW, height: .greatestFiniteMagnitude))

        // 让 “箭头 + 间距 + 文字块” 作为整体水平居中（满足你要求的垂直刷新：水平居中）
        let totalW = iconSide + spacing + labelSize.width
        let startX = max(sidePadding, (availableW - totalW) * 0.5)

        // 图标与文字在同一行，垂直居中对齐
        let centerY = availableH * 0.5
        arrow.frame = CGRect(x: startX, y: centerY - iconSide * 0.5, width: iconSide, height: iconSide)
        indicator.frame = arrow.frame

        label.frame = CGRect(
            x: startX + iconSide + spacing,
            y: centerY - labelSize.height * 0.5,
            width: labelSize.width,
            height: labelSize.height
        )
    }

    // MARK: - Text
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
                t = "今天 ".tr + Self.timeFormatter.string(from: d)
            } else {
                t = Self.dateTimeFormatter.string(from: d)
            }
            label.text = main + "\n" + JobsRefreshConfig.common.lastRefreshPrefix + t
        } else {
            label.text = main
        }
    }

    // MARK: - Arrow Direction / Rotation
    // 约定：用 “arrow.up” 作为基准，0 表示向上
    private enum ArrowDirection { case up, down }

    private func idleArrowDirection() -> ArrowDirection {
        // Header：idle 向下；Footer：idle 向上（与截图一致）
        switch style {
        case .header: return .down
        case .footer: return .up
        }
    }

    private func readyArrowDirection() -> ArrowDirection {
        // Header：ready 向上；Footer：ready 向下（与截图一致）
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

// MARK: - 默认竖向 Header/Footer（使用箭头皮肤）
@MainActor
public final class JobsDefaultHeader: JobsArrowIndicatorView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style = .header
        heightOrWidth = 60
    }
    required init?(coder: NSCoder) { fatalError() }
}

@MainActor
public final class JobsDefaultFooter: JobsArrowIndicatorView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style = .footer
        heightOrWidth = 60
    }
    required init?(coder: NSCoder) { fatalError() }
}

/// —— 横向侧拉专用：竖排文案 ——
/// 结构：指示器（上） + 竖排 UILabel（下），在非 refreshing 时隐藏转圈，仅显示竖排提示。


/// —— 横向刷新专用：仿 XZMRefresh / MJRefresh 的侧拉 UI ——
/// 目标效果（参考 XZMRefresh）：
/// 1) 侧拉时显示：底部箭头（左右指向）+ 竖排状态文案
/// 2) ready 时箭头旋转 180°
/// 3) refreshing 时隐藏箭头，显示菊花
/// 4) LeftRefresher（右拉刷新）额外显示“最后更新 …”竖排时间（与 XZMRefresh 一致）
///
/// 注意：文字区域要求垂直居中（整个内容块在父视图高度中垂直居中）
@MainActor
public class JobsSideArrowIndicatorView: UIView, JobsAnimatable, JobsRefreshTimeTrackable {

    public enum Style {
        /// 从左侧触发（右拉刷新）
        case leftHeader
        /// 从右侧触发（左拉加载更多）
        case rightFooter
    }

    public var heightOrWidth: CGFloat = 80
    public var style: Style = .leftHeader {
        didSet {
            applyArrow(direction: idleArrowDirection(), animated: false)
            setNeedsLayout()
        }
    }

    private var lastRefreshedAt: Date?

    private lazy var arrow: UIImageView = {
        let iv: UIImageView
        if #available(iOS 13.0, *) {
            iv = UIImageView(image: UIImage(systemName: "arrow.left"))
        } else {
            let v = UIImageView()
            v.backgroundColor = .clear
            iv = v
        }
        iv.contentMode = .scaleAspectFit
        iv.tintColor = JobsCor.secondaryLabel
        return self.byAddSubviewRetSub(iv)
    }()

    private lazy var indicator: UIActivityIndicatorView = {
        let v: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            v = UIActivityIndicatorView(style: .medium)
        } else {
            v = UIActivityIndicatorView(style: .gray)
        }
        v.byHidesWhenStopped(true)
        return self.byAddSubviewRetSub(v)
    }()

    /// 状态文案（竖排）
    private lazy var stateLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel()
                .byFont(.systemFont(ofSize: 14, weight: .medium))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    /// “最后更新 …”（竖排，仅 leftHeader 显示）
    private lazy var timeLabel: UILabel = {
        self.byAddSubviewRetSub(
            UILabel()
                .byFont(.systemFont(ofSize: 14, weight: .regular))
                .byTextColor(JobsCor.secondaryLabel)
                .byNumberOfLines(0)
                .byTextAlignment(.center)
        )
    }()

    private let rotationDuration: TimeInterval = 0.18
    private var isArrowInReadyDirection: Bool = false

    private static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = .current
        f.timeZone = .current
        f.dateFormat = "HH:mm"
        return f
    }()
    private static let dateTimeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = .current
        f.timeZone = .current
        f.dateFormat = "yyyy-MM-dd HH:mm"
        return f
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = .clear
        indicator.stopAnimating()
        applyArrow(direction: idleArrowDirection(), animated: false)
        refreshTimeTextIfNeeded()
    }

    required public init?(coder: NSCoder) { fatalError() }

    // MARK: - JobsRefreshTimeTrackable
    public func markRefreshed(at date: Date) {
        lastRefreshedAt = date
        refreshTimeTextIfNeeded()
        setNeedsLayout()
    }

    // MARK: - JobsAnimatable
    public func apply(state: JobsState) {
        switch state {
        case .idle:
            indicator.stopAnimating()
            arrow.isHidden = false
            applyArrow(direction: idleArrowDirection(), animated: isArrowInReadyDirection)
            setStateText(idleText())

        case .pulling(let p):
            indicator.stopAnimating()
            arrow.isHidden = false
            if p >= 1 {
                applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
                setStateText(readyText())
            } else {
                applyArrow(direction: idleArrowDirection(), animated: false)
                let percent = Int(min(1, max(0, p)) * 100)
                setStateText("\(goOnText()) \(percent)%")
            }

        case .ready:
            indicator.stopAnimating()
            arrow.isHidden = false
            applyArrow(direction: readyArrowDirection(), animated: !isArrowInReadyDirection)
            setStateText(readyText())

        case .refreshing:
            arrow.isHidden = true
            indicator.startAnimating()
            setStateText(refreshingText())

        case .noMore:
            indicator.stopAnimating()
            arrow.isHidden = true
            setStateText(JobsRefreshConfig.common.noMore)

        case .removed:
            indicator.stopAnimating()
            arrow.isHidden = true
            stateLabel.text = nil
            timeLabel.text = nil
        }

        refreshTimeTextIfNeeded()
        setNeedsLayout()
    }

    // MARK: - Layout (垂直居中)
    public override func layoutSubviews() {
        super.layoutSubviews()

        let availableW = bounds.width
        let availableH = bounds.height

        let arrowSide: CGFloat = 18
        let spacingY: CGFloat = 12      // 文案与箭头间距（类似 XZMRefresh）
        let labelSpacingX: CGFloat = 18 // 两列竖排文字间距

        // 竖排文字 size
        let maxLabelH = availableH * 0.9
        let stateSize = stateLabel.sizeThatFits(CGSize(width: availableW, height: maxLabelH))
        let timeSize = timeLabel.sizeThatFits(CGSize(width: availableW, height: maxLabelH))

        let showTime = (style == .leftHeader) && !(timeLabel.text ?? "").isEmpty
        let labelsW: CGFloat = showTime ? (stateSize.width + labelSpacingX + timeSize.width) : stateSize.width
        let labelsH: CGFloat = max(stateSize.height, showTime ? timeSize.height : 0)

        // 内容块总高度：labelsH + spacing + arrowSide（indicator 与 arrow 同位）
        let blockH = labelsH + spacingY + arrowSide
        let originY = (availableH - blockH) * 0.5

        // labels（水平居中放两列）
        let labelsOriginX = (availableW - labelsW) * 0.5
        let labelsY = originY

        if showTime {
            stateLabel.frame = CGRect(
                x: labelsOriginX,
                y: labelsY + (labelsH - stateSize.height) * 0.5,
                width: stateSize.width,
                height: stateSize.height
            )
            timeLabel.frame = CGRect(
                x: stateLabel.frame.maxX + labelSpacingX,
                y: labelsY + (labelsH - timeSize.height) * 0.5,
                width: timeSize.width,
                height: timeSize.height
            )
            timeLabel.isHidden = false
        } else {
            stateLabel.frame = CGRect(
                x: labelsOriginX,
                y: labelsY + (labelsH - stateSize.height) * 0.5,
                width: stateSize.width,
                height: stateSize.height
            )
            timeLabel.isHidden = true
        }

        // arrow / indicator：在内容块底部居中
        let arrowX = (availableW - arrowSide) * 0.5
        let arrowY = originY + labelsH + spacingY
        arrow.frame = CGRect(x: arrowX, y: arrowY, width: arrowSide, height: arrowSide)
        indicator.frame = arrow.frame
    }

    // MARK: - Text helpers
    private func setStateText(_ s: String) {
        stateLabel.text = s.verticalized
    }

    private func refreshTimeTextIfNeeded() {
        guard style == .leftHeader else {
            timeLabel.text = nil
            return
        }
        guard let d = lastRefreshedAt else {
            timeLabel.text = nil
            return
        }
        let calendar = Calendar.current
        let t: String
        if calendar.isDateInToday(d) {
            t = "今天 ".tr + Self.timeFormatter.string(from: d)
        } else {
            t = Self.dateTimeFormatter.string(from: d)
        }
        timeLabel.text = (JobsRefreshConfig.common.lastRefreshPrefix + t).verticalized
    }

    private func idleText() -> String {
        switch style {
        case .leftHeader:  return JobsRefreshConfig.h.header.idle
        case .rightFooter: return JobsRefreshConfig.h.footer.idle
        }
    }

    private func goOnText() -> String {
        switch style {
        case .leftHeader:  return JobsRefreshConfig.h.header.goOn
        case .rightFooter: return JobsRefreshConfig.h.footer.goOn
        }
    }

    private func readyText() -> String {
        switch style {
        case .leftHeader:  return JobsRefreshConfig.common.readyRefresh
        case .rightFooter: return JobsRefreshConfig.common.readyLoadingMore
        }
    }

    private func refreshingText() -> String {
        switch style {
        case .leftHeader:  return JobsRefreshConfig.common.refreshing
        case .rightFooter: return JobsRefreshConfig.common.loadingMore
        }
    }

    // MARK: - Arrow direction / rotation
    // 约定：用 “arrow.left” 作为基准，0 表示向左
    private enum ArrowDirection { case left, right }

    private func idleArrowDirection() -> ArrowDirection {
        // leftHeader：idle 向右（提示继续右拉）
        // rightFooter：idle 向左（提示继续左拉）
        switch style {
        case .leftHeader:  return .right
        case .rightFooter: return .left
        }
    }

    private func readyArrowDirection() -> ArrowDirection {
        // ready 时反向（旋转 180°）
        switch style {
        case .leftHeader:  return .left
        case .rightFooter: return .right
        }
    }

    private func applyArrow(direction: ArrowDirection, animated: Bool) {
        // arrow.left：默认向左；向右=旋转 π
        let target: CGAffineTransform = {
            switch direction {
            case .left:  return .identity
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
        }
        isArrowInReadyDirection = willBeReadyDirection
    }
}

@MainActor
public final class JobsDefaultRightRefresher: JobsSideArrowIndicatorView {
    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style = .rightFooter
        heightOrWidth = 80
    }
}

@MainActor
public final class JobsDefaultLeftRefresher: JobsSideArrowIndicatorView {
    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style = .leftHeader
        heightOrWidth = 80
    }
}

