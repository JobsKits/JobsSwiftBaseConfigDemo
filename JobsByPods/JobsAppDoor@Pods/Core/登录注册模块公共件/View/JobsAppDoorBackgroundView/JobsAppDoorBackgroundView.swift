//
//  JobsAppDoorBackgroundView.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import AVFoundation
import UIKit
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

final class JobsAppDoorBackgroundView: UIView {
    private lazy var imageView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(true)
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var dimView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.black.withAlphaComponent(0.08))
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
    }()

    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var playbackObserver: NSObjectProtocol?

    deinit {
        if let playbackObserver {
            NotificationCenter.default.removeObserver(playbackObserver)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.byVisible(true)
        dimView.byVisible(true)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }

    func configure(_ configuration: JobsAppDoorConfig) {
        imageView.byImage(JobsAppDoorResource.image(named: configuration.backgroundImageName))
        switch configuration.backgroundType {
        /// 处理图片背景分支
        case .image:
            stopVideo()
        /// 处理循环视频背景分支
        case .video:
            let screenRatio = UIScreen.main.bounds.height / max(UIScreen.main.bounds.width, 1)
            let resourceName = screenRatio > 2
                ? configuration.notchVideoResourceName
                : configuration.compactVideoResourceName
            guard let url = JobsAppDoorResource.videoURL(named: resourceName) else {
                stopVideo()
                return
            }
            prepareVideo(url: url, muted: configuration.videoMuted)
        }
    }

    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    var currentVolume: Float {
        guard let player else { return 0 };return player.isMuted ? 0 : player.volume
    }

    func setVolume(_ volume: Float) {
        let value = min(max(volume, 0), 1)
        player?.volume = value
        player?.isMuted = value <= 0.001
    }

}

private extension JobsAppDoorBackgroundView {
    func prepareVideo(url: URL, muted: Bool) {
        stopVideo()
        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        player.isMuted = muted
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.byFrame(bounds)
        layer.insertSublayer(playerLayer, below: dimView.layer)
        self.player = player
        self.playerLayer = playerLayer
        playbackObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { [weak player] _ in
            player?.seek(to: .zero)
            player?.play()
        }
        player.play()
    }

    func stopVideo() {
        if let playbackObserver {
            NotificationCenter.default.removeObserver(playbackObserver)
            self.playbackObserver = nil
        }
        player?.pause()
        player = nil
        playerLayer?.removeFromSuperlayer()
        playerLayer = nil
    }
}
