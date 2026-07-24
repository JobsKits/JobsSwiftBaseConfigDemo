//
//  PhotoFilterDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsToast
import Jobsl10n
import SnapKit

@MainActor
final class PhotoFilterDemoVC: BaseVC {
    private let sourceImage: UIImage
    private var filteredImage: UIImage
    private var selectedPreset = PhotoFilterPreset.original
    private var renderRevision = 0
    private var pendingRenderWorkItem: DispatchWorkItem?
    private let renderQueue = DispatchQueue(
        label: "com.jobs.demo.photo-filter",
        qos: .userInitiated
    )

    private lazy var saveButton: UIButton = {
        UIButton.sys()
            .byTitle("保存".tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byBackgroundColor(JobsCor.systemGray3, for: .disabled)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.saveFilteredImage()
            }
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
                make.height.equalTo(48)
            }
    }()

    private lazy var intensityTitleLabel: UILabel = {
        UILabel()
            .byText("强度 100%".tr)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 14, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(intensityRowView) { make in
                make.left.centerY.equalToSuperview()
                make.width.equalTo(82)
            }
    }()

    private lazy var intensityRowView: UIView = {
        UIView()
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalTo(saveButton.snp.top).offset(-12)
                make.height.equalTo(32)
            }
    }()

    private lazy var intensitySlider: UISlider = {
        UISlider()
            .byMinimumValue(0)
            .byMaximumValue(1)
            .byValue(1)
            .onJobsChange { [weak self] (slider: UISlider) in
                self?.intensityDidChange(slider.value)
            }
            .byAddTo(intensityRowView) { [unowned self] make in
                make.left.equalTo(intensityTitleLabel.snp.right).offset(10)
                make.right.centerY.equalToSuperview()
            }
    }()

    private lazy var filterControl: UISegmentedControl = {
        UISegmentedControl(items: PhotoFilterPreset.allCases.map { $0.title.tr })
            .bySelectedSegmentIndex(PhotoFilterPreset.original.rawValue)
            .onJobsChange { [weak self] (control: UISegmentedControl) in
                self?.filterDidChange(control.selectedSegmentIndex)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalTo(intensityRowView.snp.top).offset(-12)
                make.height.equalTo(36)
            }
    }()

    private lazy var imageView: UIImageView = {
        UIImageView()
            .byImage(sourceImage)
            .byContentMode(.scaleAspectFit)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(16)
            .byClipsToBounds(true)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalTo(filterControl.snp.top).offset(-16)
            }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel()
            .byText("原图 · 100%".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.black)
            .byCornerRadius(10)
            .byClipsToBounds(true)
            .byAddTo(imageView) { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(12)
                make.height.equalTo(28)
                make.width.greaterThanOrEqualTo(120)
            }
    }()

    init(sourceImage: UIImage) {
        self.sourceImage = sourceImage
        filteredImage = sourceImage
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "保存滤镜照片到相册".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        imageView.byVisible(true)
        statusLabel.byVisible(true)
        filterControl.byVisible(true)
        intensityRowView.byVisible(true)
        intensityTitleLabel.byVisible(true)
        intensitySlider.byVisible(true)
        saveButton.byVisible(true)
        refreshIntensityAvailability()
    }

    private func filterDidChange(_ selectedIndex: Int) {
        guard let preset = PhotoFilterPreset(rawValue: selectedIndex) else { return }
        pendingRenderWorkItem?.cancel()
        selectedPreset = preset
        refreshIntensityAvailability()
        renderCurrentFilter()
    }

    private func intensityDidChange(_ intensity: Float) {
        intensityTitleLabel.byText("强度 \(Int((intensity * 100).rounded()))%".tr)
        scheduleFilterRender()
    }

    private func refreshIntensityAvailability() {
        let isOriginal = selectedPreset == .original
        intensitySlider.byEnabled(!isOriginal)
        if isOriginal {
            intensitySlider.byValue(1)
            intensityTitleLabel.byText("强度 100%".tr)
        }
    }

    private func renderCurrentFilter() {
        renderRevision += 1
        let revision = renderRevision
        let preset = selectedPreset
        let intensity = intensitySlider.value
        let sourceImage = sourceImage
        saveButton.byEnabled(false)
        statusLabel.byText("\(preset.title) · 处理中…".tr)
        renderQueue.async { [weak self] in
            let image = PhotoFilterRenderer.render(
                sourceImage: sourceImage,
                preset: preset,
                intensity: intensity
            )
            DispatchQueue.main.async { [weak self] in
                guard let self, revision == renderRevision else { return }
                guard let image else {
                    statusLabel.byText("\(preset.title) · 渲染失败".tr)
                    saveButton.byEnabled(true)
                    return
                }
                filteredImage = image
                imageView.byImage(image)
                statusLabel.byText(
                    "\(preset.title) · \(Int((intensity * 100).rounded()))%".tr
                )
                saveButton.byEnabled(true)
            }
        }
    }

    private func scheduleFilterRender() {
        pendingRenderWorkItem?.cancel()
        saveButton.byEnabled(false)
        statusLabel.byText("\(selectedPreset.title) · 处理中…".tr)
        let workItem = DispatchWorkItem { [weak self] in
            self?.renderCurrentFilter()
        }
        pendingRenderWorkItem = workItem
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.08,
            execute: workItem
        )
    }

    private func saveFilteredImage() {
        saveButton.byEnabled(false)
        PhotoFilterPhotoLibrarySaver.save(filteredImage) { [weak self] result in
            guard let self else { return }
            saveButton.byEnabled(true)
            switch result {
            /// 处理 .success 分支
            case .success:
                "滤镜照片已保存到系统相册".tr.toast
            /// 处理 .failure 分支
            case let .failure(error):
                error.localizedDescription.toast
            }
        }
    }
}
