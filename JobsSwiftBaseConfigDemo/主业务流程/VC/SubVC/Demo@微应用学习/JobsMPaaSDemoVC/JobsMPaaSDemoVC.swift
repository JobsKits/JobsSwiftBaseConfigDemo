//
//  JobsMPaaSDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

/// mPaaS 是移动技术平台，不只是一个 WebView。此页把“宿主鉴权 → 应用目录 → 包校验 → 容器路由”串成最小闭环。
/// 本页用依赖协议的本地适配器学习架构，不代表接入真实商业 SDK；厂商 SDK/控制台参数在实现层替换。
final class JobsMPaaSDemoVC: JobsMicroAppLabBaseVC {
    override var lessonTitle: String {
        return "mPaaS 平台适配"
    }
    override var lessonSummary: String {
        "本地教学适配器，未接商用 mPaaS SDK。先尝试打开未登录的应用，再登录、查询目录并进入同一个微应用容器。"
    }
    override var lessonActions: [UIButton] {
        return [loginButton, catalogButton, openButton, invalidButton]
    }
    private let adapter: JobsMiniPlatformAdapter = JobsLocalMiniPlatformAdapter()

    private lazy var catalogLabel: UILabel = {
        UILabel.jobsMake { label in
            label.byText("宿主 App\n↓ JobsMiniPlatformAdapter\n鉴权 / 注册目录 / 离线包 / 路由\n↓\nWKWebView + 白名单 Bridge")
                .byNumberOfLines(0)
                .byTextColor(JobsCor.label)
                .byFont(JobsFont.systemFont(ofSize: 15))
                .byAddTo(stageView) { make in
                    make.edges.equalToSuperview().inset(14)
                }
        }
    }()
    private lazy var loginButton: UIButton = lessonButton("登录教学账号", identifier: "lab.mpaasLogin") { [weak self] in
        guard let self else {
            return
        }
        if self.adapter.currentUser == nil {
            self.adapter.login()
            self.loginButton.byTitle("退出教学账号")
            self.record("教学账号登录成功；仅创建本地演示身份。")
        } else {
            self.adapter.logout()
            self.loginButton.byTitle("登录教学账号")
            self.record("教学账号已退出，后续打开需要重新登录。")
        }
    }
    private lazy var catalogButton: UIButton = lessonButton("读取注册目录与本地包", identifier: "lab.mpaasCatalog") { [weak self] in
        guard let self else {
            return
        }
        do {
            self.catalogLabel.byText(try self.adapter.packageDescription())
            self.record("目录加载成功：1 个已注册应用；资源存在性已校验。")
        } catch {
            self.record(error.localizedDescription)
        }
    }
    private lazy var openButton: UIButton = lessonButton("打开已注册微应用", identifier: "lab.mpaasOpen") { [weak self] in
        self?.openApplication("jobs.learning.microapp")
    }
    private lazy var invalidButton: UIButton = lessonButton("测试拒绝：未注册 appId", identifier: "lab.mpaasInvalid") { [weak self] in
        self?.openApplication("unregistered.application")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        catalogLabel.byVisible(true)
        record("本地适配器已装配，当前未登录。")
    }

    private func openApplication(_ appID: String) {
        do {
            try adapter.validateOpen(appID: appID)
            record("鉴权/目录/包检查通过，正在打开容器。")
            navigationController?.pushViewControllerByAnimated(JobsMicroApplicationDemoVC())
        } catch {
            record(error.localizedDescription)
        }
    }
}
