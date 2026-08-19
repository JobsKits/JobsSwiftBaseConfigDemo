//
//  ImageCell.swift
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

public final class ImageCell: UICollectionViewCell {
    private lazy var iv: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byAddTo(contentView) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        iv.byVisible(YES)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override func prepareForReuse() {
        super.prepareForReuse()
        iv.byImage(nil)
    }
    // MARK: - byData
    @discardableResult
    func byData(_ payload: Any?) -> Self {
        if let img = payload as? UIImage {
            iv.byImage(img)
            return self
        }
        if let img = (payload as? UIImage?) ?? nil {
            iv.byImage(img)
            return self
        }
        if let items = payload as? [Any?] {
            let first = items.first ?? nil
            if let img = first as? UIImage {
                iv.byImage(img)
            } else if let img = (first as? UIImage?) ?? nil {
                iv.byImage(img)
            } else {
                iv.byImage(nil)
            };return self
        }
        iv.byImage(nil)
        return self
    }

    @discardableResult
    func byData(_ items: Any?...) -> Self {
        let single: (Any?) -> Self = self.byData
        return items.count == 1 ? single(items[0]) : single(items)
    }
}
