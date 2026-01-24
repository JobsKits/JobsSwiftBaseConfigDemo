//
//  TRAutoRefresh.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/1/25.
//
//  语言切换自动刷新引擎（无兼容分支）
//  依赖：Notification.Name.JobsLanguageDidChange、TRLang.bundleProvider()
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - Core
public enum TRAutoRefresh {
    // MARK: - 线程本地标记（.tr 内部调用）
    public enum Marker {
        private static let threadKey = "jobs.tr.marker.key"
        /// .tr 调用尾部调用：把 key/table 放到当前线程词典里，然后原样返回翻译后的字符串
        @inline(__always)
        public static func pack(translated: String,
                                key: String,
                                table: String?) -> String {
            Thread.current.threadDictionary[threadKey] = Info(key: key, table: table)
            return translated
        }
        /// 由控件入口（UILabel/UIButton 等）“消费”最近一次的 Key；消费后即清空
        @inline(__always)
        static func consume() -> Info? {
            let dict = Thread.current.threadDictionary
            guard let info = dict[threadKey] as? Info else { return nil }
            dict.removeObject(forKey: threadKey)
            return info
        }

        public struct Info {
            public let key: String
            public let table: String?
        }
    }
    // MARK: - 注册表
    private final class Entry {
        weak var target: AnyObject?
        let key: String
        let table: String?
        let apply: (AnyObject, String) -> Void

        init(target: AnyObject,
             key: String,
             table: String?,
             apply: @escaping (AnyObject, String) -> Void) {
            self.target = target
            self.key = key
            self.table = table
            self.apply = apply
        }
    }

    private static var entries: [Entry] = []
    private static let lock = NSLock()
    private static var isObserving = false
    private static var token: NSObjectProtocol?
    // MARK: - 注册与刷新
    @inline(__always)
    private static func ensureObserver() {
        guard !isObserving else { return }
        isObserving = true
        token = NotificationCenter.default.addObserver(
            forName: .JobsLanguageDidChange, object: nil, queue: .main
        ) { _ in
            TRAutoRefresh.refreshAll()
        }
    }
    /// 把任意目标对象与 key 绑定；语言变化时会把 key.tr 再次设置回去
    public static func register<T: AnyObject>(
        _ target: T,
        key: String,
        table: String? = nil,
        apply: @escaping (T, String) -> Void
    ) {
        ensureObserver()
        let entry = Entry(target: target,
                          key: key,
                          table: table) { obj, text in
            if let t = obj as? T {
                apply(t, text)
            }
        }
        lock.lock(); entries.append(entry); lock.unlock()
    }
    /// 主线程刷新全部已注册控件
    private static var _isRefreshing = false
    public static func refreshAll() {
        precondition(Thread.isMainThread, "must be on main")
        guard !_isRefreshing else { return }     // 防 re-entrancy
        _isRefreshing = true
        // 既然强制在主线程刷新，这里不需要 NSLock
        entries = entries.filter { $0.target != nil }
        let snapshot = entries
        let bundle = TRLang.bundle()

        for e in snapshot {
            guard let obj = e.target else { continue }
            let translated = NSLocalizedString(e.key,
                                               tableName: e.table,
                                               bundle: bundle,
                                               value: e.key,
                                               comment: "")
            e.apply(obj, translated)
        }
        _isRefreshing = false
    }
}
// MARK: - One universal API: TRBind
/// 你的“最小开销做最大事”落地：
/// - 任何对象/任何属性，只要能在语言变化后重新 apply，就能自动刷新
public enum TRBind {
    /// 通用绑定：消费最近一次 ".tr" 的 marker，先 apply 一次，再注册语言变化自动 apply
    @inline(__always)
    public static func bind<T: AnyObject>(
        _ target: T,
        translated: String,
        apply: @escaping (T, String) -> Void
    ) {
        let info = TRAutoRefresh.Marker.consume()
        apply(target, translated)

        guard let info else { return }
        TRAutoRefresh.register(target,
                               key: info.key,
                               table: info.table) { t, text in
            apply(t, text)
        }
    }
    /// 非自动刷新的场景（富文本等）：清 marker，避免串台
    @inline(__always)
    public static func consumeMarkerIfNeeded() {
        _ = TRAutoRefresh.Marker.consume()
    }
}
// MARK: - High frequency UI one-liners (small set, big coverage)
// ===== UILabel =====
public extension UILabel {
    /// 直接把 ".tr" 的结果丢进来即可；会自动从线程标记里拿 key 并注册刷新
    @discardableResult
    func tr_setText(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { v, text in
            v.text = text
        };return self
    }
    /// 富文本不做自动注册（如需支持：自己用 TRBind 绑定“富文本工厂”）
    @discardableResult
    func tr_setAttributedText(_ attr: NSAttributedString) -> Self {
        self.attributedText = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UIButton =====
public extension UIButton {
    
    @discardableResult
    func tr_setTitle(_ string: String, for state: UIControl.State) -> Self {
        TRBind.bind(self, translated: string) { btn, text in
            btn.setTitle(text, for: state)
        };return self
    }

    @discardableResult
    func tr_setAttributedTitle(_ attr: NSAttributedString, for state: UIControl.State) -> Self {
        self.setAttributedTitle(attr, for: state)
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UITextField =====
public extension UITextField {

    @discardableResult
    func tr_setPlaceholder(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { tf, text in
            tf.placeholder = text
        };return self
    }

    @discardableResult
    func tr_setText(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { tf, text in
            tf.text = text
        };return self
    }

    @discardableResult
    func tr_setAttributedPlaceholder(_ attr: NSAttributedString) -> Self {
        self.attributedPlaceholder = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }

    @discardableResult
    func tr_setAttributedText(_ attr: NSAttributedString) -> Self {
        self.attributedText = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UITextView =====
public extension UITextView {

    @discardableResult
    func tr_setText(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { tv, text in
            tv.text = text
        };return self
    }

    @discardableResult
    func tr_setAttributedText(_ attr: NSAttributedString) -> Self {
        self.attributedText = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UIBarButtonItem =====
public extension UIBarButtonItem {

    @discardableResult
    func tr_setTitle(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { item, text in
            item.title = text
        };return self
    }
}
// MARK: - Common "container" text (still low API count)
// ===== UINavigationItem =====
public extension UINavigationItem {

    @discardableResult
    func tr_setTitle(_ string: String?) -> Self {
        guard let string else {
            self.title = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.title = text
        };return self
    }
    /// 主标题上面那一行小字
    @discardableResult
    func tr_setPrompt(_ string: String?) -> Self {
        guard let string else {
            self.prompt = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.prompt = text
        };return self
    }
    /// 返回按钮文字
    @discardableResult
    func tr_setBackButtonTitle(_ string: String?) -> Self {
        guard let string else {
            self.backButtonTitle = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.backButtonTitle = text
        };return self
    }
}
// ===== UITabBarItem =====
public extension UITabBarItem {

    @discardableResult
    func tr_setTitle(_ string: String?) -> Self {
        guard let string else {
            self.title = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.title = text
        };return self
    }
}
// ===== UISegmentedControl =====
public extension UISegmentedControl {

    @discardableResult
    func tr_setTitle(_ string: String, forSegmentAt index: Int) -> Self {
        TRBind.bind(self, translated: string) { seg, text in
            seg.setTitle(text, forSegmentAt: index)
        };return self
    }
}
// ===== UISearchBar =====
public extension UISearchBar {

    @discardableResult
    func tr_setPlaceholder(_ string: String?) -> Self {
        guard let string else {
            self.placeholder = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { bar, text in
            bar.placeholder = text
        };return self
    }

    @discardableResult
    func tr_setPrompt(_ string: String?) -> Self {
        guard let string else {
            self.prompt = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { bar, text in
            bar.prompt = text
        };return self
    }
}
// MARK: - Alert (avoid inheritance name conflicts)
/// 注意：不扩 UIViewController 的 tr_setTitle，避免和 UIAlertController 这种子类写同名 API 冲突
public extension UIAlertController {

    @discardableResult
    func tr_setAlertTitle(_ string: String?) -> Self {
        guard let string else {
            self.title = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { alert, text in
            alert.title = text
        };return self
    }

    @discardableResult
    func tr_setMessage(_ string: String?) -> Self {
        guard let string else {
            self.message = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { alert, text in
            alert.message = text
        };return self
    }
}
// MARK: - Accessibility (minimal, non-conflicting)
public extension UIView {
    /// A11y label 也需要跟语言切换刷新
    @discardableResult
    func tr_setA11yLabel(_ string: String?) -> Self {
        guard let string else {
            self.accessibilityLabel = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { v, text in
            v.accessibilityLabel = text
        };return self
    }
    /// A11y hint 也需要跟语言切换刷新
    @discardableResult
    func tr_setA11yHint(_ string: String?) -> Self {
        guard let string else {
            self.accessibilityHint = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { v, text in
            v.accessibilityHint = text
        };return self
    }
}
