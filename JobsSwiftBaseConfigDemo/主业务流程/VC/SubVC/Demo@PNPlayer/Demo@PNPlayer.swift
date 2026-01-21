//
//  PNPlayerDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/30/25.
//
//  https://github.com/linghugoogle/PNPlayer
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import MetalKit
import AVFoundation
import SnapKit
import JobsInheritance
import JobsByUIKit
import JobsBy3rdTools
import JobsSwiftBaseDefines
import JobsSwiftMetalKit_extensions

class PNPlayerDemoVC: BaseVC {

    private lazy var renderer: MetalRenderer = {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Metal is not supported on this device")
        }

        // [FIX] 1/2：拆开链式调用，避免 `MetalRenderer(...).byVideoTextureManagerDelegate(self)`
        //        在 Swift 6.2.x 上触发协议 witness/类型推断路径的编译器崩溃（ICE）。
        let r = MetalRenderer(device: device)

        // [FIX] 2/2：显式把 self 转成协议类型，降低编译器推断压力（也更明确）。
        //        如果你的 byVideoTextureManagerDelegate 接受的就是具体协议类型，这里能稳定绕开 ICE。
        let delegate: any VideoTextureManagerDelegate = self
        _ = r.byVideoTextureManagerDelegate(delegate)

        return r
    }()

    private lazy var metalView: MTKView = {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Metal is not supported on this device")
        }
        return MTKView(frame: .zero, device: device)
            .byClearColor(MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1))
            .byDepthStencilPixelFormat(.depth32Float)
            .byColorPixelFormat(.bgra8Unorm)
            .bySampleCount(4)
            .byPreferredFramesPerSecond(60)
            .byDelegate(renderer)
            .addPanAction { [weak self] gr in
                guard let self else { return }

                let pan = gr as! UIPanGestureRecognizer
                let p = pan.translation(in: gr.view)
                print("拖拽中: \(p)")

                // [FIX] 不再在初始化闭包里捕获 `metalView` 变量本身，
                //       改为使用 `gr.view`（实际发生手势的 view），减少初始化表达式复杂度与捕获关系。
                if let view = gr.view as? MTKView {
                    renderer.handlePan(pan, in: view)
                }

                showControlsTemporarily()
            }
            .addTapAction { [weak self] gr in
                guard let self else { return }
                print("点击 \(gr.view!)")
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
        loadSampleVideo()
        configureAudioSession()
    }

    // MARK: - 加载示例视频
    private func loadSampleVideo() {
        guard let videoURL = Bundle.main.url(forResource: "pano_360", withExtension: "mp4") else {
            print("Sample video not found")
            return
        }
        renderer.loadVideo(url: videoURL)
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
        renderer.handlePan(gesture, in: metalView)
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

    override var prefersStatusBarHidden: Bool {
        true
    }
}

// MARK: - PlayerControlsDelegate
extension PNPlayerDemoVC: PlayerControlsDelegate {
    func didTapPlayPause() {
        renderer.togglePlayPause()
        resetHideTimer()
    }

    func didSeekToTime(_ time: TimeInterval) {
        renderer.bySeekToTime(time)
        resetHideTimer()
    }
}

// MARK: - VideoTextureManagerDelegate
extension PNPlayerDemoVC: VideoTextureManagerDelegate {
    func videoDidUpdateTime(currentTime: TimeInterval, duration: TimeInterval) {
        controlsView.updateProgress(currentTime: currentTime, duration: duration)
    }

    func videoPlaybackStateChanged(isPlaying: Bool) {
        controlsView.updatePlayPauseButton(isPlaying: isPlaying)
    }
}
