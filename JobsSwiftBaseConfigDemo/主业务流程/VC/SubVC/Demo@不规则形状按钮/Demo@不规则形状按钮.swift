//
//  Demo@不规则形状按钮.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/17/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import SnapKit
import JobsByUIKit
import Inheritance
/// UI控件始终还是矩形，但是不规则区域以外是无法响应点击事件的
final class IrregularButtonDemoVC: BaseVC {
    private enum Layout {
        static let row1Top: CGFloat = 10      // 第一排（3个小按钮）
        static let row2Top: CGFloat = 80      // 第二排（两个 150x150）
        static let row3Top: CGFloat = 260     // 第三排（箭头）
    }
    private lazy var btn1: IrregularButton = {
        // 右斜边梯形：0,0 -> 120,0 -> 90,50 -> 0,120
        return IrregularButton(type: .custom)
            .byBackgroundColor(.orange, for: .normal)
            .byTitle("按钮", for: .normal)
            .byPoints([
                .init(x: 0, y: 0),
                .init(x: 120, y: 0),
                .init(x: 120 * 3/4, y: 50),
                .init(x: 0, y: 120)
            ], designSize: CGSize(width: 120, height: 120))
            .byStroke(.clear, 0)
            .onTap { [weak self] sender in
                sender.byBackgroundColor(.randomColor, for: .normal)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(20)
                make.size.equalTo(CGSize(width: 120, height: 50))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(Layout.row1Top)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Layout.row1Top)
                }
            }
    }()

    private lazy var btn2: IrregularButton = {
        // 平行四边形：0,50 -> 30,0 -> 120,0 -> 90,50
        return IrregularButton(type: .custom)
            .byBackgroundColor(.green, for: .normal)
            .byTitle("按钮", for: .normal)
            .byPoints([
                .init(x: 0, y: 50),
                .init(x: 120/4, y: 0),
                .init(x: 120, y: 0),
                .init(x: 120*3/4, y: 50)
            ], designSize: CGSize(width: 120, height: 50))
            .onTap { [weak self] sender in
                sender.byBackgroundColor(.randomColor, for: .normal)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(120)
                make.size.equalTo(CGSize(width: 120, height: 50))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(Layout.row1Top)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Layout.row1Top)
                }
            }
    }()

    private lazy var btn3: IrregularButton = {
        // 左斜边梯形：30,50 -> 120,0 -> 120,50 -> 0,50
        return IrregularButton(type: .custom)
            .byBackgroundColor(.cyan, for: .normal)
            .byTitle("按钮", for: .normal)
            .byPoints([
                .init(x: 120/4, y: 50),
                .init(x: 120, y: 0),
                .init(x: 120, y: 50),
                .init(x: 0, y: 50)
            ], designSize: CGSize(width: 120, height: 50))
            .onTap { [weak self] sender in
                sender.byBackgroundColor(.randomColor, for: .normal)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(220)
                make.size.equalTo(CGSize(width: 120, height: 50))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(Layout.row1Top)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Layout.row1Top)
                }
            }
    }()

    private lazy var btn4: IrregularButton = {
        // 六角形（基于 150x150 的设计尺寸）
        let w: CGFloat = 150
        let a = sin(.pi / 180 * 60) * (w/2)  // 0.866 * 75
        return IrregularButton(type: .custom)
            .byBackgroundColor(.purple, for: .normal)
            .byTitle("按钮", for: .normal)
            .byPoints([
                .init(x: a, y: w/4),
                .init(x: w/2, y: 0),
                .init(x: w - a, y: w/4),
                .init(x: w - a, y: w*3/4),
                .init(x: w/2, y: w),
                .init(x: a, y: w*3/4)
            ], designSize: CGSize(width: 150, height: 150))
            .onTap { [weak self] sender in
                sender.byBackgroundColor(.randomColor, for: .normal)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(20)
                make.size.equalTo(CGSize(width: 150, height: 150))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(Layout.row2Top)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Layout.row2Top)
                }
            }
    }()

    private lazy var btn5: IrregularButton = {
        // 对折形状：0,0 -> 150,0 -> 0,150 -> 150,150（实际上就是“X 折角”的轮廓）
        return IrregularButton(type: .custom)
            .byBackgroundColor(.brown, for: .normal)
            .byTitle("按钮", for: .normal)
            .byPoints([
                .init(x: 0, y: 0),
                .init(x: 150, y: 0),
                .init(x: 0, y: 150),
                .init(x: 150, y: 150)
            ], designSize: CGSize(width: 150, height: 150))
            .onTap { [weak self] sender in
                sender.byBackgroundColor(.randomColor, for: .normal)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(200)
                make.size.equalTo(CGSize(width: 150, height: 150))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(Layout.row2Top)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Layout.row2Top)
                }
            }
    }()

    private lazy var btn6: IrregularButton = {
        // 箭头：基于 330x150
        return IrregularButton(type: .custom)
            .byBackgroundColor(.magenta, for: .normal)
            .byTitle("按钮", for: .normal)
            .byPoints([
                .init(x: 0, y: 150),
                .init(x: 330 * 2/3, y: 150/3),
                .init(x: 330 * 2/3, y: 0),
                .init(x: 330, y: 150/2),
                .init(x: 330 * 2/3, y: 150),
                .init(x: 330 * 2/3, y: 150 * 2/3),
                .init(x: 0, y: 150 * 2/3)
            ], designSize: CGSize(width: 330, height: 150))
            .onTap { [weak self] sender in
                sender.byBackgroundColor(.randomColor, for: .normal)
            }
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(20)
                make.size.equalTo(CGSize(width: 330, height: 150))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(Layout.row3Top)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Layout.row3Top)
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        jobsSetupGKNav(title: "不规则形状按钮")
        btn1.byVisible(true)
        btn2.byVisible(true)
        btn3.byVisible(true)
        btn4.byVisible(true)
        btn5.byVisible(true)
        btn6.byVisible(true)
    }
}
