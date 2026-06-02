//
//  Demo@UIButton上背景色 ➤ state.swift
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

import SnapKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import JobsSwiftBaseDefines
/// Demo：演示 byBackgroundColor 在不同 state 下的效果（通过 isEnabled 切换 disabled）
/// - 重点：给 .normal / .disabled / .highlighted / .selected 分别设置背景色
/// - 交互：
///   1) “切换 isEnabled” 按钮：控制主按钮 enabled/disabled（看 disabled 背景色）
///   2) 点主按钮：切换 selected（看 selected 背景色）
///   3) 长按主按钮：进入 highlighted（看 highlighted 背景色）
final class UIButtonBackgroundColorDemoVC: BaseVC {
    // MARK: - UI
    private lazy var exampleButton: UIButton = {
        UIButton.sys()
            .byTitle("Hi", for: .normal)
            .byTitle("Selected（再点切回）", for: .selected)
            .byTitleFont(.systemFont(ofSize: 16, weight: .semibold))
            /// ✅ 核心：按 state 设置背景色
            .byTitleColor(.yellow, for: .normal)
            .byTitleColor(.red, for: .disabled)
            .byBackgroundColor(.systemGreen, for: .normal)
            .byBackgroundColor(.systemGray, for: .disabled)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(50)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
            .byCornerRadius(12)
            .byMasksToBounds(true)
    }()

    private lazy var toggleEnabledButton: UIButton = {
        UIButton.sys()
            .byTitle("切换 isEnabled", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byBackgroundColor(.systemBlue, for: .normal)
            .byBackgroundColor(.systemBlue.withAlphaComponent(0.7), for: .highlighted)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.exampleButton.isEnabled.toggle()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.exampleButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "根据不同的UIButton.state，设置不同的背景色")
        
        exampleButton.byVisible(YES)
        toggleEnabledButton.byVisible(YES)
    }
}
