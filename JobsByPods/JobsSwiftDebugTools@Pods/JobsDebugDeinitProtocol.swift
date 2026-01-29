//
//  JobsDebugDeinitProtocol.swift
//  Pods
//
//  Created by Jobs on 27/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsToast

// MARK: —— 可选开启 “销毁提示”
public protocol JobsDebugDeinitProtocol: AnyObject {
    var debugDeinitToastText: String { get }
    var debugDeinitToastEnabled: Bool { get }
    func enableDebugDeinitToast()
}

public extension JobsDebugDeinitProtocol where Self: UIViewController {
    var debugDeinitToastText: String { "当前控制器销毁成功".tr }
    var debugDeinitToastEnabled: Bool { true }

    func enableDebugDeinitToast() {
        #if DEBUG
        guard debugDeinitToastEnabled else { return }
        let vcType = String(describing: type(of: self))
        let timeText: String = {
            DateFormatter()
                .byDateFormat("HH:mm:ss")
                .string(from: Date())
        }()
        let text = "\(debugDeinitToastText) \(timeText)"
        JobsDebugDeinitInstaller.install(on: self) {
            print("deinit: \(vcType) \(timeText)")
            debugOnly {
                text.toast
            }
        }
        #else
        return
        #endif
    }
}
