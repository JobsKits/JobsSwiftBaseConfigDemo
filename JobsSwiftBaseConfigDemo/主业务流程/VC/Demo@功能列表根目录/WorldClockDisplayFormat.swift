//
//  WorldClockDisplayFormat.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import Foundation
#if canImport(JobsSwiftDSL)
import JobsSwiftDSL
#endif

enum WorldClockDisplayFormat {

    static let preferenceKey = "com.jobs.worldClock.uses12HourFormat"

    static var uses12HourFormat: Bool {
        get {
            UserDefaults.standard.bool(forKey: preferenceKey)
        }
        set {
            UserDefaults.standard.set(newValue,
                                      forKey: preferenceKey)
        }
    }

    @discardableResult
    static func configure(_ formatter: DateFormatter,
                           uses12HourFormat: Bool) -> DateFormatter {
        formatter
            .byDateFormat(uses12HourFormat ? "hh:mm:ss a" : "HH:mm:ss")
            .byAMSymbol("AM")
            .byPMSymbol("PM")
    }
}
