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
    /// 自定义文案（可选）
    var debugDeinitToastText: String { get }
    /// 是否开启（可选）
    var debugDeinitToastEnabled: Bool { get }
    /// 手动调用一次即可完成挂钩
    func enableDebugDeinitToast()
}

public extension JobsDebugDeinitProtocol where Self: UIViewController {
    var debugDeinitToastText: String { "当前控制器销毁成功".tr }
    var debugDeinitToastEnabled: Bool { true }
    func enableDebugDeinitToast() {
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
    }
}
