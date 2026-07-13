//
//  Demo@球形特效（可拖动点选）.swift
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
import JobsBy3rdTools
import JobsScale
import JobsSwiftBaseDefines
import JobsTextTools
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class SphereDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 0
    private lazy var sphereView: SphereTagCloudView = {
        SphereTagCloudView()
            .byRadius(ScreenWidth() * (2/3))             // 球半径（如果为 nil，会在 layoutSubviews 里用 bounds 自动计算）
            .byPerspective(2.2)                          // 透视强度：越大越“扁”，越小越“立体”（建议 1.5~3）
            .byScaleRange(min: 0.35, max: 1.0)           // 深度映射到缩放的范围
            .byAlphaRange(min: 0.35, max: 1.0)           // 深度映射到透明度的范围
            .byRotationSensitivity(0.008)                // 手势灵敏度：越大拖动越“跟手”
            .byInertiaDamping(0.94)                      // 惯性阻尼（0~1，越接近 1 惯性越持久）
            .byAllowSimultaneousGestures(true)           // 是否允许同时识别（比如按钮点击 + 轻微拖动）
            .byAutoRotating(true)                        // 自动旋转开关
            .byAutoRotateSpeed(0.8)                      // 自动旋转速度（弧度/秒）
            .byItems(["1", "2", "3", "4", "5", "6",
                      "7", "8", "9", "10", "11", "12",
                      "13", "14", "15", "16", "17", "18"
                     ].map { makeTagButton(title: $0) }) // 数据源
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(320)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "拖动旋转 / 捏合缩放 / 点按标签".tr)
        sphereView.byVisible(YES)
    }

    private func makeTagButton(title: String) -> UIButton {
        UIButton.sys()
            .byBackgroundColor(.randomColor(), for: .normal)
            .byTitle(title, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byCornerRadius(14)
            .byMasksToBounds(true)
            .bySize { v in
                /// Sphere 初次布局需要有 size
                CGSize(width: v.bounds.width + 14, height: max(28, v.bounds.height + 10))
            }
            .onTap { sender in
                sender.byToggleSelected()
                sender.title?.toast;
                sender.playTapBounce(haptic: .light)  // 👈 临时放大→回弹（不注册任何手势/事件）
            }
    }
}
