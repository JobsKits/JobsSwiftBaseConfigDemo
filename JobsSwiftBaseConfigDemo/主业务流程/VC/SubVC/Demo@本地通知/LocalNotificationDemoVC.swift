//
//  LocalNotificationDemoVC.swift
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
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsTextTools
import JobsLocalNotification
import SnapKit
import RxSwift
import RxCocoa

final class LocalNotificationDemoVC: BaseVC {
    private lazy var btn: UIButton = {
        UIButton.sys()
            /// 背景色
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            /// 普通字符串@设置主标题
            .byTitle("点我".tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            /// 普通字符串@设置副标题
            .bySubTitle("推送本地通知".tr, for: .normal)
            .bySubTitleColor(JobsCor.systemPink, for: .normal)
            .bySubTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            /// 普通@点按事件触发
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.byToggleSelected()
                JobsMakeLocalNotification().triggerLocalNotification(JobsLocalNotificationModel())
            }
            .byAddTo(view) { [unowned self] make in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: 100, height: 60))
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "推送本地通知".tr)
        btn.byVisible(true)
        NotificationCenter.default.rx
            .notification(Notification.Name("IFReceivedSocketPush"))
            .observe(on: MainScheduler.instance) // 需要更新 UI 的话
            .subscribe(onNext: { [weak self] noti in
            })
            .disposed(by: disposeBag)
    }
}
