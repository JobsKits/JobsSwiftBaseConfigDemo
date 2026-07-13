//
//  SwiftPackageManagerDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026/6/21.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSPMDemoKit
import SnapKit
import GKNavigationBarSwift

final class SwiftPackageManagerDemoVC: BaseVC {

    private lazy var introLabel: UILabel = {
        UILabel()
            .byText("一个本地 Package，同时演示 Library Product、资源 Bundle、泛型 API、actor 并发、Swift Macro、Executable 与测试。App 页面只负责调用公开 API。".tr)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextColor(JobsCor.label)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(16)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
                }
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var buttonStack: UIStackView = {
        UIStackView(arrangedSubviews: [
            makeButton("① Package 信息", color: JobsCor.systemBlue) { [weak self] in
                self?.showPackageSummary()
            },
            makeButton("② Bundle.module 资源", color: JobsCor.systemGreen) { [weak self] in
                self?.showBundledResource()
            },
            makeButton("③ 泛型 Collection API", color: JobsCor.systemOrange) { [weak self] in
                self?.showGenericFormatting()
            },
            makeButton("④ actor 异步查询", color: JobsCor.systemPurple) { [weak self] in
                self?.runActorSearch()
            },
            makeButton("⑤ @EquatableBy Macro", color: JobsCor.systemPink) { [weak self] in
                self?.showMacroBoundary()
            },
            makeButton("▶︎ 一键运行全部", color: JobsCor.systemIndigo) { [weak self] in
                self?.runAllExamples()
            }
        ])
        .byAxis(.vertical)
        .bySpacing(10)
        .byDistribution(.fillEqually)
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(introLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
        }
    }()

    private lazy var resultView: UITextView = {
        UITextView()
            .byEditable(false)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byText("点击上方按钮，观察 Package 公开能力的运行结果。".tr)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(buttonStack.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "Swift Package Manager 综合 Demo".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        introLabel.byVisible(YES)
        buttonStack.byVisible(YES)
        resultView.byVisible(YES)
    }
}

private extension SwiftPackageManagerDemoVC {

    func makeButton(_ title: String, color: UIColor, action: @escaping () -> Void) -> UIButton {
        UIButton.sys()
            .byTitle(title, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(color)
            .byCornerRadius(10)
            .byHeight(42)
            .onTap { _ in action() }
    }

    func showPackageSummary() {
        show("【Library Product】\n\(JobsSPMDemoKit.packageSummary)")
    }

    func showBundledResource() {
        do {
            let catalog = try JobsSPMDemoCatalog.loadBundled()
            show("【Resource Bundle】\n\(catalog.title)\n已从 Bundle.module 解码 \(catalog.features.count) 项能力。")
        } catch {
            show("【Resource Bundle ❌】\n\(error.localizedDescription)")
        }
    }

    func showGenericFormatting() {
        do {
            let features = try JobsSPMDemoCatalog.loadBundled().features
            show("【Generic API】\n\(JobsSPMDemoFormatter.lines(features.map(\.title)))")
        } catch {
            show("【Generic API ❌】\n\(error.localizedDescription)")
        }
    }

    func runActorSearch(append: Bool = false) {
        Task { [weak self] in
            guard let self else { return }
            do {
                let repository = try JobsSPMDemoRepository(catalog: .loadBundled())
                let results = await repository.search("resource")
                let statistics = await repository.statistics()
                let text = "【Swift Concurrency】\n命中：\(results.map(\.title).joined(separator: "、"))\n\(statistics)"
                append ? appendResult(text) : show(text)
            } catch {
                show("【Swift Concurrency ❌】\n\(error.localizedDescription)")
            }
        }
    }

    func showMacroBoundary() {
        show("【Swift Macro】\n\(JobsSPMDemoKit.macroSummary)\n\n运行入口：swift run JobsSPMDemoClient")
    }

    func runAllExamples() {
        resultView.byText("")
        appendResult("【Library Product】\n\(JobsSPMDemoKit.packageSummary)")
        do {
            let catalog = try JobsSPMDemoCatalog.loadBundled()
            appendResult("【Resource Bundle】\n读取 \(catalog.features.count) 项")
            appendResult("【Generic API】\n\(JobsSPMDemoFormatter.lines(catalog.features.prefix(3).map(\.title)))")
        } catch {
            appendResult("【Resource / Generic ❌】\n\(error.localizedDescription)")
        }

        appendResult("【Swift Macro】\n\(JobsSPMDemoKit.macroSummary)")
        runActorSearch(append: true)
    }

    func show(_ text: String) {
        resultView.byText(text)
    }

    func appendResult(_ text: String) {
        let separator = resultView.text.isEmpty ? "" : "\n\n"
        resultView.text += separator + text
    }
}
