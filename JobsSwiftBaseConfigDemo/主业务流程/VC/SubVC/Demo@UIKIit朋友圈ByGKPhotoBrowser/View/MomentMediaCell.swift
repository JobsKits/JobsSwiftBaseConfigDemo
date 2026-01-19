//
//  MomentMediaCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/20/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsImageTools

final class MomentMediaCell: UICollectionViewCell {
    private var task: URLSessionDataTask?
    private var currentURL: URL?
    public lazy var imageViewRef: UIImageView = {
        UIImageView()
            .byBgColor(.tertiarySystemFill)
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byCornerRadius(8)
            .byMasksToBounds(YES)
            .byAddTo(contentView) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var playBadge: UIImageView = {
        UIImageView()
            .byContentMode(.scaleAspectFit)
            .byTintColor(.white)
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
        task?.cancel()
        task = nil
        currentURL = nil
        imageViewRef.image = nil
        playBadge.byVisible(false)
    }

    @discardableResult
    func byData(_ any: Any?) -> Self {
        guard let m = any as? MomentMedia else { return self }
        playBadge.byVisible(m.isVideo)
        guard let url = URL(string: m.coverURL) else { return self }
        currentURL = url
        if let cached = JobsSimpleImageLoader.shared.cachedImage(for: url) {
            imageViewRef.image = cached
            return self
        }
        task?.cancel()
        task = JobsSimpleImageLoader.shared.load(url) { [weak self] img in
            guard let self else { return }
            guard self.currentURL == url else { return }
            self.imageViewRef.image = img
        };return self
    }
}
