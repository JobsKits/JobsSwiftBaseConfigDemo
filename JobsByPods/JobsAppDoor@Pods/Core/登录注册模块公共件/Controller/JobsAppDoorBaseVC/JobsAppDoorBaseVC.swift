//
//  JobsAppDoorBaseVC.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import UIKit
import AVFoundation
import MediaPlayer
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftCountryCodeCtrl
import JobsSwiftDSL
import SnapKit
import JobsSwiftGraphicCaptcha

public enum JobsAppDoorSubmissionState {

    case idle
    case submitting
    case succeeded
    case failed(Error)
}

open class JobsAppDoorBaseVC: BaseVC {

    public let configuration: JobsAppDoorConfig
    public var submitHandler: ((JobsAppDoorMode, JobsAppDoorFormValues) -> Void)?
    /// Inject the host's API call and return its cancellation action.
    public var submitOperation: ((JobsAppDoorMode, JobsAppDoorFormValues,
            @escaping (Result<Void, Error>) -> Void) -> (() -> Void)?)?
    public var configureGraphicCaptcha: ((JobsSwiftGraphicCaptchaView) -> Void)?
    public var submissionTimeout: TimeInterval = 15
    public var onSubmissionStateChanged: ((JobsAppDoorSubmissionState) -> Void)?
    public private(set) var submissionState: JobsAppDoorSubmissionState = .idle
    public var isSubmitting: Bool {
        if case .submitting = submissionState {
            return true
        }
        return false
    }
    private var submissionGeneration: UInt64 = 0
    private var cancelSubmissionOperation: (() -> Void)?
    private var submissionTimeoutWork: DispatchWorkItem?
    public var homeHandler: (() -> Void)?
    public var customerServiceHandler: (() -> Void)?
    public var verificationCodeHandler: ((JobsAppDoorFormValues) -> Void)?

    private var keyboardObservers: [NSObjectProtocol] = []
    private var volumePanelShowing = false
    private lazy var volumeDismissGesture: UITapGestureRecognizer = {
        UITapGestureRecognizer
            .jobsMake { _ in }
            .byDelegate(self)
            .byCancelsTouchesInView(false)
            .byDelaysTouchesBegan(false)
            .byDelaysTouchesEnded(false)
    }()
    #if !targetEnvironment(simulator)
    private var systemVolumeObservation: NSKeyValueObservation?
    private lazy var systemVolumeView: MPVolumeView = {
        MPVolumeView
            .jobsMake { _ in }
            .byAccessibilityIdentifier("jobs.auth.volume.slider")
            .byTintColor(JobsAppDoorPalette.gold)
            .byTransform(CGAffineTransform(rotationAngle: -.pi / 2))
            .byAddTo(volumePanelView) { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(10)
                make.width.equalTo(134)
                make.height.equalTo(28)
            }
    }()
    #endif

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
            .jobsAppDoorAppearance(title: "\(JobsAppDoorResource.text("在线客服"))\n\(JobsAppDoorResource.text("7×24小时"))",
                                   titleColor: JobsAppDoorPalette.gold,
                                   font: JobsFont.systemFont(ofSize: 10,
                                                             weight: .medium),
                                   backgroundColor: JobsAppDoorPalette.cardBackground,
                                   cornerRadius: 19,
                                   borderColor: JobsAppDoorPalette.gold,
                                   borderWidth: 2)
            .byImage(JobsAppDoorResource.customerServiceIconImage(),
                     for: .normal)
            .byImagePlacement(.left,
                              padding: 7)
            .byTitleAlignment(.center)
            .byNumberOfLines(2)
            .byContentEdgeInsets(UIEdgeInsets(top: 4,
                                              left: 8,
                                              bottom: 4,
                                              right: 8))
            .onTap { [weak self] _ in
                self?.customerServiceHandler?()
            }
            .byAddTo(view)
    }()

    final var customerServiceWidth: CGFloat {
        let font = customerServiceButton.titleLabel?.font ?? JobsFont.systemFont(ofSize: 10)
        let widestLine = ["在线客服", "7×24小时"].map {
            (JobsAppDoorResource.text($0) as NSString).size(withAttributes: [.font: font]).width
        }.max() ?? 0
        return max(118, min(280, ceil(widestLine) + 48))
    }

    final lazy var volumeButton: UIButton = {
        let button = UIButton.sys()
            .jobsAppDoorAppearance(titleColor: JobsAppDoorPalette.gold,
                                   backgroundColor: JobsAppDoorPalette.cardBackground,
                                   cornerRadius: 18,
                                   borderColor: JobsAppDoorPalette.gold,
                                   borderWidth: 1)
            .byImage(JobsAppDoorResource.image(named: "AppDoorVolume")
                ?? UIImage(systemName: "speaker.wave.2.fill"),
                     for: .normal)
            .byTintColor(JobsAppDoorPalette.gold)
            .onTap { [weak self] _ in
                self?.toggleVolumePanel()
            }
            .byAddTo(view) { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(12)
                make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(14)
                make.size.equalTo(CGSize(width: 36, height: 36))
            }
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            button.byAccessibilityIdentifier("jobs.auth.volume.toggle")
        }
        #endif
        return button
    }()

    final lazy var volumePanelView: UIView = {
        let panel = UIView
            .jobsMake { _ in }
            .byBackgroundColor(JobsAppDoorPalette.cardBackground.withAlphaComponent(0.92))
            .byCornerRadius(14)
            .byClipsToBounds(true)
            .byBorderColor(JobsAppDoorPalette.gold)
            .byBorderWidth(1)
            .byAlpha(0)
            .byHidden(true)
            .byTransform(CGAffineTransform(scaleX: 0.88,
                                           y: 0.88))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(volumeButton.snp.bottom).offset(8)
                make.centerX.equalTo(volumeButton)
                make.size.equalTo(CGSize(width: 52, height: 188))
            }
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            panel.byAccessibilityIdentifier("jobs.auth.volume.panel")
        }
        #endif
        return panel
    }()

    final lazy var volumePercentLabel: UILabel = {
        let label = UILabel
            .jobsMake { _ in }
            .byTextColor(JobsAppDoorPalette.gold)
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 10,
                                        weight: .medium))
            .byAdjustsFontSizeToFitWidth(true)
            .byMinimumScaleFactor(0.7)
            .byAddTo(volumePanelView) { make in
                make.top.equalToSuperview().offset(8)
                make.left.right.equalToSuperview()
                make.height.equalTo(20)
            }
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            label.byAccessibilityIdentifier("jobs.auth.volume.percent")
        }
        #endif
        return label
    }()

    final lazy var volumeSlider: UISlider = {
        let slider = UISlider
            .jobsMake { _ in }
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
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            slider.byAccessibilityIdentifier("jobs.auth.volume.slider")
        }
        #endif
        return slider
    }()

    public init(configuration: JobsAppDoorConfig = .defaultConfig) {
        self.configuration = configuration
        super.init(nibName: nil,
                   bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        keyboardObservers.forEach(NotificationCenter.default.removeObserver)
        submissionTimeoutWork?.cancel()
        cancelSubmissionOperation?()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        backgroundView.configure(configuration)
        backgroundView.byVisible(true)
        volumeButton.byHidden(configuration.backgroundType != .video)
        view.jobs_addGestureRetView(volumeDismissGesture)
        observeKeyboard()
        #if !targetEnvironment(simulator)
        if configuration.backgroundType == .video {
            systemVolumeObservation = AVAudioSession.sharedInstance().observe(\.outputVolume,
                                                                              options: [.new]) { [weak self] _, _ in
                DispatchQueue.main.async {
                    guard let self else {
                        return
                    }
                    self.backgroundView.setVolume(1)
                    self.updateVolumePercentText()
                }
            }
        }
        #endif
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
        cancelSubmission()
        view.endEditing(true)
        jobsForceHideSystemNavBar(false)
        setVolumePanelVisible(false,
                              animated: false)
        backgroundView.pause()
    }

    func handleKeyboardOffset(_ offset: CGFloat,
                              keyboardVisible: Bool) { }

    func formLayoutFrame(preferredY: CGFloat,
                         preferredHeight: CGFloat,
                         keyboardLift: CGFloat,
                         footerHeight: CGFloat) -> CGRect {
        let safeFrame = view.bounds.inset(by: view.safeAreaInsets)
        let keyboardTop = view.keyboardLayoutGuide.layoutFrame.minY
        let bottom = max(safeFrame.minY,
                         min(safeFrame.maxY,keyboardTop))
        let height = min(preferredHeight,
                         max(0,
                             bottom - safeFrame.minY - footerHeight))
        let top = min(max(safeFrame.minY,
                          safeFrame.minY + preferredY - keyboardLift),
                      max(safeFrame.minY,
                          bottom - height - footerHeight))
        return CGRect(x: safeFrame.minX,
                      y: top,
                      width: safeFrame.width,
                      height: height)
    }

    final func openCountryCodePicker(for inputView: JobsAppDoorInputView) {
        view.endEditing(true)
        let controller = JobsSwiftCountryCodeCtrl()
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            controller.view.byAccessibilityIdentifier("jobs.auth.country.picker")
        }
        #endif
        controller.countrySelectionHandler = { [weak inputView] country in
            inputView?.setCountry(flag: country.flag,
                                  code: country.code)
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

    public final func cancelSubmission() {
        guard isSubmitting else {
            return
        }
        submissionGeneration &+= 1
        let cancel = cancelSubmissionOperation
        cancelSubmissionOperation = nil
        submissionTimeoutWork?.cancel()
        submissionTimeoutWork = nil
        setSubmissionState(.idle)
        cancel?()
    }

    open func submissionStateDidChange(_ state: JobsAppDoorSubmissionState) { }

    private func setSubmissionState(_ state: JobsAppDoorSubmissionState) {
        submissionState = state
        submissionStateDidChange(state)
        onSubmissionStateChanged?(state)
    }

    private func finishSubmission(_ result: Result<Void, Error>,
                                  generation: UInt64) {
        guard submissionGeneration == generation, isSubmitting else {
            return
        }
        submissionTimeoutWork?.cancel()
        submissionTimeoutWork = nil
        cancelSubmissionOperation = nil
        switch result {
        case .success:
            setSubmissionState(.succeeded)
        case .failure(let error):
            setSubmissionState(.failed(error))
        }
    }

    final func dispatchSubmit(mode: JobsAppDoorMode,
                              values: JobsAppDoorFormValues) {
        guard !isSubmitting else {
            return
        }
        guard let operation = submitOperation else {
            submitHandler?(mode,
                           values)
            return
        }
        submissionGeneration &+= 1
        let generation = submissionGeneration
        setSubmissionState(.submitting)
        guard submissionGeneration == generation, isSubmitting else {
            return
        }
        let timeout = submissionTimeout.isFinite && submissionTimeout > 0
            ? min(submissionTimeout,
                  300) : 15
        let work = DispatchWorkItem { [weak self] in
            guard let self, self.submissionGeneration == generation, self.isSubmitting else {
                return
            }
            let cancel = self.cancelSubmissionOperation
            self.finishSubmission(.failure(NSError(domain: "JobsAppDoor",
                                                   code: -1001,
                                                   userInfo: [NSLocalizedDescriptionKey: "请求超时，请重试"])),
                                  generation: generation)
            cancel?()
        }
        submissionTimeoutWork = work
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout,
                                      execute: work)
        let cancel = operation(mode,
                               values) { [weak self] result in
            DispatchQueue.main.async {
                self?.finishSubmission(result,
                                       generation: generation)
            }
        }
        if submissionGeneration == generation, isSubmitting {
            cancelSubmissionOperation = cancel
        } else {
            cancel?()
        }
    }

    final func runEntrancePop(views: [UIView]) {
        views.forEach {
            $0
                .byAlpha(0)
                .byTransform(CGAffineTransform(scaleX: 0.01,
                                               y: 0.01))
        }
        UIView.jobsAnimateKeyframes(1,
                                    options: [.calculationModeCubic],
                                    animations: {
            UIView.jobsAddKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.72) {
                views.forEach {
                    $0
                        .byAlpha(1)
                        .byTransform(CGAffineTransform(scaleX: 1.1,
                                                       y: 1.1))
                }
            }
            UIView.jobsAddKeyframe(withRelativeStartTime: 0.72,
                                   relativeDuration: 0.28) {
                views.forEach {
                    $0.byTransform(.identity)
                }
            }
        })
    }
}

private extension JobsAppDoorBaseVC {

    func toggleVolumePanel() {
        setVolumePanelVisible(!volumePanelShowing,
                              animated: true)
    }

    func setVolumePanelVisible(_ visible: Bool,
                               animated: Bool) {
        guard configuration.backgroundType == .video else {
            return
        }
        volumePanelShowing = visible
        volumePanelView
            .byHidden(false)
            .byUserInteractionEnabled(visible)
        if visible {
            #if targetEnvironment(simulator)
            volumeSlider.byValue(backgroundView.currentVolume)
            #else
            // 真机直接使用公开系统音量控件，避免与播放器增益叠乘。
            backgroundView.setVolume(1)
            systemVolumeView.byVisible(true)
            #endif
        }
        updateVolumePercentText()
        let alpha: CGFloat = visible ? 1 : 0
        let transform = visible
            ? CGAffineTransform.identity
            : CGAffineTransform(scaleX: 0.88,
                                y: 0.88)
        let animations: () -> Void = {
            self.volumePanelView
                .byAlpha(alpha)
                .byTransform(transform)
        }
        let completion: (Bool) -> Void = { [weak self] _ in
            if self?.volumePanelShowing == false {
                self?.volumePanelView.byHidden(true)
            }
        }
        guard animated else {
            animations()
            completion(true)
            return
        }
        UIView.jobsAnimateWithSpring(0.24,
                                     delay: 0,
                                     dampingRatio: 0.86,
                                     initialVelocity: 0.2,
                                     options: [.curveEaseInOut, .allowUserInteraction, .beginFromCurrentState],
                                     animations: animations,
                                     completion: completion)
    }

    func applyVolume(_ volume: Float) {
        backgroundView.setVolume(volume)
        volumeSlider.byValue(backgroundView.currentVolume)
        updateVolumePercentText()
    }

    func updateVolumePercentText() {
        #if targetEnvironment(simulator)
        let volume = backgroundView.currentVolume
        #else
        let volume = AVAudioSession.sharedInstance().outputVolume
        #endif
        let percent = Int((volume * 100).rounded())
        volumePercentLabel.byText("\(percent)%")
    }

    func observeKeyboard() {
        let center = NotificationCenter.default
        let showObserver = center.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification,
                                              object: nil,
                                              queue: .main) { [weak self] notification in
            guard let self,
                  let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                  let scene = view.window?.windowScene else {
                return
            }
            let frameInView = view.convert(frame,
                                           from: scene.screen.coordinateSpace)
            let intersection = view.bounds.intersection(frameInView)
            let overlap = intersection.isNull ? 0 : intersection.height
            handleKeyboardOffset(overlap,
                                 keyboardVisible: overlap > 0)
        }
        let hideObserver = center.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                              object: nil,
                                              queue: .main) { [weak self] _ in
            self?.handleKeyboardOffset(0,
                                       keyboardVisible: false)
        }
        keyboardObservers = [showObserver, hideObserver]
    }
}

extension JobsAppDoorBaseVC: UIGestureRecognizerDelegate {

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldReceive touch: UITouch) -> Bool {
        guard gestureRecognizer === volumeDismissGesture, volumePanelShowing else {
            return false
        }
        let point = touch.location(in: view)
        let insidePanel = volumePanelView.frame.contains(point)
        let insideButton = volumeButton.frame.contains(point)
        if !insidePanel && !insideButton {
            setVolumePanelVisible(false,
                                  animated: true)
        }
        // 只观察触摸起点，原控件继续接收同一次点击或拖动。
        return false
    }
}
