//
//  JobsIconfontDemoListVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

import GKNavigationBarSwift
import JobsByUIKit
import JobsIconfont
import JobsInheritance
import JobsScale
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import UIKit

final class JobsIconfontDemoListVC: BaseVC {
    private enum Row: Int, CaseIterable {
        case remoteImage
        case reuse
        case cache
        case iconFont
        case textFont

        var title: String {
            switch self {
            case .remoteImage: return "远程图片与错误兜底"
            case .reuse: return "列表复用与防串图"
            case .cache: return "缓存命中、清理与重载"
            case .iconFont: return "Icon Font / Unicode / UIImage"
            case .textFont: return "阿里妈妈文字字体"
            }
        }

        var subtitle: String {
            switch self {
            case .remoteImage: return "先显示本地图标字体占位图，成功替换；错误 URL 保持兜底图"
            case .reuse: return "快速滚动时自动取消旧任务，并按资源 ID 丢弃过期回调"
            case .cache: return "同一资源自动加载两次观察缓存，再一键清理并强制重载"
            case .iconFont: return "业务只使用语义枚举，字体名和 Unicode 全部藏在框架内"
            case .textFont: return "CoreText 动态注册阿里妈妈数智体，不要求配置 UIAppFonts"
            }
        }

        var vcType: UIViewController.Type {
            switch self {
            case .remoteImage: return JobsIconfontRemoteImageDemoVC.self
            case .reuse: return JobsIconfontReuseListDemoVC.self
            case .cache: return JobsIconfontCacheDemoVC.self
            case .iconFont: return JobsIconfontGlyphDemoVC.self
            case .textFont: return JobsIconfontTextFontDemoVC.self
            }
        }

        var glyph: JobsIconfontGlyph {
            switch self {
            case .remoteImage: return .picture
            case .reuse: return .switcher
            case .cache: return .sort
            case .iconFont: return .component
            case .textFont: return .verified
            }
        }
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(82.h)
            .byRegisterCell(UITableViewCell.self)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsIconfont 全功能封装".tr)
        tableView.byVisible(true)
    }
}

extension JobsIconfontDemoListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let row = Row.allCases[indexPath.row]
        let cell = tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byAccessoryType(.disclosureIndicator)
        var config = cell.defaultContentConfiguration()
        config.image = JobsIconfont.shared.iconImage(
            row.glyph,
            size: CGSize(width: 34, height: 34),
            color: JobsCor.systemBlue
        )
        config.text = row.title
        config.secondaryText = row.subtitle
        config.textProperties.font = JobsFont.systemFont(ofSize: 16, weight: .semibold)
        config.secondaryTextProperties.font = JobsFont.systemFont(ofSize: 12, weight: .regular)
        config.secondaryTextProperties.numberOfLines = 0
        cell.contentConfiguration = config
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Row.allCases[indexPath.row].vcType.init().byPush(self)
    }
}
