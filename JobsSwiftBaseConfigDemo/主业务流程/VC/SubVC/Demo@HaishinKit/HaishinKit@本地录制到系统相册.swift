//
//  HaishinKit@本地录制到系统相册.swift
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

import AVFoundation
import Photos
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift
import HaishinKit      // HaishinKit / RTMPHaishinKit

final class HKLocalRecordVC: BaseVC {
    // MARK: - HaishinKit 管线（2.x 写法）
    /// 采集（摄像头 + 麦克风）都挂在这里
    private let mixer = MediaMixer()
    /// RTMPStream 即使不推流，也可以用来承载采样数据
    private let connection = RTMPConnection()
    private lazy var stream = RTMPStream(connection: connection)
    /// 新版本地录制器，替代以前的 AVRecorder / IOStreamRecorder
    private let recorder = HKStreamRecorder()
    /// 当前摄像头朝向
    private var currentPosition: AVCaptureDevice.Position = .back
    /// 是否正在录制
    private var isRecording = false
    // MARK: - UI（懒加载 + 的链式 API + SnapKit）
    /// 预览视图：HaishinKit 提供的 Metal 预览
    private lazy var previewView: MTHKView = {
        let v = MTHKView(frame: .zero)
        v.videoGravity = .resizeAspectFill
        // 链式封装：添加到 self.view 并用 SnapKit 约束全屏
        v.byAddTo(view) { make in
            make.edges.equalToSuperview()   // 全屏铺满
        };return v
    }()
    /// 状态文案
    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byTextColor(JobsCor.white)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextAlignment(.center)
            .byText("准备就绪".tr)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalTo(recordButtonOuterRingView.snp.top).offset(-12)
            }
    }()
    /// 微信风格白色外圈
    private lazy var recordButtonOuterRingView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.clear)
            .byBorderColor(JobsCor.white)
            .byBorderWidth(4)
            .byCornerRadius(44)
            .byUserInteractionEnabled(false)
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(32)
                make.size.equalTo(CGSize(width: 88, height: 88))
            }
    }()
    /// 开始/停止录制按钮
    private lazy var recordButton: UIButton = {
        UIButton.sys()
            .byTitle("开始录制".tr, for: .normal)
            .byTitle("停止录制".tr, for: .selected)
            .byTitleColor(JobsCor.clear, for: .normal)
            .byTitleColor(JobsCor.clear, for: .selected)
            .byBackgroundColor(JobsCor.white, for: .normal)
            .byCornerRadius(32)
            .onTap { [weak self] btn in
                self?.toggleRecord(btn)
            }
            .byAddTo(recordButtonOuterRingView) { make in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: 64, height: 64))
            }
    }()
    /// 切换前后摄像头按钮
    private lazy var switchCameraButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.black.withAlphaComponent(0.4), for: .normal)
            .byImage("camera.rotate".sysImg, for: .normal)
            .byCornerRadius(20)
            .onTap { [weak self] _ in
                guard let self else { return }
                /// 切换前后摄像头（2.x 写法，不再用 DeviceUtil）
                currentPosition = (currentPosition == .back) ? .front : .back
                onMainAsync(self) { vc in
                    guard let device = AVCaptureDevice.default(
                        .builtInWideAngleCamera,
                        for: .video,
                        position: self.currentPosition
                    ) else {
                        print("⚠️ 找不到对应方向摄像头：\(self.currentPosition)")
                        return
                    }
                    do {
                        try await self.mixer.attachVideo(device)
                        self.statusLabel.byText("📷 已切换到 \(self.currentPosition == .back ? "后置" : "前置") 摄像头")
                    } catch {
                        print("⚠️ 切换摄像头失败：\(error)")
                        self.statusLabel.byText("❌ 切换摄像头失败：\(error.localizedDescription)")
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(12)
                make.right.equalToSuperview().inset(20)
                make.size.equalTo(CGSize(width: 40, height: 40))
            }
    }()
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.byBackgroundColor(JobsCor.systemBackground)
        // 触发懒加载
        previewView.byVisible(YES)
        recordButtonOuterRingView.byVisible(YES)
        recordButton.byVisible(YES)
        switchCameraButton.byVisible(YES)
        statusLabel.byVisible(YES)
        requestCameraAndMicrophoneAuthorization()
        setupAudioSession()
        // 初始化 HaishinKit 采集管线
        onMainAsync(self) { vc in
            await self.setupCapturePipeline()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Task { [weak self] in
            guard let self else { return }
            await self.cleanup()
        }
    }
    // MARK: - 导航栏
    private func setupNavigationBar() {
        jobsSetupGKNav(
            title: "本地录制到系统相册",
            leftButton: UIButton.sys()
                .byFrame(CGRect(x: 0, y: 0, width: 32, height: 32))
                .byTintColor(JobsCor.white)
                .byImage("chevron.left".sysImg, for: .normal)
                .byContentEdgeInsets(.zero)
                .byTitleEdgeInsets(.zero)
                .onTap { [weak self] _ in
                    self?.goBack("")
                }
        )
        gk_navBackgroundColor = JobsCor.black
        gk_navTitleColor = JobsCor.white
        gk_navLineHidden = true
    }
    // MARK: - 权限
    /// 申请摄像头 + 麦克风权限（简单版）
    private func requestCameraAndMicrophoneAuthorization() {
        Task {
            let _ = await AVCaptureDevice.requestAccess(for: .video)
            let _ = await AVCaptureDevice.requestAccess(for: .audio)
        }
    }
    // MARK: - AVAudioSession
    /// 配置音频 Session（来自官方 README 的写法，2.x 推荐）
    private func setupAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(
                .playAndRecord,
                mode: .videoRecording,
                options: [.defaultToSpeaker, .allowBluetoothHFP]
            )
            try session.setActive(true)
        } catch {
            print("⚠️ 配置 AVAudioSession 失败：\(error)")
        }
    }
    // MARK: - HaishinKit 采集管线（2.x 正确写法）
    /// 初始化采集（绑定摄像头 + 麦克风，串起来 mixer -> stream -> previewView + recorder）
    @MainActor
    private func setupCapturePipeline() async {
        // 1. 准备采集设备
        guard
            let videoDevice = AVCaptureDevice.default(
                .builtInWideAngleCamera,
                for: .video,
                position: currentPosition
            ),
            let audioDevice = AVCaptureDevice.default(for: .audio)
        else {
            statusLabel.byText("❌ 找不到摄像头或麦克风".tr)
            return
        }
        // 2. 把设备 attach 到 MediaMixer
        do {
            try await mixer.attachVideo(videoDevice)
        } catch {
            print("⚠️ attachVideo 失败：\(error)")
        }
        do {
            try await mixer.attachAudio(audioDevice)
        } catch {
            print("⚠️ attachAudio 失败：\(error)")
        }
        // 3. mixer 输出到 RTMPStream
        await mixer.addOutput(stream)
        // 4. RTMPStream 再输出到预览视图 + 录制器
        await stream.addOutput(previewView) // 预览
        await stream.addOutput(recorder)    // 本地录制 ✅
        statusLabel.byText("✅ 采集已就绪，点击“开始录制”".tr)
    }
    /// 释放资源
    private func cleanup() async {
        if isRecording {
            do {
                _ = try await recorder.stopRecording()
            } catch {
                print("⚠️ 停止录制失败 (cleanup)：\(error)")
            }
        }
        await mixer.stopRunning()
        do {
            try await connection.close()
        } catch {
            print("⚠️ 关闭 RTMPConnection 失败：\(error)")
        }
    }
    // MARK: - 录制控制
    private func toggleRecord(_ sender: UIButton) {
        onMainAsync(self) { vc in
            if self.isRecording {
                await self.stopRecording()
            } else {
                await self.startRecording()
            }
        }
    }
    /// 开始录制：调用 HKStreamRecorder.startRecording()
    @MainActor
    private func startRecording() async {
        do {
            try await recorder.startRecording()
            isRecording = true
            recordButton.bySelected(true)
            statusLabel.byText("⏺ 正在录制中...".tr)
        } catch {
            statusLabel.byText("❌ 开始录制失败：\(error.localizedDescription)")
            print("⚠️ startRecording 失败：\(error)")
        }
    }
    /// 停止录制：stopRecording() 返回生成的文件 URL，写入相册
    @MainActor
    private func stopRecording() async {
        do {
            statusLabel.byText("⏹ 正在停止录制...".tr)
            let outputURL = try await recorder.stopRecording()
            isRecording = false
            recordButton.bySelected(false)
            statusLabel.byText("✅ 已停止录制，正在保存到相册...".tr)
            saveToPhotoLibrary(outputURL)
        } catch {
            statusLabel.byText("❌ 停止录制失败：\(error.localizedDescription)")
            print("⚠️ stopRecording 失败：\(error)")
        }
    }
    /// 把 HKStreamRecorder 生成的 mp4 写入系统相册
    private func saveToPhotoLibrary(_ fileURL: URL) {
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized || status == .limited else {
                print("⚠️ 没有照片权限，无法保存：\(status.rawValue)")
                return
            }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: fileURL)
            }, completionHandler: { saved, error in
                if let error {
                    print("⚠️ 保存到相册失败：\(error)")
                } else if saved {
                    print("✅ 已保存到相册：\(fileURL.lastPathComponent)")
                    try? FileManager.default.removeItem(at: fileURL)
                } else {
                    print("⚠️ 未知原因保存失败")
                }
            })
        }
    }
}
