//
//  BRPickerPanel.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsSwiftBaseDefines
// ================================== Panel ==================================
public final class BRPickerPanel: UIView {
    // ================================== Public ==================================
    public let style: BRPickerStyle
    public var onCancel: (() -> Void)?
    public var onConfirm: (() -> Void)?
    private weak var hostView: UIView?
    private var panelBottomConstraint: Constraint?
    private var contentBottomConstraint: Constraint?
    // ================================== Lazy Views ==================================
    public lazy var dimmingControl: UIControl = {
        UIControl()
            .byBackgroundColor(style.maskColor)
            .byAddAction(for: .touchUpInside) { [weak self] _ in
                self?.dismiss()
            }
            .byAddTo(self) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()

    public lazy var panelView: UIView = {
        UIView()
            .byBackgroundColor(style.panelBackgroundColor)
            .byCornerRadius(style.cornerRadius)
            .byAddTo(self) { [unowned self] make in
                make.left.right.equalToSuperview()
                if style.panelFillToBottom {
                    self.panelBottomConstraint =
                        make.bottom.equalToSuperview()
                            .offset(style.panelBottomOffset)
                            .constraint
                } else {
                    self.panelBottomConstraint =
                        make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
                            .offset(style.panelBottomOffset)
                            .constraint
                }
            }
    }()

    public lazy var toolBar: UIView = {
        UIView()
            .byBackgroundColor(style.toolbarBackgroundColor)
            .byAddTo(panelView) { [unowned self] make in
                make.left.right.top.equalToSuperview()
                make.height.equalTo(self.style.toolBarHeight)
            }
    }()

    public lazy var titleLabel: UILabel = {
        UILabel()
            .byText(style.title)
            .byTextColor(style.titleColor)
            .byFont(.boldSystemFont(ofSize: 16))
            .byTextAlignment(.center)
            .byAddTo(toolBar) { [unowned self] make in
                make.center.equalToSuperview()
                make.left.greaterThanOrEqualTo(self.cancelButton.snp.right).offset(8)
                make.right.lessThanOrEqualTo(self.confirmButton.snp.left).offset(-8)
            }
    }()

    public lazy var cancelButton: UIButton = {
        UIButton(type: .system)
            .byTitle(style.cancelText)
            .byTitleColor(style.buttonColor)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.onCancel?()
                self.dismiss()
            }
            .byAddTo(toolBar) { [unowned self] make in
                make.left.equalToSuperview().inset(12)
                make.centerY.equalToSuperview()
                make.height.equalToSuperview()
            }
    }()

    public lazy var confirmButton: UIButton = {
        UIButton(type: .system)
            .byTitle(style.confirmText)
            .byTitleColor(style.buttonColor)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.onConfirm?()
                self.dismiss()
            }
            .byAddTo(toolBar) { [unowned self] make in
                make.right.equalToSuperview().inset(12)
                make.centerY.equalToSuperview()
                make.height.equalToSuperview()
            }
    }()

    public lazy var contentContainer: UIView = {
        UIView()
            .byAddTo(panelView) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.top.equalTo(self.toolBar.snp.bottom)
                make.height.greaterThanOrEqualTo(style.pickerHeight)
                self.contentBottomConstraint =
                make.bottom.equalToSuperview()
                    .inset(0)
                    .constraint
            }
    }()
    // ================================== Init ==================================
    required init?(coder: NSCoder) { fatalError() }
    public init(style: BRPickerStyle) {
        self.style = style
        super.init(frame: .zero)
        dimmingControl.byVisible(YES)
        panelView.byVisible(YES)
        toolBar.byVisible(YES)
        titleLabel.byVisible(YES)
        cancelButton.byVisible(YES)
        confirmButton.byVisible(YES)
        contentContainer.byVisible(YES)
    }
}

extension BRPickerPanel{
    // ================================== Present ==================================
    public func present(in container: UIView? = nil) -> Self {
        let host = container ?? BRPickerPanel.defaultHostView()
        guard let host else { return self }
        hostView = host

        host.addSubview(self)

        self.snp.makeConstraints { $0.edges.equalToSuperview() }

        host.layoutIfNeeded()
        updateBottomInsets()

        layoutIfNeeded()

        let startY = panelView.bounds.height + 80
        panelView.transform = CGAffineTransform(translationX: 0, y: startY)
        dimmingControl.alpha = 0

        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseOut]) {
            self.panelView.transform = .identity
            self.dimmingControl.alpha = 1
        };return self
    }

    public func dismiss() {
        layoutIfNeeded()
        let endY = panelView.bounds.height + 80
        UIView.animate(withDuration: 0.22,
                       delay: 0,
                       options: [.curveEaseIn]) {
            self.panelView.transform = CGAffineTransform(translationX: 0, y: endY)
            self.dimmingControl.alpha = 0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }

    public override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        updateBottomInsets()
    }

    private func updateBottomInsets() {
        guard let host = hostView else { return }
        host.layoutIfNeeded()
        let safeBottom = host.safeAreaInsets.bottom
        let inset =
            (style.panelFillToBottom ? safeBottom : 0)
            + style.contentBottomInsetExtra
        contentBottomConstraint?.update(inset: inset)
        panelBottomConstraint?.update(offset: style.panelBottomOffset)
        layoutIfNeeded()
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
