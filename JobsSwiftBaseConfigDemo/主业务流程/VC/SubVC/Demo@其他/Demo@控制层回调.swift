//
//  Demo@控制层回调.swift
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

import JobsSwiftBaseDefines
import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class JobsControlEventsDemoVC: BaseVC {
    // 统一用一个垂直栈承载所有 Demo
    private lazy var stack: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.vertical)
            .byAlignment(.fill)
            .bySpacing(14)
            .byDistribution(.equalSpacing)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(10.h)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(16)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(
            title: "UIControl/UIButton 事件链式 Demo".tr,
        )
        view.byBackgroundColor(JobsCor.systemBackground)
        buildDemos()
        // 点击空白收键盘
        view.addGestureRecognizer(
            UITapGestureRecognizer
                .byConfig { [unowned self] gr in
                    self.view.endEditing(true)
                }
                .byCancelsTouchesInView(false)
        )
    }
}

extension JobsControlEventsDemoVC {
    private func buildDemos() {
        stack.byAlpha(1)
        demo_Switch_onJobsChange()
        demo_DatePicker_onJobsChange()
        demo_Slider_onJobsChange()
        demo_TextField_onJobsEvent()
        demo_Button_onTap()
    }
    // MARK: - 26.1 在 UIControl 层的演示
    /// UISwitch → onJobsChange
    private func demo_Switch_onJobsChange() {
        addSectionTitle("26.1-1️⃣  UISwitch：onJobsChange(.valueChanged)")
        stack.addArrangedSubview(UISwitch.jobsMake { _ in }
            .onJobsChange { (sw: UISwitch) in
                print("开关状态：\(sw.isOn)")
            })
    }
    /// UIDatePicker → onJobsChange
    private func demo_DatePicker_onJobsChange() {
        addSectionTitle("26.1-2️⃣  UIDatePicker：onJobsChange(.valueChanged)")
        stack.addArrangedSubview(UIDatePicker.jobsMake { _ in }
            .byDatePickerMode(.date)
            .byPreferredDatePickerStyle(.wheels)
            .onJobsChange { (picker :UIDatePicker) in
                print("选择日期：\(picker.date)")
            })
    }
    /// UISlider → onJobsChange
    private func demo_Slider_onJobsChange() {
        addSectionTitle("26.1-3️⃣  UISlider：onJobsChange(.valueChanged)")
        stack.addArrangedSubview(UISlider.jobsMake { _ in }
            .byMinimumValue(0)
            .byMaximumValue(100)
            .byValue(30)
            .onJobsChange { (s:UISlider) in
                print("滑块值：\(s.value)")
            })
    }
    /// UITextField → onJobsEvent(.editingChanged)
    private func demo_TextField_onJobsEvent() {
        addSectionTitle("26.1-4️⃣  UITextField：onJobsEvent(.editingChanged)")
        stack.addArrangedSubview(UITextField.jobsMake { _ in }
            .byBorderStyle(.roundedRect)
            .byPlaceholder("输入点什么…".tr)
            .onJobsEvent(.editingChanged) { (tf:UITextField) in
            print("文字变化：\(tf.text ?? "")")
        })
    }
    // MARK: - 26.2 在 UIButton 层的演示（保留原有 onTap）
    private func demo_Button_onTap() {
        addSectionTitle("26.2 🔘 UIButton：onTap（UIButton 专属 UIAction）")
        stack.addArrangedSubview(
            UIButton.sys()
                // 普通文字：未选中状态标题
                .byTitle("显示".tr, for: .normal)
                // 选中状态标题
                .byTitle("隐藏".tr, for: .selected)
                // 文字颜色：区分状态
                .byTitleColor(JobsCor.systemBlue, for: .normal)
                .byTitleColor(JobsCor.systemRed, for: .selected)
                // 字体统一
                .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
                // 图标（SF Symbol）
                .byImage("eye.slash".sysImg, for: .normal)   // 未选中图标
                .byImage("eye".sysImg, for: .selected)       // 选中图标
                // 图文内边距
                .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                // 图标与文字间距
                .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                // 点按事件（统一入口）
                .onTap { btn in
                    btn.byToggleSelected()                  // 切换选中状态
                    print("👁")
                })
    }
    // MARK: - Helpers
    private func addSectionTitle(_ text: String) {
        stack.addArrangedSubview(UILabel.jobsMake { _ in }.byText(text)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel))
    }
}
