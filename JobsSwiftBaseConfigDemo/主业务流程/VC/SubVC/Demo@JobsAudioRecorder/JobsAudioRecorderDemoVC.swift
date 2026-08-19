//
//  JobsAudioRecorderDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import GKNavigationBarSwift
import JobsAudioRecorder
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import UIKit

final class JobsAudioRecorderDemoVC: BaseVC {
    private let recorder = JobsAudioRecorderEngine.shared
    private let player = JobsAudioPlayerEngine.shared
    private var recordings: [JobsAudioRecording] = []
    private var permissionGranted = false

    private lazy var modeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["短暂录音".tr, "长时间录音".tr])
        control.bySelectedSegmentIndex(0)
        control.addTarget(self, action: #selector(modeChanged), for: .valueChanged)
        return control
    }()
    private lazy var durationTitleLabel: UILabel = {
        let label = UILabel.jobsMake { _ in }
        label
            .byText("录音时长".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
        return label
    }()
    private lazy var durationField: UITextField = {
        let field = UITextField.jobsMake { _ in }
        field
            .byBorderStyle(.roundedRect)
            .byKeyboardType(.numberPad)
            .byTextAlignment(.center)
            .byText("60")
            .byPlaceholder("60")
        return field
    }()
    private lazy var durationUnitLabel: UILabel = {
        let label = UILabel.jobsMake { _ in }
        label
            .byText("秒".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
        return label
    }()
    private lazy var hintLabel: UILabel = {
        let label = UILabel.jobsMake { _ in }
        label
            .byNumberOfLines(0)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
        return label
    }()
    private lazy var durationSpacerView = UIView.jobsMake { _ in }
    private lazy var durationRow = UIStackView(
        arrangedSubviews: [durationTitleLabel, durationSpacerView, durationField, durationUnitLabel]
    )
    private lazy var settingsStack = UIStackView(arrangedSubviews: [modeControl, durationRow, hintLabel])
    private lazy var settingsCard = UIView.jobsMake { _ in }
    private lazy var listTitleLabel: UILabel = {
        let label = UILabel.jobsMake { _ in }
        label
            .byText("本地录音".tr)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
        return label
    }()
    private lazy var capturePanel = UIView.jobsMake { _ in }
    private lazy var captureHintLabel: UILabel = {
        let label = UILabel.jobsMake { _ in }
        label
            .byTextAlignment(.center)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
        return label
    }()
    private lazy var recordButton = JobsAudioRecordButton()
    private lazy var longRecordButtonOuterRingView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.clear)
            .byBorderColor(JobsCor.white)
            .byBorderWidth(4)
            .byCornerRadius(48)
            .byUserInteractionEnabled(false)
    }()
    private lazy var longRecordButton: UIButton = {
        UIButton.sys()
            .byTitle("开始长时间录音".tr, for: .normal)
            .byTitle("停止并保存长时间录音".tr, for: .selected)
            .byTitleColor(JobsCor.clear, for: .normal)
            .byTitleColor(JobsCor.clear, for: .selected)
            .byBackgroundColor(JobsCor.white, for: .normal)
            .byCornerRadius(35)
            .onTap { [weak self] _ in
                self?.toggleLongRecording()
            }
    }()
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table
            .byDataSource(self)
            .byDelegate(self)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "AudioCell")
        return table
    }()
    private lazy var messageAlertController: UIAlertController = {
        let alertController = UIAlertController(title: "提示", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "知道了", style: .default))
        return alertController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        jobsSetupGKNav(title: "本地录音与音频管理".tr)
        recorder.delegate = self
        setupUI()
        bindActions()
        recorder.requestPermission { [weak self] granted in
            self?.permissionGranted = granted
            self?.refreshState()
        }
        reloadRecordings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recorder.delegate = self
        refreshState()
        reloadRecordings()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if recorder.isRecording, recorder.mode == .short { recorder.cancel() }
    }

    private func setupUI() {
        settingsCard
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byCornerRadius(18)
        settingsStack
            .byAxis(.vertical)
            .bySpacing(12)
        durationRow
            .byAxis(.horizontal)
            .byAlignment(.center)
            .bySpacing(8)
        capturePanel.byBackgroundColor(JobsCor.systemGroupedBackground)
        tableView.byBackgroundColor(JobsCor.clear)

        view.addSubview(settingsCard)
        settingsCard.addSubview(settingsStack)
        view.addSubview(listTitleLabel)
        view.addSubview(tableView)
        view.addSubview(capturePanel)
        capturePanel.addSubview(captureHintLabel)
        capturePanel.addSubview(recordButton)
        capturePanel.addSubview(longRecordButtonOuterRingView)
        capturePanel.addSubview(longRecordButton)

        settingsCard.snp.makeConstraints { make in
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(12)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            }
            make.left.right.equalToSuperview().inset(16)
        }
        settingsStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        modeControl.snp.makeConstraints { make in
            make.height.equalTo(36)
        }
        durationField.snp.makeConstraints { make in
            make.width.equalTo(72)
            make.height.equalTo(38)
        }
        listTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(settingsCard.snp.bottom).offset(18)
            make.left.equalToSuperview().offset(22)
        }
        capturePanel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(154)
        }
        captureHintLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.right.equalToSuperview().inset(20)
        }
        recordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(captureHintLabel.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 96, height: 96))
        }
        longRecordButtonOuterRingView.snp.makeConstraints { make in
            make.center.equalTo(recordButton)
            make.size.equalTo(CGSize(width: 96, height: 96))
        }
        longRecordButton.snp.makeConstraints { make in
            make.center.equalTo(longRecordButtonOuterRingView)
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(listTitleLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(capturePanel.snp.top)
        }
        refreshState()
    }

    private func bindActions() {
        recordButton.onBegin = { [weak self] in
            guard let self, permissionGranted else { self?.showPermissionAlert(); return false }
            let duration = max(1, TimeInterval(durationField.text ?? "") ?? 60)
            recordButton.duration = duration
            do { try recorder.start(mode: .short, maximumDuration: duration); return true }
            catch { show(error.localizedDescription); return false }
        }
        recordButton.onFinish = { [weak self] in self?.recorder.stopAndSave() }
        recordButton.onCancel = { [weak self] in self?.recorder.cancel() }
        recordButton.onTooShort = { [weak self] in
            guard let self else { return }
            show(String(format: "录音时间太短，请至少录制 %.0f 秒".tr, recordButton.minimumValidDuration))
        }
    }

    @objc private func modeChanged() { refreshState() }

    @objc private func toggleLongRecording() {
        guard permissionGranted else { showPermissionAlert(); return }
        if recorder.isRecording { recorder.stopAndSave(); return }
        do { try recorder.start(mode: .long) }
        catch { show(error.localizedDescription) }
    }

    private func refreshState() {
        let shortMode = modeControl.selectedSegmentIndex == 0
        durationRow.byHidden(!shortMode)
        recordButton.byHidden(!shortMode)
        longRecordButtonOuterRingView.byHidden(shortMode)
        longRecordButton.byHidden(shortMode)
        modeControl.isEnabled = !recorder.isRecording
        if shortMode {
            hintLabel.text = String(
                format: "白色刻度前不算有效录音；至少录制 %.0f 秒，手指移出按钮即取消，计时环走满后自动保存。".tr,
                recordButton.minimumValidDuration
            )
            captureHintLabel.byText("按住录音".tr)
        } else {
            hintLabel.byText("开始后可离开本页或让 App 进入后台，返回后轻触按钮停止并保存。".tr)
            let recording = recorder.isRecording
            captureHintLabel.byText(recording ? "正在录音，轻触停止并保存".tr : "轻触开始长时间录音".tr)
            longRecordButton.bySelected(recording)
        }
    }

    private func reloadRecordings() {
        recordings = JobsAudioRecordingStore.shared.recordings()
        tableView.reloadData()
    }

    private func showPermissionAlert() { show("请在系统设置中允许麦克风权限") }

    private func show(_ message: String) {
        messageAlertController.byMessage(message)
        guard presentedViewController !== messageAlertController else { return }
        present(messageAlertController, animated: true)
    }
}

extension JobsAudioRecorderDemoVC: JobsAudioRecorderEngineDelegate {
    func audioRecorderEngineDidStart(_ engine: JobsAudioRecorderEngine) { refreshState() }
    func audioRecorderEngine(_ engine: JobsAudioRecorderEngine, didFinishAt url: URL?, error: Error?) {
        refreshState()
        reloadRecordings()
        if let error { show(error.localizedDescription) }
    }
}

extension JobsAudioRecorderDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { recordings.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = recordings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudioCell", for: indexPath)
        return cell
            .byContentConfiguration { content in
                content.image = UIImage(systemName: item.mode == .long ? "waveform.badge.mic" : "waveform")
                content.text = item.mode == .long ? "长时间录音" : "短暂录音"
                content.secondaryText = String(format: "%.1f 秒 · %.1f KB · %@", item.duration, Double(item.fileSize) / 1024, item.url.lastPathComponent)
            }
            .byAccessoryType(.detailButton)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        do { _ = try player.toggle(url: recordings[indexPath.row].url) }
        catch { show(error.localizedDescription) }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "删除") { [weak self] _, _, done in
            guard let self else { done(false); return }
            player.stop()
            do { try JobsAudioRecordingStore.shared.delete(recordings[indexPath.row]); reloadRecordings(); done(true) }
            catch { show(error.localizedDescription); done(false) }
        };return UISwipeActionsConfiguration(actions: [action])
    }
}
