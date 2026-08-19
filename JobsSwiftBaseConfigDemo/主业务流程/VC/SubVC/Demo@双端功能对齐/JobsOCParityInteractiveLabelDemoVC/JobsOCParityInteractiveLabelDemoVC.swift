//
//  JobsOCParityInteractiveLabelDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月26日，星期日.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftUILabelScrolling
import GKNavigationBarSwift
import SnapKit

final class JobsInteractiveLabelDemoVC: BaseVC {

    private var tapCount = 0

    private lazy var introLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("对齐 OC 的 JobsBaseLabel / BaseLabel：展示内边距、背景、异形圆角，以及轻点和长按手势。".tr)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    private lazy var decoratedLabel: JobsDemoInsetLabel = {
        JobsDemoInsetLabel()
            .byText("真人 · 可交互自定义 Label".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.systemBlue)
            .byTextDisplayMode(.scaleToFit, minimumScaleFactor: 0.55)
            .byUserInteractionEnabled(YES)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(introLabel.snp.bottom).offset(30)
                make.centerX.equalToSuperview()
                make.width.equalTo(240)
                make.height.equalTo(44)
            }
    }()

    private lazy var baseLabel: JobsDemoInsetLabel = {
        JobsDemoInsetLabel()
            .byText("测试 BaseLabel · 左右各 12pt 内边距".tr)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.systemCyan.withAlphaComponent(0.28))
            .byTextDisplayMode(.scaleToFit, minimumScaleFactor: 0.55)
            .byUserInteractionEnabled(YES)
            .byCornerRadius(10)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(decoratedLabel.snp.bottom).offset(22)
                make.centerX.equalToSuperview()
                make.width.equalTo(260)
                make.height.equalTo(44)
            }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("状态：等待轻点或长按".tr)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(baseLabel.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "可交互自定义 Label".tr)
        introLabel.byVisible(YES)
        decoratedLabel.byVisible(YES)
        baseLabel.byVisible(YES)
        statusLabel.byVisible(YES)
        installGestures(on: decoratedLabel, name: "JobsBaseLabel")
        installGestures(on: baseLabel, name: "BaseLabel")
        applyDecoratedCorners()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyDecoratedCorners()
    }

    private func installGestures(on label: UILabel, name: String) {
        label.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(handleLabelTap(_:)))
        )
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLabelLongPress(_:))
        )
        longPress.minimumPressDuration = 0.45
        label.addGestureRecognizer(longPress)
        label.accessibilityLabel = name
    }

    @objc private func handleLabelTap(_ gesture: UITapGestureRecognizer) {
        tapCount += 1
        let name = gesture.view?.accessibilityLabel ?? "Label"
        statusLabel.byText("状态：\(name) 已轻点 \(tapCount) 次".tr)
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    @objc private func handleLabelLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began,
              let label = gesture.view as? UILabel else { return }
        let highlighted = label.backgroundColor != JobsCor.systemOrange
        label.byBackgroundColor(highlighted ? JobsCor.systemOrange : JobsCor.systemBlue)
        statusLabel.byText("状态：\(label.accessibilityLabel ?? "Label") 已长按并切换背景".tr)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    private func applyDecoratedCorners() {
        let path = UIBezierPath(
            roundedRect: decoratedLabel.bounds,
            byRoundingCorners: [.topLeft, .bottomRight],
            cornerRadii: CGSize(width: 12, height: 12)
        )
        let mask = decoratedLabel.layer.mask as? CAShapeLayer ?? CAShapeLayer.jobsMake { _ in }
        mask
            .byFrame(decoratedLabel.bounds)
            .byPath(path.cgPath)
        decoratedLabel.layer.byMask(mask)
    }
}

private final class JobsDemoInsetLabel: UILabel {

    private let textInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + textInsets.left + textInsets.right,
            height: size.height + textInsets.top + textInsets.bottom
        )
    }
}
