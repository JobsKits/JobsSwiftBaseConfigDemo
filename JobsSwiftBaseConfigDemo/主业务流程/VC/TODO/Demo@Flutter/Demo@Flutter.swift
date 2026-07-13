//
//  Demo@Flutter.swift
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
import JobsSwiftBaseDefines
import JobsTextTools
import JobsScale
import JobsSwiftTools
import SnapKit

final class FlutterDemoVC: BaseVC {
    private lazy var exampleButton: UIButton = {
        UIButton.sys()
            /// 背景色
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            /// 普通字符串@设置主标题
            .byTitle("显示".tr, for: .normal)
            .byTitle("隐藏".tr, for: .selected)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleColor(JobsCor.systemRed, for: .selected)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            /// 普通@点按事件触发（这里按要求：弹出 Flutter + 双向传值）
            .onTap { [weak self] sender in
                guard let self else { return }
                FlutterBridge.shared.presentFlutter(
                    from: self,
                    route: "/page",
                    arguments: ["requestId": UUID().uuidString, "prefill": "hello from iOS"],
                    configure: { flutterVC in
                        // 这里随便用自己的 DSL，比如 modalStyle/半屏等
                        // flutterVC.byModalPresentationStyle(.fullScreen)
                    }
                ) { payload in
                    print("Flutter 回传：\(payload)")
                }

//                FlutterBridge.shared.pushFlutter(
//                    from: self,
//                    route: "/page",
//                    arguments: ["requestId": UUID().uuidString, "prefill": "hello from iOS"],
//                    configure: { flutterVC in
//                        // 项目里的“上下左右安全 Push”，就写这里：
//                        flutterVC.byDirection(.fromLeft)
//                    }
//                ) { payload in
//                    print("Flutter 回传：\(payload)")
//                }
            }
            /// 加到 view + 约束：居中
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalToSuperview()
                make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.centerY)
                make.height.equalTo(56)
                make.width.greaterThanOrEqualTo(240.w)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "Swift ➤ Flutter@Demo")
        exampleButton.byVisible(YES)
    }
}
