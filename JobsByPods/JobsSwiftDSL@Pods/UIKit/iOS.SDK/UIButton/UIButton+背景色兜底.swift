//
//  UIButton+背景色兜底.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines

// MARK: - 背景色兜底
extension UIButton {

    public func setBgCor(_ color: UIColor,
                         forState: UIControl.State) {
        let size = CGSize(width: 1,
                          height: 1)
        let image = JobsGraphics.image(size: size,
                                        scale: 1) { context in
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero,
                                size: size))
        }
        setBackgroundImage(image,
                           for: forState)
    }

    public func setBackgroundColor(_ color: UIColor,
                                   forState state: UIControl.State) {
        let size = CGSize(width: 1,
                          height: 1)
        let image = JobsGraphics.image(size: size) { context in
            context.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero,
                                size: size))
        }
        setBackgroundImage(image,
                           for: state)
    }
}
