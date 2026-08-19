//
//  JobsSwiftPatchDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftPatch
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftPatchDemoVC: BaseVC {
    private static let patchID = "com.jobs.demo.swiftpatch.payload"

    private lazy var patchCardView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byMasksToBounds(false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(24)
                make.left.equalToSuperview().offset(20)
                make.right.equalToSuperview().offset(-20)
            }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("Swift 热更新 Demo".tr)
            .byFont(JobsFont.systemFont(ofSize: 24, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
            .byAddTo(patchCardView) { make in
                make.top.equalToSuperview().offset(24)
                make.left.equalToSuperview().offset(20)
                make.right.equalToSuperview().offset(-20)
            }
    }()

    private lazy var subtitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("点击按钮后模拟下载进度；进度结束后读取本地预置补丁数据，通过 Runtime 临时改变当前页面 UI。".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(patchCardView) { [unowned self] make in
                make.top.equalTo(titleLabel.snp.bottom).offset(12)
                make.left.right.equalTo(titleLabel)
            }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("等待开始".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.tertiaryLabel)
            .byNumberOfLines(0)
            .byAddTo(patchCardView) { [unowned self] make in
                make.top.equalTo(subtitleLabel.snp.bottom).offset(22)
                make.left.right.equalTo(titleLabel)
            }
    }()

    private lazy var progressView: UIProgressView = {
        UIProgressView(progressViewStyle: .default)
            .byProgress(0)
            .byProgressTintColor(JobsCor.systemBlue)
            .byTrackTintColor(JobsCor.systemGray5)
            .byHidden(true)
            .byAddTo(patchCardView) { [unowned self] make in
                make.top.equalTo(statusLabel.snp.bottom).offset(18)
                make.left.right.equalTo(titleLabel)
                make.height.equalTo(4)
            }
    }()

    private lazy var hotRefreshButton: UIButton = {
        UIButton.sys()
            .byTitle("开始热更新演示".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byBackgroundColor(JobsCor.label)
            .byCornerRadius(8)
            .onTap { [weak self] _ in
                self?.startPatchDemo()
            }
            .byAddTo(patchCardView) { [unowned self] make in
                make.top.equalTo(progressView.snp.bottom).offset(24)
                make.left.right.equalTo(titleLabel)
                make.height.equalTo(44)
                make.bottom.equalToSuperview().offset(-24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "Swift 热更新演示".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        buildDemoUI()
        resetDemoUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetDemoUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        rollbackPatch()
        resetDemoUI()
    }

    @objc dynamic func hotRefreshPatchPayload() -> NSDictionary {
        NSDictionary.jobsMake { _ in }
    }
}

private extension JobsSwiftPatchDemoVC {
    func buildDemoUI() {
        patchCardView.byVisible(true)
        titleLabel.byVisible(true)
        subtitleLabel.byVisible(true)
        statusLabel.byVisible(true)
        progressView.byVisible(true)
        hotRefreshButton.byVisible(true)
    }

    func startPatchDemo() {
        rollbackPatch()
        resetDemoUI()
        hotRefreshButton.byEnabled(false)
        statusLabel.byText("正在加载本地预置补丁...".tr)
        progressView
            .byProgress(0)
            .byHidden(false)
        UIView.jobsAnimateWithCompletion(
            1.2,
            animations: {
                self.progressView.byProgress(1, animated: true)
            },
            completion: { [weak self] _ in
                guard let self else { return }
                self.installLocalRuntimePatch()
                self.applyPatchPayload(self.hotRefreshPatchPayload())
            }
        )
    }

    func installLocalRuntimePatch() {
        let payload: NSDictionary = [
            "title": "Swift Runtime Patch 已生效",
            "subTitle": "这份数据原本可以来自服务端；Demo 中改为本地预置，点击后临时替换方法实现并刷新 UI。",
            "status": "补丁加载完成：Swift 页面 UI 已被本地补丁接管",
            "buttonTitle": "重新演示 Swift 热更新",
            "cardHex": "#FEE715",
            "titleHex": "#101820",
            "subTitleHex": "#243447",
            "progressHex": "#34C759"
        ]
        JobsSwiftPatchMgr.shared.installPayloadPatch(
            JobsSwiftPatchModel(identifier: Self.patchID,
                                targetClass: type(of: self),
                                selector: #selector(hotRefreshPatchPayload),
                                payload: payload)
        )
    }

    func rollbackPatch() {
        JobsSwiftPatchMgr.shared.rollbackPatch(identifier: Self.patchID)
    }

    func applyPatchPayload(_ payload: NSDictionary) {
        guard payload.count > 0 else { return }
        view.byBackgroundColor(JobsCor.systemBackground)
        patchCardView.byBackgroundColor(color(hex: payload["cardHex"] as? String,
                                              defaultColor: JobsCor.secondarySystemBackground))
        titleLabel
            .byText((payload["title"] as? String) ?? "")
            .byTextColor(color(hex: payload["titleHex"] as? String,
                               defaultColor: JobsCor.label))
        subtitleLabel
            .byText((payload["subTitle"] as? String) ?? "")
            .byTextColor(color(hex: payload["subTitleHex"] as? String,
                               defaultColor: JobsCor.secondaryLabel))
        statusLabel
            .byText((payload["status"] as? String) ?? "")
            .byTextColor(color(hex: payload["titleHex"] as? String,
                               defaultColor: JobsCor.label))
        progressView.byProgressTintColor(color(hex: payload["progressHex"] as? String,
                                               defaultColor: JobsCor.systemGreen))
        hotRefreshButton
            .byTitle((payload["buttonTitle"] as? String) ?? "", for: .normal)
            .byEnabled(true)
    }

    func resetDemoUI() {
        view.byBackgroundColor(JobsCor.systemBackground)
        patchCardView.byBackgroundColor(JobsCor.secondarySystemBackground)
        titleLabel
            .byText("Swift 热更新 Demo".tr)
            .byTextColor(JobsCor.label)
        subtitleLabel
            .byText("点击按钮后模拟下载进度；进度结束后读取本地预置补丁数据，通过 Runtime 临时改变当前页面 UI。".tr)
            .byTextColor(JobsCor.secondaryLabel)
        statusLabel
            .byText("等待开始".tr)
            .byTextColor(JobsCor.tertiaryLabel)
        progressView
            .byProgress(0)
            .byProgressTintColor(JobsCor.systemBlue)
            .byHidden(true)
        hotRefreshButton
            .byTitle("开始热更新演示".tr, for: .normal)
            .byEnabled(true)
    }

    func color(hex: String?, defaultColor: UIColor) -> UIColor {
        guard let hex else { return defaultColor }
        let clean = hex.replacingOccurrences(of: "#", with: "")
        guard clean.count == 6, let value = Int(clean, radix: 16) else { return defaultColor };return UIColor(
            red: CGFloat((value >> 16) & 0xFF) / 255.0,
            green: CGFloat((value >> 8) & 0xFF) / 255.0,
            blue: CGFloat(value & 0xFF) / 255.0,
            alpha: 1
        )
    }
}
