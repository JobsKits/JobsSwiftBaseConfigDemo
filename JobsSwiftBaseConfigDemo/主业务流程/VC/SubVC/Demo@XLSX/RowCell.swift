//
//  RowCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/23/25.
//
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import JobsByUIKit
// MARK: - RowCell（SnapKit 布局）
final class RowCell: UITableViewCell {
    // MARK: - UI
    private lazy var indexLabel: UILabel = {
        UILabel()
            .byTextAlignment(.left)
            .byHugging(.required)
            .byCompressionResistance(.required)
            .byFont(.monospacedDigitSystemFont(ofSize: 13, weight: .regular))
            .byTextColor(.secondaryLabel)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(8)
                make.left.equalToSuperview().offset(12)
                make.width.equalTo(44)
            }
    }()

    private lazy var stack: UIStackView = {
        UIStackView()
            .byAxis(.horizontal)
            .byAlignment(.firstBaseline)
            .byDistribution(.fillProportionally)
            .bySpacing(12)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview().offset(8)
                make.left.equalTo(self.indexLabel.snp.right).offset(12)
                make.right.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().inset(8)
            }
    }()
    // MARK: - Life Cycle
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        // ✅ 用 byVisible(YES) 唤起（触发 lazy init + addSubview + 约束）
        indexLabel.byVisible(YES)
        stack.byVisible(YES)
    }
    // MARK: - ViewDataProtocol
    @discardableResult
    func byData(_ items: Any?...) -> Self {
        // 第一个参数：row（期望 [String]）
        let values = items.first as? [String]
        // 第二个参数：rowIndex（期望 Int）
        let rowIndex = (items.count > 1 ? items[1] : nil) as? Int ?? 0
        if let values {
            indexLabel.byText("#\(rowIndex)")
            stack.arrangedSubviews.forEach { v in
                stack.removeArrangedSubview(v)
                v.removeFromSuperview()
            }
            for text in values {
                stack.addArrangedSubview(
                    UILabel()
                        .byNumberOfLines(1)
                        .byFont(.systemFont(ofSize: 15))
                        .byText(text)
                        .byCompressionResistance(.defaultLow)
                )
            }
        };return self
    }
    
    func sendResult(_ any: Any?) {}
    @discardableResult
    func onResult(_ callback: @escaping (Any?) -> Void) -> Self { self }
}
