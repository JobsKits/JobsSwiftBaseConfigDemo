//
//  BRDispatch.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//


import Foundation

@inline(__always)
func br_on_main_async(_ block: @escaping () -> Void) {
    if Thread.isMainThread { block() }
    else { DispatchQueue.main.async(execute: block) }
}
