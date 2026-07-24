//
//  JobsMotionAppIconDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import CoreMotion
import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import Photos
import PhotosUI
import SnapKit

final class JobsMotionAppIconDemoVC: BaseVC {
    private enum IconChangeTrigger {
        case manual
        case shake
    }

    private static let shakeFeatureEnabledKey = "com.jobs.demo.motionAppIcon.shakeFeatureEnabled"
    private static let shakeThreshold = 1.18
    private static let shakeCooldown: TimeInterval = 2.4
    private let iconOptions = JobsMotionAppIconOption.allCases
    private let photoStore = JobsCopiedAppIconPhotoStore.shared
    private let motionManager = CMMotionManager.make()
    private lazy var hapticFeedback = UINotificationFeedbackGenerator()
    private var isPageVisible = false
    private var iconChangeInFlight = false
    private var hasGravitySample = false
    private var gravityX = 0.0
    private var gravityY = 0.0
    private var gravityZ = 0.0
    private var smoothedShakeIntensity = 0.0
    private var lastShakeTime: TimeInterval = 0

    private var isShakeFeatureEnabled: Bool {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: Self.shakeFeatureEnabledKey) != nil else { return true };return defaults.bool(
            forKey: Self.shakeFeatureEnabledKey
        )
    }

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byShowsVerticalScrollIndicator(NO)
            .byAlwaysBounceVertical(YES)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(self.scrollView.contentLayoutGuide)
                make.width.equalTo(self.scrollView.frameLayoutGuide)
            }
    }()

    private lazy var introTitleLabel: UILabel = {
        UILabel()
            .byText("摇一摇，切换 App 图标".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 23))
            .byTextColor(JobsCor.label)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var introDetailLabel: UILabel = {
        UILabel()
            .byText("Demo 只读取加速度计：高通滤波去掉重力后识别手摇动作。每次有效摇动只请求切换一次，最终仍需确认 iOS 系统弹窗。".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.introTitleLabel.snp.bottom).offset(6)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var featureCardView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(18)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.introDetailLabel.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(96)
            }
    }()

    private lazy var featureTitleLabel: UILabel = {
        UILabel()
            .byText("启用手摇自动切换".tr)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(featureCardView) { [unowned self] make in
                make.top.equalToSuperview().offset(17)
                make.left.equalToSuperview().offset(16)
                make.right.lessThanOrEqualTo(self.featureSwitchContainerView.snp.left).offset(-8)
            }
    }()

    private lazy var featureSwitchContainerView: UIView = {
        UIView()
            .byAddTo(featureCardView) { make in
                make.top.bottom.right.equalToSuperview()
                make.width.equalTo(88)
            }
    }()

    private lazy var featureDetailLabel: UILabel = {
        UILabel()
            .byText("关闭后停止加速度计；下方仍可手动选图标。".tr)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(2)
            .byAddTo(featureCardView) { [unowned self] make in
                make.top.equalTo(self.featureTitleLabel.snp.bottom).offset(5)
                make.left.equalTo(self.featureTitleLabel)
                make.right.lessThanOrEqualTo(self.featureSwitchContainerView.snp.left).offset(-8)
            }
    }()

    private lazy var featureSwitch: UISwitch = {
        UISwitch()
            .byOn(isShakeFeatureEnabled)
            .byOnTintColor(JobsCor.systemGreen)
            .onJobsChange { [weak self] (toggle: UISwitch) in
                self?.shakeFeatureChanged(toggle.isOn)
            }
            .byAddTo(featureSwitchContainerView) { make in
                make.center.equalToSuperview()
            }
    }()

    private lazy var motionCardView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(18)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.featureCardView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(180)
            }
    }()

    private lazy var motionStateIconLabel: UILabel = {
        UILabel()
            .byText("👋")
            .byFont(JobsFont.systemFont(ofSize: 31))
            .byTextAlignment(.center)
            .byAddTo(motionCardView) { make in
                make.top.left.equalToSuperview().offset(16)
                make.size.equalTo(42)
            }
    }()

    private lazy var motionStateTitleLabel: UILabel = {
        UILabel()
            .byText("等待加速度计…".tr)
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalToSuperview().offset(15)
                make.left.equalTo(self.motionStateIconLabel.snp.right).offset(10)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var motionStateDetailLabel: UILabel = {
        UILabel()
            .byText("握稳手机后快速左右摇动。".tr)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(2)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.motionStateTitleLabel.snp.bottom).offset(3)
                make.left.equalTo(self.motionStateTitleLabel)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var intensityProgressView: UIProgressView = {
        UIProgressView()
            .byProgressViewStyle(.default)
            .byProgress(0)
            .byProgressTintColor(JobsCor.systemGreen)
            .byTrackTintColor(JobsCor.systemGray4)
            .byCornerRadius(3)
            .byClipsToBounds(YES)
            .byAddTo(motionCardView) { make in
                make.top.equalToSuperview().offset(82)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(6)
            }
    }()

    private lazy var accelerationLabel: UILabel = {
        UILabel()
            .byText("加速度 x: --   y: --   z: --".tr)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.72)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.intensityProgressView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var currentIconLabel: UILabel = {
        UILabel()
            .byText("当前图标：读取中…".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.accelerationLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var iconStatusLabel: UILabel = {
        UILabel()
            .byText("手摇功能已就绪。".tr)
            .byFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(2)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.currentIconLabel.snp.bottom).offset(4)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var iconSelectorTitleLabel: UILabel = {
        UILabel()
            .byText("手动选择预置图标".tr)
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.motionCardView.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var iconSelectorDetailLabel: UILabel = {
        UILabel()
            .byText("点选也会调用公开 API，并弹出 iOS 的切换确认。备用素材均来自 iconfont。".tr)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.iconSelectorTitleLabel.snp.bottom).offset(4)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var iconCollectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 118, height: 138)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()

    private lazy var iconCollectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: iconCollectionLayout)
            .byBackgroundColor(JobsCor.clear)
            .byShowsHorizontalScrollIndicator(NO)
            .byAlwaysBounceHorizontal(YES)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(JobsMotionAppIconCell.self)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.iconSelectorDetailLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(138)
            }
    }()

    private lazy var photoCardView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(18)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.iconCollectionView.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(382)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    private lazy var photoTitleLabel: UILabel = {
        UILabel()
            .byText("从设备相册选择照片".tr)
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(photoCardView) { [unowned self] make in
                make.top.equalToSuperview().offset(16)
                make.left.equalToSuperview().offset(16)
                make.right.lessThanOrEqualTo(self.photoUsageHelpButton.snp.left).offset(-8)
            }
    }()

    private lazy var photoUsageHelpButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.plain()
                    .byBaseForegroundColor(JobsCor.systemBlue)
                    .byContentInsets(.zero)
            )
            .byImage("questionmark.circle".sysImg)
            .byPreferredSymbolConfiguration(
                UIImage.SymbolConfiguration(pointSize: 19, weight: .semibold)
            )
            .onTap { [weak self] _ in
                self?.showPhotoUsageHelp()
            }
            .byAddTo(photoCardView) { make in
                make.top.equalToSuperview().offset(6)
                make.right.equalToSuperview().inset(8)
                make.size.equalTo(44)
            }
    }()

    private lazy var photoPreviewImageView: UIImageView = {
        UIImageView()
            .byBackgroundColor(JobsCor.tertiarySystemBackground)
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byCornerRadius(26)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
            .byAddTo(photoCardView) { make in
                make.top.equalToSuperview().offset(55)
                make.left.equalToSuperview().offset(16)
                make.size.equalTo(118)
            }
    }()

    private lazy var photoPlaceholderLabel: UILabel = {
        UILabel()
            .byText("相册\n预览".tr)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.tertiaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(2)
            .byAddTo(photoPreviewImageView) { make in
                make.edges.equalToSuperview().inset(10)
            }
    }()

    private lazy var photoDetailLabel: UILabel = {
        UILabel()
            .byText("选择后会居中裁成方形副本；过大时缩到 1024 × 1024，并保存在 App 私有目录。".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(photoCardView) { [unowned self] make in
                make.top.equalTo(self.photoPreviewImageView)
                make.left.equalTo(self.photoPreviewImageView.snp.right).offset(14)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var selectPhotoButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.filled()
                    .byTitle("选择并复制相册照片".tr)
                    .byCornerStyle(.medium)
                    .byBaseBackgroundColor(JobsCor.systemBlue)
                    .byContentInsets(NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                self?.presentPhotoPicker()
            }
            .byAddTo(photoCardView) { make in
                make.top.equalToSuperview().offset(190)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(48)
            }
    }()

    private lazy var viewCopiedPhotosButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.tinted()
                    .byTitle("查看已复制照片".tr)
                    .byCornerStyle(.medium)
                    .byBaseForegroundColor(JobsCor.systemBlue)
                    .byBaseBackgroundColor(JobsCor.systemBlue)
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                self?.presentCopiedPhotos()
            }
            .byAddTo(photoCardView) { [unowned self] make in
                make.top.equalTo(self.selectPhotoButton.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(44)
            }
    }()

    private lazy var photoLimitationLabel: UILabel = {
        UILabel()
            .byText("⚠️ iOS 不能把运行时相册照片直接设为桌面 AppIcon；点右上角“？”查看开发期接入步骤。".tr)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
            .byTextColor(JobsCor.systemOrange)
            .byNumberOfLines(0)
            .byAddTo(photoCardView) { [unowned self] make in
                make.top.equalTo(self.viewCopiedPhotosButton.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var photoPickerViewController: PHPickerViewController = {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .images
        configuration.selectionLimit = 1
        return PHPickerViewController(configuration: configuration)
            .byDelegate(self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "动作切换 App 图标".tr)
        setupSubviews()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        refreshCurrentIcon(animated: false)
        refreshSelectedCopiedPhoto()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isPageVisible = true
        refreshCurrentIcon(animated: false)
        refreshSelectedCopiedPhoto()
        startAccelerometerIfNeeded()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isPageVisible = false
        stopAccelerometer()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        motionManager.stopAccelerometerUpdates()
    }
}

private extension JobsMotionAppIconDemoVC {
    func setupSubviews() {
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        introTitleLabel.byVisible(YES)
        introDetailLabel.byVisible(YES)
        featureCardView.byVisible(YES)
        featureTitleLabel.byVisible(YES)
        featureDetailLabel.byVisible(YES)
        featureSwitchContainerView.byVisible(YES)
        featureSwitch.byVisible(YES)
        motionCardView.byVisible(YES)
        motionStateIconLabel.byVisible(YES)
        motionStateTitleLabel.byVisible(YES)
        motionStateDetailLabel.byVisible(YES)
        intensityProgressView.byVisible(YES)
        accelerationLabel.byVisible(YES)
        currentIconLabel.byVisible(YES)
        iconStatusLabel.byVisible(YES)
        iconSelectorTitleLabel.byVisible(YES)
        iconSelectorDetailLabel.byVisible(YES)
        iconCollectionView.byVisible(YES)
        photoCardView.byVisible(YES)
        photoTitleLabel.byVisible(YES)
        photoUsageHelpButton.byVisible(YES)
        photoPreviewImageView.byVisible(YES)
        photoPlaceholderLabel.byVisible(YES)
        photoDetailLabel.byVisible(YES)
        selectPhotoButton.byVisible(YES)
        viewCopiedPhotosButton.byVisible(YES)
        photoLimitationLabel.byVisible(YES)
    }

    func shakeFeatureChanged(_ enabled: Bool) {
        UserDefaults.standard.set(enabled, forKey: Self.shakeFeatureEnabledKey)
        if enabled {
            iconStatusLabel
                .byText("手摇功能已开启；握稳后快速左右摇动。".tr)
                .byTextColor(JobsCor.secondaryLabel)
            startAccelerometerIfNeeded()
        } else {
            stopAccelerometer()
            motionStateIconLabel.byText("⏸")
            motionStateTitleLabel.byText("手摇功能已关闭".tr)
            motionStateDetailLabel.byText("加速度计已停止，仍可手动选择图标。".tr)
            iconStatusLabel
                .byText("已停止读取加速度计。".tr)
                .byTextColor(JobsCor.secondaryLabel)
        }
    }

    func startAccelerometerIfNeeded() {
        guard isPageVisible,
              featureSwitch.isOn,
              UIApplication.shared.applicationState == .active,
              !iconChangeInFlight else { return }
        guard motionManager.isAccelerometerAvailable else {
            motionStateIconLabel.byText("⚠️")
            motionStateTitleLabel.byText("当前设备没有可用加速度计".tr)
            motionStateDetailLabel.byText("请在真机上体验手摇切换。".tr)
            return
        }
        guard !motionManager.isAccelerometerActive else { return }
        hasGravitySample = false
        smoothedShakeIntensity = 0
        motionManager
            .byAccelerometerUpdateInterval(1.0 / 50.0)
            .byStartAccelerometerUpdates(to: .main) { [weak self] data, error in
                guard let self else { return }
                if let error {
                    self.motionStateIconLabel.byText("⚠️")
                    self.motionStateTitleLabel.byText("加速度计读取失败".tr)
                    self.motionStateDetailLabel.byText(error.localizedDescription)
                    return
                }
                guard let acceleration = data?.acceleration else { return }
                self.handleAcceleration(acceleration)
            }
        motionStateIconLabel.byText("👋")
        motionStateTitleLabel.byText("手摇监听中".tr)
        motionStateDetailLabel.byText("当前只使用加速度计，不依赖陀螺仪。".tr)
    }

    func stopAccelerometer() {
        motionManager.byStopAccelerometerUpdates()
        intensityProgressView.byProgress(0, animated: true)
        smoothedShakeIntensity = 0
        hasGravitySample = false
    }

    func handleAcceleration(_ acceleration: CMAcceleration) {
        accelerationLabel.byText(
            String(
                format: "加速度 x: %+.2f   y: %+.2f   z: %+.2f",
                acceleration.x,
                acceleration.y,
                acceleration.z
            )
        )
        guard hasGravitySample else {
            gravityX = acceleration.x
            gravityY = acceleration.y
            gravityZ = acceleration.z
            hasGravitySample = true
            return
        }

        let gravityLearningRate = 0.14
        gravityX = gravityX * (1 - gravityLearningRate) + acceleration.x * gravityLearningRate
        gravityY = gravityY * (1 - gravityLearningRate) + acceleration.y * gravityLearningRate
        gravityZ = gravityZ * (1 - gravityLearningRate) + acceleration.z * gravityLearningRate
        let userX = acceleration.x - gravityX
        let userY = acceleration.y - gravityY
        let userZ = acceleration.z - gravityZ
        let magnitude = sqrt(userX * userX + userY * userY + userZ * userZ)
        let normalizedIntensity = min(magnitude / 1.65, 1)
        smoothedShakeIntensity = smoothedShakeIntensity * 0.72 + normalizedIntensity * 0.28
        intensityProgressView.byProgress(Float(smoothedShakeIntensity), animated: true)

        let now = ProcessInfo.processInfo.systemUptime
        guard magnitude >= Self.shakeThreshold,
              now - lastShakeTime >= Self.shakeCooldown,
              !iconChangeInFlight else { return }
        lastShakeTime = now
        motionStateIconLabel.byText("📳")
        motionStateTitleLabel.byText("检测到一次有效手摇".tr)
        motionStateDetailLabel.byText("准备切换到下一套预置 AppIcon。".tr)
        hapticFeedback.notificationOccurred(.success)
        let currentOption = JobsMotionAppIconOption.option(
            matching: UIApplication.shared.jobsAlternateIconName
        )
        requestIconChange(to: currentOption.next(), trigger: .shake)
    }

    private func requestIconChange(to option: JobsMotionAppIconOption,
                                   trigger: IconChangeTrigger) {
        let application = UIApplication.shared
        guard application.jobsSupportsAlternateIcons else {
            iconStatusLabel
                .byText("当前系统或运行环境不支持备用 AppIcon。".tr)
                .byTextColor(JobsCor.systemRed)
            return
        }
        let currentOption = JobsMotionAppIconOption.option(matching: application.jobsAlternateIconName)
        guard currentOption != option else {
            iconStatusLabel
                .byText("“\(option.title)”已经是当前图标。".tr)
                .byTextColor(JobsCor.secondaryLabel)
            return
        }
        guard !iconChangeInFlight else { return }
        iconChangeInFlight = true
        stopAccelerometer()
        let triggerText: String
        switch trigger {
        /// 用户点选预置图标
        case .manual:
            triggerText = "手动选择"
        /// 加速度计识别到有效手摇
        case .shake:
            triggerText = "手摇触发"
        }
        iconStatusLabel
            .byText("\(triggerText)：请求切换为“\(option.title)”，请确认系统弹窗。".tr)
            .byTextColor(JobsCor.systemBlue)
        application.byAlternateIconName(option.alternateIconName) { [weak self] error in
            DispatchQueue.main.async {
                guard let self else { return }
                self.iconChangeInFlight = false
                if let error {
                    self.iconStatusLabel
                        .byText("切换失败：\(error.localizedDescription)".tr)
                        .byTextColor(JobsCor.systemRed)
                    self.hapticFeedback.notificationOccurred(.error)
                } else {
                    self.iconStatusLabel
                        .byText("已切换为“\(option.title)”。".tr)
                        .byTextColor(JobsCor.systemGreen)
                    self.hapticFeedback.notificationOccurred(.success)
                }
                self.refreshCurrentIcon(animated: true)
                self.startAccelerometerIfNeeded()
            }
        }
    }

    func refreshCurrentIcon(animated: Bool) {
        let currentOption = JobsMotionAppIconOption.option(
            matching: UIApplication.shared.jobsAlternateIconName
        )
        currentIconLabel.byText("当前图标：\(currentOption.title)".tr)
        iconCollectionView.reloadData()
        guard let index = iconOptions.firstIndex(of: currentOption) else { return }
        iconCollectionView.scrollToItem(
            at: IndexPath(item: index, section: 0),
            at: .centeredHorizontally,
            animated: animated
        )
    }

    func presentPhotoPicker() {
        present(photoPickerViewController, animated: true)
    }

    func presentCopiedPhotos() {
        let photosViewController = JobsCopiedAppIconPhotosVC()
        photosViewController.onSelectionChanged = { [weak self] _ in
            self?.refreshSelectedCopiedPhoto()
        }
        if let navigationController {
            navigationController.pushViewControllerByAnimated(photosViewController)
        } else {
            photosViewController.byPresent(self)
        }
    }

    func showPhotoUsageHelp() {
        UIAlertController
            .makeAlert(
                "如何把相册照片用于桌面图标？".tr,
                """
                iOS 的公开 API 只能切换随 App 安装包预置、并在 Asset Catalog / Info.plist 中声明的 AppIcon，不能把运行时从相册读取的任意照片直接设为桌面图标。

                要使用这张照片：
                1. 将原图裁成无透明通道的 1024 × 1024 图片；
                2. 在 Resources/AppIcons 中选一个备用 .icon，用照片替换其 Assets/Front.png；
                3. 保持备用图标名称与 Alternate App Icons / CFBundleAlternateIcons 声明一致；
                4. 重新编译安装，再从上方预置图标中切换。

                本页“复制”只负责裁剪、预览和管理照片副本，不会修改桌面 AppIcon。
                """.tr
            )
            .byAddOK()
            .byPresent(self)
    }

    func refreshSelectedCopiedPhoto() {
        viewCopiedPhotosButton.byTitle("查看已复制照片（\(photoStore.photos.count)）".tr)
        guard let photo = photoStore.selectedPhoto,
              let image = photoStore.image(for: photo) else {
            photoPreviewImageView.byImage(nil)
            photoPlaceholderLabel.byVisible(YES)
            photoDetailLabel.byText(
                "选择后会居中裁成方形副本；过大时缩到 1024 × 1024，并保存在 App 私有目录。".tr
            )
            photoLimitationLabel
                .byText("⚠️ iOS 不能把运行时相册照片直接设为桌面 AppIcon；点右上角“？”查看开发期接入步骤。".tr)
                .byTextColor(JobsCor.systemOrange)
            return
        }
        photoPreviewImageView.byImage(image)
        photoPlaceholderLabel.byVisible(NO)
        photoDetailLabel.byText(
            "当前演示照片：\(photo.pixelWidth) × \(photo.pixelHeight)。副本已保存在 App 私有目录。".tr
        )
        photoLimitationLabel
            .byText("当前照片已用于 Demo 预览；桌面 AppIcon 不会改变。点右上角“？”查看如何打包成预置图标。".tr)
            .byTextColor(JobsCor.systemGreen)
    }

    @objc func applicationDidBecomeActive() {
        guard isPageVisible else { return }
        refreshCurrentIcon(animated: false)
        startAccelerometerIfNeeded()
    }
}

extension JobsMotionAppIconDemoVC: UICollectionViewDataSource,
                                      UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        iconOptions.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentOption = JobsMotionAppIconOption.option(
            matching: UIApplication.shared.jobsAlternateIconName
        )
        return collectionView
            .byDequeueCell(JobsMotionAppIconCell.self, for: indexPath)
            .byOption(iconOptions[indexPath.item], isCurrent: iconOptions[indexPath.item] == currentOption)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard iconOptions.indices.contains(indexPath.item) else { return }
        requestIconChange(to: iconOptions[indexPath.item], trigger: .manual)
    }
}

extension JobsMotionAppIconDemoVC: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController,
                didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let provider = results.first?.itemProvider else { return }
        guard provider.canLoadObject(ofClass: UIImage.self) else {
            photoLimitationLabel
                .byText("无法读取所选照片，请换一张图片重试。".tr)
                .byTextColor(JobsCor.systemRed)
            return
        }
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            DispatchQueue.main.async {
                guard let self else { return }
                if let image = object as? UIImage {
                    do {
                        try self.photoStore.copy(image)
                        self.refreshSelectedCopiedPhoto()
                    } catch {
                        self.photoLimitationLabel
                            .byText("照片复制失败：\(error.localizedDescription)".tr)
                            .byTextColor(JobsCor.systemRed)
                    }
                } else {
                    self.photoLimitationLabel
                        .byText("照片读取失败：\(error?.localizedDescription ?? "未知错误")".tr)
                        .byTextColor(JobsCor.systemRed)
                }
            }
        }
    }
}
