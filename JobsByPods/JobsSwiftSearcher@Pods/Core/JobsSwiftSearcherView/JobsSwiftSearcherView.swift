//
//  JobsSwiftSearcherView.swift
//  JobsSwiftSearcher
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import UIKit
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import Jobsl10n

public final class JobsSwiftSearcherView: UIView {
    public private(set) var textField = UITextField()
    public private(set) var config: JobsSwiftSearcherConfig
    public private(set) var historySearches: [String] = []

    private let searchContainerView = UIView()
    private let searchButton = UIButton.sys()
    private let recommendSectionView = UIView()
    private let recommendTitleLabel = UILabel()
    private let recommendTagContainerView = UIView()
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let blankTapGestureRecognizer = UITapGestureRecognizer()
    private var searchButtonLeftConstraint: NSLayoutConstraint?
    private var searchButtonWidthConstraint: NSLayoutConstraint?
    private var recommendSectionHeightConstraint: NSLayoutConstraint?
    private var recommendSearches: [String] = []
    private var recommendButtons: [UIButton] = []

    public override init(frame: CGRect) {
        self.config = .defaultConfig
        super.init(frame: frame)
        setupViews()
    }

    public init(config: JobsSwiftSearcherConfig?) {
        self.config = config ?? .defaultConfig
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutRecommendSection()
    }

    @discardableResult
    public func byRecommendSearches(_ recommendSearches: [String]?) -> Self {
        reloadRecommendedSearches(recommendSearches)
        return self
    }

    public func reloadWithConfig(_ config: JobsSwiftSearcherConfig?) {
        self.config = config ?? .defaultConfig
        updateByConfig()
        reloadHistorySearches()
    }

    public func reloadRecommendedSearches(_ recommendSearches: [String]?) {
        self.recommendSearches = normalizedTexts(by: recommendSearches)
        rebuildRecommendTagButtons()
        setNeedsLayout()
    }

    public func reloadHistorySearches() {
        historySearches = readHistorySearches()
        tableView.reloadData()
        config.historyChangedBlock?(historySearches)
    }

    public func saveHistory(by text: String?) {
        let historyText = normalizedText(by: text)
        guard !historyText.isEmpty else { return }
        var history = readHistorySearches().filter { $0 != historyText }
        history.insert(historyText, at: 0)
        let maxCount = max(config.maxHistoryCount, 1)
        if history.count > maxCount {
            history = Array(history.prefix(maxCount))
        }
        writeHistorySearches(history)
        reloadHistorySearches()
    }

    public func deleteHistory(by text: String?) {
        let historyText = normalizedText(by: text)
        guard !historyText.isEmpty else { return }
        let history = readHistorySearches().filter { $0 != historyText }
        writeHistorySearches(history)
        reloadHistorySearches()
        config.historyDeleteBlock?(historyText)
    }

    public func clearHistory() {
        writeHistorySearches([])
        reloadHistorySearches()
        config.clearHistoryBlock?()
    }
}

extension JobsSwiftSearcherView: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historySearches.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "JobsSwiftSearcherHistoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ??
            UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.textLabel?.byText(historySearches[indexPath.row])
        cell.textLabel?.byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
        cell.textLabel?.byTextColor(UIColor(r: 0.24 * 255, g: 0.29 * 255, b: 0.35 * 255))
        cell.accessoryType = .disclosureIndicator
        cell.byBackgroundColor(JobsCor.clear)
        return cell
    }

    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        submitSearch(historySearches[indexPath.row])
    }

    public func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCell.EditingStyle,
                          forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        deleteHistory(by: historySearches[indexPath.row])
    }

    public func tableView(_ tableView: UITableView,
                          titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "删除".tr
    }

    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView? {
        guard !historySearches.isEmpty else { return nil }
        let headerView = UIView()
            .byBackgroundColor(backgroundColor)
        let label = UILabel()
            .byText(config.historyTitle)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(UIColor(r: 0.30 * 255, g: 0.35 * 255, b: 0.42 * 255))
            .byTranslatesAutoresizingMaskIntoConstraints(false)
        let clearButton = UIButton.sys()
            .tr_setTitle("清空".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTitleColor(UIColor(r: 0.68 * 255, g: 0.30 * 255, b: 0.26 * 255))
            .byTranslatesAutoresizingMaskIntoConstraints(false)
            .byAddTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        headerView
            .byAddSubviewRetSuper(label)
            .byAddSubviewRetSuper(clearButton)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            clearButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -16),
            clearButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        return headerView
    }

    public func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
        historySearches.isEmpty ? 0.01 : 44
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        updateSearchButtonVisible(true)
        config.searchTextChangedBlock?(textField.text ?? "")
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        updateSearchButtonVisible(!normalizedText(by: textField.text).isEmpty)
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        updateSearchButtonVisible(false)
        config.searchTextChangedBlock?("")
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        submitSearch(textField.text)
        return true
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldReceive touch: UITouch) -> Bool {
        guard gestureRecognizer === blankTapGestureRecognizer else { return true }
        if touch.view?.isDescendant(of: tableView) == true { return false }
        if touch.view?.isDescendant(of: recommendTagContainerView) == true { return false }
        if touch.view?.isDescendant(of: searchContainerView) == true { return false }
        if touch.view?.isDescendant(of: searchButton) == true { return false };return true
    }
}

private extension JobsSwiftSearcherView {
    func setupViews() {
        self.byBackgroundColor(UIColor(r: 0.96 * 255, g: 0.97 * 255, b: 0.99 * 255))
        searchContainerView.byTranslatesAutoresizingMaskIntoConstraints(false)
        searchContainerView.byBackgroundColor(JobsCor.white)
        searchContainerView.byCornerRadius(16)
        searchContainerView.byBorderWidth(0.5)
        searchContainerView.byBorderColor(UIColor(r: 0.93 * 255, g: 0.88 * 255, b: 0.79 * 255))
        textField
            .byDelegate(self)
            .byClearButtonMode(.whileEditing)
            .byReturnKeyType(.search)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
            .byTextColor(UIColor(r: 0.24 * 255, g: 0.29 * 255, b: 0.35 * 255))
            .byLeftView(searchIconLeftView())
            .byTranslatesAutoresizingMaskIntoConstraints(false)
            .byAddTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        searchButton
            .byTitleColor(JobsCor.white)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byBackgroundColor(UIColor(r: 0.68 * 255, g: 0.51 * 255, b: 0.19 * 255))
            .byCornerRadius(16)
            .byMasksToBounds(true)
            .byTranslatesAutoresizingMaskIntoConstraints(false)
            .byAddTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        recommendSectionView.byTranslatesAutoresizingMaskIntoConstraints(false)
        recommendTitleLabel.byFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
        recommendTitleLabel.byTextColor(UIColor(r: 0.30 * 255, g: 0.35 * 255, b: 0.42 * 255))
        recommendTitleLabel.byTranslatesAutoresizingMaskIntoConstraints(true)
        recommendTagContainerView.byTranslatesAutoresizingMaskIntoConstraints(true)
        tableView.byTranslatesAutoresizingMaskIntoConstraints(false)
        tableView
            .byDelegate(self)
            .byDataSource(self)
        tableView.separatorStyle = .singleLine
        tableView.byBackgroundColor(JobsCor.clear)
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView(frame: .zero)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        searchContainerView.byAddTo(self)
        textField.byAddTo(searchContainerView)
        searchButton.byAddTo(self)
        recommendSectionView.byAddTo(self)
        recommendTitleLabel.byAddTo(recommendSectionView)
        recommendTagContainerView.byAddTo(recommendSectionView)
        tableView.byAddTo(self)
        blankTapGestureRecognizer
            .byTarget(self, action: #selector(blankTapped))
            .byDelegate(self)
        addGestureRecognizer(blankTapGestureRecognizer)
        setupConstraints()
        updateByConfig()
        reloadHistorySearches()
    }

    func setupConstraints() {
        recommendSectionHeightConstraint = recommendSectionView.heightAnchor.constraint(equalToConstant: 0)
        searchButtonLeftConstraint = searchButton.leftAnchor.constraint(equalTo: searchContainerView.rightAnchor, constant: 0)
        searchButtonWidthConstraint = searchButton.widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            searchContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            searchContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            searchContainerView.heightAnchor.constraint(equalToConstant: 42),
            searchButtonLeftConstraint!,
            searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            searchButton.centerYAnchor.constraint(equalTo: searchContainerView.centerYAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 42),
            searchButtonWidthConstraint!,
            textField.topAnchor.constraint(equalTo: searchContainerView.topAnchor),
            textField.leftAnchor.constraint(equalTo: searchContainerView.leftAnchor, constant: 12),
            textField.rightAnchor.constraint(equalTo: searchContainerView.rightAnchor, constant: -12),
            textField.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            recommendSectionView.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor, constant: 12),
            recommendSectionView.leftAnchor.constraint(equalTo: leftAnchor),
            recommendSectionView.rightAnchor.constraint(equalTo: rightAnchor),
            recommendSectionHeightConstraint!,
            tableView.topAnchor.constraint(equalTo: recommendSectionView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func updateByConfig() {
        textField.byPlaceholder(config.placeholder)
        searchButton.byTitle(config.searchButtonTitle)
        recommendTitleLabel.byText(config.recommendTitle)
        updateSearchButtonVisible(textField.isFirstResponder)
        updateSearchButtonEnabled(by: textField.text)
        rebuildRecommendTagButtons()
        bySetNeedsLayout()
        tableView.byReloadData()
    }

    func updateSearchButtonVisible(_ visible: Bool) {
        searchButtonLeftConstraint?.constant = visible ? 8 : 0
        searchButtonWidthConstraint?.constant = visible ? 56 : 0
        searchButton.byAlpha(visible ? 1 : 0)
        searchButton.isUserInteractionEnabled = visible
        UIView.jobsAnimate(0.22) {
            self.layoutIfNeeded()
        }
    }

    func updateSearchButtonEnabled(by text: String?) {
        let enabled = !normalizedText(by: text).isEmpty
        searchButton.byEnabled(enabled)
        searchButton.byAlpha(enabled || textField.isFirstResponder ? 1 : 0.55)
    }

    func readHistorySearches() -> [String] {
        let data = UserDefaults.standard.array(forKey: config.historyStorageKey) as? [String]
        return normalizedTexts(by: data)
    }

    func writeHistorySearches(_ historySearches: [String]) {
        if historySearches.isEmpty {
            UserDefaults.standard.removeObject(forKey: config.historyStorageKey)
        } else {
            UserDefaults.standard.set(historySearches, forKey: config.historyStorageKey)
        };UserDefaults.standard.synchronize()
    }

    func normalizedTexts(by array: [String]?) -> [String] {
        guard let array else { return [] }
        var result: [String] = []
        for item in array {
            let text = normalizedText(by: item)
            guard !text.isEmpty, !result.contains(text) else { continue }
            result.append(text)
        };return result
    }

    func normalizedText(by data: String?) -> String {
        data?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }

    func rebuildRecommendTagButtons() {
        recommendButtons.forEach { $0.removeFromSuperview() }
        recommendButtons = recommendSearches.enumerated().map { index, title in
            UIButton.sys()
                .byTag(index)
                .byBackgroundColor(recommendTagColor(at: index))
                .byCornerRadius(6)
                .byMasksToBounds(true)
                .byTitleFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
                .byTitleAdjustsFontSizeToFitWidth(true)
                .byTitleMinimumScaleFactor(0.72)
                .byTitle(title)
                .byTitleColor(JobsCor.white)
                .byAddTarget(self,
                             action: #selector(recommendTagButtonTapped(_:)),
                             for: .touchUpInside)
                .byAddTo(recommendTagContainerView)
        }
    }

    func layoutRecommendSection() {
        let hasRecommend = !recommendSearches.isEmpty
        recommendSectionView.byHidden(!hasRecommend)
        recommendTitleLabel.byHidden(!hasRecommend)
        recommendTagContainerView.byHidden(!hasRecommend)
        guard hasRecommend else {
            recommendSectionHeightConstraint?.constant = 0
            return
        }
        let sectionWidth = bounds.width
        let contentWidth = max(sectionWidth - 32, 0)
        guard contentWidth > 0 else { return }
        let titleHeight: CGFloat = 24
        let tagTop = titleHeight + 8
        let tagHeight: CGFloat = 32
        let horizontalSpace: CGFloat = 8
        let verticalSpace: CGFloat = 8
        var x: CGFloat = 16
        var y: CGFloat = 0
        recommendTitleLabel.byFrame(CGRect(x: 16, y: 0, width: contentWidth, height: titleHeight))
        recommendTagContainerView.byFrame(CGRect(x: 0, y: tagTop, width: sectionWidth, height: 0))
        for button in recommendButtons {
            let title = button.title(for: .normal) ?? ""
            let width = min(ceil((title as NSString).size(withAttributes: [.font: button.titleLabel?.font ?? JobsFont.systemFont(ofSize: 13)]).width) + 26, contentWidth)
            if x > 16, x + width > sectionWidth - 16 {
                x = 16
                y += tagHeight + verticalSpace
            }
            button.byFrame(CGRect(x: x, y: y, width: width, height: tagHeight))
            x += width + horizontalSpace
        }
        let tagsHeight = recommendButtons.isEmpty ? 0 : y + tagHeight
        recommendTagContainerView.byFrame(CGRect(x: 0, y: tagTop, width: sectionWidth, height: tagsHeight))
        recommendSectionHeightConstraint?.constant = tagTop + tagsHeight + 10
    }

    func recommendTagColor(at index: Int) -> UIColor {
        let colors = [
            UIColor(r: 0.18 * 255, g: 0.45 * 255, b: 0.82 * 255),
            UIColor(r: 0.11 * 255, g: 0.58 * 255, b: 0.36 * 255),
            UIColor(r: 0.84 * 255, g: 0.25 * 255, b: 0.25 * 255),
            UIColor(r: 0.53 * 255, g: 0.31 * 255, b: 0.78 * 255),
            UIColor(r: 0.90 * 255, g: 0.50 * 255, b: 0.13 * 255),
            UIColor(r: 0.00 * 255, g: 0.52 * 255, b: 0.57 * 255),
            UIColor(r: 0.23 * 255, g: 0.30 * 255, b: 0.38 * 255),
            UIColor(r: 0.65 * 255, g: 0.24 * 255, b: 0.49 * 255)
        ];return colors[index % colors.count]
    }

    func submitSearch(_ text: String?) {
        let keyword = normalizedText(by: text)
        guard !keyword.isEmpty else { return }
        textField.byText(keyword)
        saveHistory(by: keyword)
        config.searchSubmittedBlock?(keyword)
        if config.dismissKeyboardWhenCancel {
            textField.resignFirstResponder()
        }
    }

    func searchIconLeftView() -> UIView {
        let imageView = UIImageView(image: searchIconImage(with: UIColor(r: 0.55 * 255, g: 0.42 * 255, b: 0.18 * 255)))
        imageView.byFrame(CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.byContentMode(.center)
        return imageView
    }

    func searchIconImage(with color: UIColor) -> UIImage? {
        let size = CGSize(width: 16, height: 16)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setStroke()
        let circlePath = UIBezierPath.make(ovalIn: CGRect(x: 2.2, y: 2.2, width: 8.8, height: 8.8))
        circlePath.lineWidth = 1.6
        circlePath.stroke()
        let handlePath = UIBezierPath.make()
        handlePath.lineWidth = 1.8
        handlePath.lineCapStyle = .round
        handlePath
            .byMove(to: CGPoint(x: 9.4, y: 9.4))
            .byAddLine(to: CGPoint(x: 13.4, y: 13.4))
        handlePath.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    @objc func textFieldEditingChanged() {
        updateSearchButtonVisible(textField.isFirstResponder || !normalizedText(by: textField.text).isEmpty)
        updateSearchButtonEnabled(by: textField.text)
        config.searchTextChangedBlock?(textField.text ?? "")
    }

    @objc func searchButtonTapped() {
        submitSearch(textField.text)
    }

    @objc func recommendTagButtonTapped(_ sender: UIButton) {
        guard sender.tag >= 0, sender.tag < recommendSearches.count else { return }
        let text = recommendSearches[sender.tag]
        textField.byText(text)
        config.recommendSelectedBlock?(text)
        submitSearch(text)
    }

    @objc func clearButtonTapped() {
        clearHistory()
    }

    @objc func blankTapped() {
        if config.dismissKeyboardWhenCancel {
            endEditing(true)
        }
    }
}
