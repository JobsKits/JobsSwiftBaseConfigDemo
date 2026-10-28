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

    static func fields() -> [JobsUserInfoField] {
        let device = UIDevice.current
        let restriction = "iOS 不向普通应用提供"
        let deviceName = device.name.isEmpty ? "系统未返回设备名称" : device.name
        let systemVersion = device.systemVersion.isEmpty
            ? "系统未返回版本信息"
            : "\(device.systemName) \(device.systemVersion)"
        return [
            JobsUserInfoField(name: "UDID",
                              value: restriction,
                              isSystemRestricted: true),
            JobsUserInfoField(name: "设备名称",
                              value: deviceName),
            JobsUserInfoField(name: "IMEI",
                              value: restriction,
                              isSystemRestricted: true),
            JobsUserInfoField(name: "系统版本",
                              value: systemVersion),
            JobsUserInfoField(name: "序列号",
                              value: restriction,
                              isSystemRestricted: true)
        ]
    }
}
