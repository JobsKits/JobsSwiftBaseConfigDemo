//
//  UIButton+Init.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - init
extension UIButton {
    public convenience init(x: CGFloat,
                            y: CGFloat,
                            w: CGFloat,
                            h: CGFloat,
                            target: AnyObject,
                            action: Selector) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        addTarget(target, action: action, for: .touchUpInside)
    }
    @available(iOS 7.0, *)
    public static func sys() -> UIButton {
        UIButton(type: .system).byBackgroundColor(.clear, for: .normal)
    }
    @available(iOS 13.0, *)
    public static func close() -> UIButton {
        UIButton(type: .close).byBackgroundColor(.clear, for: .normal)
    }

    public static func custom() -> UIButton {
        UIButton(type: .custom).byBackgroundColor(.clear, for: .normal)
    }

    public static func detailDisclosure() -> UIButton {
        UIButton(type: .detailDisclosure).byBackgroundColor(.clear, for: .normal)
    }

    public static func infoLight() -> UIButton {
        UIButton(type: .infoLight).byBackgroundColor(.clear, for: .normal)
    }

    public static func infoDark() -> UIButton {
        UIButton(type: .infoDark).byBackgroundColor(.clear, for: .normal)
    }

    public static func contactAdd() -> UIButton {
        UIButton(type: .contactAdd).byBackgroundColor(.clear, for: .normal)
    }
}
