//
//  UIWindowScene.swift
//  JobsGetWindow
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

@available(iOS 13.0, *)
public extension UIWindowScene {

    #if os(iOS)
    /// 始终读取当前 Scene；新系统不再使用已废弃的方向属性。
    var interfaceOrientationCompat: UIInterfaceOrientation {
        if #available(iOS 16.0, *) {
            return effectiveGeometry.interfaceOrientation
        } else {
            return legacyInterfaceOrientation
        }
    }

    @available(iOS, introduced: 13.0, deprecated: 26.0)
    private var legacyInterfaceOrientation: UIInterfaceOrientation {
        return interfaceOrientation
    }
    #endif

    var keyWindowCompat: UIWindow? {
        if #available(iOS 15.0, *) {
            return self.keyWindow
        } else {
            return self.windows.first(where: {
                $0.isKeyWindow
            })
        }
    }
}

@available(*, deprecated, message: "Use UIWindowScene.keyWindowCompat instead.")
public func legacyKeyWindowPreiOS13() -> UIWindow? {
    if #available(iOS 13.0, *) {
        return UIApplication.shared.connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .first {
                $0.activationState == .foregroundActive
            }?
            .keyWindowCompat
    } else {
        return UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
    }
}
