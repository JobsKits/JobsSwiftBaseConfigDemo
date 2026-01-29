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

// MARK: —— Deinit 观察者（释放时回调）
public final class JobsDeinitObserver {
    private let onDeinit: () -> Void
    public init(_ onDeinit: @escaping () -> Void) { self.onDeinit = onDeinit }
    deinit { onDeinit() }
}

public enum JobsDebugDeinitInstaller {
    private static var key: UInt8 = 0

    @inline(__always)
    public static func install(on vc: UIViewController, onDeinit: @escaping () -> Void) {
        #if DEBUG
        if objc_getAssociatedObject(vc, &key) != nil { return }
        let observer = JobsDeinitObserver(onDeinit)
        objc_setAssociatedObject(vc, &key, observer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        #else
        _ = vc
        _ = onDeinit
        #endif
    }
}
