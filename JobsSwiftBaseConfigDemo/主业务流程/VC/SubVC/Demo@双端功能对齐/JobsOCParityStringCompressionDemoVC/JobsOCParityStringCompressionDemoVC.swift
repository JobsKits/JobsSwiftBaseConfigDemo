//
//  JobsOCParityStringCompressionDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsToast
import GKNavigationBarSwift
import SnapKit

final class JobsStringCompressionDemoVC: BaseVC {

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(YES)
            .byShowsVerticalScrollIndicator(false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.width.equalTo(scrollView.frameLayoutGuide)
            }
    }()

    private lazy var resultCard: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemBackground)
            .byCornerRadius(14)
            .byShadowColor(JobsCor.black.withAlphaComponent(0.12))
            .byShadowOpacity(1)
            .byShadowRadius(12)
            .byShadowOffset(CGSize(width: 0, height: 5))
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var titleLabel: UILabel = {
        makeSectionLabel("字符串压缩 / 解压结果".tr, size: 22)
            .byAddTo(resultCard) { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var algorithmTitleLabel: UILabel = {
        makeSectionLabel("压缩算法".tr)
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(titleLabel.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var algorithmValueLabel: UILabel = {
        makeValueLabel(
            "压缩：NSString → UTF8 NSData → NSKeyedArchiver → Base64 字符串\n\n"
            + "解压：Base64 → NSKeyedUnarchiver NSData → UTF8 NSString"
        )
        .byAddTo(resultCard) { [unowned self] make in
            make.top.equalTo(algorithmTitleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(18)
        }
    }()

    private lazy var sourceTitleLabel: UILabel = {
        makeSectionLabel("原始字符串".tr)
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(algorithmValueLabel.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var sourceTextView: UITextView = {
        UITextView()
            .byText("这是一个需要压缩的字符串".tr)
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(9)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
            .byTextContainerInset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(sourceTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(18)
                make.height.equalTo(88)
            }
    }()

    private lazy var informationTitleLabel: UILabel = {
        makeSectionLabel("压缩信息".tr)
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(sourceTextView.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var informationValueLabel: UILabel = {
        makeValueLabel("")
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(informationTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var compressedTitleLabel: UILabel = {
        makeSectionLabel("压缩字符串（Base64，长按复制）".tr)
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(informationValueLabel.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var compressedValueLabel: UILabel = {
        makeValueLabel("")
            .byUserInteractionEnabled(YES)
            .addLongPressAction(
                minimumPressDuration: 0.6,
                allowableMovement: 12,
                numberOfTouchesRequired: 1
            ) { [weak self] gesture in
                guard gesture.state == .began, let text = self?.compressedValueLabel.text, !text.isEmpty else { return }
                text.paste()
                "压缩字符串已复制".toast
            }
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(compressedTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var restoredTitleLabel: UILabel = {
        makeSectionLabel("解压后".tr)
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(compressedValueLabel.snp.bottom).offset(22)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var restoredValueLabel: UILabel = {
        makeValueLabel("")
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(restoredTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(18)
            }
    }()

    private lazy var recompressButton: UIButton = {
        UIButton.sys()
            .byTitle("重新压缩".tr, for: .normal)
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 16))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                self?.compress()
            }
            .byAddTo(resultCard) { [unowned self] make in
                make.top.equalTo(restoredValueLabel.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(18)
                make.height.equalTo(48)
                make.bottom.equalToSuperview().inset(20)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(UIColor(hex: 0xF6F8FC))
        jobsSetupGKNav(title: "字符串压缩 / 解压".tr)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        resultCard.byVisible(YES)
        recompressButton.byVisible(YES)
        resultCard.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).inset(24)
        }
        compress()
    }

    private func makeSectionLabel(_ text: String, size: CGFloat = 16) -> UILabel {
        UILabel()
            .byText(text)
            .byFont(JobsFont.boldSystemFont(ofSize: size))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
    }

    private func makeValueLabel(_ text: String) -> UILabel {
        JobsCompressionValueLabel()
            .byText(text)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(8)
    }

    private func compress() {
        let source = sourceTextView.text ?? ""
        guard let sourceData = source.data(using: .utf8),
              let archivedData = try? NSKeyedArchiver.archivedData(
                withRootObject: sourceData,
                requiringSecureCoding: false
              ) else {
            informationValueLabel.byText("压缩失败".tr)
            compressedValueLabel.byText("")
            restoredValueLabel.byText("")
            return
        }
        let base64 = archivedData.base64EncodedString()
        let restoredObject = try? NSKeyedUnarchiver.unarchivedObject(
            ofClass: NSData.self,
            from: archivedData
        )
        let restored = restoredObject
            .flatMap { String(data: $0 as Data, encoding: .utf8) }
            ?? "解压失败".tr
        let ratio = sourceData.isEmpty ? 0 : Double(archivedData.count) / Double(sourceData.count)
        informationValueLabel.byText(
            "原始 UTF8 字节：\(sourceData.count)\n"
            + "归档数据字节：\(archivedData.count)\n"
            + "Base64 字符数：\(base64.count)\n"
            + String(format: "压缩比：%.2f", ratio)
        )
        compressedValueLabel.byText(base64)
        restoredValueLabel.byText(restored)
    }
}

private final class JobsCompressionValueLabel: UILabel {

    private let contentInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInsets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + contentInsets.left + contentInsets.right,
            height: size.height + contentInsets.top + contentInsets.bottom
        )
    }
}
