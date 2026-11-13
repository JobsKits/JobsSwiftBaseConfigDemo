//
//  JobsARKitDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

import UIKit

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import Jobsl10n
import JobsSwiftBaseDefines
import SnapKit

final class JobsARKitDemoVC: BaseVC {

    private var buttons: [String: UIButton] = [:]
    private var rows: [UIStackView] = []
    private var alert: UIAlertController?
    private var observers: [NSObjectProtocol] = []
    private var followSystemAppearance = UserDefaults.standard.bool(forKey: "JobsARKit.followSystemAppearance")
    private var applyingSystemAppearance = false
    private var statusKey = "previewNotice"
    private var planes = 0
    private var models = 1

    private lazy var scroll: UIScrollView = {
        UIScrollView.jobsMake { _ in }
            .byAlwaysBounceVertical(true)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            }
    }()
    private lazy var stack: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.vertical)
            .bySpacing(14)
            .byAddTo(scroll) { [unowned self] make in
                make.edges.equalTo(scroll.contentLayoutGuide).inset(18)
                make.width.equalTo(scroll.frameLayoutGuide).offset(-36)
            }
    }()
    private lazy var intro: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 16, weight: .medium), style: .body)
            .byTextColor(JobsCor.label)
    }()
    private lazy var stage: JobsARKitStageView = {
        JobsARKitStageView(frame: .zero)
            .byAccessibilityIdentifier("jobs.arkit.scene")
    }()
    private lazy var status: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 14, weight: .semibold), style: .subheadline)
            .byTextColor(JobsCor.label)
            .byAccessibilityIdentifier("jobs.arkit.status")
    }()
    private lazy var countLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byAccessibilityIdentifier("jobs.arkit.counts")
            .byDynamicFont(JobsFont.monospacedDigitSystemFont(ofSize: 13, weight: .medium), style: .footnote)
            .byTextColor(JobsCor.secondaryLabel)
    }()
    private lazy var emptyLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 14), style: .subheadline)
            .byTextColor(JobsCor.secondaryLabel)
    }()
    private lazy var pipeline: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 15), style: .body)
            .byTextColor(JobsCor.label)
    }()
    private lazy var guide: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 14), style: .subheadline)
            .byTextColor(JobsCor.secondaryLabel)
    }()

    deinit {
        for observer in observers {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assemble()
        bindState()
        localize()
        applyTheme()
        if followSystemAppearance {
            synchronizeSystemAppearance()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stage.setVisible(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stage.setVisible(false)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if followSystemAppearance {
            synchronizeSystemAppearance()
        }
    }

    private func assemble() {
        stack.byAddArrangedSubviews([intro, stage, status, countLabel, emptyLabel])
        stage.snp.makeConstraints { make in
            make.height.equalTo(300)
        }
        addRow([("start", "start"), ("preview", "preview")])
        addRow([("cube", "model.cube"), ("sphere", "model.sphere"), ("robot", "model.robot")])
        addRow([("smaller", "smaller"), ("rotate", "rotate"), ("larger", "larger")])
        addRow([("clear", "clear"), ("reset", "reset")])
        addRow([("retry", "retry"), ("settings", "settings")])
        addRow([("theme", "theme")])
        stack.byAddArrangedSubviews([pipeline, guide])
    }

    private func addRow(_ definitions: [(String, String)]) {
        let row = UIStackView.jobsMake { _ in }
            .byAxis(.horizontal)
            .bySpacing(8)
            .byAlignment(.fill)
            .byDistribution(.fillEqually)
        rows.append(row)
        for (key, identifier) in definitions {
            let button = UIButton.sys()
                .byNumberOfLines(0)
                .byTitleFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
                .byAccessibilityIdentifier("jobs.arkit.\(identifier)")
                .onTap { [weak self] _ in
                    self?.perform(key)
                }
            buttons[key] = button
            row.byAddArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(48)
            }
        }
        stack.byAddArrangedSubview(row)
    }

    private func bindState() {
        stage.onChange = { [weak self] key, planes, models in
            guard let self else {
                return
            }
            self.statusKey = key
            self.planes = planes
            self.models = models
            self.refreshStatus()
        }
        observers.append(NotificationCenter.default.addObserver(forName: .JobsThemeDidChange,
                                                                 object: nil,
                                                                 queue: .main) { [weak self] _ in
            guard let self else {
                return
            }
            if !self.applyingSystemAppearance {
                self.followSystemAppearance = false
                UserDefaults.standard.set(false, forKey: "JobsARKit.followSystemAppearance")
            }
            self.applyTheme()
        })
        observers.append(NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                                 object: nil,
                                                                 queue: .main) { [weak self] _ in
            self?.localize()
        })
        observers.append(NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification,
                                                                 object: nil,
                                                                 queue: .main) { [weak self] _ in
            self?.stage.setVisible(false)
        })
        observers.append(NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                                                 object: nil,
                                                                 queue: .main) { [weak self] _ in
            guard let self, self.viewIfLoaded?.window != nil else {
                return
            }
            self.stage.setVisible(true)
            if self.followSystemAppearance {
                self.synchronizeSystemAppearance()
            }
            if self.stage.wantsAR {
                self.stage.startAR()
            }
        })
    }

    private func localize() {
        jobsSetupGKNav(title: JobsARKitText.text("title"))
        intro.byText(JobsARKitText.text("intro"))
        pipeline.byText(JobsARKitText.text("pipeline"))
        guide.byText(JobsARKitText.text("guide"))
        emptyLabel.byText(JobsARKitText.text("empty"))
        for (key, button) in buttons {
            button.byTitle(JobsARKitText.text(key))
                .byAccessibilityLabel(JobsARKitText.text(key))
        }
        refreshStatus()
    }

    private func refreshStatus() {
        status.byText(JobsARKitText.text(statusKey))
        countLabel.byText("\(JobsARKitText.text("counts"))  \(planes) / \(models)")
            .byARAccessibilityValue("planes:\(planes);models:\(models)")
        emptyLabel.byHidden(models != 0)
    }

    private func applyTheme() {
        let center = JobsThemeCenter.shared
        view.byBackgroundColor(center.resolvedColor(.backgroundPrimary))
        for label in [intro, status, pipeline] {
            label.byTextColor(center.resolvedColor(.textPrimary))
        }
        for label in [countLabel, emptyLabel, guide] {
            label.byTextColor(center.resolvedColor(.textSecondary).withAlphaComponent(1))
        }
        for (key, button) in buttons {
            let primary = key == "start" || (key == ["cube", "sphere", "robot"][stage.selectedModel])
            button.byConfiguration(UIButton.Configuration.filled()
                .byTitle(JobsARKitText.text(key))
                .byBaseBackgroundColor(primary ? UIColor(hex: "#135F70") : center.resolvedColor(.backgroundSecondary))
                .byBaseForegroundColor(primary ? JobsCor.white : center.resolvedColor(.textPrimary))
                .byCornerStyle(.medium)
                .byContentInsets(NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8)))
        }
    }

    private func perform(_ key: String) {
        switch key {
        /// Explicitly request camera permission and start a fresh world-tracking session.
        case "start", "retry":
            stage.startAR()
        /// Offline preview has its own scene and a persistent explanatory label.
        case "preview":
            stage.showPreview()
        /// The selected primitive is used for subsequent placements.
        case "cube":
            stage.selectedModel = 0
        /// The selected sphere is used for subsequent placements.
        case "sphere":
            stage.selectedModel = 1
        /// A locally assembled robot demonstrates multiple geometries.
        case "robot":
            stage.selectedModel = 2
        /// Clear placed models while preserving detected planes.
        case "clear":
            stage.clear()
        /// Reset tracking and anchors, or rebuild the offline scene.
        case "reset":
            stage.reset()
        /// Transform only the latest placed model.
        case "rotate":
            stage.rotateLatest()
        /// Keep model scale bounded.
        case "smaller":
            stage.scaleLatest(0.8)
        /// Keep model scale bounded.
        case "larger":
            stage.scaleLatest(1.25)
        /// Offer light, dark, and system appearance.
        case "theme":
            chooseTheme()
        /// The system Settings URL is the supported permission recovery route.
        case "settings":
            UIApplication.openSettingsURLString.open()
        /// Unknown actions never change scene state.
        default:
            break
        }
        applyTheme()
    }

    private func chooseTheme() {
        alert = UIAlertController.makeAlert(JobsARKitText.text("theme"))
        for (key, style) in [("light", JobsThemeStyle.light), ("dark", JobsThemeStyle.dark)] {
            alert?.byAddAction(title: JobsARKitText.text(key)) { [weak self] _ in
                self?.followSystemAppearance = false
                UserDefaults.standard.set(false, forKey: "JobsARKit.followSystemAppearance")
                JobsThemeCenter.shared.setStyle(style)
            }
        }
        alert?.byAddAction(title: JobsARKitText.text("system")) { [weak self] _ in
            self?.followSystemAppearance = true
            UserDefaults.standard.set(true, forKey: "JobsARKit.followSystemAppearance")
            self?.synchronizeSystemAppearance()
        }
        alert?.byAddCancel(JobsARKitText.text("cancel"))
            .byPresent(self)
    }

    private func synchronizeSystemAppearance() {
        let style: JobsThemeStyle = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? .dark : .light
        if JobsThemeCenter.shared.currentStyle != style {
            applyingSystemAppearance = true
            JobsThemeCenter.shared.setStyle(style)
            applyingSystemAppearance = false
        }
    }
}
