//
//  Demo@苹果滑动开锁.swift
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
import JobsBy3rdTools
import JobsInheritance
import JobsGestureUnlock
import JobsSwiftBaseDefines
import SnapKit

final class SlideToUnlockDemoVC: BaseVC {
    private lazy var slideView: SlideToUnlockView = {
        SlideToUnlockView()
            .byBackgroundColor(JobsCor.clear)
//            .byDirection(.rightToLeft)      // 从右往左滑动解锁
            .bySkeletonEnabled(true)          // 开启骨架屏闪动
            .byOnUnlock {[weak self] in
                guard let self else { return }
                print("✅ 已滑到最右侧，执行解锁 block")
                goBack(nil)
            }
            .byAddTo(view) { [unowned self] make in
                make.center.equalToSuperview()
                make.width.equalTo(260)
                make.height.equalTo(56)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        slideView.byVisible(YES)
    }
}
