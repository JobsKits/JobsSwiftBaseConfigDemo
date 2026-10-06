//
//  VideoTextureDisplayLinkTarget.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import QuartzCore
import Foundation

@MainActor
final class VideoTextureDisplayLinkTarget: NSObject {
    private weak var manager: VideoTextureManager?

    init(manager: VideoTextureManager) {
        self.manager = manager
    }

    @objc func tick(_ displayLink: CADisplayLink) {
        guard let manager else {
            displayLink.invalidate()
            return
        }
        manager.updateTexture()
    }
}
