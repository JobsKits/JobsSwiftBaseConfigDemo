//
//  JobsSystemRefreshView.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import SnapKit

/// 系统菊花刷新插件。
public final class JobsSystemRefreshView: UIView, JobsRefreshAnimatorProtocol {
    public private(set) var indicatorSize = CGSize(width: 20, height: 20)

    private let indicatorView: UIActivityIndicatorView = {
        let style: UIActivityIndicatorView.Style
        if #available(iOS 13.0, *) {
            style = .medium
        } else {
            style = .gray
        };return UIActivityIndicatorView(style: style)
            .byHidesWhenStopped(true)
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        byUserInteractionEnabled(false)
        indicatorView.byAddTo(self) { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        byUserInteractionEnabled(false)
        indicatorView.byAddTo(self) { make in
            make.edges.equalToSuperview()
        }
    }

    public override var intrinsicContentSize: CGSize {
        indicatorSize
    }

    @discardableResult
    public func byIndicatorSize(_ indicatorSize: CGSize) -> Self {
        self.indicatorSize = CGSize(
            width: max(1, indicatorSize.width),
            height: max(1, indicatorSize.height)
        )
        invalidateIntrinsicContentSize()
        return self
    }

    public var refreshAnimatorView: UIView {
        self
    }

    public var refreshAnimatorPreferredSize: CGSize {
        indicatorSize
    }

    public func refreshAnimatorApply(phase: JobsRefreshAnimatorPhase,
                                     progress: CGFloat) {
        switch phase {
        /// 仅刷新态启动系统菊花
        case .refreshing:
            indicatorView.startAnimating()
            byHidden(false)
                .byAlpha(1)
        /// 其它阶段停止并隐藏
        case .idle, .pulling, .ready, .ending, .inactive:
            indicatorView.stopAnimating()
            byAlpha(0)
                .byHidden(true)
        }
    }
}
