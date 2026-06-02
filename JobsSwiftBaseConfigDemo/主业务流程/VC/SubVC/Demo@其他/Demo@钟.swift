//
//  Demo@钟.swift
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
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsSwiftTimer
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftBaseDefines

final class ClockDemoVC: BaseVC {
    
    private lazy var clockView: JobsClockView = {
        JobsClockView()
            .byAddTo(view) { [weak self] make in
                guard let self else { return }
                make.center.equalToSuperview()
                make.width.height.equalTo(240)   // 正方形表盘
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        jobsSetupGKNav(
            title: "时钟".tr
        )
        clockView.byVisible(YES)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 页面展示后开始走表
        // clockView.start(kind: .gcd)
        // 想要秒针顺滑可以换成 .displayLink + interval = 1/60
        clockView.start(kind: .displayLink)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 离开页面就停掉，避免退出动画/释放窗口期仍在 tick
        clockView.stop()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
