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
    private lazy var countryCodeController = JobsSwiftCountryCodeCtrl()

    private lazy var countryCodeTextField: UITextField = {
        UITextField()
            .byText("")
            .byPlaceholder("请选择国家 / 地区代码".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextAlignment(.center)
            .byBorderStyle(.roundedRect)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byUserInteractionEnabled(false)
            .byAddTo(view) { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var selectButton: UIButton = {
        UIButton.sys()
            .byTitle("选择".tr, for: .normal)
            .byTitleColor(JobsCor.systemBackground, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byBackgroundColor(JobsCor.label)
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
        applyThemeChrome()
        countryCodeTextField.byVisible(true)
        selectButton.byVisible(true)
        refreshSelectedCountry()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard #available(iOS 13.0, *),
              previousTraitCollection?.hasDifferentColorAppearance(comparedTo: traitCollection) == true else { return }
        applyThemeChrome()
    }
}

private extension JobsSwiftCountryCodeCtrlDemoVC {
    func applyThemeChrome() {
        view.byBackgroundColor(JobsCor.systemBackground)
        gk_navBackgroundColor = JobsCor.systemBackground
        gk_navTitleColor = JobsCor.label
        gk_navShadowColor = JobsCor.separator
        gk_navigationBar.byBackgroundColor(JobsCor.systemBackground)
        gk_navigationBar.byTintColor(JobsCor.label)
    }

    func pushCountryCodeCtrl() {
        if #available(iOS 13.0, *) {
            countryCodeController.byOverrideUserInterfaceStyle(traitCollection.userInterfaceStyle)
        }
        countryCodeController.countrySelectionHandler = { [weak self] country in
            self?.showSelectedCountry(country)
        }
        navigationController?.pushViewController(countryCodeController, animated: true)
    }

    func refreshSelectedCountry() {
        guard let country = JobsSwiftCountryCodeCtrl.selectedCountry else { return }
        showSelectedCountry(country)
    }

    func showSelectedCountry(_ country: JobsSwiftCountryCodeCtrl.Country) {
        countryCodeTextField.byText("\(country.displayName) +\(country.code)")
    }
}
