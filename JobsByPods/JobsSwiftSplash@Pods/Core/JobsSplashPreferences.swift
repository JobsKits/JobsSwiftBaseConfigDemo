//
//  JobsSplashPreferences.swift
//  JobsSwiftSplash
//
//  Created by Jobs on 2026年6月24日，星期三.
//

import Foundation

public enum JobsSplashPreferences {
    private static let enabledKey = "JobsSwiftSplash.isEnabledForNextLaunch"

    public static var isEnabledForNextLaunch: Bool {
        get {
            guard UserDefaults.standard.object(forKey: enabledKey) != nil else { return true };return UserDefaults.standard.bool(forKey: enabledKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: enabledKey)
        }
    }

    @discardableResult
    public static func toggleForNextLaunch() -> Bool {
        isEnabledForNextLaunch.toggle()
        return isEnabledForNextLaunch
    }
}
