//
//  VideoThumbCell.swift
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

import AVFoundation
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsImageTools
import SnapKit
/// 多个视频缩略格：显示首帧缩略图（不自动播放）

public final class VideoThumbCell: UICollectionViewCell {

    private lazy var iv: UIImageView = {
        UIImageView
            .jobsMake { _ in }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byAddTo(contentView) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()
    private let playBadge = UIImageView(image: "play.circle.fill".sysImg)
    private var currentURL: URL?
    private var thumbnailToken: JobsImageLoadToken?
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView
            .byClipsToBounds(YES)
            .byCornerRadius(8)
        iv.byVisible(YES)
        if #available(iOS 13.0, *) {
            playBadge.byTintColor(JobsCor.white)
        }
        playBadge
            .byAlpha(0.9)
            .byAddTo(contentView)
        playBadge.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(28)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailToken?.cancel()
        thumbnailToken = nil
        currentURL = nil
        iv.byImage(nil)
    }
    // MARK: - byData
    @discardableResult
    func byData(_ payload: Any?) -> Self {
        // 1) URL
        if let url = payload as? URL {
            render(url)
            return self
        }
        // 2) URL?
        if let url = (payload as? URL?) ?? nil {
            render(url)
            return self
        }
        // 3) [Any?]
        if let items = payload as? [Any?] {
            let first = items.first ?? nil
            if let url = first as? URL {
                render(url)
            } else if let url = (first as? URL?) ?? nil {
                render(url)
            } else {
                currentURL = nil
                iv.byImage(nil)
            }
            return self
        }
        currentURL = nil
        iv.byImage(nil)
        return self
    }

    @discardableResult
    func byData(_ items: Any?...) -> Self {
        let single: (Any?) -> Self = self.byData
        return items.count == 1 ? single(items[0]) : single(items)
    }

    private func render(_ url: URL) {
        thumbnailToken?.cancel()
        currentURL = url
        iv.byImage(nil)
        thumbnailToken = JobsImageLoader.videoThumbnail(at: url,
                                                         time: CMTime(seconds: 0.1,
                                                                      preferredTimescale: 600)) { [weak self] image in
            guard let self, self.currentURL == url, let image else {
                return
            }
            self.iv.byImage(image)
        }
    }
}
