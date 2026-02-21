//
//  AnimatedButtonNumberDemoVC.swift
//  JobsByUIKitDemo
//
//  Created by Jobs on 21/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines

final class AnimatedButtonNumberDemoVC: BaseVC {

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
            }
    }()

    private lazy var titleLab1: UILabel = {
        UILabel()
            .byText("① 无图：主标题（普通字符串）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf1Start: UITextField = {
        _makeTF(ph: "默认：99")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab1.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf1End: UITextField = {
        _makeTF(ph: "默认：199")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf1Start)
                make.left.equalTo(tf1Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var btn1: UIButton = {
        UIButton.sys()
            .byTitle("¥99", for: .normal)
            .byTitle("¥99", for: .selected)
            .byTitle("¥99", for: .disabled)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 18, weight: .semibold))
            .byBackgroundColor(.systemBlue)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self._runBtn1()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf1Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(52)
            }
    }()

    private lazy var titleLab2: UILabel = {
        UILabel()
            .byText("② 无图：副标题（富文本，只动数字）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(btn1.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf2Start: UITextField = {
        _makeTF(ph: "默认：199")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab2.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf2End: UITextField = {
        _makeTF(ph: "默认：99")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf2Start)
                make.left.equalTo(tf2Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var btn2: UIButton = {
        UIButton.sys()
            .byTitle("会员价格", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("原价 ¥199 /月", for: .normal)
            .bySubTitleColor(.white.withAlphaComponent(0.85), for: .normal)
            .bySubTitleFont(.systemFont(ofSize: 13))
            .byBackgroundColor("#2F2F2F".cor)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self._runBtn2()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf2Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(64)
            }
    }()

    private lazy var titleLab3: UILabel = {
        UILabel()
            .byText("③ 有图：主标题（富文本，只动数字，图文关系不变）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(btn2.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf3Start: UITextField = {
        _makeTF(ph: "默认：99")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab3.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf3End: UITextField = {
        _makeTF(ph: "默认：299")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf3Start)
                make.left.equalTo(tf3Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var btn3: UIButton = {
        UIButton.sys()
            .byRichTitle(JobsRichText.make([
                JobsRichRun(.text("¥99")).font(.systemFont(ofSize: 18, weight: .semibold)).color(.systemRed),
                JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 16)).color(.white)
            ]))
            .byTitleColor(.white, for: .normal)
            .byImage("star.fill".sysImg, for: .normal)
            .byImagePlacement(.leading, padding: 8)
            .byBackgroundColor(.systemGreen)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self._runBtn3()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf3Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(56)
            }
    }()

    private lazy var titleLab4: UILabel = {
        UILabel()
            .byText("④ 有图：副标题（普通字符串，只动数字）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(btn3.snp.bottom).offset(18)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var tf4Start: UITextField = {
        _makeTF(ph: "默认：199")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(titleLab4.snp.bottom).offset(10)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var tf4End: UITextField = {
        _makeTF(ph: "默认：9")
            .byAddTo(contentView) { [unowned self] make in
                make.centerY.equalTo(tf4Start)
                make.left.equalTo(tf4Start.snp.right).offset(10)
                make.height.equalTo(36)
                make.width.equalTo(120)
            }
    }()

    private lazy var btn4: UIButton = {
        UIButton.sys()
            .byTitle("限时折扣", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("倒计时 199 秒", for: .normal)
            .bySubTitleColor(.white.withAlphaComponent(0.85), for: .normal)
            .bySubTitleFont(.systemFont(ofSize: 13))
            .byImage("clock".sysImg, for: .normal)
            .byImagePlacement(.leading, padding: 8)
            .byBackgroundColor(.systemPurple)
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self._runBtn4()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tf4Start.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(64)
                make.bottom.equalToSuperview().offset(-24)
            }
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        jobsSetupGKNav(title: "UIButton 数字动效 Demo".tr)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        titleLab1.byVisible(YES)
        tf1Start.byVisible(YES)
        tf1End.byVisible(YES)
        btn1.byVisible(YES)
        titleLab2.byVisible(YES)
        tf2Start.byVisible(YES)
        tf2End.byVisible(YES)
        btn2.byVisible(YES)
        titleLab3.byVisible(YES)
        tf3Start.byVisible(YES)
        tf3End.byVisible(YES)
        btn3.byVisible(YES)
        titleLab4.byVisible(YES)
        tf4Start.byVisible(YES)
        tf4End.byVisible(YES)
        btn4.byVisible(YES)

    }
}

extension AnimatedButtonNumberDemoVC {
    
    private func _runBtn1() {
        let start = Double(tf1Start.text ?? "") ?? 99
        let end   = Double(tf1End.text ?? "") ?? 199
        
        if #available(iOS 15.0, *) {
            // iOS15+：先让按钮明确进入 configuration 渲染链路（避免 legacy/handler 干扰）
            var cfg = btn1.configuration ?? UIButton.Configuration.plain()
            cfg.title = "¥\(Int(start))"
            btn1.configuration = cfg
            
            btn1.byAnimatedMainTitleNumber_iOS15ConfigOnly(start: start,
                                                           duration: 0.9,
                                                           minimumInterval: 1.0 / 60.0) {
                "动画结束".toast
            }
                                                           .byStartAnimatedMainTitleNumber("¥\(Int(end))")
        }
    }
        
    private func _runBtn2() {
        let start = Double(tf2Start.text ?? "") ?? 199
        let end   = Double(tf2End.text ?? "") ?? 99
        // subtitle 富文本：只动数字，其他不动
        let startAttr = JobsRichText.make([
            JobsRichRun(.text("原价 ")).font(.systemFont(ofSize: 12)).color(.white.withAlphaComponent(0.8)),
            JobsRichRun(.text("¥\(Int(start))")).font(.systemFont(ofSize: 12, weight: .medium)).color(.systemYellow),
            JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 12)).color(.white.withAlphaComponent(0.8))
        ])
        let endAttr = JobsRichText.make([
            JobsRichRun(.text("原价 ")).font(.systemFont(ofSize: 12)).color(.white.withAlphaComponent(0.8)),
            JobsRichRun(.text("¥\(Int(end))")).font(.systemFont(ofSize: 12, weight: .medium)).color(.systemYellow),
            JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 12)).color(.white.withAlphaComponent(0.8))
        ])
        
        btn2.byRichSubTitle(startAttr)
        
            .byAnimatedSubTitleNumber(start: start,
                                      duration: 1.0,
                                      minimumInterval: 1.0/60.0) {
                "动画结束".toast
            }
                                      .byStartAnimatedSubTitleNumber(endAttr)
    }
        
    private func _runBtn3() {
        let start = Double(tf3Start.text ?? "") ?? 99
        let end   = Double(tf3End.text ?? "") ?? 299
        
        let startRich = JobsRichText.make([
            JobsRichRun(.text("¥\(Int(start))")).font(.systemFont(ofSize: 18, weight: .semibold)).color(.systemRed),
            JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 16)).color(.white)
        ])
        let endRich = JobsRichText.make([
            JobsRichRun(.text("¥\(Int(end))")).font(.systemFont(ofSize: 18, weight: .semibold)).color(.systemRed),
            JobsRichRun(.text(" /月")).font(.systemFont(ofSize: 16)).color(.white)
        ])
        
        btn3.byRichTitle(startRich)
            .byAnimatedMainTitleNumber(start: start,
                                       duration: 0.9,
                                       minimumInterval: 1.0/60.0) {
                "动画结束".toast
            }
                                       .byStartAnimatedMainTitleNumber(endRich)
    }
        
    private func _runBtn4() {
        let start = Double(tf4Start.text ?? "") ?? 199
        let end   = Double(tf4End.text ?? "") ?? 9
        
        btn4.bySubTitle("倒计时 \(Int(start)) 秒", for: .normal)
            .bySubTitle("倒计时 \(Int(start)) 秒", for: .selected)
            .bySubTitle("倒计时 \(Int(start)) 秒", for: .disabled)
            .byAnimatedSubTitleNumber(start: start, duration: 1.1, minimumInterval: 1.0/60.0) {
                "动画结束".toast
            }
            .byStartAnimatedSubTitleNumber("倒计时 \(Int(end)) 秒")
    }
    
    private func _makeTF(ph: String) -> UITextField {
        UITextField()
            .byPlaceholder(ph)
            .byKeyboardType(.decimalPad)
            .byBorderStyle(.roundedRect)
            .byFont(.systemFont(ofSize: 14))
    }
}
