//
//  JobsOCParityRandomNumberDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

final class JobsRandomNumberDemoVC: BaseVC {

    private struct RandomDemoItem {
        let title: String
        let range: String
        let generator: () -> Int
    }

    private let items: [RandomDemoItem] = [
        .init(title: "JobsBaseRandomNoContainBorderValue(20)", range: "0 ≤ n < 20", generator: { Int.random(in: 0..<20) }),
        .init(title: "JobsBaseRandomContainBorderValue(30)", range: "0 ≤ n ≤ 30", generator: { Int.random(in: 0...30) }),
        .init(title: "JobsBaseRandomOffsetValueWithNoContainBorderValue(4, 9)", range: "4 ≤ n < 9", generator: { Int.random(in: 4..<9) }),
        .init(title: "JobsBaseRandomOffsetValueWithContainBorderValue(4, 9)", range: "4 ≤ n ≤ 9", generator: { Int.random(in: 4...9) }),
        .init(title: "JobsRandomNumber(2, 9)", range: "2 ≤ n ≤ 9", generator: { Int.random(in: 2...9) }),
        .init(title: "JobsRandomXY(3, 7)", range: "3 ≤ n ≤ 7", generator: { Int.random(in: 3...7) }),
        .init(title: "JobsRandom0_100()", range: "0 ≤ n < 100", generator: { Int.random(in: 0..<100) }),
        .init(title: "JobsRandom0__100()", range: "0 ≤ n ≤ 100", generator: { Int.random(in: 0...100) }),
        .init(title: "JobsRandom100_200()", range: "100 ≤ n < 200", generator: { Int.random(in: 100..<200) }),
        .init(title: "JobsRandom100__200()", range: "100 ≤ n ≤ 200", generator: { Int.random(in: 100...200) })
    ]

    private var values: [Int] = []

    private lazy var refreshButton: UIButton = {
        UIButton.sys()
            .byImage("arrow.clockwise".sysImg, for: .normal)
            .byTintColor(JobsCor.label)
            .byBackgroundColor(JobsCor.clear, for: .normal)
            .onTap { [weak self] _ in
                self?.reloadRandomValues()
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(78)
            .byBackgroundColor(JobsCor.clear)
            .byTableFooterView(UIView())
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(UIColor(hex: 0xFFEEDD))
        jobsSetupGKNav(title: "随机数测试模块".tr, rightButtons: [refreshButton])
        tableView.byVisible(YES)
        reloadRandomValues()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        reloadRandomValues()
    }

    private func reloadRandomValues() {
        values = items.map { $0.generator() }
        tableView.byReloadData()
    }
}

extension JobsRandomNumberDemoVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "JobsRandomNumberCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        let item = items[indexPath.row]
        let value = values.indices.contains(indexPath.row)
            ? values[indexPath.row]
            : item.generator()
        cell.textLabel?
            .byText(item.title)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
        cell.detailTextLabel?
            .byText("\(item.range)   结果：\(value)")
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.secondaryLabel)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reloadRandomValues()
    }
}
