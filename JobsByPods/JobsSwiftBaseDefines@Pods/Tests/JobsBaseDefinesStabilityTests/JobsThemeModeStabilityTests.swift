//
//  JobsThemeModeStabilityTests.swift
//  JobsSwiftBaseDefines
//
//  Created by Jobs on 2026年11月17日，星期二.
//

import Foundation
import UIKit
import XCTest

import JobsSwiftBaseDefines

@MainActor
final class JobsThemeModeStabilityTests: XCTestCase {

    func testLegacyStyleMigratesWithoutFollowingTheSystem() throws {
        let fixture = try ThemeFixture()
        defer {
            fixture.remove()
        }
        fixture.defaults.set("dark", forKey: "JobsTheme.currentStyle")
        fixture.center.updateSystemAppearance(.light)
        XCTAssertEqual(try fixture.configure(), .dark)
        XCTAssertEqual(fixture.center.currentMode, .dark)
        XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.currentMode"), "dark")
        fixture.center.updateSystemAppearance(.light)
        XCTAssertEqual(fixture.center.currentStyle, .dark)
    }

    func testFreshInstallFollowsSystemAndPersistsTheSelectionAcrossReloads() throws {
        let fixture = try ThemeFixture()
        defer {
            fixture.remove()
        }
        fixture.center.updateSystemAppearance(.dark)
        XCTAssertEqual(try fixture.configure(), .dark)
        XCTAssertEqual(fixture.center.currentMode, .system)
        fixture.center.updateSystemAppearance(.light)
        XCTAssertEqual(fixture.center.currentStyle, .light)
        XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.currentMode"), "system")
        XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.currentStyle"), "light")

        let relaunched = JobsThemeCenter(userDefaults: fixture.defaults)
        relaunched.updateSystemAppearance(.dark)
        XCTAssertEqual(try relaunched.configure(resource: "Theme", bundle: fixture.bundle), .dark)
        XCTAssertEqual(relaunched.currentMode, .system)
        XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.currentMode"), "system")
    }

    func testManualAndSystemChangesPublishOnlyMeaningfulTransitions() throws {
        let fixture = try ThemeFixture()
        defer {
            fixture.remove()
        }
        XCTAssertEqual(try fixture.configure(), .light)
        var changes = [(String?, String?)]()
        let observer = NotificationCenter.default.addObserver(forName: .JobsThemeDidChange,
                                                              object: fixture.center,
                                                              queue: .main) { notification in
            changes.append((notification.userInfo?["style"] as? String,
                            notification.userInfo?["mode"] as? String))
        }
        defer {
            NotificationCenter.default.removeObserver(observer)
        }
        fixture.center.updateSystemAppearance(.dark)
        fixture.center.updateSystemAppearance(.dark)
        fixture.center.updateSystemAppearance(.unspecified)
        XCTAssertEqual(changes.count, 1)
        XCTAssertEqual(changes.last?.0, "dark")
        XCTAssertEqual(changes.last?.1, "system")

        // 相同有效色仍须通知模式变化，菜单勾选与持久选择才能更新。
        fixture.center.setMode(.dark)
        XCTAssertEqual(changes.count, 2)
        fixture.center.updateSystemAppearance(.light)
        XCTAssertEqual(changes.count, 2)
        XCTAssertEqual(fixture.center.currentStyle, .dark)
        fixture.center.setMode(.system)
        XCTAssertEqual(fixture.center.currentStyle, .light)
        XCTAssertEqual(changes.count, 3)
        XCTAssertEqual(changes.last?.1, "system")
        XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.currentMode"), "system")
    }

    func testLegacyCustomStyleAndToggleRemainCompatible() throws {
        let fixture = try ThemeFixture()
        defer {
            fixture.remove()
        }
        fixture.defaults.set("brand.midnight", forKey: "JobsTheme.currentStyle")
        XCTAssertEqual(try fixture.configure().rawValue, "brand.midnight")
        XCTAssertEqual(fixture.center.currentMode, .custom(JobsThemeStyle(rawValue: "brand.midnight")))
        XCTAssertEqual(fixture.center.toggle(), .dark)
        XCTAssertEqual(fixture.center.currentMode, .dark)
        let custom = JobsThemeStyle(rawValue: "brand.midnight")
        XCTAssertEqual(fixture.center.setStyle(custom), custom)
        XCTAssertEqual(try fixture.configure(), custom)
        XCTAssertEqual(fixture.center.setStyle(JobsThemeStyle(rawValue: "missing")), custom)
        XCTAssertEqual(fixture.center.currentMode, .custom(custom))
        let target = NSObject()
        var redirected = false
        fixture.center.bind(target, slot: "legacyReturn") { _, center in
            if center.currentStyle == .dark, !redirected {
                redirected = true
                center.setStyle(.light)
            }
        }
        XCTAssertEqual(fixture.center.setStyle(.dark), .dark,
                       "Legacy setter returns the accepted style even when a binding reenters it")
        XCTAssertEqual(fixture.center.currentStyle, .light)
        fixture.center.unbind(target, slot: "legacyReturn")
    }

    func testLegacySystemAndPrefixIdentifiersRemainConcreteStylesAcrossReloads() throws {
        for identifier in ["system", "style:system", "system:dark"] {
            let fixture = try ThemeFixture()
            defer {
                fixture.remove()
            }
            let custom = JobsThemeStyle(rawValue: identifier)
            fixture.defaults.set(identifier, forKey: "JobsTheme.currentStyle")
            fixture.center.updateSystemAppearance(.dark)
            XCTAssertEqual(try fixture.configure(), custom)
            XCTAssertEqual(fixture.center.currentMode, .custom(custom))
            XCTAssertNotEqual(fixture.center.currentMode, .system)
            let encoded = try JSONEncoder().encode(JobsThemeMode.custom(custom))
            XCTAssertEqual(try JSONDecoder().decode(JobsThemeMode.self, from: encoded), .custom(custom))
            XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.selectionKind"), "style")
            fixture.center.updateSystemAppearance(.light)
            XCTAssertEqual(fixture.center.currentStyle, custom)

            let relaunched = JobsThemeCenter(userDefaults: fixture.defaults)
            relaunched.updateSystemAppearance(.dark)
            XCTAssertEqual(try relaunched.configure(resource: "Theme", bundle: fixture.bundle), custom)
            XCTAssertEqual(relaunched.currentMode, .custom(custom))
            XCTAssertEqual(relaunched.setMode(.system), .system)
            XCTAssertEqual(relaunched.currentStyle, .dark)
            XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.selectionKind"), "system")
            XCTAssertEqual(relaunched.setStyle(custom), custom)
            XCTAssertEqual(relaunched.currentMode, .custom(custom))
            XCTAssertEqual(fixture.defaults.string(forKey: "JobsTheme.selectionKind"), "style")
            XCTAssertEqual(try relaunched.configure(resource: "Theme", bundle: fixture.bundle), custom)
            XCTAssertEqual(relaunched.currentMode, .custom(custom))
        }
        let previousThreeModeVersion = try ThemeFixture()
        defer {
            previousThreeModeVersion.remove()
        }
        previousThreeModeVersion.defaults.set("system", forKey: "JobsTheme.currentMode")
        previousThreeModeVersion.defaults.set("light", forKey: "JobsTheme.currentStyle")
        previousThreeModeVersion.center.updateSystemAppearance(.dark)
        XCTAssertEqual(try previousThreeModeVersion.configure(), .dark)
        XCTAssertEqual(previousThreeModeVersion.center.currentMode, .system)
        XCTAssertEqual(previousThreeModeVersion.defaults.string(forKey: "JobsTheme.selectionKind"), "system")
    }

    func testUnboundAndReleasedViewsStopReceivingThemeChanges() throws {
        let fixture = try ThemeFixture()
        defer {
            fixture.remove()
        }
        try fixture.configure()
        var callbacks = 0
        weak var weakTarget: NSObject?
        // NSMapTable 枚举快照属于 Cocoa 自动释放对象，先排空该调用域再核对弱引用。
        autoreleasepool {
            var target: NSObject? = NSObject()
            weakTarget = target
            fixture.center.bind(target!, slot: "test") { _, _ in
                callbacks += 1
            }
            fixture.center.updateSystemAppearance(.dark)
            XCTAssertEqual(callbacks, 2)
            fixture.center.unbind(target!, slot: "test")
            fixture.center.updateSystemAppearance(.light)
            XCTAssertEqual(callbacks, 2)
            fixture.center.bind(target!, slot: "test") { _, _ in
                callbacks += 1
            }
            target = nil
        }
        XCTAssertNil(weakTarget)
        fixture.center.updateSystemAppearance(.dark)
        XCTAssertEqual(callbacks, 3)
    }
}

private struct ThemeFixture {

    let defaults: UserDefaults
    let center: JobsThemeCenter
    let bundle: Bundle
    private let suiteName: String
    private let directory: URL

    init() throws {
        let name = "JobsThemeModeTests.\(UUID().uuidString)"
        suiteName = name
        defaults = try XCTUnwrap(UserDefaults(suiteName: name))
        center = JobsThemeCenter(userDefaults: defaults)
        directory = FileManager.default.temporaryDirectory.appendingPathComponent("\(name).bundle")
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        let info = ["CFBundleIdentifier": name, "CFBundleName": name, "CFBundlePackageType": "BNDL"]
        let plist = try PropertyListSerialization.data(fromPropertyList: info, format: .xml, options: 0)
        try plist.write(to: directory.appendingPathComponent("Info.plist"))
        let data = Data("""
        {"defaultTheme":"light","themes":{
          "light":{"colors":{"text.primary":"#000000"}},
          "dark":{"colors":{"text.primary":"#FFFFFF"}},
          "brand.midnight":{"colors":{"text.primary":"#ABCDEF"}},
          "system":{"colors":{"text.primary":"#123456"}},
          "style:system":{"colors":{"text.primary":"#234567"}},
          "system:dark":{"colors":{"text.primary":"#345678"}}
        }}
        """.utf8)
        try data.write(to: directory.appendingPathComponent("Theme.json"))
        bundle = try XCTUnwrap(Bundle(url: directory))
    }

    @discardableResult
    func configure() throws -> JobsThemeStyle {
        return try center.configure(resource: "Theme", bundle: bundle)
    }

    func remove() {
        defaults.removePersistentDomain(forName: suiteName)
        try? FileManager.default.removeItem(at: directory)
    }
}
