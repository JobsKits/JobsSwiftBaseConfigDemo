//
//  JobsSwiftUserInfoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsToast
import SnapKit

final class JobsSwiftUserInfoVC: BaseVC {
    private struct Field {
        let name: String
        let value: String
    }

    private static let cellReuseIdentifier = "JobsSwiftUserInfoCell"
    private var fields: [Field] = []

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
            .bySeparatorColor(RootListPreferences.separatorColor)
            .byEstimatedRowHeight(72)
            .byRowHeight(UITableView.automaticDimension)
            .byAddTo(view) { make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
            }
    }()

    override func loadView() {
        super.loadView()
        fields = loadUserInfoFields()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "用户信息展示（开发测试专用）".tr)
        RootListPreferences.applyThemeChrome(to: self)
        tableView.byVisible(YES)
    }

    private func loadUserInfoFields() -> [Field] {
        guard let url = Bundle.main.url(forResource: "UserData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let object = try? JSONSerialization.jsonObject(with: data),
              let dictionary = object as? [String: Any] else {
            return [Field(name: "状态", value: "未读取到 UserData.json")]
        };return dictionary.keys.sorted().map {
            Field(name: $0, value: displayText(for: dictionary[$0]))
        }
    }

    private func displayText(for value: Any?) -> String {
        guard let value, !(value is NSNull) else { return "nil" }
        if JSONSerialization.isValidJSONObject(value),
           let data = try? JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted]),
           let text = String(data: data, encoding: .utf8) {
            return text
        };return String(describing: value)
    }
}

extension JobsSwiftUserInfoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fields.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellReuseIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: Self.cellReuseIdentifier)
        return cell
            .byText(field.name)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleCor(RootListPreferences.foldPrimaryTextColor)
            .byDetailText(field.value)
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byDetailTitleCor(RootListPreferences.foldSecondaryTextColor)
            .byDetailTitleNumberOfLines(3)
            .byBackgroundColor(RootListPreferences.foldCardBackgroundColor)
            .byContentView { $0.byBackgroundColor(RootListPreferences.foldCardBackgroundColor) }
            .byAccessoryType(.none)
            .bySelectionStyle(.default)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let field = fields[indexPath.row]
        UIPasteboard.general.string = field.value
        "复制%@成功".tr(field.name).toast
    }
}
