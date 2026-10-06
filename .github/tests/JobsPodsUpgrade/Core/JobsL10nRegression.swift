//
//  JobsL10nRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

private final class BindingTarget: NSObject {
    var title = ""
    var subtitle = ""
}

private final class LanguageReference {
    weak var manager: LanguageManager?
    var observedCode: String?
}

private final class ReleaseCapture {
    let onRelease: () -> Void
    init(_ onRelease: @escaping () -> Void) {
        self.onRelease = onRelease
    }
    deinit {
        onRelease()
    }
}

private final class WeakReleaseCapture {
    weak var value: ReleaseCapture?
    init(_ value: ReleaseCapture) {
        self.value = value
    }
}

@main
struct JobsL10nRegression {
    static func main() {
        let suite = "JobsL10nRegression.\(UUID().uuidString)"
        let defaults = UserDefaults(suiteName: suite)!
        defer { defaults.removePersistentDomain(forName: suite) }
        verifyProviderAndReleaseReentry(defaults: defaults)
        Bundle.enableLanguageOverride()
        Bundle.setLanguageBundle(.main)
        precondition(Bundle.main.localizedString(forKey: "missing-key", value: "fallback", table: nil) == "fallback")
        let manager = LanguageManager(userDefaults: defaults, preferredLanguages: { ["en-US"] })
        manager.switchTo("vi")
        precondition(Bundle.main.localizedString(forKey: "missing-key", value: "fallback", table: nil) == "fallback")
        manager.followSystemLanguage()
        precondition(defaults.string(forKey: languageModeKey) == "system")
        precondition(defaults.string(forKey: languageCodeKey) == nil)
        let baseline = TRAutoRefresh.bindingCount
        let target = BindingTarget()
        for index in 0..<1000 {
            TRBind.bind(target, key: "title.\(index)", slot: "title") { target, value in target.title = value }
        }
        TRBind.bind(target, key: "subtitle", slot: "subtitle") { target, value in target.subtitle = value }
        precondition(TRAutoRefresh.bindingCount == baseline + 2)
        TRAutoRefresh.refreshAll()
        precondition(target.title == "title.999" && target.subtitle == "subtitle")
        _ = TRAutoRefresh.Marker.pack(translated: "unrelated", key: "old", table: nil)
        TRBind.bind(target, translated: "plain", slot: "title") { target, value in target.title = value }
        TRAutoRefresh.refreshAll()
        precondition(target.title == "plain" && target.subtitle == "subtitle")
        precondition(TRAutoRefresh.bindingCount == baseline + 1)
        TRAutoRefresh.unbind(target)
        precondition(TRAutoRefresh.bindingCount == baseline)
        weak var released: BindingTarget?
        do {
            let disposable = BindingTarget()
            released = disposable
            TRAutoRefresh.register(disposable, key: "x", slot: "title") { target, value in target.title = value }
        }
        precondition(released == nil && TRAutoRefresh.bindingCount == baseline)
        DispatchQueue.concurrentPerform(iterations: 1000) { index in
            TRAutoRefresh.register(target, key: "parallel.\(index)", slot: "title") { target, value in
                target.title = value
            }
        }
        precondition(TRAutoRefresh.bindingCount == baseline + 1)
        TRAutoRefresh.refreshAll()
        TRAutoRefresh.unbind(target)
        Bundle.clearLanguageBundle()
        print("Jobs l10n provider/deinit-reentry/fallback/system-mode/slot/rebinding/release regression checks passed")
    }

    private static func installProviderCapture(bundle: Bool) -> WeakReleaseCapture {
        let owner = ReleaseCapture {
            _ = TRLang.bundleProvider
            _ = TRLang.localeCodeProvider
        }
        if bundle {
            TRLang.bundleProvider = { [owner] in withExtendedLifetime(owner) { .main } }
        } else {
            TRLang.localeCodeProvider = { [owner] in withExtendedLifetime(owner) { "en" } }
        }
        return WeakReleaseCapture(owner)
    }

    private static func installBindingCapture(on target: BindingTarget) -> WeakReleaseCapture {
        let owner = ReleaseCapture { _ = TRAutoRefresh.bindingCount }
        TRAutoRefresh.register(target, key: "release", slot: "release") { [owner] target, value in
            withExtendedLifetime(owner) { target.title = value }
        }
        return WeakReleaseCapture(owner)
    }

    private static func verifyProviderAndReleaseReentry(defaults: UserDefaults) {
        let reference = LanguageReference()
        let manager = LanguageManager(userDefaults: defaults, preferredLanguages: {
            reference.observedCode = reference.manager?.currentLanguageCode
            return ["en-US"]
        })
        reference.manager = manager
        manager.switchTo("vi")
        manager.followSystemLanguage()
        precondition(reference.observedCode == "vi" && manager.currentLanguageCode == "en")
        let savedBundle = TRLang.bundleProvider
        let savedLocale = TRLang.localeCodeProvider
        let bundleCapture = installProviderCapture(bundle: true)
        TRLang.bundleProvider = savedBundle
        precondition(bundleCapture.value == nil)
        let localeCapture = installProviderCapture(bundle: false)
        TRLang.localeCodeProvider = savedLocale
        precondition(localeCapture.value == nil)
        let target = BindingTarget()
        let replacementCapture = installBindingCapture(on: target)
        TRAutoRefresh.register(target, key: "replacement", slot: "release") { target, value in target.title = value }
        precondition(replacementCapture.value == nil)
        let removalCapture = installBindingCapture(on: target)
        TRAutoRefresh.unbind(target)
        precondition(removalCapture.value == nil)
        for cleanupByCount in [true, false] {
            var staleCapture: WeakReleaseCapture!
            do {
                let staleTarget = BindingTarget()
                staleCapture = installBindingCapture(on: staleTarget)
            }
            if cleanupByCount {
                _ = TRAutoRefresh.bindingCount
            } else {
                TRAutoRefresh.refreshAll()
            }
            precondition(staleCapture.value == nil)
        }
    }
}
