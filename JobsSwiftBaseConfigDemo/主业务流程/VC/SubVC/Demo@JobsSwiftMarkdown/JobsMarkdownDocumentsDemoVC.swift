//
//  JobsMarkdownDocumentsDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

import UIKit

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsSwiftMarkdown
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class JobsMarkdownDocumentsDemoVC: BaseVC {
    private static let reuseIdentifier = "JobsMarkdownDocumentCell"
    private var catalog: JobsMarkdownCatalog?
    private var allDocuments: [JobsMarkdownDocument] = []
    private var visibleDocuments: [JobsMarkdownDocument] = []
    private var catalogError: Error?
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemBackground)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.equalToSuperview()
            }
        searchBar
            .byPlaceholder("按标题或工程相对路径搜索".tr)
            .bySearchBarStyle(.minimal)
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.byDelegate(self)
        return searchBar
    }()
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(64)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(searchBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "Markdown 文档浏览器".tr)
        tableView.register(
            JobsMarkdownDocumentCell.self,
            forCellReuseIdentifier: Self.reuseIdentifier
        )
        jobsLoadCatalog()
        searchBar.byVisible(YES)
        tableView.byVisible(YES)
    }
}

private extension JobsMarkdownDocumentsDemoVC {
    func jobsLoadCatalog() {
        do {
            let catalog = try JobsMarkdownCatalog.bundled()
            self.catalog = catalog
            allDocuments = catalog.documents.sorted {
                $0.relativePath.localizedStandardCompare($1.relativePath) == .orderedAscending
            }
            visibleDocuments = allDocuments
        } catch {
            catalogError = error
            allDocuments = []
            visibleDocuments = []
        }
        tableView.reloadData()
    }

    func jobsApplySearch(_ query: String) {
        let keyword = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !keyword.isEmpty else {
            visibleDocuments = allDocuments
            tableView.reloadData()
            return
        }
        visibleDocuments = allDocuments.filter {
            $0.title.localizedCaseInsensitiveContains(keyword)
                || $0.relativePath.localizedCaseInsensitiveContains(keyword)
        }
        tableView.reloadData()
    }
}

extension JobsMarkdownDocumentsDemoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        max(visibleDocuments.count, catalogError == nil ? 0 : 1)
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Self.reuseIdentifier,
            for: indexPath
        ) as! JobsMarkdownDocumentCell
        guard catalogError == nil else {
            return cell.byError(catalogError?.localizedDescription ?? "Markdown 文档清单读取失败".tr)
        };return cell.byDocument(visibleDocuments[indexPath.row])
    }
}

extension JobsMarkdownDocumentsDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard catalogError == nil,
              visibleDocuments.indices.contains(indexPath.row),
              let catalog else { return }
        navigationController?.pushViewController(
            JobsMarkdownDocumentDemoVC(
                document: visibleDocuments[indexPath.row],
                catalog: catalog
            ),
            animated: true
        )
    }
}

extension JobsMarkdownDocumentsDemoVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        jobsApplySearch(searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

private final class JobsMarkdownDocumentCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bySelectedBackgroundView(
            UIView.jobsMake { _ in }.byBackgroundColor(JobsCor.tertiarySystemBackground)
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @discardableResult
    func byDocument(_ document: JobsMarkdownDocument) -> Self {
        var content = UIListContentConfiguration.subtitleCell()
        content.text = document.title
        content.secondaryText = document.relativePath
        content.textProperties.color = JobsCor.label
        content.secondaryTextProperties.color = JobsCor.secondaryLabel
        content.secondaryTextProperties.numberOfLines = 2
        contentConfiguration = content
        accessoryType = .disclosureIndicator
        selectionStyle = .default
        return self
    }

    @discardableResult
    func byError(_ message: String) -> Self {
        var content = UIListContentConfiguration.subtitleCell()
        content.text = "无法读取 Markdown 文档".tr
        content.secondaryText = message
        content.textProperties.color = JobsCor.systemRed
        content.secondaryTextProperties.color = JobsCor.secondaryLabel
        content.secondaryTextProperties.numberOfLines = 0
        contentConfiguration = content
        accessoryType = .none
        selectionStyle = .none
        return self
    }
}

private final class JobsMarkdownDocumentDemoVC: BaseVC {
    private let document: JobsMarkdownDocument
    private let catalog: JobsMarkdownCatalog
    private let initialAnchor: String?
    private lazy var markdownView: JobsMarkdownView = {
        JobsMarkdownView()
            .byConfiguration(JobsMarkdownConfiguration())
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    init(
        document: JobsMarkdownDocument,
        catalog: JobsMarkdownCatalog,
        initialAnchor: String? = nil
    ) {
        self.document = document
        self.catalog = catalog
        self.initialAnchor = initialAnchor
        super.init(nibName: nil, bundle: nil)
        byTitle(document.title.isEmpty ? "Markdown" : document.title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: document.title)
        markdownView.delegate = self
        markdownView.load(document)
    }
}

extension JobsMarkdownDocumentDemoVC: JobsMarkdownViewDelegate {
    func markdownViewDidFinishRendering(_ markdownView: JobsMarkdownView) {
        guard let initialAnchor, !initialAnchor.isEmpty else { return }
        markdownView.scrollToAnchor(initialAnchor, animated: false)
    }

    func markdownView(_ markdownView: JobsMarkdownView, didRequestOpen url: URL) {
        if url.isFileURL {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            let anchor = components?.fragment
            components?.fragment = nil
            if let documentURL = components?.url,
               let linkedDocument = catalog.document(fileURL: documentURL) {
                if linkedDocument.id == document.id, let anchor {
                    markdownView.scrollToAnchor(anchor)
                } else {
                    navigationController?.pushViewController(
                        JobsMarkdownDocumentDemoVC(
                            document: linkedDocument,
                            catalog: catalog,
                            initialAnchor: anchor
                        ),
                        animated: true
                    )
                }
            };return
        }
        UIApplication.shared.open(url)
    }

    func markdownView(_ markdownView: JobsMarkdownView, didFail error: Error) {
        error.localizedDescription.toast
    }
}
