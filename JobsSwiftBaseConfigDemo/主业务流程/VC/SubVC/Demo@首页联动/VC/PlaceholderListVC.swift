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
import JXSegmentedView

final class PlaceholderListVC: BaseVC, JXSegmentedListContainerViewListDelegate {
    private let titleText: String
    init(title: String) { self.titleText = title; super.init(nibName: nil, bundle: nil) }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    private lazy var tipLabel: UILabel = {
        UILabel()
            .byText("这里是「\(titleText)」示例页面")
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(view) { make in make.center.equalToSuperview() }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        tipLabel.byVisible(YES)
    }

    func listView() -> UIView { view }
}
