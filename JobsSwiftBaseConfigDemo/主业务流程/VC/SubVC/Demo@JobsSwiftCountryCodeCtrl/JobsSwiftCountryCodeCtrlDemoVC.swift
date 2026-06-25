//
//  JobsSwiftCountryCodeCtrlDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftCountryCodeCtrl
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftCountryCodeCtrlDemoVC: BaseVC {

    private lazy var countryCodeTextField: UITextField = {
        UITextField()
            .byText("")
            .byPlaceholder("请选择国家 / 地区代码".tr)
            .byTextColor(.label)
            .byFont(.systemFont(ofSize: 14, weight: .regular))
            .byTextAlignment(.center)
            .byBorderStyle(.roundedRect)
            .byUserInteractionEnabled(false)
            .byAddTo(view) { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var selectButton: UIButton = {
        UIButton(type: .system)
            .byTitle("选择".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 14, weight: .regular))
            .byBackgroundColor(.label)
            .byCornerRadius(6)
            .onTap { [weak self] _ in
                self?.pushCountryCodeCtrl()
            }
            .byAddTo(view) { [unowned self] make in
                make.centerY.equalTo(countryCodeTextField)
                make.left.equalTo(countryCodeTextField.snp.right).offset(12)
                make.right.equalToSuperview().offset(-24)
                make.width.equalTo(88)
                make.height.equalTo(44)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsSwiftCountryCodeCtrl".tr)
        view.backgroundColor = .systemBackground
        countryCodeTextField.byVisible(true)
        selectButton.byVisible(true)
    }
}

private extension JobsSwiftCountryCodeCtrlDemoVC {

    func pushCountryCodeCtrl() {
        let controller = JobsSwiftCountryCodeCtrl()
        controller.countryCodeHandler = { [weak self] countryName, code in
            self?.countryCodeTextField.text = "\(countryName) +\(code)"
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
