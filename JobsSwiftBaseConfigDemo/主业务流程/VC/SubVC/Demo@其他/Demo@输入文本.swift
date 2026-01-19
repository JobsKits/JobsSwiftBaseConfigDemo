//
//  UITextViewDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 9/29/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import RxSwift
import RxCocoa
import RxRelay
import NSObject_Rx
import Inheritance
import JobsByUIKit
import JobsTextTools
import JobsBy3rdTools
import JobsSwiftBaseTools

final class UITextViewDemoVC: BaseVC, HasDisposeBag {
    // ====== UI 容器 ======
    private let scroll = UIScrollView().byAlwaysBounceVertical(true)
    private let stack  = UIStackView()
        .byAxis(.vertical)
        .byAlignment(.fill)
        .bySpacing(12)
        .byLayoutMargins(UIEdgeInsets(top: 16, left: 16, bottom: 32, right: 16))
        .byLayoutMarginsRelativeArrangement(true)

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(
            title: "UITextView 语法糖 Demo",
        )
        view.backgroundColor = .systemBackground

        setupUI()
        setupAccessoryToolbar()
        demo_ChainedStyling()
        demo_RxTextInput()
        demo_AttrAndLink()
        demo_Find_Border_WritingTools()
        demo_TwoWayBinding()
        demo_DeleteBackward_Observe()
    }
    // MARK: - 布局初始化
    private func setupUI() {
        view.byAddSubviewRetSub(scroll).snp.makeConstraints { $0.edges.equalToSuperview() }
        scroll.byAddSubviewRetSub(stack).snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    // MARK: - 输入栏工具（Done 收起键盘）
    private func setupAccessoryToolbar() {
        let bar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
            .byItems([
                UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                UIBarButtonItem()
                    .byTitle("完成")
                    .byTitleFont(.systemFont(ofSize: 15))
                    .byTitleColor(.systemYellow)
                    .byStyle(.done)
                    .onTap { [weak self] _ in
                        guard let self = self else { return }   // ✅ 确保生命周期安全
                        view.endEditing(true)
                    },
        ])
        .bySizeToFit()

        stack.arrangedSubviews.compactMap { $0 as? UITextView }.forEach {
            $0.byInputAccessoryView(bar)
        }
    }
    // MARK: - 1️⃣ 基础链式样式
    private func demo_ChainedStyling() {
        addSectionTitle("1️⃣ 基础链式样式示例")

        let tv = UITextView()
            .byText("这里展示基础链式调用：字体、颜色、边框、内边距等。")
            .byFont(.systemFont(ofSize: 16))
            .byTextColor(.label)
            .byTextAlignment(.left)
            .byEditable(true)
            .bySelectable(true)
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .onChange { tv, input, old, isDeleting in
                let new = tv.text ?? ""
                print("✏️ input='\(input)' old='\(old)' new='\(new)' deleting=\(isDeleting)")

                // 示例：长度 6~20 视为“有效”，边框变绿，否则红
                let ok = (6...20).contains(new.count)
                tv.layer.borderWidth = 1
                tv.layer.borderColor = (ok ? UIColor.systemGreen : UIColor.systemRed).cgColor
                tv.layer.masksToBounds = true
                if #available(iOS 13.0, *) { tv.layer.cornerCurve = .continuous }
            }
            .onBackspace { tv in
                print("👈 backspace: len=\(tv.text?.count ?? 0)")
            }

        stack.addArrangedSubview(tv)
        tv.snp.makeConstraints { $0.height.equalTo(100) }
    }
    // MARK: - 2️⃣ 金额输入演示
    private func demo_RxTextInput() {
        addSectionTitle("2️⃣ 金额输入（formatter + validator + maxLength）")

        let tvMoney = UITextView()
            .byFont(.monospacedDigitSystemFont(ofSize: 16, weight: .regular))
            .byKeyboardType(.decimalPad)
            .byTextContainerInset(UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byText("123.45")

        stack.addArrangedSubview(tvMoney)
        tvMoney.snp.makeConstraints { $0.height.equalTo(80) }

        tvMoney.textInput(
            maxLength: 12,
            formatter: JobsFormatters.decimal(scale: 2),
            validator: JobsValidators.decimal(min: 0, max: 999_999),
            distinct: true
        )
        .isValid
        .distinctUntilChanged()
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { ok in
            tvMoney.layer.borderColor = (ok ? UIColor.systemGreen : UIColor.systemRed).cgColor
        })
        .disposed(by: rx.disposeBag)
    }
    // MARK: - 3️⃣ 手机号输入演示
    private func demo_PhoneInput() {
        addSectionTitle("3️⃣ 手机号输入（3-4-4 分组 + 11 位校验）")

        let tvPhone = UITextView()
            .byFont(.systemFont(ofSize: 16))
            .byKeyboardType(.numberPad)
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byText("13800138000")

        stack.addArrangedSubview(tvPhone)
        tvPhone.snp.makeConstraints { $0.height.equalTo(80) }

        tvPhone.textInput(
            maxLength: 13,
            formatter: JobsFormatters.phoneCN(),
            validator: JobsValidators.phoneCN(),
            distinct: true
        )
        .isValid
        .distinctUntilChanged()
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { ok in
            tvPhone.layer.borderColor = (ok ? UIColor.systemGreen : UIColor.systemOrange).cgColor
        })
        .disposed(by: rx.disposeBag)
    }
    // MARK: - 4️⃣ 富文本 + 链接样式 + DataDetector（改红色）
    private func demo_AttrAndLink() {
        addSectionTitle("4️⃣ 富文本 + 链接样式 + DataDetector（上：默认蓝｜下：自定义红）")
        let tvBlue = UITextView()
            // ===== ① 默认蓝色（不设置 linkTextAttributes）=====
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
            .byDataDetectorTypes([.link, .phoneNumber])          // 链接/电话自动识别
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
        stack.addArrangedSubview(tvBlue)
        tvBlue.snp.makeConstraints { $0.height.equalTo(110) }

        let tvRed = UITextView()
        // ===== ② 自定义红色（用 linkTextAttributes 统一改红）=====
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
            .byLinkTextAttributes([                               // 这一段统一改红
                .foregroundColor: UIColor.systemRed,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ])
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
        stack.addArrangedSubview(tvRed)
        tvRed.snp.makeConstraints { $0.height.equalTo(110) }
    }
    // MARK: - 5️⃣ 查找 / 边框 / 高亮 / Writing Tools（可见即有效）
    private func demo_Find_Border_WritingTools() {
        addSectionTitle("5️⃣ 查找 / 高亮 / Writing Tools")
        // 文本视图
        let tvFind = UITextView()
            .byText("""
            支持 iOS16+ 的查找（⌘F / 按钮触发），以及 iOS17+ 的系统边框样式。
            iOS18+ 支持 textHighlightAttributes（用于系统查找/写作工具等场景）。
            下面按钮可手动打开查找面板，并演示高亮。
            """)
            .byFont(.systemFont(ofSize: 15))
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
        tvFind.byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
        // iOS16+ 开启系统查找
        if #available(iOS 16.0, *) {
            tvFind.byFindInteractionEnabled(true)
        }
        // iOS18+：配置高亮颜色（在系统“查找结果/写作工具”时由系统使用）
        if #available(iOS 18.0, *) {
            tvFind.byTextHighlightAttributes([
                .backgroundColor: UIColor.systemYellow.withAlphaComponent(0.35)
            ])
        }

        stack.addArrangedSubview(tvFind)
        tvFind.snp.makeConstraints { $0.height.equalTo(160) }
        // ——— 工具按钮区 ———
        stack.addArrangedSubview(UIStackView()
            .byAxis(.horizontal)
            .bySpacing(8)
            .byAlignment(.fill)
            .byDistribution(.fillEqually)
            // 打开系统查找 UI（iOS16+）
            .byAddArrangedSubview(UIButton(type: .system)
                .byTitle("打开查找面板")
                .onTap { sender in
                    if #available(iOS 16.0, *) {
                        tvFind.becomeFirstResponder()
                        tvFind.findInteraction?.presentFindNavigator(showingReplace: false)
                    } else {
                        sender.isEnabled = false
                        sender.setTitle("系统版本需 ≥ iOS16", for: .normal)
                    }
                })
            // 模拟把“iOS”全部高亮（演示效果；与 iOS18 的 textHighlightAttributes 无冲突）
            .byAddArrangedSubview(UIButton(type: .system)
                .byTitle("模拟高亮“iOS”")
                .onTap { sender in
                    let text = tvFind.text as NSString? ?? ""
                    let full = NSRange(location: 0, length: text.length)
                    let regex = try? NSRegularExpression(pattern: "iOS", options: .caseInsensitive)
                    tvFind.textStorage.beginEditing()
                    regex?.enumerateMatches(in: text as String, options: [], range: full) { match, _, _ in
                        if let r = match?.range {
                            tvFind.textStorage.addAttributes(
                                [.backgroundColor: UIColor.systemYellow.withAlphaComponent(0.35)],
                                range: r
                            )
                        }
                    }
                    tvFind.textStorage.endEditing()
            })
            // 清除模拟高亮
            .byAddArrangedSubview(UIButton(type: .system)
                .byTitle("清除高亮”")
                .onTap { sender in
                    let full = NSRange(location: 0, length: (tvFind.text as NSString?)?.length ?? 0)
                    tvFind.textStorage.beginEditing()
                    tvFind.textStorage.removeAttribute(.backgroundColor, range: full)
                    tvFind.textStorage.endEditing()
                }))
    }
    // MARK: - 6️⃣ 双向绑定：A ⇄ B ⇄ Relay
    private func demo_TwoWayBinding() {
        addSectionTitle("6️⃣ 双向绑定示例：A ⇄ B ⇄ Relay")

        let tvA = UITextView()
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byFont(.systemFont(ofSize: 16))
            .byText("输入框 A")

        let tvB = UITextView()
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byFont(.systemFont(ofSize: 16))
            .byText("输入框 B")

        stack.addArrangedSubview(tvA)
        tvA.snp.makeConstraints { $0.height.equalTo(80) }
        stack.addArrangedSubview(tvB)
        tvB.snp.makeConstraints { $0.height.equalTo(80) }

        let label = UILabel()
            .byFont(.systemFont(ofSize: 13))
            .byTextColor(.secondaryLabel)
            .byText("Relay: —")
        stack.addArrangedSubview(label)

        let relay = BehaviorRelay<String>(value: "Hello Relay")

        let d1 = tvA.bindTwoWay(relay, initial: .fromRelay)
        let d2 = tvB.bindTwoWay(relay, initial: .fromRelay)
        let d3 = relay.asDriver().drive(onNext: { v in label.text = "Relay: \(v)" })

        disposeBag.insert(d1, d2, d3)
    }
    // MARK: - 7️⃣ 删除键监听
    private func demo_DeleteBackward_Observe() {
        addSectionTitle("7️⃣ 删除键监听")

        let tv = UITextView()
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byFont(.systemFont(ofSize: 16))
            .byText("删除我试试看 👇")
        stack.addArrangedSubview(tv)
        tv.snp.makeConstraints { $0.height.equalTo(80) }

        let hint = UILabel()
            .byFont(.systemFont(ofSize: 13))
            .byTextColor(.systemPink)
            .byText("⌫ 删除键触发")
        hint.isHidden = true
        stack.addArrangedSubview(hint)

        tv.didPressDelete
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {
                hint.isHidden = false
                hint.byAlpha(1)
                UIView.animate(withDuration: 0.3, delay: 0.8, options: []) {
                    hint.byAlpha(0)
                } completion: { _ in hint.isHidden = true }
            })
            .disposed(by: rx.disposeBag)
    }
    // MARK: - 工具
    private func addSectionTitle(_ text: String) {
        stack.addArrangedSubview(UILabel()
            .byText(text)
            .byFont(.boldSystemFont(ofSize: 15))
            .byTextColor(.secondaryLabel))
    }
}
