//
//  Demo@FMDB.swift
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

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsInheritance
import SnapKit

#if canImport(FMDB) && !canImport(WCDB)
import FMDB
final class FMDBDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 16
    private var data: [Man] = []
    // MARK: - UI (Lazy)
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byText("FMDB Demo：新增 / 查询 / 更新首条 / 删除末条 / 清空".tr)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var nameField: UITextField = {
        UITextField()
            .byPlaceholder("姓名（例如：Jobs）".tr)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.hintLabel.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(44)
        }
    }()

    private lazy var ageField: UITextField = {
        UITextField()
            .byPlaceholder("年龄（例如：18）".tr)
            .byKeyboardType(.numberPad)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.nameField.snp.bottom).offset(10)
                make.left.right.height.equalTo(self.nameField)
        }
    }()

    private lazy var addButton: UIButton = {
        UIButton.custom()
            .byTitle("新增".tr)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                let name = (nameField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let age = Int((ageField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
                guard !name.isEmpty, age > 0 else {
                    hintLabel.byText("❗️请输入有效姓名和年龄".tr)
                    return
                }
                let ok = ManDB.shared.insert(name: name, age: age)
                hintLabel.byText(ok ? "✅ 新增成功：\(name) - \(age)" : "❌ 新增失败")
                onQueryAll()
            }
    }()

    private lazy var queryButton: UIButton = {
        UIButton.custom()
            .byTitle("查询全部".tr)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                onQueryAll()
            }
    }()

    private lazy var updateButton: UIButton = {
        UIButton.custom()
            .byTitle("更新首条".tr)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                guard var first = data.first else {
                    hintLabel.byText("ℹ️ 没有数据可更新".tr)
                    return
                }
                first.name = first.name + " (Updated)"
                first.age += 1
                let ok = ManDB.shared.update(id: first.id, name: first.name, age: first.age)
                hintLabel.byText(ok ? "✅ 更新首条成功：id=\(first.id)" : "❌ 更新失败")
                onQueryAll()
            }
    }()

    private lazy var deleteButton: UIButton = {
        UIButton.custom()
            .byTitle("删除末条".tr)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                guard let last = data.last else {
                    hintLabel.byText("ℹ️ 没有数据可删除".tr)
                    return
                }
                let ok = ManDB.shared.delete(id: last.id)
                hintLabel.byText(ok ? "✅ 删除末条成功：id=\(last.id)" : "❌ 删除失败")
                onQueryAll()
            }
    }()

    private lazy var clearButton: UIButton = {
        UIButton.custom()
            .byTitle("清空".tr)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                let ok = ManDB.shared.clearAll()
                hintLabel.byText(ok ? "✅ 已清空" : "❌ 清空失败")
                onQueryAll()
            }
    }()

    private lazy var row1: UIStackView = {
        UIStackView(arrangedSubviews: [addButton, queryButton])
            .byAxis(.horizontal)
            .bySpacing(12)
            .byDistribution(.fillEqually)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.ageField.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(44)
        }
    }()

    private lazy var row2: UIStackView = {
        UIStackView(arrangedSubviews: [updateButton, deleteButton, clearButton])
            .byAxis(.horizontal)
            .bySpacing(12)
            .byDistribution(.fillEqually)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.row1.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(44)
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byTableFooterView(UIView())
            .byRegisterCell(UITableViewCell.self)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.row2.snp.bottom).offset(14)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "FMDB@Demo")
        hintLabel.byVisible(YES)
        nameField.byVisible(YES)
        ageField.byVisible(YES)
        row1.byVisible(YES)
        row2.byVisible(YES)
        tableView.byVisible(YES)
    }

    @objc private func onQueryAll() {
        data = ManDB.shared.fetchAll()
        tableView.reloadData()
        tableView.byVisible(data.isEmpty ? NO : YES)
        if data.isEmpty {
            hintLabel.byText("ℹ️ 当前无数据，先新增一条试试".tr)
        }
    }
}
// MARK: - UITableViewDataSource
extension FMDBDemoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let p = data[indexPath.row]
        return tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byText("id=\(p.id) | \(p.name) | age=\(p.age)")
            .byData(nil)
            .onResult { _ in
            }
    }
}
#endif
