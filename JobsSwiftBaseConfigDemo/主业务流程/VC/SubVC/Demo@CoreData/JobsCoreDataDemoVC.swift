//
//  JobsCoreDataDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import UIKit
import CoreData
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsCoreDataDemoVC: BaseVC,
                                UITableViewDataSource,
                                UITableViewDelegate {

    private var store: JobsCoreDataUserStore?
    private var users: [JobsCoreDataUser] = []
    private var loadError: Error?
    private var languageToken: NSObjectProtocol?
    private var themeToken: NSObjectProtocol?

    private lazy var helpLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byNumberOfLines(0)
            .byFont(JobsFont.preferredFont(forTextStyle: .subheadline))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var addButton: UIButton = {
        actionButton(identifier: "jobs.coredata.add") { [weak self] in
            self?.showEditor()
        }
        .byAddTo(view) { [unowned self] make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(reloadButton.snp.top).offset(-4)
            make.height.greaterThanOrEqualTo(44)
        }
    }()

    private lazy var reloadButton: UIButton = {
        actionButton(identifier: "jobs.coredata.reload") { [weak self] in
            self?.reloadUsers()
        }
        .byAddTo(view) { [unowned self] make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(clearButton.snp.top).offset(-4)
            make.height.greaterThanOrEqualTo(44)
        }
    }()

    private lazy var clearButton: UIButton = {
        actionButton(identifier: "jobs.coredata.clear") { [weak self] in
            self?.confirmDeleteAll()
        }
        .byAddTo(view) { [unowned self] make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
            make.height.greaterThanOrEqualTo(44)
        }
    }()

    private lazy var tableView: UITableView = {
        UITableView.jobsMake { _ in }
            .byAccessibilityIdentifier("jobs.coredata.list")
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(64)
            .byEmptyButtonProvider { [weak self] in
                self?.makeEmptyButton() ?? JobsEmptyAuto.Config.defaultProvider()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(helpLabel.snp.bottom).offset(8)
                make.left.right.equalTo(view.safeAreaLayoutGuide)
                make.bottom.equalTo(addButton.snp.top).offset(-8)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.byVisible(true)
        reloadButton.byVisible(true)
        addButton.byVisible(true)
        helpLabel.byVisible(true)
        tableView.byVisible(true)
        languageToken = NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                               object: nil,
                                                               queue: .main) { [weak self] _ in
            self?.refreshAppearance()
        }
        themeToken = NotificationCenter.default.addObserver(forName: .JobsThemeDidChange,
                                                            object: nil,
                                                            queue: .main) { [weak self] _ in
            self?.refreshAppearance()
        }
        refreshAppearance()
        reloadUsers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshAppearance()
        reloadUsers()
    }

    deinit {
        if let languageToken {
            NotificationCenter.default.removeObserver(languageToken)
        }
        if let themeToken {
            NotificationCenter.default.removeObserver(themeToken)
        }
    }

    private func actionButton(identifier: String,
                               action: @escaping () -> Void) -> UIButton {
        UIButton.sys()
            .byAccessibilityIdentifier(identifier)
            .byTitleFont(JobsFont.preferredFont(forTextStyle: .body))
            .byConfiguration { configuration in
                configuration
                    .byCornerStyle(.fixed)
                    .byBackground(configuration.background
                        .byCornerRadius(10)
                        .byBackgroundColor(RootListPreferences.cardBackgroundColor))
            }
            .onTap { _ in
                action()
            }
    }

    private func refreshAppearance() {
        jobsSetupGKNav(title: "Core Data 用户数据库".tr)
        RootListPreferences.applyThemeChrome(to: self,
                                             backgroundColor: RootListPreferences.pageBackgroundColor)
        helpLabel
            .byText("User 模型定义姓名与年龄，SQLite 文件保存实际记录。本页仅演示本地持久化。".tr
                    + "\n" + "点击记录编辑姓名与年龄，左滑删除。所有操作立即保存，重启后仍可读取。".tr)
            .byTextColor(RootListPreferences.secondaryTextColor)
        addButton
            .byTitle("添加用户".tr)
            .byTitleColor(RootListPreferences.primaryTextColor)
            .byUpdateConfig()
        reloadButton
            .byTitle("重新加载".tr)
            .byTitleColor(RootListPreferences.primaryTextColor)
            .byUpdateConfig()
        clearButton
            .byTitle("清空数据库".tr)
            .byTitleColor(JobsCor.systemRed)
            .byUpdateConfig()
        tableView
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
            .bySeparatorColor(RootListPreferences.separatorColor)
        renderUsersIfVisible()
    }

    private func renderUsersIfVisible() {
        // 首次查询可在入窗前准备；空态布局必须等待列表进入真实视图层级。
        guard tableView.window != nil else {
            return
        }
        tableView
            .byEmptyButtonProvider { [weak self] in
                self?.makeEmptyButton() ?? JobsEmptyAuto.Config.defaultProvider()
            }
            .byReloadData()
            .byReloadEmptyViewAuto(animated: false)
    }

    private func makeEmptyButton() -> UIButton {
        JobsEmptyAuto.Config.defaultProvider()
            .byAccessibilityIdentifier("jobs.coredata.empty")
            .byTitle((loadError == nil ? "尚无用户记录" : "数据库操作失败").tr)
            .bySubTitle(loadError.map { message(for: $0) }
                        ?? "输入姓名和年龄，添加第一位用户".tr)
            .byImage(UIImage.make(named: "CoreDataDatabaseIcon"))
            .byImagePlacement(.top)
            .byTitleColor(RootListPreferences.primaryTextColor)
            .bySubTitleColor(RootListPreferences.secondaryTextColor)
            .byAccessibilityLabel((loadError == nil ? "重新加载" : "重试数据库加载").tr)
            .onTap { [weak self] _ in
                self?.reloadUsers()
            }
    }

    private func reloadUsers() {
        do {
            if store == nil {
                store = try JobsCoreDataUserStore()
            }
            users = try store?.fetchUsers() ?? []
            loadError = nil
        } catch {
            users = []
            loadError = error
        }
        addButton.byEnabled(store != nil && loadError == nil)
        clearButton.byEnabled(!users.isEmpty && loadError == nil)
        renderUsersIfVisible()
    }

    private func showEditor(user: JobsCoreDataUser? = nil) {
        let alert = UIAlertController.makeAlert((user == nil ? "添加用户" : "编辑用户").tr,
                                                "年龄须为 0～150 的整数。".tr)
            .byAddTextField(placeholder: "姓名".tr,
                            text: user?.name,
                            contentType: .name,
                            onChange: { alert, _, _, _, _ in
                Self.updateEditorValidation(alert)
            })
            .byAddTextField(placeholder: "年龄".tr,
                            text: String(user?.age ?? 18),
                            keyboard: .numberPad,
                            onChange: { alert, _, _, _, _ in
                Self.updateEditorValidation(alert)
            })
            .byAddCancel("取消".tr)
            .byAddAction(title: (user == nil ? "添加用户" : "保存修改").tr,
                         isPreferred: true,
                         byActionBlock: { [weak self] alert, _ in
                let name = alert.textFields?.first?.text ?? ""
                let age = alert.textFields?.last?.text ?? ""
                alert.byDismiss { [weak self] in
                    self?.performMutation { store in
                        try store.saveUser(objectID: user?.objectID,
                                            name: name,
                                            ageText: age)
                    }
                }
            })
        Self.updateEditorValidation(alert)
        alert.byPresent(self)
    }

    private static func updateEditorValidation(_ alert: UIAlertController) {
        let valid = (try? JobsCoreDataUserStore.validatedInput(
            name: alert.textFields?.first?.text ?? "",
            ageText: alert.textFields?.last?.text ?? "")) != nil
        alert.actions.last?.byEnabled(valid)
    }

    private func confirmDeleteAll() {
        UIAlertController.makeAlert("清空数据库".tr,
                                     "确定删除本 Demo 的全部用户？此操作无法撤销。".tr)
            .byAddCancel("取消".tr)
            .byAddAction(title: "清空数据库".tr,
                         style: .destructive,
                         byActionBlock: { [weak self] alert, _ in
                alert.byDismiss { [weak self] in
                    self?.performMutation { store in
                        try store.deleteAllUsers()
                    }
                }
            })
            .byPresent(self)
    }

    private func performMutation(_ mutation: (JobsCoreDataUserStore) throws -> Void) {
        guard let store else {
            return
        }
        do {
            try mutation(store)
            reloadUsers()
        } catch {
            UIAlertController.makeAlert("数据库操作失败".tr,
                                         message(for: error))
                .byAddOK("确定".tr)
                .byPresent(self)
        }
    }

    private func message(for error: Error) -> String {
        if let known = error as? JobsCoreDataUserError {
            return known.messageKey.tr
        }
        return "数据库操作失败".tr + "\n" + (error as NSError).localizedDescription
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return String(format: "记录数量：%@".tr, String(users.count))
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobsCoreDataUser")
            ?? UITableViewCell.make(style: .subtitle,
                                      reuseIdentifier: "JobsCoreDataUser")
        return cell
            .byAccessibilityIdentifier("jobs.coredata.user.\(indexPath.row)")
            .byText(user.name)
            .byDetailText("年龄".tr + ": " + String(user.age))
            .byTitleCor(RootListPreferences.primaryTextColor)
            .byDetailTitleCor(RootListPreferences.secondaryTextColor)
            .byTextLabel { label in
                label
                    .byNumberOfLines(0)
                    .byFont(JobsFont.preferredFont(forTextStyle: .body))
            }
            .byDetailTextLabel { label in
                label
                    .byNumberOfLines(0)
                    .byFont(JobsFont.preferredFont(forTextStyle: .subheadline))
            }
            .byBackgroundColor(RootListPreferences.cardBackgroundColor)
            .byAccessoryType(.disclosureIndicator)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.byDeselectRow(indexPath)
        showEditor(user: users[indexPath.row])
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        let objectID = users[indexPath.row].objectID
        performMutation { store in
            try store.deleteUser(objectID: objectID)
        }
    }
}
