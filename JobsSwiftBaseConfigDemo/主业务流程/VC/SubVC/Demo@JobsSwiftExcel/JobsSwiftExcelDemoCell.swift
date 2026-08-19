//
//  JobsSwiftExcelDemoCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import UIKit

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsSwiftExcel
import JobsSwiftUILabelScrolling
import SnapKit

final class JobsSwiftExcelDemoCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()
    private lazy var excelView: JobsSwiftExcelView = {
        JobsSwiftExcelView()
            .byCornerRadius(12)
            .byClipsToBounds(true)
            .byAddTo(contentView) { make in
                make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16).priority(999)
            }
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bySelectionStyle(.none)
        byBackgroundColor(JobsCor.clear)
        contentView.byBackgroundColor(JobsCor.clear)
        titleLabel.byVisible(true)
        excelView.byVisible(true)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        bySelectionStyle(.none)
        titleLabel.byVisible(true)
        excelView.byVisible(true)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        excelView.onSelectCell = nil
        excelView.onHorizontalOffsetChange = nil
        excelView.setHorizontalContentOffset(0, animated: false)
    }

    func configure(
        title: String,
        columns: [JobsSwiftExcelColumn],
        rows: [JobsSwiftExcelRow],
        freezeThroughColumn: Int?,
        onSelectCell: @escaping (JobsSwiftExcelCellContext) -> Void
    ) {
        titleLabel.byText(title)
        excelView.onSelectCell = onSelectCell
        excelView.configure(
            columns: columns,
            rows: rows,
            freezeThroughColumn: freezeThroughColumn
        )
    }
}
