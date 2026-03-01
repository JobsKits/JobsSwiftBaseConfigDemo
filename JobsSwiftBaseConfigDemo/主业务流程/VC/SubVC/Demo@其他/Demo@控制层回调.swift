//
//  JobsControlEventsDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/10/01.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsByUIKit
import JobsTextTools
import JobsInheritance

final class JobsControlEventsDemoVC: BaseVC {
    // 统一用一个垂直栈承载所有 Demo
    private lazy var stack: UIStackView = {
        UIStackView()
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
            title: "UIControl/UIButton 事件链式 Demo",
        )
        view.backgroundColor = .systemBackground
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
        stack.addArrangedSubview(UISwitch()
            .onJobsChange { (sw: UISwitch) in
                print("开关状态：\(sw.isOn)")
            })
    }
    /// UIDatePicker → onJobsChange
    private func demo_DatePicker_onJobsChange() {
        addSectionTitle("26.1-2️⃣  UIDatePicker：onJobsChange(.valueChanged)")
        stack.addArrangedSubview(UIDatePicker()
            .byDatePickerMode(.date)
            .byPreferredDatePickerStyle(.wheels)
            .onJobsChange { (picker :UIDatePicker) in
                print("选择日期：\(picker.date)")
            })
    }
    /// UISlider → onJobsChange
    private func demo_Slider_onJobsChange() {
        addSectionTitle("26.1-3️⃣  UISlider：onJobsChange(.valueChanged)")
        stack.addArrangedSubview(UISlider()
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
        stack.addArrangedSubview(UITextField()
            .byBorderStyle(.roundedRect)
            .byPlaceholder("输入点什么…")
            .onJobsEvent(.editingChanged) { (tf:UITextField) in
            print("文字变化：\(tf.text ?? "")")
        })
    }
    // MARK: - 26.2 在 UIButton 层的演示（保留原有 onTap）
    private func demo_Button_onTap() {
        addSectionTitle("26.2 🔘 UIButton：onTap（UIButton 专属 UIAction）")
        stack.addArrangedSubview(
            UIButton(type: .system)
                // 普通文字：未选中状态标题
                .byTitle("显示", for: .normal)
                // 选中状态标题
                .byTitle("隐藏", for: .selected)
                // 文字颜色：区分状态
                .byTitleColor(.systemBlue, for: .normal)
                .byTitleColor(.systemRed, for: .selected)
                // 字体统一
                .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
                // 图标（SF Symbol）
                .byImage("eye.slash".sysImg, for: .normal)   // 未选中图标
                .byImage("eye".sysImg, for: .selected)       // 选中图标
                // 图文内边距
                .byContentEdgeInsets(UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8))
                // 图标与文字间距
                .byTitleEdgeInsets(UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6))
                // 点按事件（统一入口）
                .onTap { btn in
                    btn.isSelected.toggle()                  // 切换选中状态
                    print("👁")
                })
    }
    // MARK: - Helpers
    private func addSectionTitle(_ text: String) {
        stack.addArrangedSubview(UILabel().byText(text)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(.secondaryLabel))
    }
}
