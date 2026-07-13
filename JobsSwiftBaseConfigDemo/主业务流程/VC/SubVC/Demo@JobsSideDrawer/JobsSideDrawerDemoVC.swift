//
//  JobsSideDrawerDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月12日，星期日.
//

import UIKit
import JobsInheritance
import JobsByUIKit
import JobsViewPush

final class JobsSideDrawerDemoVC: BaseVC {
    private let directionControl = UISegmentedControl(items: ["上".tr, "下".tr, "左".tr, "右".tr])
    private let modeControl = UISegmentedControl(items: ["跟随".tr, "固定".tr])
    private let carrierControl = UISegmentedControl(items: ["UIViewController", "UIView"])
    private let ratioSlider = UISlider()
    private let ratioLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "侧滑抽屉".tr
        view.backgroundColor = .systemBackground
        directionControl.selectedSegmentIndex = 2
        modeControl.selectedSegmentIndex = 0
        carrierControl.selectedSegmentIndex = 0
        ratioSlider.minimumValue = 0.2
        ratioSlider.maximumValue = 0.9
        ratioSlider.value = 0.5
        ratioSlider.addTarget(self, action: #selector(updateRatio), for: .valueChanged)
        let button = UIButton(type: .system)
        button.setTitle("立即预览".tr, for: .normal)
        button.addTarget(self, action: #selector(preview), for: .touchUpInside)
        let stack = UIStackView(arrangedSubviews: [directionControl, modeControl, carrierControl, ratioLabel, ratioSlider, button])
        stack.axis = .vertical
        stack.spacing = 22
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
        updateRatio()
    }

    @objc private func updateRatio() {
        ratioLabel.text = String(format: "推出比例：%.0f%%", ratioSlider.value * 100)
    }

    @objc private func preview() {
        let directions: [JobsSideDrawerDirection] = [.top, .bottom, .left, .right]
        let configuration = JobsSideDrawerConfiguration(
            direction: directions[directionControl.selectedSegmentIndex],
            contentMode: modeControl.selectedSegmentIndex == 0 ? .following : .fixed,
            presentedRatio: CGFloat(ratioSlider.value)
        )
        let drawer = makePage(text: "侧滑菜单\n点击遮罩原路返回", color: .systemBlue)
        let main = makePage(text: "底部内容", color: .systemBackground)
        let controller: JobsSideDrawerVC
        if carrierControl.selectedSegmentIndex == 0 {
            let drawerVC = UIViewController(); drawerVC.view = drawer
            let mainVC = UIViewController(); mainVC.view = main
            controller = JobsSideDrawerVC(drawerViewController: drawerVC, mainViewController: mainVC, configuration: configuration)
        }else{
            controller = JobsSideDrawerVC(drawerView: drawer, mainView: main, configuration: configuration)
        }
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: false) { controller.openDrawer() }
    }

    private func makePage(text: String, color: UIColor) -> UIView {
        let page = UIView(); page.backgroundColor = color
        let label = UILabel(); label.text = text; label.numberOfLines = 0; label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        page.addSubview(label)
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: page.centerXAnchor), label.centerYAnchor.constraint(equalTo: page.centerYAnchor)])
        return page
    }
}
