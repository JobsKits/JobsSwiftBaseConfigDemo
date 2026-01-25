//
//  RefreshComponent.swift
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

@MainActor
public protocol JobsAnimatable: AnyObject {
    func apply(state: JobsState)
    var heightOrWidth: CGFloat { get }   // header/footer 用高度；left/right 用宽度
}

@MainActor
public class JobsDefaultIndicatorView: UIView, JobsAnimatable {

    // ✅ 关键：让同一个 IndicatorView 能区分自己是 Header 还是 Footer（或未来扩展 left/right）
    public var position: JobsPosition = .header

    public var heightOrWidth: CGFloat = 60

    private lazy var indicator: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .medium)
            .byHidesWhenStopped(true)
            .byAddTo(self)
    }()

    private lazy var label: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(.secondaryLabel)
            .byAddTo(self)
    }()

    required init?(coder: NSCoder) { fatalError() }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        indicator.byVisible(true)
        label.byVisible(true)
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
            return JobsRefreshConfig.common.loading
        }
    }

    private func noMoreText() -> String {
        return JobsRefreshConfig.common.noMore
    }

    public func apply(state: JobsState) {
        switch state {
        case .idle:
            indicator.stopAnimating()
            label.byText(idleText())

        case .pulling(let p):
            indicator.stopAnimating()
            label.byText(p >= 1
                         ? readyText()
                         : String(format: "%@ %.0f%%", goOnText(), min(1, p) * 100))

        case .ready:
            indicator.stopAnimating()
            label.byText(readyText())

        case .refreshing:
            indicator.startAnimating()
            label.byText(refreshingText())

        case .noMore:
            indicator.stopAnimating()
            // ✅ noMore 主要给 footer，用其它 position 时也不崩，兜底显示 common.noMore
            label.byText(noMoreText())

        case .removed:
            indicator.stopAnimating()
            label.byText(nil)
        }
        setNeedsLayout()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        indicator.sizeToFit()
        label.sizeToFit()
        let totalW = indicator.bounds.width + 8 + label.bounds.width
        let x = (bounds.width - totalW) * 0.5
        let y = (bounds.height - max(indicator.bounds.height, label.bounds.height)) * 0.5
        indicator.frame.origin = CGPoint(x: x, y: y)
        label.frame.origin = CGPoint(x: indicator.frame.maxX + 8,
                                     y: (bounds.height - label.bounds.height)/2)
    }
}
