//
//  JobsCoreMotionDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
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
import SnapKit

final class JobsCoreMotionDemoVC: BaseVC {
    private enum MotionPose: Equatable {
        case waiting
        case steady
        case left
        case right
        case lift
        case lower
        case spinning
    }

    private typealias AttitudeValue = (roll: Double, pitch: Double, yaw: Double)

    private let motionManager = CMMotionManager.make()
    private lazy var hapticFeedback = UIImpactFeedbackGenerator(style: .light)
    private var referenceAttitude: AttitudeValue?
    private var latestAttitude: AttitudeValue?
    private var smoothedRoll = 0.0
    private var smoothedPitch = 0.0
    private var smoothedYaw = 0.0
    private var smoothedIntensity = 0.0
    private var currentPose = MotionPose.waiting
    private var lastHapticTime: TimeInterval = 0

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
            .byText("握住手机，动一动你的手腕".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 23))
            .byTextColor(JobsCor.label)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var introDetailLabel: UILabel = {
        UILabel()
            .byText("倾斜、抬腕和转身都会得到画面反馈；三轴数字只作为辅助读数。".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.introTitleLabel.snp.bottom).offset(6)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var motionCardView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(24)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.introDetailLabel.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(382)
            }
    }()

    private lazy var stateIconLabel: UILabel = {
        UILabel()
            .byText("👋")
            .byFont(JobsFont.systemFont(ofSize: 32, weight: .regular))
            .byTextAlignment(.center)
            .byAddTo(motionCardView) { make in
                make.top.left.equalToSuperview().offset(18)
                make.size.equalTo(44)
            }
    }()

    private lazy var stateTitleLabel: UILabel = {
        UILabel()
            .byText("正在建立你的中心姿势…".tr)
            .byFont(JobsFont.systemFont(ofSize: 18, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalToSuperview().offset(17)
                make.left.equalTo(self.stateIconLabel.snp.right).offset(10)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var stateDetailLabel: UILabel = {
        UILabel()
            .byText("保持当前握姿一秒，画面会把这里当成原点。".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(2)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.stateTitleLabel.snp.bottom).offset(2)
                make.left.equalTo(self.stateTitleLabel)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var attitudeRingView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.tertiarySystemBackground)
            .byCornerRadius(110)
            .byBorderColor(JobsCor.separator)
            .byBorderWidth(1)
            .byClipsToBounds(YES)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.stateDetailLabel.snp.bottom).offset(12)
                make.centerX.equalToSuperview()
                make.size.equalTo(220)
            }
    }()

    private lazy var horizontalGuideView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.separator)
            .byAddTo(attitudeRingView) { make in
                make.center.equalToSuperview()
                make.width.equalTo(174)
                make.height.equalTo(1)
            }
    }()

    private lazy var verticalGuideView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.separator)
            .byAddTo(attitudeRingView) { make in
                make.center.equalToSuperview()
                make.width.equalTo(1)
                make.height.equalTo(174)
            }
    }()

    private lazy var leftDirectionLabel: UILabel = makeDirectionLabel("左")
        .byAddTo(attitudeRingView) { make in
            make.left.equalToSuperview().offset(9)
            make.centerY.equalToSuperview()
        }

    private lazy var rightDirectionLabel: UILabel = makeDirectionLabel("右")
        .byAddTo(attitudeRingView) { make in
            make.right.equalToSuperview().inset(9)
            make.centerY.equalToSuperview()
        }

    private lazy var topDirectionLabel: UILabel = makeDirectionLabel("抬")
        .byAddTo(attitudeRingView) { make in
            make.top.equalToSuperview().offset(22)
            make.centerX.equalToSuperview()
        }

    private lazy var bottomDirectionLabel: UILabel = makeDirectionLabel("压")
        .byAddTo(attitudeRingView) { make in
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }

    private lazy var phoneView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemBackground)
            .byCornerRadius(21)
            .byBorderColor(JobsCor.systemBlue)
            .byBorderWidth(3)
            .byShadowColor(JobsCor.black)
            .byShadowOpacity(0.18)
            .byShadowRadius(10)
            .byShadowOffset(CGSize(width: 0, height: 6))
            .byAddTo(attitudeRingView) { make in
                make.center.equalToSuperview()
                make.width.equalTo(106)
                make.height.equalTo(154)
            }
    }()

    private lazy var phoneNotchView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.tertiaryLabel)
            .byCornerRadius(2.5)
            .byAddTo(phoneView) { make in
                make.top.equalToSuperview().offset(9)
                make.centerX.equalToSuperview()
                make.width.equalTo(34)
                make.height.equalTo(5)
            }
    }()

    private lazy var avatarImageView: UIImageView = {
        UIImageView()
            .byImage("person.fill".sysImg(pointSize: 50, weight: .semibold))
            .byTintColor(JobsCor.systemBlue)
            .byContentMode(.scaleAspectFit)
            .byAddTo(phoneView) { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-5)
                make.size.equalTo(58)
            }
    }()

    private lazy var avatarCaptionLabel: UILabel = {
        UILabel()
            .byText("这是你".tr)
            .byFont(JobsFont.systemFont(ofSize: 11, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAddTo(phoneView) { [unowned self] make in
                make.top.equalTo(self.avatarImageView.snp.bottom).offset(4)
                make.left.right.equalToSuperview().inset(8)
            }
    }()

    private lazy var balanceDotView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemGreen)
            .byCornerRadius(8)
            .byShadowColor(JobsCor.systemGreen)
            .byShadowOpacity(0.55)
            .byShadowRadius(5)
            .byShadowOffset(.zero)
            .byAddTo(attitudeRingView) { make in
                make.center.equalToSuperview()
                make.size.equalTo(16)
            }
    }()

    private lazy var compassArrowLabel: UILabel = {
        UILabel()
            .byText("▲")
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byTextColor(JobsCor.systemOrange)
            .byTextAlignment(.center)
            .byAddTo(attitudeRingView) { make in
                make.top.equalToSuperview().offset(2)
                make.centerX.equalToSuperview()
                make.size.equalTo(22)
            }
    }()

    private lazy var intensityTitleLabel: UILabel = {
        UILabel()
            .byText("动作强度 0% · 静止".tr)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.attitudeRingView.snp.bottom).offset(14)
                make.left.right.equalToSuperview().inset(18)
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
            .byAddTo(motionCardView) { [unowned self] make in
                make.top.equalTo(self.intensityTitleLabel.snp.bottom).offset(7)
                make.left.right.equalToSuperview().inset(18)
                make.height.equalTo(6)
            }
    }()

    private lazy var rollValueLabel: UILabel = makeMetricValueLabel()
    private lazy var pitchValueLabel: UILabel = makeMetricValueLabel()
    private lazy var yawValueLabel: UILabel = makeMetricValueLabel()

    private lazy var rollMetricView = makeMetricCard(
        title: "横滚 ROLL".tr,
        valueLabel: rollValueLabel,
        color: JobsCor.systemBlue
    )

    private lazy var pitchMetricView = makeMetricCard(
        title: "俯仰 PITCH".tr,
        valueLabel: pitchValueLabel,
        color: JobsCor.systemTeal
    )

    private lazy var yawMetricView = makeMetricCard(
        title: "转向 YAW".tr,
        valueLabel: yawValueLabel,
        color: JobsCor.systemOrange
    )

    private lazy var metricsStackView: UIStackView = {
        UIStackView()
            .byAxis(.horizontal)
            .byAlignment(.fill)
            .byDistribution(.fillEqually)
            .bySpacing(10)
            .byAddArrangedSubviews([rollMetricView, pitchMetricView, yawMetricView])
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.motionCardView.snp.bottom).offset(14)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(82)
            }
    }()

    private lazy var rawDataCardView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(16)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.metricsStackView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(76)
            }
    }()

    private lazy var rawDataTitleLabel: UILabel = {
        UILabel()
            .byText("陀螺仪角速度 · rad/s".tr)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(rawDataCardView) { make in
                make.top.equalToSuperview().offset(12)
                make.left.right.equalToSuperview().inset(14)
            }
    }()

    private lazy var rawDataLabel: UILabel = {
        UILabel()
            .byText("x: --    y: --    z: --")
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 15, weight: .medium))
            .byTextColor(JobsCor.label)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.72)
            .byAddTo(rawDataCardView) { [unowned self] make in
                make.top.equalTo(self.rawDataTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(14)
            }
    }()

    private lazy var recalibrateButton: UIButton = {
        UIButton.sys()
            .byTitle("◎  以当前姿势为中心".tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(14)
            .onTap { [weak self] _ in
                guard let self else { return }
                recalibrate()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.rawDataCardView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(46)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    deinit {
        motionManager.byStopAllUpdates()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "CoreMotion 体感 Demo".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        setupUI()
        hapticFeedback.prepare()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startMotionExperience()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motionManager.byStopAllUpdates()
    }
}

private extension JobsCoreMotionDemoVC {
    func setupUI() {
        [
            scrollView,
            contentView,
            introTitleLabel,
            introDetailLabel,
            motionCardView,
            stateIconLabel,
            stateTitleLabel,
            stateDetailLabel,
            attitudeRingView,
            horizontalGuideView,
            verticalGuideView,
            leftDirectionLabel,
            rightDirectionLabel,
            topDirectionLabel,
            bottomDirectionLabel,
            phoneView,
            phoneNotchView,
            avatarImageView,
            avatarCaptionLabel,
            balanceDotView,
            compassArrowLabel,
            intensityTitleLabel,
            intensityProgressView,
            metricsStackView,
            rawDataCardView,
            rawDataTitleLabel,
            rawDataLabel,
            recalibrateButton
        ].forEach { $0.byVisible(YES) }
    }

    func makeDirectionLabel(_ text: String) -> UILabel {
        UILabel()
            .byText(text.tr)
            .byFont(JobsFont.systemFont(ofSize: 11, weight: .semibold))
            .byTextColor(JobsCor.tertiaryLabel)
            .byTextAlignment(.center)
    }

    func makeMetricValueLabel() -> UILabel {
        UILabel()
            .byText("0.0°")
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 20, weight: .bold))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.72)
    }

    func makeMetricCard(title: String, valueLabel: UILabel, color: UIColor) -> UIView {
        let cardView = UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(16)
            .byBorderColor(color.withAlphaComponent(0.28))
            .byBorderWidth(1)
        UILabel()
            .byText(title)
            .byFont(JobsFont.systemFont(ofSize: 10, weight: .semibold))
            .byTextColor(color)
            .byTextAlignment(.center)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.75)
            .byAddTo(cardView) { make in
                make.top.equalToSuperview().offset(12)
                make.left.right.equalToSuperview().inset(5)
            }
        valueLabel.byAddTo(cardView) { make in
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(13)
        };return cardView
    }
}

private extension JobsCoreMotionDemoVC {
    func startMotionExperience() {
        guard !motionManager.isDeviceMotionActive else { return }
        guard motionManager.isDeviceMotionAvailable else {
            showUnavailableState("当前设备不支持融合姿态数据，请使用带陀螺仪的真机运行。".tr)
            return
        }
        referenceAttitude = nil
        latestAttitude = nil
        smoothedRoll = 0
        smoothedPitch = 0
        smoothedYaw = 0
        smoothedIntensity = 0
        currentPose = .waiting
        recalibrateButton.byEnabled(YES)
        motionManager
            .byDeviceMotionUpdateInterval(1.0 / 30.0)
            .byStartDeviceMotionUpdates(using: .xArbitraryZVertical, to: .main) { [weak self] data, error in
                guard let self else { return }
                if let error {
                    showUnavailableState(error.localizedDescription)
                    return
                }
                guard let data else { return }
                update(with: data)
            }
    }

    func update(with motion: CMDeviceMotion) {
        let attitude = AttitudeValue(
            roll: motion.attitude.roll,
            pitch: motion.attitude.pitch,
            yaw: motion.attitude.yaw
        )
        latestAttitude = attitude
        if referenceAttitude == nil {
            referenceAttitude = attitude
        }
        guard let referenceAttitude else { return }
        let roll = normalizedAngle(attitude.roll - referenceAttitude.roll)
        let pitch = normalizedAngle(attitude.pitch - referenceAttitude.pitch)
        let yaw = normalizedAngle(attitude.yaw - referenceAttitude.yaw)
        smoothedRoll = smoothedRoll * 0.82 + roll * 0.18
        smoothedPitch = smoothedPitch * 0.82 + pitch * 0.18
        smoothedYaw = smoothedYaw * 0.82 + yaw * 0.18

        let rate = motion.rotationRate
        let angularSpeed = sqrt(rate.x * rate.x + rate.y * rate.y + rate.z * rate.z)
        let intensity = min(1.0, angularSpeed / 3.6)
        smoothedIntensity = smoothedIntensity * 0.78 + intensity * 0.22

        renderAttitude()
        renderPose(pose(for: smoothedRoll, pitch: smoothedPitch, intensity: smoothedIntensity))
        renderValues(rotationRate: rate)
    }

    func renderAttitude() {
        let visualRoll = clamped(smoothedRoll, limit: 0.72)
        let visualPitch = clamped(smoothedPitch, limit: 0.72)
        let transform = CATransform3D.jobs()
            .byPerspective(d: 520)
            .byRotateX(CGFloat(-visualPitch * 0.58))
            .byRotateY(CGFloat(visualRoll * 0.58))
            .byRotateZ(CGFloat(visualRoll * 0.16))
        phoneView.byTransform3D(transform)
        balanceDotView.byTransform(
            CGAffineTransform(
                translationX: CGFloat(visualRoll / 0.72 * 76),
                y: CGFloat(visualPitch / 0.72 * 76)
            )
        )
        compassArrowLabel.byTransform(CGAffineTransform(rotationAngle: CGFloat(smoothedYaw)))
    }

    private func renderPose(_ pose: MotionPose) {
        let presentation = presentation(for: pose)
        stateIconLabel.byText(presentation.icon)
        stateTitleLabel.byText(presentation.title)
        stateDetailLabel.byText(presentation.detail)
        stateTitleLabel.byTextColor(presentation.color)
        avatarImageView.byTintColor(presentation.color)
        phoneView.byBorderColor(presentation.color)
        balanceDotView.byBackgroundColor(presentation.color)
        balanceDotView.byShadowColor(presentation.color)
        intensityProgressView.byProgressTintColor(presentation.color)

        let percent = Int((smoothedIntensity * 100).rounded())
        intensityTitleLabel.byText(
            String(format: "动作强度 %d%% · %@".tr, percent, intensityDescription(smoothedIntensity))
        )
        intensityProgressView.byProgress(Float(smoothedIntensity))
        triggerHapticIfNeeded(for: pose)
    }

    func renderValues(rotationRate: CMRotationRate) {
        rollValueLabel.byText(String(format: "%+.1f°", degrees(smoothedRoll)))
        pitchValueLabel.byText(String(format: "%+.1f°", degrees(smoothedPitch)))
        yawValueLabel.byText(String(format: "%+.1f°", degrees(smoothedYaw)))
        rawDataLabel.byText(
            String(
                format: "x: %+.3f    y: %+.3f    z: %+.3f",
                rotationRate.x,
                rotationRate.y,
                rotationRate.z
            )
        )
    }

    func recalibrate() {
        guard let latestAttitude else {
            stateDetailLabel.byText("还没有收到姿态数据，请稍候再试。".tr)
            return
        }
        referenceAttitude = latestAttitude
        smoothedRoll = 0
        smoothedPitch = 0
        smoothedYaw = 0
        currentPose = .waiting
        UIView.jobsAnimateWithSpring(
            0.45,
            dampingRatio: 0.72,
            initialVelocity: 0.4,
            animations: { [weak self] in
                guard let self else { return }
                phoneView.byTransform3D(CATransform3D.jobs())
                balanceDotView.byTransform(.identity)
                compassArrowLabel.byTransform(.identity)
            }
        )
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        stateIconLabel.byText("🎯")
        stateTitleLabel.byText("中心姿势已更新".tr)
        stateDetailLabel.byText("现在从这个握姿继续倾斜或转动手机。".tr)
    }

    func showUnavailableState(_ message: String) {
        motionManager.byStopAllUpdates()
        currentPose = .waiting
        stateIconLabel.byText("⚠️")
        stateTitleLabel.byText("暂时无法参与体感互动".tr)
        stateTitleLabel.byTextColor(JobsCor.systemOrange)
        stateDetailLabel.byText(message)
        rawDataLabel.byText("x: --    y: --    z: --")
        intensityTitleLabel.byText("动作强度 --".tr)
        intensityProgressView.byProgress(0)
        recalibrateButton.byEnabled(NO)
    }
}

private extension JobsCoreMotionDemoVC {
    private func pose(for roll: Double, pitch: Double, intensity: Double) -> MotionPose {
        if intensity > 0.58 { return .spinning }
        if abs(roll) < 0.08, abs(pitch) < 0.08 { return .steady }
        if abs(roll) >= abs(pitch) { return roll < 0 ? .left : .right };return pitch < 0 ? .lift : .lower
    }

    private func presentation(for pose: MotionPose) -> (icon: String, title: String, detail: String, color: UIColor) {
        switch pose {
        case .waiting:
            return ("👋", "正在感知你的动作…".tr, "保持当前握姿，马上就能开始互动。".tr, JobsCor.systemBlue)
        case .steady:
            return ("🧘", "稳住了".tr, "手机回到中心圆，试试向任意方向压腕。".tr, JobsCor.systemGreen)
        case .left:
            return (
                "🙆",
                "正在向左倾斜".tr,
                String(format: "横滚 %.0f° · 让小圆点回中心即可归位".tr, abs(degrees(smoothedRoll))),
                JobsCor.systemBlue
            )
        case .right:
            return (
                "🙆",
                "正在向右倾斜".tr,
                String(format: "横滚 %.0f° · 画面正在跟随你的手腕".tr, abs(degrees(smoothedRoll))),
                JobsCor.systemTeal
            )
        case .lift:
            return (
                "🙋",
                "手机上沿抬起来了".tr,
                String(format: "俯仰 %.0f° · 继续抬腕看看空间变化".tr, abs(degrees(smoothedPitch))),
                JobsCor.systemPurple
            )
        case .lower:
            return (
                "🤳",
                "手机上沿压下去了".tr,
                String(format: "俯仰 %.0f° · 放松手腕即可回正".tr, abs(degrees(smoothedPitch))),
                JobsCor.systemOrange
            )
        case .spinning:
            return ("🏃", "检测到快速转动".tr, "动作越快，下面的强度条越长。".tr, JobsCor.systemPink)
        }
    }

    func intensityDescription(_ intensity: Double) -> String {
        switch intensity {
        case ..<0.08:
            return "静止".tr
        case ..<0.28:
            return "轻柔".tr
        case ..<0.58:
            return "明显".tr
        default:
            return "强烈".tr
        }
    }

    private func triggerHapticIfNeeded(for pose: MotionPose) {
        guard pose != currentPose else { return }
        currentPose = pose
        guard pose != .waiting else { return }
        let now = ProcessInfo.processInfo.systemUptime
        guard now - lastHapticTime > 0.75 else { return }
        lastHapticTime = now
        hapticFeedback.impactOccurred(intensity: pose == .spinning ? 0.9 : 0.45)
        hapticFeedback.prepare()
    }

    func normalizedAngle(_ angle: Double) -> Double {
        atan2(sin(angle), cos(angle))
    }

    func clamped(_ value: Double, limit: Double) -> Double {
        min(max(value, -limit), limit)
    }

    func degrees(_ radians: Double) -> Double {
        radians * 180.0 / .pi
    }
}
