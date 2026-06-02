//
//  ObjectBoxDemoVC.swift
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

import ObjectBox
import SnapKit
import GKNavigationBarSwift
import JobsToast
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import JobsSwiftBaseDefines

final class ObjectBoxDemoVC: BaseVC {
    // MARK: - Data
    private let personBox = ObjectBoxManager.shared.humanBox
    private var dataSource: [Human] = []
    private var selectedPerson: Human?
    // MARK: - UI
    private lazy var nameTextField: UITextField = {
        UITextField()
            .byPlaceholder("输入姓名".tr)
            .byBorderStyle(.roundedRect)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(16)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
                }
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().inset(16)
                make.height.equalTo(40)
            }
    }()

    private lazy var ageTextField: UITextField = {
        UITextField()
            .byPlaceholder("输入年龄".tr)
            .byBorderStyle(.roundedRect)
            .byKeyboardType(.numberPad)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(nameTextField.snp.bottom).offset(12)
                make.left.right.height.equalTo(nameTextField)
            }
    }()

    private lazy var addButton: UIButton = {
        UIButton.sys()
            .byTitle("新增".tr, for: .normal)
            .onTap { [weak self] _ in
                guard let self else { return }
                guard let input = buildInputPerson() else { return }
                do {
                    try personBox.put(input)
                    clearInput()
                    selectedPerson = nil
                    loadAllPersons()
                } catch {
                    "新增失败: \(error)".toast
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(ageTextField.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(40)
                make.width.equalTo(100)
            }
    }()

    private lazy var updateButton: UIButton = {
        UIButton.sys()
            .byTitle("修改选中项".tr, for: .normal)
            .onTap { [weak self] _ in
                guard let self else { return }
                guard let selectedPerson else {
                    "请先在列表里选中一条数据".toast
                    return
                }

                guard let name = nameTextField.text?
                    .trimmingCharacters(in: .whitespacesAndNewlines),
                    !name.isEmpty else {
                    "姓名不能为空".toast
                    return
                }

                guard let ageText = ageTextField.text?
                    .trimmingCharacters(in: .whitespacesAndNewlines),
                    let age = Int32(ageText) else {
                    "年龄不合法".toast
                    return
                }

                selectedPerson.name = name
                selectedPerson.age = age

                do {
                    try personBox.put(selectedPerson)
                    clearInput()
                    self.selectedPerson = nil
                    loadAllPersons()
                } catch {
                    "修改失败: \(error)".toast
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(addButton)
                make.left.equalTo(addButton.snp.right).offset(12)
                make.height.width.equalTo(addButton)
            }
    }()

    private lazy var deleteButton: UIButton = {
        UIButton.sys()
            .byTitle("删除选中项".tr, for: .normal)
            .onTap { [weak self] _ in
                guard let self else { return }
                guard let selectedPerson else {
                    "请先在列表里选中一条数据".toast
                    return
                }

                do {
                    try personBox.remove(selectedPerson.id)
                    clearInput()
                    self.selectedPerson = nil
                    loadAllPersons()
                } catch {
                    "删除失败: \(error)".toast
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(addButton.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(40)
                make.width.equalTo(100)
            }
    }()

    private lazy var queryButton: UIButton = {
        UIButton.sys()
            .byTitle("查询全部".tr, for: .normal)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.loadAllPersons()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(deleteButton)
                make.left.equalTo(deleteButton.snp.right).offset(12)
                make.height.width.equalTo(deleteButton)
            }
    }()

    private lazy var clearInputButton: UIButton = {
        UIButton.sys()
            .byTitle("清空输入".tr, for: .normal)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.clearInput()
                self.selectedPerson = nil
                self.tableView.reloadData()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(deleteButton.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(40)
                make.width.equalTo(100)
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.singleLine)
            .byNoSectionHeaderTopPadding()
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(clearInputButton.snp.bottom).offset(16)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "ObjectBox CRUD Demo".tr)
        view.backgroundColor = .systemBackground
        nameTextField.byVisible(YES)
        ageTextField.byVisible(YES)
        addButton.byVisible(YES)
        updateButton.byVisible(YES)
        deleteButton.byVisible(YES)
        queryButton.byVisible(YES)
        clearInputButton.byVisible(YES)
        tableView.byVisible(YES)
        loadAllPersons()
    }
}
// MARK: - Data
private extension ObjectBoxDemoVC {
    
    func buildInputPerson() -> Human? {
        guard let name = nameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines),
            !name.isEmpty else {
            "姓名不能为空".toast
            return nil
        }

        guard let ageText = ageTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines),
            let age = Int32(ageText) else {
            "年龄不合法".toast
            return nil
        }

        return Human(name: name, age: age)
    }

    func loadAllPersons() {
        do {
            let persons = try personBox.all()
            dataSource = persons.sorted { $0.id > $1.id }
            tableView.reloadData()
        } catch {
            "查询失败: \(error)".toast
        }
    }

    func clearInput() {
        nameTextField.byText(nil)
        ageTextField.byText(nil)
    }
}
// MARK: - UITableViewDataSource
extension ObjectBoxDemoVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Human = dataSource[indexPath.row]
        return tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byText("\(Human.name) - \(Human.age)岁")
            .bySecondaryText("id: \(Human.id)")
            .byAccessoryType(Human.id == selectedPerson?.id ? .checkmark : .none)
            .onResult { _ in

            }
    }
}
// MARK: - UITableViewDelegate
extension ObjectBoxDemoVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let Human = dataSource[indexPath.row]
        selectedPerson = Human
        nameTextField.byText(Human.name)
        ageTextField.byText("\(Human.age)")
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }
}
