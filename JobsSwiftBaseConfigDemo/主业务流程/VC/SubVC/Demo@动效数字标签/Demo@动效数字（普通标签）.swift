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

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsToast
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines

final class AnimationEffectLabelDemoVC: BaseVC {
    // MARK: - Config
    private let horizontalInset: CGFloat = 16
    private let cardInset: CGFloat = 16
    private let spacingX: CGFloat = 12
    private let spacingY: CGFloat = 12
    private let defaultStart: Double = 60
    private let defaultEnd: Double = 0
    // MARK: - UI
    private lazy var cardView: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
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
        UILabel()
            .byTextAlignment(.center)
            .byFont(.systemFont(ofSize: 52, weight: .bold))
            .byTextColor(.label)
            .byText("\(Int(defaultStart))")
            .byNumberOfLines(1)
            /// 配置@数字动效
            .byAnimatedTextNumber(duration: 0.9, minimumInterval: 1.0 / 60.0)
            .byAddTo(cardView) { [unowned self] make in
                make.top.equalToSuperview().offset(24)
                make.left.equalToSuperview().offset(self.cardInset)
                make.right.equalToSuperview().inset(self.cardInset)
            }
    }()

    private lazy var hintLabel: UILabel = {
        UILabel()
            .byTextAlignment(.center)
            .byFont(.systemFont(ofSize: 14))
            .byTextColor(.secondaryLabel)
            .byNumberOfLines(0)
            .byText("起点 → 终点（只允许数字输入）\n不填默认：起点 60，终点 0")
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
        JobsTextField()
            .byTextFieldConfig({ textField in
                textField
                    .byPlaceholder("    ".add("起点（默认 \(Int(defaultStart))）"))
                    .byPlaceholderFont(.PingFangSC.Regular(14))
                    .byPlaceholderColor("#BBBBBB".cor)
                    .byFont(.PingFangSC.Regular(14))
                    .byTextColor("#BBBBBB".cor)
                    .byKeyboardType(.default)
                    .byReturnKeyType(.next)
                    .byClearButtonMode(.whileEditing)
                    .onShouldClear { [weak self] tf in
                        guard let self else { return true }
                        self.syncStartTextToLabel("\(Int(defaultStart))")
//                        self.startTF.textField.byText("")
                        return true                   // true 允许清空；false 拦截
                    }
                    /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
                    .byOnInput(limit: 20) { [weak self] char, value, mode, isLimited ,text ,tf in
                        // text 就是当前 UITextField.text（保证不是 nil，空就是 ""）
                        // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                        // char：删除/回车时为 ""
                        // mode：space/delete/return/normal
                        // isLimited：是否设置了限制（limit != nil）
                        guard let self else { return }
                        // 去空格 + 只保留数字格式
                        let trimmed = value.trimmingCharacters(in: .whitespaces)
                        if trimmed != value { self.startTF.text = trimmed }
                        self.filterNumericInPlace(self.startTF.textField)
                        self.syncStartTextToLabel(value)
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
        JobsTextField()
            .byTextFieldConfig({ textField in
                textField
                    .byPlaceholder("    ".add("终点（默认 \(Int(defaultEnd))）"))
                    .byPlaceholderFont(.PingFangSC.Regular(14))
                    .byPlaceholderColor("#BBBBBB".cor)
                    .byFont(.PingFangSC.Regular(14))
                    .byTextColor("#BBBBBB".cor)
                    .byKeyboardType(.default)
                    .byReturnKeyType(.next)
                    .byClearButtonMode(.whileEditing)
                    /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
                    .byOnInput(limit: 20) { [weak self] char, value, mode, isLimited ,text ,tf in
                        // text 就是当前 UITextField.text（保证不是 nil，空就是 ""）
                        // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                        // char：删除/回车时为 ""
                        // mode：space/delete/return/normal
                        // isLimited：是否设置了限制（limit != nil）
                        guard let self else { return }
                        let trimmed = value.trimmingCharacters(in: .whitespaces)
                        if trimmed != value { self.endTF.text = trimmed }
                        self.filterNumericInPlace(self.endTF.textField)
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
            .byTitle("启动".tr, for: .normal)
            .byBackgroundColor(.systemGreen, for: .normal)
            .byTitleColor(.systemRed, for: .normal)
            /// 普通@点按事件触发
            .onTap { [weak self] _ in
                guard let self else { return }
                self.view.endEditing(true)

                let startRaw = (self.startTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let endRaw   = (self.endTF.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)

                // 规则：允许为空（走 fallback），但只要非空就必须是纯数字
                if !startRaw.isEmpty && !startRaw.isPureNumber {
                    "❌ 起点不是纯数字：\(startRaw)".toast
                    return
                }
                if !endRaw.isEmpty && !endRaw.isPureNumber {
                    "❌ 终点不是纯数字：\(endRaw)".toast
                    return
                }

                let startValue = self.parseValue(startRaw, fallback: self.defaultStart)
                let endValue   = self.parseValue(endRaw,   fallback: self.defaultEnd)

                let endText = self.formatTargetText(endValue)
                if endText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    "❌ 目标值为空".toast; return
                }
                /// 启动@数字动效
                self.valueLabel
                    .byStopAnimatedTextNumber()
                    .byAnimatedTextNumber(
                        start: startValue,
                        step: nil,
                        duration: 0.9,
                        minimumInterval: 1.0 / 60.0,
                        completion: nil
                    )
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
            .byTitle("停止".tr, for: .normal)
            .byBackgroundColor(.systemOrange, for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            /// 普通@点按事件触发
            .onTap { [weak self] _ in
                guard let self else { return }
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
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "UILabel数字动效")

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
        if raw.isEmpty {
            valueLabel.byText("\(Int(defaultStart))") // 默认 60
        } else {
            valueLabel.byText(raw)// 实时同步输入的内容
        }
    }
    /// 只允许：数字、一个小数点、一个前置负号
    private func filterNumericInPlace(_ tf: UITextField) {
        let raw = tf.text ?? ""
        tf.text = filterNumericString(raw)
    }

    private func filterNumericString(_ raw: String) -> String {
        var result = ""
        var hasDot = false
        var hasMinus = false

        for (idx, ch) in raw.enumerated() {
            if ch.isNumber {
                result.append(ch)
                continue
            }
            if ch == ".", !hasDot {
                hasDot = true
                result.append(ch)
                continue
            }
            if ch == "-", idx == 0, !hasMinus {
                hasMinus = true
                result.append(ch)
                continue
            }
        };return result
    }

    private func parseValue(_ text: String?, fallback: Double) -> Double {
        let t = (text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if t.isEmpty { return fallback }
        return Double(t) ?? fallback
    }
    /// 终点展示：整数不带小数；小数保留 2 位（你想保留“输入的原始小数位数”也能做）
    private func formatTargetText(_ value: Double) -> String {
        if value.rounded() == value {
            return "\(Int(value))"
        };return String(format: "%.2f", value)
    }
}
