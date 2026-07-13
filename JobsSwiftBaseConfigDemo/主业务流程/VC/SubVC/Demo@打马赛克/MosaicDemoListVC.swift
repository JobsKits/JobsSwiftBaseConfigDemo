//
//  MosaicDemoListVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import JobsScale
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class MosaicDemoListVC: BaseVC {
    private enum Row: Int, CaseIterable {
        case wholeImage
        case brush

        var title: String {
            switch self {
            case .wholeImage: return "整图粗细马赛克"
            case .brush: return "手势涂抹马赛克"
            }
        }

        var subtitle: String {
            switch self {
            case .wholeImage: return "右侧拖动开关控制马赛克块大小，图片经 SDWebImage 封装加载"
            case .brush: return "右上角开关开启后，手指划过的位置局部马赛克，图片经 Kingfisher 封装加载"
            }
        }

        var vcType: UIViewController.Type {
            switch self {
            case .wholeImage: return MosaicWholeImageDemoVC.self
            case .brush: return MosaicBrushDemoVC.self
            }
        }
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(86.h)
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
        jobsSetupGKNav(title: "打马赛克".tr)
        tableView.byVisible(true)
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension MosaicDemoListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.allCases[indexPath.row]
        let cell = tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byAccessoryType(.disclosureIndicator)
        var config = cell.defaultContentConfiguration()
        config.text = row.title
        config.secondaryText = row.subtitle
        config.textProperties.font = JobsFont.systemFont(ofSize: 17, weight: .semibold)
        config.secondaryTextProperties.font = JobsFont.systemFont(ofSize: 13, weight: .regular)
        config.secondaryTextProperties.numberOfLines = 0
        cell.contentConfiguration = config
        return cell
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Row.allCases[indexPath.row].vcType.init().byPush(self)
    }
}
