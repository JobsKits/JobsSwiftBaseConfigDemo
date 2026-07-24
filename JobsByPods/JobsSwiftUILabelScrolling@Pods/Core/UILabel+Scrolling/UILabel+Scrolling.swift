//
//  UILabel+Scrolling.swift
//  JobsSwiftUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

import UIKit
import ObjectiveC
import JobsSwiftDSL

public enum JobsLabelTextDisplayMode: Int, Sendable {
    /// 固定单行，必要时缩小字号。
    case scaleToFit
    /// 固定单行，尾部省略。
    case singleLineTailTruncation
    /// 固定多行，最后一行尾部省略。
    case multiLineTailTruncation
    /// 固定单行，溢出内容滚动展示。
    case scrolling
}

private enum JobsUILabelScrollingAssociatedKey {
    static var controller: UInt8 = 0
    static var textDisplayMode: UInt8 = 0
}

private extension UILabel {
    var jobs_existingScrollController: JobsLabelScrollController? {
        objc_getAssociatedObject(
            self,
            &JobsUILabelScrollingAssociatedKey.controller
        ) as? JobsLabelScrollController
    }

    var jobs_scrollController: JobsLabelScrollController {
        if let controller = jobs_existingScrollController {
            return controller
        }
        let controller = JobsLabelScrollController(label: self)
        objc_setAssociatedObject(
            self,
            &JobsUILabelScrollingAssociatedKey.controller,
            controller,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        );return controller
    }
}

public extension UILabel {
    /// 用统一枚举配置 UILabel 的四种定尺寸文字展示策略。
    @discardableResult
    func byTextDisplayMode(
        _ mode: JobsLabelTextDisplayMode,
        minimumScaleFactor: CGFloat = 0.5,
        maximumNumberOfLines: Int = 2,
        scrollConfiguration: JobsLabelScrollConfiguration = .continuous()
    ) -> Self {
        objc_setAssociatedObject(
            self,
            &JobsUILabelScrollingAssociatedKey.textDisplayMode,
            mode.rawValue,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        switch mode {
        /// 处理 .scaleToFit 分支
        case .scaleToFit:
            byStopTextScroll()
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(true)
                .byMinimumScaleFactor(min(max(0.01, minimumScaleFactor), 1))
                .byLineBreakMode(.byTruncatingTail)
        /// 处理 .singleLineTailTruncation 分支
        case .singleLineTailTruncation:
            byStopTextScroll()
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(false)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(.byTruncatingTail)
        /// 处理 .multiLineTailTruncation 分支
        case .multiLineTailTruncation:
            byStopTextScroll()
                .byNumberOfLines(max(2, maximumNumberOfLines))
                .byAdjustsFontSizeToFitWidth(false)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(.byTruncatingTail)
        /// 处理 .scrolling 分支
        case .scrolling:
            byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(false)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(.byClipping)
                .byTextScroll(scrollConfiguration)
                .byStartTextScroll()
        };return self
    }

    var jobs_textDisplayMode: JobsLabelTextDisplayMode {
        guard let rawValue = objc_getAssociatedObject(
            self,
            &JobsUILabelScrollingAssociatedKey.textDisplayMode
        ) as? Int else {
            return .singleLineTailTruncation
        };return JobsLabelTextDisplayMode(rawValue: rawValue) ?? .singleLineTailTruncation
    }

    /// 配置滚动参数，不自动启动。
    @discardableResult
    func byTextScroll(_ configuration: JobsLabelScrollConfiguration) -> Self {
        jobs_scrollController.configure(configuration)
        return self
    }

    /// 仅在单行内容宽度超过 UILabel 可视宽度时启动。
    @discardableResult
    func byStartTextScroll() -> Self {
        jobs_scrollController.start()
        return self
    }

    @discardableResult
    func byPauseTextScroll() -> Self {
        jobs_scrollController.pause()
        return self
    }

    @discardableResult
    func byResumeTextScroll() -> Self {
        jobs_scrollController.resume()
        return self
    }

    /// 文案、字体、颜色或约束尺寸变化后主动重建 CoreText 排版。
    @discardableResult
    func byReloadTextScroll() -> Self {
        jobs_scrollController.reload()
        return self
    }

    /// 停止并恢复 UILabel 原始绘制状态。
    @discardableResult
    func byStopTextScroll() -> Self {
        jobs_existingScrollController?.stop()
        return self
    }

    var jobs_isTextScrolling: Bool {
        jobs_existingScrollController?.isRunning ?? false
    }
}
