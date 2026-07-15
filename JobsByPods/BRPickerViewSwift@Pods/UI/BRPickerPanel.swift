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

public final class BRPickerPanel: UIView {
    public var strongOwner: AnyObject?
    public var theme: BRPickerTheme = BRPickerTheme()
    public var animator: BRPanelAnimatable = BRSlideAnimation()

    private let dimmingControl = UIControl()
    private let panelView = UIView()
    private let toolbar = BRPickerToolbar()
    private let contentContainer = UIView()

    private var panelHeight: CGFloat = 0
    private weak var hostView: UIView?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dimmingControl)
        addSubview(panelView)
        panelView.addSubview(toolbar)
        panelView.addSubview(contentContainer)
        dimmingControl.addTarget(self, action: #selector(tapMask), for: .touchUpInside)
        // Accessibility
        isAccessibilityElement = false
        dimmingControl.isAccessibilityElement = true
        dimmingControl.accessibilityLabel = "Dismiss"
        applyTheme()
    }

    required init?(coder: NSCoder) { fatalError() }

    public func applyTheme() {
        backgroundColor = .clear
        dimmingControl.backgroundColor = theme.maskColor
        panelView.backgroundColor = theme.panelBackgroundColor
        panelView.layer.cornerRadius = theme.cornerRadius
        panelView.clipsToBounds = true
        toolbar.backgroundColor = theme.toolbarBackgroundColor
        toolbar.titleLabel.textColor = theme.titleColor
        toolbar.titleLabel.font = theme.titleFont
        toolbar.cancelButton.setTitleColor(theme.buttonColor, for: .normal)
        toolbar.confirmButton.setTitleColor(theme.buttonColor, for: .normal)
        toolbar.cancelButton.titleLabel?.font = theme.buttonFont
        toolbar.confirmButton.titleLabel?.font = theme.buttonFont
    }

    public func configureToolbar(title: String?,
                                 cancelText: String = "Cancel",
                                 confirmText: String = "Done",
                                 onCancel: @escaping () -> Void,
                                 onConfirm: @escaping () -> Void) {
        toolbar.titleLabel.text = title
        toolbar.cancelButton.setTitle(cancelText, for: .normal)
        toolbar.confirmButton.setTitle(confirmText, for: .normal)
        toolbar.onCancel = onCancel
        toolbar.onConfirm = onConfirm
        toolbar.cancelButton.accessibilityLabel = cancelText
        toolbar.confirmButton.accessibilityLabel = confirmText
    }

    public func embed(_ view: UIView) {
        contentContainer.subviews.forEach { $0.removeFromSuperview() }
        contentContainer.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentContainer.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor)
        ])
    }

    public func present(in containerView: UIView?) {
        let host = containerView ?? BRPickerPanel.defaultHostView()
        guard let host else { return }
        hostView = host
        host.addSubview(self)
        frame = host.bounds
        dimmingControl.frame = bounds
        // Height adaptive
        let safeBottom = host.safeAreaInsets.bottom
        let desired = theme.toolBarHeight + theme.pickerHeight + safeBottom + theme.panelBottomOffset
        let maxH = theme.maxPanelHeight ?? min(bounds.height * 0.75, 560)
        panelHeight = min(max(desired, theme.toolBarHeight + 140), maxH)
        let finalFrame = CGRect(
            x: 0,
            y: bounds.height - panelHeight + theme.panelBottomOffset,
            width: bounds.width,
            height: panelHeight
        )
        panelView.frame = finalFrame
        layoutPanelSubviews()
        animator.animateIn(panel: panelView, dimming: dimmingControl, finalFrame: finalFrame)
    }

    public func dismiss() {
        guard let host = hostView else {
            strongOwner = nil
            removeFromSuperview()
            return
        }
        let safeBottom = host.safeAreaInsets.bottom
        let desired = theme.toolBarHeight + theme.pickerHeight + safeBottom + theme.panelBottomOffset
        let maxH = theme.maxPanelHeight ?? min(bounds.height * 0.75, 560)
        panelHeight = min(max(desired, theme.toolBarHeight + 140), maxH)
        let finalFrame = CGRect(
            x: 0,
            y: bounds.height - panelHeight + theme.panelBottomOffset,
            width: bounds.width,
            height: panelHeight
        )
        animator.animateOut(panel: panelView, dimming: dimmingControl, finalFrame: finalFrame) { [weak self] in
            guard let self else { return }
            self.strongOwner = nil
            self.removeFromSuperview()
        }
    }

    private func layoutPanelSubviews() {
        toolbar.frame = CGRect(x: 0, y: 0, width: panelView.bounds.width, height: theme.toolBarHeight)
        contentContainer.frame = CGRect(
            x: 0,
            y: theme.toolBarHeight,
            width: panelView.bounds.width,
            height: panelView.bounds.height - theme.toolBarHeight
        )
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        dimmingControl.frame = bounds
        // Keep panel pinned to bottom on rotations
        if panelView.superview != nil, panelView.frame.width != bounds.width {
            // recompute
            present(in: hostView)
        }
    }

    @objc private func tapMask() {
        if theme.tapMaskToDismiss { dismiss() }
    }

    private static func defaultHostView() -> UIView? {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
            for scene in scenes {
                if let win = scene.windows.first(where: { $0.isKeyWindow }) {
                    return win
                }
            };return scenes.first?.windows.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
