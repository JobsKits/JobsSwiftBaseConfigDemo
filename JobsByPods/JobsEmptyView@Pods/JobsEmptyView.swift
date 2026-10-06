//
//  JobsEmptyView.swift
//  JobsEmptyView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBlock
import JobsSwiftBaseDefines
import SnapKit

public class JobsEmptyView: UIView {
    private lazy var tapGR: UITapGestureRecognizer = {
        UITapGestureRecognizer
            .byConfig { [weak self] _ in
                guard let self else { return }
                self.jobsValueVoidCallback()
            }
            .byTaps(1)
            .byTouches(1)
            .byCancelsTouchesInView(true)
            .byEnabled(true)
            .byName("EmptyView.TapRetry")
    }()

    private lazy var label: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("暂无数据，点击重试".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byFont(UIFont.preferredFont(forTextStyle: .body))
            .byAddTo(self) { [unowned self] make in
                make.edges.equalToSuperview().inset(12)
            }
    }()

    public required init?(coder: NSCoder) { fatalError("Use init(frame:)") }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.byBackgroundColor(JobsCor.secondarySystemBackground)
        label.byVisible(YES)
        label.adjustsFontForContentSizeCategory = true
        isAccessibilityElement = true
        accessibilityLabel = label.text
        accessibilityTraits = .button
        label.isAccessibilityElement = false
        jobs_addGesture(tapGR)
    }
    public override func accessibilityActivate() -> Bool {
        jobsValueVoidCallback()
        return true
    }
}
/// DSL
extension JobsEmptyView{
    @discardableResult
    public func byOnTapRetry(_ block: @escaping jobsByVoidBlock) -> Self {
        jobsByVoidCallback(block)
        return self
    }
}
