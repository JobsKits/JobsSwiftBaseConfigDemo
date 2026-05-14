//
//  JobsEmptyView.swift
//  JobsEmptyView
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsByUIKit
import JobsSwiftBlock
import JobsSwiftBaseDefines

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
        UILabel()
            .byText("暂无数据，点击重试".tr)
            .byTextColor(.lightGray)
            .byTextAlignment(.center)
            .byFont(.systemFont(ofSize: 16))
            .byAddTo(self) { [unowned self] make in
                make.center.equalToSuperview()
            }
    }()
    
    required init?(coder: NSCoder) { fatalError() }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        label.byVisible(YES)
        jobs_addGesture(tapGR)
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
