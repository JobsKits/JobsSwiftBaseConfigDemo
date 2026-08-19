//
//  JobsSwiftLinkageMenuViewDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftLinkageMenuView
import JobsToast
import GKNavigationBarSwift
import SnapKit

final class JobsSwiftLinkageMenuViewDemoVC: BaseVC {
    private enum LayoutMode: Int {
        case fixedMenu
        case fixedContent
        case ratio
    }

    private var linkageView: JobsSwiftLinkageMenuView?
    private let menuTitles = ["日常.1", "新人.1", "电子.1", "体育.1", "棋牌.1", "真人.1", "捕鱼.1", "钱包教程.1"]

    private lazy var modeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["菜单固定", "内容固定", "比例"])
        control
            .bySelectedSegmentIndex(LayoutMode.fixedMenu.rawValue)
            .byAddTarget(self, action: #selector(modeChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var callbackLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("当前菜单：日常.1".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byNumberOfLines(1)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "首页联动切换子页面".tr)
        mountControls()
        rebuildLinkageView()
    }

    private func mountControls() {
        modeControl.byAddTo(view)
        callbackLabel.byAddTo(view)
        modeControl.snp.makeConstraints { [unowned self] make in
            make.left.right.equalToSuperview().inset(16)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(12)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            }
            make.height.equalTo(34)
        }
        callbackLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(modeControl.snp.bottom).offset(8)
            make.height.equalTo(20)
        }
    }

    private func rebuildLinkageView() {
        linkageView?.removeFromSuperview()
        let config = JobsSwiftLinkageMenuViewConfig()
        config.defaultMenuItemHeight = 78
        config.menuItemHeightMap = [4: 96]
        config.indicatorWidth = 4
        config.indicatorHeight = 56
        config.menuBackgroundColor = UIColor(gray: 0.96 * 255)
        config.contentBackgroundColor = JobsCor.white
        config.selectedTintColor = UIColor(r: 255, g: 0.55 * 255, b: 0)
        config.selectedBackgroundColor = UIColor(r: 255, g: 0.55 * 255, b: 0, a: 0.18)
        switch LayoutMode(rawValue: modeControl.selectedSegmentIndex) ?? .fixedMenu {
        /// 处理 .fixedMenu 分支
        case .fixedMenu:
            config.menuWidth = 96
        /// 处理 .fixedContent 分支
        case .fixedContent:
            config.contentWidth = 260
        /// 处理 .ratio 分支
        case .ratio:
            config.menuRatio = 0.26
        }
        config.menuClickBlock = { [weak self] payload in
            self?.callbackLabel.byText("当前菜单：\(payload.item.title)")
        }
        config.noContentClickBlock = { [weak self] payload in
            let text = "点击了没有内容区的菜单：\(payload.item.title)"
            self?.callbackLabel.byText(text)
            text.toast
        }
        let view = JobsSwiftLinkageMenuView(menuItems: makeMenuItems(),
                                            contentViews: makeContentViews(),
                                            config: config)
        self.linkageView = view
        view.byAddTo(self.view)
        view.snp.makeConstraints { [unowned self] make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(callbackLabel.snp.bottom).offset(8)
        }
    }

    private func makeMenuItems() -> [JobsSwiftLinkageMenuItem] {
        menuTitles.map {
            JobsSwiftLinkageMenuItem(title: $0,
                                     image: iconImage(color: JobsCor.gray),
                                     selectedImage: iconImage(color: UIColor(r: 255, g: 0.55 * 255, b: 0)))
        }
    }

    private func makeContentViews() -> [UIView?] {
        menuTitles.dropLast().map {
            ActivityListView(sectionTitle: "活动", menuTitle: $0) as UIView?
        }
    }

    private func iconImage(color: UIColor) -> UIImage {
        let size = CGSize(width: 26, height: 26)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let path = UIBezierPath.make()
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        for i in 0..<10 {
            let radius: CGFloat = i.isMultiple(of: 2) ? 12 : 5
            let angle = CGFloat(i) * .pi / 5 - .pi / 2
            let point = CGPoint(x: center.x + cos(angle) * radius,
                                y: center.y + sin(angle) * radius)
            if i == 0 {
                path.byMove(to: point)
            } else {
                path.byAddLine(to: point)
            }
        }
        path.byClose()
        color.setFill()
        path.byFill()
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? .make { _ in }
        UIGraphicsEndImageContext()
        return image
    }

    @objc private func modeChanged(_ sender: UISegmentedControl) {
        rebuildLinkageView()
    }
}

private final class ActivityListView: UIView {
    private let sectionTitle: String
    private let menuTitle: String
    private var cards: [UIView] = []
    private var iconLabels: [UILabel] = []
    private var titleLabels: [UILabel] = []
    private var subtitleLabels: [UILabel] = []

    init(sectionTitle: String, menuTitle: String) {
        self.sectionTitle = sectionTitle
        self.menuTitle = menuTitle
        super.init(frame: .zero)
        self.byBackgroundColor(JobsCor.secondarySystemBackground)
        for index in 0..<5 {
            let card = makeCard(index: index)
            cards.append(card)
            card.byAddTo(self)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let x: CGFloat = 16
        let width = max(0, bounds.width - x * 2)
        var y: CGFloat = 16
        for card in cards {
            card.byFrame(CGRect(x: x, y: y, width: width, height: 96))
            y += 112
        }
    }

    private func makeCard(index: Int) -> UIView {
        let card = UIView.jobsMake { _ in }
        card
            .byBackgroundColor(UIColor(r: 0.86 * 255, g: 0.72 * 255, b: 0.91 * 255))
            .byCornerRadius(12)
            .byShadowColor(JobsCor.black)
            .byShadowOpacity(0.15)
            .byShadowOffset(CGSize(width: 0, height: 3))
            .byShadowRadius(6)
        let iconLabel = UILabel.jobsMake { _ in }
        iconLabels.append(iconLabel)
        iconLabel
            .byText("✉")
            .byTextAlignment(.center)
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.boldSystemFont(ofSize: 34))
            .byBackgroundColor(UIColor(r: 255, g: 0.32 * 255, b: 0.13 * 255))
            .byCornerRadius(8)
            .byMasksToBounds(true)
        let titleLabel = UILabel.jobsMake { _ in }
        titleLabels.append(titleLabel)
        titleLabel
            .byText("\(sectionTitle) - \(menuTitle) 活动 \(index + 1)")
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byNumberOfLines(2)
        let subtitleLabel = UILabel.jobsMake { _ in }
        subtitleLabels.append(subtitleLabel)
        subtitleLabel
            .byText("神秘彩金等你来拿".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 15))
        iconLabel.byAddTo(card)
        titleLabel.byAddTo(card)
        subtitleLabel.byAddTo(card)
        iconLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 58, height: 58))
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconLabel.snp.right).offset(16)
            make.right.equalToSuperview().inset(14)
            make.top.equalToSuperview().offset(20)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        };return card
    }
}
