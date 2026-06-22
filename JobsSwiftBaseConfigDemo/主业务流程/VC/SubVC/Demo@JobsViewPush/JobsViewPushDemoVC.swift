//
//  JobsViewPushDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026/6/21.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsViewPush
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class JobsViewPushDemoVC: BaseVC {

    private lazy var directionControl: UISegmentedControl = {
        UISegmentedControl(items: ["上", "下", "左", "右"])
            .bySelectedSegmentIndex(3)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(24)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
                }
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(36)
            }
    }()

    private lazy var ratioLabel: UILabel = {
        UILabel()
            .byText("覆盖比例：65%")
            .byFont(.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(.label)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(directionControl.snp.bottom).offset(28)
                make.left.equalToSuperview().offset(24)
            }
    }()

    private lazy var ratioSlider: UISlider = {
        UISlider()
            .byMinimumValue(0.25)
            .byMaximumValue(1)
            .byValue(0.65)
            .onJobsChange { [weak self] (slider: UISlider) in
                self?.ratioLabel.text = "覆盖比例：\(Int(slider.value * 100))%"
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(ratioLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var tipLabel: UILabel = {
        UILabel()
            .byText("推出后可沿来路拖动退出；比例不足 100% 时，点击露出的底层区域也会退出。")
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 14))
            .byTextColor(.secondaryLabel)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(ratioSlider.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var pushButton: UIButton = {
        UIButton(type: .system)
            .byTitle("Push BView", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 18, weight: .bold))
            .byBackgroundColor(.systemBlue)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.pushDemoView()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(tipLabel.snp.bottom).offset(32)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(52)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsViewPush")
        view.backgroundColor = .systemBackground
        directionControl.byVisible(YES)
        ratioLabel.byVisible(YES)
        ratioSlider.byVisible(YES)
        tipLabel.byVisible(YES)
        pushButton.byVisible(YES)
    }
}

private extension JobsViewPushDemoVC {

    var selectedDirection: JobsViewPushDirection {
        switch directionControl.selectedSegmentIndex {
        case 0: return .top
        case 1: return .bottom
        case 2: return .left
        default: return .right
        }
    }

    func pushDemoView() {
        let panel = JobsViewPushDemoPanel()
        let presentation = view.jobsPush(
            panel,
            configuration: JobsViewPushConfiguration(
                direction: selectedDirection,
                presentedRatio: CGFloat(ratioSlider.value)
            )
        )
        panel.closeHandler = { [weak presentation] in
            presentation?.dismiss()
        }
    }
}

private final class JobsViewPushDemoPanel: UIView {

    var closeHandler: (() -> Void)?

    private lazy var titleLabel: UILabel = {
        UILabel()
            .byText("BView")
            .byTextAlignment(.center)
            .byFont(.systemFont(ofSize: 32, weight: .black))
            .byTextColor(.white)
            .byAddTo(self) { make in
                make.center.equalToSuperview()
            }
    }()

    private lazy var closeButton: UIButton = {
        UIButton(type: .system)
            .byTitle("主动退出", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .semibold))
            .byBorderColor(.white)
            .byBorderWidth(1)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                self?.closeHandler?()
            }
            .byAddTo(self) { [unowned self] make in
                make.top.equalTo(titleLabel.snp.bottom).offset(28)
                make.centerX.equalToSuperview()
                make.width.equalTo(120)
                make.height.equalTo(44)
            }
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemIndigo
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.24
        layer.shadowRadius = 12
        titleLabel.byVisible(YES)
        closeButton.byVisible(YES)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
