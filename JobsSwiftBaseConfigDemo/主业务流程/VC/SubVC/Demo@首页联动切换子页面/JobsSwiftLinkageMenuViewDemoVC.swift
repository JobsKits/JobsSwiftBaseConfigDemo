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
        control.selectedSegmentIndex = LayoutMode.fixedMenu.rawValue
        control.addTarget(self, action: #selector(modeChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var callbackLabel: UILabel = {
        UILabel()
            .byText("当前菜单：日常.1")
            .byTextColor(.darkGray)
            .byFont(.systemFont(ofSize: 13))
            .byNumberOfLines(1)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        jobsSetupGKNav(title: "首页联动切换子页面")
        mountControls()
        rebuildLinkageView()
    }

    private func mountControls() {
        view.addSubview(modeControl)
        view.addSubview(callbackLabel)
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
        config.menuBackgroundColor = UIColor(white: 0.96, alpha: 1)
        config.contentBackgroundColor = .white
        config.selectedTintColor = UIColor(red: 1, green: 0.55, blue: 0, alpha: 1)
        config.selectedBackgroundColor = UIColor(red: 1, green: 0.55, blue: 0, alpha: 0.18)

        switch LayoutMode(rawValue: modeControl.selectedSegmentIndex) ?? .fixedMenu {
        case .fixedMenu:
            config.menuWidth = 96
        case .fixedContent:
            config.contentWidth = 260
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
        self.view.addSubview(view)
        view.snp.makeConstraints { [unowned self] make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(callbackLabel.snp.bottom).offset(8)
        }
    }

    private func makeMenuItems() -> [JobsSwiftLinkageMenuItem] {
        menuTitles.map {
            JobsSwiftLinkageMenuItem(title: $0,
                                     image: iconImage(color: .gray),
                                     selectedImage: iconImage(color: UIColor(red: 1, green: 0.55, blue: 0, alpha: 1)))
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
        let path = UIBezierPath()
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        for i in 0..<10 {
            let radius: CGFloat = i.isMultiple(of: 2) ? 12 : 5
            let angle = CGFloat(i) * .pi / 5 - .pi / 2
            let point = CGPoint(x: center.x + cos(angle) * radius,
                                y: center.y + sin(angle) * radius)
            i == 0 ? path.move(to: point) : path.addLine(to: point)
        }
        path.close()
        color.setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
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

    init(sectionTitle: String, menuTitle: String) {
        self.sectionTitle = sectionTitle
        self.menuTitle = menuTitle
        super.init(frame: .zero)
        backgroundColor = .white
        for index in 0..<5 {
            let card = makeCard(index: index)
            cards.append(card)
            addSubview(card)
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
            card.frame = CGRect(x: x, y: y, width: width, height: 96)
            y += 112
        }
    }

    private func makeCard(index: Int) -> UIView {
        let card = UIView()
        card.backgroundColor = UIColor(red: 0.86, green: 0.72, blue: 0.91, alpha: 1)
        card.layer.cornerRadius = 12
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.15
        card.layer.shadowOffset = CGSize(width: 0, height: 3)
        card.layer.shadowRadius = 6

        let iconLabel = UILabel()
        iconLabel.text = "✉"
        iconLabel.textAlignment = .center
        iconLabel.textColor = .white
        iconLabel.font = .boldSystemFont(ofSize: 34)
        iconLabel.backgroundColor = UIColor(red: 1, green: 0.32, blue: 0.13, alpha: 1)
        iconLabel.layer.cornerRadius = 8
        iconLabel.layer.masksToBounds = true

        let titleLabel = UILabel()
        titleLabel.text = "\(sectionTitle) - \(menuTitle) 活动 \(index + 1)"
        titleLabel.textColor = .label
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 2

        let subtitleLabel = UILabel()
        subtitleLabel.text = "神秘彩金等你来拿"
        subtitleLabel.textColor = .darkGray
        subtitleLabel.font = .systemFont(ofSize: 15)

        card.addSubview(iconLabel)
        card.addSubview(titleLabel)
        card.addSubview(subtitleLabel)

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
