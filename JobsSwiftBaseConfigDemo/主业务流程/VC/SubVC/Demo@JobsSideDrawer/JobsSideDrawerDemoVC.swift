//
//  JobsSideDrawerDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月12日，星期日.
//

import UIKit
import GKNavigationBarSwift
import JobsInheritance
import JobsByUIKit
import JobsViewPush
import JobsSwiftBaseDefines
import SnapKit

final class JobsSideDrawerDemoVC: BaseVC {
    private lazy var directionControl: UISegmentedControl = {
        UISegmentedControl(items: ["上".tr, "下".tr, "左".tr, "右".tr])
            .bySelectedSegmentIndex(2)
    }()

    private lazy var modeControl: UISegmentedControl = {
        UISegmentedControl(items: ["跟随".tr, "固定".tr])
            .bySelectedSegmentIndex(0)
    }()

    private lazy var carrierControl: UISegmentedControl = {
        UISegmentedControl(items: ["UIViewController", "UIView"])
            .bySelectedSegmentIndex(0)
    }()

    private lazy var ratioSlider: UISlider = {
        UISlider()
            .byMinimumValue(0.2)
            .byMaximumValue(0.9)
            .byValue(0.5)
            .byAddTarget(self, action: #selector(updateRatio), for: .valueChanged)
    }()

    private lazy var ratioLabel: UILabel = {
        UILabel()
    }()

    private lazy var previewButton: UIButton = {
        UIButton.sys()
            .byTitle("立即预览".tr)
            .onTap { [weak self] _ in
                self?.preview()
            }
    }()

    private lazy var optionStack: UIStackView = {
        UIStackView(arrangedSubviews: [
            self.directionControl,
            self.modeControl,
            self.carrierControl,
            self.ratioLabel,
            self.ratioSlider,
            self.previewButton
        ])
        .byAxis(.vertical)
        .bySpacing(22)
        .byTranslatesAutoresizingMaskIntoConstraints(false)
    }()

    private var drawerPage: UIView?
    private var mainPage: UIView?
    private var drawerPageController: UIViewController?
    private var mainPageController: UIViewController?
    private var sideDrawerController: JobsSideDrawerVC?
    private var pageViews: [UIView] = []
    private var pageLabels: [UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "侧滑抽屉".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        optionStack.byAddTo(view) { [unowned self] make in
            make.leading.trailing.equalToSuperview().inset(24)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(16)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            }
        }
        updateRatio()
    }

    @objc private func updateRatio() {
        ratioLabel.byText(String(format: "推出比例：%.0f%%", ratioSlider.value * 100))
    }

    private func preview() {
        let directions: [JobsSideDrawerDirection] = [.top, .bottom, .left, .right]
        let configuration = JobsSideDrawerConfiguration(
            direction: directions[directionControl.selectedSegmentIndex],
            contentMode: modeControl.selectedSegmentIndex == 0 ? .following : .fixed,
            presentedRatio: CGFloat(ratioSlider.value),
            onDidClose: { [weak self] in
                self?.dismissPreview()
            }
        )
        pageViews.removeAll()
        pageLabels.removeAll()
        drawerPage = makePage(text: "侧滑菜单\n点击遮罩原路返回", color: JobsCor.systemBlue)
        mainPage = makePage(text: "底部内容", color: JobsCor.systemBackground)
        guard let drawerPage, let mainPage else { return }
        if carrierControl.selectedSegmentIndex == 0 {
            drawerPageController = UIViewController()
            drawerPageController?.view = drawerPage
            mainPageController = UIViewController()
            mainPageController?.view = mainPage
            guard let drawerPageController, let mainPageController else { return }
            sideDrawerController = JobsSideDrawerVC(
                drawerViewController: drawerPageController,
                mainViewController: mainPageController,
                configuration: configuration
            )
        }else{
            drawerPageController = nil
            mainPageController = nil
            sideDrawerController = JobsSideDrawerVC(
                drawerView: drawerPage,
                mainView: mainPage,
                configuration: configuration
            )
        }
        guard let sideDrawerController else { return }
        sideDrawerController.modalPresentationStyle = .fullScreen
        present(sideDrawerController, animated: false) { sideDrawerController.openDrawer() }
    }

    private func dismissPreview() {
        sideDrawerController?.dismiss(animated: false) { [weak self] in
            self?.resetPreview()
        }
    }

    private func resetPreview() {
        sideDrawerController = nil
        drawerPageController = nil
        mainPageController = nil
        drawerPage = nil
        mainPage = nil
        pageViews.removeAll()
        pageLabels.removeAll()
    }

    private func makePage(text: String, color: UIColor) -> UIView {
        let page = UIView()
            .byBackgroundColor(color)
        pageViews.append(page)
        let label = UILabel()
            .byText(text)
            .byNumberOfLines(0)
            .byTextAlignment(.center)
        pageLabels.append(label)
        label.byAddTo(page) { make in
            make.center.equalToSuperview()
        };return page
    }
}
