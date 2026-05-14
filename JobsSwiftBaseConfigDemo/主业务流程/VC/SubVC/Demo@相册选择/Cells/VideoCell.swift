//
//  VideoCell.swift
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
import SnapKit
import JobsByUIKit
/// 单个视频：自动播放，结束后出现「播放按钮」可重播
public final class VideoCell: UICollectionViewCell {
    private var playerLayer: AVPlayerLayer?
    private var player: AVPlayer?
    private var endObserver: NSObjectProtocol?
    private lazy var playOverlay: UIButton = { [unowned self] in
        let img = "播放按钮".img.withRenderingMode(.alwaysOriginal)   // 确保非模板渲染
        let b = UIButton(type: .system)
            .byImage(img, for: .normal)
            .byBackgroundColor(.clear)
            .byContentEdgeInsets(.zero)
            .onTap { [weak self] _ in self?.onReplay() }
            .byAddTo(self.contentView) { make in
                make.center.equalToSuperview()
                // 按原设计 64x64；想用原图尺寸就改成 img.size.width/height
                make.width.height.equalTo(64)
            }
        // 绝对置顶
        b.layer.zPosition = 9999
        b.isHidden = true
        return b
    }()

    public override func prepareForReuse() {
        super.prepareForReuse()
        tearDownPlayer()
    }
    deinit { tearDownPlayer() }

    private func tearDownPlayer() {
        if let obs = endObserver {
            NotificationCenter.default.removeObserver(obs)
            endObserver = nil
        }
        player?.pause()
        player = nil
        playerLayer?.removeFromSuperlayer()
        playerLayer = nil
        playOverlay.isHidden = true
    }

    // MARK: - byData
    @discardableResult
    func byData(_ payload: Any?) -> Self {

        // 1) URL
        if let url = payload as? URL {
            render(url)
            return self
        }

        // 2) URL? （例如传进来的是 videoURL）
        if let url = (payload as? URL?) ?? nil {
            render(url)
            return self
        }

        // 3) [Any?]（varargs 糖会进这里）
        if let items = payload as? [Any?] {
            let first = items.first ?? nil
            if let url = first as? URL {
                render(url)
            } else if let url = (first as? URL?) ?? nil {
                render(url)
            } else {
                tearDownPlayer()
            }
            return self
        }

        tearDownPlayer()
        return self
    }

    @discardableResult
    func byData(_ items: Any?...) -> Self {
        let single: (Any?) -> Self = self.byData
        return items.count == 1 ? single(items[0]) : single(items)
    }

    private func render(_ url: URL) {
        tearDownPlayer()

        let player = AVPlayer(url: url)
        player.actionAtItemEnd = .pause        // 到尾暂停，等点按钮
        self.player = player

        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        layer.frame = contentView.bounds
        layer.zPosition = -1                    // ⬅︎ 永远在按钮下面
        contentView.layer.addSublayer(layer)
        playerLayer = layer

        // 再兜底把按钮提到最上
        contentView.bringSubviewToFront(playOverlay)
        playOverlay.layer.zPosition = 9999
        playOverlay.isHidden = true

        // 结束后显示按钮 —— object 用 nil 更稳
        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.playOverlay.isHidden = false
        }

        player.seek(to: .zero)
        player.play()
        setNeedsLayout(); layoutIfNeeded()
        playerLayer?.frame = contentView.bounds
    }


    @objc private func onReplay() {
        playOverlay.isHidden = true
        player?.seek(to: .zero)
        player?.play()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = contentView.bounds
        // 再次确保覆盖层在最顶
        if let pl = playerLayer { pl.zPosition = -1 }
        playOverlay.layer.zPosition = 9999
    }
}
