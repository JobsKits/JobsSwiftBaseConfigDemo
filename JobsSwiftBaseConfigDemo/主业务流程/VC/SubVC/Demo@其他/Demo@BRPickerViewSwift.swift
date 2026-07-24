//
//  Demo@BRPickerViewSwift.swift
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

import JobsInheritance
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import JobsToast
import JobsTextTools
import JobsSwiftAppTools
import JobsBy3rdTools
import SnapKit
import GKNavigationBarSwift
import BRPickerViewSwift

final class BRPickerDemoVC: BaseVC {
    private static func applyAdaptiveTheme(_ theme: BRPickerTheme,
                                           accentColor: UIColor,
                                           autoSelect: Bool = false) {
        theme
            .byPanelBackgroundColor(JobsCor.systemGroupedBackground)
            .byToolbarBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byTitleColor(JobsCor.label)
            .byButtonColor(accentColor)
            .byMaskColor(JobsCor.black.withAlphaComponent(0.55))
            .byPickerTextColor(JobsCor.secondaryLabel)
            .byPickerSelectedTextColor(JobsCor.label)
            .byAutoSelect(autoSelect)
    }

    /// 文本：单列（学历）
    private lazy var textSinglePicker: BRStringPicker = { [unowned self] in
        BRStringPicker()
            .byDataSource(["大专以下".tr, "大专".tr, "本科".tr, "硕士".tr, "博士".tr, "博士后".tr])
            .bySelectedIndex(2)
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemBlue)
                theme.byPickerFont(JobsFont.systemFont(ofSize: 20))
            }
            .byToolbar { cfg in
                cfg.byTitle("学历".tr)
                    .byCancelText("取消")
                    .byConfirmText("完成")
            }
            .byAnimation(.spring)
            .byResult { value in
                ("单列：%@".tr(value)).toast
            }
    }()
    /// 文本：多列（尺码/颜色）
    private lazy var textMultiPicker: BRMultiColumnPicker = { [unowned self] in
        BRMultiColumnPicker()
            .byColumns([
                ["S".tr, "M".tr, "L".tr, "XL"],
                ["黑".tr, "白".tr, "蓝".tr, "粉".tr]
            ])
            .bySelectedRows([1, 2])
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemBlue)
            }
            .byToolbar { cfg in
                cfg.byTitle("尺码/颜色".tr)
                    .byCancelText("取消")
                    .byConfirmText("完成")
            }
            .byAnimation(.slide)
            .byResult { values in
                ("多列：\(values.joined(separator: " / "))（index=?）").toast
            }
    }()
    /// 文本：三级联动（省/市/区）
    private lazy var textCascadePicker: BRAreaPicker = { [unowned self] in
        BRAreaPicker()
            .byDataSource([
                .init(name: "浙江省".tr, children: [
                    .init(name: "杭州市".tr, children: [
                        .init(name: "西湖区".tr),
                        .init(name: "滨江区".tr),
                        .init(name: "拱墅区".tr)
                    ]),
                    .init(name: "宁波市".tr, children: [
                        .init(name: "鄞州区".tr),
                        .init(name: "海曙区".tr)
                    ])
                ]),
                .init(name: "江苏省".tr, children: [
                    .init(name: "南京市".tr, children: [
                        .init(name: "玄武区".tr),
                        .init(name: "鼓楼区".tr)
                    ])
                ])
            ])
            .bySelect(.init(province: "浙江省".tr, city: "杭州市".tr, district: "滨江区".tr))
            .byTheme { theme in
                Self.applyAdaptiveTheme(
                    theme,
                    accentColor: JobsCor.systemBlue,
                    autoSelect: true
                )
            }
            .byToolbar { cfg in
                cfg.byTitle("选择地区".tr)
                    .byCancelText("取消")
                    .byConfirmText("完成")
            }
            .byAnimation(.spring)
            .byResult { sel in
                let text = [sel.province, sel.city, sel.district].compactMap { $0 }.joined(separator: " / ")
                ("联动：\(text)").toast
            }
    }()
    /// 日期：系统 Date（年月日）
    private lazy var dateSysDatePicker: BRSystemDatePicker = { [unowned self] in
        BRSystemDatePicker()
            .byTitle("出生日".tr)
            .bySelectDate(Date())
            .byMinDate(Calendar.current.date(byAdding: .year, value: -80, to: Date()))
            .byMaxDate(Date())
            .byMinuteInterval(1)
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemIndigo)
            }
            .byToolbar { cfg in
                cfg.byTitle("出生日".tr).byCancelText("取消").byConfirmText("完成")
            }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("系统 Date：\(fmt(dt, "yyyy-MM-dd"))").toast
            }
    }()
    /// 日期：系统 Date & Time
    private lazy var dateSysDateTimePicker: BRSystemDateTimePicker = { [unowned self] in
        BRSystemDateTimePicker()
            .byTitle("开会时间".tr)
            .bySelectDate(Date())
            .byMinuteInterval(5)
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemIndigo)
            }
            .byToolbar { $0.byTitle("开会时间".tr).byCancelText("取消").byConfirmText("完成") }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("系统 Date&Time：\(fmt(dt, "yyyy-MM-dd HH:mm"))").toast
            }
    }()
    /// 日期：系统 Time（12h）
    private lazy var dateSysTimePicker: BRSystemTimePicker = { [unowned self] in
        BRSystemTimePicker()
            .byTitle("提醒时间".tr)
            .bySelectDate(Date())
            .byUse12HourClock(true)
            .byMinuteInterval(10)
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemIndigo)
            }
            .byToolbar { $0.byTitle("提醒时间".tr).byCancelText("取消").byConfirmText("完成") }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("系统 Time：\(fmt(dt, "HH:mm"))").toast
            }
    }()
    /// 日期：系统 CountDownTimer
    private lazy var dateSysCountPicker: BRSystemCountDownPicker = { [unowned self] in
        BRSystemCountDownPicker()
            .byTitle("倒计时".tr)
            .bySelectDate(Date())
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemIndigo)
            }
            .byToolbar { $0.byTitle("倒计时".tr).byCancelText("取消").byConfirmText("完成") }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("系统 CountDownTimer：\(fmt(dt, "HH:mm"))").toast
            }
    }()
    /// 日期：自定义 YMD（年月日）
    private lazy var dateYMDPicker: BRDatePicker = { [unowned self] in
        BRDatePicker()
            .byMode(.ymd)
            .bySelectDate(Date())
            .byToolbar { $0.byTitle("生日（YMD）".tr).byCancelText("取消").byConfirmText("完成") }
            .byTheme { theme in
                Self.applyAdaptiveTheme(theme, accentColor: JobsCor.systemTeal)
            }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("自定义 YMD：\(fmt(dt, "yyyy-MM-dd"))").toast
            }
    }()
    /// 日期：自定义 YM（年月）
    private lazy var dateYMPicker: BRDatePicker = { [unowned self] in
        BRDatePicker()
            .byMode(.ym)
            .bySelectDate(Date())
            .byToolbar { $0.byTitle("账期（月度）".tr).byCancelText("取消").byConfirmText("完成") }
            .byTheme { Self.applyAdaptiveTheme($0, accentColor: JobsCor.systemTeal) }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("自定义 YM：\(fmt(dt, "yyyy-MM"))").toast
            }
    }()
    /// 日期：自定义 Y（年）
    private lazy var dateYPicker: BRDatePicker = { [unowned self] in
        BRDatePicker()
            .byMode(.y)
            .bySelectDate(Date())
            .byToolbar { $0.byTitle("年份".tr).byCancelText("取消").byConfirmText("完成") }
            .byTheme { Self.applyAdaptiveTheme($0, accentColor: JobsCor.systemTeal) }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("自定义 Y：\(fmt(dt, "yyyy"))").toast
            }
    }()
    /// 日期：自定义 MD（月日）
    private lazy var dateMDPicker: BRMonthDayPicker = { [unowned self] in
        BRMonthDayPicker()
            .bySelectDate(Date())
            .byToolbar { $0.byTitle("纪念日（月/日）".tr).byCancelText("取消").byConfirmText("完成") }
            .byTheme { Self.applyAdaptiveTheme($0, accentColor: JobsCor.systemTeal) }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("自定义 MD：\(fmt(dt, "MM-dd"))").toast
            }
    }()
    /// 日期：自定义 HM（时:分，步进 = 5）
    private lazy var dateHMPicker: BRHourMinutePicker = { [unowned self] in
        BRHourMinutePicker()
            .byMinuteInterval(5)
            .bySelectDate(Date())
            .byToolbar { $0.byTitle("提醒（时:分）".tr).byCancelText("取消").byConfirmText("完成") }
            .byTheme { Self.applyAdaptiveTheme($0, accentColor: JobsCor.systemTeal) }
            .byResult { [weak self] dt in
                guard let self else { return }
                ("自定义 HM：\(fmt(dt, "HH:mm"))").toast
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

    private lazy var secText: UILabel = {
        UILabel()
            .byText("文本选择器（BRTextPickerView）".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalToSuperview()
                make.left.right.equalToSuperview()
            }
    }()

    private lazy var secSys: UILabel = {
        UILabel()
            .byText("日期选择器（系统样式）".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnCascade.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
            }
    }()

    private lazy var secCustom: UILabel = {
        UILabel()
            .byText("日期选择器（自定义样式）".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { [weak self] make in
                guard let self else { return }
                make.top.equalTo(self.btnSysCount.snp.bottom).offset(12)
                make.left.right.equalToSuperview()
            }
    }()

    private lazy var btnSingle: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemBlue)
            .byTitle("单列（学历）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.textSinglePicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemBlue)
            .byTitle("多列（尺码/颜色）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                textMultiPicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemBlue)
            .byTitle("三级联动（省/市/区）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                textCascadePicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemIndigo)
            .byTitle("系统：Date（年月日）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                dateSysDatePicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemIndigo)
            .byTitle("系统：Date & Time".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                dateSysDateTimePicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemIndigo)
            .byTitle("系统：Time（12h）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateSysTimePicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemIndigo)
            .byTitle("系统：CountDownTimer".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateSysCountPicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemTeal)
            .byTitle("自定义：YMD（年月日）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateYMDPicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemTeal)
            .byTitle("自定义：YM（年月）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateYMPicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemTeal)
            .byTitle("自定义：Y（年）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateYPicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemTeal)
            .byTitle("自定义：MD（月日）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateMDPicker.byPresent(in: self.view)
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
            .byBackgroundColor(JobsCor.systemTeal)
            .byTitle("自定义：HM（时:分，步进=5）".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.dateHMPicker.byPresent(in: self.view)
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
        _ = [scrollView, contentView,
             secText, btnSingle, btnMulti, btnCascade,
             secSys, btnSysDate, btnSysDateTime, btnSysTime, btnSysCount,
             secCustom, btnYMD, btnYM, btnY, btnMD, btnHM]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "Demo@BRPickerViewSwift")
    }
}
