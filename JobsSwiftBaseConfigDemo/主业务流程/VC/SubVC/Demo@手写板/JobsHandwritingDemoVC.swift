//
//  JobsHandwritingDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsScale
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class JobsHandwritingDemoVC: BaseVC {
    private static let savedStrokesKey = "com.jobs.handwriting.savedStrokes.v1"

    private var hasUnsavedChanges = false
    private var isLeaveAlertShowing = false
    private var previousInteractivePopEnabled: Bool?
    private var leaveAlertController: UIAlertController?

    private lazy var backButton: UIButton = {
        UIButton.sys()
            .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
            .byImage("chevron.left".sysImg, for: .normal)
            .onTap { [weak self] _ in
                self?.requestLeavePage()
            }
    }()

    private lazy var saveButton: UIButton = {
        UIButton.sys()
            .byTitle("保存".tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .onTap { [weak self] _ in
                self?.saveCanvas(showFeedback: true)
            }
    }()

    private lazy var tipLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("可使用手指或 Apple Pencil 书写；右上角保存后，下次进入会恢复笔迹。".tr)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(16)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
                }
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var clearButton: UIButton = {
        UIButton.sys()
            .byTitle("清空手写板".tr, for: .normal)
            .byTitleColor(JobsCor.systemRed, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .onTap { [weak self] _ in
                self?.canvasView.clearCanvas()
            }
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(12)
                make.height.equalTo(44)
            }
    }()

    private lazy var canvasView: JobsHandwritingCanvasView = {
        let canvasView = JobsHandwritingCanvasView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(16)
            .byBorderColor(JobsCor.systemGray4)
            .byBorderWidth(1)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(tipLabel.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalTo(clearButton.snp.top).offset(-12)
            }
        canvasView.contentDidChange = { [weak self] in
            self?.hasUnsavedChanges = true
        };return canvasView
    }()

    deinit {
        restoreInteractivePopGesture()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(
            title: "手写板".tr,
            leftButton: backButton,
            rightButtons: [saveButton]
        )
        tipLabel.byVisible(YES)
        clearButton.byVisible(YES)
        canvasView.byVisible(YES)
        loadSavedCanvas()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lockInteractivePopGesture()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent || isBeingDismissed || navigationController == nil {
            restoreInteractivePopGesture()
        }
    }
}

private extension JobsHandwritingDemoVC {
    func loadSavedCanvas() {
        guard let data = UserDefaults.standard.data(forKey: Self.savedStrokesKey) else { return }
        do {
            try canvasView.loadEncodedStrokes(data)
        } catch {
            UserDefaults.standard.removeObject(forKey: Self.savedStrokesKey)
            UserDefaults.standard.synchronize()
            canvasView.clearCanvas(notifyChange: false)
        }
        hasUnsavedChanges = false
    }

    @discardableResult
    func saveCanvas(showFeedback: Bool) -> Bool {
        do {
            if canvasView.hasStrokes {
                UserDefaults.standard.set(
                    try canvasView.encodedStrokes(),
                    forKey: Self.savedStrokesKey
                )
            } else {
                UserDefaults.standard.removeObject(forKey: Self.savedStrokesKey)
            }
            UserDefaults.standard.synchronize()
            hasUnsavedChanges = false
            if showFeedback {
                (canvasView.hasStrokes ? "手写内容已保存" : "空白手写板已保存").tr.toast
            };return true
        } catch {
            "手写内容保存失败".tr.toast
            return false
        }
    }

    func requestLeavePage() {
        guard hasUnsavedChanges else {
            leavePage()
            return
        }
        guard !isLeaveAlertShowing else { return }
        isLeaveAlertShowing = true
        leaveAlertController = UIAlertController.makeAlert(
            "是否保存手写内容？".tr,
            "选择“不保存”会清除已持久化的笔迹，下次进入显示空白手写板。".tr
        )
        leaveAlertController?
            .byAddCancel("继续手写".tr) { [weak self] _ in
                self?.isLeaveAlertShowing = false
            }
            .byAddDestructive("不保存".tr) { [weak self] _ in
                guard let self else { return }
                self.isLeaveAlertShowing = false
                self.discardSavedCanvas()
                self.leavePage()
            }
            .byAddOK("保存并退出".tr) { [weak self] _ in
                guard let self else { return }
                self.isLeaveAlertShowing = false
                if self.saveCanvas(showFeedback: false) {
                    self.leavePage()
                }
            }
        if let leaveAlertController {
            present(leaveAlertController, animated: true)
        }
    }

    func discardSavedCanvas() {
        UserDefaults.standard.removeObject(forKey: Self.savedStrokesKey)
        UserDefaults.standard.synchronize()
        hasUnsavedChanges = false
    }

    func leavePage() {
        restoreInteractivePopGesture()
        goBack(nil)
    }

    func lockInteractivePopGesture() {
        guard let gesture = navigationController?.interactivePopGestureRecognizer else { return }
        if previousInteractivePopEnabled == nil {
            previousInteractivePopEnabled = gesture.isEnabled
        }
        gesture.byEnabled(false)
    }

    func restoreInteractivePopGesture() {
        guard let gesture = navigationController?.interactivePopGestureRecognizer,
              let previousInteractivePopEnabled else { return }
        gesture.byEnabled(previousInteractivePopEnabled)
        self.previousInteractivePopEnabled = nil
    }
}
