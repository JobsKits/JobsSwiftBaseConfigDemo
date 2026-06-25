//
//  JobsSwiftCountryCodeCtrl.swift
//  JobsSwiftCountryCodeCtrl
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL
import JobsByUIKit
import Jobsl10n
import SnapKit

public typealias JobsSwiftCountryCodeHandler = (_ countryName: String, _ code: String) -> Void

public protocol JobsSwiftCountryCodeCtrlDelegate: AnyObject {
    func jobsSwiftCountryCodeCtrl(_ controller: JobsSwiftCountryCodeCtrl,
                                  didSelectCountryName countryName: String,
                                  code: String)
}

public final class JobsSwiftCountryCodeCtrl: UIViewController {

    public weak var countryCodeDelegate: JobsSwiftCountryCodeCtrlDelegate?
    public var countryCodeHandler: JobsSwiftCountryCodeHandler?

    private var sortedNameDict: [String: [String]] = [:]
    private lazy var indexArray: [String] = {
        sortedNameDict.keys.sorted()
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .grouped)
            .byDelegate(self)
            .byDataSource(self)
            .byRowHeight(44)
            .bySeparatorStyle(.singleLine)
            .byShowsVerticalScrollIndicator(false)
            .byShowsHorizontalScrollIndicator(false)
            .byBackgroundColor(.clear)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "国家 / 地区代码".tr
        view.backgroundColor = .white
        sortedNameDict = loadCountryCodeDictionary()
        tableView.byVisible(true)
    }
}

private extension JobsSwiftCountryCodeCtrl {

    var plistName: String {
        let language = Locale.preferredLanguages.first?.lowercased() ?? ""
        return language.hasPrefix("en") ? "sortedNameEN" : "sortedNameCH"
    }

    func loadCountryCodeDictionary() -> [String: [String]] {
        let bundles = [
            Bundle(for: JobsSwiftCountryCodeCtrl.self),
            Bundle.main
        ]
        for bundle in bundles {
            if let url = bundle.url(forResource: plistName, withExtension: "plist"),
               let dict = NSDictionary(contentsOf: url) as? [String: [String]] {
                return dict
            }
            if let url = bundle.url(forResource: plistName,
                                    withExtension: "plist",
                                    subdirectory: "JobsSwiftCountryCodeCtrl@plist"),
               let dict = NSDictionary(contentsOf: url) as? [String: [String]] {
                return dict
            }
        };return [:]
    }

    func countryInfo(at indexPath: IndexPath) -> (countryName: String, code: String)? {
        guard indexArray.indices.contains(indexPath.section) else { return nil }
        let key = indexArray[indexPath.section]
        guard let rows = sortedNameDict[key],
              rows.indices.contains(indexPath.row) else { return nil }
        let parts = rows[indexPath.row].components(separatedBy: "+")
        guard parts.count > 1 else { return nil }
        return (parts[0], parts[1])
    }

    func selectCountry(at indexPath: IndexPath) {
        guard let info = countryInfo(at: indexPath) else { return }
        countryCodeDelegate?.jobsSwiftCountryCodeCtrl(self,
                                                      didSelectCountryName: info.countryName,
                                                      code: info.code)
        countryCodeHandler?(info.countryName, info.code)
        if let navigationController {
            navigationController.popViewController(animated: true)
        } else {
            presentingViewController?.dismiss(animated: true)
        }
    }
}

extension JobsSwiftCountryCodeCtrl: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        indexArray.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard indexArray.indices.contains(section) else { return 0 }
        return sortedNameDict[indexArray[section]]?.count ?? 0
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "JobsSwiftCountryCodeCtrlCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        let info = countryInfo(at: indexPath)
        cell.textLabel?.text = info?.countryName
        cell.textLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        cell.detailTextLabel?.text = info.map { "+\($0.code)" }
        cell.detailTextLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        cell.detailTextLabel?.textColor = .secondaryLabel
        cell.selectionStyle = .none
        return cell
    }

    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView === self.tableView ? indexArray : nil
    }

    public func tableView(_ tableView: UITableView,
                          sectionForSectionIndexTitle title: String,
                          at index: Int) -> Int {
        tableView === self.tableView ? index : 0
    }
}

extension JobsSwiftCountryCodeCtrl: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 0.01 : 30
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        indexArray.indices.contains(section) ? indexArray[section] : nil
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCountry(at: indexPath)
    }
}
