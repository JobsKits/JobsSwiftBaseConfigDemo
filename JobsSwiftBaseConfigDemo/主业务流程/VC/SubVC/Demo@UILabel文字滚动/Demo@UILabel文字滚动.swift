//
//  Demo@UILabel文字滚动.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsScrollingLabel
import JobsSwiftBaseDefines
import SnapKit

final class JobsScrollingLabelDemoVC: BaseVC {
    private var showsAlternateText = false

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byShowsVerticalScrollIndicator(YES)
            .byAlwaysBounceVertical(YES)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(self.scrollView.contentLayoutGuide)
                make.width.equalTo(self.scrollView.frameLayoutGuide)
            }
    }()

    private lazy var introLabel: UILabel = {
        UILabel()
            .byText("CoreText 完整排版 + CALayer 绘制 + JobsSwiftTimer 驱动。只有文字溢出时才进入滚动管线。")
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var continuousTitleLabel: UILabel = {
        makeSectionTitle("模式一：连续跑马灯")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.introLabel.snp.bottom).offset(28)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var continuousCardView: UIView = {
        makeCardView()
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.continuousTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(64)
            }
    }()

    private lazy var continuousLabel: UILabel = {
        UILabel()
            .byText("JobsScrollingLabel：从标题开头完整滚到结尾，再以固定间距无缝接回开头。")
            .byNumberOfLines(1)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(continuousCardView) { make in
                make.left.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.height.equalTo(30)
            }
            .byTextScroll(.continuous(speed: 38, spacing: 48, startDelay: 0.8))
            .byStartTextScroll()
    }()

    private lazy var pingPongTitleLabel: UILabel = {
        makeSectionTitle("模式二：左右往返")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.continuousCardView.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var pingPongCardView: UIView = {
        makeCardView()
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.pingPongTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(64)
            }
    }()

    private lazy var pingPongLabel: UILabel = {
        UILabel()
            .byAttributedString(makePingPongText(alternate: false))
            .byNumberOfLines(1)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .regular))
            .byTextColor(JobsCor.label)
            .byAddTo(pingPongCardView) { make in
                make.left.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.height.equalTo(30)
            }
            .byTextScroll(.pingPong(speed: 30, startDelay: 0.8, edgePause: 0.9))
            .byStartTextScroll()
    }()

    private lazy var shortTitleLabel: UILabel = {
        makeSectionTitle("边界验证：短文案不滚动")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.pingPongCardView.snp.bottom).offset(24)
                make.left.right.equalToSuperview().inset(20)
            }
    }()

    private lazy var shortCardView: UIView = {
        makeCardView()
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.shortTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(64)
            }
    }()

    private lazy var shortLabel: UILabel = {
        UILabel()
            .byText("短文案：保持 UILabel 原生绘制")
            .byNumberOfLines(1)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .regular))
            .byTextColor(JobsCor.label)
            .byAddTo(shortCardView) { make in
                make.left.right.equalToSuperview().inset(16)
                make.centerY.equalToSuperview()
                make.height.equalTo(30)
            }
            .byTextScroll(.continuous())
            .byStartTextScroll()
    }()

    private lazy var pauseButton: UIButton = {
        UIButton.sys()
            .byTitle("暂停".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemOrange, for: .normal)
            .byCornerRadius(8)
            .byMasksToBounds(YES)
            .onTap { [weak self] _ in
                self?.continuousLabel.byPauseTextScroll()
                self?.pingPongLabel.byPauseTextScroll()
            }
    }()

    private lazy var resumeButton: UIButton = {
        UIButton.sys()
            .byTitle("继续".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            .byCornerRadius(8)
            .byMasksToBounds(YES)
            .onTap { [weak self] _ in
                self?.continuousLabel.byResumeTextScroll()
                self?.pingPongLabel.byResumeTextScroll()
            }
    }()

    private lazy var switchTextButton: UIButton = {
        UIButton.sys()
            .byTitle("切换文案".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byCornerRadius(8)
            .byMasksToBounds(YES)
            .onTap { [weak self] _ in
                self?.switchText()
            }
    }()

    private lazy var controlsStackView: UIStackView = {
        UIStackView()
            .byAxis(.horizontal)
            .bySpacing(10)
            .byDistribution(.fillEqually)
            .byAddArrangedSubviews([
                pauseButton,
                resumeButton,
                switchTextButton
            ])
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.shortCardView.snp.bottom).offset(28)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(44)
                make.bottom.equalToSuperview().inset(30)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "CoreText UILabel 文字滚动".tr)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        introLabel.byVisible(YES)
        continuousTitleLabel.byVisible(YES)
        continuousCardView.byVisible(YES)
        continuousLabel.byVisible(YES)
        pingPongTitleLabel.byVisible(YES)
        pingPongCardView.byVisible(YES)
        pingPongLabel.byVisible(YES)
        shortTitleLabel.byVisible(YES)
        shortCardView.byVisible(YES)
        shortLabel.byVisible(YES)
        controlsStackView.byVisible(YES)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        continuousLabel.byResumeTextScroll()
        pingPongLabel.byResumeTextScroll()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        continuousLabel.byPauseTextScroll()
        pingPongLabel.byPauseTextScroll()
    }
}

private extension JobsScrollingLabelDemoVC {
    func makeCardView() -> UIView {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byCornerRadius(12)
            .byMasksToBounds(YES)
    }

    func makeSectionTitle(_ text: String) -> UILabel {
        UILabel()
            .byText(text)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTextColor(JobsCor.secondaryLabel)
    }

    func makePingPongText(alternate: Bool) -> NSAttributedString {
        let prefix = alternate ? "富文本已刷新：" : "CoreText 富文本："
        let result = NSMutableAttributedString(
            string: prefix,
            attributes: [
                .font: JobsFont.boldSystemFont(ofSize: 16),
                .foregroundColor: JobsCor.systemPink
            ]
        )
        result.append(NSAttributedString(
            string: "左右触边后停留并折返，完整保留不同字体、颜色和 Emoji 🚀✨",
            attributes: [
                .font: JobsFont.systemFont(ofSize: alternate ? 17 : 16, weight: .regular),
                .foregroundColor: JobsCor.systemBlue
            ]
        ));return result
    }

    func switchText() {
        showsAlternateText.toggle()
        let continuousText = showsAlternateText
        ? "文案已动态刷新：CoreText 会重新排版一次，后续仍然只移动 CALayer，不在每一帧重复绘制。"
        : "JobsScrollingLabel：从标题开头完整滚到结尾，再以固定间距无缝接回开头。"
        continuousLabel
            .byText(continuousText)
            .byReloadTextScroll()
        pingPongLabel
            .byAttributedString(makePingPongText(alternate: showsAlternateText))
            .byReloadTextScroll()
    }
}
