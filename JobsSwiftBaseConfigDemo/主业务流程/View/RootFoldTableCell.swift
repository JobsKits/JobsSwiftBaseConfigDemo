//
//  RootFoldTableCell.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsByUIKit
import JobsSwiftAppTools
import JobsSwiftBaseDefines
// ================================== RootFoldTableCell（折叠 + 内嵌Table） ==================================
final class RootFoldTableCell: UITableViewCell,
                               UITableViewCellInsetProtocol,
                               UITableViewCellRoundable {
    typealias DemoItem = (title: String, vcType: UIViewController.Type)
    let horizontalInset: CGFloat = 10
    let cornerRadius: CGFloat = 20
    // MARK: - Layout
    private static let vInset: CGFloat = 8
    private static let headerH: CGFloat = 56
    private static let innerRowH: CGFloat = 50
    private static let innerTop: CGFloat = 10
    private static let innerBottom: CGFloat = 10
    // MARK: - Data
    private var items: [DemoItem] = []
    private var onSelectItem: ((Int) -> Void)?
    private var isExpanded: Bool = false
    private var innerTableHeight: Constraint?
    // MARK: - Lazy UI
    private lazy var card: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
//            .byCornerRadius(14)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(Self.vInset)
                make.bottom.equalToSuperview().inset(Self.vInset)
                make.left.equalToSuperview().offset(0)
                make.right.equalToSuperview().inset(0)
            }
    }()

    private lazy var header: UIView = {
        UIView().byAddTo(card) { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(Self.headerH)
        }
    }()

    private lazy var titleLab: UILabel = {
        UILabel()
            .byFont(.boldSystemFont(ofSize: 16))
            .byTextColor(.label)
            .byAddTo(header) { [unowned self] make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(14)
                make.right.lessThanOrEqualTo(self.chevron.snp.left).offset(-10)
            }
    }()

    private lazy var chevron: UIImageView = {
        UIImageView(image: "chevron.down".sysImg)
            .byTintColor(.secondaryLabel)
            .byContentMode(.scaleAspectFit)
            .byAddTo(header) { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().inset(14)
                make.size.equalTo(CGSize(width: 16, height: 16))
        }
    }()

    private lazy var detailClip: UIView = {
        UIView()
            .byClipsToBounds(YES)
            .byVisible(NO)
            .byAddTo(card) { [unowned self] make in
                make.top.equalTo(self.header.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var detailContent: UIView = {
        UIView()
            .byVisible(NO) // 默认折叠
            .byAddTo(detailClip) { make in
                make.edges.equalToSuperview()
            }
    }()

    private lazy var innerTableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byBackgroundColor(.clear)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(Self.innerRowH)
            .byScrollEnabled(NO)
            .byBounces(NO)
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .byContentInsetAdjustmentBehavior(.never)
            .byContentInset(.zero)
            .byScrollIndicatorInsets(.zero)
            .bySectionHeaderTopPadding(0)
            .byDataSource(self)
            .byDelegate(self)
            .byAddTo(detailContent) { [unowned self] make in
                make.top.equalToSuperview().offset(Self.innerTop)
                make.left.right.equalToSuperview()
                self.innerTableHeight = make.height.equalTo(0).constraint
                make.bottom.lessThanOrEqualToSuperview().inset(Self.innerBottom)
            }
    }()

    private lazy var shadow: UIView = {
        UIView()
            .byBackgroundColor(.black)
            .byVisible(NO)
            .byAddTo(detailClip) { make in
                make.edges.equalToSuperview()
            }
    }()
    // MARK: - Init
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        card.byVisible(YES)
        header.byVisible(YES)
        titleLab.byVisible(YES)
        chevron.byVisible(YES)
        detailClip.byVisible(YES)
        detailContent.byVisible(YES)
        innerTableView.byVisible(YES)
        shadow.byVisible(YES)

        setExpanded(false, animated: false)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        items = []
        onSelectItem = nil
        setExpanded(false, animated: false)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyInsets()      // 水平边距@距离TableView
        applyCornerStyle() // 圆角
    }
}

extension RootFoldTableCell{
    
    static func collapsedHeight() -> CGFloat {
        headerH + vInset * 2
    }

    static func expandedHeight(itemCount: Int) -> CGFloat {
        collapsedHeight()
        + innerTop
        + CGFloat(itemCount) * innerRowH
        + innerBottom
    }
    
    func configure(groupTitle: String,
                   items: [DemoItem],
                   expanded: Bool,
                   onSelectItem: @escaping (Int) -> Void) {
        self.items = items
        self.onSelectItem = onSelectItem
        titleLab.byText("\(groupTitle)  (\(items.count))")
        innerTableView.reloadData()
        setExpanded(expanded, animated: false)
    }
    /// 展开/收起的核心方法
    func setExpanded(_ expanded: Bool, animated: Bool) {
        isExpanded = expanded
        let targetH: CGFloat = expanded ? CGFloat(items.count) * Self.innerRowH : 0
        innerTableHeight?.update(offset: targetH)
        // ✅ 展开前先把容器露出来（折叠完成后会隐藏回去）
        if expanded || animated {
            detailClip.byVisible(YES)
        }
        if expanded {
            detailContent.byVisible(YES)
        } else if animated {
            // ✅ 如果是“从展开 -> 折叠”的动画，内容此时本来就是可见的；这里兜底保证可见以便折页动画能演
            detailContent.byVisible(YES)
        }

        detailContent.layoutIfNeeded()

        let targetTransform = expanded ? CATransform3DIdentity : foldedTransform()
        let targetAlpha: CGFloat = expanded ? 1.0 : 0.0
        let targetChevron = expanded ? CGAffineTransform(rotationAngle: .pi) : .identity

        let apply = { [self] in
            detailContent.layer.transform = targetTransform
            detailContent.alpha = targetAlpha
            chevron.transform = targetChevron
            // ✅ shadow 永远不参与显示（彻底消灭“灰条”）
            shadow.byVisible(NO)
        }

        if animated {
            UIView.animate(withDuration: 0.35,
                           delay: 0,
                           usingSpringWithDamping: 0.92,
                           initialSpringVelocity: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.detailContent.layoutIfNeeded()
                apply()
            } completion: { [weak self] _ in
                guard let self else { return }
                if !expanded {
                    self.detailContent.byVisible(NO)
                    self.detailClip.byVisible(NO) // ✅ 折叠完成：连容器一起藏掉，彻底无残影
                }
            }
        } else {
            UIView.performWithoutAnimation { apply() }
            if !expanded {
                detailContent.byVisible(NO)
                detailClip.byVisible(NO) // ✅ 非动画折叠：直接隐藏
            }
        }
    }
    // MARK: - Fold
    private func foldedTransform() -> CATransform3D {
        let h = max(detailContent.bounds.height, 1)

        var t = CATransform3DIdentity
        t.m34 = -1.0 / 520.0
        t = CATransform3DTranslate(t, 0, -h / 2.0, 0)
        t = CATransform3DRotate(t, -CGFloat.pi / 2.0, 1, 0, 0)
        t = CATransform3DTranslate(t, 0,  h / 2.0, 0)

        return t
    }
}
// MARK: - Inner Table（二级目录）
extension RootFoldTableCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byText(items[indexPath.row].title)
            .byAccessoryType(.disclosureIndicator)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onSelectItem?(indexPath.row)
    }
}
