//
//  LocalNotificationDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/17/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import Inheritance
import JobsByUIKit
import JobsBy3rdTools
import JobsTextTools

final class LocalNotificationDemoVC: BaseVC {
    private lazy var btn: UIButton = {
        UIButton.sys()
            /// 背景色
            .byBackgroundColor(.systemGreen, for: .normal)
            /// 普通字符串@设置主标题
            .byTitle("点我", for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            /// 普通字符串@设置副标题
            .bySubTitle("推送本地通知", for: .normal)
            .bySubTitleColor(.systemPink, for: .normal)
            .bySubTitleFont(.systemFont(ofSize: 14, weight: .medium))
            /// 普通@点按事件触发
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.isSelected.toggle()
                JobsMakeLocalNotification().triggerLocalNotification(JobsLocalNotificationModel())
            }
            .byAddTo(view) { [unowned self] make in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: 100, height: 60))
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "推送本地通知")
        btn.byVisible(true)
    }
}
