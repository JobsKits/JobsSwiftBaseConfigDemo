//
//  JobsOCParityBulletTextDemoVC.swift
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
import GKNavigationBarSwift
import SnapKit

final class JobsBulletTextDemoVC: BaseVC {

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(28)
                make.centerX.equalToSuperview()
                make.width.equalTo(200)
            }
    }()

    private lazy var chineseLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.systemIndigo.withAlphaComponent(0.25))
            .byAttributedString(makeChineseText())
            .byAddTo(contentView) { make in
                make.top.left.right.equalToSuperview()
            }
    }()

    private lazy var englishLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.systemTeal.withAlphaComponent(0.25))
            .byAttributedString(makeEnglishText())
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(chineseLabel.snp.bottom).offset(18)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "带小圆点文本及对齐".tr)
        contentView.byVisible(YES)
        chineseLabel.byVisible(YES)
        englishLabel.byVisible(YES)
    }

    private func makeChineseText() -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.headIndent = 18
        paragraph.firstLineHeadIndent = 0
        paragraph.paragraphSpacing = 9
        let first = "• 我是中国人我是中国人我是中国人我是中国人我是中国人"
        let second = "• 你是日本人你是日本人你是日本人你是日本人你是日本人"
        let text = "\(first)\n\(second)"
        let attributedText = NSMutableAttributedString(
            string: text,
            attributes: [
                .font: JobsFont.systemFont(ofSize: 12),
                .foregroundColor: JobsCor.label,
                .paragraphStyle: paragraph
            ]
        )
        attributedText.addAttribute(
            .foregroundColor,
            value: JobsCor.systemRed,
            range: (text as NSString).range(of: "•")
        )
        attributedText.addAttribute(
            .foregroundColor,
            value: JobsCor.systemBlue,
            range: (text as NSString).range(of: "•", options: [], range: NSRange(location: first.count, length: text.count - first.count))
        );return attributedText
    }

    private func makeEnglishText() -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.headIndent = 18
        paragraph.firstLineHeadIndent = 0
        paragraph.paragraphSpacing = 9
        let lines = [
            "Your deposit will be successfully credited to your wallet once the transaction completed.",
            "In case you meet any problem in deposit, please contact our CS.",
            "Additional information can be found on our website."
        ]
        let attributedText = NSMutableAttributedString()
        lines.enumerated().forEach { index, line in
            if index > 0 {
                attributedText.append(NSAttributedString(string: "\n"))
            }
            let attachment = NSTextAttachment()
            attachment.image = makeBulletImage()
            attachment.bounds = CGRect(x: 0, y: 1, width: 8, height: 8)
            attributedText.append(NSAttributedString(attachment: attachment))
            attributedText.append(NSAttributedString(string: " \(line)"))
        }
        attributedText.addAttributes(
            [
                .font: JobsFont.systemFont(ofSize: 12),
                .foregroundColor: JobsCor.label,
                .paragraphStyle: paragraph
            ],
            range: NSRange(location: 0, length: attributedText.length)
        );return attributedText
    }

    private func makeBulletImage() -> UIImage {
        let size = CGSize(width: 8, height: 8)
        return UIGraphicsImageRenderer(size: size).image { context in
            JobsCor.systemRed.setFill()
            context.cgContext.fillEllipse(in: CGRect(origin: .zero, size: size))
        }
    }
}
