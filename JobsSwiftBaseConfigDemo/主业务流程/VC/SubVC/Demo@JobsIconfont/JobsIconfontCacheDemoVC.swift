//
//  JobsIconfontCacheDemoVC.swift
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

final class JobsIconfontCacheDemoVC: BaseVC {
    private var automaticSecondLoadPending = true

    private lazy var imageView: UIImageView = {
        UIImageView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byContentMode(.scaleAspectFit)
            .byCornerRadius(16)
            .byClipsToBounds(true)
    }()

    private lazy var statusLabel: UILabel = {
        UILabel()
            .byText("首次加载准备中".tr)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
    }()

    private lazy var clearButton: UIButton = {
        UIButton.sys()
            .byTitle("清空缓存并自动重载".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byNormalBgColor(JobsCor.systemRed)
            .byCornerRadius(10)
            .onTap { [weak self] _ in self?.clearAndReload() }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "缓存命中、清理与重载".tr)
        layoutUI()
        loadImage(forceRefresh: true, phase: "首次网络加载")
    }

    private func layoutUI() {
        imageView.byAddTo(view) { [unowned self] make in
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(28)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(28)
            }
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 220, height: 220))
        }
        statusLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
        }
        clearButton.byAddTo(view) { [unowned self] make in
            make.top.equalTo(statusLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().inset(36)
            make.height.equalTo(50)
        }
    }

    private func loadImage(forceRefresh: Bool, phase: String) {
        imageView.byJobsIconfont(
            .logo,
            targetSize: CGSize(width: 220, height: 220),
            forceRefresh: forceRefresh
        ) { [weak self] event in
            switch event {
            case .placeholder:
                self?.statusLabel.byText("\(phase)｜先显示占位图")
            case .success(let loader, let isCacheHit):
                self?.statusLabel.byText(
                    "\(phase)｜\(loader.rawValue)｜\(isCacheHit ? "缓存命中" : "网络返回")"
                )
                guard self?.automaticSecondLoadPending == true else { return }
                self?.automaticSecondLoadPending = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self?.loadImage(forceRefresh: false, phase: "自动第二次加载")
                }
            case .failure:
                self?.statusLabel.byText("\(phase)｜加载失败，保留兜底图")
            }
        }
    }

    private func clearAndReload() {
        statusLabel.byText("正在统一清理三套缓存…")
        JobsIconfont.shared.clearImageCache { [weak self] in
            self?.loadImage(forceRefresh: true, phase: "清理后的强制重载")
        }
    }
}
