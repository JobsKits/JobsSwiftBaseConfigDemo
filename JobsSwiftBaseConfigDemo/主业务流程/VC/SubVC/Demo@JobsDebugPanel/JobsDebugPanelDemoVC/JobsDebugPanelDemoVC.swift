//
//  JobsDebugPanelDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#if DEBUG
import UIKit
import JobsDebugPanel
import JobsNetworking
import JobsInheritance
import JobsByUIKit
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

final class JobsDebugPanelDemoVC: BaseVC, UITableViewDataSource, UITableViewDelegate {
    private var environmentObserver: NSObjectProtocol?
    private var requestToken: JobsRequestToken?
    private var requestGeneration = 0
    private var resultText = "本地演示：环境切换后，后续相对路径请求会使用新 URL。"
    private lazy var agent = JobsDefaultAgent(config: JobsRequestConfig(
        baseURL: URL(string: "https://httpbin.org")!,
        timeout: 3,
        version: "debug-panel-demo",
        defaultRetryPolicy: JobsRetryPolicy(maxRetries: 0, initialDelay: 0, multiplier: 1)
    ))
    private lazy var tableView: UITableView = {
        UITableView.jobsMake { table in
            table
                .byDataSource(self)
                .byDelegate(self)
                .byRowHeight(UITableView.automaticDimension)
                .byEstimatedRowHeight(90)
                .byBackgroundColor(JobsCor.systemBackground)
                .bySeparatorColor(JobsCor.separator)
                .byAddTo(view) { [unowned self] make in
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                    make.left.right.bottom.equalToSuperview()
                }
        }
    }()

    deinit {
        requestToken?.cancel()
        if let environmentObserver {
            NotificationCenter.default.removeObserver(environmentObserver)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsDebugPanel Demo")
        JobsThemeCenter.shared.bind(self, slot: "JobsDebugPanelDemo.appearance") { object, center in
            guard let controller = object as? UIViewController else {
                return
            }
            controller.byOverrideUserInterfaceStyle(center.isDarkMode ? .dark : .light)
        }
        tableView.byVisible(true)
        environmentObserver = NotificationCenter.default.addObserver(
            forName: JobsDebugPanel.environmentDidChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.loadRequest()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadRequest()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title: String
        let detail: String
        let accessory: UITableViewCell.AccessoryType
        switch indexPath.row {
        /// 展示当前生效的 URL 和备注
        case 0:
            let environment = JobsDebugPanel.shared.selectedEnvironment
            title = environment?.title ?? "未配置环境"
            detail = environment?.urlString ?? "请在 AppDelegate 配置 URL 与备注"
            accessory = .none
        /// 与全局悬浮按钮共用 push 入口
        case 1:
            title = "打开调试面板"
            detail = "环境切换 + 按注册顺序排列的自定义功能"
            accessory = .disclosureIndicator
        /// 刷新时始终请求真实 API
        case 2:
            title = "重新请求当前环境 /get"
            detail = "3 秒超时；失败保留本地示例；切换环境会自动重新请求"
            accessory = .disclosureIndicator
        /// 显示真实响应或本地兜底说明
        default:
            title = "请求结果"
            detail = resultText
            accessory = .none
        }
        return UITableViewCell.make(style: .subtitle, reuseIdentifier: "DebugPanelDemo")
            .byText(title)
            .bySecondaryText(detail)
            .byTitleCor(JobsCor.label)
            .byDetailTitleCor(JobsCor.secondaryLabel)
            .byBackgroundColor(JobsCor.systemBackground)
            .byTintColor(JobsCor.label)
            .bySelectedBackgroundView(UIView.jobsMake { $0.byBackgroundColor(JobsCor.secondarySystemBackground) })
            .byContentConfiguration { configuration in
                configuration.textProperties.numberOfLines = 0
                configuration.secondaryTextProperties.numberOfLines = 0
            }
            .byAccessoryType(accessory)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.byDeselectRow(indexPath)
        if indexPath.row == 1 {
            JobsDebugPanel.shared.open(from: self)
        } else if indexPath.row == 2 {
            loadRequest()
        }
    }

    private func loadRequest() {
        requestToken?.cancel()
        requestGeneration += 1
        let generation = requestGeneration
        resultText = "正在请求服务器…\n本地演示已可用，等待服务端响应。"
        reloadIfVisible()
        requestToken = agent.send(JobsRequest(path: "/get", method: .get, timeout: 3), as: Data.self) { [weak self] result in
            DispatchQueue.main.async {
                guard let self, generation == self.requestGeneration else {
                    return
                }
                switch result {
                /// 解析成功后以服务端内容替换本地样例
                case .success(let data):
                    if let object = try? JSONSerialization.jsonObject(with: data),
                       let formatted = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]),
                       let text = String(data: formatted, encoding: .utf8) {
                        self.resultText = "服务端响应\n" + String(text.prefix(1500))
                    } else {
                        self.resultText = "本地演示：服务器响应无法解析，已保留本地示例。\n点击重新请求可重试。"
                    }
                /// 无服务器、离线或超时均能继续查看 Demo
                case .failure(let error):
                    self.resultText = "本地演示：\(error.localizedDescription)\n可继续切换环境；点击重新请求可重试。"
                }
                self.reloadIfVisible()
            }
        }
    }

    private func reloadIfVisible() {
        guard isViewLoaded, tableView.window != nil else {
            return
        }
        tableView.byReloadData()
    }
}
#endif
