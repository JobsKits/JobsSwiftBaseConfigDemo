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

    /// 仅表示当前系统找到候选安全容器，不代表 Apple 保证截图防护。
    public private(set) var isProtectionAvailable = false
    public private(set) var isProtectionVerified = false
    public var hidesContentWhileCaptured = true {
        didSet { updateCaptureVisibility() }
    }
    private var captureObserver: NSObjectProtocol?

    public var isProtectionEnabled: Bool {
        secureTextField.isSecureTextEntry && isProtectionAvailable
    }

    private let secureTextField = UITextField.jobsMake { _ in }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureSecureContainer()
        if #available(iOS 11.0, tvOS 11.0, *) {
            captureObserver = NotificationCenter.default.addObserver(forName: UIScreen.capturedDidChangeNotification,
                                                                     object: nil, queue: .main) { [weak self] _ in
                self?.updateCaptureVisibility()
            }
        }
    }

    deinit {
        if let captureObserver { NotificationCenter.default.removeObserver(captureObserver) }
    }

    /// 只有宿主在当前 OS/设备上做过截图、录屏及镜像验证，才显式标记为 verified。
    @discardableResult
    public func byProtectionVerified(_ verified: Bool) -> Self {
        isProtectionVerified = verified && isProtectionAvailable && isProtectionEnabled
        return self
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        isProtectionVerified = false
        updateCaptureVisibility()
    }

    private func updateCaptureVisibility() {
        if #available(iOS 11.0, tvOS 11.0, *) {
            contentView.byHidden(hidesContentWhileCaptured && window?.screen.isCaptured == true)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @discardableResult
    public func setProtectionEnabled(_ enabled: Bool) -> Self {
        secureTextField.bySecureTextEntry(enabled && isProtectionAvailable)
        if !enabled { isProtectionVerified = false }
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
        }

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
            isProtectionVerified = false
        }
    }
}
