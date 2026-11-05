//
//  WKWebViewConfiguration.swift
//  JobsByWebKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import WebKit
import JobsSwiftBlock

/// 旧系统的选词粒度；现代 WebKit 固定按字符处理。
public enum JobsWebSelectionGranularity: Int {

    case dynamic = 0
    case character = 1
}

// 统一在主线程（WKWebViewConfiguration 本身就是 @MainActor）
@MainActor
extension WKWebViewConfiguration {

    // MARK: - 工厂
    public static func make(_ configure: jobsByInoutWKWebConfigBlock) -> WKWebViewConfiguration {
        var ct = WKWebViewConfiguration()
        configure(&ct)
        return ct
    }
    // MARK: - 基础
    @discardableResult
    public func byProcessPool<Pool: AnyObject>(_ pool: Pool) -> Self {
        if #available(iOS 15.0, tvOS 15.0, macOS 12.0, *) {
            return self
        } else {
            return byLegacyProcessPool(pool)
        }
    }

    @available(iOS, introduced: 8.0, deprecated: 15.0)
    @available(tvOS, introduced: 9.0, deprecated: 15.0)
    @available(macOS, introduced: 10.10, deprecated: 12.0)
    private func byLegacyProcessPool(_ pool: AnyObject) -> Self {
        if let pool = pool as? WKProcessPool {
            processPool = pool
        }
        return self
    }
    /// 直接拿到 `preferences` 引用修改（WKPreferences 是引用类型）
    @discardableResult
    public func byPreferences(_ edit: (WKPreferences) -> Void) -> Self {
        edit(self.preferences)
        return self
    }

    @discardableResult
    public func byUserContentController(_ ucc: WKUserContentController) -> Self {
        self.userContentController = ucc
        return self
    }

    @available(iOS 18.4, *)
    @discardableResult
    public func byWebExtensionController(_ controller: WKWebExtensionController?) -> Self {
        self.webExtensionController = controller
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    public func byWebsiteDataStore(_ store: WKWebsiteDataStore? = nil) -> Self {
        guard let store else {
            return self
        }
        self.websiteDataStore = store
        return self
    }

    @discardableResult
    public func bySuppressesIncrementalRendering(_ on: Bool = true) -> Self {
        self.suppressesIncrementalRendering = on
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    public func byApplicationNameForUserAgent(_ suffix: String? = nil) -> Self {
        guard let suffix else {
            return self
        }
        self.applicationNameForUserAgent = suffix
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    public func byAllowsAirPlayForMediaPlayback(_ on: Bool = true) -> Self {
        self.allowsAirPlayForMediaPlayback = on
        return self
    }

    @available(iOS 26.0, *)
    @discardableResult
    public func byShowsSystemScreenTimeBlockingView(_ on: Bool = true) -> Self {
        self.showsSystemScreenTimeBlockingView = on
        return self
    }

    @available(iOS 14.5, *)
    @discardableResult
    public func byUpgradeKnownHostsToHTTPS(_ on: Bool = true) -> Self {
        self.upgradeKnownHostsToHTTPS = on
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    public func byMediaTypesRequiringUserActionForPlayback(_ types: WKAudiovisualMediaTypes) -> Self {
        self.mediaTypesRequiringUserActionForPlayback = types
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func byDefaultWebpagePreferences(_ edit: (WKWebpagePreferences) -> Void) -> Self {
        // 注意：属性是 @NSCopying；读出来（若为 nil 就新建），编辑后再回设
        let p = self.defaultWebpagePreferences ?? WKWebpagePreferences()
        edit(p)
        self.defaultWebpagePreferences = p
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func byLimitsNavigationsToAppBoundDomains(_ on: Bool = true) -> Self {
        self.limitsNavigationsToAppBoundDomains = on
        return self
    }

    @available(iOS 17.0, *)
    @discardableResult
    public func byAllowsInlinePredictions(_ on: Bool = true) -> Self {
        self.allowsInlinePredictions = on
        return self
    }

    @discardableResult
    public func byAllowsInlineMediaPlayback(_ on: Bool = true) -> Self {
        self.allowsInlineMediaPlayback = on
        return self
    }

    @discardableResult
    public func bySelectionGranularity(_ granularity: JobsWebSelectionGranularity) -> Self {
        return bySelectionGranularityValue(granularity.rawValue)
    }

    /// 保留接收旧系统枚举变量的源码兼容入口，不在公开签名暴露已废弃类型。
    @discardableResult
    public func bySelectionGranularity<Granularity: RawRepresentable>(_ granularity: Granularity) -> Self
        where Granularity.RawValue == Int {
        return bySelectionGranularityValue(granularity.rawValue)
    }

    private func bySelectionGranularityValue(_ rawValue: Int) -> Self {
        if #available(iOS 11.0, tvOS 11.0, macOS 10.13, *) {
            return self
        } else {
            return byLegacySelectionGranularity(rawValue)
        }
    }

    @available(iOS, introduced: 8.0, deprecated: 11.0)
    @available(tvOS, introduced: 9.0, deprecated: 11.0)
    @available(macOS, introduced: 10.10, deprecated: 10.13)
    private func byLegacySelectionGranularity(_ rawValue: Int) -> Self {
        selectionGranularity = WKSelectionGranularity(rawValue: rawValue) ?? .character
        return self
    }

    @available(iOS 9.0, *)
    @discardableResult
    public func byAllowsPictureInPictureMediaPlayback(_ on: Bool = true) -> Self {
        self.allowsPictureInPictureMediaPlayback = on
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    public func byDataDetectorTypes(_ types: WKDataDetectorTypes) -> Self {
        self.dataDetectorTypes = types
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult
    public func byIgnoresViewportScaleLimits(_ on: Bool = true) -> Self {
        self.ignoresViewportScaleLimits = on
        return self
    }
    // MARK: - URL Scheme Handler
    @available(iOS 11.0, *)
    @discardableResult
    public func byURLSchemeHandler(_ handler: (any WKURLSchemeHandler)?,
                                   for scheme: String) -> Self {
        self.setURLSchemeHandler(handler,
                                 forURLScheme: scheme)
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    public func byRemoveURLSchemeHandler(for scheme: String) -> Self {
        self.setURLSchemeHandler(nil,
                                 forURLScheme: scheme)
        return self
    }
    // MARK: - iOS 18+
    @available(iOS 18.0, *)
    @discardableResult
    public func bySupportsAdaptiveImageGlyph(_ on: Bool = true) -> Self {
        self.supportsAdaptiveImageGlyph = on
        return self
    }

    @available(iOS 18.0, *)
    @discardableResult
    public func byWritingToolsBehavior(_ behavior: UIWritingToolsBehavior) -> Self {
        self.writingToolsBehavior = behavior
        return self
    }
}
