//
//  JobsRustOCRDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import UIKit
import AVFoundation
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsRustOCRDemoVC: BaseVC {

    private var selectedImage: UIImage? = JobsOCRSDKAdapter.sampleImage()
    private var requestID = UUID()
    private var isRecognizing = false
    private var recognizedText = ""
    private var statusKey = JobsOCRSDKAdapter.isAvailable ? "选择图片后开始离线识别" : "OCR 核心尚未安装"
    private var diagnostic = ""
    private var languageToken: NSObjectProtocol?
    private var themeToken: NSObjectProtocol?
    private var backgroundToken: NSObjectProtocol?
    private var resultHeight: Constraint?
    private var measuredResultHeight: CGFloat = 180

    private var secondaryInk: UIColor {
        return UIColor(white: RootListPreferences.darkModeEnabled ? 0.78 : 0.33, alpha: 1)
    }

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake {
            $0.alwaysBounceVertical = true
        }
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }()

    private lazy var contentView: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.width.equalTo(scrollView.frameLayoutGuide)
            }
    }()

    private lazy var imageView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleAspectFit)
            .byImage(selectedImage)
            .byAccessibilityIdentifier("jobs.ocr.preview")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(220)
            }
    }()

    private lazy var sampleButton: UIButton = {
        actionButton(identifier: "jobs.ocr.sample") { [weak self] in
            self?.selectImage(JobsOCRSDKAdapter.sampleImage())
        }
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(contentView).multipliedBy(1.0 / 3.0).offset(-16)
            make.height.greaterThanOrEqualTo(48)
        }
    }()

    private lazy var photoButton: UIButton = {
        actionButton(identifier: "jobs.ocr.photo") { [weak self] in
            self?.presentPicker(source: .photoLibrary)
        }
        .byAddTo(contentView) { [unowned self] make in
            make.top.bottom.width.equalTo(sampleButton)
            make.left.equalTo(sampleButton.snp.right).offset(8)
        }
    }()

    private lazy var cameraButton: UIButton = {
        actionButton(identifier: "jobs.ocr.camera") { [weak self] in
            self?.requestCamera()
        }
        .byAddTo(contentView) { [unowned self] make in
            make.top.bottom.width.equalTo(sampleButton)
            make.left.equalTo(photoButton.snp.right).offset(8)
            make.right.equalToSuperview().inset(16)
        }
    }()

    private lazy var recognizeButton: UIButton = {
        actionButton(identifier: "jobs.ocr.recognize", primary: true) { [weak self] in
            self?.recognize()
        }
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(sampleButton.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.lessThanOrEqualToSuperview().inset(16)
            make.width.greaterThanOrEqualTo(160)
            make.height.greaterThanOrEqualTo(48)
        }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byFont(JobsFont.preferredFont(forTextStyle: .caption1))
            .byAccessibilityIdentifier("jobs.ocr.status")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(recognizeButton.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var resultLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.preferredFont(forTextStyle: .headline))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(statusLabel.snp.bottom).offset(22)
                make.left.equalToSuperview().offset(16)
            }
    }()

    private lazy var copyButton: UIButton = {
        actionButton(identifier: "jobs.ocr.copy") { [weak self] in
            guard let self, !self.recognizedText.isEmpty else {
                return
            }
            UIPasteboard.general.string = self.recognizedText
            self.statusKey = "已复制识别结果"
            self.refreshAppearance()
        }
        .byAddTo(contentView) { [unowned self] make in
            make.centerY.equalTo(resultLabel)
            make.left.greaterThanOrEqualTo(resultLabel.snp.right).offset(12)
            make.right.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(44)
        }
    }()

    private lazy var resultView: UITextView = {
        UITextView.jobsMake {
            $0.isScrollEnabled = false
        }
        .byEditable(false)
        .bySelectable(true)
        .byFont(JobsFont.preferredFont(forTextStyle: .body))
        .byTextContainerInset(UIEdgeInsets(top: 14, left: 12, bottom: 14, right: 12))
        .byAccessibilityIdentifier("jobs.ocr.result")
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(copyButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(20)
            resultHeight = make.height.equalTo(180).constraint
        }
    }()

    private lazy var emptyButton: UIButton = {
        JobsEmptyAuto.Config.defaultProvider()
            .byAccessibilityIdentifier("jobs.ocr.empty")
            .byTitle("尚无识别结果".tr)
            .bySubTitle("选择样例或照片，点击开始识别；结果仅在本机处理。".tr)
            .onTap { [weak self] _ in
                self?.recognize()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.edges.equalTo(resultView)
            }
    }()

    private lazy var imagePicker: UIImagePickerController = {
        UIImagePickerController.jobsMake { _ in }
            .bySourceType(.photoLibrary)
            .byAllowsEditing(false)
            .byTarget(self)
            .didFinishPickingMediaWithInfo { target, picker, info in
                picker.byDismiss()
                (target as? JobsRustOCRDemoVC)?.selectImage(info[.originalImage] as? UIImage)
            }
            .didCancel { _, picker in
                picker.byDismiss()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.byVisible(true)
        emptyButton.byVisible(true)
        languageToken = NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                               object: nil,
                                                               queue: .main) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.refreshAppearance()
            }
        }
        themeToken = NotificationCenter.default.addObserver(forName: .JobsThemeDidChange,
                                                            object: nil,
                                                            queue: .main) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.refreshAppearance()
            }
        }
        backgroundToken = NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                                                 object: nil,
                                                                 queue: .main) { [weak self] _ in
            MainActor.assumeIsolated {
                self?.cancelRecognition()
            }
        }
        refreshAppearance()
        if ProcessInfo.processInfo.arguments.contains("--jobs-ocr-auto") {
            recognize()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard resultView.bounds.width > 0 else {
            return
        }
        let size = resultView.sizeThatFits(CGSize(width: resultView.bounds.width,
                                                  height: CGFloat.greatestFiniteMagnitude))
        let height = max(180, ceil(size.height))
        if abs(height - measuredResultHeight) > 0.5 {
            measuredResultHeight = height
            resultHeight?.update(offset: height)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent || isBeingDismissed || navigationController?.isBeingDismissed == true {
            cancelRecognition()
        }
    }

    deinit {
        [languageToken, themeToken, backgroundToken].compactMap { $0 }.forEach {
            NotificationCenter.default.removeObserver($0)
        }
    }

    private func actionButton(identifier: String,
                              primary: Bool = false,
                              action: @escaping () -> Void) -> UIButton {
        let button = UIButton.sys()
            .byAccessibilityIdentifier(identifier)
            .byTitleFont(JobsFont.preferredFont(forTextStyle: .subheadline))
            .byConfiguration { configuration in
                configuration
                    .byCornerStyle(.fixed)
                    .byBackground(configuration.background.byCornerRadius(10))
            }
            .onTap { _ in
                action()
            }
        button.titleLabel?.numberOfLines = 2
        button.configurationUpdateHandler = { button in
            var configuration = button.configuration ?? .filled()
            let effectiveTraits = UITraitCollection(userInterfaceStyle: RootListPreferences.darkModeEnabled ? .dark : .light)
            let foreground = primary ? UIColor.white : UIColor.label.resolvedColor(with: effectiveTraits)
            let background = primary ? UIColor(red: 21 / 255, green: 101 / 255, blue: 192 / 255, alpha: 1) : UIColor.systemGray5.resolvedColor(with: effectiveTraits)
            configuration.baseForegroundColor = foreground
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.foregroundColor = foreground
                return outgoing
            }
            configuration.background.backgroundColor = background
            configuration.background.backgroundColorTransformer = UIConfigurationColorTransformer { _ in
                background
            }
            configuration.background.strokeColor = primary ? .clear : .separator
            configuration.background.strokeWidth = primary ? 0 : 0.5
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: primary ? 20 : 8, bottom: 10, trailing: primary ? 20 : 8)
            button.configuration = configuration
        }
        return button
    }

    private func presentPicker(source: UIImagePickerController.SourceType) {
        guard !isRecognizing, presentedViewController == nil else {
            return
        }
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            showCameraNotice(allowSettings: false)
            return
        }
        imagePicker.sourceType = source
        imagePicker.mediaTypes = ["public.image"]
        imagePicker.modalPresentationStyle = .fullScreen
        if source == .camera {
            imagePicker.cameraCaptureMode = .photo
        }
        imagePicker.byPresent(self)
    }

    private func requestCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            showCameraNotice(allowSettings: false)
            return
        }
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        /// 已授权，直接打开当前页面的相机。
        case .authorized:
            presentPicker(source: .camera)
        /// 首次请求结束后，只在仍可见的页面呈现。
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                Task { @MainActor [weak self] in
                    guard let self, self.isViewLoaded, self.view.window != nil else {
                        return
                    }
                    if granted {
                        self.presentPicker(source: .camera)
                    } else {
                        self.showCameraNotice(allowSettings: true)
                    }
                }
            }
        /// 用户拒绝或系统限制，保留原图与识别结果。
        case .denied, .restricted:
            showCameraNotice(allowSettings: true)
        /// 新系统未知权限状态也保持可恢复。
        @unknown default:
            showCameraNotice(allowSettings: false)
        }
    }

    private func showCameraNotice(allowSettings: Bool) {
        let alert = UIAlertController(title: "相机不可用".tr,
                                      message: allowSettings ? "请在系统设置中允许相机访问。".tr : "此设备没有可用相机。".tr,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消".tr, style: .cancel))
        if allowSettings {
            alert.addAction(UIAlertAction(title: "打开设置".tr, style: .default) { _ in
                guard let url = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                UIApplication.shared.open(url)
            })
        }
        present(alert, animated: true)
    }

    private func selectImage(_ image: UIImage?) {
        guard JobsOCRSDKAdapter.isAvailable else {
            statusKey = "OCR 核心尚未安装"
            refreshAppearance()
            return
        }
        guard !isRecognizing else {
            return
        }
        guard let image else {
            statusKey = "无法读取所选图片"
            refreshAppearance()
            return
        }
        selectedImage = image
        recognizedText = ""
        diagnostic = ""
        statusKey = "选择图片后开始离线识别"
        imageView.byImage(image)
        refreshAppearance()
    }

    private func recognize() {
        guard JobsOCRSDKAdapter.isAvailable else {
            statusKey = "OCR 核心尚未安装"
            refreshAppearance()
            return
        }
        if isRecognizing {
            cancelRecognition()
            return
        }
        guard let image = selectedImage else {
            statusKey = "无法读取所选图片"
            refreshAppearance()
            return
        }
        requestID = UUID()
        let currentID = requestID
        isRecognizing = true
        recognizedText = ""
        diagnostic = ""
        statusKey = "正在本机识别，请稍候"
        refreshAppearance()
        JobsOCRSDKAdapter.recognize(image: image) { [weak self] result, error in
            guard let self, self.requestID == currentID else {
                return
            }
            self.isRecognizing = false
            if let error {
                self.statusKey = "识别失败，请重试"
                self.diagnostic = error.localizedDescription
            } else {
                self.recognizedText = result?["text"] as? String ?? ""
                self.statusKey = self.recognizedText.isEmpty ? "未发现可识别文字" : "离线识别完成"
                if let elapsed = result?["elapsed_ms"] as? NSNumber {
                    self.diagnostic = String(format: "%.0f ms", elapsed.doubleValue)
                }
            }
            self.refreshAppearance()
        }
    }

    private func cancelRecognition() {
        guard isRecognizing else {
            return
        }
        requestID = UUID()
        JobsOCRSDKAdapter.cancel()
        isRecognizing = false
        statusKey = "已取消识别"
        refreshAppearance()
    }

    private func refreshAppearance() {
        jobsSetupGKNav(title: "Rust OCR 离线识别".tr)
        RootListPreferences.applyThemeChrome(to: self,
                                             backgroundColor: RootListPreferences.pageBackgroundColor)
        sampleButton
            .byTitle("使用内置样例".tr)
            .byEnabled(!isRecognizing)
            .byUpdateConfig()
        photoButton
            .byTitle("选择照片".tr)
            .byEnabled(!isRecognizing)
            .byUpdateConfig()
        cameraButton
            .byTitle("拍照".tr)
            .byEnabled(!isRecognizing)
            .byUpdateConfig()
        recognizeButton
            .byTitle((isRecognizing ? "取消识别" : "开始离线识别").tr)
            .byUpdateConfig()
        copyButton
            .byTitle("复制结果".tr)
            .byEnabled(!recognizedText.isEmpty)
            .byUpdateConfig()
        resultLabel
            .byText("识别结果".tr)
            .byTextColor(RootListPreferences.primaryTextColor)
        statusLabel
            .byText(statusKey.tr + (diagnostic.isEmpty ? "" : "\n" + diagnostic)
                    + "\nRust · " + JobsOCRSDKAdapter.coreVersion())
            .byTextColor(secondaryInk)
        resultView
            .byText(recognizedText)
            .byTextColor(RootListPreferences.primaryTextColor)
            .byBackgroundColor(RootListPreferences.cardBackgroundColor)
        emptyButton
            .byTitle((isRecognizing ? "正在本机识别，请稍候" : "尚无识别结果").tr)
            .bySubTitle("选择样例或照片，点击开始识别；结果仅在本机处理。".tr)
            .byTitleColor(RootListPreferences.primaryTextColor)
            .bySubTitleColor(secondaryInk)
            .byEnabled(!isRecognizing)
            .byVisible(recognizedText.isEmpty)
        view.setNeedsLayout()
    }
}
