//
//  LGOEditProfileDemoVC.swift
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

import JobsToast
import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftAppTools
import JobsSwiftBaseDefines
import SnapKit
import SwiftEntryKit
import GKNavigationBarSwift
import BRPickerViewSwift

// MARK: - 行模型
private enum EditProfileRow: CaseIterable {
    case avatar
    case nickname
    case gender
    case sign
    case birthday
    case emotion
    case hometown
    case profession

    var title: JobsText {
        switch self {
        /// 处理 .avatar 分支
        case .avatar:     return "头像"
        /// 处理 .nickname 分支
        case .nickname:   return "昵称"
        /// 处理 .gender 分支
        case .gender:     return "性别"
        /// 处理 .sign 分支
        case .sign:       return "签名"
        /// 处理 .birthday 分支
        case .birthday:   return "生日"
        /// 处理 .emotion 分支
        case .emotion:    return "情感"
        /// 处理 .hometown 分支
        case .hometown:   return "家乡"
        /// 处理 .profession 分支
        case .profession: return "职业"
        }
    }
    /// ❤️ 这里的字段“detail”，既可以是String类型，也可以是NSAttributedString类型。合二为一
    var detail: JobsText? {
        switch self {
        /// 处理 .avatar 分支
        case .avatar:
            return nil
        /// 处理 .nickname 分支
        case .nickname:
            return JobsText(JobsRichText.make([
                JobsRichRun(
                    .text("等级达到2级才能修改昵称"))
                    .font(JobsFont.systemFont(ofSize: 14))
                    .color(JobsCor.systemRed),
                JobsRichRun(
                    .text("Eric"))
                    .font(JobsFont.systemFont(ofSize: 14, weight: .semibold))
                    .color(JobsCor.secondaryLabel)
            ]))
        /// 处理 .gender 分支
        case .gender:
            return "female"
        /// 处理 .sign 分支
        case .sign:
            return "This person left nothing behind"
        /// 处理 .birthday 分支
        case .birthday:
            return "2025-09-22"
        /// 处理 .emotion 分支
        case .emotion:
            return "secret"
        /// 处理 .hometown 分支
        case .hometown:
            return "Mars"
        /// 处理 .profession 分支
        case .profession:
            return "product manager"
        }
    }
}

final class LGOEditProfileDemoVC: BaseVC {
    private let sections: [[EditProfileRow]] = [
        [.avatar, .nickname, .gender, .sign],
        [.birthday, .emotion, .hometown, .profession]
    ]
    private var birthdayDate = Calendar.current.date(
        from: DateComponents(year: 2025, month: 9, day: 22)
    ) ?? Date()

    private static func applyAdaptivePickerTheme(_ theme: BRPickerTheme) {
        theme
            .byPanelBackgroundColor(JobsCor.systemGroupedBackground)
            .byToolbarBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byTitleColor(JobsCor.label)
            .byButtonColor(JobsCor.systemBlue)
            .byMaskColor(JobsCor.black.withAlphaComponent(0.55))
            .byPickerTextColor(JobsCor.secondaryLabel)
            .byPickerSelectedTextColor(JobsCor.label)
            .byAutoSelect(false)
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byDataSource(self)
            .byDelegate(self)
            .register()
            .byRegisterCell(AvatarCell.self)
            .byScrollEnabled(NO)
            .byNoContentInsetAdjustment()
            .byNoSectionHeaderTopPadding()
            .byTableFooterView(UIView.jobsMake { _ in })
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
                } else {
                    make.edges.equalTo(view.safeAreaLayoutGuide)
                }
            }
    }()
    /// 文本：单列（性别）
    private lazy var eduPicker: BRStringPicker = { [unowned self] in
        BRStringPicker()
            .byDataSource(["女", "男", "不想透露"])
            .bySelectedIndex(2)
            .byTheme { theme in
                Self.applyAdaptivePickerTheme(theme)
            }
            .byToolbar { cfg in
                cfg.byTitle("")
                   .byCancelText("取消")
                   .byConfirmText("完成")
            }
            .byResult { value in
                let idx = ["女", "男", "不想透露"].firstIndex(of: value) ?? -1
                ("单列：\(value)（index=\(idx)）").toast
            }
    }()
    /// 文本：单列（情感状态）
    private lazy var emotionPicker: BRStringPicker = { [unowned self] in
        BRStringPicker()
            .byDataSource(["已婚", "单身", "不想透露"])
            .bySelectedIndex(2)
            .byTheme { theme in
                Self.applyAdaptivePickerTheme(theme)
            }
            .byToolbar { cfg in
                cfg.byTitle("")
                   .byCancelText("取消")
                   .byConfirmText("完成")
            }
            .byResult { value in
                ("单列：\(value)（index=?）").toast
            }
    }()
    /// 日期：系统 Date（年月日）
    private lazy var dateSysDatePicker: BRSystemDatePicker = { [unowned self] in
        BRSystemDatePicker()
            .byTitle("出生日".tr)
            .bySelectDate(birthdayDate)
            .byMinDate(Calendar.current.date(byAdding: .year, value: -80, to: Date()))
            .byMaxDate(Date())
            .byMinuteInterval(1)
            .byTheme { theme in
                Self.applyAdaptivePickerTheme(theme)
            }
            .byToolbar { cfg in
                cfg.byTitle("出生日".tr)
                   .byCancelText("取消")
                   .byConfirmText("完成")
            }
            .byResult { [weak self] dt in
                guard let self else { return }
                birthdayDate = dt
                if let section = sections.firstIndex(where: { $0.contains(.birthday) }),
                   let row = sections[section].firstIndex(of: .birthday) {
                    tableView.byReloadRows(
                        at: [IndexPath(row: row, section: section)],
                        with: .none
                    )
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "Edit profile")
        tableView.byVisible(YES)
    }
}
// MARK: - UITableViewDataSource
extension LGOEditProfileDemoVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section][indexPath.row]
        switch row {
        /// 处理 .avatar 分支
        case .avatar:
            return tableView.byDequeueReusableCell(
                withType: AvatarCell.self,
                for: indexPath
            ).byData(JobsBaseCellConfig(title: row.title))
        /// 未匹配已知分支时执行兜底处理
        default:
            let detail = row == .birthday
                ? JobsText(fmt(birthdayDate, "yyyy-MM-dd"))
                : row.detail
            return tableView.byDequeueReusableCell(withType: BaseTableViewCellByValue1.self, for: indexPath)
                .byTitleFont(JobsFont.systemFont(ofSize: 16))
                .byDetailTitleFont((JobsFont.systemFont(ofSize: 14)))
                .bySelectionStyle(.none)
                .byAccessoryType(.disclosureIndicator)
                .bySeparatorInset(.init(top: 0, left: 16, bottom: 0, right: 16))
                .byTitleCor(JobsCor.label)
                .byDetailTitleCor(JobsCor.secondaryLabel)
                .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
                .byData(JobsBaseCellConfig(title: row.title, detail: detail))
        }
    }
}
// MARK: - UITableViewDelegate
extension LGOEditProfileDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = sections[indexPath.section][indexPath.row]
        return row == .avatar ? 72 : 52
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 8 : 16
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        UIView.jobsMake { _ in }.byBackgroundColor(JobsCor.clear)
    }

    func tipsGrantPermission(){
        SwiftEntryKit.display(
            entry: TipsGrantPermissionView().onConfirm {
                print("去开启")
                SwiftEntryKit.dismiss(.all)
            },
            using: makeEKAttributes().bySize(width: .constant(value: 326.w), height: .constant(value: 226.h))
        )
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = sections[indexPath.section][indexPath.row]
        switch row {
        /// 处理 .avatar 分支
        case .avatar:
            SwiftEntryKit.display(
                entry: PhotoPermissionAlertView()
                    .onLimited {
                        print("有限访问")
                        SwiftEntryKit.dismiss{ [weak self] in
                            guard let self else { return }
                            tipsGrantPermission()
                        }
                    }
                    .onFull {
                        print("全部允许")
                        SwiftEntryKit.dismiss()
                    }
                    .onDeny {
                        print("不允许")
                        SwiftEntryKit.dismiss()
                    },
                using: makeEKAttributes().bySize(width: .constant(value: 340.w), height: .constant(value: 217.h))
            )
//            SwiftEntryKit.display(
//                entry: TipsGrantPermissionView().onConfirm {
//                    print("去开启")
//                    SwiftEntryKit.dismiss(.all)
//                },
//                using: makeEKAttributes().bySize(width: .constant(value: 326.w), height: .constant(value: 206.h))
        /// 处理 .nickname 分支
        case .nickname:
            LGOEditNicknameVC()
                .byData("https://www.baidu.com")
                .byPush(self)
                .byCompletion { print("❤️结束❤️ fromBottom") }
        /// 处理 .gender 分支
        case .gender:
            self.eduPicker.byPresent(in: self.view)
        /// 处理 .sign 分支
        case .sign:
            SwiftEntryKit.display(
                entry: PhotoPermissionAlertView()
                    .onLimited {
                        print("有限访问")
                        SwiftEntryKit.dismiss()
                    }
                    .onFull {
                        print("全部允许")
                        SwiftEntryKit.dismiss()
                    }
                    .onDeny {
                        print("不允许")
                        SwiftEntryKit.dismiss()
                    },
                using: makeEKAttributes()
            )
        /// 处理 .birthday 分支
        case .birthday:
            dateSysDatePicker
                .bySelectDate(birthdayDate)
                .byPresent(in: self.view)
        /// 处理 .emotion 分支
        case .emotion:
            eduPicker.byPresent(in: self.view)
        /// 处理 .hometown 分支
        case .hometown:
            "可能这个最后要被取消".tr.toast
        /// 处理 .profession 分支
        case .profession:
            SwiftEntryKit.display(
                entry: PhotoPermissionAlertView()
                    .onLimited {
                        print("有限访问")
                        SwiftEntryKit.dismiss()
                    }
                    .onFull {
                        print("全部允许")
                        SwiftEntryKit.dismiss()
                    }
                    .onDeny {
                        print("不允许")
                        SwiftEntryKit.dismiss()
                    },
                using: makeEKAttributes()
            )
        }
    }
}
// MARK: - 头像 cell
public final class AvatarCell: UITableViewCell {
    private lazy var avatarView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds()
            .jobs_setImage("https://picsum.photos/200",
                           fallback: "Ani".img,
                           shimmerConfig: nil,
                           targetSize: CGSize(width: 44, height: 44))
            .byClipsToBounds(true)
            .byCornerRadius(22)
            .byBackgroundColor(JobsCor.tertiarySystemBackground)
            .byAddTo(contentView) { [unowned self] make in
                make.size.equalTo(CGSize(width: 44, height: 44))
                make.centerY.equalToSuperview()
                // 预留 disclosureIndicator 的空间
                make.trailing.equalToSuperview().inset(16)
            }
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        contentView.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        textLabel?.byFont(JobsFont.systemFont(ofSize: 16)).byTextColor(JobsCor.label)
        detailTextLabel?.byFont(JobsFont.systemFont(ofSize: 14)).byTextColor(JobsCor.secondaryLabel)
        avatarView.byVisible(YES)
    }

    @discardableResult
    /// 富文本的优先级比普通文本高。即，如果同时设置富文本和普通文本，优先展示富文本
    func byData(_ any: Any?) -> Self {
        guard let cfg = any as? JobsBaseCellConfig else { return self }
        if let title = cfg.title {
            textLabel?.byJobsAttributedText(title)
        }
        if let detail = cfg.detail {
            detailTextLabel?.byJobsAttributedText(detail)
        }
        if let image = cfg.image {
            avatarView.byImage(image)
        };return self
    }
}
