//
//  VideoThumbCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/18/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import AVFoundation
import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit
/// 多个视频缩略格：显示首帧缩略图（不自动播放）
public final class VideoThumbCell: UICollectionViewCell {
    private lazy var iv: UIImageView = {
        UIImageView()
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds(YES)
            .byAddTo(contentView) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()
    private let playBadge = UIImageView(image: "play.circle.fill".sysImg)
    private var currentURL: URL?
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.byClipsToBounds(YES).byCornerRadius(8)
        iv.byVisible(YES)
        if #available(iOS 13.0, *) { playBadge.tintColor = .white }
        playBadge.alpha = 0.9
        contentView.addSubview(playBadge)
        playBadge.snp.makeConstraints { make in make.center.equalToSuperview(); make.width.height.equalTo(28) }
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public override func prepareForReuse() {
        super.prepareForReuse()
        currentURL = nil
        iv.image = nil
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
                iv.image = nil
            }
            return self
        }

        currentURL = nil
        iv.image = nil
        return self
    }

    @discardableResult
    func byData(_ items: Any?...) -> Self {
        let single: (Any?) -> Self = self.byData
        return items.count == 1 ? single(items[0]) : single(items)
    }

    private func render(_ url: URL) {
        currentURL = url
        iv.image = nil

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let asset = AVAsset(url: url)
            let gen = AVAssetImageGenerator(asset: asset)
            gen.appliesPreferredTrackTransform = true
            let time = CMTime(seconds: 0.1, preferredTimescale: 600)

            guard let cg = try? gen.copyCGImage(at: time, actualTime: nil) else { return }
            let img = UIImage(cgImage: cg)

            DispatchQueue.main.async {
                guard let self else { return }
                guard self.currentURL == url else { return } // ✅ 防复用串图
                self.iv.image = img
            }
        }
    }

}
