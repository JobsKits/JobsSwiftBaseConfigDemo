//
//  JobsIconfontRemoteImageDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

import GKNavigationBarSwift
import JobsByUIKit
import JobsIconfont
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import UIKit

final class JobsIconfontRemoteImageDemoVC: BaseVC {
    private let assets: [JobsIconfontRemoteAsset] = [.logo, .usageGuide, .invalidURL]

    private lazy var segmentedControl: UISegmentedControl = {
        UISegmentedControl(items: assets.map(\.title))
            .bySelectedSegmentIndex(0)
            .byAddTarget(
                self,
                action: #selector(selectionChanged(_:)),
                for: .valueChanged
            )
    }()

    private lazy var imageView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byContentMode(.scaleAspectFit)
            .byCornerRadius(16)
            .byClipsToBounds(true)
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("等待加载".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
    }()

    private lazy var reloadButton: UIButton = {
        UIButton.sys()
            .byTitle("普通重载".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byNormalBgColor(JobsCor.systemBlue)
            .byCornerRadius(10)
            .onTap { [weak self] _ in self?.loadSelectedAsset(forceRefresh: false) }
    }()

    private lazy var forceReloadButton: UIButton = {
        UIButton.sys()
            .byTitle("忽略缓存重载".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byNormalBgColor(JobsCor.systemOrange)
            .byCornerRadius(10)
            .onTap { [weak self] _ in self?.loadSelectedAsset(forceRefresh: true) }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: title ?? "远程图片与错误兜底".tr)
        layoutUI()
        loadSelectedAsset(forceRefresh: false)
    }

    private func layoutUI() {
        segmentedControl.byAddTo(view) { [unowned self] make in
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(20)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            }
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        imageView.byAddTo(view) { [unowned self] make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.78)
            make.height.equalTo(220)
        }
        statusLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
        }
        reloadButton.byAddTo(view) { [unowned self] make in
            make.top.equalTo(statusLabel.snp.bottom).offset(22)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(48)
        }
        forceReloadButton.byAddTo(view) { [unowned self] make in
            make.top.width.height.equalTo(reloadButton)
            make.left.equalTo(reloadButton.snp.right).offset(12)
            make.right.equalToSuperview().inset(24)
        }
    }

    @objc private func selectionChanged(_ sender: UISegmentedControl) {
        loadSelectedAsset(forceRefresh: false)
    }

    private func loadSelectedAsset(forceRefresh: Bool) {
        let asset = assets[max(0, min(segmentedControl.selectedSegmentIndex, assets.count - 1))]
        imageView.byJobsIconfont(
            asset,
            targetSize: CGSize(width: 320, height: 220),
            forceRefresh: forceRefresh
        ) { [weak self] event in
            switch event {
            case .placeholder:
                self?.statusLabel.byText("已显示本地占位图，正在由框架加载 \(asset.title)…")
            case .success(let loader, let isCacheHit):
                self?.statusLabel.byText(
                    "加载成功｜\(loader.rawValue)｜\(isCacheHit ? "缓存命中" : "网络返回")"
                )
            case .failure:
                self?.statusLabel.byText("URL 无效或网络失败｜继续显示框架内置兜底图")
            }
        }
    }
}
