//
//  JobsRefreshComponent.swift
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
public protocol JobsAnimatable: AnyObject {
    func apply(state: JobsState)
    var heightOrWidth: CGFloat { get }   // header/footer 用高度；left/right 用宽度
}
/// ✅ 记录“上一次刷新时间”（首次 nil 不显示）
@MainActor
public protocol JobsRefreshTimeTrackable: AnyObject {
    func markRefreshed(at date: Date)
}

@MainActor
public class JobsDefaultIndicatorView: UIView, JobsAnimatable, JobsRefreshTimeTrackable {
    // ✅ 关键：让同一个 IndicatorView 能区分自己是 Header 还是 Footer（或未来扩展 left/right）
    public var position: JobsPosition = .header
    public var heightOrWidth: CGFloat = 60
    // ✅ 上次刷新时间（仅 header/left 使用）
    private var lastRefreshedAt: Date?
    // ✅ 有了刷新时间后固定两行高度，避免百分比变化时布局闪动
    private var fixedLabelHeight: CGFloat?
    private static let timeFormatter: DateFormatter = {
        DateFormatter()
            .byLocale(.current)
            .byTimeZone(.current)
            .byDateFormat("HH:mm:ss")
    }()

    private lazy var indicator: UIActivityIndicatorView = {
        let v: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            v = UIActivityIndicatorView(style: .medium)
        } else {
            v = UIActivityIndicatorView(style: .gray)   // iOS 12 常用替代
        };return v.byHidesWhenStopped(true)
            .byAddTo(self)
    }()

    private lazy var label: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)          // ✅ 允许两行
            .byTextAlignment(.center)    // ✅ 两行居中更稳
            .byAddTo(self)
    }()

    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        indicator.byVisible(true)
        label.byVisible(true)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        indicator.sizeToFit()
        let maxLabelW = max(10, bounds.width - 20)
        // 有了 lastRefreshedAt 之后固定高度，避免闪
        if fixedLabelHeight == nil {
            fixedLabelHeight = computeFixedLabelHeightIfNeeded()
        }
        let labelH: CGFloat = fixedLabelHeight ?? ceil(label.sizeThatFits(
            CGSize(width: maxLabelW, height: .greatestFiniteMagnitude)
        ).height)
        let spacing: CGFloat = 8
        let totalH = indicator.bounds.height + spacing + labelH
        let originY = (bounds.height - totalH) * 0.5
        indicator.frame.origin = CGPoint(
            x: (bounds.width - indicator.bounds.width) * 0.5,
            y: originY
        )
        label.frame = CGRect(
            x: (bounds.width - maxLabelW) * 0.5,
            y: indicator.frame.maxY + spacing,
            width: maxLabelW,
            height: labelH
        )
    }
    // MARK: - JobsRefreshTimeTrackable
    public func markRefreshed(at date: Date) {
        lastRefreshedAt = date
        fixedLabelHeight = computeFixedLabelHeightIfNeeded()
        setNeedsLayout()
    }
    // MARK: - 文案分流（按 position）
    private func idleText() -> String {
        switch position {
        case .header:
            return JobsRefreshConfig.v.header.idle
        case .footer:
            return JobsRefreshConfig.v.footer.idle
        case .left:
            return JobsRefreshConfig.h.header.idle
        case .right:
            return JobsRefreshConfig.h.footer.idle
        }
    }

    private func goOnText() -> String {
        switch position {
        case .header:
            return JobsRefreshConfig.v.header.goOn
        case .footer:
            return JobsRefreshConfig.v.footer.goOn
        case .left:
            return JobsRefreshConfig.h.header.goOn
        case .right:
            return JobsRefreshConfig.h.footer.goOn
        }
    }

    private func readyText() -> String {
        // ✅ header/left = refresh；footer/right = loading
        switch position {
        case .header, .left:
            return JobsRefreshConfig.common.readyRefresh
        case .footer, .right:
            return JobsRefreshConfig.common.readyLoading
        }
    }

    private func refreshingText() -> String {
        // ✅ header/left = refreshing；footer/right = loading
        switch position {
        case .header, .left:
            return JobsRefreshConfig.common.refreshing
        case .footer, .right:
            return JobsRefreshConfig.common.readyLoading
        }
    }

    private func noMoreText() -> String {
        return JobsRefreshConfig.common.noMore
    }
    // ✅ 只对“刷新语义”（header/left）展示上次刷新时间
    private func shouldShowLastRefreshTime() -> Bool {
        switch position {
        case .header, .left: return true
        case .footer, .right: return false
        }
    }
    // ✅ 统一拼接：任意状态都能追加上次刷新
    private func decorate(_ main: String) -> String {
        guard shouldShowLastRefreshTime(),
              let d = lastRefreshedAt else { return main }
        let t = Self.timeFormatter.string(from: d)
        return main + "\n" + JobsRefreshConfig.common.lastRefreshPrefix + t
    }
    // ✅ 一旦有 lastRefreshedAt：固定两行高度（用“最大宽/最大长度样本”测一次）
    private func computeFixedLabelHeightIfNeeded() -> CGFloat? {
        guard shouldShowLastRefreshTime(), lastRefreshedAt != nil else { return nil }
        let maxW = max(10, bounds.width - 20)
        let sample = decorate(String(format: "%@ %.0f%%", goOnText(), 100.0))
        let rect = (sample as NSString).boundingRect(
            with: CGSize(width: maxW, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: label.font as Any],
            context: nil
        );return ceil(rect.height)
    }

    public func apply(state: JobsState) {
        switch state {
        case .idle:
            indicator.stopAnimating()
            displayText(decorate(idleText()))
        case .pulling(let p):
            indicator.stopAnimating()
            if p >= 1 {
                displayText(decorate(readyText()))
            } else {
                let main = String(format: "%@ %.0f%%", goOnText(), min(1, p) * 100)
                displayText(decorate(main))
            }
        case .ready:
            indicator.stopAnimating()
            displayText(decorate(readyText()))
        case .refreshing:
            indicator.startAnimating()
            displayText(decorate(refreshingText()))
        case .noMore:
            indicator.stopAnimating()
            displayText(decorate(noMoreText()))
        case .removed:
            indicator.stopAnimating()
            label.byText(nil)
        };setNeedsLayout()
    }

    private func displayText(_ text: String) {
        if position == .left || position == .right {
            label.byText(text.verticalized)
        } else {
            label.byText(text)
        }
    }
}
