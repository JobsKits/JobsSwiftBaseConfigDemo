//
//  BRiOS12SafePickerReload.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

enum BRiOS12SafePickerReload {
    /// iOS 12/13 wheel picker can glitch if you reload synchronously during scrolling.
    static func reload(_ picker: UIPickerView, component: Int? = nil) {
        br_on_main_async {
            if let c = component { picker.reloadComponent(c) }
            else { picker.reloadAllComponents() }
        }
    }
}
