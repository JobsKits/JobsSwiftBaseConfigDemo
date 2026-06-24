//
//  BRPickerToolbar.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public final class BRPickerToolbar: UIView {

    public let titleLabel = UILabel()
    public let cancelButton = UIButton(type: .system)
    public let confirmButton = UIButton(type: .system)

    public var onCancel: (() -> Void)?
    public var onConfirm: (() -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cancelButton)
        addSubview(confirmButton)
        addSubview(titleLabel)

        cancelButton.addTarget(self, action: #selector(tapCancel), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(tapConfirm), for: .touchUpInside)

        titleLabel.textAlignment = .center

        isAccessibilityElement = false
        titleLabel.isAccessibilityElement = true
        cancelButton.isAccessibilityElement = true
        confirmButton.isAccessibilityElement = true
    }

    required init?(coder: NSCoder) { fatalError() }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let h = bounds.height
        cancelButton.frame = CGRect(x: 12, y: 0, width: 80, height: h)
        confirmButton.frame = CGRect(x: bounds.width - 92, y: 0, width: 80, height: h)
        titleLabel.frame = CGRect(x: 96, y: 0, width: bounds.width - 192, height: h)
    }

    @objc private func tapCancel() { onCancel?() }
    @objc private func tapConfirm() { onConfirm?() }
}
