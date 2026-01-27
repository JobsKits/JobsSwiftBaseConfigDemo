//
//  PlayerCenter.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/28/25.
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
final class PlayerCenterImpl {
    let player = BMPlayer()
    private var currentHost: UIView?

    init() {
        player.backBlock = { [weak self] _ in self?.player.pause() }
    }

    func attach(to host: UIView) {
        guard host !== currentHost else { return }
        player.removeFromSuperview()
        host.addSubview(player)
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
