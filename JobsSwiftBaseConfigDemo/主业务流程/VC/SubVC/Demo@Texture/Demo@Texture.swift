//
//  Demo@Texture.swift
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

import JobsSwiftBaseDefines
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import AsyncDisplayKit
import SnapKit
import GKNavigationBarSwift

// MARK: - 数据模型（等价 CKDemoItem）
enum DemoKind {
    case text,
         image,
         button,
         flexRow,
         flexColumn,
         insetCard,
         backgroundOverlay,
         center,
         ratio,
         zstack
}

struct DemoItemStruct {
    let kind: DemoKind
    let title: String
    let subtitle: String
    let image: UIImage?
    static func item(_ k: DemoKind,
                     _ t: String,
                     _ s: String = "",
                     _ img: UIImage? = nil) -> DemoItemStruct {
        .init(kind: k, title: t, subtitle: s, image: img)
    }
}
// MARK: - 视图控制器：外层用 SnapKit 约束
final class ComponentKitLikeKitchenSinkVC: BaseVC {
    private let rootNode = KitchenSinkNode(items: [])
    private var items: [DemoItemStruct] = [
        .item(.text, "Text", "ASTextNode"),
        .item(.image, "Image", "ASImageNode", "photo".sysImg),
        .item(.flexRow, "Flex Row", "ASStackLayoutSpec(.horizontal)"),
        .item(.flexColumn, "Flex Column", "ASStackLayoutSpec(.vertical)"),
        .item(.insetCard, "Inset", "ASInsetLayoutSpec"),
        .item(.backgroundOverlay, "BG + Overlay", "ASBackgroundLayoutSpec + ASOverlayLayoutSpec"),
        .item(.center, "Center", "ASCenterLayoutSpec"),
        .item(.ratio, "Ratio 16:9", "ASRatioLayoutSpec"),
        .item(.zstack, "ZStack", "Overlay as stack"),
        .item(.button, "Button", "ASButtonNode (action)"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "Kitchen-Sink (Swift+Texture)",
            rightButtons: [
                UIButton.sys()
                    .byImage("moon.circle.fill".sysImg, for: .normal)
                    .byImage("moon.circle.fill".sysImg, for: .selected)
                    .onTap { [weak self] sender in
                        guard let self else { return }
                        sender.byToggleSelected()
                        items.shuffle()
                        rootNode.update(items: items, animated: true)
                    },
                UIButton.sys()
                    .byImage("globe".sysImg, for: .normal)
                    .byImage("globe".sysImg, for: .selected)
                    .onTap { [weak self] sender in
                        guard let self else { return }
                        sender.byToggleSelected()
                        items.append(.item(.text, "New Text", "Append at \(items.count)"))
                        rootNode.update(items: items, animated: true)
                    }
            ]
        )
        rootNode.view.byAddTo(view) { [unowned self] make in
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
        }
        // 初次渲染
        rootNode.update(items: items, animated: false)
    }
}
