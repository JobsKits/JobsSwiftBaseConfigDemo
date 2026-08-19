//
//  JobsSwiftCalendarDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftCalendar
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftCalendarDemoVC: BaseVC {
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter.jobsMake { _ in }
        formatter
            .byDateFormat("dd")
            .byLocale(.current)
        return formatter
    }()

    private lazy var holidayFormatter: DateFormatter = {
        let formatter = DateFormatter.jobsMake { _ in }
        formatter
            .byDateFormat("dd/MM")
            .byLocale(.current)
        return formatter
    }()

    private lazy var selectedFormatter: DateFormatter = {
        let formatter = DateFormatter.jobsMake { _ in }
        formatter
            .byDateFormat("yyyy年MM月dd日")
            .byLocale(.current)
        return formatter
    }()

    private lazy var holidayMap: [String: String] = [
        "01/01": "新年".tr,
        "05/04": "清明节".tr,
        "01/05": "劳动节".tr,
        "04/06": "端午节".tr,
        "01/10": "国庆节".tr,
        "13/09": "中秋节".tr,
        "25/12": "圣诞节".tr,
        "30/11": "博尼法西奥日".tr,
        "12/06": "独立日".tr,
        "09/04": "勇士日".tr,
        "01/11": "万灵节".tr,
        "30/12": "黎刹日".tr
    ]

    private lazy var calendarView: JobsSwiftCalendar = {
        let calendar = JobsSwiftCalendar()
        calendar.dataSource = self
        calendar.delegate = self
        calendar.appearanceDelegate = self
        calendar.allowsMultipleSelection = true
        calendar.swipeToChooseEnabled = true
        calendar.jobsAutomaticallyInvalidateLayoutOnBoundsChange = true
        calendar.jobsReloadDataAfterBoundsChange = true
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        calendar.appearance.headerDateFormat = "yyyy年MM月"
        calendar.appearance.caseOptions = [.headerUsesUpperCase]
        calendar.appearance.headerTitleFont = JobsFont.systemFont(ofSize: 20, weight: .regular)
        calendar.appearance.headerTitleColor = JobsCor.label
        calendar
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byMasksToBounds(true)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(16)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
                }
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(380)
            };return calendar
    }()

    private lazy var selectedLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("请选择日期".tr)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(calendarView.snp.bottom).offset(18)
                make.left.equalTo(calendarView).offset(12)
                make.right.equalTo(calendarView).offset(-12)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsSwiftCalendar".tr)
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        calendarView.byVisible(true)
        selectedLabel.byVisible(true)
        calendarView.jobsReloadDataSafely()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarView.jobsInvalidateCalendarLayout()
    }
}

extension JobsSwiftCalendarDemoVC: JobsSwiftCalendarDataSource {
    func calendar(_ calendar: JobsSwiftCalendar, titleFor date: Date) -> String? {
        dayFormatter.string(from: date)
    }

    func calendar(_ calendar: JobsSwiftCalendar, subtitleFor date: Date) -> String? {
        holidayMap[holidayFormatter.string(from: date)]
    }

    func minimumDate(for calendar: JobsSwiftCalendar) -> Date {
        Foundation.Calendar.current.startOfDay(for: Date(timeIntervalSinceNow: -365 * 24 * 60 * 60))
    }

    func maximumDate(for calendar: JobsSwiftCalendar) -> Date {
        Foundation.Calendar.current.startOfDay(for: Date(timeIntervalSinceNow: 365 * 24 * 60 * 60))
    }

    func calendar(_ calendar: JobsSwiftCalendar, numberOfEventsFor date: Date) -> Int {
        holidayMap[holidayFormatter.string(from: date)] == nil ? 0 : 1
    }
}

extension JobsSwiftCalendarDemoVC: JobsSwiftCalendarDelegate {
    func calendar(_ calendar: JobsSwiftCalendar,
                  didSelect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) {
        selectedLabel.byText("已选择：".tr + selectedFormatter.string(from: date))
    }

    func calendar(_ calendar: JobsSwiftCalendar,
                  didDeselect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) {
        selectedLabel.byText("已取消：".tr + selectedFormatter.string(from: date))
    }

    func calendar(_ calendar: JobsSwiftCalendar,
                  boundingRectWillChange bounds: CGRect,
                  animated: Bool) {
        calendar.snp.updateConstraints { make in
            make.height.equalTo(bounds.height)
        }
        view.layoutIfNeeded()
    }
}

extension JobsSwiftCalendarDemoVC: JobsSwiftCalendarDelegateAppearance {
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  selectionColorFor date: Date) -> UIColor? {
        holidayMap[holidayFormatter.string(from: date)] == nil ? nil : JobsCor.systemOrange
    }
}
