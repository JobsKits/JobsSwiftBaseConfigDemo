//
//  JobsIconfontReuseListDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

import GKNavigationBarSwift
import JobsByUIKit
import JobsIconfont
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import UIKit

final class JobsIconfontReuseListDemoVC: BaseVC {
    private let assets: [JobsIconfontRemoteAsset] = [.logo, .fontBanner, .usageGuide, .invalidURL]

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(74)
            .byRegisterCell(JobsIconfontReuseCell.self)
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
        jobsSetupGKNav(title: title ?? "列表复用与防串图".tr)
        tableView.byVisible(true)
    }
}

extension JobsIconfontReuseListDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        80
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let asset = assets[indexPath.row % assets.count]
        return tableView
            .byDequeueReusableCell(withType: JobsIconfontReuseCell.self, for: indexPath)
            .byAsset(asset, row: indexPath.row)
    }
}

private final class JobsIconfontReuseCell: UITableViewCell {
    private lazy var iconView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byContentMode(.scaleAspectFit)
            .byCornerRadius(10)
            .byClipsToBounds(true)
            .byAddTo(contentView) { make in
                make.left.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 50, height: 50))
            }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalTo(iconView.snp.right).offset(14)
                make.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview().offset(-10)
            }
    }()

    private lazy var stateLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.left.right.equalTo(titleLabel)
                make.top.equalTo(titleLabel.snp.bottom).offset(4)
            }
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        iconView.byVisible(true)
        titleLabel.byVisible(true)
        stateLabel.byVisible(true)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.byCancelJobsIconfontLoad()
        stateLabel.byText("已取消旧任务")
    }

    @discardableResult
    func byAsset(_ asset: JobsIconfontRemoteAsset, row: Int) -> Self {
        titleLabel.byText("Row \(row + 1)｜\(asset.title)")
        iconView.byJobsIconfont(
            asset,
            targetSize: CGSize(width: 50, height: 50)
        ) { [weak self] event in
            switch event {
            case .placeholder:
                self?.stateLabel.byText("本地占位图")
            case .success(let loader, let cache):
                self?.stateLabel.byText("\(loader.rawValue)｜\(cache ? "缓存" : "网络")")
            case .failure:
                self?.stateLabel.byText("失败兜底")
            }
        };return self
    }
}
