//
//  MomentMediaView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/20/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

final class MomentMediaView: UIView {
    struct Metrics {
        var cols: Int
        var rows: Int
        var itemSide: CGFloat
        var totalHeight: CGFloat
    }

    var onTap: jobsByIntBlock?
    var onHeightChanged: (jobsByCGFloatBlock)?

    private var items: [MomentMedia] = []
    private var lastHeight: CGFloat = -1
    private let spacing: CGFloat = 6

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        UICollectionViewFlowLayout()
            .byScrollDirection(.vertical)
            .byMinimumLineSpacing(spacing)
            .byMinimumInteritemSpacing(spacing)
            .bySectionInset(.zero)
            .byEstimatedItemSize(.zero)
    }()

    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            .byDataSource(self)
                .byDelegate(self)
                .registerCell(MomentMediaCell.self)
                .byBackgroundView(nil)
                .byDragInteractionEnabled(false)
                .byScrollEnabled(NO)
                .byAddTo(self) { make in
                    make.edges.equalToSuperview()
                }
    }()
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.byVisible(YES)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateHeightIfNeeded()
    }

    func render(_ list: [MomentMedia]) {
        items = list
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.byReloadData()
        setNeedsLayout()
    }

    func imageView(at index: Int) -> UIImageView? {
        guard let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? MomentMediaCell else {
            return nil
        };return cell.imageViewRef
    }

    private func updateHeightIfNeeded() {
        let w = bounds.width
        guard w > 0 else { return }
        let h = Self.height(for: items, width: w)
        if abs(lastHeight - h) < 0.5 { return }
        lastHeight = h
        onHeightChanged?(h)
    }
    // ✅ 分段公式：1（视频/图）、2、3、4、5-9
    static func height(for items: [MomentMedia], width: CGFloat) -> CGFloat {
        guard width > 0, !items.isEmpty else { return 0 }

        if items.count == 1 {
            let m = items[0]
            if m.isVideo {
                let maxW = min(width, 260)
                return floor(maxW * 9 / 16)
            } else {
                let side = min(width, 200)
                return side
            }
        }

        let met = metrics(for: items.count, width: width, spacing: 6)
        return met.totalHeight
    }

    static func metrics(for count: Int, width: CGFloat, spacing: CGFloat) -> Metrics {
        let cols: Int
        if count == 2 { cols = 2 }
        else if count == 3 { cols = 3 }
        else if count == 4 { cols = 2 }
        else { cols = 3 }

        let rows = Int(ceil(Double(count) / Double(cols)))
        let itemSide = floor((width - CGFloat(cols - 1) * spacing) / CGFloat(cols))
        let totalHeight = CGFloat(rows) * itemSide + CGFloat(rows - 1) * spacing
        return .init(cols: cols, rows: rows, itemSide: itemSide, totalHeight: totalHeight)
    }
}

extension MomentMediaView: UICollectionViewDataSource,
                            UICollectionViewDelegateFlowLayout,
                            UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView
            .dequeueCell(MomentMediaCell.self, for: indexPath)
            .byData(items[indexPath.item])
            .onResult { _ in }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        onTap?(indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.bounds.width
        guard w > 0 else { return .zero }
        if items.count == 1 {
            let m = items[0]
            if m.isVideo {
                let maxW = min(w, 260)
                return CGSize(width: maxW, height: floor(maxW * 9 / 16))
            } else {
                let side = min(w, 200)
                return CGSize(width: side, height: side)
            }
        }
        let met = MomentMediaView.metrics(for: items.count, width: w, spacing: spacing)
        return CGSize(width: met.itemSide, height: met.itemSide)
    }
}
/// DSL
extension MomentMediaView {
    convenience init(_ block: (MomentMediaView) -> Void) {
        self.init(frame: .zero)
        block(self)
    }
    // MARK: - DSL: callbacks
    @discardableResult
    func byOnTap(_ block: jobsByIntBlock?) -> Self {
        self.onTap = block
        return self
    }
    @discardableResult
    func byOnHeightChanged(_ block: jobsByCGFloatBlock?) -> Self {
        self.onHeightChanged = block
        return self
    }
    // MARK: - DSL: render
    @discardableResult
    func byRender(_ list: [MomentMedia]) -> Self {
        self.render(list)
        return self
    }

    // 可选：强制触发布局（比如外部改了宽度后想立刻算高度）
    @discardableResult
    func byNeedLayout() -> Self {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        return self
    }
}
