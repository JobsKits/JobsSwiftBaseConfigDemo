//
//  JobsDeinitObserver.swift
//  Pods
//
//  Created by Jobs on 27/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import ObjectiveC
#if DEBUG
// MARK: —— Deinit 观察者（释放时回调）
public final class JobsDeinitObserver {
    let onDeinit: () -> Void
    init(_ onDeinit: @escaping () -> Void) { self.onDeinit = onDeinit }
    deinit { onDeinit() }
}
#endif

#if DEBUG
public enum JobsDebugDeinitInstaller {
    static var key: UInt8 = 0
    static func install(on vc: UIViewController, onDeinit: @escaping () -> Void) {
        // 防重复安装
        if objc_getAssociatedObject(vc, &key) != nil { return }
        let observer = JobsDeinitObserver(onDeinit)
        objc_setAssociatedObject(vc, &key, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
#endif

