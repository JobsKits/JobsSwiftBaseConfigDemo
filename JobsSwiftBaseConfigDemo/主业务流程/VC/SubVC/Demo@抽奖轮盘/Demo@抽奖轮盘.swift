//
//  LuckyWheelDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 11/28/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsInheritance
import JobsByUIKit
import JobsToast
import JobsTextTools
import JobsSwiftBaseDefines

final class LuckyWheelDemoVC: BaseVC {
    private lazy var wheelView: LuckyWheelView = {
        LuckyWheelView()
            .bySegments([
                .init(text: "一等奖".tr,
                      textFont: .systemFont(ofSize: 12, weight: .medium),
                      textColor: .randomColor(),
                      backgroundColor: .randomColor(),
                      placeholderImage: "globe".sysImg,
                      imageURLString:"https://picsum.photos/30"),
                .init(text: "二等奖".tr,
                      textFont: .systemFont(ofSize: 12, weight: .medium),
                      textColor: .randomColor(),
                      backgroundColor: .randomColor(),
                      placeholderImage: "plus".sysImg,
                      imageURLString:"https://picsum.photos/30"),
                .init(text: "三等奖".tr,
                      textFont: .systemFont(ofSize: 12, weight: .medium),
                      textColor: .randomColor(),
                      backgroundColor: .randomColor(),
                      placeholderImage: "message".sysImg,
                      imageURLString:"https://picsum.photos/30"),
                .init(text: "谢谢参与".tr,
                      textFont: .systemFont(ofSize: 12, weight: .medium),
                      textColor: .randomColor(),
                      backgroundColor: .randomColor(),
                      placeholderImage: "tray".sysImg,
                      imageURLString:"https://picsum.photos/30"),
            ])
            .byPointerDirection(.right) // 停止锚点作为中奖结果
            .bySpinDuration(3.0)
            .byInitialVelocity(25.0)
            .byPanRotationEnabled(true)
            .onSegmentTap { segment in
                /// 短按和旋转停止后的中奖结果
                "🍀 短按扇形 \(String(describing: segment.text?.rnl))".toast
            }
            .onSegmentLongPress { segment, gr in
                if gr.state == .began {
                    "👆 长按开始 \(String(describing: segment.text?.rnl))".toast
                }
            }
            .byAddTo(view) { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(300)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "抽奖转盘",
            rightButtons: [
                UIButton.sys()
                    /// 按钮图片@图文关系
                    .byImage("pause.circle.fill".sysImg, for: .normal)
                    .byImage("pause.circle.fill".sysImg, for: .selected)
                    /// 事件触发@点按
                    .onTap { [weak self] sender in
                        guard let self else { return }
                        sender.isSelected.toggle()
                        wheelView.stopSpin()
                    }
            ]
        )
        wheelView.byVisible(YES)
    }
}
