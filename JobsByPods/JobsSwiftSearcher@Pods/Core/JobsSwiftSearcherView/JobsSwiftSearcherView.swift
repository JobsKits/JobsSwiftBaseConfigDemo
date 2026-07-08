//
//  JobsSwiftSearcherView.swift
//  JobsSwiftSearcher
//
//  Created by Jobs on 2026年7月7日，星期二.
//

import UIKit

public final class JobsSwiftSearcherView: UIView {
    public private(set) var textField = UITextField()
    public private(set) var config: JobsSwiftSearcherConfig
    public private(set) var historySearches: [String] = []

    private let searchContainerView = UIView()
    private let searchButton = UIButton(type: .system)
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
        cell.textLabel?.text = historySearches[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        cell.textLabel?.textColor = UIColor(red: 0.24, green: 0.29, blue: 0.35, alpha: 1)
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .clear
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
        "删除"
    }

    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView? {
        guard !historySearches.isEmpty else { return nil }
        let headerView = UIView()
        headerView.backgroundColor = backgroundColor

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = config.historyTitle
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 0.30, green: 0.35, blue: 0.42, alpha: 1)

        let clearButton = UIButton(type: .system)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("清空", for: .normal)
        clearButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        clearButton.setTitleColor(UIColor(red: 0.68, green: 0.30, blue: 0.26, alpha: 1), for: .normal)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)

        headerView.addSubview(label)
        headerView.addSubview(clearButton)
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
        backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.99, alpha: 1)

        searchContainerView.translatesAutoresizingMaskIntoConstraints = false
        searchContainerView.backgroundColor = .white
        searchContainerView.layer.cornerRadius = 16
        searchContainerView.layer.borderWidth = 0.5
        searchContainerView.layer.borderColor = UIColor(red: 0.93, green: 0.88, blue: 0.79, alpha: 1).cgColor

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .search
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor(red: 0.24, green: 0.29, blue: 0.35, alpha: 1)
        textField.leftView = searchIconLeftView()
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)

        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        searchButton.backgroundColor = UIColor(red: 0.68, green: 0.51, blue: 0.19, alpha: 1)
        searchButton.layer.cornerRadius = 16
        searchButton.layer.masksToBounds = true
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)

        recommendSectionView.translatesAutoresizingMaskIntoConstraints = false
        recommendTitleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        recommendTitleLabel.textColor = UIColor(red: 0.30, green: 0.35, blue: 0.42, alpha: 1)
        recommendTitleLabel.translatesAutoresizingMaskIntoConstraints = true

        recommendTagContainerView.translatesAutoresizingMaskIntoConstraints = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView(frame: .zero)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        addSubview(searchContainerView)
        searchContainerView.addSubview(textField)
        addSubview(searchButton)
        addSubview(recommendSectionView)
        recommendSectionView.addSubview(recommendTitleLabel)
        recommendSectionView.addSubview(recommendTagContainerView)
        addSubview(tableView)

        blankTapGestureRecognizer.addTarget(self, action: #selector(blankTapped))
        blankTapGestureRecognizer.delegate = self
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
        textField.placeholder = config.placeholder
        searchButton.setTitle(config.searchButtonTitle, for: .normal)
        recommendTitleLabel.text = config.recommendTitle
        updateSearchButtonVisible(textField.isFirstResponder)
        updateSearchButtonEnabled(by: textField.text)
        rebuildRecommendTagButtons()
        setNeedsLayout()
        tableView.reloadData()
    }

    func updateSearchButtonVisible(_ visible: Bool) {
        searchButtonLeftConstraint?.constant = visible ? 8 : 0
        searchButtonWidthConstraint?.constant = visible ? 56 : 0
        searchButton.alpha = visible ? 1 : 0
        searchButton.isUserInteractionEnabled = visible
        UIView.animate(withDuration: 0.22) {
            self.layoutIfNeeded()
        }
    }

    func updateSearchButtonEnabled(by text: String?) {
        let enabled = !normalizedText(by: text).isEmpty
        searchButton.isEnabled = enabled
        searchButton.alpha = enabled || textField.isFirstResponder ? 1 : 0.55
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
            let button = UIButton(type: .system)
            button.tag = index
            button.backgroundColor = recommendTagColor(at: index)
            button.layer.cornerRadius = 6
            button.layer.masksToBounds = true
            button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.72
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(recommendTagButtonTapped(_:)), for: .touchUpInside)
            recommendTagContainerView.addSubview(button)
            return button
        }
    }

    func layoutRecommendSection() {
        let hasRecommend = !recommendSearches.isEmpty
        recommendSectionView.isHidden = !hasRecommend
        recommendTitleLabel.isHidden = !hasRecommend
        recommendTagContainerView.isHidden = !hasRecommend
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
        recommendTitleLabel.frame = CGRect(x: 16, y: 0, width: contentWidth, height: titleHeight)
        recommendTagContainerView.frame = CGRect(x: 0, y: tagTop, width: sectionWidth, height: 0)
        for button in recommendButtons {
            let title = button.title(for: .normal) ?? ""
            let width = min(ceil((title as NSString).size(withAttributes: [.font: button.titleLabel?.font ?? .systemFont(ofSize: 13)]).width) + 26, contentWidth)
            if x > 16, x + width > sectionWidth - 16 {
                x = 16
                y += tagHeight + verticalSpace
            }
            button.frame = CGRect(x: x, y: y, width: width, height: tagHeight)
            x += width + horizontalSpace
        }
        let tagsHeight = recommendButtons.isEmpty ? 0 : y + tagHeight
        recommendTagContainerView.frame = CGRect(x: 0, y: tagTop, width: sectionWidth, height: tagsHeight)
        recommendSectionHeightConstraint?.constant = tagTop + tagsHeight + 10
    }

    func recommendTagColor(at index: Int) -> UIColor {
        let colors = [
            UIColor(red: 0.18, green: 0.45, blue: 0.82, alpha: 1),
            UIColor(red: 0.11, green: 0.58, blue: 0.36, alpha: 1),
            UIColor(red: 0.84, green: 0.25, blue: 0.25, alpha: 1),
            UIColor(red: 0.53, green: 0.31, blue: 0.78, alpha: 1),
            UIColor(red: 0.90, green: 0.50, blue: 0.13, alpha: 1),
            UIColor(red: 0.00, green: 0.52, blue: 0.57, alpha: 1),
            UIColor(red: 0.23, green: 0.30, blue: 0.38, alpha: 1),
            UIColor(red: 0.65, green: 0.24, blue: 0.49, alpha: 1)
        ];return colors[index % colors.count]
    }

    func submitSearch(_ text: String?) {
        let keyword = normalizedText(by: text)
        guard !keyword.isEmpty else { return }
        textField.text = keyword
        saveHistory(by: keyword)
        config.searchSubmittedBlock?(keyword)
        if config.dismissKeyboardWhenCancel {
            textField.resignFirstResponder()
        }
    }

    func searchIconLeftView() -> UIView {
        let imageView = UIImageView(image: searchIconImage(with: UIColor(red: 0.55, green: 0.42, blue: 0.18, alpha: 1)))
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageView.contentMode = .center
        return imageView
    }

    func searchIconImage(with color: UIColor) -> UIImage? {
        let size = CGSize(width: 16, height: 16)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setStroke()
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 2.2, y: 2.2, width: 8.8, height: 8.8))
        circlePath.lineWidth = 1.6
        circlePath.stroke()
        let handlePath = UIBezierPath()
        handlePath.lineWidth = 1.8
        handlePath.lineCapStyle = .round
        handlePath.move(to: CGPoint(x: 9.4, y: 9.4))
        handlePath.addLine(to: CGPoint(x: 13.4, y: 13.4))
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
        textField.text = text
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

