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

public final class BRPickerPanel: UIView {
    public let style: BRPickerStyle
    // ✅ 改名：别叫 maskView（UIView 自带 maskView 属性）
    public let dimmingControl = UIControl()
    public let panelView = UIView()
    public let toolBar = UIView()
    public let titleLabel = UILabel()
    public let cancelButton = UIButton(type: .system)
    public let confirmButton = UIButton(type: .system)
    public let contentContainer = UIView()

    public var onCancel: (() -> Void)?
    public var onConfirm: (() -> Void)?

    private weak var hostView: UIView?
    private var panelBottomConstraint: Constraint?
    private var contentBottomConstraint: Constraint?

    public init(style: BRPickerStyle) {
        self.style = style
        super.init(frame: .zero)
        buildUI()
        bind()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public func present(in container: UIView? = nil) {
        let host = container ?? BRPickerPanel.defaultHostView()
        guard let host else { return }
        hostView = host

        host.addSubview(self)
        snp.makeConstraints { $0.edges.equalToSuperview() }

        host.layoutIfNeeded()
        updateBottomInsets()

        layoutIfNeeded()
        let startY = panelView.bounds.height + 80
        panelView.transform = CGAffineTransform(translationX: 0, y: startY)
        dimmingControl.alpha = 0

        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut]) {
            self.panelView.transform = .identity
            self.dimmingControl.alpha = 1
        }
    }

    public func dismiss() {
        layoutIfNeeded()
        let endY = panelView.bounds.height + 80
        UIView.animate(withDuration: 0.22, delay: 0, options: [.curveEaseIn]) {
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

    private func buildUI() {
        backgroundColor = .clear

        dimmingControl.backgroundColor = style.maskColor
        addSubview(dimmingControl)

        panelView.backgroundColor = style.panelBackgroundColor
        panelView.layer.cornerRadius = style.cornerRadius
        panelView.layer.masksToBounds = true
        addSubview(panelView)

        toolBar.backgroundColor = style.toolbarBackgroundColor
        panelView.addSubview(toolBar)

        titleLabel.text = style.title
        titleLabel.textColor = style.titleColor
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        toolBar.addSubview(titleLabel)

        cancelButton.setTitle(style.cancelText, for: .normal)
        cancelButton.setTitleColor(style.buttonColor, for: .normal)
        toolBar.addSubview(cancelButton)

        confirmButton.setTitle(style.confirmText, for: .normal)
        confirmButton.setTitleColor(style.buttonColor, for: .normal)
        toolBar.addSubview(confirmButton)
        confirmButton.isHidden = style.isAutoSelect

        panelView.addSubview(contentContainer)

        // Layout
        dimmingControl.snp.makeConstraints { $0.edges.equalToSuperview() }

        panelView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            // ✅ 默认“贴地” => bottom 贴 superview.bottom
            if style.panelFillToBottom {
                panelBottomConstraint = make.bottom.equalToSuperview().offset(style.panelBottomOffset).constraint
            } else {
                panelBottomConstraint = make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(style.panelBottomOffset).constraint
            }
        }

        toolBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(style.toolBarHeight)
        }

        cancelButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }

        confirmButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.greaterThanOrEqualTo(cancelButton.snp.right).offset(8)
            make.right.lessThanOrEqualTo(confirmButton.snp.left).offset(-8)
        }

        contentContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(toolBar.snp.bottom)
            // ✅ 这里 inset 会在 updateBottomInsets() 动态更新
            contentBottomConstraint = make.bottom.equalToSuperview().inset(0).constraint
            make.height.greaterThanOrEqualTo(style.pickerHeight)
        }
    }

    private func bind() {
        dimmingControl.addTarget(self, action: #selector(tapMask), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(tapCancel), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(tapConfirm), for: .touchUpInside)
    }

    @objc private func tapMask() { dismiss() }
    @objc private func tapCancel() { onCancel?(); dismiss() }
    @objc private func tapConfirm() { onConfirm?(); dismiss() }

    private func updateBottomInsets() {
        guard let host = hostView else { return }
        host.layoutIfNeeded()

        let safeBottom = host.safeAreaInsets.bottom
        let inset = (style.panelFillToBottom ? safeBottom : 0) + style.contentBottomInsetExtra
        contentBottomConstraint?.update(inset: inset)
        panelBottomConstraint?.update(offset: style.panelBottomOffset)

        layoutIfNeeded()
    }

    private static func defaultHostView() -> UIView? {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
            for scene in scenes {
                if let win = scene.windows.first(where: { $0.isKeyWindow }) { return win }
            }
            return scenes.first?.windows.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

