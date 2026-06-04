//
//  JobsButtonDemoVC.swift
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
import JobsInheritance
import JobsSwiftBaseDefines
import JobsScale
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class JobsButtonDemoVC: BaseVC {

    private let horizontalInset: CGFloat = 16
    private let itemHeight: CGFloat = 78
    private let vSpacing: CGFloat = 14
    // MARK: - UI (Lazy)
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byText("JobsButton Demo：4种模式 + 点击/长按（叠加不覆盖）\n\n• 点击：会依次触发多段回调（叠加）\n• 长按：同样支持叠加\n• 图片：前景图/背景图都用 Kingfisher 链式加载")
            .byFont(.systemFont(ofSize: 14))
            .byTextColor(.secondaryLabel)
            .byTextAlignment(.left)
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    // MARK: - Buttons (Lazy) —— 全部按“标准链式”统一写法
    private lazy var btn1: JobsButton = {
        JobsButton()
            .byMode(.imageTopTextBottom)
            .byTitleLabel { lab in
                lab.byText("上图下文")
                    .byTextColor(.red)
            }
            .bySubTitleLabel { lab in
                lab.byText("image -> title -> subtitle")
                    .byTextColor(.blue)
            }
            // 前景图：内部 foregroundImageView（链式不丢 self）
            .byForegroundImageView { iv in
                iv.byContentMode(.scaleAspectFill)
                    .byClipsToBounds()
                    .kf_setImage("https://picsum.photos/200?random=111", placeholder: "Ani".img)
            }
            // 背景图：JobsButton 自己是 UIImageView
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds()
            .kf_setImage("https://picsum.photos/600/200?random=11", placeholder: "Ani".img)
            .addTapActionAppend { _ in
                print("btn1 tap #1")
                "点击了悬浮按钮：上图下文（tap #1）".toast
            }
            .addTapActionAppend { _ in
                print("btn1 tap #2 (append)")
                "点击了悬浮按钮：上图下文（tap #2 叠加）".toast
            }
            .addLongPressActionAppend { gr in
                guard gr.state == .began else { return }
                print("btn1 longPress #1 began")
                "长按了悬浮按钮：上图下文（longPress #1）".toast
            }
            .addLongPressActionAppend { gr in
                guard gr.state == .began else { return }
                print("btn1 longPress #2 began (append)")
                "长按了悬浮按钮：上图下文（longPress #2 叠加）".toast
            }
            .byBorderColor(.cyan)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.hintLabel.snp.bottom).offset(18)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(itemHeight)
            }
    }()

    private lazy var btn2: JobsButton = {
        JobsButton()
            .byMode(.textTopImageBottom)
            .byTitleLabel { lab in
                lab.byText("上文下图")
                    .byTextColor(.red)
            }
            .bySubTitleLabel { lab in
                lab.byText("title -> subtitle -> image")
                    .byTextColor(.blue)
            }
            .byForegroundImageView { iv in
                iv.byContentMode(.scaleAspectFill)
                    .byClipsToBounds()
                    .kf_setImage("https://picsum.photos/200?random=222", placeholder: "Ani".img)
            }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds()
            .kf_setImage("https://picsum.photos/600/200?random=22", placeholder: "Ani".img)
            .addTapActionAppend { _ in
                print("btn2 tap #1")
                "点击了悬浮按钮：上文下图（tap #1）".toast
            }
            .addTapActionAppend { _ in
                print("btn2 tap #2 (append)")
                "点击了悬浮按钮：上文下图（tap #2 叠加）".toast
            }
            .byBorderColor(.cyan)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.btn1.snp.bottom).offset(vSpacing)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(itemHeight)
            }
    }()

    private lazy var btn3: JobsButton = {
        JobsButton()
            .byMode(.imageLeftTextRight)
            .byTitleLabel { lab in
                lab.byText("左图右文")
                    .byTextColor(.red)
            }
            .bySubTitleLabel { lab in
                lab.byText("image -> title -> subtitle")
                    .byTextColor(.blue)
            }
            .byForegroundImageView { iv in
                iv.byContentMode(.scaleAspectFill)
                    .byClipsToBounds()
                    .kf_setImage("https://picsum.photos/200?random=333", placeholder: "Ani".img)
            }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds()
            .kf_setImage("https://picsum.photos/600/200?random=33", placeholder: "Ani".img)
            .addLongPressActionAppend { gr in
                guard gr.state == .began else { return }
                print("btn3 longPress #1 began")
                "长按了悬浮按钮：左图右文（longPress #1）".toast
            }
            .addLongPressActionAppend { gr in
                guard gr.state == .began else { return }
                print("btn3 longPress #2 began (append)")
                "长按了悬浮按钮：左图右文（longPress #2 叠加）".toast
            }
            .byBorderColor(.cyan)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.btn2.snp.bottom).offset(vSpacing)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(itemHeight)
            }
    }()

    private lazy var btn4: JobsButton = {
        JobsButton()
            .byMode(.textLeftImageRight)
            .byTitleLabel { lab in
                lab.byText("左文右图")
                    .byTextColor(.red)
            }
            .bySubTitleLabel { lab in
                lab.byText("title -> subtitle -> image")
                    .byTextColor(.blue)
            }
            .byForegroundImageView { iv in
                iv.byContentMode(.scaleAspectFill)
                    .byClipsToBounds()
                    .kf_setImage("https://picsum.photos/200?random=444", placeholder: "Ani".img)
            }
            .byContentMode(.scaleAspectFill)
            .byClipsToBounds()
            .kf_setImage("https://picsum.photos/600/200?random=44", placeholder: "Ani".img)
            .addTapActionAppend { _ in
                print("btn4 tap")
                "点击了悬浮按钮：左文右图".toast
            }
            .addLongPressActionAppend { gr in
                guard gr.state == .began else { return }
                print("btn4 longPress began")
                "长按了悬浮按钮：左文右图".toast
            }
            .byBorderColor(.cyan)
            .byBorderWidth(0.5)
            .byMasksToBounds(YES)
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.btn3.snp.bottom).offset(vSpacing)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(itemHeight)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsButton")
        view.backgroundColor = .systemBackground
        hintLabel.byVisible(YES)
        btn1.byVisible(YES)
        btn2.byVisible(YES)
        btn3.byVisible(YES)
        btn4.byVisible(YES)
    }
}
