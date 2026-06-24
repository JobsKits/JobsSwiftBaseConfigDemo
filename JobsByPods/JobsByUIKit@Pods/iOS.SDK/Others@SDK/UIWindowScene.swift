//
//  UIWindowScene.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

@available(iOS 13.0, *)
extension UIWindowScene {
    public var keyWindowCompat: UIWindow? {
        if #available(iOS 15.0, *) {
            return self.keyWindow
        } else {
            return self.windows.first(where: { $0.isKeyWindow })
        }
    }
}

@available(*, deprecated, message: "Use UIWindowScene.keyWindow instead on iOS 13+")
public func legacyKeyWindowPreiOS13() -> UIWindow? {
    return UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
}
