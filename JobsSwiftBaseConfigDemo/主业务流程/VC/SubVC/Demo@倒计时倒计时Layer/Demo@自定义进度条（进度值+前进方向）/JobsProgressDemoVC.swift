//
//  JobsProgressDemoVC.swift
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

import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsInheritance
import JobsProgressBar
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift
/// Demo@自定义进度条（进度值+前进方向+拖动）

final class JobsProgressDemoVC: BaseVC {
    deinit {
        progressView.stopAutoProgress()
    }
    // MARK: - 状态
    private var lastAppliedPercent: CGFloat = 0
    // MARK: - UI 懒加载
    /// 使用说明（更直观，不再“单薄”）
    private lazy var tipsLabel: UILabel = {
        UILabel()
            .byTextAlignment(.left)
            .byNumberOfLines(0)
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 12, weight: .regular))
            .byText("""
            ✅ 用法：
            1）点「开始」：自动播放进度（头部持续旋转）
            2）点「停止」：停止播放（头部停止旋转）
            3）输入 0~100 点「设置」：动画到指定百分比（动画期间旋转）
            4）直接拖动进度条：实时更新进度（前进顺时针 / 后退逆时针）
            5）右侧开关：控制是否允许拖动
            """.tr)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(12)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
                }
                make.left.equalToSuperview().offset(20.w)
                make.right.equalToSuperview().inset(20.w)
            }
    }()
    /// 方向切换 SegmentedControl
    ///
    /// 0: 左 -> 右
    /// 1: 右 -> 左
    /// 2: 下 -> 上
    /// 3: 上 -> 下
    private lazy var directionSegment: UISegmentedControl = {
        UISegmentedControl(items: ["→", "←", "↑", "↓"])
            .bySelectedSegmentIndex(0)
            .onJobsChange { [weak self] (seg: UISegmentedControl) in
                guard let self else { return }
                switch seg.selectedSegmentIndex {
                case 0: progressView.direction = .leftToRight
                case 1: progressView.direction = .rightToLeft
                case 2: progressView.direction = .bottomToTop
                case 3: progressView.direction = .topToBottom
                default: break
                }
                // ✅ 换方向：停掉自动动画 & 进度归零
                progressView.stopAutoProgress()
                progressView.setProgress(0, animated: false)
                lastAppliedPercent = 0
                percentTextField.text = "0"
                stateLabel.byText("方向切换：已归零".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(tipsLabel.snp.bottom).offset(14)
                make.centerX.equalToSuperview()
            }
    }()
    /// 模式切换按钮：在 0→100 / 100→0 之间切换
    private lazy var modeToggleButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemOrange, for: .normal)
            .byTitle("模式：100→0".tr, for: .normal)   // 初始和 progressView.byValueMode(.countDown) 对齐
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
            .byCornerRadius(16)
            .onTap { [weak self] sender in
                guard let self else { return }

                let newMode: JobsValueMode
                let newTitle: String

                switch self.progressView.valueMode {
                case .countUp:
                    newMode = .countDown
                    newTitle = "模式：100→0"
                case .countDown:
                    newMode = .countUp
                    newTitle = "模式：0→100"
                }

                self.progressView.byValueMode(newMode)
                sender.byTitle(newTitle, for: .normal)

                // ✅ 切模式：停掉定时器 & 归零
                self.progressView.stopAutoProgress()
                self.progressView.setProgress(0, animated: false)

                self.lastAppliedPercent = 0
                self.percentTextField.text = "0"
                self.stateLabel.byText("模式切换：已归零".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(directionSegment.snp.bottom).offset(12)
                make.centerX.equalToSuperview()
                make.height.equalTo(32)
                make.width.greaterThanOrEqualTo(140)
            }
    }()
    /// 状态提示（拖动/播放/设置后的反馈）
    private lazy var stateLabel: UILabel = {
        UILabel()
            .byTextAlignment(.center)
            .byNumberOfLines(2)
            .byTextColor(.secondaryLabel)
            .byFont(.systemFont(ofSize: 13, weight: .medium))
            .byText("Ready".tr)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(modeToggleButton.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(20.w)
                make.right.equalToSuperview().inset(20.w)
            }
    }()
    /// 自定义进度条
    private lazy var progressView: JobsProgressBar = {
        JobsProgressBar()
            .byDirection(.leftToRight)
            .byValueMode(.countDown)
            .byTrackColor(.systemGray5)
            .byTrackHorizontalInset(0)
            .byTrackVerticalInset(0)
            .byTrackThickness(nil)
            .byAutoHideLabel(true)
            .byLabelMinVisibleHeight(18)
            .byLabelBackgroundColor(.secondarySystemBackground)
            .byLabelFont(.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
            /// ✅ 进度条“头”
            .byThumbImage("足球".img)
            .byThumbSize(CGSize(width: 20.h, height: 20.h))
            .byThumbCornerRadius(10.h)
            .byThumbContentMode(.scaleAspectFit)
            .byThumbOffset(UIOffset(horizontal: 0, vertical: 0))
            .byThumbFollowsFillStyle(true)
            .byThumbShadow(opacity: 0.25, radius: 6, offset: CGSize(width: 0, height: 2), color: .black)
            .byDraggable(YES)
            .byOnDragBegan({ [weak self] raw in
                guard let self else { return }
                let percent = self.displayPercent(fromRaw: raw)
                self.stateLabel.byText("拖动开始：\(Int(percent))%".tr)
            })
            /// ✅ 拖拽用法
            .byOnDragChanged({ [weak self] raw in
                guard let self else { return }
                let percent = self.displayPercent(fromRaw: raw)
                self.percentTextField.text = "\(Int(percent))"
                self.lastAppliedPercent = percent
                self.stateLabel.byText("拖动中：\(Int(percent))%".tr)
            })
            .byOnDragEnded({ [weak self] raw in
                guard let self else { return }
                let percent = self.displayPercent(fromRaw: raw)
                self.percentTextField.text = "\(Int(percent))"
                self.lastAppliedPercent = percent
                self.stateLabel.byText("拖动结束：\(Int(percent))%".tr)
            })
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(stateLabel.snp.bottom).offset(16.h)
                make.left.equalToSuperview().offset(40.w)
                make.right.equalToSuperview().inset(40.w)
                make.height.equalTo(20.h)
            }
    }()
    /// 输入百分比的文本框（0~100）
    private lazy var percentTextField: UITextField = {
        UITextField()
            .byBorderStyle(.roundedRect)
            .byKeyboardType(.numberPad)
            .byPlaceholder("输入 0~100".tr)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(progressView.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(40.w)
                make.height.equalTo(36)
                make.width.equalTo(120.w)
            }
    }()
    /// 点击“确定”后，动画到输入的百分比
    private lazy var applyButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemBlue, for: .normal)
            .byTitle("设置".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 14, weight: .medium))
            .byCornerRadius(8)
            .onTap { [weak self] _ in
                guard let self else { return }

                self.progressView.stopAutoProgress()

                if let clamped = self.progressView.setDisplayPercent(text: self.percentTextField.text, animated: true) {
                    self.percentTextField.text = String(format: "%.0f", clamped)
                    self.lastAppliedPercent = clamped
                    self.stateLabel.byText("设置进度：\(Int(clamped))%".tr)
                } else {
                    self.stateLabel.byText("输入不合法：请输入 0~100".tr)
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(percentTextField.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(72)
                make.centerY.equalTo(percentTextField.snp.centerY)
            }
    }()
    /// 拖动开关标题
    private lazy var dragTitleLabel: UILabel = {
        UILabel()
            .byText("可拖动".tr)
            .byFont(.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(.secondaryLabel)
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(applyButton.snp.right).offset(14)
                make.centerY.equalTo(percentTextField.snp.centerY)
            }
    }()
    /// 拖动开关
    private lazy var dragSwitch: UISwitch = {
        UISwitch()
            .byOn(YES)
            .byAddAction(for: .valueChanged) { [weak self] (sw: UISwitch) in
                guard let self else { return }
                self.progressView.byDraggable(sw.isOn)
                self.stateLabel.byText(sw.isOn ? "已开启拖动".tr : "已关闭拖动".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(dragTitleLabel.snp.right).offset(8)
                make.centerY.equalTo(dragTitleLabel.snp.centerY)
                make.right.lessThanOrEqualToSuperview().inset(40.w)
            }
    }()
    /// 开始按钮（自动播放）
    private lazy var startButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemGreen, for: .normal)
            .byTitle("开始".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.view.endEditing(true)
                // ✅ 自动播放前：停掉旧动画，归零更直观
                self.progressView.stopAutoProgress()
                    .setProgress(0, animated: false)
                self.lastAppliedPercent = 0
                self.percentTextField.byText("0")
                self.progressView.startAutoProgress(
                    fromZero: true,
                    step: 0.01,
                    interval: 0.03,
                    animated: true
                )
                self.stateLabel.byText("自动播放中...".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(percentTextField.snp.bottom).offset(18)
                make.left.equalToSuperview().offset(40.w)
                make.height.equalTo(40)
                make.width.equalTo(72)
            }
    }()
    /// 停止按钮
    private lazy var stopButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemRed, for: .normal)
            .byTitle("停止".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.progressView.stopAutoProgress()
                self.stateLabel.byText("已停止".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(startButton.snp.right).offset(12)
                make.centerY.equalTo(startButton.snp.centerY)
                make.height.equalTo(40)
                make.width.equalTo(72)
            }
    }()
    /// 随机按钮（演示“前进/后退会反向旋转”）
    private lazy var randomButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemPurple, for: .normal)
            .byTitle("随机".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.progressView.stopAutoProgress()

                let newPercent = CGFloat(Int.random(in: 0...100))
                self.lastAppliedPercent = newPercent
                self.percentTextField.text = "\(Int(newPercent))"

                _ = self.progressView.setDisplayPercent(newPercent, animated: true, duration: 0.35)
                self.stateLabel.byText("随机：\(Int(newPercent))%".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(stopButton.snp.right).offset(12)
                make.centerY.equalTo(stopButton.snp.centerY)
                make.height.equalTo(40)
                make.width.equalTo(72)
            }
    }()
    /// 回退按钮（强制往回跑，展示逆时针）
    private lazy var backButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemGray, for: .normal)
            .byTitle("回退".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.progressView.stopAutoProgress()

                // ✅ 往回退 20%，没有就退到 0
                let newPercent = max(0, self.lastAppliedPercent - 20)
                self.lastAppliedPercent = newPercent
                self.percentTextField.text = "\(Int(newPercent))"

                _ = self.progressView.setDisplayPercent(newPercent, animated: true, duration: 0.35)
                self.stateLabel.byText("回退：\(Int(newPercent))%".tr)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalTo(randomButton.snp.right).offset(12)
                make.centerY.equalTo(randomButton.snp.centerY)
                make.height.equalTo(40)
                make.width.equalTo(72)
                make.right.lessThanOrEqualToSuperview().inset(40.w)
            }
    }()
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "自定义进度条（含拖动）".tr)

        tipsLabel.byVisible(YES)
        directionSegment.byVisible(YES)
        modeToggleButton.byVisible(YES)
        stateLabel.byVisible(YES)

        progressView.byVisible(YES)
        percentTextField.byVisible(YES)
        applyButton.byVisible(YES)
        dragTitleLabel.byVisible(YES)
        dragSwitch.byVisible(YES)

        startButton.byVisible(YES)
        stopButton.byVisible(YES)
        randomButton.byVisible(YES)
        backButton.byVisible(YES)

        // 初始值对齐
        percentTextField.text = "0"
        stateLabel.byText("Ready".tr)
    }
}
// MARK: - 工具
extension JobsProgressDemoVC{
    /// 把 raw(0~1) 映射成 “显示百分比”(0~100)
    private func displayPercent(fromRaw raw: CGFloat) -> CGFloat {
        let clamped = max(0, min(raw, 1))
        let displayProgress: CGFloat
        switch progressView.valueMode {
        case .countUp:
            displayProgress = clamped
        case .countDown:
            displayProgress = 1 - clamped
        };return displayProgress * 100
    }
}
