//
//  Demo@键盘.swift
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

import JobsSwiftBaseDefines
import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsInheritance
import SnapKit
import IQKeyboardManagerSwift
import GKNavigationBarSwift

final class KeyboardDemoVC: BaseVC {
    // 输入框
    private lazy var textField: UITextField = {
        UITextField.jobsMake { _ in }
            .byPlaceholder("请输入文字，弹出键盘试试".tr)
            .byBorderStyle(.roundedRect)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(80.h)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(44)
            }
    }()
    // 底部工具栏（跟随键盘上移）
    private lazy var bottomBar: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemGray6)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.height.equalTo(60)
                make.bottom.equalTo(view.keyboardLayoutGuide.snp.top)
            }
    }()

    private lazy var label: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("我是底部栏，会跟随键盘上移".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAddTo(bottomBar) { make in
                make.edges.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        disableIQKeyboardDistanceHandling()
        jobsSetupGKNav(
            title: "Keyboard Height Demo"
        )
        textField.byVisible(YES)
        bottomBar.byVisible(YES)
        label.byVisible(YES)
    }
}

private extension KeyboardDemoVC {
    /// 该页交给 keyboardLayoutGuide 跟踪键盘，避免根视图被额外平移。
    func disableIQKeyboardDistanceHandling() {
        let manager = IQKeyboardManager.shared
        let currentType = ObjectIdentifier(KeyboardDemoVC.self)
        guard !manager.disabledDistanceHandlingClasses.contains(where: {
            ObjectIdentifier($0) == currentType
        }) else { return }
        manager.disabledDistanceHandlingClasses.append(KeyboardDemoVC.self)
    }
}
