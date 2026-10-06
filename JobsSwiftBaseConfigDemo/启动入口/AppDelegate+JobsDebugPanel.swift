//
//  AppDelegate+JobsDebugPanel.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#if DEBUG
import UIKit
import JobsDebugPanel
import JobsNetworking
import JobsByUIKit
import JobsInheritance

extension AppDelegate {
    func setupDebugPanel() {
        JobsDebugPanel.shared
            .byEnvironments([
                JobsDebugEnvironment()
                    .byIdentifier("local")
                    .byTitle("本地 Mock")
                    .byBaseURL("http://127.0.0.1:18080"),
                JobsDebugEnvironment()
                    .byIdentifier("httpbin")
                    .byTitle("公共测试")
                    .byBaseURL("https://httpbin.org"),
                JobsDebugEnvironment()
                    .byIdentifier("postman")
                    .byTitle("联调测试")
                    .byBaseURL("https://postman-echo.com")
            ])
            .byEnvironmentDidChange { environment in
                JobsNetworkingDebugEnvironment.shared.byBaseURL(environment.baseURL)
            }
            .byAddAction(
                JobsDebugAction()
                    .byTitle("调试面板使用示例")
                    .byAction { source in
                        source.navigationController?.pushViewControllerByAnimated(JobsDebugPanelDemoVC())
                    }
            )
            .byAddAction(
                JobsDebugAction()
                    .byTitle("查看当前环境")
                    .byAction { source in
                        let environment = JobsDebugPanel.shared.selectedEnvironment
                        let message = "\(environment?.title ?? "未配置")\n\(environment?.urlString ?? "")"
                        UIAlertController.makeAlert("当前网络环境", message)
                            .byAddAction(title: "知道了")
                            .byPresent(source, animated: true)
                    }
            )
            .byStart()
    }
}
#endif
