//
//  Demo@PNPlayer.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import MetalKit
import AVFoundation
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftMetalKit
import JobsSwiftBaseDefines
import SnapKit
import JobsToast

class PNPlayerDemoVC: BaseVC {
    private lazy var device = MTLCreateSystemDefaultDevice()
    private lazy var renderer: MetalRenderer? = {
        guard let device else {
            return nil
        }
        let delegate: any VideoTextureManagerDelegate = self
        return MetalRenderer(device: device)
            .byVideoTextureManagerDelegate(delegate)
            .byOnRenderingFailure { [weak self] error in
                DispatchQueue.main.async {
                    self?.showPlaybackFailure(error)
                }
            }
    }()

    private lazy var metalView: MTKView = {
        MTKView.jobsMake(frame: .zero, device: device)
            .byClearColor(MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1))
            .byDepthStencilPixelFormat(.depth32Float)
            .byColorPixelFormat(.bgra8Unorm)
            .bySampleCount(4)
            .byPreferredFramesPerSecond(60)
            .byDelegate(renderer)
            .addPanAction { [weak self] gr in
                guard let self else { return }
                guard let pan = gr as? UIPanGestureRecognizer else {
                    return
                }
                let p = pan.translation(in: gr.view)
                print("拖拽中: \(p)")
                // [FIX] 不再在初始化闭包里捕获 `metalView` 变量本身，
                //       改为使用 `gr.view`（实际发生手势的 view），减少初始化表达式复杂度与捕获关系。
                if let view = gr.view as? MTKView {
                    renderer?.handlePan(pan, in: view)
                }
                showControlsTemporarily()
            }
            .addTapAction { [weak self] gr in
                guard let self else { return }
                print("点击 \(String(describing: gr.view))")
                toggleControlsVisibility()
            }
            .byAddTo(view) { [unowned self] make in
                make.edges.equalToSuperview() // 全屏铺满
            }
    }()

    private lazy var controlsView: PlayerControlsView = {
        PlayerControlsView()
            .byDelegate(self)
            .byAddTo(view) { [unowned self] make in
                make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
                make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
                make.height.equalTo(68)
            }.byAlpha(0)
    }()

    private var controlsHideTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        metalView.byVisible(YES)
        controlsView.byVisible(YES)
        guard let renderer else {
            showPlaybackFailure(NSError(domain: "PNPlayerDemo", code: 1,
                                        userInfo: [NSLocalizedDescriptionKey: "当前设备不支持 Metal 播放。"] ))
            return
        }
        renderer.byAttach(metalView)
        loadSampleVideo()
        configureAudioSession()
    }
    // MARK: - 加载示例视频
    private func loadSampleVideo() {
        guard let videoURL = Bundle.main.url(forResource: "pano_360", withExtension: "mp4") else {
            showPlaybackFailure(NSError(domain: "PNPlayerDemo", code: 2,
                                        userInfo: [NSLocalizedDescriptionKey: "未找到本地 pano_360.mp4 示例视频。"]))
            return
        }
        renderer?.loadVideo(url: videoURL)
    }
    // MARK: - 音频会话
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to configure audio session: \(error)")
        }
    }
    // MARK: - 交互
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        renderer?.handlePan(gesture, in: metalView)
        showControlsTemporarily()
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        toggleControlsVisibility()
    }

    private func showControlsTemporarily() {
        controlsView.show()
        resetHideTimer()
    }

    private func toggleControlsVisibility() {
        if controlsView.alpha > 0 {
            controlsView.hide()
            controlsHideTimer?.invalidate()
        } else {
            showControlsTemporarily()
        }
    }

    private func resetHideTimer() {
        controlsHideTimer?.invalidate()
        controlsHideTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.controlsView.hide()
        }
    }

    private func showPlaybackFailure(_ error: Error) {
        controlsHideTimer?.invalidate()
        controlsView.updatePlayPauseButton(isPlaying: false)
        error.localizedDescription.toast
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        controlsHideTimer?.invalidate()
        renderer?.pauseVideo()
    }

    override var prefersStatusBarHidden: Bool {
        true
    }
}
// MARK: - PlayerControlsDelegate
extension PNPlayerDemoVC: PlayerControlsDelegate {
    func didTapPlayPause() {
        renderer?.togglePlayPause()
        resetHideTimer()
    }

    func didSeekToTime(_ time: TimeInterval) {
        renderer?.bySeekToTime(time)
        resetHideTimer()
    }
}
// MARK: - VideoTextureManagerDelegate
extension PNPlayerDemoVC: VideoTextureManagerDelegate {
    func videoDidUpdateTime(currentTime: TimeInterval, duration: TimeInterval) {
        controlsView.updateProgress(currentTime: currentTime, duration: duration)
    }

    func videoPlaybackDidFail(error: Error) {
        showPlaybackFailure(error)
    }

    func videoPlaybackStateChanged(isPlaying: Bool) {
        controlsView.updatePlayPauseButton(isPlaying: isPlaying)
    }
}
