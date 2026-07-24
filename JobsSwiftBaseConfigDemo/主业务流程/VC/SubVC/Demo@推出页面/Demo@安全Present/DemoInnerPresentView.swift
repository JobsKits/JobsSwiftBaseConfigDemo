//
//  DemoInnerPresentView.swift
//  JobsSwiftBaseConfigDemo
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
import SnapKit

// MARK: - UIResponder 内触发 presentVC 示例
final class DemoInnerPresentView: UIView {
    private lazy var titleLabel: UILabel = {
        UILabel()
            .byText("👉 点我 (View 内触发 presentSafely)".tr)
            .byNumberOfLines(0)
            .byTextColor(JobsCor.systemGreen)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
    }()

    private lazy var detailLabel: UILabel = {
        UILabel()
            .byText("👆 点击绿色区域也会触发 presentSafely".tr)
            .byNumberOfLines(0)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13))
    }()

    private lazy var contentStack: UIStackView = {
        UIStackView(arrangedSubviews: [
            titleLabel,
            detailLabel
        ])
            .byAxis(.vertical)
            .bySpacing(6)
            .byAlignment(.fill)
            .byAddTo(self) { [unowned self] make in
                make.edges.equalToSuperview().inset(18)
            }
    }()

    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer
            .byConfig { [weak self] gr in
                guard let self else { return }
                print("Tap 触发 on: \(String(describing: gr.view))")
                DemoDetailVC()
                    .byData("Jobs")// 字符串
                    .onResult { name in
                        print("回来了 \(String(describing: name))")
                    }
                    .byPresent(self)
            }
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentStack.byVisible(YES)
        jobs_addGestureRetView(tapGestureRecognizer)
    }
}
