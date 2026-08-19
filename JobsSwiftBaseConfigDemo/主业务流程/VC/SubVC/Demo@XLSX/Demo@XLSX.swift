//
//  Demo@XLSX.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsSwiftBaseDefines
import SnapKit
import CoreXLSX
import GKNavigationBarSwift

#if canImport(UniformTypeIdentifiers)
import UniformTypeIdentifiers // iOS 14+
#endif

// MARK: - XLSX Demo（文件导入 + 本地数据注入）
final class XLSXDemoVC: BaseVC {
    // MARK: UI（链式 DSL）
    private lazy var openButton: UIButton = {
        UIButton.sys()
            .byTitle("打开 .xlsx".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byImage("doc.badge.plus".sysImg, for: .normal)
            .byImagePlacement(.leading)
            .byCornerRadius(10)
            .onJobsTap { [weak self] (_: UIButton) in
                self?.openTapped()
            }
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(12)
                }
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(36)
            }
    }()

    private lazy var localButton: UIButton = {
        UIButton.sys()
            .byTitle("加载本地".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byImage("internaldrive".sysImg, for: .normal)
            .byImagePlacement(.leading)
            .byCornerRadius(10)
            .onJobsTap { [weak self] (_: UIButton) in
                self?.loadLocalDemo() // 示例：注入一份本地数据
            }
            .byAddTo(view) { make in
                make.centerY.equalTo(self.openButton.snp.centerY)
                make.left.greaterThanOrEqualTo(self.openButton.snp.right).offset(12)
            }
    }()

    private lazy var sheetControl: UISegmentedControl = {
        UISegmentedControl(items: [])
            .onJobsChange { [weak self] (sc: UISegmentedControl) in
                self?.currentSheetIndex = sc.selectedSegmentIndex
            }
            .byAddTo(view) { make in
                make.centerY.equalTo(self.openButton.snp.centerY)
                make.left.greaterThanOrEqualTo(self.localButton.snp.right).offset(12)
                make.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .bySeparatorStyle(.singleLine)
            .byRegisterCell(RowCell.self)
            .byDataSource(self)
            .byDelegate(self)
            .byBackgroundColor(JobsCor.systemBackground)
            .byAddTo(view) { make in
                make.top.equalTo(self.openButton.snp.bottom).offset(12)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var spinner: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .medium)
            .byAddTo(view) { make in
                make.center.equalToSuperview()
            }
    }()

    // MARK: Model
    private struct SheetData: Equatable {
        let name: String
        let rows: [[String]]
    }
    private var injectedSheets: [SheetData] = []
    /// 从 .xlsx 解析出来的 Sheet（文件）
    private var xlsxSheets: [SheetData] = []

    private var sharedStrings: SharedStrings?
    private var documentPickerViewController: UIDocumentPickerViewController?
    /// 所有要展示的 Sheet = 本地 + 文件（本地在前）
    private var allSheets: [SheetData] { injectedSheets + xlsxSheets }

    private var currentSheetIndex: Int = 0 {
        didSet { tableView.byReloadData() }
    }
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "CoreXLSX"
        )
        sheetControl.apportionsSegmentWidthsByContent = true
        spinner.byHidesWhenStopped(true)
        // 可选：如果 Bundle 里有 sample.xlsx，自动加载
        if let url = Bundle.main.url(forResource: "sample", withExtension: "xlsx") {
            loadXLSX(from: url)
        }
    }
    // MARK: Public API —— 用代码注入“本地 Sheet”
    /// 覆盖本地 Sheet；rows 支持 String / Number / Bool / Date / 自定义类型(用 description)
    public func setLocalSheets(_ sheets: [(name: String, rows: [[Any]])]) {
        injectedSheets = sheets.map { SheetData(name: $0.name, rows: Self.coerceToStrings($0.rows)) }
        refreshSegments(preserveSelection: true)
    }
    /// 追加一个本地 Sheet
    public func appendLocalSheet(name: String, rows: [[Any]]) {
        injectedSheets.append(.init(name: name, rows: Self.coerceToStrings(rows)))
        refreshSegments(preserveSelection: true)
    }

    @discardableResult
    public func bySetLocalSheets(_ sheets: [(name: String, rows: [[Any]])]) -> Self {
        setLocalSheets(sheets); return self
    }
    // MARK: Actions
    @objc private func openTapped() {
        // iOS 14+ 用 UTType；更低版本用老的 documentTypes 构造器
        #if canImport(UniformTypeIdentifiers)
        if #available(iOS 14.0, *) {
            if let xlsx = UTType(filenameExtension: "xlsx") {
                documentPickerViewController = UIDocumentPickerViewController(
                    forOpeningContentTypes: [xlsx],
                    asCopy: true
                )
                documentPickerViewController?.allowsMultipleSelection = false
                documentPickerViewController?.byDelegate(self)
                if let documentPickerViewController {
                    present(documentPickerViewController, animated: true)
                };return
            }
        }
        #endif
        documentPickerViewController = UIDocumentPickerViewController(
            forOpeningContentTypes: [UTType(filenameExtension: "xlsx") ?? .data],
            asCopy: true
        )
            .byAllowsMultipleSelection(NO)
            .byDelegate(self)
        if let documentPickerViewController {
            present(documentPickerViewController, animated: true)
        }
    }
    // MARK: Parsing XLSX
    private func loadXLSX(from url: URL) {
        spinner.startAnimating()
        // ⚠️ 不要清空 injectedSheets（本地），仅替换 xlsxSheets
        xlsxSheets.removeAll()
        refreshSegments(preserveSelection: true) // 先清 UI（避免上一份名字残留）
        let needsStop = url.startAccessingSecurityScopedResource()
        defer {
            if needsStop { url.stopAccessingSecurityScopedResource() }
            spinner.stopAnimating()
        }
        guard let file = XLSXFile(filepath: url.path) else {
            showError("无法打开 XLSX：文件不存在或已损坏")
            return
        }
        do {
            sharedStrings = try file.parseSharedStrings()
            var parsed: [SheetData] = []
            for wbk in try file.parseWorkbooks() {
                for (maybeName, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                    let ws = try file.parseWorksheet(at: path)
                    let name = maybeName ?? "Worksheet"
                    let rows = makeRowsDisplayStrings(from: ws)
                    parsed.append(.init(name: name, rows: rows))
                }
            }
            xlsxSheets = parsed
            refreshSegments(preserveSelection: false)
            if allSheets.isEmpty {
                showError("文件中未发现任何工作表")
            }
        } catch {
            showError("解析失败：\(error.localizedDescription)")
        }
    }
    /// worksheet -> [[String]]（按出现顺序）
    private func makeRowsDisplayStrings(from worksheet: Worksheet) -> [[String]] {
        var result: [[String]] = []
        let rows = worksheet.data?.rows ?? []
        for row in rows {
            var displayRow: [String] = []
            for cell in row.cells {
                displayRow.append(render(cell))
            }
            result.append(displayRow)
        };return result
    }
    /// 单元格文本渲染：SharedStrings -> inlineString -> dateValue -> value
    private func render(_ cell: Cell) -> String {
        if let ss = sharedStrings, let s = cell.stringValue(ss) { return s }
        if let inline = cell.inlineString?.text { return inline }
        if let d = cell.dateValue {
            let df = DateFormatter.jobsMake { _ in }
            df
                .byDateStyle(.medium)
                .byTimeStyle(.none)
            return df.string(from: d)
        };return cell.value ?? ""
    }
    // MARK: UI Helpers
    private func refreshSegments(preserveSelection: Bool) {
        // 尝试保留当前选中的 sheet 名称
        let selectedName: String? = (0..<sheetControl.numberOfSegments).contains(currentSheetIndex)
            ? sheetControl.titleForSegment(at: currentSheetIndex)
            : nil
        sheetControl.removeAllSegments()
        for (i, s) in allSheets.enumerated() {
            sheetControl.insertSegment(withTitle: s.name, at: i, animated: false)
        }
        if allSheets.isEmpty {
            currentSheetIndex = 0
            tableView.byReloadData()
            return
        }
        if preserveSelection, let sel = selectedName,
           let idx = allSheets.firstIndex(where: { $0.name == sel }) {
            sheetControl.bySelectedSegmentIndex(idx)
            currentSheetIndex = idx
        } else {
            sheetControl.bySelectedSegmentIndex(0)
            currentSheetIndex = 0
        }
    }
    private func showError(_ message: String) {
        UIAlertController
            .makeAlert("提示".tr)
            .byMessage(message)
            .byAddOK("好的".tr, isPreferred: true)
            .byPresent(self)
    }
}
// MARK: - UIDocumentPickerDelegate
extension XLSXDemoVC: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else { return }
        loadXLSX(from: url)
    }
}
// MARK: - UITableViewDataSource & Delegate
extension XLSXDemoVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard allSheets.indices.contains(currentSheetIndex) else { return 0 };return allSheets[currentSheetIndex].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.byDequeueReusableCell(withType: RowCell.self, for: indexPath)
            .byData(allSheets[currentSheetIndex].rows[indexPath.row], indexPath.row + 1)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Local demo & stringify
extension XLSXDemoVC {
    /// 示例：一键注入本地数据（可删）
    func loadLocalDemo() {
        let rows: [[Any]] = [
            ["编号","姓名","得分","更新时间","标签"],
            [1, "Jobs", 100, Date(), "🟩📊"],
            [2, "Alice", 97.5, Date().addingTimeInterval(-3600), "📈"],
            [3, "Bob", true, Date().addingTimeInterval(-86400), "🧮"],
        ]
        setLocalSheets([("本地示例", rows)])
    }
    /// 把 [[Any]] 变成 [[String]]，保留 emoji；Date 做人类可读格式
    static func coerceToStrings(_ anyRows: [[Any]]) -> [[String]] {
        anyRows.map { row in
            row.map { cell -> String in
                switch cell {
                /// 处理 String 类型分支
                case let s as String: return s
                /// 处理 Date 类型分支
                case let d as Date:   return DateFormatter.jobsMake { _ in }.byDateStyle(.medium).byTimeStyle(.short).string(from: d)
                /// 处理 Bool 类型分支
                case let b as Bool:   return b ? "true" : "false"
                /// 处理 NSNumber 类型分支
                case let n as NSNumber: return n.stringValue
                /// 处理 Float 类型分支
                case let f as Float:  return String(f)
                /// 处理 Double 类型分支
                case let d as Double: return String(d)
                /// 处理 Int 类型分支
                case let i as Int:    return String(i)
                /// 处理 CustomStringConvertible 类型分支
                case let c as CustomStringConvertible: return c.description
                /// 未匹配已知分支时执行兜底处理
                default: return "\(cell)"
                }
            }
        }
    }
}
