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
import SnapKit

public final class JobsSwiftSearcherView: UIView {

    public private(set) var config: JobsSwiftSearcherConfig
    public private(set) var historySearches: [String] = []
    public private(set) var normalizedQuery = ""
    public private(set) var resultContentView: UIView?
    public private(set) lazy var textField: UITextField = {
        let field: UITextField
        if #available(iOS 13.0, *) {
            field = UISearchTextField.jobsMake { _ in }
        } else {
            field = UITextField.jobsMake { _ in }
                .byBorderStyle(.roundedRect)
        }
        return field
            .byDelegate(self)
            .byClearButtonMode(.whileEditing)
            .byReturnKeyType(.search)
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byTextColor(JobsCor.label)
            .byInputAccessoryView(inputAccessory)
            .byAddTarget(self,
                         action: #selector(textFieldEditingChanged),
                         for: .editingChanged)
    }()

    private var resultCount = 0
    private var recommendSearches: [String] = []
    private var recommendButtons: [UIButton] = []
    private var memoryHistories: [String: [String]] = [:]
    private var recommendHeight: Constraint?
    private var contentTopOffset: Constraint?
    private var recommendTitleHeight: Constraint?
    private var recommendLayoutWidth: CGFloat = -1
    private var actionColor: UIColor = JobsCor.label
    private var languageToken: NSObjectProtocol?

    private lazy var blankTapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer.jobsMake { _ in }
            .byTarget(self, action: #selector(blankTapped))
            .byDelegate(self)
            .byCancelsTouchesInView(false)
    }()

    private lazy var inputAccessory: UIView = {
        // 只为本字段提供零高附件，避免 IQ 再叠加一套键盘工具栏。
        UIView.jobsMake { _ in }
    }()

    private lazy var searchButton: UIButton = {
        UIButton.sys()
            .byTitleFont(JobsFont.systemFont(ofSize: 16))
            .byTitleAdjustsFontSizeToFitWidth(false)
            .byClearConfigurationBackground()
            .onTap { [weak self] _ in
                self?.submitSearch(self?.textField.text)
            }
    }()

    private lazy var cancelButton: UIButton = {
        UIButton.sys()
            .byTitleFont(JobsFont.systemFont(ofSize: 16))
            .byTitleAdjustsFontSizeToFitWidth(false)
            .byClearConfigurationBackground()
            .onTap { [weak self] _ in
                guard let self else {
                    return
                }
                if self.config.dismissKeyboardWhenCancel {
                    self.dismissKeyboard()
                }
                self.config.cancelBlock?()
            }
    }()

    private lazy var inputRow: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.horizontal)
            .byAlignment(.fill)
            .bySpacing(8)
            .byAddArrangedSubviews([textField, searchButton, cancelButton])
            .byAddTo(self) { make in
                make.top.equalToSuperview().offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(44)
            }
    }()

    private lazy var contentHost: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(self) { [unowned self] make in
                contentTopOffset = make.top.equalTo(inputRow.snp.bottom).offset(14).constraint
                make.left.right.equalToSuperview()
                if #available(iOS 15.0, *) {
                    make.bottom.equalTo(keyboardLayoutGuide.snp.top)
                } else {
                    make.bottom.equalToSuperview()
                }
            }
    }()

    private lazy var historyPane: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(contentHost) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var resultPane: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(contentHost) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var recommendSection: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(historyPane) { [unowned self] make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview().inset(16)
                recommendHeight = make.height.equalTo(0).constraint
            }
    }()

    private lazy var recommendTitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
            .byAddTo(recommendSection) { [unowned self] make in
                make.top.left.right.equalToSuperview()
                recommendTitleHeight = make.height.equalTo(24).constraint
            }
    }()

    private lazy var historyHeader: UIView = {
        UIView.jobsMake { _ in }
    }()

    private lazy var historyTitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(historyHeader) { [unowned self] make in
                make.left.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
                make.right.lessThanOrEqualTo(clearHistoryButton.snp.left).offset(-8)
            }
    }()

    private lazy var clearHistoryButton: UIButton = {
        UIButton.sys()
            .byTitleFont(JobsFont.systemFont(ofSize: 15))
            .byClearConfigurationBackground()
            .onTap { [weak self] _ in
                self?.clearHistory()
            }
            .byAddTo(historyHeader) { make in
                make.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.width.greaterThanOrEqualTo(44)
                make.height.equalTo(44)
            }
    }()

    private lazy var historyEmptyButton: UIButton = {
        makeEmptyButton()
            .onTap { [weak self] _ in
                self?.reloadHistorySearches()
                self?.focus()
            }
    }()

    private lazy var resultEmptyButton: UIButton = {
        makeEmptyButton()
            .onTap { [weak self] _ in
                self?
                    .byQuery("", recordHistory: false)
                    .focus()
            }
            .byAddTo(resultPane) { make in
                make.top.equalToSuperview().offset(28)
                make.left.right.equalToSuperview().inset(24)
                make.height.greaterThanOrEqualTo(144)
            }
    }()

    private lazy var historyTableView: UITableView = {
        UITableView.jobsMake { _ in }
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(54)
            .bySeparatorStyle(.none)
            .byBackgroundColor(JobsCor.clear)
            .byKeyboardDismissMode(.onDrag)
            .byTableFooterView(UIView.jobsMake { _ in })
            .byEmptyButtonProvider { [weak self] in
                self?.historyEmptyButton ?? JobsEmptyAuto.Config.defaultProvider()
            }
            .byEmptyButtonLayout { _, make, host in
                make.top.equalTo(host).offset(28)
                make.left.right.equalTo(host).inset(24)
                make.width.equalTo(host.snp.width).offset(-48)
                make.height.greaterThanOrEqualTo(144)
            }
            .byAddTo(historyPane) { [unowned self] make in
                make.top.equalTo(recommendSection.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    public override init(frame: CGRect) {
        config = .defaultConfig
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

    deinit {
        if let languageToken {
            NotificationCenter.default.removeObserver(languageToken)
        }
    }

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric,
               height: config.inputOnly ? 64 : UIView.noIntrinsicMetric)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutRecommendSection()
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil {
            refreshLabels()
            reloadHistorySearches()
        }
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            refreshLabels()
        }
    }

    @discardableResult
    public func byActionColor(_ color: UIColor) -> Self {
        actionColor = color
        refreshLabels()
        return self
    }

    @discardableResult
    public func byRecommendSearches(_ recommendSearches: [String]?) -> Self {
        reloadRecommendedSearches(recommendSearches)
        return self
    }

    @discardableResult
    public func byResultContentView(_ resultView: UIView?) -> Self {
        if resultContentView !== resultView {
            resultContentView?.removeFromSuperview()
            resultContentView = resultView
            resultView?.byAddTo(resultPane) { make in
                make.edges.equalToSuperview()
            }
        }
        updatePresentation()
        return self
    }

    /// 真实的规范化关键词变化只通知一次；重配与结果数量不会反向触发输入回调。
    @discardableResult
    public func byQuery(_ text: String?, recordHistory: Bool = false) -> Self {
        let rawText = text ?? ""
        if textField.text != rawText {
            textField.byText(rawText)
        }
        let next = normalizedText(by: rawText)
        let changed = next != normalizedQuery
        normalizedQuery = next
        if changed {
            resultCount = 0
        }
        if recordHistory {
            saveHistory(by: next)
        }
        updatePresentation()
        if changed {
            config.searchTextChangedBlock?(next)
        }
        return self
    }

    @discardableResult
    public func byResultCount(_ count: Int) -> Self {
        resultCount = max(0, count)
        updatePresentation()
        return self
    }

    @discardableResult
    public func focus() -> Self {
        textField.becomeFirstResponder()
        return self
    }

    @discardableResult
    public func dismissKeyboard() -> Self {
        textField.resignFirstResponder()
        return self
    }

    public func reloadWithConfig(_ config: JobsSwiftSearcherConfig?) {
        self.config = config ?? .defaultConfig
        // 输入与焦点属于当前会话，语言、主题或账号重配都不重新创建输入控件。
        refreshLabels()
        reloadHistorySearches()
        updatePresentation()
        invalidateIntrinsicContentSize()
    }

    public func reloadRecommendedSearches(_ recommendSearches: [String]?) {
        self.recommendSearches = normalizedTexts(by: recommendSearches)
        rebuildRecommendButtons()
    }

    public func reloadHistorySearches() {
        historySearches = readHistorySearches()
        if historyTableView.window != nil {
            historyTableView.byReloadData()
        }
        updatePresentation()
        config.historyChangedBlock?(historySearches)
    }

    public func saveHistory(by text: String?) {
        let text = normalizedText(by: text)
        guard !text.isEmpty else {
            return
        }
        var next = readHistorySearches().filter {
            $0 != text
        }
        next.insert(text, at: 0)
        writeHistorySearches(Array(next.prefix(effectiveHistoryCapacity)))
        reloadHistorySearches()
    }

    public func deleteHistory(by text: String?) {
        let text = normalizedText(by: text)
        guard !text.isEmpty else {
            return
        }
        writeHistorySearches(readHistorySearches().filter {
            $0 != text
        })
        reloadHistorySearches()
        config.historyDeleteBlock?(text)
    }

    public func clearHistory() {
        writeHistorySearches([])
        reloadHistorySearches()
        config.clearHistoryBlock?()
    }
}

private extension JobsSwiftSearcherView {

    var effectiveHistoryCapacity: Int {
        max(1, min(config.maxHistoryCount, 1_000))
    }

    func setupViews() {
        byBackgroundColor(JobsCor.systemBackground)
        _ = inputRow
        _ = recommendTitleLabel
        _ = historyTableView
        _ = resultEmptyButton
        jobs_addGestureRetView(blankTapGestureRecognizer)
        searchButton.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(44).priority(999)
        }
        cancelButton.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(44).priority(999)
        }
        if #available(iOS 15.0, *) {
            historyTableView.bySectionHeaderTopPadding(0)
        }
        languageToken = NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                              object: nil,
                                                              queue: .main) { [weak self] _ in
            self?.refreshLabels()
        }
        refreshLabels()
        reloadHistorySearches()
        JobsThemeCenter.shared.bind(self,
                                    slot: "JobsSwiftSearcher.nativeAppearance") { object, center in
            guard let view = object as? JobsSwiftSearcherView else {
                return
            }
            if #available(iOS 13.0, *) {
                // 原生搜索图标、清除按钮与键盘也必须消费 App 的有效主题。
                view.overrideUserInterfaceStyle = center.isDarkMode ? .dark : .light
            }
        }
    }

    func makeEmptyButton() -> UIButton {
        JobsEmptyAuto.Config.defaultProvider()
            .byTitleFont(JobsFont.systemFont(ofSize: 18, weight: .semibold))
            .bySubTitleFont(JobsFont.systemFont(ofSize: 15))
            .byTitleColor(JobsCor.label)
            .byNumberOfLines(0)
            .byTitleAlignment(.center)
            .byClearConfigurationBackground()
    }

    func refreshLabels() {
        let prefix = config.accessibilityIdentifierPrefix
        textField
            .byPlaceholder(config.placeholder.tr)
            .byPlaceholderColor(JobsCor.label.withAlphaComponent(0.65))
            .byTintColor(actionColor)
            .byAccessibilityIdentifier(prefix + ".field")
        searchButton
            .byTitle(config.searchButtonTitle.tr)
            .byTitleColor(actionColor)
            .byAccessibilityIdentifier(prefix + ".submit")
        cancelButton
            .byTitle(config.cancelButtonTitle.tr)
            .byTitleColor(actionColor)
            .byAccessibilityIdentifier(prefix + ".cancel")
        recommendTitleLabel.byText(config.recommendTitle.tr)
        historyTitleLabel.byText(config.historyTitle.tr)
        clearHistoryButton
            .byTitle("清空".tr)
            .byTitleColor(actionColor)
            .byAccessibilityIdentifier(prefix + ".history.clear")
        historyHeader.byBackgroundColor(backgroundColor)
        historyTableView.byAccessibilityIdentifier(prefix + ".history.table")
        historyEmptyButton
            .byTitle(config.emptyHistoryTitle.tr)
            .bySubTitle(config.emptyHistoryMessage.tr)
            .bySubTitleColor(actionColor)
            .byAccessibilityIdentifier(prefix + ".history.empty")
        resultEmptyButton
            .byTitle(config.noResultsTitle.tr)
            .bySubTitle(config.noResultsMessage.tr + "\n" + config.clearQueryTitle.tr)
            .bySubTitleColor(actionColor)
            .byAccessibilityIdentifier(prefix + ".empty.restore")
        recommendLayoutWidth = -1
        updatePresentation()
        if historyTableView.window != nil {
            historyTableView.byReloadData()
        }
        bySetNeedsLayout()
    }

    func updatePresentation() {
        let hasQuery = !normalizedQuery.isEmpty
        searchButton
            .byHidden(!config.showsSearchButton || (!textField.isFirstResponder && !hasQuery))
            .byEnabled(hasQuery)
        cancelButton.byHidden(!config.showsCancelButton)
        contentHost.byHidden(config.inputOnly)
        historyPane.byHidden(hasQuery)
        resultPane.byHidden(!hasQuery)
        resultContentView?.byHidden(resultCount == 0)
        resultEmptyButton.byHidden(resultCount > 0)
        contentTopOffset?.update(offset: config.inputOnly ? 10 : 14)
    }

    func normalizedText(by text: String?) -> String {
        text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }

    func normalizedTexts(by array: [String]?) -> [String] {
        var result: [String] = []
        for item in array ?? [] {
            let text = normalizedText(by: item)
            if !text.isEmpty && !result.contains(text) {
                result.append(text)
            }
        }
        return result
    }

    func readHistorySearches() -> [String] {
        let key = config.effectiveHistoryStorageKey
        let stored = config.persistsHistory
            ? config.historyUserDefaults.stringArray(forKey: key)
            : memoryHistories[key]
        return Array(normalizedTexts(by: stored).prefix(effectiveHistoryCapacity))
    }

    func writeHistorySearches(_ history: [String]) {
        let key = config.effectiveHistoryStorageKey
        if config.persistsHistory {
            if history.isEmpty {
                config.historyUserDefaults.removeObject(forKey: key)
            } else {
                config.historyUserDefaults.set(history, forKey: key)
            }
        } else {
            memoryHistories[key] = history
        }
    }

    func rebuildRecommendButtons() {
        recommendButtons.forEach {
            $0.removeFromSuperview()
        }
        recommendButtons = recommendSearches.enumerated().map { index, text in
            makeRecommendationButton()
                .byTag(index)
                .byTitle(text)
                .byTitleFont(JobsFont.systemFont(ofSize: 14))
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .byTitleColor(JobsCor.label)
                .byNumberOfLines(0)
                .byLineBreakMode(.byWordWrapping)
                .byAccessibilityIdentifier(config.accessibilityIdentifierPrefix + ".recommend.\(index)")
                .onTap { [weak self] _ in
                    guard let self else {
                        return
                    }
                    self.config.recommendSelectedBlock?(text)
                    self.config.itemSelectedBlock?(text)
                    self.submitSearch(text)
                }
                .byAddTo(recommendSection)
        }
        recommendLayoutWidth = -1
        bySetNeedsLayout()
    }

    func makeRecommendationButton() -> UIButton {
        if #available(iOS 15.0, *) {
            return UIButton.sys()
                .byConfiguration { configuration in
                    configuration
                        .byCornerStyle(.fixed)
                        .byBackground(configuration.background
                            .byBackgroundColor(JobsCor.secondarySystemBackground)
                            .byCornerRadius(10))
                }
        }
        return UIButton.sys()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
    }

    func layoutRecommendSection() {
        let width = max(0, bounds.width - 32)
        guard width != recommendLayoutWidth else {
            return
        }
        recommendLayoutWidth = width
        guard !recommendButtons.isEmpty, width > 0 else {
            recommendSection.byHidden(true)
            recommendHeight?.update(offset: 0)
            return
        }
        recommendSection.byHidden(false)
        let font = JobsFont.systemFont(ofSize: 17, weight: .semibold)
        let titleHeight = max(24, ceil((config.recommendTitle.tr as NSString).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                                                                      options: .usesLineFragmentOrigin,
                                                                                      attributes: [.font: font],
                                                                                      context: nil).height))
        recommendTitleHeight?.update(offset: titleHeight)
        var x: CGFloat = 0
        var y = titleHeight + 8
        var rowHeight: CGFloat = 44
        for (index, button) in recommendButtons.enumerated() {
            let text = recommendSearches[index] as NSString
            let font = JobsFont.systemFont(ofSize: 14)
            let naturalWidth = ceil(text.size(withAttributes: [.font: font]).width) + 24
            let buttonWidth = min(width, max(44, naturalWidth))
            let textHeight = ceil(text.boundingRect(with: CGSize(width: max(1, buttonWidth - 24), height: .greatestFiniteMagnitude),
                                                   options: .usesLineFragmentOrigin,
                                                   attributes: [.font: font],
                                                   context: nil).height)
            let buttonHeight = max(44, textHeight + 20)
            if x > 0 && x + buttonWidth > width {
                x = 0
                y += rowHeight + 8
                rowHeight = 44
            }
            button.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(x)
                make.top.equalToSuperview().offset(y)
                make.width.equalTo(buttonWidth)
                make.height.equalTo(buttonHeight)
            }
            rowHeight = max(rowHeight, buttonHeight)
            x += buttonWidth + 8
        }
        recommendHeight?.update(offset: y + rowHeight + 16)
    }

    func submitSearch(_ text: String?) {
        guard textField.markedTextRange == nil else {
            return
        }
        let keyword = normalizedText(by: text)
        guard !keyword.isEmpty else {
            return
        }
        byQuery(keyword, recordHistory: true)
        config.searchSubmittedBlock?(keyword)
        if config.dismissKeyboardWhenCancel {
            dismissKeyboard()
        }
    }

    @objc func blankTapped() {
        if config.dismissKeyboardWhenCancel {
            dismissKeyboard()
        }
    }

    @objc func textFieldEditingChanged() {
        // 中文等输入法组合期间不筛选半成品，也不通过程序赋值打断组合。
        guard textField.markedTextRange == nil else {
            return
        }
        byQuery(textField.text, recordHistory: false)
    }
}

extension JobsSwiftSearcherView: UITextFieldDelegate,
                                 UITableViewDataSource,
                                 UITableViewDelegate,
                                 UIGestureRecognizerDelegate {

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldReceive touch: UITouch) -> Bool {
        guard gestureRecognizer === blankTapGestureRecognizer else {
            return true
        }
        var touched = touch.view
        while let current = touched, current !== self {
            if current is UIControl || current is UITableViewCell {
                return false
            }
            touched = current.superview
        }
        return true
    }


    public func textFieldDidBeginEditing(_ textField: UITextField) {
        updatePresentation()
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        updatePresentation()
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        byQuery("", recordHistory: false)
        return false
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard textField.markedTextRange == nil else {
            return false
        }
        submitSearch(textField.text)
        return true
    }

    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        historySearches.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "JobsSwiftSearcherHistoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID) ??
            UITableViewCell.make(style: .default, reuseIdentifier: reuseID)
        let text = historySearches[indexPath.row]
        let deleteButton = UIButton.sys()
            .byImage("xmark.circle.fill".sysImg.withRenderingMode(.alwaysTemplate))
            .byTintColor(JobsCor.secondaryLabel)
            .byFrame(CGRect(x: 0, y: 0, width: 44, height: 44))
            .byClearConfigurationBackground()
            .byAccessibilityLabel("删除".tr + " " + text)
            .byAccessibilityIdentifier(config.accessibilityIdentifierPrefix + ".history.delete.\(indexPath.row)")
            .onTap { [weak self] _ in
                self?.deleteHistory(by: text)
            }
        return cell
            .byText(text)
            .byTitleFont(JobsFont.systemFont(ofSize: 16))
            .byTitleCor(JobsCor.label)
            .byImage("clock".sysImg.withRenderingMode(.alwaysTemplate))
            .byAccessoryView(deleteButton)
            .byTintColor(JobsCor.secondaryLabel)
            .byBackgroundColor(JobsCor.clear)
            .byAccessibilityIdentifier(config.accessibilityIdentifierPrefix + ".history.\(indexPath.row)")
    }

    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let text = historySearches[indexPath.row]
        config.itemSelectedBlock?(text)
        submitSearch(text)
    }

    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView? {
        historySearches.isEmpty ? nil : historyHeader
    }

    public func tableView(_ tableView: UITableView,
                          heightForHeaderInSection section: Int) -> CGFloat {
        historySearches.isEmpty ? .leastNonzeroMagnitude : 48
    }

    public func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCell.EditingStyle,
                          forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteHistory(by: historySearches[indexPath.row])
        }
    }

    public func tableView(_ tableView: UITableView,
                          titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "删除".tr
    }
}
