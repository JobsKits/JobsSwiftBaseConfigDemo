//
//  Demo@动效数字（普通标签）.swift
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

import Jobsl10n

import JobsScale
import JobsToast
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class AnimationEffectLabelDemoVC: BaseVC {

    // MARK: - Config
    private let horizontalInset: CGFloat = 16
    private let cardInset: CGFloat = 16
    private let spacingX: CGFloat = 12
    private let spacingY: CGFloat = 12
    private let defaultStart: Double = 60
    private let defaultEnd: Double = 0
    private let maximumIntegerDigits = 15
    // MARK: - UI
    private lazy var cardView: UIView = {
        UIView
            .jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(16)
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(self.view.safeAreaLayoutGuide).offset(self.horizontalInset)
                make.right.equalTo(self.view.safeAreaLayoutGuide).inset(self.horizontalInset)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var valueLabel: UILabel = {
        UILabel
            .jobsMake { _ in }
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 52,
                                        weight: .bold))
            .byTextColor(JobsCor.label)
            .byText("\(Int(defaultStart))")
            .byNumberOfLines(1)
        /// 配置@数字动效
        .byAnimatedTextNumber(duration: 0.9,
                              minimumInterval: 1.0 / 60.0)
            .byAddTo(cardView) { [unowned self] make in
                make.top.equalToSuperview().offset(24)
                make.left.equalToSuperview().offset(self.cardInset)
                make.right.equalToSuperview().inset(self.cardInset)
            }
    }()

    private lazy var hintLabel: UILabel = {
        UILabel
            .jobsMake { _ in }
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .tr_setText("起点 → 终点（只允许数字输入）\n不填默认：起点 60，终点 0".tr)
            .byAddTo(cardView) { [unowned self] make in
                make.top.equalTo(self.valueLabel.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(self.cardInset)
                make.right.equalToSuperview().inset(self.cardInset)
                make.bottom.equalToSuperview().inset(18)
            }
    }()
    // MARK: - 输入框
    /// 起点输入框（placeholder=60）
    private lazy var startTF: JobsTextField = {
        JobsTextField
            .jobsMake { _ in }
            .byTextFieldConfig({ textField in
                textField
                    .byPlaceholder("起点（默认 \(Int(defaultStart))）")
                    .byPlaceholderFont(.PingFangSC.Regular(14))
                    .byPlaceholderColor(JobsCor.secondaryLabel)
                    .byFont(.PingFangSC.Regular(14))
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumFontSize(12)
                    .byTextColor(JobsCor.label)
                    .byKeyboardType(.numberPad)
                    .byReturnKeyType(.next)
                    .byClearButtonMode(.whileEditing)
                    .byDelegate(self)
                    .byAddAction(for: .editingChanged) { [weak self] (tf: UITextField) in
                        guard let self else {
                            return
                        }
                        self.syncStartTextToLabel(self.filterNumericInPlace(tf))
                    }
            })
            .byInsetTop(14)
            .byInsetLeft(12)
            .byInsetRight(12)
            .byInsetBottom(14)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.cardView.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.height.equalTo(44)
            }
            .byBorderColor("#eaeaea".cor)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(4.h)
    }()
    /// 终点输入框（placeholder=0）
    private lazy var endTF: JobsTextField = {
        JobsTextField
            .jobsMake { _ in }
            .byTextFieldConfig({ textField in
                textField
                    .byPlaceholder("终点（默认 \(Int(defaultEnd))）")
                    .byPlaceholderFont(.PingFangSC.Regular(14))
                    .byPlaceholderColor(JobsCor.secondaryLabel)
                    .byFont(.PingFangSC.Regular(14))
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumFontSize(12)
                    .byTextColor(JobsCor.label)
                    .byKeyboardType(.numberPad)
                    .byReturnKeyType(.next)
                    .byClearButtonMode(.whileEditing)
                    .byDelegate(self)
                    .byAddAction(for: .editingChanged) { [weak self] (tf: UITextField) in
                        guard let self else {
                            return
                        }
                        self.filterNumericInPlace(tf)
                    }
            })
            .byInsetTop(14)
            .byInsetLeft(12)
            .byInsetRight(12)
            .byInsetBottom(14)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.startTF)
                make.left.equalTo(self.startTF.snp.right).offset(self.spacingX)
                make.right.equalToSuperview().inset(self.horizontalInset)
                make.width.equalTo(self.startTF)
                make.height.equalTo(44)
            }
            .byBorderColor("#eaeaea".cor)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(4.h)
    }()
    // MARK: - Buttons
    private lazy var startBtn: UIButton = {
        UIButton.sys()
            .tr_setTitle("启动".tr, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue,
                               for: .normal)
            .byTitleColor(JobsCor.white,
                          for: .normal)
        /// 普通@点按事件触发
        .onTap { [weak self] _ in
                guard let self else {
                    return
                }
                self.view.endEditing(true)
                let startRaw = (self.startTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let endRaw   = (self.endTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            // 规则：允许为空（走 fallback），但只要非空就必须是纯数字
                if !self.isValidIntegerText(startRaw) {
                    "❌ 起点不是纯数字：\(startRaw)".toast
                    return
                }
                if !self.isValidIntegerText(endRaw) {
                    "❌ 终点不是纯数字：\(endRaw)".toast
                    return
                }
                let startValue = self.parseValue(startRaw,
                                                 fallback: self.defaultStart)
                let endValue   = self.parseValue(endRaw,
                                                 fallback: self.defaultEnd)
                let endText = self.formatTargetText(endValue)
                if endText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    "❌ 目标值为空".tr.toast
                    return
                }
            /// 启动@数字动效
                self.valueLabel
                    .byStopAnimatedTextNumber()
                    .byText(self.formatTargetText(startValue))
                    .byAnimatedTextNumber(start: startValue,
                                          step: nil,
                                          duration: 0.9,
                                          minimumInterval: 1.0 / 60.0,
                                          completion: nil)
                    .byStartAnimatedTextNumber(endText)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.startTF.snp.bottom).offset(self.spacingY)
                make.left.equalTo(self.startTF)
                make.height.equalTo(44)
            }
    }()

    private lazy var stopBtn: UIButton = {
        UIButton.sys()
            .tr_setTitle("停止".tr, for: .normal)
            .byBackgroundColor(JobsCor.secondarySystemBackground,
                               for: .normal)
            .byTitleColor(JobsCor.label,
                          for: .normal)
        /// 普通@点按事件触发
        .onTap { [weak self] _ in
                guard let self else {
                    return
                }
                self.valueLabel.byStopAnimatedTextNumber()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.startBtn)
                make.left.equalTo(self.startBtn.snp.right).offset(self.spacingX)
                make.right.equalTo(self.endTF)
                make.width.equalTo(self.startBtn)
                make.height.equalTo(44)
            }
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "UILabel数字动效".tr)
        cardView.byVisible(YES)
        valueLabel.byVisible(YES)
        hintLabel.byVisible(YES)
        startTF.byVisible(YES)
        endTF.byVisible(YES)
        startBtn.byVisible(YES)
        stopBtn.byVisible(YES)
    }

    deinit {
        valueLabel.byStopAnimatedTextNumber()
    }
}

extension AnimationEffectLabelDemoVC {

    // MARK: - Helpers
    private func syncStartTextToLabel(_ str: String?) {
        let raw = (str ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        valueLabel
            .byStopAnimatedTextNumber()
            .byText(formatTargetText(parseValue(raw,
                                               fallback: defaultStart)))
    }
    @discardableResult
    private func filterNumericInPlace(_ tf: UITextField) -> String {
        let raw = tf.text ?? ""
        let filtered = filterNumericString(raw)
        if filtered != raw {
            tf.byText(filtered)
        }
        return filtered
    }

    private func filterNumericString(_ raw: String) -> String {
        // 15 位整数可被 Double 精确表示，也不会在动画转为 Int 时溢出。
        String(raw.filter { character in
            guard let ascii = character.asciiValue else {
                return false
            }
            return ascii >= 48 && ascii <= 57
        }.prefix(maximumIntegerDigits))
    }

    private func isValidIntegerText(_ raw: String) -> Bool {
        raw == filterNumericString(raw)
    }

    private func parseValue(_ text: String?,
                            fallback: Double) -> Double {
        let t = (text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if t.isEmpty {
            return fallback
        }
        return Double(t) ?? fallback
    }
    /// 起点和终点统一展示为无小数位整数。
    private func formatTargetText(_ value: Double) -> String {
        return String(format: "%.0f",
                      value)
    }
}

extension AnimationEffectLabelDemoVC: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let current = textField.text ?? ""
        guard let swiftRange = Range(range, in: current) else {
            return false
        }
        return isValidIntegerText(current.replacingCharacters(in: swiftRange,
                                                               with: string))
    }
}
