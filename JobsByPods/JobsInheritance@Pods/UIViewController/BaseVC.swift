//
//  BaseVC.swift
//  JobsInheritance
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsSwiftDebugTools
import JobsByUIKit
import SnapKit

open class BaseVC: UIViewController,
                   UIViewControllerDebugDeinitProtocol {

    #if DEBUG
    private var coveragePageMarker: UILabel?
    #endif

    // 可选：自定义 tag
    public var debugDeinitTag: String {
        "Home"
    }

    deinit {
        print("✅ REAL deinit:",
              type(of: self))
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route"),
           view.accessibilityIdentifier?.isEmpty != false {
            view.byAccessibilityIdentifier("jobs.coverage.visible.\(String(describing: type(of: self)))")
        }
        #endif
    //        jobsSetupGKNav(title: "定义当前的标题")
    }
    /// 所有导航栈和模态子页面统一补齐导航栏、返回键及标题，根页面和自定义导航不受影响。
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        jobsEnsureNavigationDefaults()
    }
    /// 手势返回
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        jobsEnsureNavigationDefaults()
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route"),
           view.window != nil {
            if coveragePageMarker == nil {
                coveragePageMarker = UILabel.jobsMake { marker in
                    marker
                        .byFrame(CGRect(x: 8, y: 102, width: 1, height: 1))
                        .byTextColor(JobsCor.clear)
                        .byUserInteractionEnabled(false)
                        .byAddTo(view)
                }
            }
            coveragePageMarker?
                .byText("巡检子页面已显示")
                .byAccessibilityIdentifier("jobs.coverage.page.\(String(describing: type(of: self)))")
        }
        #endif
        guard let nav = navigationController else {
            return
        }
        // 只有当栈深 > 1 时才允许侧滑
        let canPop = nav.viewControllers.count > 1
        // 关键：把手势的 delegate 置空，交还给系统默认的触发逻辑
        nav.interactivePopGestureRecognizer?
            .byDelegate(nil)
            .byEnabled(canPop)
    }
}
