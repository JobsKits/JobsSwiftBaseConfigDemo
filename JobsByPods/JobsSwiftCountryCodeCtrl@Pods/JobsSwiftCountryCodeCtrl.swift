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

import JobsSwiftBaseDefines
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
    public struct Country {
        public let countryName: String
        public let code: String
        public let regionCode: String

        public var flag: String {
            if regionCode == "TW" { return "🇹🇼" }
            let regionalIndicatorOffset: UInt32 = 127397
            let scalars = regionCode.uppercased().unicodeScalars.compactMap {
                UnicodeScalar(regionalIndicatorOffset + $0.value)
            }
            guard scalars.count == 2 else { return "🏳️" };return String(String.UnicodeScalarView(scalars))
        }

        public var displayName: String {
            "\(flag) \(countryName)"
        }

        fileprivate init(countryName: String,
                         code: String,
                         regionCode: String) {
            self.countryName = countryName
            self.code = code
            self.regionCode = regionCode
        }
    }

    public weak var countryCodeDelegate: JobsSwiftCountryCodeCtrlDelegate?
    public var countryCodeHandler: JobsSwiftCountryCodeHandler?
    public var countrySelectionHandler: ((Country) -> Void)?

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
            .bySeparatorColor(JobsCor.separator)
            .bySectionIndexColor(JobsCor.systemBlue)
            .bySectionIndexBackgroundColor(JobsCor.clear)
            .bySectionIndexTrackingBackgroundColor(JobsCor.tertiarySystemFill)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
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

    func countryInfo(at indexPath: IndexPath) -> Country? {
        guard indexArray.indices.contains(indexPath.section) else { return nil }
        let key = indexArray[indexPath.section]
        guard let rows = sortedNameDict[key],
              rows.indices.contains(indexPath.row) else { return nil }
        let row = rows[indexPath.row]
        guard let separatorRange = row.range(of: "+", options: .backwards) else { return nil }
        let countryName = String(row[..<separatorRange.lowerBound])
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let code = String(row[separatorRange.upperBound...])
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard let regionCode = Self.regionCode(for: countryName) else { return nil };return Country(
            countryName: countryName,
            code: code,
            regionCode: regionCode)
    }

    func selectCountry(at indexPath: IndexPath) {
        guard let country = countryInfo(at: indexPath) else { return }
        countryCodeDelegate?.jobsSwiftCountryCodeCtrl(self,
                                                      didSelectCountryName: country.countryName,
                                                      code: country.code)
        countryCodeHandler?(country.countryName, country.code)
        countrySelectionHandler?(country)
        if let navigationController {
            navigationController.popViewController(animated: true)
        } else {
            presentingViewController?.dismiss(animated: true)
        }
    }

    static func regionCode(for countryName: String) -> String? {
        regionCodeByCountryName[normalizedCountryName(countryName)]
    }

    static func normalizedCountryName(_ countryName: String) -> String {
        countryName
            .folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive],
                     locale: Locale(identifier: "en_US_POSIX"))
            .unicodeScalars
            .filter { CharacterSet.alphanumerics.contains($0) }
            .map(String.init)
            .joined()
    }

    static let regionCodeAliases: [String: String] = [
        "中国": "CN", "中国台湾": "TW", "中国澳门": "MO", "中国香港": "HK",
        "中非": "CF", "刚果": "CG", "刚果民主共和国": "CD", "加那利群岛": "IC",
        "千里达及托巴哥": "TT", "密克罗尼西亚联邦": "FM", "巴勒斯坦": "PS",
        "布基拉法索": "BF", "格陵兰岛": "GL", "波黑": "BA", "留尼旺岛": "RE",
        "荷属安的列斯": "CW", "蒙塞拉特岛": "MS", "西萨摩亚": "WS", "阿森松": "AC",
        "阿鲁巴岛": "AW", "马其顿": "MK",
        "Antigua and Barbuda": "AG", "Bosnia and Herzegovina": "BA",
        "British Indian Ocean Territory": "IO", "Brunei Darussalam": "BN", "China": "CN",
        "Czech Republic": "CZ", "Macedonia": "MK", "Myanmar": "MM",
        "Saint Barthélemy": "BL", "Saint Helena": "SH", "Saint Kitts and Nevis": "KN",
        "Saint Lucia": "LC", "Saint Martin": "MF", "Saint Pierre and Miquelon": "PM",
        "Saint Vincent and the Grenadines": "VC", "Svalbard and Jan Mayen": "SJ",
        "Swaziland": "SZ", "São Tomé and Príncipe": "ST", "Trinidad and Tobago": "TT",
        "Turkey": "TR", "Turks and Caicos Islands": "TC", "Virgin Islands, British": "VG",
        "Virgin Islands, U.S.": "VI", "Wallis and Futuna": "WF"
    ]

    static let regionCodeByCountryName: [String: String] = {
        let locales = ["en_US", "en_GB", "zh_Hans_CN", "zh_Hant_TW", "zh_Hant_HK"]
            .map(Locale.init(identifier:))
        let regionCodes: [String]
        if #available(iOS 16.0, *) {
            regionCodes = Locale.Region.isoRegions.map(\.identifier)
        } else {
            regionCodes = Locale.isoRegionCodes
        }
        var result: [String: String] = [:]
        for regionCode in regionCodes {
            for locale in locales {
                guard let countryName = locale.localizedString(forRegionCode: regionCode) else { continue }
                let key = normalizedCountryName(countryName)
                if result[key] == nil {
                    result[key] = regionCode
                }
            }
        }
        regionCodeAliases.forEach {
            result[normalizedCountryName($0.key)] = $0.value
        };return result
    }()
}

extension JobsSwiftCountryCodeCtrl: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        indexArray.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard indexArray.indices.contains(section) else { return 0 };return sortedNameDict[indexArray[section]]?.count ?? 0
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "JobsSwiftCountryCodeCtrlCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        let country = countryInfo(at: indexPath)
        cell.bySelectionStyle(.none)
        cell.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        cell.contentView.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        cell.textLabel?.byText(country?.displayName)
        cell.textLabel?.byFont(JobsFont.systemFont(ofSize: 16, weight: .regular))
        cell.textLabel?.byTextColor(JobsCor.label)
        cell.detailTextLabel?.byText(country.map { "+\($0.code)" })
        cell.detailTextLabel?.byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
        cell.detailTextLabel?.byTextColor(JobsCor.secondaryLabel)
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
