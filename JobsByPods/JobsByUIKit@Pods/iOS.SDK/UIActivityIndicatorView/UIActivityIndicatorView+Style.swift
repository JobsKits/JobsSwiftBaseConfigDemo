//
//  UIActivityIndicatorView+Style.swift
//  Pods
//
//  Created by Jobs on 29/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public enum JobsIndicatorStyle {
    case medium
    case large

    var uiStyle: UIActivityIndicatorView.Style {
        switch self {
        case .medium:
            if #available(iOS 13.0, *) { return .medium }
            return .gray
        case .large:
            if #available(iOS 13.0, *) { return .large }
            return .whiteLarge
        }
    }
}

public extension UIActivityIndicatorView {
    convenience init(jobsStyle: JobsIndicatorStyle) {
        self.init(style: jobsStyle.uiStyle)
    }
}
