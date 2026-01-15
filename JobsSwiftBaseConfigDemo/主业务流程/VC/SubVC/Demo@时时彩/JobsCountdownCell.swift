//
//  JobsCountdownCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/18/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import JobsByUIKit

public final class JobsCountdownCell: UITableViewCell {
    private var currentItem: JobsCountdownItem?
    private var currentTimerId: String?
    // ============================== UI (Lazy) ==============================
    private lazy var titleLabel: UILabel = {
        UILabel()
            .byNumberOfLines(1)
            .byFont(.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(.label)
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.right.lessThanOrEqualTo(self.countdownLabel.snp.left).offset(-12)
            }
    }()

    private lazy var countdownLabel: UILabel = {
        UILabel()
            .byNumberOfLines(1)
            .byFont(.monospacedDigitSystemFont(ofSize: 15, weight: .semibold))
            .byTextAlignment(.right)
            .byTextColor(.systemRed)
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
        titleLabel.text = nil
        countdownLabel.text = nil
    }
    // ============================== Public ==============================
    public func bind(_ item: JobsCountdownItem) {
        // 复用：先停旧 timer（避免一个 cell 复用时还在跑旧的 tick）
        stopTimerIfNeeded()
        currentItem = item
        currentTimerId = item.timerIdentifier
        titleLabel.byText(item.title)
        renderCountdown()
        // 每个 item 一个 timerId（同屏多个 timer 并行）
        startTimer(item: item)
    }

    public func stopTimerIfNeeded() {
        guard let id = currentTimerId else { return }
        currentTimerId = nil
        Task { await JobsTimerManager.shared.stopAndRemove(identifier: id) }
    }
    // ============================== Timer ==============================
    private func startTimer(item: JobsCountdownItem) {
        let id = item.timerIdentifier
        let interval = max(0.1, item.tickInterval)
        Task { [weak self] in
            guard let self else { return }
            // upsert：同 id 覆盖旧 timer；这里用 gcd，tick 回调跑在 main queue（方便直接刷 UI）
            _ = await JobsTimerManager.shared.upsertTimer(
                identifier: id,
                kind: .gcd,
                config: .init(interval: interval,
                              repeats: true,
                              tolerance: 0.02,
                              queue: .main),
                policy: .pauseAndResume,
                startImmediately: true
            ) { [weak self] in
                Task { @MainActor [weak self] in
                    guard let self else { return }
                    // 复用保护：tick 回来的时候，确保还是当前这条数据的 timer
                    guard id == currentTimerId else { return }
                    renderCountdown()
                    // 到 0：立刻停掉并移除（避免无意义 tick）
                    if let item = currentItem, item.remainSeconds() <= 0 {
                        countdownLabel.textColor = .secondaryLabel
                        stopTimerIfNeeded()
                    }
                }
            }
        }
    }

    private func renderCountdown() {
        guard let item = currentItem else { return }
        let remain = item.remainSeconds()
        countdownLabel.byText(Self.format(remain))
        countdownLabel.byTextColor((remain <= 0) ? .secondaryLabel : .systemRed)
    }

    private static func format(_ seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%02d:%02d", m, s)
    }
    /// ✅ 强类型（在 VC 里传 JobsCountdownItem 时会优先命中这个）
    @discardableResult
    public func byData(_ item: JobsCountdownItem) -> Self {
        // 复用：先停旧 timer（避免一个 cell 复用时还在跑旧的 tick）
        stopTimerIfNeeded()

        currentItem = item
        currentTimerId = item.timerIdentifier

        titleLabel.byText(item.title)
        renderCountdown()

        // 每个 item 一个 timerId（同屏多个 timer 并行）
        startTimer(item: item)

        return self
    }
}
