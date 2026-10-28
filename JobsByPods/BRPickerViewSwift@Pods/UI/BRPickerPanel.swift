//
//  BRPickerPanel.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit

import JobsSwiftDSL

public final class BRPickerPanel: UIView {

    public var strongOwner: AnyObject?
    var onDismiss: (() -> Void)?
    private var isDismissing = false
    private var hasEnteredWindow = false
    public var theme: BRPickerTheme = BRPickerTheme()
    public var animator: BRPanelAnimatable = BRSlideAnimation()

    private let dimmingControl = UIControl.jobsMake { _ in }
    private let panelView = UIView.jobsMake { _ in }
    private let toolbar = BRPickerToolbar()
    private let contentContainer = UIView.jobsMake { _ in }

    private var panelHeight: CGFloat = 0
    private weak var hostView: UIView?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dimmingControl)
        addSubview(panelView)
        panelView.addSubview(toolbar)
        panelView.addSubview(contentContainer)
        dimmingControl.addTarget(self,
                                 action: #selector(tapMask),
                                 for: .touchUpInside)
        // Accessibility
        isAccessibilityElement = false
        dimmingControl.isAccessibilityElement = true
        dimmingControl.accessibilityLabel = "Dismiss"
        applyTheme()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    public func applyTheme() {
        backgroundColor = .clear
        dimmingControl.byBackgroundColor(theme.maskColor)
        panelView
            .byBackgroundColor(theme.panelBackgroundColor)
            .byCornerRadius(theme.cornerRadius)
            .byClipsToBounds(true)
        toolbar.byBackgroundColor(theme.toolbarBackgroundColor)
        toolbar.titleLabel
            .byTextColor(theme.titleColor)
            .byFont(theme.titleFont)
        toolbar.cancelButton.setTitleColor(theme.buttonColor,
                                           for: .normal)
        toolbar.confirmButton.setTitleColor(theme.buttonColor,
                                            for: .normal)
        toolbar.cancelButton.titleLabel?.font = theme.buttonFont
        toolbar.confirmButton.titleLabel?.font = theme.buttonFont
    }

    public func configureToolbar(title: String?,
                                 cancelText: String = "Cancel",
                                 confirmText: String = "Done",
                                 onCancel: @escaping () -> Void,
                                 onConfirm: @escaping () -> Void) {
        toolbar.titleLabel.byText(title)
        toolbar.cancelButton.setTitle(cancelText,
                                      for: .normal)
        toolbar.confirmButton.setTitle(confirmText,
                                       for: .normal)
        toolbar.onCancel = onCancel
        toolbar.onConfirm = onConfirm
        toolbar.cancelButton.accessibilityLabel = cancelText
        toolbar.confirmButton.accessibilityLabel = confirmText
    }

    public func embed(_ view: UIView) {
        contentContainer.subviews.forEach {
            $0.removeFromSuperview()
        }
        contentContainer.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    public func present(in containerView: UIView?) {
        let host = containerView ?? BRPickerPanel.defaultHostView()
        guard let host else {
            onDismiss?()
            strongOwner = nil
            return
        }
        isDismissing = false
        hostView = host
        host.addSubview(self)
        frame = host.bounds
        dimmingControl.byFrame(bounds)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let finalFrame = finalPanelFrame()
        panelView.byFrame(finalFrame)
        layoutPanelSubviews()
        animator.animateIn(panel: panelView,
                           dimming: dimmingControl,
                           finalFrame: finalFrame)
    }

    public func dismiss() {
        guard !isDismissing else {
            return
        }
        isDismissing = true
        onDismiss?()
        onDismiss = nil
        guard hostView != nil else {
            strongOwner = nil
            removeFromSuperview()
            return
        }
        let finalFrame = finalPanelFrame()
        animator.animateOut(panel: panelView,
                            dimming: dimmingControl,
                            finalFrame: finalFrame) { [weak self] in
            guard let self else {
                return
            }
            self.strongOwner = nil
            self.removeFromSuperview()
        }
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview == nil, hostView != nil {
            if isDismissing {
                strongOwner = nil
                hostView = nil
            } else {
                checkDepartureAfterReparenting()
            }
        }
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil {
            hasEnteredWindow = true
            return
        }
        guard hasEnteredWindow, !isDismissing else {
            return
        }
        checkDepartureAfterReparenting()
    }

    private func checkDepartureAfterReparenting() {
        // 同步重挂载先离窗再入窗；下一轮仍离窗才结束这次展示。
        DispatchQueue.main.async { [self] in
            guard !isDismissing,
                  superview == nil || hasEnteredWindow && window == nil else {
                return
            }
            dismiss()
        }
    }

    private func finalPanelFrame() -> CGRect {
        let desired = theme.toolBarHeight + theme.pickerHeight + safeAreaInsets.bottom + theme.panelBottomOffset
        let maxH = theme.maxPanelHeight ?? min(bounds.height * 0.75,
                                               560)
        panelHeight = min(max(desired,
                              theme.toolBarHeight + 140),
                          maxH)
        return CGRect(x: 0,
                      y: bounds.height - panelHeight + theme.panelBottomOffset,
                      width: bounds.width,
                      height: panelHeight)
    }

    private func layoutPanelSubviews() {
        let safe = panelView.safeAreaInsets
        let width = max(0,
                        panelView.bounds.width - safe.left - safe.right)
        toolbar.byFrame(CGRect(x: safe.left,
                               y: 0,
                               width: width,
                               height: theme.toolBarHeight))
        contentContainer.byFrame(CGRect(x: safe.left,
                                        y: theme.toolBarHeight,
                                        width: width,
                                        height: max(0,
                                                    panelView.bounds.height - theme.toolBarHeight - safe.bottom)))
    }

    public override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        setNeedsLayout()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        dimmingControl.byFrame(bounds)
        guard !isDismissing, panelView.superview != nil else {
            return
        }
        panelView.byFrame(finalPanelFrame())
        layoutPanelSubviews()
    }

    @objc private func tapMask() {
        if theme.tapMaskToDismiss {
            dismiss()
        }
    }

    private static func defaultHostView() -> UIView? {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes.compactMap {
                $0 as? UIWindowScene
            }
            for scene in scenes {
                if let win = scene.windows.first(where: {
                    $0.isKeyWindow
                }) {
                    return win
                }
            }
            return scenes.first?.windows.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
