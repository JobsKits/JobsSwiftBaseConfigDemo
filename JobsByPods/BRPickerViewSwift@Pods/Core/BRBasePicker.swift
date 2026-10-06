//
//  BRBasePicker.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL

open class BRBasePicker<Result>: NSObject {
    private(set) weak var panel: BRPickerPanel?
    private var lastPanelWasDismissed = false
    private var resultHandler: ((Result) -> Void)?
    #if canImport(_Concurrency)
    private var pendingAwait: BRPickerAwaitState<Result>?
    #endif

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
        };return self
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
        lastPanelWasDismissed = false
        panel.strongOwner = self
        panel.onDismiss = { [weak self] in
            self?.lastPanelWasDismissed = true
            self?.cancelPendingAwait()
        }
        panel.theme = theme
        panel.animator = animator
        panel.applyTheme()
    }

    internal func send(_ value: Result) {
        #if canImport(_Concurrency)
        pendingAwait?.finish(.success(value))
        #endif
        resultHandler?(value)
    }

    internal func dismissPanel() {
        cancelPendingAwait()
        panel?.dismiss()
    }

    private func cancelPendingAwait() {
        #if canImport(_Concurrency)
        pendingAwait?.finish(.failure(BRPickerAwaitError.cancelled))
        #endif
    }

    // MARK: - Async capability
    #if canImport(_Concurrency)
    @available(iOS 13.0, *)
    @MainActor
    public func awaitResult() async throws -> Result {
        guard !lastPanelWasDismissed else { throw BRPickerAwaitError.cancelled }
        guard pendingAwait == nil else { throw BRPickerAwaitError.alreadyAwaiting }
        let state = BRPickerAwaitState<Result>()
        pendingAwait = state
        defer {
            if pendingAwait === state { pendingAwait = nil }
        }
        return try await withTaskCancellationHandler(operation: {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                state.install(continuation)
            }
        }, onCancel: { [weak self] in
            state.finish(.failure(CancellationError()))
            Task { @MainActor [weak self] in
                guard let self, self.pendingAwait === state else { return }
                self.panel?.dismiss()
            }
        })
    }

    /// nil 只表示用户或任务取消；并发等待等失败仍向调用方抛出。
    @available(iOS 13.0, *)
    @MainActor
    public func awaitResultOrNil() async throws -> Result? {
        do {
            return try await awaitResult()
        } catch BRPickerAwaitError.cancelled {
            return nil
        } catch is CancellationError {
            return nil
        }
    }
    #endif

// MARK: - Override points
    open func buildContentView() -> UIView { UIView.jobsMake { _ in } }
    open func confirmSelection() { /* subclasses should call send(...) */ }
    open func cancelSelection() { /* optional */ }

    @discardableResult
    public func byPresent(in container: UIView? = nil) -> Self {
        self.panel?.dismiss()
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

public enum BRPickerAwaitError: Error {
    case cancelled
    case alreadyAwaiting
}

#if canImport(_Concurrency)
private final class BRPickerAwaitState<Value>: @unchecked Sendable {
    private let lock = NSLock()
    private var continuation: CheckedContinuation<Value, Error>?
    private var result: Swift.Result<Value, Error>?

    func install(_ continuation: CheckedContinuation<Value, Error>) {
        lock.lock()
        if let result {
            lock.unlock()
            continuation.resume(with: result)
        } else {
            self.continuation = continuation
            lock.unlock()
        }
    }

    func finish(_ result: Swift.Result<Value, Error>) {
        lock.lock()
        guard self.result == nil else {
            lock.unlock()
            return
        }
        self.result = result
        let continuation = self.continuation
        self.continuation = nil
        lock.unlock()
        continuation?.resume(with: result)
    }
}
#endif
