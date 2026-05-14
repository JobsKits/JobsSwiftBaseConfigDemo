//
//  UserDefault.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

/*
 使用如下：
 struct AppStorage {
 @UserDefault(key: "token", defaultValue: nil)
 static var token: String?
 @UserDefault(key: "areaCode", defaultValue: "86")
 static var areaCode: String
 @UserDefault(key: "user", defaultValue: nil)
 static var user: kkUser?
 }
 AppStorage.token = "abc"   // 存
 AppStorage.token = nil     // 删除（自动）
 $AppStorage.token.remove() // 显式删除

 $AppStorage.areaCode.remove()
 let code = AppStorage.areaCode // 返回 "86"


 */

import Foundation

struct kkUser: Codable {
    var name: String
    var age: Int
}

struct AppStorage {
    @UserDefault(key: "token", defaultValue: nil)
    static var token: String?

    @UserDefault(key: "areaCode", defaultValue: "86")
    static var areaCode: String

    @UserDefault(key: "user", defaultValue: nil)
    static var user: kkUser?
}

@propertyWrapper
 struct UserDefault<Value: Codable> {

    private let key: String
    private let defaultValue: Value
    private let defaults: UserDefaults
    init(key: String, defaultValue: Value, suiteName: String? = nil) {
        self.key = key
        self.defaultValue = defaultValue
        self.defaults = suiteName.flatMap(UserDefaults.init) ?? .standard
    }

    var wrappedValue: Value {
        get {
            // 没有值，直接返回默认值
            guard defaults.object(forKey: key) != nil else {
                return defaultValue
            }
            // plist-safe 类型
            if let value = defaults.object(forKey: key) as? Value {
                return value
            }

            // Codable（struct / array / model array）
            if let data = defaults.data(forKey: key),
               let decoded = try? JSONDecoder().decode(Value.self, from: data) {
                return decoded
            }

            return defaultValue

        }
        set {
            // Optional == nil → 删除
            if let optional = newValue as? AnyOptional, optional.isNil {
                defaults.removeObject(forKey: key)
                return
            }
            // plist-safe 直接存
            if UserDefaults.isPlistSafeType(newValue) {
                defaults.set(newValue, forKey: key)
                defaults.synchronize()
                return
            }
            // Codable -> Data
            if let data = try? JSONEncoder().encode(newValue) {
                defaults.set(data, forKey: key)
                defaults.synchronize()
            }
        }
    }
    ///关键：暴露 wrapper 本身
    var projectedValue: UserDefault<Value> { self }

    ///显式删除能力
    public func remove() {
        defaults.removeObject(forKey: key)
    }
}

//MARK: ******UserDefaults+Helper******
extension UserDefaults {

    /// 判断是否是 UserDefaults 可直接存储的类型
    static func isPlistSafeType(_ value: Any) -> Bool {
        switch value {
        case is String,
             is Int,
             is Bool,
             is Double,
             is Float,
             is Data,
             is [String],
             is [Int],
             is [Bool],
             is [Double],
             is [Float],
             is [AnyHashable: Any]:
            return true
        default:
            return false
        }
    }
}
//MARK: ******AnyOptional******
protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
