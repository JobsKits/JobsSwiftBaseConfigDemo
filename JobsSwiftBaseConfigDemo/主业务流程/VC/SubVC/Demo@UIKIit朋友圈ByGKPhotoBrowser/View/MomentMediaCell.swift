//
//  MomentMediaCell.swift
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
import JobsImageTools
import SnapKit

final class MomentMediaCell: UICollectionViewCell {
    public lazy var imageViewRef: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.tertiarySystemFill)
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byCornerRadius(8)
            .byMasksToBounds(YES)
            .byAddTo(contentView) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var playBadge: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(.scaleAspectFit)
            .byTintColor(JobsCor.white)
            .byImage("play.circle.fill".sysImg)
            .byAddTo(contentView) { make in
                make.right.bottom.equalToSuperview().inset(6)
                make.size.equalTo(CGSize(width: 24, height: 24))
            }
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageViewRef.byVisible(YES)
        playBadge.byVisible(YES)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewRef.jobs_cancelImageLoad()
        imageViewRef.byImage(nil)
        playBadge.byVisible(false)
    }

    @discardableResult
    func byData(_ any: Any?) -> Self {
        guard let m = any as? MomentMedia else { return self }
        playBadge.byVisible(m.isVideo)
        imageViewRef.jobs_setImage(
            m.coverURL,
            shimmerConfig: nil,
            targetSize: imageViewRef.bounds.size
        );return self
    }
}
