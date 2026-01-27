//
//  JobsDebugDeinitAutoSwizzle.swift
//  Pods
//
//  Created by Jobs on 27/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC.runtime

@objcMembers
public final class JobsDebugDeinitAutoSwizzle: NSObject {
    public static func start() {
        #if DEBUG
        UIViewController.jobs_swizzleDebugDeinitOnce()
        #endif
    }
}
#if DEBUG
private var jobs_debugDeinit_swizzledKey: UInt8 = 0

private extension UIViewController {
    static func jobs_swizzleDebugDeinitOnce() {
        objc_sync_enter(self); defer { objc_sync_exit(self) }

        if (objc_getAssociatedObject(self, &jobs_debugDeinit_swizzledKey) as? Bool) == true { return }
        objc_setAssociatedObject(
            self,
            &jobs_debugDeinit_swizzledKey,
            true,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        let cls: AnyClass = UIViewController.self

        let originalSel = #selector(UIViewController.viewDidLoad)
        let swizzledSel = #selector(UIViewController.jobs_debugDeinit_viewDidLoad)

        guard
            let originalMethod = class_getInstanceMethod(cls, originalSel),
            let swizzledMethod = class_getInstanceMethod(cls, swizzledSel)
        else { return }

        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

    @objc func jobs_debugDeinit_viewDidLoad() {
        // 交换后这里调用的是原始 viewDidLoad
        jobs_debugDeinit_viewDidLoad()

        (self as? JobsDebugDeinitProtocol)?.enableDebugDeinitToast()
    }
}
#endif
