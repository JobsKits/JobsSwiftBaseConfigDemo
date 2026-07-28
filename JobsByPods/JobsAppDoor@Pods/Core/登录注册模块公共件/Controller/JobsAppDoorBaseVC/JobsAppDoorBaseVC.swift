//
//  JobsAppDoorBaseVC.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftCountryCodeCtrl
import JobsSwiftDSL
import SnapKit

open class JobsAppDoorBaseVC: BaseVC {
    public let configuration: JobsAppDoorConfig
    public var submitHandler: ((JobsAppDoorMode, JobsAppDoorFormValues) -> Void)?
    public var homeHandler: (() -> Void)?
    public var customerServiceHandler: (() -> Void)?
    public var verificationCodeHandler: ((JobsAppDoorFormValues) -> Void)?

    private var keyboardObservers: [NSObjectProtocol] = []
    private var volumePanelShowing = false

    final lazy var backgroundView: JobsAppDoorBackgroundView = {
        JobsAppDoorBackgroundView()
            .byAddTo(view) { make in
                make.edges.equalToSuperview()
            }
    }()

    final lazy var logoView: JobsAppDoorLogoView = {
        JobsAppDoorLogoView()
            .byAddTo(view)
    }()

    final lazy var customerServiceButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                title: "\(JobsAppDoorResource.text("在线客服"))\n\(JobsAppDoorResource.text("7×24小时"))",
                titleColor: JobsAppDoorPalette.gold,
                font: JobsFont.systemFont(ofSize: 10, weight: .medium),
                backgroundColor: JobsAppDoorPalette.cardBackground,
                cornerRadius: 19,
                borderColor: JobsAppDoorPalette.gold,
                borderWidth: 2
            )
            .byImage(JobsAppDoorResource.customerServiceIconImage(), for: .normal)
            .byImagePlacement(.left, padding: 7)
            .byTitleAlignment(.center)
            .byNumberOfLines(2)
            .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
            .onTap { [weak self] _ in
                self?.customerServiceHandler?()
            }
            .byAddTo(view)
    }()

    final lazy var volumeButton: UIButton = {
        UIButton.sys()
            .jobsAppDoorAppearance(
                titleColor: JobsAppDoorPalette.gold,
                backgroundColor: JobsAppDoorPalette.cardBackground,
                cornerRadius: 18,
                borderColor: JobsAppDoorPalette.gold,
                borderWidth: 1
            )
            .byImage(
                JobsAppDoorResource.image(named: "AppDoorVolume")
                    ?? UIImage(systemName: "speaker.wave.2.fill"),
                for: .normal
            )
            .byTintColor(JobsAppDoorPalette.gold)
            .onTap { [weak self] _ in
                self?.toggleVolumePanel()
            }
            .byAddTo(view) { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(12)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(14)
                make.size.equalTo(CGSize(width: 36, height: 36))
            }
    }()

    final lazy var volumePanelView: UIView = {
        UIView()
            .byBackgroundColor(JobsAppDoorPalette.cardBackground.withAlphaComponent(0.92))
            .byCornerRadius(14)
            .byClipsToBounds(true)
            .byBorderColor(JobsAppDoorPalette.gold)
            .byBorderWidth(1)
            .byAlpha(0)
            .byHidden(true)
            .byTransform(CGAffineTransform(scaleX: 0.88, y: 0.88))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(volumeButton.snp.bottom).offset(8)
                make.centerX.equalTo(volumeButton)
                make.size.equalTo(CGSize(width: 52, height: 188))
            }
    }()

    final lazy var volumePercentLabel: UILabel = {
        UILabel()
            .byTextColor(JobsAppDoorPalette.gold)
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 10, weight: .medium))
            .byAdjustsFontSizeToFitWidth(true)
            .byMinimumScaleFactor(0.7)
            .byAddTo(volumePanelView) { make in
                make.top.equalToSuperview().offset(8)
                make.left.right.equalToSuperview()
                make.height.equalTo(20)
            }
    }()

    final lazy var volumeSlider: UISlider = {
        UISlider()
            .byMinimumValue(0)
            .byMaximumValue(1)
            .byValue(backgroundView.currentVolume)
            .byMinimumTrackTintColor(JobsAppDoorPalette.gold)
            .byMaximumTrackTintColor(JobsCor.white.withAlphaComponent(0.28))
            .byThumbTintColor(JobsAppDoorPalette.gold)
            .byTransform(CGAffineTransform(rotationAngle: -.pi / 2))
            .onJobsChange { [weak self] (slider: UISlider) in
                self?.applyVolume(slider.value)
            }
            .byAddTo(volumePanelView) { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(10)
                make.width.equalTo(134)
                make.height.equalTo(28)
            }
    }()

    public init(configuration: JobsAppDoorConfig = .defaultConfig) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        keyboardObservers.forEach(NotificationCenter.default.removeObserver)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        backgroundView.configure(configuration)
        backgroundView.byVisible(true)
        volumeButton.byHidden(configuration.backgroundType != .video)
        observeKeyboard()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        byGKNavBarHidden(true)
        jobsForceHideSystemNavBar(true)
        backgroundView.play()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        byGKNavBarHidden(true)
        jobsForceHideSystemNavBar(true)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        jobsForceHideSystemNavBar(false)
        setVolumePanelVisible(false, animated: false)
        backgroundView.pause()
    }

    func handleKeyboardOffset(_ offset: CGFloat, keyboardVisible: Bool) { }

    final func openCountryCodePicker(for inputView: JobsAppDoorInputView) {
        view.endEditing(true)
        let controller = JobsSwiftCountryCodeCtrl()
        controller.countrySelectionHandler = { [weak inputView] country in
            inputView?.setCountry(flag: country.flag, code: country.code)
        }
        controller.byPush(self)
    }

    final func finishToHome() {
        if let homeHandler {
            homeHandler()
        } else {
            goBack(nil)
        }
    }

    final func dispatchSubmit(mode: JobsAppDoorMode, values: JobsAppDoorFormValues) {
        submitHandler?(mode, values)
    }

    final func runEntrancePop(views: [UIView]) {
        views.forEach {
            $0.byAlpha(0).byTransform(CGAffineTransform(scaleX: 0.01, y: 0.01))
        }
        UIView.jobsAnimateKeyframes(
            1,
            options: [.calculationModeCubic],
            animations: {
                UIView.jobsAddKeyframe(withRelativeStartTime: 0, relativeDuration: 0.72) {
                    views.forEach {
                        $0.byAlpha(1).byTransform(CGAffineTransform(scaleX: 1.1, y: 1.1))
                    }
                }
                UIView.jobsAddKeyframe(withRelativeStartTime: 0.72, relativeDuration: 0.28) {
                    views.forEach { $0.byTransform(.identity) }
                }
            }
        )
    }
}

private extension JobsAppDoorBaseVC {
    func toggleVolumePanel() {
        setVolumePanelVisible(!volumePanelShowing, animated: true)
    }

    func setVolumePanelVisible(_ visible: Bool, animated: Bool) {
        guard configuration.backgroundType == .video else { return }
        volumePanelShowing = visible
        volumePanelView
            .byHidden(false)
            .byUserInteractionEnabled(visible)
        if visible {
            volumeSlider.byValue(backgroundView.currentVolume)
        }
        updateVolumePercentText()
        let alpha: CGFloat = visible ? 1 : 0
        let transform = visible
            ? CGAffineTransform.identity
            : CGAffineTransform(scaleX: 0.88, y: 0.88)
        let animations: () -> Void = {
            self.volumePanelView
                .byAlpha(alpha)
                .byTransform(transform)
        }
        let completion: (Bool) -> Void = { [weak self] _ in
            if !visible {
                self?.volumePanelView.byHidden(true)
            }
        }
        guard animated else {
            animations()
            completion(true)
            return
        }
        UIView.jobsAnimateWithSpring(
            0.24,
            delay: 0,
            dampingRatio: 0.86,
            initialVelocity: 0.2,
            options: [.curveEaseInOut, .allowUserInteraction],
            animations: animations,
            completion: completion
        )
    }

    func applyVolume(_ volume: Float) {
        backgroundView.setVolume(volume)
        volumeSlider.byValue(backgroundView.currentVolume)
        updateVolumePercentText()
    }

    func updateVolumePercentText() {
        let percent = Int((backgroundView.currentVolume * 100).rounded())
        volumePercentLabel.byText("\(percent)%")
    }

    func observeKeyboard() {
        let center = NotificationCenter.default
        let showObserver = center.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            guard let self,
                  let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            let frameInView = view.convert(frame, from: nil)
            let overlap = max(0, view.bounds.maxY - frameInView.minY)
            handleKeyboardOffset(overlap, keyboardVisible: overlap > 0)
        }
        let hideObserver = center.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleKeyboardOffset(0, keyboardVisible: false)
        }
        keyboardObservers = [showObserver, hideObserver]
    }
}
