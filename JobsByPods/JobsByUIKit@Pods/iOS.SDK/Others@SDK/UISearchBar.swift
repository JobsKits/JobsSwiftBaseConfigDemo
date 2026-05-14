//
//  UISearchBar.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

extension UISearchBar {
    @discardableResult
    public func byDelegate(_ delegate: UISearchBarDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    public func byPlaceholder(_ text: String) -> Self {
        self.placeholder = text
        return self
    }

    @discardableResult
    public func byText(_ text: String) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    public func byBarTintColor(_ color: UIColor) -> Self {
        self.barTintColor = color
        return self
    }

    @discardableResult
    public func byShowsCancelButton(_ show: Bool) -> Self {
        self.showsCancelButton = show
        return self
    }
}
