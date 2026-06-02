//
//  Demo@输入文本.swift
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
import GKNavigationBarSwift
import JobsSwiftDSL

import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsBy3rdTools
import JobsSwiftTools
import JobsInheritance
import JobsSwiftBaseTools
import JobsSwiftFoundation
import JobsSwiftBaseDefines

final class UITextViewDemoVC: BaseVC {
    // MARK: 双向绑定（无 Rx）
    var relayValue = "Hello Value"
    var isSyncing = false
    // MARK: - Scroll
    private lazy var scrollerView: UIScrollView = {
        UIScrollView()
            .byShowsVerticalScrollIndicator(true)
            .byShowsHorizontalScrollIndicator(false)
            .byAlwaysBounceVertical(true)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    /// 不是“必须”加 contentView，但在 iOS 里“直接往 UIScrollView 上加子视图”是一个容易埋雷的做法。
    /// contentView 不是“多余”，它是 为了让 Auto Layout 能 100% 正确推导 contentSize。
    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollerView) { [unowned self] make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
            }
    }()

    private lazy var title1: UILabel = {
        UILabel()
            .byText("1️⃣ 输入监听（byOnInput）".tr)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.top.equalToSuperview().offset(10)
            }
    }()

    private lazy var tv1: UITextView = {
        UITextView()
            .byFont(.systemFont(ofSize: 16))
            .byKeyboardType(.default)
            .byEditable(true)
            .bySelectable(true)
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byPlaceHolder("哈哈哈哈".tr)
            .byPlaceHolderCor(.blue)
            .byPlaceHolderFont(.boldSystemFont(ofSize: 15))
            .byHintLimit(12) { lb in
                lb.byFont(.monospacedDigitSystemFont(ofSize: 11, weight: .semibold))
                    .byTextColor(.red)
            }
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: nil) { [weak self] char, value, mode, isLimited ,text ,tv in
                guard let self else { return }
                // text 就是当前 UITextView.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                print("✏️ char='\(char)' value='\(value)' mode=\(mode) limited=\(isLimited) text='\(text)'")
            }
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(title1.snp.bottom).offset(8)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(100)
            }
    }()

    private lazy var title2: UILabel = {
        UILabel()
            .byText("2️⃣ 金额输入（formatter + validator + maxLength）".tr)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tv1.snp.bottom).offset(16)
                make.left.right.equalTo(tv1)
            }
    }()

    private lazy var tvMoney: UITextView = {
        UITextView()
            .byFont(.monospacedDigitSystemFont(ofSize: 16, weight: .regular))
            .byKeyboardType(.decimalPad)
            .byTextContainerInset(UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byText("123.45")
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: nil) { [weak self] char, value, mode, isLimited ,text ,tv in
                guard let self else { return }
                // text 就是当前 UITextView.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                let formatted = JobsFormatters.decimal(scale: 2)(value)
                if text != formatted { tv.text = formatted }
                let ok = JobsValidators.decimal(min: 0, max: 999_999)(formatted)
                tv.byBorderColor(ok ? UIColor.systemGreen : UIColor.systemRed)
                print("✏️ char='\(char)' value='\(value)' mode=\(mode) limited=\(isLimited) text='\(text)'")
            }
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(title2.snp.bottom).offset(8)
                make.left.right.equalTo(tv1)
                make.height.equalTo(80)
            }
    }()

    private lazy var title3: UILabel = {
        UILabel()
            .byText("3️⃣ 手机号输入（3-4-4 分组 + 11 位校验）".tr)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tvMoney.snp.bottom).offset(16)
                make.left.right.equalTo(tv1)
            }
    }()

    private lazy var tvPhone: UITextView = {
        UITextView()
            .byFont(.systemFont(ofSize: 16))
            .byKeyboardType(.numberPad)
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byText("13800138000")
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: 13) { [weak self] char, value, mode, isLimited ,text ,tv in
                guard let self else { return }
                // text 就是当前 UITextView.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                let formatted = JobsFormatters.phoneCN()(value)
                if tv.text != formatted { tv.text = formatted }
                let ok = JobsValidators.phoneCN()(formatted)
                tv.layer.borderColor = (ok ? UIColor.systemGreen : UIColor.systemOrange).cgColor
                print("📱 char='\(char)' value='\(formatted)' mode=\(mode) limited=\(isLimited) ok=\(ok)")
            }
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(title3.snp.bottom).offset(8)
                make.left.right.equalTo(tv1)
                make.height.equalTo(80)
            }
    }()

    private lazy var title4: UILabel = {
        UILabel()
            .byText("4️⃣ 富文本 + 链接样式 + DataDetector".tr)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tvPhone.snp.bottom).offset(16)
                make.left.right.equalTo(tv1)
            }
    }()

    private lazy var tvBlue: UITextView = {
        UITextView()
            .byAttributedText(NSMutableAttributedString(
                string: "🔗 默认蓝色链接（系统样式）：",
                attributes: [.font: UIFont.systemFont(ofSize: 15),
                             .foregroundColor: UIColor.secondaryLabel]
            ).byAdd(NSAttributedString(
                string: " Apple 官网",
                attributes: [.link: URL(string: "https://www.apple.com")!,
                             .font: UIFont.boldSystemFont(ofSize: 16)]
            )).byAdd(NSAttributedString(
                string: "\n客服电话：400-123-4567",
                attributes: [.font: UIFont.systemFont(ofSize: 15)]
            )))
            .byEditable(false)
            .bySelectable(true)
            .byDataDetectorTypes([.link, .phoneNumber])
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(title4.snp.bottom).offset(8)
                make.left.right.equalTo(tv1)
                make.height.equalTo(110)
            }
    }()

    private lazy var tvRed: UITextView = {
        UITextView()
            .byAttributedText(NSMutableAttributedString(
                string: "🔴 自定义红色链接：",
                attributes: [.font: UIFont.systemFont(ofSize: 15),
                             .foregroundColor: UIColor.secondaryLabel]
            ).byAdd(NSAttributedString(
                string: " Jobs 官网",
                attributes: [.link: URL(string: "https://www.google.com")!,
                             .font: UIFont.boldSystemFont(ofSize: 16)]
            )).byAdd(NSAttributedString(
                string: "\n客服电话：400-123-4567",
                attributes: [.font: UIFont.systemFont(ofSize: 15)]
            )))
            .byEditable(false)
            .bySelectable(true)
            .byDataDetectorTypes([.link, .phoneNumber])
            .byLinkTextAttributes([
                .foregroundColor: UIColor.systemRed,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ])
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tvBlue.snp.bottom).offset(12)
                make.left.right.equalTo(tv1)
                make.height.equalTo(110)
            }
    }()

    private lazy var title6: UILabel = {
        UILabel()
            .byText("6️⃣ 双向绑定示例：A ⇄ B ⇄ Value".tr)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tvRed.snp.bottom).offset(16)
                make.left.right.equalTo(tv1)
            }
    }()

    private lazy var tvA: UITextView = {
        UITextView()
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byFont(.systemFont(ofSize: 16))
            .byText(relayValue)
            // A -> B
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: nil) { [weak self] char, value, mode, isLimited ,text ,tv in
                guard let self else { return }
                // text 就是当前 UITextView.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                sync(from: self.tvA, to: self.tvB, value: value)
            }
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(title6.snp.bottom).offset(8)
                make.left.right.equalTo(tv1)
                make.height.equalTo(80)
            }
    }()

    private lazy var tvB: UITextView = {
        UITextView()
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byFont(.systemFont(ofSize: 16))
            .byText(relayValue)
            // B -> A
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: nil) { [weak self] char, value, mode, isLimited ,text ,tv in
                guard let self else { return }
                // text 就是当前 UITextView.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                sync(from: tvB, to: tvA, value: value)
            }
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tvA.snp.bottom).offset(12)
                make.left.right.equalTo(tv1)
                make.height.equalTo(80)
            }
    }()

    private lazy var valueLab: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 13))
            .byTextColor(.secondaryLabel)
            .byText("Value: \(relayValue)")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tvB.snp.bottom).offset(8)
                make.left.right.equalTo(tv1)
            }
    }()

    private lazy var title7: UILabel = {
        UILabel()
            .byText("7️⃣ 删除键监听".tr)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(valueLab.snp.bottom).offset(16)
                make.left.right.equalTo(tv1)
            }
    }()

    private lazy var tvDelete: UITextView = {
        UITextView()
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byFont(.systemFont(ofSize: 16))
            .byText("删除我试试看 👇")
            /// 效果@等于父系方法UIControl.byAddAction.editingChanged，只不过比父系方法先调用
            .byOnInput(limit: nil) { [weak self] char, value, mode, isLimited ,text ,tv in
                guard let self else { return }
                // text 就是当前 UITextView.text（保证不是 nil，空就是 ""）
                // value 仍然是“本次变更后的值”（由监听器计算出来的 new）
                // char：删除/回车时为 ""
                // mode：space/delete/return/normal
                // isLimited：是否设置了限制（limit != nil）
                guard mode == .delete else { return }
                "点击了删除键".tr.toast
            }
            .byBeginEditing { value in
                print("✍️ begin:", value)
            }
            .byEndEditing { value in
                print("✅ end:", value)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(title7.snp.bottom).offset(8)
                make.left.right.equalTo(tv1)
                make.height.equalTo(80)
                make.bottom.equalToSuperview().offset(-20) // scroll 内容高度收口
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "UITextView 全量演示".tr)

        title1.byVisible(YES)
        tv1.byVisible(YES)
        title2.byVisible(YES)
        tvMoney.byVisible(YES)
        title3.byVisible(YES)
        tvPhone.byVisible(YES)
        title4.byVisible(YES)
        tvBlue.byVisible(YES)
        tvRed.byVisible(YES)
        title6.byVisible(YES)
        tvA.byVisible(YES)
        tvB.byVisible(YES)
        valueLab.byVisible(YES)
        title7.byVisible(YES)
        tvDelete.byVisible(YES)
    }
}

extension UITextViewDemoVC {
    
    func sync(from source: UITextView, to target: UITextView, value: String) {
        guard !isSyncing else { return }
        isSyncing = true
        relayValue = value
        valueLab.byText("Value: \(relayValue)")
        if target.text != value { target.text = value }
        isSyncing = false
    }
}
