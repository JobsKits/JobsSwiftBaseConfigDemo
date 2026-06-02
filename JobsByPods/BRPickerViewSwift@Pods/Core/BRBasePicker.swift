//
//  BRBasePicker.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import UIKit
import JobsSwiftDSL

open class BRBasePicker<Result>: NSObject {

    private(set) weak var panel: BRPickerPanel?
    private var resultHandler: ((Result) -> Void)?

    internal var theme: BRPickerTheme = BRPickerTheme()
    internal var animator: BRPanelAnimatable = BRSlideAnimation()
    internal var toolbarTitle: String?
    internal var cancelText: String = "Cancel"
    internal var confirmText: String = "Done"

    // MARK: - Toolbar convenience (sugar)
    /// Shortcut for setting toolbar title without using byToolbar block.
    @discardableResult
    public func byTitle(_ t: String?) -> Self {
        self.toolbarTitle = t
        return self
    }

    /// Shortcut for setting cancel button title without using byToolbar block.
    @discardableResult
    public func byCancelText(_ t: String) -> Self {
        self.cancelText = t
        return self
    }

    /// Shortcut for setting confirm button title without using byToolbar block.
    @discardableResult
    public func byConfirmText(_ t: String) -> Self {
        self.confirmText = t
        return self
    }

// MARK: - Fluent config
    @discardableResult
    public func byTheme(_ config: (BRPickerTheme) -> Void) -> Self {
        config(theme)
        return self
    }

    public enum AnimationStyle {
        case slide, spring, fade
        case custom(BRPanelAnimatable)
    }

    @discardableResult
    public func byAnimation(_ style: AnimationStyle) -> Self {
        switch style {
        case .slide: animator = BRSlideAnimation()
        case .spring: animator = BRSpringAnimation()
        case .fade: animator = BRFadeAnimation()
        case .custom(let a): animator = a
        }
        return self
    }

    public final class ToolbarConfig {
        fileprivate var title: String?
        fileprivate var cancelText: String = "Cancel"
        fileprivate var confirmText: String = "Done"

        @discardableResult public func byTitle(_ t: String?) -> Self { title = t; return self }
        @discardableResult public func byCancelText(_ t: String) -> Self { cancelText = t; return self }
        @discardableResult public func byConfirmText(_ t: String) -> Self { confirmText = t; return self }
    }

    @discardableResult
    public func byToolbar(_ config: (ToolbarConfig) -> Void) -> Self {
        let c = ToolbarConfig()
        c.title = toolbarTitle
        c.cancelText = cancelText
        c.confirmText = confirmText
        config(c)
        toolbarTitle = c.title
        cancelText = c.cancelText
        confirmText = c.confirmText
        return self
    }

    @discardableResult
    public func byResult(_ handler: @escaping (Result) -> Void) -> Self {
        self.resultHandler = handler
        return self
    }

    // MARK: - Internal
    internal func bind(panel: BRPickerPanel) {
        self.panel = panel
        panel.strongOwner = self
        panel.theme = theme
        panel.animator = animator
        panel.applyTheme()
    }

    internal func send(_ value: Result) {
        resultHandler?(value)
    }

    internal func dismissPanel() {
        panel?.dismiss()
    }

    // MARK: - Hidden async capability
    #if canImport(_Concurrency)
    @available(iOS 13.0, *)
    public func awaitResult() async -> Result {
        await withCheckedContinuation { continuation in
            self.byResult { value in
                continuation.resume(returning: value)
            }
        }
    }
    #endif

// MARK: - Override points
    open func buildContentView() -> UIView { UIView() }
    open func confirmSelection() { /* subclasses should call send(...) */ }
    open func cancelSelection() { /* optional */ }

    @discardableResult
    public func byPresent(in container: UIView? = nil) -> Self {
        let panel = BRPickerPanel()
        bind(panel: panel)

        let content = buildContentView()

        panel.configureToolbar(
            title: toolbarTitle,
            cancelText: cancelText,
            confirmText: confirmText,
            onCancel: { [weak self] in
                guard let self else { return }
                self.cancelSelection()
                self.dismissPanel()
            },
            onConfirm: { [weak self] in
                guard let self else { return }
                BRPickerHaptics.successIfNeeded(self.theme.hapticsOnConfirm)
                self.confirmSelection()
                self.dismissPanel()
            }
        )

        panel.embed(content)
        panel.present(in: container)

        return self
    }
}
