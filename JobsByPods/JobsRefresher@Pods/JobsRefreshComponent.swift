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

    public func apply(state: JobsState) {
        switch state {
        case .idle:
            indicator.stopAnimating()
            label.byText(JobsRefreshConfig.v.header.idle)
        case .pulling(let p):
            indicator.stopAnimating()
            label.byText(p >= 1
                         ? JobsRefreshConfig.common.readyLoading
                         : String(format: "%@ %.0f%%", JobsRefreshConfig.v.header.goOn, min(1, p) * 100))
        case .ready:
            indicator.stopAnimating()
            label.byText(JobsRefreshConfig.common.readyLoading)
        case .refreshing:
            indicator.startAnimating()
            label.byText(JobsRefreshConfig.common.loading)
        case .noMore:
            indicator.stopAnimating()
            label.byText(JobsRefreshConfig.common.noMore)
        case .removed:
            indicator.stopAnimating()
            label.byText(nil)
        };setNeedsLayout()
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
