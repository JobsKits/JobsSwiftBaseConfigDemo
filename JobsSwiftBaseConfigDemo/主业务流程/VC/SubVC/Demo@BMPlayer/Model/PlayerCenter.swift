//
//  PlayerCenter.swift
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

import SnapKit

enum PlayerCenter { static let shared = PlayerCenterImpl() }
#if canImport(BMPlayer)
import BMPlayer
import JobsSwiftDSL
final class PlayerCenterImpl {
    let player = BMPlayer()
    private var currentHost: UIView?

    init() {
        player.backBlock = { [weak self] _ in self?.player.pause() }
    }

    func attach(to host: UIView) {
        guard host !== currentHost else { return }
        player.removeFromSuperview()
        player.byAddTo(host)
        player.snp.remakeConstraints { $0.edges.equalToSuperview() }
        currentHost = host
    }

    func play(url: URL) {
        // ✅ 统一改为 setVideo(resource:) (+ play())
        let res = BMPlayerResource(url: url)
        player.setVideo(resource: res)
        player.play()
    }

    func pause() { player.pause() }
}
#endif
