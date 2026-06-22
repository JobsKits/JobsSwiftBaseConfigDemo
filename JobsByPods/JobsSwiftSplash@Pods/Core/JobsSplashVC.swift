//
//  JobsSplashVC.swift
//  JobsSwiftSplash
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import AVFoundation
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftOpen

public final class JobsSplashVC: BaseVC {

    public let configuration: JobsSplashConfiguration

    private var countdownTimer: Timer?
    private var remainingSeconds: Int?
    private var mediaTask: URLSessionTask?
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var hasFinished = false

    private lazy var imageView: UIImageView = {
        UIImageView()
            .byContentMode(configuration.contentMode)
            .byClipsToBounds()
            .byUserInteractionEnabled(true)
            .onJobsTap { [weak self] (_: UIImageView) in
                self?.perform(self?.configuration.tapAction)
            }
    }()

    private lazy var skipButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(UIColor.black.withAlphaComponent(0.45), for: .normal)
            .byTitleColor(.white)
            .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
            .byCornerRadius(18)
            .byMasksToBounds(true)
            .onTap { [weak self] _ in
                self?.finish()
            }
    }()

    public init(configuration: JobsSplashConfiguration) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var canBecomeFirstResponder: Bool { true }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(.black)
        imageView
            .byAddTo(view) { make in
                make.edges.equalToSuperview()
            }
        skipButton
            .byVisible(configuration.isSkipButtonVisible)
            .byAddTo(view)
        renderContent()
        startCountdownIfNeeded()
        refreshSkipButtonTitle()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        becomeFirstResponder()
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = view.bounds
        if let customFrame = configuration.skipButtonFrame {
            skipButton.byFrame(customFrame)
        } else {
            let size = skipButton.sizeThatFits(CGSize(width: 160, height: 36))
            let width = max(64, size.width + 24)
            skipButton.byFrame(CGRect(
                x: view.bounds.width - configuration.skipButtonInsets.right - width,
                y: view.safeAreaInsets.top + configuration.skipButtonInsets.top,
                width: width,
                height: 36
            ))
        }
    }

    public override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        guard motion == .motionShake else { return }
        perform(configuration.shakeAction)
    }

    deinit {
        countdownTimer?.invalidate()
        mediaTask?.cancel()
        player?.pause()
    }

    @MainActor
    public func finish() {
        guard !hasFinished else { return }
        hasFinished = true
        countdownTimer?.invalidate()
        countdownTimer = nil
        mediaTask?.cancel()
        player?.pause()
        configuration.onSkip?(self)

        if presentingViewController != nil {
            dismiss(animated: false)
        } else if let navigationController, navigationController.viewControllers.first !== self {
            navigationController.popViewController(animated: false)
        } else {
            willMove(toParent: nil)
            view.removeFromSuperview()
            removeFromParent()
        }
    }

    private func renderContent() {
        switch configuration.content {
        case let .localImage(name, bundle):
            imageView.byImage(UIImage(named: name, in: bundle, compatibleWith: nil))
        case let .localGIF(name, bundle):
            guard let url = resourceURL(name: name, defaultExtension: "gif", bundle: bundle),
                  let data = try? Data(contentsOf: url) else { return }
            imageView.byImage(JobsSplashGIFDecoder.image(data: data))
        case let .remoteImage(url):
            loadRemoteImage(url)
        case let .localVideo(name, fileExtension, bundle):
            guard let url = resourceURL(name: name, defaultExtension: fileExtension, bundle: bundle) else { return }
            playVideo(url)
        case let .remoteVideo(url):
            loadRemoteVideo(url)
        }
    }

    private func loadRemoteImage(_ url: URL) {
        if let cachedURL = JobsSplashMediaCache.shared.cachedFileURL(for: url),
           let data = try? Data(contentsOf: cachedURL) {
            imageView.byImage(image(from: data, url: url))
            return
        }
        mediaTask = JobsSplashMediaCache.shared.download(url) { [weak self] result in
            guard let self, case let .success(localURL) = result,
                  let data = try? Data(contentsOf: localURL) else { return }
            self.imageView.byImage(self.image(from: data, url: url))
        }
    }

    private func loadRemoteVideo(_ url: URL) {
        if let cachedURL = JobsSplashMediaCache.shared.cachedFileURL(for: url) {
            playVideo(cachedURL)
            return
        }
        mediaTask = JobsSplashMediaCache.shared.download(url) { [weak self] result in
            guard let self, case let .success(localURL) = result else { return }
            self.playVideo(localURL)
        }
    }

    private func playVideo(_ url: URL) {
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = configuration.videoGravity
        playerLayer.frame = view.bounds
        view.layer.insertSublayer(playerLayer, above: imageView.layer)
        self.player = player
        self.playerLayer = playerLayer
        player.play()
    }

    private func image(from data: Data, url: URL) -> UIImage? {
        if url.pathExtension.lowercased() == "gif" {
            return JobsSplashGIFDecoder.image(data: data)
        }
        return UIImage(data: data)
    }

    private func resourceURL(name: String, defaultExtension: String?, bundle: Bundle) -> URL? {
        let nameExtension = (name as NSString).pathExtension
        if !nameExtension.isEmpty {
            return bundle.url(
                forResource: (name as NSString).deletingPathExtension,
                withExtension: nameExtension
            )
        }
        return bundle.url(forResource: name, withExtension: defaultExtension)
    }

    private func startCountdownIfNeeded() {
        guard let seconds = configuration.countdownSeconds else { return }
        remainingSeconds = seconds
        guard seconds > 0 else {
            DispatchQueue.main.async { [weak self] in
                self?.finish()
            }
            return
        }
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self else {
                timer.invalidate()
                return
            }
            let nextValue = max(0, (self.remainingSeconds ?? 1) - 1)
            self.remainingSeconds = nextValue
            self.refreshSkipButtonTitle()
            if nextValue == 0 {
                timer.invalidate()
                self.finish()
            }
        }
    }

    private func refreshSkipButtonTitle() {
        skipButton.byTitle(
            JobsSplashLocalization.skipTitle(
                language: configuration.language,
                remainingSeconds: remainingSeconds
            )
        )
        view.bySetNeedsLayout()
    }

    private func perform(_ action: JobsSplashAction?) {
        guard let action else { return }
        switch action {
        case let .open(configuration):
            JobsOpen.shared.open(configuration, from: self)
        case let .custom(block):
            block(self)
        case .none:
            break
        }
    }

}
