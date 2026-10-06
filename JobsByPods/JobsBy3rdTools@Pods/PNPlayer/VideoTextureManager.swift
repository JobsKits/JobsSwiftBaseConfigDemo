//
//  VideoTextureManager.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import AVFoundation
import Metal
import CoreVideo

@MainActor
public protocol VideoTextureManagerDelegate: AnyObject {
    func videoDidUpdateTime(currentTime: TimeInterval, duration: TimeInterval)
    func videoPlaybackStateChanged(isPlaying: Bool)
    func videoPlaybackDidFail(error: Error)
}

public extension VideoTextureManagerDelegate {
    func videoPlaybackDidFail(error: Error) {}
}

@MainActor
class VideoTextureManager: NSObject {
    private let device: MTLDevice
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var videoOutput: AVPlayerItemVideoOutput?
    private var displayLink: CADisplayLink?
    private var textureCache: CVMetalTextureCache?
    private var timeObserver: Any?
    private var itemObservation: NSKeyValueObservation?
    private var playbackObservation: NSKeyValueObservation?
    private var generation: UInt64 = 0
    private(set) var playbackError: Error?

    weak var delegate: VideoTextureManagerDelegate?
    var currentTexture: MTLTexture?

    var isPlaying: Bool {
        return (player?.rate ?? 0) > 0
    }

    var duration: TimeInterval {
        guard let playerItem = playerItem else { return 0 }
        let duration = playerItem.duration
        let seconds = CMTimeGetSeconds(duration)
        return seconds.isFinite && !seconds.isNaN && seconds > 0 ? seconds : 0
    }

    var currentTime: TimeInterval {
        guard let player = player else { return 0 }
        let seconds = CMTimeGetSeconds(player.currentTime())
        return seconds.isFinite && !seconds.isNaN && seconds >= 0 ? seconds : 0
    }

    init(device: MTLDevice) {
        self.device = device
        super.init()
        CVMetalTextureCacheCreate(nil, nil, device, nil, &textureCache)
    }

    func loadVideo(url: URL) {
        generation &+= 1
        clearPlayback()
        playbackError = nil
        guard textureCache != nil else {
            fail(NSError(domain: "JobsBy3rdTools.Video", code: 2,
                         userInfo: [NSLocalizedDescriptionKey: "Metal video texture cache is unavailable."]))
            return
        }
        let asset = AVURLAsset(url: url)
        playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        let outputSettings = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferIOSurfacePropertiesKey as String: [:] as CFDictionary
        ] as [String : Any]
        let output = AVPlayerItemVideoOutput(pixelBufferAttributes: outputSettings)
        videoOutput = output
        playerItem?.add(output)
        setupDisplayLink()
        setupTimeObserver()
        setupNotifications()
        observePlayback()
    }

    private func clearPlayback() {
        displayLink?.invalidate()
        displayLink = nil
        itemObservation = nil
        playbackObservation = nil
        if let timeObserver, let player {
            player.removeTimeObserver(timeObserver)
        }
        timeObserver = nil
        player?.pause()
        if let playerItem {
            NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        }
        currentTexture = nil
        player = nil
        playerItem = nil
        videoOutput = nil
    }

    private func observePlayback() {
        let operation = generation
        itemObservation = playerItem?.observe(\.status, options: [.initial, .new]) { [weak self] item, _ in
            DispatchQueue.main.async { [weak self] in
                guard let self, self.generation == operation, self.playerItem === item else {
                    return
                }
                if item.status == .failed {
                    self.fail(item.error ?? NSError(domain: "JobsBy3rdTools.Video", code: 1,
                                                   userInfo: [NSLocalizedDescriptionKey: "Video resource failed to load."]))
                }
            }
        }
        playbackObservation = player?.observe(\.timeControlStatus, options: [.initial, .new]) { [weak self] player, _ in
            DispatchQueue.main.async { [weak self] in
                guard let self, self.generation == operation, self.player === player else {
                    return
                }
                let playing = player.timeControlStatus == .playing
                self.displayLink?.isPaused = !playing
                self.delegate?.videoPlaybackStateChanged(isPlaying: playing)
            }
        }
    }

    private func fail(_ error: Error) {
        guard playbackError == nil else {
            return
        }
        playbackError = error
        player?.pause()
        displayLink?.isPaused = true
        delegate?.videoPlaybackStateChanged(isPlaying: false)
        delegate?.videoPlaybackDidFail(error: error)
    }

    private func setupDisplayLink() {
        let target = VideoTextureDisplayLinkTarget(manager: self)
        displayLink = CADisplayLink(target: target, selector: #selector(VideoTextureDisplayLinkTarget.tick(_:)))
        displayLink?.add(to: RunLoop.main, forMode: .common)
        displayLink?.preferredFramesPerSecond = 60
        displayLink?.isPaused = true
    }

    private func setupTimeObserver() {
        let interval = CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let operation = generation
        timeObserver = player?.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self, self.generation == operation else {
                return
            }
            let currentTime = CMTimeGetSeconds(time)
            let duration = self.duration
            self.delegate?.videoDidUpdateTime(currentTime: currentTime, duration: duration)
        }
    }

    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerItemDidReachEnd),
            name: .AVPlayerItemDidPlayToEndTime,
            object: playerItem
        )
    }

    @objc private func playerItemDidReachEnd() {
        delegate?.videoPlaybackStateChanged(isPlaying: false)
    }

    func updateTexture() {
        guard let videoOutput = videoOutput,
              let playerItem = playerItem else { return }
        let currentTime = playerItem.currentTime()
        if videoOutput.hasNewPixelBuffer(forItemTime: currentTime) {
            guard let pixelBuffer = videoOutput.copyPixelBuffer(forItemTime: currentTime, itemTimeForDisplay: nil) else { return }
            createTexture(from: pixelBuffer)
        }
    }

    private func createTexture(from pixelBuffer: CVPixelBuffer) {
        guard let textureCache = textureCache else { return }
        let width = CVPixelBufferGetWidth(pixelBuffer)
        let height = CVPixelBufferGetHeight(pixelBuffer)
        var metalTexture: CVMetalTexture?
        let status = CVMetalTextureCacheCreateTextureFromImage(
            nil,
            textureCache,
            pixelBuffer,
            nil,
            .bgra8Unorm,
            width,
            height,
            0,
            &metalTexture
        )
        if status == kCVReturnSuccess, let metalTexture = metalTexture {
            currentTexture = CVMetalTextureGetTexture(metalTexture)
        }
    }

    func play() {
        guard player != nil, playbackError == nil else {
            return
        }
        player?.play()
    }

    func pause() {
        player?.pause()
        delegate?.videoPlaybackStateChanged(isPlaying: false)
    }

    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }

    func seek(to time: TimeInterval) {
        guard time.isFinite, time >= 0 else {
            return
        }
        let operation = generation
        let destination = duration > 0 ? min(time, duration) : time
        let cmTime = CMTime(seconds: destination, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player?.seek(to: cmTime) { [weak self] _ in
            DispatchQueue.main.async { [weak self] in
                guard let self, self.generation == operation else {
                    return
                }
                self.delegate?.videoDidUpdateTime(currentTime: self.currentTime, duration: self.duration)
            }
        }
    }

    deinit {
        displayLink?.invalidate()
        if let timeObserver = timeObserver {
            player?.removeTimeObserver(timeObserver)
        }
        NotificationCenter.default.removeObserver(self)
    }
}
