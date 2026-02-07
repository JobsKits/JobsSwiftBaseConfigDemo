//
//  Demo@BRPickerViewSwift.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import BRPickerViewSwift
import JobsInheritance
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsToast
import JobsTextTools
import JobsSwiftAppTools
import JobsBy3rdTools

final class BRPickerDemoVC: BaseVC {
    /// 文本：单列（学历）
    private lazy var textSinglePicker: BRTextPickerView = { [unowned self] in
        BRTextPickerView()
            .byBrMode(.single)
            .byBrTitle("学历".tr)
            .byBrStyle { style in
                style
                    .byPanelBackgroundColor(.yellow)               // ✅ 设置底部面板背景色
                    .byToolbarBackgroundColor(.systemCyan)         // ✅ 设置顶部工具条背景色
                    .byTitleColor(.white)                          // ✅ 设置标题文字颜色
                    .byButtonColor(.systemRed)                     // ✅ 设置取消/完成按钮颜色
                    .byMaskColor(.black.withAlphaComponent(0.55))  // ✅ 设置蒙层背景色（弹出时的遮罩）
                    .byPickerTextColor(.red)                       // ✅ 未选中行文字颜色
                    .byPickerTextSelectedColor(.blue)              // ✅ 选中行文字颜色
                    .byPickerTextFont(.systemFont(ofSize: 20))     // ✅ 行文字字体
            }
            .byBrDataSource(["大专以下".tr, "大专".tr, "本科".tr, "硕士".tr, "博士".tr, "博士后".tr])
            .byBrSelectIndex(2)
            .byBrOnSingle { m, idx in
                ("单列：\(m?.text ?? "-")（index=\(idx)）").toast
            }
    }()
    /// 文本：多列（尺码/颜色）
    private lazy var textMultiPicker: BRTextPickerView = { [unowned self] in
        BRTextPickerView()
            .byBrMode(.multi)
            .byBrTitle("尺码/颜色".tr)
            .byBrMultiDataSource([
                ["S".tr, "M".tr, "L".tr, "XL"],
                ["黑".tr, "白".tr, "蓝".tr, "粉".tr]
            ])
            .byBrSelectIndexs([1, 2])
            .byBrStyle { $0.isAutoSelect = false }
            .byBrOnMulti { ms, idxs in
                ("多列：\(ms.map { $0.text }.joined(separator: " / "))（index=\(idxs)）").toast
            }
    }()
    /// 文本：三级联动（省/市/区）
    private lazy var textCascadePicker: BRTextPickerView = { [unowned self] in
        BRTextPickerView()
            .byBrMode(.cascade)
            .byBrTitle("选择地区".tr)
            .byBrCascadeData([
                RegionNode(text: "浙江省".tr, children: [
                    RegionNode(text: "杭州市".tr, children: [
                        RegionNode(text: "西湖区".tr),
                        RegionNode(text: "滨江区".tr),
                        RegionNode(text: "拱墅区".tr)
                    ]),
                    RegionNode(text: "宁波市".tr, children: [
                        RegionNode(text: "鄞州区".tr),
                        RegionNode(text: "海曙区".tr)
                    ])
                ]),
                RegionNode(text: "江苏省".tr, children: [
                    RegionNode(text: "南京市".tr, children: [
                        RegionNode(text: "玄武区".tr),
                        RegionNode(text: "鼓楼区".tr)
                    ])
                ])
            ])
            .byBrCascadeSelectIndexs([0, 0, 1])
            .byBrStyle { $0.isAutoSelect = true }
            .byBrOnCascade { ms, idxs in
                ("联动：\(ms.map { $0.text }.joined(separator: " / "))（index=\(idxs)）").toast
            }
    }()
    /// 日期：系统 Date（年月日）
    private lazy var dateSysDatePicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.date)
            .byBrTitle("出生日".tr)
            .byBrSelectDate(Date())
            .byBrMinDate(Calendar.current.date(byAdding: .year, value: -80, to: Date()))
            .byBrMaxDate(Date())
            .byBrStyle { $0.minuteInterval = 1 }
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("系统 Date：\(dt.map { fmt($0, "yyyy-MM-dd") } ?? "-")").toast
            }
    }()
    /// 日期：系统 Date & Time
    private lazy var dateSysDateTimePicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.dateAndTime)
            .byBrTitle("开会时间".tr)
            .byBrSelectDate(Date())
            .byBrStyle { $0.minuteInterval = 5 }
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("系统 Date&Time：\(dt.map { fmt($0, "yyyy-MM-dd HH:mm") } ?? "-")").toast
            }
    }()
    /// 日期：系统 Time（12h）
    private lazy var dateSysTimePicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.time)
            .byBrTitle("提醒时间".tr)
            .byBrSelectDate(Date())
            .byBrStyle {
                $0.use12HourClock = true
                $0.minuteInterval = 10
            }
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("系统 Time：\(dt.map { fmt($0, "HH:mm") } ?? "-")").toast
            }
    }()
    /// 日期：系统 CountDownTimer
    private lazy var dateSysCountPicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.countDownTimer)
            .byBrTitle("倒计时".tr)
            .byBrSelectDate(Date())
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("系统 CountDownTimer：\(dt.map { fmt($0, "HH:mm") } ?? "-")").toast
            }
    }()
    /// 日期：自定义 YMD（年月日）
    private lazy var dateYMDPicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.ymd)
            .byBrTitle("生日（YMD）".tr)
            .byBrSelectDate(Date())
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("自定义 YMD：\(dt.map { fmt($0, "yyyy-MM-dd") } ?? "-")").toast
            }
    }()
    /// 日期：自定义 YM（年月）
    private lazy var dateYMPicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.ym)
            .byBrTitle("账期（月度）".tr)
            .byBrSelectDate(Date())
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("自定义 YM：\(dt.map { fmt($0, "yyyy-MM") } ?? "-")").toast
            }
    }()
    /// 日期：自定义 Y（年）
    private lazy var dateYPicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.y)
            .byBrTitle("年份".tr)
            .byBrSelectDate(Date())
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("自定义 Y：\(dt.map { fmt($0, "yyyy") } ?? "-")").toast
            }
    }()
    /// 日期：自定义 MD（月日）
    private lazy var dateMDPicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.md)
            .byBrTitle("纪念日（月/日）".tr)
            .byBrSelectDate(Date())
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("自定义 MD：\(dt.map { fmt($0, "MM-dd") } ?? "-")").toast
            }
    }()
    /// 日期：自定义 HM（时:分，步进 = 5）
    private lazy var dateHMPicker: BRDatePickerView = { [unowned self] in
        BRDatePickerView()
            .byBrMode(.hm)
            .byBrTitle("提醒（时:分）".tr)
            .byBrSelectDate(Date())
            .byBrStyle { $0.minuteInterval = 5 }
            .byBrOnResult { [weak self] dt in
                guard let self else { return }
                ("自定义 HM：\(dt.map { fmt($0, "HH:mm") } ?? "-")").toast
            }
    }()

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(YES)
            .byAddTo(view) { [unowned self] make in
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            }
    }()
    /// ScrollView 内容承载视图（替代 UIStackView，所有 UI 直接添加到该视图上）
    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [weak self] make in
                guard let self else { return }
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalToSuperview().inset(16)
                } else {
                    make.edges.equalToSuperview().inset(16)
                }
                // 关键：固定内容宽度，否则 ScrollView 会横向滚动/约束告警
                make.width.equalTo(self.scrollView.frameLayoutGuide).offset(-32)
            }
    }()

    private lazy var resultCard: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(12)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalToSuperview()
                make.left.right.equalToSuperview()
                make.height.equalTo(72)
            }
    }()

    private lazy var secText: UILabel = {
        UILabel()
            .byText("文本选择器（BRTextPickerView）".tr)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.resultCard.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
            }
    }()

    private lazy var secSys: UILabel = {
        UILabel()
            .byText("日期选择器（系统样式）".tr)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnCascade.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
            }
    }()

    private lazy var secCustom: UILabel = {
        UILabel()
            .byText("日期选择器（自定义样式）".tr)
            .byFont(.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnSysCount.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
            }
    }()

    private lazy var btnSingle: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemBlue)
            .byTitle("单列（学历）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.textSinglePicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.secText.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnMulti: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemBlue)
            .byTitle("多列（尺码/颜色）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                textMultiPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnSingle.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnCascade: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemBlue)
            .byTitle("三级联动（省/市/区）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                textCascadePicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnMulti.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnSysDate: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemIndigo)
            .byTitle("系统：Date（年月日）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                dateSysDatePicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.secSys.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnSysDateTime: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemIndigo)
            .byTitle("系统：Date & Time".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                dateSysDateTimePicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnSysDate.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnSysTime: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemIndigo)
            .byTitle("系统：Time（12h）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateSysTimePicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnSysDateTime.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnSysCount: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemIndigo)
            .byTitle("系统：CountDownTimer".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateSysCountPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnSysTime.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnYMD: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemTeal)
            .byTitle("自定义：YMD（年月日）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateYMDPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.secCustom.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnYM: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemTeal)
            .byTitle("自定义：YM（年月）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateYMPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnYMD.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnY: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemTeal)
            .byTitle("自定义：Y（年）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateYPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnYM.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnMD: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemTeal)
            .byTitle("自定义：MD（月日）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateMDPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnY.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
    }()

    private lazy var btnHM: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemTeal)
            .byTitle("自定义：HM（时:分，步进=5）".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateHMPicker.byBrPresent(in: self.view)
            }
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnMD.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
                // 关键：最后一个控件把 contentView 的 bottom 撑开
                make.bottom.equalToSuperview()
            }
    }()

    override func loadView() {
        super.loadView()
        _ = [scrollView, contentView, resultCard,
             secText, btnSingle, btnMulti, btnCascade,
             secSys, btnSysDate, btnSysDateTime, btnSysTime, btnSysCount,
             secCustom, btnYMD, btnYM, btnY, btnMD, btnHM]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        jobsSetupGKNav(title: "Demo@BRPickerViewSwift")
    }
}
