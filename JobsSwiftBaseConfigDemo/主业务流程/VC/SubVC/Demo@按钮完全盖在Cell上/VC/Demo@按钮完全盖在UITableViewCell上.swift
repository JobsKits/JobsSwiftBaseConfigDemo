//
//  Demo@按钮完全盖在UITableViewCell上.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/23/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import Inheritance
import GKNavigationBarSwift
import JobsByUIKit
import JobsBy3rdTools
import JobsTextTools
import JobsToast
import JobsRefresher
/// UITableView是不支持在Section内部直接定义Cell之间的距离的
final class BtnFullOnTBVCellDemoVC: BaseVC {
    private var items: [JobsBtnCellModel] = []
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .registerCell(SDBtnTBVCell.self)
            .registerCell(KFBtnTBVCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
            // ✅ 空态 API：reloadData 后自动评估，无需手动 updateEmptyState
            .jobs_emptyButtonProvider { [unowned self] in
                UIButton(type: .system)
                    .byTitle("暂无数据", for: .normal)
                    .bySubTitle("点我填充示例数据", for: .normal)
                    .byImage("tray".sysImg, for: .normal)
                    .byImagePlacement(.top)
                    .onTap { [weak self] _ in
                        guard let self else { return }
                        self.items = self.makeMockItems(count: 20)
                        self.tableView.reloadData()
                    }
                    .jobs_setEmptyLayout { btn, make, host in
                        make.centerX.equalTo(host)
                        make.centerY.equalTo(host).offset(-40)
                        make.leading.greaterThanOrEqualTo(host).offset(16)
                        make.trailing.lessThanOrEqualTo(host).inset(16)
                        make.width.lessThanOrEqualTo(host).multipliedBy(0.9)
                    }
            }
            // 下拉刷新
            .configRefreshHeader(component: JobsDefaultHeader(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    self.items = self.makeMockItems(count: 20)
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal)
                }
            }
            // 上拉加载
            .configRefreshFooter(component: JobsDefaultFooter(),
                                 container: self,
                                 trigger: 66) { [weak self] in
                guard let self else { return }
                Task { @MainActor in
                    if self.items.count < 80 {
                        self.items.append(contentsOf: self.makeMockItems(count: 20, startAt: self.items.count + 1))
                        self.tableView.byReloadData()
                        self.tableView.switchRefreshFooter(to: .normal)
                    } else {
                        self.tableView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(0)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.92)
        jobsSetupGKNav(title: "按钮完全盖在UITableViewCell上")
        tableView.reloadData()
//        tableView.contentInset.top = 100
//        tableView.contentInset.left = 100
//        tableView.contentInset.bottom = 100
//        tableView.contentInset.right = 100
    }

    private func makeMockItems(count: Int, startAt: Int = 1) -> [JobsBtnCellModel] {
        let titles = ["贵族勋章", "超级会员", "专属皮肤", "聊天气泡", "进场特效", "昵称边框"]
        return (0..<count).map { i in
            let idx = startAt + i
            return JobsBtnCellModel(
                title: titles[idx % titles.count],
                titleCor: .systemCyan,
                subTitle: "发言时聊天专属皮肤",
                subTitleCor: .blue,
                imageURL:"https://picsum.photos/200",
                bgImageURL:"https://picsum.photos/300",
                selected: false,
                highlighted: false,
                userInteractionEnabled: false,   // ✅ 核心：按钮不吃点击
                enabled: true
            )
        }
    }
}
// MARK: - UITableViewDataSource / UITableViewDelegate
extension BtnFullOnTBVCellDemoVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView
            .py_dequeueReusableCell(withType: SDBtnTBVCell.self, for: indexPath)
//            .py_dequeueReusableCell(withType: KFBtnTBVCell.self, for: indexPath)
            .byData(items[indexPath.row], indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 118 }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        "✅ 点击了👉UITableViewCell: \(indexPath.row)".toast
        // 示例：点击由 Cell 承担 -> 这里切换状态，按钮展示选中态
//        items[indexPath.row].selected?.toggle()
//        tableView.reloadRows(at: [indexPath], with: .none)
    }
    // 行间距：用 footer 做 10pt 间隔（你原文件也是这样）:contentReference[oaicite:4]{index=4}
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { 10 }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? { UIView() }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { .leastNormalMagnitude }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { UIView() }
}
