//
//  JobsSwiftCalendarDayCell.swift
//  JobsSwiftCalendar
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftDSL

public final class JobsSwiftCalendarDayCell: UIControl {
    public var date: Date?
    public var monthPosition = JobsSwiftCalendarMonthPosition.notFound
    public private(set) var titleLabel = UILabel.jobsMake { _ in }
    public private(set) var subtitleLabel = UILabel.jobsMake { _ in }
    public private(set) var imageView = UIImageView.jobsMake { _ in }
    public private(set) var eventDotView = UIView.jobsMake { _ in }

    private var selectionView = UIView.jobsMake { _ in }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        jobsCommonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        jobsCommonInit()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        let height = bounds.height
        let circleSide = min(min(width, height) * 0.64, 38)
        let titleHeight: CGFloat = 24
        let hasSubtitle = !(subtitleLabel.text ?? "").isEmpty
        let titleY = hasSubtitle ? max(2, (height - 42) * 0.34) : max(2, (height - titleHeight) * 0.42)
        selectionView.byFrame(CGRect(x: (width - circleSide) / 2,
                                     y: titleY + (titleHeight - circleSide) / 2,
                                     width: circleSide,
                                     height: circleSide))
        selectionView.byCornerRadius(circleSide / 2)
        titleLabel.byFrame(CGRect(x: 0, y: titleY, width: width, height: titleHeight))
        subtitleLabel.byFrame(CGRect(x: 0, y: titleLabel.frame.maxY - 1, width: width, height: 15))
        imageView.byFrame(CGRect(x: (width - 14) / 2, y: subtitleLabel.frame.maxY, width: 14, height: 14))
        eventDotView
            .byFrame(CGRect(x: (width - 5) / 2, y: height - 8, width: 5, height: 5))
            .byCornerRadius(2.5)
    }

    @discardableResult
    public func byDate(_ date: Date?) -> Self {
        self.date = date
        return self
    }

    @discardableResult
    public func byMonthPosition(_ monthPosition: JobsSwiftCalendarMonthPosition) -> Self {
        self.monthPosition = monthPosition
        return self
    }

    @discardableResult
    public func jobsConfigure(title: String?,
                              subtitle: String?,
                              image: UIImage?,
                              appearance: JobsSwiftCalendarAppearance,
                              monthPosition: JobsSwiftCalendarMonthPosition,
                              enabled: Bool,
                              selected: Bool,
                              today: Bool,
                              eventsCount: Int,
                              titleDefaultColor: UIColor? = nil,
                              titleSelectionColor: UIColor? = nil,
                              subtitleDefaultColor: UIColor? = nil,
                              selectionColor: UIColor? = nil) -> Self {
        titleLabel.byText(title)
        subtitleLabel.byText(subtitle)
        imageView
            .byImage(image)
            .byHidden(image == nil)
        titleLabel.byFont(appearance.titleFont)
        subtitleLabel.byFont(appearance.subtitleFont)
        let placeholder = monthPosition != .current
        selectionView
            .byHidden(!(selected || today))
            .byBackgroundColor(selected ? (selectionColor ?? appearance.selectionColor) : appearance.todayColor)
        titleLabel.byTextColor(selected ? (titleSelectionColor ?? appearance.titleSelectionColor) : (today ? appearance.titleTodayColor : (placeholder ? appearance.titlePlaceholderColor : (titleDefaultColor ?? appearance.titleDefaultColor))))
        subtitleLabel.byTextColor(selected ? appearance.subtitleSelectionColor : (placeholder ? appearance.subtitlePlaceholderColor : (subtitleDefaultColor ?? appearance.subtitleDefaultColor)))
        eventDotView
            .byHidden(eventsCount <= 0)
            .byBackgroundColor(selected ? appearance.eventSelectionColor : appearance.eventDefaultColor)
        return self
            .byMonthPosition(monthPosition)
            .byEnabled(enabled)
            .bySelected(selected)
            .byAlpha(enabled ? 1 : 0.35)
            .bySetNeedsLayout()
    }
}

private extension JobsSwiftCalendarDayCell {
    func jobsCommonInit() {
        self.byBackgroundColor(JobsCor.clear)
        selectionView
            .byUserInteractionEnabled(false)
            .byHidden(true)
            .byAddTo(self)
        titleLabel
            .byTextAlignment(.center)
            .byUserInteractionEnabled(false)
            .byAddTo(self)
        subtitleLabel
            .byTextAlignment(.center)
            .byUserInteractionEnabled(false)
            .byAddTo(self)
        imageView
            .byContentMode(.scaleAspectFit)
            .byUserInteractionEnabled(false)
            .byAddTo(self)
        eventDotView
            .byUserInteractionEnabled(false)
            .byHidden(true)
            .byAddTo(self)
    }
}
