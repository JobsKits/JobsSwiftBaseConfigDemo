//
//  JobsCountdownCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/18/25.
//  Refined for latest JobsTimerManager API on 2025/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public final class JobsCountdownCell: UITableViewCell {

    private var currentItem: JobsCountdownItem?
    private var currentTimerId: String?

    /// ✅ UI Bridge（规避 @Sendable 直接抓 cell）
    private lazy var uiBridge: UIShowBridge = .init(self)

    private final class UIShowBridge: @unchecked Sendable {
        weak var cell: JobsCountdownCell?
        init(_ cell: JobsCountdownCell) { self.cell = cell }

        func tick(timerId: String) {
            Task { @MainActor [weak cell] in
                guard let cell else { return }
                // 复用保护：tick 回来时，必须还是同一个 timerId
                guard timerId == cell.currentTimerId else { return }
                cell.renderCountdown()

                if let item = cell.currentItem, item.remainSeconds() <= 0 {
                    cell.countdownLabel.textColor = .secondaryLabel
                    cell.stopTimerIfNeeded()
                }
            }
        }
    }

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
        stopTimerIfNeeded()

        currentItem = item
        currentTimerId = item.timerIdentifier

        titleLabel.byText(item.title)
        renderCountdown()

        startTimer(item: item)
    }

    public func stopTimerIfNeeded() {
        guard let id = currentTimerId else { return }
        currentTimerId = nil
        // ✅ 最新 API：cancel = stop + remove
        do { _ = try JobsTimerManager.shared.act(.cancel, identifier: id) }
        catch { /* ignore */ }
    }

    /// ✅ 强类型（在 VC 里传 JobsCountdownItem 时会优先命中这个）
    @discardableResult
    public func byData(_ item: JobsCountdownItem) -> Self {
        bind(item)
        return self
    }

    // ============================== Timer ==============================
    private func startTimer(item: JobsCountdownItem) {
        let id = item.timerIdentifier
        let interval = max(0.1, item.tickInterval)
        let bridge = uiBridge

        do {
            // ✅ 同 id 覆盖旧 timer（等价旧 upsert）
            let timer = try JobsTimerManager.shared.create(
                kind: .gcd,
                identifier: id,
                config: .init(interval: interval,
                              repeats: true,
                              tolerance: 0.02,
                              queue: .main,
                              runLoop: .main,
                              runLoopMode: .common,
                              pauseInBackground: true,
                              autoManageAppState: false),
                dedupPolicy: .replace
            ) {
                // 初始 handler（可留空；这里保持你原来的语义）
            }

            timer.onTick { [bridge] in
                bridge.tick(timerId: id)
            }

            timer.start()
        } catch {
            // 创建失败就不要继续 tick
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
}
