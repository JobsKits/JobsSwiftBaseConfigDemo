//
//  BaseVC.swift
//  JobsInheritance
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
import JobsSwiftDebugTools

open class BaseVC: UIViewController,UIViewControllerDebugDeinitProtocol {
    // 可选：自定义 tag
    public var debugDeinitTag: String { "Home" }
    
    deinit {
        print("✅ REAL deinit:", type(of: self))
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        jobsSetupGKNav(title: "定义当前的标题")
    }
    /// 手势返回
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let nav = navigationController else { return }
        // 只有当栈深 > 1 时才允许侧滑
        let canPop = nav.viewControllers.count > 1
        // 关键：把手势的 delegate 置空，交还给系统默认的触发逻辑
        nav.interactivePopGestureRecognizer?.delegate = nil
        nav.interactivePopGestureRecognizer?.isEnabled = canPop
    }
}
