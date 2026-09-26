//
//  JobsRussianReadingDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//

import UIKit
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class JobsRussianReadingDemoVC: BaseVC {
    private var consonantIndex = 0
    private var currentText = "ба"
    private var isTable = false
    private var isReading = false
    private var slow = true
    private var repeats = 1
    private var consonant: String { JobsRussianLesson.consonants[consonantIndex] }
    private lazy var player = JobsLanguageSpeechPlayer.jobsMake {
        $0.onStart = { [weak self] text in
            guard let self else { return }
            currentText = text
            status.byText("正在朗读：\(text)")
            refresh()
        }
        $0.onFinish = { [weak self] in
            guard let self else { return }
            isReading = false
            status.byText("朗读完成 · 点击即可再听")
            refreshPlaybackControls()
        }
        $0.onError = { [weak self] message in
            guard let self else { return }
            isReading = false
            status.byText("无法朗读 · 请检查系统声音")
            refreshPlaybackControls()
            showMessage("声音不可用", message)
        }
    }
    private lazy var modeButton: UIButton = JobsLanguageLearningStyle.button("切换全表").onTap { [weak self] _ in
        guard let self else { return }
        isTable.toggle()
        refresh()
    }
    private lazy var previousButton: UIButton = JobsLanguageLearningStyle.button("上一组", size: 14).onTap { [weak self] _ in self?.move(-1) }
    private lazy var nextButton: UIButton = JobsLanguageLearningStyle.button("下一组", size: 14).onTap { [weak self] _ in self?.move(1) }
    private lazy var selectButton: UIButton = JobsLanguageLearningStyle.button("选择辅音 б", size: 18).onTap { [weak self] _ in self?.chooseConsonant() }
    private lazy var consonantButton: UIButton = JobsLanguageLearningStyle.button("单读 б").onTap { [weak self] _ in
        guard let self else { return }
        read([consonant])
    }
    private lazy var rowButton: UIButton = JobsLanguageLearningStyle.button("本组连读").onTap { [weak self] _ in
        guard let self else { return }
        if isReading {
            stop()
        } else {
            read(JobsRussianLesson.vowels.map { self.consonant + $0 })
        }
    }
    private lazy var speedButton: UIButton = JobsLanguageLearningStyle.button("语速：慢速", size: 14).onTap { [weak self] _ in
        guard let self else { return }
        slow.toggle()
        stop()
        speedButton.byTitle(slow ? "语速：慢速" : "语速：正常")
    }
    private lazy var repeatButton: UIButton = JobsLanguageLearningStyle.button("每项：1 遍", size: 14).onTap { [weak self] _ in
        guard let self else { return }
        repeats = repeats % 3 + 1
        stop()
        repeatButton.byTitle("每项：\(repeats) 遍")
    }
    private lazy var helpButton: UIButton = JobsLanguageLearningStyle.button("学习说明", size: 14).onTap { [weak self] _ in
        self?.showMessage("俄语点读", "卡片左侧读元音，右侧读组合。全表的上下表头也能点读。\n\n· 标记不常见或非标准拼写组合，仅作探索。系统合成声音不等同于专业语音教材；单独辅音可能读成字母名称。ъ、ь 是符号，不列为辅音。\n\n本页按课程数据、播放控制、界面拆分，后续语种可复用播放器。")
    }
    private lazy var instruction = UILabel.jobsMake {
        JobsLanguageLearningStyle.bindText($0, key: .textSecondary)
    }
        .byText("左侧元音、右侧组合均可点读 · 辅音可单读")
        .byFont(JobsFont.systemFont(ofSize: 13))
        .byNumberOfLines(0)
    private lazy var status = UILabel.jobsMake {
        JobsLanguageLearningStyle.bindText($0, key: .textPrimary)
    }.byText("点击字母或组合开始试听")
        .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
        .byNumberOfLines(0)
    private lazy var hint = UILabel.jobsMake {
        JobsLanguageLearningStyle.bindText($0, key: .textSecondary)
    }.byFont(JobsFont.systemFont(ofSize: 12))
        .byNumberOfLines(0)
    private lazy var controls = UIStackView.jobsMake { _ in }.byAxis(.vertical).bySpacing(8)
    private lazy var selection = UIStackView.jobsMake { _ in }.byAxis(.horizontal).bySpacing(6).byDistribution(.fillEqually)
    private lazy var modes = UIStackView.jobsMake { _ in }.byAxis(.horizontal).bySpacing(8).byDistribution(.fillEqually)
    private lazy var actions = UIStackView.jobsMake { _ in }.byAxis(.horizontal).bySpacing(8).byDistribution(.fillEqually)
    private lazy var options = UIStackView.jobsMake { _ in }.byAxis(.horizontal).bySpacing(8).byDistribution(.fillEqually)
    private lazy var footer = UIStackView.jobsMake { _ in }.byAxis(.vertical).bySpacing(8)
    private lazy var groupScroll = UIScrollView.jobsMake { _ in }.byShowsVerticalScrollIndicator(false)
    private lazy var grid = UIStackView.jobsMake { _ in }.byAxis(.vertical).bySpacing(8)
    private lazy var pairs = JobsRussianLesson.vowels.map { _ in
        JobsRussianPairView.jobsMake { view in
            view.onRead = { [weak self] text in self?.read([text]) }
        }
    }
    private lazy var rows: [UIStackView] = (0..<5).map { index in
        UIStackView.jobsMake { _ in }.byAxis(.horizontal).bySpacing(8).byDistribution(.fillEqually)
            .byAddArrangedSubview(pairs[index * 2]).byAddArrangedSubview(pairs[index * 2 + 1])
    }
    private lazy var table = JobsRussianTableView.jobsMake { view in
        view.onRead = { [weak self] text in
            guard let self else { return }
            if let first = text.first, let index = JobsRussianLesson.consonants.firstIndex(of: String(first)) {
                consonantIndex = index
            }
            read([text])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "俄语点读", rightButtons: [helpButton])
        selection.addArrangedSubview(selectButton)
        [previousButton, modeButton, nextButton].forEach { modes.addArrangedSubview($0) }
        [selection, instruction].forEach { controls.addArrangedSubview($0) }
        [consonantButton, rowButton].forEach { actions.addArrangedSubview($0) }
        [speedButton, repeatButton].forEach { options.addArrangedSubview($0) }
        [status, hint, modes, actions, options].forEach { footer.addArrangedSubview($0) }
        [selection, modes, actions, options].forEach { $0.snp.makeConstraints { $0.height.equalTo(44) } }
        controls.byAddTo(view) { [unowned self] make in
            make.top.equalTo(gk_navigationBar.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(12)
        }
        footer.byAddTo(view) { [unowned self] make in
            make.left.right.equalToSuperview().inset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        groupScroll.byAddTo(view) { [unowned self] make in
            make.top.equalTo(controls.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(12)
            make.bottom.equalTo(footer.snp.top).offset(-12)
        }
        grid.byAddTo(groupScroll) { [unowned self] make in
            make.edges.equalTo(groupScroll.contentLayoutGuide)
            make.width.equalTo(groupScroll.frameLayoutGuide)
        }
        rows.forEach { row in
            grid.addArrangedSubview(row)
            row.snp.makeConstraints { $0.height.equalTo(62) }
        }
        table.byAddTo(view) { [unowned self] make in make.edges.equalTo(groupScroll) }
        NotificationCenter.default.addObserver(self, selector: #selector(stop), name: UIApplication.willResignActiveNotification, object: nil)
        refresh()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stop()
    }
    deinit { NotificationCenter.default.removeObserver(self) }

    private func refresh() {
        selectButton.byTitle("辅音 \(consonant) ▾")
        consonantButton.byTitle("单读 \(consonant)")
        modeButton.byTitle(isTable ? "切换分组" : "切换全表")
        groupScroll.byHidden(isTable)
        table.byHidden(!isTable)
        for (index, pair) in pairs.enumerated() {
            pair.configure(consonant: consonant, vowel: JobsRussianLesson.vowels[index], current: currentText)
        }
        table.highlight(currentText)
        hint.byText(JobsRussianLesson.hint(for: currentText))
        refreshPlaybackControls()
    }
    private func refreshPlaybackControls() {
        JobsLanguageLearningStyle.paint(consonantButton, selected: currentText == consonant)
        rowButton.byTitle(isReading ? "停止" : "本组连读")
        JobsLanguageLearningStyle.paint(rowButton, selected: isReading)
    }

    private func move(_ delta: Int) {
        stop()
        consonantIndex = (consonantIndex + delta + JobsRussianLesson.consonants.count) % JobsRussianLesson.consonants.count
        currentText = consonant + "а"
        refresh()
    }
    private func read(_ texts: [String]) {
        guard let first = texts.first else { return }
        currentText = first
        isReading = true
        status.byText("准备朗读：\(first)")
        refresh()
        player.play(texts, language: JobsRussianLesson.language, rate: slow ? 0.35 : 0.5, repeats: repeats)
    }
    @objc private func stop() {
        player.stop()
        isReading = false
        refreshPlaybackControls()
        status.byText("已停止 · 点击即可试听")
    }
    private func chooseConsonant() {
        stop()
        let picker = JobsRussianConsonantPickerVC()
        picker.selected = consonant
        picker.onSelect = { [weak self] letter in
            guard let self, let index = JobsRussianLesson.consonants.firstIndex(of: letter) else { return }
            consonantIndex = index
            currentText = consonant + "а"
            refresh()
        }
        present(picker.byModalPresentationStyle(.pageSheet), animated: true)
    }
    private func showMessage(_ title: String, _ message: String) {
        UIAlertController.makeAlert(title, message).byAddCancel("知道了").byPresent(self)
    }
}
