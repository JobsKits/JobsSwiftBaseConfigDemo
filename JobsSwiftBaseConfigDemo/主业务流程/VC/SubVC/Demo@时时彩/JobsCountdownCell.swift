//
//  JobsCountdownCell.swift
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

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftTimer
import JobsSwiftTimerMgr
import JobsSwiftBaseDefines
import SnapKit

public final class JobsCountdownCell: UITableViewCell {
    private var currentItem: JobsCountdownItem?
    private var currentTimerId: String?
    private var timer: JobsSwiftTimerProtocol?
    // ============================== UI (Lazy) ==============================
    private lazy var titleLabel: UILabel = {
        UILabel()
            .byNumberOfLines(1)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.label)
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.right.lessThanOrEqualTo(self.countdownLabel.snp.left).offset(-12)
            }
    }()

    private lazy var countdownLabel: UILabel = {
        UILabel()
            .byNumberOfLines(1)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 15, weight: .semibold))
            .byTextAlignment(.right)
            .byTextColor(JobsCor.systemRed)
            .byAddTo(contentView) { make in
                make.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.width.greaterThanOrEqualTo(86)
            }
    }()
    // ============================== Life Cycle ==============================
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        titleLabel.byVisible(YES)
        countdownLabel.byVisible(YES)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        stopTimerIfNeeded()
        currentItem = nil
        titleLabel.byText(nil)
        countdownLabel.byText(nil)
    }
    // ============================== Public ==============================
    /// ✅ 强类型（在 VC 里传 JobsCountdownItem 时会优先命中这个）
    @discardableResult
    public func byData(
        _ item: JobsCountdownItem,
        scopeIdentifier: String? = nil
    ) -> Self {
        // 复用：先停旧 timer（避免一个 cell 复用时还在跑旧的 tick）
        stopTimerIfNeeded()
        currentItem = item
        currentTimerId = item.timerIdentifier
        titleLabel.byText(item.title)
        renderCountdown()
        // 每个 item 一个 timerId（同屏多个 timer 并行）
        startTimer(item: item, scopeIdentifier: scopeIdentifier)
        return self
    }
    /// 兼容老接口
    public func bind(_ item: JobsCountdownItem) {
        _ = byData(item)
    }
    /// 离屏 / 复用时调用：stop + remove
    public func stopTimerIfNeeded() {
        let expectedTimer = timer
        let identifier = currentTimerId
        timer = nil
        currentTimerId = nil
        guard let expectedTimer, let identifier else { return }
        // 同步比对 Timer 实例，旧 Cell 的清理永远不会取消同 ID 的新 Timer
        JobsSwiftTimerMgr.shared.stopAndRemove(
            identifier: identifier,
            expectedTimer: expectedTimer
        )
    }
    // ============================== Timer ==============================
    private func startTimer(
        item: JobsCountdownItem,
        scopeIdentifier: String?
    ) {
        let id = item.timerIdentifier
        let interval = max(0.1, item.tickInterval)
        // 已结束就不启动
        if item.remainSeconds() <= 0 {
            countdownLabel.byText(Self.format(0))
            countdownLabel.byTextColor(JobsCor.secondaryLabel)
            return
        }
        let cfg = JobsSwiftTimerConfig(
            interval: interval,
            repeats: true,
            tolerance: 0.02,
            queue: .main,
            runLoop: .main,
            runLoopMode: .common,
            pauseInBackground: true,
            autoManageAppState: true
        )
        do {
            let t = try JobsSwiftTimerMgr.shared.create(
                kind: .gcd,
                identifier: id,
                config: cfg,
                dedupPolicy: .replace,
                scopeIdentifier: scopeIdentifier
            ) { [weak self] in
                // ✅ Swift 6 / Sendable 同等待遇：冻结 + MainActor
                guard let strongSelf = self else { return }
                onMainAsync(self) { vc in
                    // 复用保护：tick 回来的时候，确保还是当前这条数据的 timer
                    guard id == strongSelf.currentTimerId else { return }
                    strongSelf.renderCountdown()
                    // 到 0：立刻停掉并移除（避免无意义 tick）
                    if let it = strongSelf.currentItem, it.remainSeconds() <= 0 {
                        strongSelf.countdownLabel.byTextColor(JobsCor.secondaryLabel)
                        strongSelf.stopTimerIfNeeded()
                    }
                }
            }
            timer = t
            t.start()
        } catch {
            // 创建失败：一般是 manager 状态不对 / id 重复但 replace 失败
            countdownLabel.byText("--:--")
            countdownLabel.byTextColor(JobsCor.secondaryLabel)
        }
    }

    @MainActor
    private func renderCountdown() {
        guard let item = currentItem else { return }
        let remain = item.remainSeconds()
        countdownLabel.byText(Self.format(remain))
        countdownLabel.byTextColor((remain <= 0) ? JobsCor.secondaryLabel : JobsCor.systemRed)
    }

    private static func format(_ seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%02d:%02d", m, s)
    }
}
