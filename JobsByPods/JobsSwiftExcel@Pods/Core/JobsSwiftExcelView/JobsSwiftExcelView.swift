//
//  JobsSwiftExcelView.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import UIKit

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftUILabelScrolling
import SnapKit

public final class JobsSwiftExcelView: UIView {
    public private(set) var columns: [JobsSwiftExcelColumn] = []
    public private(set) var rows: [JobsSwiftExcelRow] = []
    /// nil 表示不冻结；N 表示冻结第 0...N 列。
    public private(set) var freezeThroughColumn: Int?
    public private(set) var style = JobsSwiftExcelStyle()
    public var onSelectCell: ((JobsSwiftExcelCellContext) -> Void)?
    public var onHorizontalOffsetChange: ((CGFloat) -> Void)?
    public var requiredHeight: CGFloat {
        style.headerHeight + CGFloat(rows.count) * style.rowHeight
    }
    public var horizontalContentOffset: CGFloat {
        horizontalScrollView.contentOffset.x
    }

    private lazy var frozenPaneView: UIView = {
        UIView()
            .byClipsToBounds(true)
            .byAddTo(self)
    }()
    private lazy var horizontalScrollView: UIScrollView = {
        UIScrollView()
            .byDelegate(self)
            .byShowsVerticalScrollIndicator(false)
            .byAlwaysBounceVertical(false)
            .byDirectionalLockEnabled(true)
            .byAddTo(self)
    }()
    private lazy var scrollContentView: UIView = {
        UIView()
            .byAddTo(horizontalScrollView)
    }()
    private var generatedLabels: [UILabel] = []

    public override init(frame: CGRect) {
        super.init(frame: frame)
        jobsCommonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        jobsCommonInit()
    }

    public override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: requiredHeight)
    }

    public func configure(
        columns: [JobsSwiftExcelColumn],
        rows: [JobsSwiftExcelRow],
        freezeThroughColumn: Int? = nil,
        style: JobsSwiftExcelStyle = JobsSwiftExcelStyle()
    ) {
        self.columns = columns
        self.rows = rows
        self.freezeThroughColumn = freezeThroughColumn
        self.style = style
        reloadData()
    }

    public func reloadData() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.reloadData()
            };return
        }
        jobsRemoveGeneratedViews()
        jobsApplyStyle()
        jobsBuildGrid()
        jobsUpdateConstraints()
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    public func setHorizontalContentOffset(_ offset: CGFloat, animated: Bool) {
        layoutIfNeeded()
        let maximumOffset = max(0, horizontalScrollView.contentSize.width - horizontalScrollView.bounds.width)
        horizontalScrollView.setContentOffset(
            CGPoint(x: min(max(0, offset), maximumOffset), y: 0),
            animated: animated
        )
    }
}

private extension JobsSwiftExcelView {
    var resolvedColumnWidths: [CGFloat] {
        columns.map { $0.width > 0 ? $0.width : style.defaultColumnWidth }
    }

    var frozenColumnCount: Int {
        guard let freezeThroughColumn, !columns.isEmpty else { return 0 };return min(max(0, freezeThroughColumn + 1), columns.count)
    }

    func jobsCommonInit() {
        clipsToBounds = true
        frozenPaneView.byVisible(true)
        horizontalScrollView.byVisible(true)
        scrollContentView.byVisible(true)
        reloadData()
    }

    func jobsMakeLabel() -> UILabel {
        UILabel()
            .byTextAlignment(.center)
            .byBorderWidth(style.gridLineWidth)
            .byBorderColor(style.gridLineColor)
    }

    func jobsRemoveGeneratedViews() {
        generatedLabels.forEach {
            $0.byStopTextScroll()
            $0.removeFromSuperview()
        }
        generatedLabels.removeAll()
    }

    func jobsApplyStyle() {
        horizontalScrollView
            .byShowsHorizontalScrollIndicator(style.showsHorizontalScrollIndicator)
            .byBounces(style.bouncesHorizontally)
            .byAlwaysBounceHorizontal(style.bouncesHorizontally && columns.count > frozenColumnCount)
        scrollContentView.byBackgroundColor(style.bodyBackgroundColor)
    }

    func jobsBuildGrid() {
        let widths = resolvedColumnWidths
        var frozenOffset: CGFloat = 0
        var scrollOffset: CGFloat = 0
        for columnIndex in columns.indices {
            let isFrozen = columnIndex < frozenColumnCount
            let parentView = isFrozen ? frozenPaneView : scrollContentView
            let offset = isFrozen ? frozenOffset : scrollOffset
            let width = widths[columnIndex]
            jobsAddLabel(
                cell: columns[columnIndex].header,
                font: style.headerFont,
                textColor: isFrozen ? style.frozenHeaderTextColor : style.headerTextColor,
                backgroundColor: isFrozen ? style.frozenHeaderBackgroundColor : style.headerBackgroundColor,
                parentView: parentView,
                row: -1,
                column: columnIndex,
                top: 0,
                left: offset,
                width: width,
                height: style.headerHeight,
                selectable: false
            )
            for rowIndex in rows.indices {
                let cell = rows[rowIndex].cells.indices.contains(columnIndex)
                    ? rows[rowIndex].cells[columnIndex]
                    : JobsSwiftExcelCell(text: "")
                jobsAddLabel(
                    cell: cell,
                    font: style.bodyFont,
                    textColor: isFrozen ? style.primaryTextColor : style.secondaryTextColor,
                    backgroundColor: isFrozen ? style.frozenColumnBackgroundColor : style.bodyBackgroundColor,
                    parentView: parentView,
                    row: rowIndex,
                    column: columnIndex,
                    top: style.headerHeight + CGFloat(rowIndex) * style.rowHeight,
                    left: offset,
                    width: width,
                    height: style.rowHeight,
                    selectable: true
                )
            }
            if isFrozen {
                frozenOffset += width
            } else {
                scrollOffset += width
            }
        }
    }

    func jobsAddLabel(
        cell: JobsSwiftExcelCell,
        font: UIFont,
        textColor: UIColor,
        backgroundColor: UIColor,
        parentView: UIView,
        row: Int,
        column: Int,
        top: CGFloat,
        left: CGFloat,
        width: CGFloat,
        height: CGFloat,
        selectable: Bool
    ) {
        let label = jobsMakeLabel()
            .byTag(selectable ? row * max(1, columns.count) + column : -1)
            .byText(cell.text)
            .byTextColor(textColor)
            .byFont(font)
            .byBackgroundColor(backgroundColor)
            .byTextDisplayMode(
                cell.textDisplayMode,
                minimumScaleFactor: cell.minimumScaleFactor,
                maximumNumberOfLines: cell.maximumNumberOfLines,
                scrollConfiguration: cell.scrollConfiguration
            )
        if selectable {
            label.onTap { [weak self] sender in
                self?.jobsHandleCellTap(sender)
            }
        }
        label.byAddTo(parentView) { make in
            make.top.equalToSuperview().offset(top)
            make.left.equalToSuperview().offset(left)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        generatedLabels.append(label)
    }

    func jobsUpdateConstraints() {
        let widths = resolvedColumnWidths
        let frozenWidth = widths.prefix(frozenColumnCount).reduce(0, +)
        let scrollWidth = widths.dropFirst(frozenColumnCount).reduce(0, +)
        let contentHeight = max(1, requiredHeight)
        frozenPaneView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(frozenWidth).priority(999)
            make.width.lessThanOrEqualToSuperview()
        }
        horizontalScrollView.snp.remakeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(frozenPaneView.snp.right)
        }
        scrollContentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(max(1, scrollWidth))
            make.height.equalTo(contentHeight)
        }
    }

    func jobsHandleCellTap(_ label: UILabel) {
        let columnCount = max(1, columns.count)
        let row = label.tag / columnCount
        let column = label.tag % columnCount
        guard rows.indices.contains(row), columns.indices.contains(column) else { return }
        let value = rows[row].cells.indices.contains(column) ? rows[row].cells[column].text : ""
        onSelectCell?(JobsSwiftExcelCellContext(row: row, column: column, value: value))
    }
}

extension JobsSwiftExcelView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView === horizontalScrollView else { return }
        onHorizontalOffsetChange?(scrollView.contentOffset.x)
    }
}
