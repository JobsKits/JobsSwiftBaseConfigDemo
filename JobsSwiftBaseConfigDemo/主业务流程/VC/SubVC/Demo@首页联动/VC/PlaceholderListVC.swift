//
//  PlaceholderListVC.swift
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

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit
import Jobsl10n
import JXSegmentedView

final class PlaceholderListVC: BaseVC,
                               JXSegmentedListContainerViewListDelegate {

    private let titleText: String
    private let routeID: String
    init(title: String, routeID: String = "placeholder") {
        self.titleText = title
        self.routeID = routeID
        super.init(nibName: nil,
                   bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var tipLabel: UILabel = {
        UILabel
            .jobsMake { _ in }
            .byText("这里是「%@」示例页面".tr(titleText.tr))
            .byAccessibilityIdentifier("jobs.linkage.page.\(routeID)")
            .byFont(JobsFont.systemFont(ofSize: 16,
                                        weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(view) { make in
                make.center.equalToSuperview()
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        tipLabel.byVisible(YES)
        TRBind.bind(tipLabel,
                    key: "这里是「%@」示例页面") { [weak self] target, format in
            guard let self else {
                return
            }
            target.byText(String(format: format, self.titleText.tr))
        }
    }

    func listView() -> UIView {
        view
    }
}
