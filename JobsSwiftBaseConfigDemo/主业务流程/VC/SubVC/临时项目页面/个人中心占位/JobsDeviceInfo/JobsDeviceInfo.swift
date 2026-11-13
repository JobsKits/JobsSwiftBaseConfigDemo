//
//  JobsDeviceInfo.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

/// 仅使用公开 API；IDFV 与真实 UDID 不同，不能替代硬件标识。
enum JobsDeviceInfo {

    static func fields(collection: JobsDeviceCollectionSession? = nil) -> [JobsUserInfoField] {
        let device = UIDevice.current
        let text = JobsDeviceCollectionText.text
        let restriction = text("unavailable")
        let deviceName = device.name.isEmpty ? restriction : device.name
        let systemVersion = device.systemVersion.isEmpty
            ? restriction
            : "\(device.systemName) \(device.systemVersion)"
        let local = [
            JobsUserInfoField(name: text("deviceName"),
                              value: deviceName,
                              sourceDescription: text("local")),
            JobsUserInfoField(name: text("osVersion"),
                              value: systemVersion,
                              sourceDescription: text("local"))
        ]
        let values = collection?.device?.values ?? [
            ("udid", nil), ("imei", nil), ("imei2", nil), ("iccid", nil), ("meid", nil),
            ("osVersion", nil), ("modelName", nil), ("serial", nil), ("modelNumber", nil),
            ("seid", nil), ("product", nil), ("version", nil)
        ]
        return local + values.map { key, rawValue in
            let value = rawValue?.trimmingCharacters(in: .whitespacesAndNewlines)
            let valid = value.map {
                !$0.isEmpty && $0.count <= 320 && $0.rangeOfCharacter(from: .controlCharacters) == nil
            } ?? false
            let udidValid = key != "udid" || collection?.device?.hasValidUDID == true
            let available = valid && udidValid
            let name = ["udid", "imei", "imei2", "iccid", "meid", "seid"].contains(key)
                ? key.uppercased()
                : text(key)
            let source = collection?.device?.fieldSources?[key]
            let sourceKey = ["profile": "profile", "manual": "manual", "derived": "derived",
                             "browser": "browserSource", "browser-hint": "browserSource", "selected": "manual"][source ?? ""] ?? "unknown"
            return JobsUserInfoField(name: name,
                                     value: available ? value! : restriction,
                                     isSystemRestricted: !available,
                                     sourceDescription: available ? text(sourceKey) : nil)
        }
    }
}
