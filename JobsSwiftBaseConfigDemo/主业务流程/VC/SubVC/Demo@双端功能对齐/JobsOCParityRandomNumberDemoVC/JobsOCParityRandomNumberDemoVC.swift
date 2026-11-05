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
import JobsSwiftDSL
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
        .init(title: "JobsBaseRandomNoContainBorderValue(20)",
              range: "0 ≤ n < 20",
              generator: {
            Int.random(in: 0 ..< 20)
        }),
        .init(title: "JobsBaseRandomContainBorderValue(30)",
              range: "0 ≤ n ≤ 30",
              generator: {
            Int.random(in: 0 ... 30)
        }),
        .init(title: "JobsBaseRandomOffsetValueWithNoContainBorderValue(4, 9)",
              range: "4 ≤ n < 9",
              generator: {
            Int.random(in: 4 ..< 9)
        }),
        .init(title: "JobsBaseRandomOffsetValueWithContainBorderValue(4, 9)",
              range: "4 ≤ n ≤ 9",
              generator: {
            Int.random(in: 4 ... 9)
        }),
        .init(title: "JobsRandomNumber(2, 9)",
              range: "2 ≤ n ≤ 9",
              generator: {
            Int.random(in: 2 ... 9)
        }),
        .init(title: "JobsRandomXY(3, 7)",
              range: "3 ≤ n ≤ 7",
              generator: {
            Int.random(in: 3 ... 7)
        }),
        .init(title: "JobsRandom0_100()",
              range: "0 ≤ n < 100",
              generator: {
            Int.random(in: 0 ..< 100)
        }),
        .init(title: "JobsRandom0__100()",
              range: "0 ≤ n ≤ 100",
              generator: {
            Int.random(in: 0 ... 100)
        }),
        .init(title: "JobsRandom100_200()",
              range: "100 ≤ n < 200",
              generator: {
            Int.random(in: 100 ..< 200)
        }),
        .init(title: "JobsRandom100__200()",
              range: "100 ≤ n ≤ 200",
              generator: {
            Int.random(in: 100 ... 200)
        })
    ]

    private var values: [Int] = []

#if DEBUG
    private var coverageTouchEndedCount = 0

    /// 只提供真实背景触摸区域，不绑定动作、不代调刷新方法。
    private final class CoverageTouchPad: UIView {

        weak var owner: JobsRandomNumberDemoVC?

        override var isAccessibilityElement: Bool {
            get {
                true
            }
            set {
                super.isAccessibilityElement = newValue
            }
        }

        override var accessibilityIdentifier: String? {
            get {
                "jobs.coverage.random.backgroundTouch"
            }
            set {
                super.accessibilityIdentifier = newValue
            }
        }

        override var accessibilityLabel: String? {
            get {
                "touchesEnded:\(owner?.coverageTouchEndedCount ?? 0)"
            }
            set {
                super.accessibilityLabel = newValue
            }
        }

        override var accessibilityValue: String? {
            get {
                owner?.values.map {
                    String($0)
                }.joined(separator: ",")
            }
            set {
                super.accessibilityValue = newValue
            }
        }
    }

    private func prepareCoverageTouchPad() {
        guard ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") else {
            return
        }
        let pad = CoverageTouchPad.jobsMake { pad in
            pad.owner = self
        }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(8)
                make.width.equalTo(220)
                make.height.equalTo(44)
            }
        UILabel.jobsMake { _ in }
            .byText("巡检：点击背景刷新全部随机数")
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 12))
            .byTextAlignment(.center)
            .byAddTo(pad) { make in
                make.edges.equalToSuperview()
            }
    }
#endif

    private lazy var refreshButton: UIButton = {
        UIButton.sys()
            .byImage("arrow.clockwise".sysImg,
                     for: .normal)
            .byTintColor(JobsCor.label)
            .byBackgroundColor(JobsCor.clear,
                               for: .normal)
            .onTap { [weak self] _ in
                self?.reloadRandomValues()
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero,
                    style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(78)
            .byNoContentInsetAdjustment()
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
            .byBackgroundColor(JobsCor.clear)
            .byTableFooterView(UIView.jobsMake { _ in })
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "随机数测试模块".tr,
                       rightButtons: [refreshButton])
        tableView.byVisible(YES)
        reloadRandomValues()
#if DEBUG
        prepareCoverageTouchPad()
#endif
    }

    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        super.touchesEnded(touches,
                           with: event)
        reloadRandomValues()
#if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--jobs-coverage-route") {
            coverageTouchEndedCount += 1
        }
#endif
    }

    private func reloadRandomValues() {
        values = items.map {
            $0.generator()
        }
        tableView.byReloadData()
    }

    private func reloadRandomValue(at indexPath: IndexPath) {
        guard items.indices.contains(indexPath.row),
              values.indices.contains(indexPath.row) else {
            return
        }
        let oldValue = values[indexPath.row]
        var newValue = oldValue
        repeat {
            newValue = items[indexPath.row].generator()
        } while newValue == oldValue
        values[indexPath.row] = newValue
        tableView.byReloadRows(at: [indexPath],
                               with: .automatic)
    }
}

extension JobsRandomNumberDemoVC: UITableViewDataSource,
                                  UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "JobsRandomNumberCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .subtitle,
                               reuseIdentifier: reuseIdentifier)
        let item = items[indexPath.row]
        let value = values.indices.contains(indexPath.row)
            ? values[indexPath.row]
            : item.generator()
        return cell
            .byText(item.title)
            .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                             weight: .semibold))
            .byTitleCor(JobsCor.label)
            .byTitleNumberOfLines(0)
            .byDetailText("\(item.range)   结果：\(value)")
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 13))
            .byDetailTitleCor(JobsCor.secondaryLabel)
            .byAccessoryType(.disclosureIndicator)
            .bySelectionStyle(.none)
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        reloadRandomValue(at: indexPath)
    }
}
