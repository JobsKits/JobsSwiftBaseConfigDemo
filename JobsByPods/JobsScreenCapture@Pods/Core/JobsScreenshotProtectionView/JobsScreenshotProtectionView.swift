//
//  JobsScreenshotProtectionView.swift
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit

import JobsSwiftDSL

public final class JobsScreenshotProtectionView: UIView {
    public let contentView = UIView.jobsMake { _ in }

    public private(set) var isProtectionAvailable = false

    public var isProtectionEnabled: Bool {
        secureTextField.isSecureTextEntry && isProtectionAvailable
    }

    private let secureTextField = UITextField.jobsMake { _ in }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureSecureContainer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @discardableResult
    public func setProtectionEnabled(_ enabled: Bool) -> Self {
        secureTextField.bySecureTextEntry(enabled && isProtectionAvailable)
        return self
    }

    private func configureSecureContainer() {
        backgroundColor = .clear
        clipsToBounds = true

        secureTextField
            .byBackgroundColor(.clear)
            .byTextColor(.clear)
            .byTintColor(.clear)
            .byBorderStyle(.none)
            .bySecureTextEntry(true)
            .byText(" ")
            .byUserInteractionEnabled(true)
        addSubview(secureTextField)
        secureTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        secureTextField.layoutIfNeeded()

        let secureCanvasView = secureTextField.subviews.first { view in
            String(describing: type(of: view)).contains("CanvasView")
        } ?? secureTextField.subviews.first

        if let secureCanvasView {
            secureCanvasView.backgroundColor = .clear
            secureCanvasView.isUserInteractionEnabled = true
            secureCanvasView.addSubview(contentView)
            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            isProtectionAvailable = true
        } else {
            addSubview(contentView)
            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            secureTextField.bySecureTextEntry(false)
            isProtectionAvailable = false
        }
    }
}
