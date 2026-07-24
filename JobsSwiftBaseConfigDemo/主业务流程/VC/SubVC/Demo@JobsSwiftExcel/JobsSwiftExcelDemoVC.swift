//
//  JobsSwiftExcelDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import UIKit

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsSwiftExcel
import JobsSwiftUILabelScrolling
import SnapKit

final class JobsSwiftExcelDemoVC: BaseVC {
    private typealias DemoSheet = (
        title: String,
        columns: [JobsSwiftExcelColumn],
        freezeThroughColumn: Int?,
        rows: [JobsSwiftExcelRow]
    )
    private let sheets: [DemoSheet] = [
        (
            title: "季度销售数据｜冻结第 0 列，右侧月份横向拖动",
            columns: ["城市", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月"].map {
                JobsSwiftExcelColumn(title: $0, width: $0 == "城市" ? 104 : 112)
            },
            freezeThroughColumn: 0,
            rows: [
                JobsSwiftExcelRow(values: ["深圳", "128", "146", "158", "171", "189", "203", "218", "236"]),
                JobsSwiftExcelRow(values: ["上海", "116", "134", "149", "163", "177", "195", "210", "229"]),
                JobsSwiftExcelRow(values: ["北京", "109", "121", "138", "152", "168", "181", "199", "214"]),
                JobsSwiftExcelRow(values: ["成都", "93", "105", "117", "126", "142", "156", "173", "188"])
            ]
        ),
        (
            title: "Office 式冻结｜冻结第 1 列时，第 0、1 列一起固定",
            columns: ["域", "服务", "可用率", "P50", "P95", "P99", "QPS", "错误率", "负责人"].map {
                JobsSwiftExcelColumn(title: $0, width: $0 == "服务" ? 132 : 104)
            },
            freezeThroughColumn: 1,
            rows: [
                JobsSwiftExcelRow(values: ["用户", "用户中心", "99.99%", "32ms", "88ms", "142ms", "860", "0.02%", "Jobs"]),
                JobsSwiftExcelRow(values: ["交易", "订单中心", "99.95%", "45ms", "121ms", "206ms", "620", "0.08%", "Jobs"]),
                JobsSwiftExcelRow(values: ["交易", "支付网关", "99.98%", "51ms", "136ms", "248ms", "540", "0.03%", "Jobs"])
            ]
        ),
        (
            title: "四种固定格展示｜缩放、单行省略、多行省略、滚动",
            columns: [
                JobsSwiftExcelColumn(title: "模式", width: 108),
                JobsSwiftExcelColumn(title: "固定宽度内容区", width: 176)
            ],
            freezeThroughColumn: 0,
            rows: [
                JobsSwiftExcelRow(cells: [
                    JobsSwiftExcelCell(text: "缩小字体"),
                    JobsSwiftExcelCell(text: "内容很长时自动缩小字号直到尽量完整显示", textDisplayMode: .scaleToFit)
                ]),
                JobsSwiftExcelRow(cells: [
                    JobsSwiftExcelCell(text: "单行省略"),
                    JobsSwiftExcelCell(text: "不缩小字号，保持一行，超出后在尾部显示省略号", textDisplayMode: .singleLineTailTruncation)
                ]),
                JobsSwiftExcelRow(cells: [
                    JobsSwiftExcelCell(text: "多行省略"),
                    JobsSwiftExcelCell(text: "不缩小字号，允许两行显示；两行仍放不下时，最后一行尾部使用省略号", textDisplayMode: .multiLineTailTruncation)
                ]),
                JobsSwiftExcelRow(cells: [
                    JobsSwiftExcelCell(text: "滚动展示"),
                    JobsSwiftExcelCell(text: "UILabel+Scrolling 使用 CoreText 完整滚动展示这一段超长文字", textDisplayMode: .scrolling)
                ])
            ]
        )
    ]
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .bySeparatorStyle(.none)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(320)
            .byRegisterCell(JobsSwiftExcelDemoCell.self)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        byGKMaxPopDistance(24)
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "JobsSwiftExcel".tr)
        tableView.byVisible(true)
    }
}

extension JobsSwiftExcelDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sheets.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.byDequeueReusableCell(withType: JobsSwiftExcelDemoCell.self, for: indexPath)
        let sheet = sheets[indexPath.row]
        cell.configure(
            title: sheet.title,
            columns: sheet.columns,
            rows: sheet.rows,
            freezeThroughColumn: sheet.freezeThroughColumn
        ) { context in
            print("JobsSwiftExcel selected row=\(context.row) column=\(context.column) value=\(context.value)")
        };return cell
    }
}
