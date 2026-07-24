//
//  JobsOCParityLandscapeDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

final class JobsLandscapeSwitchDemoVC: BaseVC {

    private enum Action {
        case detect
        case lockLandscape
        case unlock
        case landscapeLeft
        case landscapeRight
        case portrait
    }

    private let descriptors: [(String, String?, Action)] = [
        ("检测当前屏幕方向", nil, .detect),
        ("锁定横屏", "设备可以处于任意横屏（Landscape）模式，包括左横屏和右横屏", .lockLandscape),
        ("解除锁定", "设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏", .unlock),
        ("设备左横屏", nil, .landscapeLeft),
        ("设备右横屏", nil, .landscapeRight),
        ("设备竖直向上", "Home 按钮在下方", .portrait)
    ]

    private var orientationMask: UIInterfaceOrientationMask = .all

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(YES)
            .byShowsVerticalScrollIndicator(false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.width.equalTo(scrollView.frameLayoutGuide)
            }
    }()

    private lazy var actionButtons: [UIButton] = {
        descriptors.enumerated().map { index, descriptor in
            UIButton.sys()
                .byTag(index)
                .byTitle(descriptor.0.tr, for: .normal)
                .bySubTitle(descriptor.1?.tr, for: .normal)
                .byTitleFont(JobsFont.boldSystemFont(ofSize: 17))
                .bySubTitleFont(JobsFont.systemFont(ofSize: 11))
                .byTitleColor(JobsCor.systemRed, for: .normal)
                .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
                .byBackgroundColor(JobsCor.systemBackground, for: .normal)
                .byCornerRadius(12)
                .byBorderWidth(1)
                .byBorderColor(JobsCor.separator)
                .onTap { [weak self] button in
                    self?.perform(self?.descriptors[button.tag].2 ?? .detect)
                }
        }
    }()

    private lazy var resultLabel: UILabel = {
        UILabel()
            .byText("请选择上方功能".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(contentView) { make in
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        orientationMask
    }

    override var shouldAutorotate: Bool {
        true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(UIColor(hex: 0xFCFBFB))
        jobsSetupGKNav(title: "全局横竖屏切换".tr)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        installButtons()
        configureNavigationOrientation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard isMovingFromParent || navigationController?.isBeingDismissed == true else { return }
        orientationMask = .portrait
        configureNavigationOrientation()
        requestOrientation(.portrait, deviceOrientation: .portrait)
    }

    private func installButtons() {
        actionButtons.enumerated().forEach { index, button in
            contentView.addSubview(button)
            button.snp.makeConstraints { make in
                let row = index / 2
                let isLeft = index.isMultiple(of: 2)
                make.top.equalTo(contentView.snp.top).offset(18 + row * 176)
                if isLeft {
                    make.left.equalToSuperview().offset(16)
                    make.right.equalTo(contentView.snp.centerX).offset(-6)
                } else {
                    make.left.equalTo(contentView.snp.centerX).offset(6)
                    make.right.equalToSuperview().inset(16)
                }
                make.height.equalTo(164)
            }
        }
        guard let lastButton = actionButtons.last else { return }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(lastButton.snp.bottom).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(24)
        }
    }

    private func configureNavigationOrientation() {
        navigationController?
            .byNavTarget(self)
            .supportedInterfaceOrientations { [weak self] _, _ in
                self?.orientationMask ?? .portrait
            }
    }

    private func perform(_ action: Action) {
        switch action {
        /// 检测当前屏幕方向
        case .detect:
            let orientation = view.window?.windowScene?.interfaceOrientation
            resultLabel.byText("当前屏幕方向：\(orientationDescription(orientation))")
        /// 锁定任意横屏方向
        case .lockLandscape:
            orientationMask = .landscape
            configureNavigationOrientation()
            requestOrientation(.landscape, deviceOrientation: .landscapeLeft)
            resultLabel.byText("已锁定：任意横屏方向".tr)
        /// 解除方向锁定
        case .unlock:
            orientationMask = .all
            configureNavigationOrientation()
            requestOrientation(.all, deviceOrientation: .unknown)
            resultLabel.byText("已解除锁定：允许所有方向".tr)
        /// 切换到设备左横屏
        case .landscapeLeft:
            orientationMask = .landscapeLeft
            configureNavigationOrientation()
            requestOrientation(.landscapeLeft, deviceOrientation: .landscapeRight)
            resultLabel.byText("已切换：设备左横屏".tr)
        /// 切换到设备右横屏
        case .landscapeRight:
            orientationMask = .landscapeRight
            configureNavigationOrientation()
            requestOrientation(.landscapeRight, deviceOrientation: .landscapeLeft)
            resultLabel.byText("已切换：设备右横屏".tr)
        /// 恢复竖屏方向
        case .portrait:
            orientationMask = .portrait
            configureNavigationOrientation()
            requestOrientation(.portrait, deviceOrientation: .portrait)
            resultLabel.byText("已切换：设备竖直向上".tr)
        }
    }

    private func requestOrientation(
        _ mask: UIInterfaceOrientationMask,
        deviceOrientation: UIDeviceOrientation
    ) {
        if #available(iOS 16.0, *),
           let windowScene = view.window?.windowScene {
            setNeedsUpdateOfSupportedInterfaceOrientations()
            windowScene.requestGeometryUpdate(
                UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: mask)
            ) { [weak self] error in
                self?.resultLabel.byText("方向切换失败：\(error.localizedDescription)")
            }
        } else if deviceOrientation != .unknown {
            UIDevice.current.setValue(deviceOrientation.rawValue, forKey: "orientation")
            UIViewController.attemptRotationToDeviceOrientation()
        }
    }

    private func orientationDescription(_ orientation: UIInterfaceOrientation?) -> String {
        switch orientation {
        /// 竖屏，Home 按钮在下方
        case .portrait:
            return "竖屏（Home 按钮在下方）".tr
        /// 倒置竖屏
        case .portraitUpsideDown:
            return "倒置竖屏".tr
        /// 设备左横屏
        case .landscapeRight:
            return "设备左横屏".tr
        /// 设备右横屏
        case .landscapeLeft:
            return "设备右横屏".tr
        /// 未识别方向
        default:
            return "未知".tr
        }
    }
}
