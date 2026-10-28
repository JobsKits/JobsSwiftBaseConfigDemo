//
//  JobsDeviceGuardConfiguration.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Foundation

public struct JobsDeviceGuardConfiguration: Sendable {

    public var featurePaths: [String] = [
        "/Applications/Cydia.app",
        "/Applications/Sileo.app",
        "/Applications/Zebra.app",
        "/private/var/lib/apt",
        "/private/var/lib/cydia",
        "/private/var/jailbreakcaches",
        "/usr/sbin/sshd",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/Library/MobileSubstrate/DynamicLibraries",
        "/var/jb",
        "/var/jb/Applications/Sileo.app",
        "/var/jb/usr/lib/libellekit.dylib",
        "/var/jb/Library/MobileSubstrate/MobileSubstrate.dylib"
    ]
    public var suspiciousImageNames: [String] = [
        "MobileSubstrate.dylib",
        "Substrate.dylib",
        "SubstrateLoader.dylib",
        "Substitute.dylib",
        "substitute-inserter.dylib",
        "libsubstitute.dylib",
        "libhooker.dylib",
        "libellekit.dylib",
        "ellekit.dylib",
        "FridaGadget.dylib",
        "frida-gadget.dylib",
        "frida-agent.dylib",
        "libcycript.dylib"
    ]
    /// 默认只读。打开后只尝试创建独占随机空文件，并清理本次创建的文件。
    public var enablesSandboxWriteProbe = false
    /// 有效范围 2…3，避免多条同类路径造成“多信号”假象。
    public var minimumDetectedCategories = 2

    public init() {
    }

    public func bySandboxWriteProbe(_ enabled: Bool) -> Self {
        var copy = self
        copy.enablesSandboxWriteProbe = enabled
        return copy
    }

    public func byMinimumDetectedCategories(_ count: Int) -> Self {
        var copy = self
        copy.minimumDetectedCategories = count
        return copy
    }

    public func byFeaturePaths(_ paths: [String]) -> Self {
        var copy = self
        copy.featurePaths = paths
        return copy
    }

    public func bySuspiciousImageNames(_ names: [String]) -> Self {
        var copy = self
        copy.suspiciousImageNames = names
        return copy
    }

}
