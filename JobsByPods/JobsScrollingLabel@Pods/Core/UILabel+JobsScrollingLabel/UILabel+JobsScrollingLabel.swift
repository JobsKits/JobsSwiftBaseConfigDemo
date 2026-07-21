//
//  UILabel+JobsScrollingLabel.swift
//  JobsScrollingLabel
//
//  Created by Jobs on 2026年7月17日，星期五.
//

import UIKit
import ObjectiveC

private enum JobsScrollingLabelAssociatedKey {
    static var controller: UInt8 = 0
}

private extension UILabel {
    var jobs_scrollController: JobsLabelScrollController {
        if let controller = objc_getAssociatedObject(
            self,
            &JobsScrollingLabelAssociatedKey.controller
        ) as? JobsLabelScrollController {
            return controller
        }
        let controller = JobsLabelScrollController(label: self)
        objc_setAssociatedObject(
            self,
            &JobsScrollingLabelAssociatedKey.controller,
            controller,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        );return controller
    }
}

public extension UILabel {
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
        jobs_scrollController.stop()
        return self
    }

    var jobs_isTextScrolling: Bool {
        jobs_scrollController.isRunning
    }
}
