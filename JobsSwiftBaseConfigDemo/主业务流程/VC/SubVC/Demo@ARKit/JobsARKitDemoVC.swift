//
//  JobsARKitDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

import UIKit

import GKNavigationBarSwift
import Jobsl10n
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit

final class JobsARKitDemoVC: BaseVC {

    private var buttons: [String: UIButton] = [:]
    private var rows: [UIStackView] = []
    private var observers: [NSObjectProtocol] = []
    private var statusKey = "guidePreviewEmpty"
    private var planes = 0
    private var models = 0

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
            .bySpacing(12)
            .byAddTo(scroll) { [unowned self] make in
                make.edges.equalTo(scroll.contentLayoutGuide).inset(18)
                make.width.equalTo(scroll.frameLayoutGuide).offset(-36)
            }
    }()
    private lazy var stepLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 18, weight: .semibold), style: .headline)
            .byAccessibilityIdentifier("jobs.arkit.step")
    }()
    private lazy var pendingLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 15, weight: .medium), style: .subheadline)
            .byAccessibilityIdentifier("jobs.arkit.pending")
    }()
    private lazy var stage: JobsARKitStageView = {
        JobsARKitStageView(frame: .zero)
            .byAccessibilityIdentifier("jobs.arkit.scene")
    }()
    private lazy var status: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 15), style: .subheadline)
            .byAccessibilityIdentifier("jobs.arkit.status")
    }()
    private lazy var countLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byAccessibilityIdentifier("jobs.arkit.counts")
            .byDynamicFont(JobsFont.systemFont(ofSize: 14), style: .footnote)
    }()
    private lazy var currentLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 16, weight: .semibold), style: .body)
            .byAccessibilityIdentifier("jobs.arkit.current")
    }()
    private lazy var adjustTitle: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 17, weight: .semibold), style: .headline)
    }()
    private lazy var adjustGuide: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 14), style: .subheadline)
    }()
    private lazy var aboutTitle: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 17, weight: .semibold), style: .headline)
    }()
    private lazy var intro: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 15), style: .body)
    }()
    private lazy var pipeline: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 15), style: .body)
    }()
    private lazy var guide: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byDynamicFont(JobsFont.systemFont(ofSize: 14), style: .subheadline)
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
        stage.refreshState()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stage.setVisible(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stage.setVisible(false)
    }

    private func assemble() {
        addRow([("preview", "preview"), ("start", "start")])
        stack.byAddArrangedSubview(stepLabel)
        addRow([("cube", "model.cube"), ("sphere", "model.sphere"), ("robot", "model.robot")])
        stack.byAddArrangedSubview(pendingLabel)
        addRow([("place", "place")])
        stack.byAddArrangedSubviews([status, stage, countLabel, adjustTitle, currentLabel, adjustGuide])
        stage.snp.makeConstraints { make in
            make.height.equalTo(260)
        }
        addRow([("smaller", "smaller"), ("rotate", "rotate"), ("larger", "larger")])
        addRow([("clear", "clear"), ("reset", "reset")])
        addRow([("retry", "retry"), ("settings", "settings")])
        stack.byAddArrangedSubviews([aboutTitle, intro, pipeline, guide])
        stack.setCustomSpacing(24, after: countLabel)
        if let lastRow = rows.last {
            stack.setCustomSpacing(24, after: lastRow)
        }
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
                .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
                .byAccessibilityIdentifier("jobs.arkit.\(identifier)")
                .onTap { [weak self] _ in
                    self?.perform(key)
                }
            buttons[key] = button
            row.byAddArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(48).priority(999)
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
            self?.applyTheme()
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
        adjustTitle.byText(JobsARKitText.text("adjustTitle"))
        adjustGuide.byText(JobsARKitText.text("adjustGuide"))
        aboutTitle.byText(JobsARKitText.text("aboutTitle"))
        refreshStatus()
    }

    private func buttonTitle(_ key: String) -> String {
        switch key {
        /// Mode names make camera use explicit before the user starts a session.
        case "preview":
            return JobsARKitText.text("modePreview")
        case "start":
            return JobsARKitText.text("modeAR")
        case "place":
            return JobsARKitText.text(stage.previewing ? "addPreview" : "placeAR")
        case "reset":
            return JobsARKitText.text(stage.previewing ? "resetPractice" : "resetAR")
        case "retry":
            return JobsARKitText.text("scanAgain")
        /// Remaining actions retain their existing localized names.
        default:
            return JobsARKitText.text(key)
        }
    }

    private func refreshStatus() {
        let sequence = JobsARKitText.text(stage.previewing ? "stepsPreview" : "stepsAR")
        let steps = sequence.components(separatedBy: "→")
        let index = stage.selectedModel < 0 ? 0 : (stage.awaitingPlacement || !stage.hasModels ? 1 : 2)
        stepLabel
            .byText(steps.count == 3 ? steps[index].trimmingCharacters(in: .whitespacesAndNewlines) : sequence)
            .byARAccessibilityValue("step:\(index + 1)")
        if stage.selectedModel >= 0 {
            pendingLabel.byText(String(format: JobsARKitText.text("pendingModel"), modelName(stage.selectedModel)))
        } else {
            pendingLabel.byText(JobsARKitText.text("pendingNone"))
        }
        status.byText(JobsARKitText.text(statusKey))
        countLabel
            .byText(stage.previewing
                ? String(format: JobsARKitText.text("previewCount"), UInt(models))
                : String(format: JobsARKitText.text("realCount"), UInt(planes), UInt(models)))
            .byARAccessibilityValue("planes:\(planes);models:\(models)")
        currentLabel.byText(stage.lastModelKind.map {
            String(format: JobsARKitText.text("currentModel"), modelName($0))
        } ?? JobsARKitText.text("currentEmpty"))
        buttons["place"]?.byEnabled(stage.canPlace)
        for key in ["smaller", "rotate", "larger", "clear"] {
            buttons[key]?.byEnabled(stage.hasModels)
        }
        buttons["retry"]?.byHidden(stage.previewing)
        buttons["settings"]?.byHidden(stage.previewing)
        rows.last?.byHidden(stage.previewing)
        applyTheme()
    }

    private func modelName(_ kind: Int) -> String {
        return JobsARKitText.text(["cube", "sphere", "robot"][kind])
    }

    private func applyTheme() {
        let center = JobsThemeCenter.shared
        view.byBackgroundColor(center.resolvedColor(.backgroundPrimary))
        for label in [stepLabel, status, currentLabel, adjustTitle, aboutTitle, intro, pipeline] {
            label.byTextColor(center.resolvedColor(.textPrimary))
        }
        for label in [pendingLabel, countLabel, adjustGuide, guide] {
            label.byTextColor(center.resolvedColor(.textSecondary).withAlphaComponent(1))
        }
        for (key, button) in buttons {
            let modelKeys = ["cube", "sphere", "robot"]
            let selected = modelKeys.indices.contains(stage.selectedModel) && key == modelKeys[stage.selectedModel]
            let activeMode = key == (stage.previewing ? "preview" : "start")
            let primary = button.isEnabled && (key == "place" || selected || activeMode)
            let foreground = primary ? JobsCor.white : center.resolvedColor(.textPrimary)
            button
                .byAccessibilityLabel(buttonTitle(key))
                .byConfiguration(UIButton.Configuration.filled()
                    .byTitle(buttonTitle(key))
                    .byBaseBackgroundColor(primary ? UIColor(hex: "#135F70") : center.resolvedColor(.backgroundSecondary))
                    .byBaseForegroundColor(foreground)
                    .byCornerStyle(.medium)
                    .byContentInsets(NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8)))
                .byTitleColor(foreground, for: .normal)
                .byTitleColor(center.resolvedColor(.textSecondary).withAlphaComponent(1), for: .disabled)
                .bySelected(selected || activeMode)
                .byNumberOfLines(0)
                .byUpdateConfig()
        }
    }

    private func perform(_ key: String) {
        switch key {
        /// Real AR explicitly requests camera access and starts scanning.
        case "start", "retry":
            stage.startAR()
        /// Practice always starts with an empty scene and no camera.
        case "preview":
            stage.showPreview()
        /// Selection only changes the next model; the add action performs placement.
        case "cube":
            stage.bySelectedModel(0)
        case "sphere":
            stage.bySelectedModel(1)
        case "robot":
            stage.bySelectedModel(2)
        case "place":
            stage.placeSelectedModel()
        /// Clear and reset both leave practice empty; AR reset scans again.
        case "clear":
            stage.clear()
        case "reset":
            stage.reset()
        /// Adjustment affects the last placed model only.
        case "rotate":
            stage.rotateLatest()
        case "smaller":
            stage.scaleLatest(0.8)
        case "larger":
            stage.scaleLatest(1.25)
        /// Settings is the supported recovery route for a denied camera permission.
        case "settings":
            UIApplication.openSettingsURLString.open()
        /// Unknown actions do not change the scene.
        default:
            break
        }
    }
}
