//
//  JobsOCParityLabelBehaviorDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月26日，星期日.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftUILabelScrolling
import GKNavigationBarSwift
import SnapKit

fileprivate enum JobsLabelBehaviorTarget: String {
    case label = "UILabel"
    case buttonTitleLabel = "UIButton.titleLabel"
}

fileprivate enum JobsLabelBehaviorKind {
    case fixedTruncation
    case autoScroll
    case categoryScroll
    case widthAdaptive
    case scaleToFit
    case automaticWrapping
    case manualNewline
    case richText
}

fileprivate struct JobsLabelBehaviorItem {
    let title: String
    let subtitle: String
    let target: JobsLabelBehaviorTarget
    let kind: JobsLabelBehaviorKind
}

final class JobsLabelBehaviorDemoVC: BaseVC {

    private static let reuseID = "JobsLabelBehaviorDemoCell"
    private lazy var sections: [[JobsLabelBehaviorItem]] = [
        makeItems(target: .label, includesCategoryScroll: true),
        makeItems(target: .buttonTitleLabel, includesCategoryScroll: false)
    ]

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(74)
            .byEstimatedRowHeight(0)
            .bySeparatorStyle(.singleLine)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "Label 表现列表".tr)
        tableView.byVisible(YES)
    }

    private func makeItems(target: JobsLabelBehaviorTarget,
                           includesCategoryScroll: Bool) -> [JobsLabelBehaviorItem] {
        var items = [
            JobsLabelBehaviorItem(
                title: "固定宽高省略".tr,
                subtitle: "定宽、定高、定字体，超出内容以省略号收口".tr,
                target: target,
                kind: .fixedTruncation
            ),
            JobsLabelBehaviorItem(
                title: "AutoScroll 单行滚动".tr,
                subtitle: "固定宽高，超出内容横向往返滚动".tr,
                target: target,
                kind: .autoScroll
            ),
            JobsLabelBehaviorItem(
                title: "宽度自适应".tr,
                subtitle: "定高不定宽，按文字真实宽度撑开".tr,
                target: target,
                kind: .widthAdaptive
            ),
            JobsLabelBehaviorItem(
                title: "缩小字号全展示".tr,
                subtitle: "固定宽高，必要时缩小字号".tr,
                target: target,
                kind: .scaleToFit
            ),
            JobsLabelBehaviorItem(
                title: "普通文本自动换行".tr,
                subtitle: "定宽不定高，按可用宽度自动换行".tr,
                target: target,
                kind: .automaticWrapping
            ),
            JobsLabelBehaviorItem(
                title: "普通文本手动换行".tr,
                subtitle: "文本内置换行符，固定宽度展示多行".tr,
                target: target,
                kind: .manualNewline
            ),
            JobsLabelBehaviorItem(
                title: "富文本手动换行".tr,
                subtitle: "分段配置字体、颜色和背景，并按换行符展示".tr,
                target: target,
                kind: .richText
            )
        ]
        if includesCategoryScroll {
            items.insert(
                JobsLabelBehaviorItem(
                    title: "UILabel 分类单行滚动".tr,
                    subtitle: "复用四种定尺寸文字策略的连续滚动能力".tr,
                    target: target,
                    kind: .categoryScroll
                ),
                at: 2
            )
        };return items
    }
}

extension JobsLabelBehaviorDemoVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        sections[section].count
    }

    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        sections[section].first?.target.rawValue
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseID) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: Self.reuseID)
        let item = sections[indexPath.section][indexPath.row]
        cell.textLabel?
            .byText(item.title)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextColor(JobsCor.label)
            .byTextDisplayMode(.scaleToFit, minimumScaleFactor: 0.7)
        cell.detailTextLabel?
            .byText(item.subtitle)
            .byFont(JobsFont.systemFont(ofSize: 12))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextDisplayMode(.singleLineTailTruncation)
        return cell
            .byAccessoryType(.disclosureIndicator)
            .bySelectionStyle(.default)
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = JobsLabelBehaviorDetailVC()
        detailVC.item = sections[indexPath.section][indexPath.row]
        detailVC
            .byTitle(detailVC.item.title)
            .byPush(self)
    }
}

private final class JobsLabelBehaviorDetailVC: BaseVC {

    fileprivate var item = JobsLabelBehaviorItem(
        title: "固定宽高省略".tr,
        subtitle: "定宽、定高、定字体，超出内容以省略号收口".tr,
        target: .label,
        kind: .fixedTruncation
    )

    private lazy var introLabel: UILabel = {
        UILabel()
            .byText(item.subtitle)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var previewCard: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byCornerRadius(14)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(introLabel.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(240)
            }
    }()

    private lazy var demoLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.systemRed)
            .byAddTo(previewCard) { [unowned self] make in
                make.center.equalToSuperview()
                applyPreviewSize(make)
            }
    }()

    private lazy var demoButton: UIButton = {
        UIButton.sys()
            .byTitleColor(JobsCor.white)
            .byTitleFont(JobsFont.systemFont(ofSize: 15))
            .byBackgroundColor(JobsCor.systemBrown, for: .normal)
            .byAddTo(previewCard) { [unowned self] make in
                make.center.equalToSuperview()
                applyPreviewSize(make)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: item.title)
        introLabel.byVisible(YES)
        previewCard.byVisible(YES)
        configurePreview()
    }

    private func applyPreviewSize(_ make: ConstraintMaker) {
        switch item.kind {
        case .widthAdaptive:
            make.height.equalTo(36)
            make.width.lessThanOrEqualTo(previewCard).offset(-36)
        case .automaticWrapping, .manualNewline, .richText:
            make.width.equalTo(170)
            make.height.equalTo(92)
        default:
            make.width.equalTo(180)
            make.height.equalTo(36)
        }
    }

    private func configurePreview() {
        switch item.target {
        case .label:
            demoLabel.byVisible(YES)
            apply(kind: item.kind, to: demoLabel)
        case .buttonTitleLabel:
            demoButton.byVisible(YES)
            apply(kind: item.kind, to: demoButton)
        }
    }

    private func apply(kind: JobsLabelBehaviorKind, to label: UILabel) {
        if kind == .richText {
            label.byAttributedString(richText())
        } else {
            label.byText(demoText(manualNewline: kind == .manualNewline))
        }
        apply(kind: kind, to: label, supportsCategoryScroll: true)
    }

    private func apply(kind: JobsLabelBehaviorKind, to button: UIButton) {
        if kind == .richText {
            button.byAttributedTitle(richText(), for: .normal)
        } else {
            button.byTitle(demoText(manualNewline: kind == .manualNewline), for: .normal)
        }
        guard let titleLabel = button.titleLabel else { return }
        titleLabel.byTextAlignment(.center)
        apply(kind: kind, to: titleLabel, supportsCategoryScroll: false)
    }

    private func apply(kind: JobsLabelBehaviorKind,
                       to label: UILabel,
                       supportsCategoryScroll: Bool) {
        switch kind {
        case .fixedTruncation:
            label.byTextDisplayMode(.singleLineTailTruncation)
        case .autoScroll:
            label.byTextDisplayMode(
                .scrolling,
                scrollConfiguration: .pingPong(speed: 28)
            )
        case .categoryScroll:
            guard supportsCategoryScroll else { return }
            label.byTextDisplayMode(
                .scrolling,
                scrollConfiguration: .continuous(speed: 36, spacing: 36)
            )
        case .widthAdaptive:
            label.makeLabelByShowingType(.type03)
        case .scaleToFit:
            label.byTextDisplayMode(.scaleToFit, minimumScaleFactor: 0.45)
        case .automaticWrapping, .manualNewline, .richText:
            label
                .byNumberOfLines(0)
                .byLineBreakMode(.byWordWrapping)
        }
    }

    private func demoText(manualNewline: Bool) -> String {
        if manualNewline {
            return "编译器自动管理内存地址，\n让程序员更加专注于\nAPP 的业务。".tr
        };return "编译器自动管理内存地址，让程序员更加专注于 APP 的业务。".tr
    }

    private func richText() -> NSAttributedString {
        let text = "编译器自动管理内存地址\n让程序员更加专注于\nAPP 的业务。".tr
        let result = NSMutableAttributedString(
            string: text,
            attributes: [
                .font: JobsFont.systemFont(ofSize: 14),
                .foregroundColor: JobsCor.white
            ]
        )
        result.addAttributes(
            [
                .foregroundColor: JobsCor.systemYellow,
                .backgroundColor: JobsCor.systemBrown
            ],
            range: (text as NSString).range(of: "编译器自动管理内存地址".tr)
        )
        result.addAttributes(
            [.foregroundColor: JobsCor.systemGreen],
            range: (text as NSString).range(of: "APP 的业务。".tr)
        );return result
    }
}
