//
//  GestureUnlockDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsByUIKit

final class GestureUnlockDemoVC: BaseVC {

    private enum FlowState {
        case createFirst
        case confirmFirst(temp: GesturePattern)
        case verify
    }

    private var flowState: FlowState = .verify
    private let store = PatternStore()
    private let horizontalInset: CGFloat = 20

    private lazy var modeControl: UISegmentedControl = {
        UISegmentedControl(items: ["设置/重置", "验证"])
            .bySelectedSegmentIndex(1)
            .onJobsChange { [weak self] (seg: UISegmentedControl) in
                guard let self else { return }

                unlockView.reset()

                if seg.selectedSegmentIndex == 0 {
                    flowState = .createFirst
                    hintLabel.text = "绘制新手势（至少 4 个点）"
                    unlockView.byVisible(YES)
                    unlockView.isInputEnabled = true
                } else {
                    flowState = .verify
                    if store.hasPattern {
                        hintLabel.text = "请输入手势解锁"
                        unlockView.byVisible(YES)
                        unlockView.isInputEnabled = true
                    } else {
                        hintLabel.text = "还没设置手势，先去“设置/重置”"
                        unlockView.byVisible(NO)
                        unlockView.isInputEnabled = false
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var hintLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byTextAlignment(.center)
            .byFont(.systemFont(ofSize: 15, weight: .medium))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.modeControl.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.right.equalToSuperview().inset(self.horizontalInset)
            }
    }()

    private lazy var unlockView: GestureUnlockView = {
        GestureUnlockView()
            .byBgColor(.clear)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.hintLabel.snp.bottom).offset(16)
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSizeMake(ScreenWidth() - 50.w, ScreenWidth() - 50.w))
            }
    }()

    private lazy var resetButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemGreen, for: .normal)
            .byTitle("清除/重来", for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .onTap { [weak self] sender in
                guard let self else { return }

                unlockView.reset()

                switch flowState {
                case .confirmFirst:
                    flowState = .createFirst
                    hintLabel.text = "请重新设置手势（至少 4 个点 ）"
                    unlockView.reset()
                default:
                    if store.hasPattern {
                        hintLabel.text = "请输入手势解锁"
                    } else {
                        showInfoHintAndClear("请先设置手势（至少 4 个点）") // ✅ 提示后清痕
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.unlockView.snp.bottom).offset(16)
                make.centerX.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "九宫格解锁🔒")

        modeControl.byVisible(YES)
        hintLabel.byVisible(YES)
        unlockView.byVisible(YES)
        resetButton.byVisible(YES)

        configureUnlockView()
        refreshStateFromStorage()
    }

    private func configureUnlockView() {
        var config = GestureUnlockConfiguration()
        config.gridDimension = 3
        config.minimumPatternLength = 4
        config.hapticsEnabled = true

        unlockView.configuration = config
        unlockView.delegate = self
    }

    private func refreshStateFromStorage() {
        if store.hasPattern {
            flowState = .verify
            hintLabel.text = "请输入手势解锁"
            modeControl.selectedSegmentIndex = 1
            unlockView.byVisible(YES)
            unlockView.isInputEnabled = true
            unlockView.reset()
        } else {
            flowState = .createFirst
            modeControl.selectedSegmentIndex = 0
            unlockView.byVisible(YES)
            unlockView.isInputEnabled = true
            showInfoHintAndClear("请先设置手势（至少 4 个点）") // ✅ 提示后清痕
        }
    }
    // MARK: - Trace Helpers
    private func clearGestureTrace(after delay: TimeInterval = 0.65) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.unlockView.reset()
        }
    }
    /// toast + 显示错误态 + 提示结束后清痕
    private func toastErrorAndClear(_ text: String, clearAfter delay: TimeInterval = 0.65) {
        unlockView.showError()
        text.toast
        clearGestureTrace(after: delay)
    }
    /// 状态提示：立即清痕（避免残留）
    private func showInfoHintAndClear(_ text: String) {
        hintLabel.text = text
        unlockView.reset()
    }
    /// 成功提示：保留短暂展示，再清痕
    private func delayedReset() {
        clearGestureTrace(after: 0.65)
    }
}
// MARK: - GestureUnlockViewDelegate（分类解耦）
extension GestureUnlockDemoVC: GestureUnlockViewDelegate {
    func gestureUnlockViewDidBeginInput(_ view: GestureUnlockView) {
        // 可按需清理提示
    }
    func gestureUnlockView(_ view: GestureUnlockView, didComplete pattern: GesturePattern) {
        // ✅ 长度不足：提示完成后清除之前手势痕迹
        guard pattern.indices.count >= view.configuration.minimumPatternLength else {
            toastErrorAndClear("至少连接 \(view.configuration.minimumPatternLength) 个点")
            return
        }
        switch flowState {
        case .createFirst:
            flowState = .confirmFirst(temp: pattern)
            view.showSelected()
            hintLabel.text = "请再绘制一次进行确认"
            delayedReset()
        case .confirmFirst(let temp):
            if temp == pattern {
                store.save(pattern: pattern)
                view.showSelected()
                hintLabel.text = "设置成功 ✅ 现在可以用它解锁了"
                flowState = .verify
                modeControl.selectedSegmentIndex = 1
                delayedReset()
            } else {
                flowState = .createFirst
                // ✅ 两次不一致：提示完成后清除之前手势痕迹
                toastErrorAndClear("两次不一致，请重新设置")
            }
        case .verify:
            guard store.hasPattern else {
                "还没设置手势，先去“设置/重置”".toast
                unlockView.reset() // 防止残留（即使理论上此时应该不可输入）
                return
            }
            if store.verify(pattern: pattern) {
                view.showSelected()
                hintLabel.text = "解锁成功 ✅"
                delayedReset()
            } else {
                // ✅ 手势错误：提示完成后清除之前手势痕迹
                toastErrorAndClear("手势错误")
            }
        }
    }
}
// MARK: - Demo Store（示例用 UserDefaults + SHA256）
private final class PatternStore {
    private let keyHash = "gesture_unlock.pattern_hash"
    private let keySalt = "gesture_unlock.salt"

    var hasPattern: Bool { UserDefaults.standard.string(forKey: keyHash) != nil }

    func save(pattern: GesturePattern) {
        let salt = saltValue()
        let hash = pattern.sha256Hex(salt: salt)
        UserDefaults.standard.set(hash, forKey: keyHash)
    }

    func verify(pattern: GesturePattern) -> Bool {
        guard let saved = UserDefaults.standard.string(forKey: keyHash) else { return false }
        let hash = pattern.sha256Hex(salt: saltValue())
        return hash == saved
    }

    private func saltValue() -> String {
        if let s = UserDefaults.standard.string(forKey: keySalt) { return s }
        let new = UUID().uuidString
        UserDefaults.standard.set(new, forKey: keySalt)
        return new
    }
}
