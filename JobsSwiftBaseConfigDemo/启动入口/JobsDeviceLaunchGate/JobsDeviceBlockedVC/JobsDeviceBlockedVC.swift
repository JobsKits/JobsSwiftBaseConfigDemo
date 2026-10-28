//
//  JobsDeviceBlockedVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import UIKit
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDeviceGuard
import SnapKit

/// 独立系统控制器，不进入 BaseVC、业务导航、开屏或 Flutter 管线。
final class JobsDeviceBlockedVC: UIViewController {

    let launchDecision: JobsDeviceLaunchDecision

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { scroll in
            scroll
                .byAlwaysBounceVertical(false)
                .byAddTo(view) { [unowned self] make in
                    make.edges.equalTo(view.safeAreaLayoutGuide)
                }
        }
    }()

    private lazy var contentView: UIView = {
        UIView.jobsMake { content in
            content.byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.width.equalTo(scrollView.frameLayoutGuide)
                make.height.greaterThanOrEqualTo(scrollView.frameLayoutGuide)
                make.height.equalTo(scrollView.frameLayoutGuide).priority(250)
            }
        }
    }()

    private lazy var shieldView: UIImageView = {
        UIImageView.jobsMake { image in
            image
                .byImage(UIImage.make(named: "JobsDeviceGuardShield"))
                .byContentMode(.scaleAspectFit)
                .byTintColor(JobsCor.label)
                .byAccessibilityIdentifier("launchGate.shield")
            image.snp.makeConstraints { make in
                make.size.equalTo(72)
            }
        }
    }()

    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { label in
            label
                .byText("设备环境受限")
                .byFont(JobsFont.systemFont(ofSize: 24,
                                            weight: .semibold))
                .byTextColor(JobsCor.label)
                .byTextAlignment(.center)
                .byNumberOfLines(0)
                .byAccessibilityIdentifier("launchGate.title")
        }
    }()

    private lazy var messageLabel: UILabel = {
        UILabel.jobsMake { label in
            label
                .byText("当前设备环境未通过应用启动校验。\n为保护账户与数据，应用已停止业务初始化。\n请使用未越狱的设备重新打开应用。")
                .byFont(JobsFont.systemFont(ofSize: 16))
                .byTextColor(JobsCor.label)
                .byTextAlignment(.center)
                .byNumberOfLines(0)
                .byAccessibilityIdentifier("launchGate.message")
        }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { label in
            label
                .byText("检测状态：\(launchDecision.report.verdict.rawValue)\n如需帮助，请联系应用服务方。")
                .byFont(JobsFont.systemFont(ofSize: 13))
                .byTextColor(JobsCor.label)
                .byTextAlignment(.center)
                .byNumberOfLines(0)
                .byAccessibilityIdentifier("launchGate.status")
        }
    }()

    private lazy var contentStack: UIStackView = {
        UIStackView.jobsMake { stack in
            stack
                .byAxis(.vertical)
                .byAlignment(.center)
                .bySpacing(20)
                .byAddArrangedSubview(shieldView)
                .byAddArrangedSubview(titleLabel)
                .byAddArrangedSubview(messageLabel)
                .byAddArrangedSubview(statusLabel)
                .byAddTo(contentView) { make in
                    make.centerY.equalToSuperview()
                    make.left.right.equalToSuperview().inset(28)
                    make.top.greaterThanOrEqualToSuperview().offset(28)
                    make.bottom.lessThanOrEqualToSuperview().inset(28)
                }
        }
    }()

    init(decision: JobsDeviceLaunchDecision) {
        launchDecision = decision
        super.init(nibName: nil,
                   bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view
            .byBackgroundColor(JobsCor.systemBackground)
            .byAccessibilityIdentifier("launchGate.blocked.root")
        assembleViews()
        configureAppearance()
    }

    private func configureAppearance() {
        // 仅加载页面配色，让被拦启动仍遵守宿主已保存的主题。
        do {
            try JobsThemeCenter.shared.configure(resource: "JobsThemeResources")
        } catch {
            print("[JobsDeviceLaunchGate] 主题资源不可用，使用系统语义配色：\(error.localizedDescription)")
        }
        JobsThemeCenter.shared.bind(self,
                                    slot: "launchGate.appearance") { object, center in
            guard let controller = object as? JobsDeviceBlockedVC else {
                return
            }
            controller.byOverrideUserInterfaceStyle(center.isDarkMode ? .dark : .light)
        }
    }

    private func assembleViews() {
        contentStack.byVisible(true)
        for label in [titleLabel, messageLabel, statusLabel] {
            label.snp.makeConstraints { [unowned self] make in
                make.width.equalTo(contentStack)
            }
        }
    }
}
