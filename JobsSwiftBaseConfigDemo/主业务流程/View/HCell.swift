//
//  HCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit

// MARK: - Cell
public final class HCell: UICollectionViewCell {
    private lazy var label: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextAlignment(.center)
            .byTextColor(JobsCor.label)
            .byAddTo(contentView) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.byVisible(YES)
        contentView.byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byMasksToBounds(YES)
    }
}
// MARK: - byData
extension HCell {
    /// ① 单参（协议要求）
    @discardableResult
    func byData(_ payload: Any?) -> Self {
        // 直接传 Int
        if let index = payload as? Int {
            label.byText("Card \(index)")
            return self
        }
        // varargs 糖进来会是 [Any?]
        if let items = payload as? [Any?] {
            let index = items.first as? Int
            if let index { label.byText("Card \(index)") };return self
        };return self
    }
    /// ② varargs 版本（保持两个 byData）
    @discardableResult
    func byData(_ items: Any?...) -> Self {
        let single: (Any?) -> Self = self.byData
        return items.count == 1 ? single(items[0]) : single(items)
    }
}
