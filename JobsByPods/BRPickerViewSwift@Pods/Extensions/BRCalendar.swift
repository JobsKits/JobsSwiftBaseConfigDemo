//
//  BRCalendar.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//


import Foundation

enum BRCalendar {
    static var gregorian: Calendar = {
        var cal = Calendar(identifier: .gregorian)
        cal.locale = Locale(identifier: "en_US_POSIX")
        cal.timeZone = .current
        return cal
    }()
}
