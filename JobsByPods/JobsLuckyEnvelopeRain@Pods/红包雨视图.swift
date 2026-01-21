//
//  红包雨视图.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/10/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsSwiftTimer
import JobsByUIKit
// MARK: —— 红包雨视图
public class RedPacketRainView: UIView {
    deinit {
        spawnTimer?.stop()
        fallTimer?.stop()
    }
    // 对外配置 & 回调
    public var config: RedPacketRainConfig {
        didSet { /* 需要的话可以在这里做重置 */ }
    }
    /// 点中红包的回调（参数：红包雨视图，总共点中的数量）
    public var tapCallback: ((RedPacketRainView, Int) -> Void)?
    /// 当前是否正在“下红包雨”
    public private(set) var isRunning: Bool = false
    /// 累计点中红包的数量
    public private(set) var tappedCount: Int = 0
    // 使用哪种 JobsTimer 内核
    private let timerKind: JobsTimerKind
    // 内部状态
    private var spawnTimer: JobsTimerProtocol?
    /// 负责驱动红包下落的计时器
    private var fallTimer: JobsTimerProtocol?
    /// 当前屏幕上的红包按钮
    private var activePackets: [UIButton] = []
    /// 每个红包的运动参数
    private struct PacketMotion {
        let spawnTime: TimeInterval
        let duration: TimeInterval
        let startCenter: CGPoint
        let endCenter: CGPoint
    }
    private var packetMotions: [ObjectIdentifier: PacketMotion] = [:]
    // MARK: - Init
    public init(
        frame: CGRect = .zero,
        config: RedPacketRainConfig = .default,
        timerKind: JobsTimerKind = .gcd
    ) {
        self.config = config
        self.timerKind = timerKind
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        self.config = .default
        self.timerKind = .gcd
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        clipsToBounds = true
        isUserInteractionEnabled = true
    }
    // MARK: - 对外控制
    public func start() {
        guard !isRunning else { return }
        buildTimerIfNeeded()
        isRunning = true
        spawnTimer?.start()
        fallTimer?.start()
    }

    public func pause() {
        guard isRunning else { return }
        isRunning = false
        spawnTimer?.pause()
        fallTimer?.pause()
    }

    public func resume() {
        guard !isRunning else { return }
        isRunning = true
        spawnTimer?.resume()
        fallTimer?.resume()
    }
    /// 停止红包雨
    /// - Parameter clear: 是否把屏幕上现有红包也移除
    public func stop(clear: Bool = true) {
        isRunning = false
        spawnTimer?.stop()
        spawnTimer = nil

        if clear {
            fallTimer?.stop()
            fallTimer = nil
            clearAllPackets()
        } else {
            // 不再生成新的红包，但允许现有红包继续落完
            if activePackets.isEmpty {
                fallTimer?.stop()
                fallTimer = nil
            }
        }
    }
    /// 完全重置（停止 + 清空 + 计数清零）
    public func reset() {
        stop(clear: true)
        tappedCount = 0
    }
    // MARK: - Timer
    private func buildTimerIfNeeded() {
        if spawnTimer == nil {
            let cfg = JobsTimerConfig(
                interval: max(0.05, config.spawnInterval),
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: true,
                autoManageAppState: true
            )
            // ✅ 新版：直接 new JobsTimer（不再用 JobsTimerFactory.make）
            spawnTimer = JobsTimer(
                kind: timerKind,
                config: cfg
            ) { [weak self] in
                // ✅ Swift 6：@Sendable handler，触 UI 必须回 MainActor
                Task { @MainActor in
                    self?.spawnPacketIfNeeded()
                }
            }
        }

        if fallTimer == nil {
            let fallCfg = JobsTimerConfig(
                interval: 1.0 / 60.0,
                repeats: true,
                tolerance: 0.0,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: true,
                autoManageAppState: true
            )
            // ✅ 新版：直接 new JobsTimer（不再用 JobsTimerFactory.make）
            fallTimer = JobsTimer(
                kind: timerKind,
                config: fallCfg
            ) { [weak self] in
                // ✅ Swift 6：@Sendable handler，触 UI 必须回 MainActor
                Task { @MainActor in
                    self?.updatePackets()
                }
            }
        }
    }
    // MARK: - 红包生成逻辑（UIButton 版本）
    @MainActor
    private func spawnPacketIfNeeded() {
        guard isRunning else { return }
        guard bounds.width > 0, bounds.height > 0 else { return }
        // 控制并发上限
        if activePackets.count >= config.maxConcurrentCount {
            return
        }

        let width = bounds.width - config.spawnInsets.left - config.spawnInsets.right
        guard width > 0 else { return }
        // 随机 X
        let maxX = max(0, width - config.packetSize.width)
        let randomX = config.spawnInsets.left + CGFloat.random(in: 0...maxX)

        let startFrame = CGRect(
            x: randomX,
            y: -config.packetSize.height,
            width: config.packetSize.width,
            height: config.packetSize.height
        )
        // 用 UIButton + DSL 创建单个红包
        let packet = UIButton.sys()
        packet.frame = startFrame
        packet.isUserInteractionEnabled = config.tapEnabled
        packet.clipsToBounds = true

        if let img = config.packetImage {
            // 有配置图片：直接用图片做背景
            packet.setBackgroundImage(img, for: .normal)
            packet.imageView?.contentMode = .scaleAspectFit
        } else {
            // 简单占位：红底 + 黄金边框 + 中间 ¥ 图标
            packet.backgroundColor = .systemRed
            packet.layer.cornerRadius = 6
            packet.layer.borderColor = UIColor.yellow.cgColor
            packet.layer.borderWidth = 1.5
            packet.layer.masksToBounds = true
            packet.byBackgroundImage(makeDefaultIconImage())
        }

        if config.tapEnabled {
            // 直接用按钮事件作为入口（onTap 最终是 addTarget + touchUpInside）
            packet.onTap { [weak self] sender in
                guard let self = self else { return }
                sender.playTapBounce(haptic: .light)  // 👈 临时放大→回弹（不注册任何手势/事件）
                self.removePacket(sender)
                self.tappedCount += 1
                self.tapCallback?(self, self.tappedCount)

                let feedback = UIImpactFeedbackGenerator(style: .light)
                feedback.impactOccurred()
            }
        }
        // 随机下落时间
        let duration = Double.random(
            in: min(config.minFallDuration, config.maxFallDuration)
                ... max(config.minFallDuration, config.maxFallDuration)
        )
        // 计算终点 frame（含水平漂移）
        var endFrame = startFrame
        endFrame.origin.y = bounds.height + config.packetSize.height

        let drift = CGFloat.random(in: -40...40)
        endFrame.origin.x = min(
            max(config.spawnInsets.left, endFrame.origin.x + drift),
            bounds.width - config.spawnInsets.right - config.packetSize.width
        )
        // 固定一个轻微旋转角度
        let angle = CGFloat.random(in: -0.25...0.25)
        packet.transform = CGAffineTransform(rotationAngle: angle)

        addSubview(packet)
        activePackets.append(packet)
        // 保存运动参数，后续由定时器驱动更新
        let startCenter = packet.center
        let endCenter = CGPoint(x: endFrame.midX, y: endFrame.midY)
        let motion = PacketMotion(
            spawnTime: Date().timeIntervalSinceReferenceDate,
            duration: duration,
            startCenter: startCenter,
            endCenter: endCenter
        )
        packetMotions[ObjectIdentifier(packet)] = motion
    }
    // MARK: - 下落刷新逻辑
    @MainActor
    private func updatePackets() {
        guard !activePackets.isEmpty else {
            if !isRunning {
                fallTimer?.stop()
                fallTimer = nil
            };return
        }

        let now = Date().timeIntervalSinceReferenceDate
        var finished: [UIButton] = []

        for packet in activePackets {
            let key = ObjectIdentifier(packet)
            guard let motion = packetMotions[key] else { continue }

            let elapsed = now - motion.spawnTime
            if elapsed <= 0 { continue }

            let progress = min(1.0, elapsed / motion.duration)
            let sx = motion.startCenter.x
            let sy = motion.startCenter.y
            let ex = motion.endCenter.x
            let ey = motion.endCenter.y

            let newCenter = CGPoint(
                x: sx + (ex - sx) * CGFloat(progress),
                y: sy + (ey - sy) * CGFloat(progress)
            )
            packet.center = newCenter

            if progress >= 1.0 {
                finished.append(packet)
            }
        }

        if !finished.isEmpty {
            finished.forEach { removePacket($0) }
        }

        if activePackets.isEmpty && !isRunning {
            fallTimer?.stop()
            fallTimer = nil
        }
    }

    private func clearAllPackets() {
        activePackets.forEach { $0.removeFromSuperview() }
        activePackets.removeAll()
        packetMotions.removeAll()
    }

    private func removePacket(_ packet: UIButton) {
        if let idx = activePackets.firstIndex(where: { $0 === packet }) {
            activePackets.remove(at: idx)
        }
        packetMotions.removeValue(forKey: ObjectIdentifier(packet))
        packet.removeFromSuperview()
    }
}
// MARK: - DSL
public extension RedPacketRainView {
    /// 类似 UIButton.sys()：默认 config + 默认 timerKind
    static func dsl(
        config: RedPacketRainConfig = .default,
        timerKind: JobsTimerKind = .gcd
    ) -> RedPacketRainView {
        // 注意这里调用的是现在的 init(frame:config:timerKind:)
        RedPacketRainView(frame: .zero, config: config, timerKind: timerKind)
    }
    /// 链式配置整体 config
    @discardableResult
    func byConfig(_ config: RedPacketRainConfig) -> Self {
        self.config = config
        return self
    }
    /// 链式设置点击红包回调
    @discardableResult
    func onPacketTap(_ callback: @escaping (RedPacketRainView, Int) -> Void) -> Self {
        self.tapCallback = callback
        return self
    }
    /// 开始红包雨
    @discardableResult
    func byStart() -> Self {
        start()
        return self
    }
    /// 暂停红包雨
    @discardableResult
    func byPause() -> Self {
        pause()
        return self
    }
    /// 恢复红包雨
    @discardableResult
    func byResume() -> Self {
        resume()
        return self
    }
    /// 停止红包雨
    @discardableResult
    func byStop(clear: Bool = true) -> Self {
        stop(clear: clear)
        return self
    }
    /// 重置（停止 + 清空 + 计数清零）
    @discardableResult
    func byReset() -> Self {
        reset()
        return self
    }
}
