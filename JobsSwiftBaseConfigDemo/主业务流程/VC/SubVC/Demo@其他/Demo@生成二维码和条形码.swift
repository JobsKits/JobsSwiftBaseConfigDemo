//
//  Demo@生成二维码和条形码.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsTextTools
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class QRCodeDemoVC: BaseVC {
    private let qrContent = "https://jobs.dev/hello"
    private let logoQRContent = "https://www.google.com"
    private let barcodeContent = "JOBS-2025-10-18"

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byBackgroundColor(JobsCor.systemBackground)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalToSuperview().inset(
                    UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
                )
                make.width.equalTo(scrollView.snp.width).offset(-40)
            }
    }()

    private lazy var qrImageView: UIImageView = {
        UIImageView()
            .byImage(qrContent.qrcodeImage(180, correction: "M"))
            .byContentMode(.scaleAspectFit)
            .addTapAction { [weak self] (_: UIImageView) in
                guard let self else { return }
                copy(qrContent)
            }
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(24)
                make.centerX.equalToSuperview()
                make.width.height.equalTo(180)
            }
    }()

    private lazy var qrLabel: UILabel = {
        UILabel()
            .byText(qrContent)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(qrImageView.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(22)
            }
    }()

    private lazy var logoQRImageView: UIImageView = {
        UIImageView()
            .byImage(
                logoQRContent.qrcodeImage(
                    180,
                    correction: "H",
                    centerLogo: "Ani".img,
                    logoRatio: 0.22,
                    logoCornerRadius: 10,
                    borderWidth: 6,
                    borderColor: JobsCor.white
                )
            )
            .byContentMode(.scaleAspectFit)
            .addTapAction { [weak self] (_: UIImageView) in
                guard let self else { return }
                copy(logoQRContent)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(qrLabel.snp.bottom).offset(24)
                make.centerX.equalToSuperview()
                make.width.height.equalTo(180)
            }
    }()

    private lazy var logoQRLabel: UILabel = {
        UILabel()
            .byText("带中心 Logo 的二维码".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(logoQRImageView.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(22)
            }
    }()

    private lazy var barcodeImageView: UIImageView = {
        UIImageView()
            .byImage(
                barcodeContent.code128ByText(
                    width: 260,
                    barHeight: 86,
                    quietSpace: 7,
                    spacing: 6,
                    font: JobsFont.systemFont(ofSize: 15, weight: .regular),
                    textColor: JobsCor.black,
                    background: JobsCor.white
                )
            )
            .byContentMode(.scaleAspectFit)
            .addTapAction { [weak self] (_: UIImageView) in
                guard let self else { return }
                copy(barcodeContent)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(logoQRLabel.snp.bottom).offset(24)
                make.centerX.equalToSuperview()
                make.width.equalTo(260)
                make.height.equalTo(110)
            }
    }()

    private lazy var barcodeLabel: UILabel = {
        UILabel()
            .byText("Code128 条形码".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(barcodeImageView.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(22)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "二维码 + 条形码".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        qrImageView.byVisible(YES)
        qrLabel.byVisible(YES)
        logoQRImageView.byVisible(YES)
        logoQRLabel.byVisible(YES)
        barcodeImageView.byVisible(YES)
        barcodeLabel.byVisible(YES)
    }

    private func copy(_ content: String) {
        content.paste()
        "复制成功".tr.toast
    }
}
