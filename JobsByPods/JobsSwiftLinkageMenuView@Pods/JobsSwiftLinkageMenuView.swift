//
//  JobsSwiftLinkageMenuView.swift
//  JobsSwiftLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public struct JobsSwiftLinkageMenuItem {
    public var title: String
    public var image: UIImage?
    public var selectedImage: UIImage?

    public init(title: String,
                image: UIImage? = nil,
                selectedImage: UIImage? = nil) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
    }
}

public struct JobsSwiftLinkageMenuPayload {
    public let index: Int
    public let item: JobsSwiftLinkageMenuItem
    public let contentView: UIView?
}

public final class JobsSwiftLinkageMenuViewConfig {
    public var menuWidth: CGFloat = 0
    public var contentWidth: CGFloat = 0
    public var menuRatio: CGFloat = 0
    public var lineWidth: CGFloat = 1
    public var indicatorWidth: CGFloat = 4
    public var indicatorHeight: CGFloat = 42
    public var animationDuration: TimeInterval = 0.22
    public var defaultMenuItemHeight: CGFloat = 72
    public var menuItemHeights: [CGFloat] = []
    public var menuItemHeightMap: [Int: CGFloat] = [:]
    public var clearsContentWhenMissing = true
    public var menuBackgroundColor: UIColor = UIColor(white: 0.96, alpha: 1)
    public var contentBackgroundColor: UIColor = .white
    public var lineColor: UIColor = UIColor(white: 0.86, alpha: 1)
    public var normalTintColor: UIColor = .gray
    public var selectedTintColor: UIColor = UIColor(red: 1.0, green: 0.55, blue: 0.0, alpha: 1)
    public var selectedBackgroundColor: UIColor = UIColor(red: 1.0, green: 0.55, blue: 0.0, alpha: 0.18)
    public var noContentClickBlock: ((JobsSwiftLinkageMenuPayload) -> Void)?
    public var menuClickBlock: ((JobsSwiftLinkageMenuPayload) -> Void)?

    public init() {}

    public func itemHeight(at index: Int) -> CGFloat {
        if let value = menuItemHeightMap[index], value > 0 { return value }
        if menuItemHeights.indices.contains(index), menuItemHeights[index] > 0 { return menuItemHeights[index] }
        return defaultMenuItemHeight > 0 ? defaultMenuItemHeight : 56
    }
}

private final class JobsSwiftLinkageMenuButton: UIControl {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private var item = JobsSwiftLinkageMenuItem(title: "")
    private var normalTintColor: UIColor = .secondaryLabel
    private var selectedTintColor: UIColor = .systemOrange
    private var selectedBackgroundColor: UIColor = .clear

    override var isSelected: Bool {
        didSet { applyState() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.numberOfLines = 2
        addSubview(imageView)
        addSubview(titleLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func render(item: JobsSwiftLinkageMenuItem,
                normalTintColor: UIColor,
                selectedTintColor: UIColor,
                selectedBackgroundColor: UIColor) {
        self.item = item
        self.normalTintColor = normalTintColor
        self.selectedTintColor = selectedTintColor
        self.selectedBackgroundColor = selectedBackgroundColor
        titleLabel.text = item.title
        applyState()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = min(10, bounds.height / 8)
        let imageSide = min(28, max(20, bounds.height * 0.34))
        imageView.frame = CGRect(x: (bounds.width - imageSide) / 2,
                                 y: max(8, bounds.height * 0.18 - imageSide / 2),
                                 width: imageSide,
                                 height: imageSide)
        titleLabel.frame = CGRect(x: 8,
                                  y: imageView.frame.maxY + 5,
                                  width: max(0, bounds.width - 16),
                                  height: max(18, bounds.height - imageView.frame.maxY - 8))
    }

    private func applyState() {
        let tint = isSelected ? selectedTintColor : normalTintColor
        backgroundColor = isSelected ? selectedBackgroundColor : .clear
        titleLabel.textColor = tint
        imageView.tintColor = tint
        let image = isSelected ? (item.selectedImage ?? item.image) : item.image
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
    }
}

public final class JobsSwiftLinkageMenuView: UIView {
    public private(set) var menuItems: [JobsSwiftLinkageMenuItem]
    public private(set) var contentViews: [UIView?]
    public var config: JobsSwiftLinkageMenuViewConfig {
        didSet {
            applyConfig()
            setNeedsLayout()
            selectMenu(at: selectedIndex, animated: false)
        }
    }
    public private(set) var selectedIndex: Int = 0
    public let menuScrollView = UIScrollView()
    public let contentContainerView = UIView()
    private let lineView = UIView()
    private let indicatorView = UIView()
    private var buttons: [JobsSwiftLinkageMenuButton] = []

    public init(menuItems: [JobsSwiftLinkageMenuItem],
                contentViews: [UIView?],
                config: JobsSwiftLinkageMenuViewConfig = JobsSwiftLinkageMenuViewConfig()) {
        self.menuItems = menuItems
        self.contentViews = contentViews
        self.config = config
        super.init(frame: .zero)
        setup()
        reload(menuItems: menuItems, contentViews: contentViews)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let lineWidth = max(0, config.lineWidth)
        let menuWidth = resolvedMenuWidth()
        menuScrollView.frame = CGRect(x: 0, y: 0, width: menuWidth, height: bounds.height)
        lineView.frame = CGRect(x: menuWidth, y: 0, width: lineWidth, height: bounds.height)
        contentContainerView.frame = CGRect(x: menuWidth + lineWidth,
                                            y: 0,
                                            width: max(0, bounds.width - menuWidth - lineWidth),
                                            height: bounds.height)
        layoutButtons(menuWidth: menuWidth)
        contentContainerView.subviews.forEach { $0.frame = contentContainerView.bounds }
    }

    public func reload(menuItems: [JobsSwiftLinkageMenuItem],
                       contentViews: [UIView?]) {
        self.menuItems = menuItems
        self.contentViews = contentViews
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        for (index, item) in menuItems.enumerated() {
            let button = JobsSwiftLinkageMenuButton()
            button.tag = index
            button.render(item: item,
                          normalTintColor: config.normalTintColor,
                          selectedTintColor: config.selectedTintColor,
                          selectedBackgroundColor: config.selectedBackgroundColor)
            button.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            menuScrollView.addSubview(button)
        }
        selectedIndex = min(selectedIndex, max(0, menuItems.count - 1))
        setNeedsLayout()
        layoutIfNeeded()
        selectMenu(at: selectedIndex, animated: false)
    }

    public func selectMenu(at index: Int, animated: Bool) {
        guard menuItems.indices.contains(index) else { return }
        selectedIndex = index
        let contentView = contentViews.indices.contains(index) ? contentViews[index] : nil
        let payload = JobsSwiftLinkageMenuPayload(index: index,
                                                  item: menuItems[index],
                                                  contentView: contentView)
        buttons.enumerated().forEach { offset, button in
            button.isSelected = offset == index
        }
        moveIndicator(to: index, animated: animated)
        if let contentView {
            showContentView(contentView)
        } else {
            if config.clearsContentWhenMissing {
                contentContainerView.subviews.forEach { $0.removeFromSuperview() }
            }
            config.noContentClickBlock?(payload)
        }
        config.menuClickBlock?(payload)
    }

    private func setup() {
        clipsToBounds = true
        menuScrollView.scrollsToTop = false
        menuScrollView.showsVerticalScrollIndicator = false
        addSubview(menuScrollView)
        addSubview(lineView)
        addSubview(contentContainerView)
        menuScrollView.addSubview(indicatorView)
        applyConfig()
    }

    private func applyConfig() {
        menuScrollView.backgroundColor = config.menuBackgroundColor
        contentContainerView.backgroundColor = config.contentBackgroundColor
        lineView.backgroundColor = config.lineColor
        indicatorView.backgroundColor = config.selectedTintColor
        indicatorView.layer.cornerRadius = max(1, config.indicatorWidth / 2)
        for (index, button) in buttons.enumerated() {
            button.render(item: menuItems[index],
                          normalTintColor: config.normalTintColor,
                          selectedTintColor: config.selectedTintColor,
                          selectedBackgroundColor: config.selectedBackgroundColor)
        }
    }

    private func resolvedMenuWidth() -> CGFloat {
        let boundsWidth = bounds.width
        let lineWidth = max(0, config.lineWidth)
        if config.menuWidth > 0 {
            return min(config.menuWidth, max(0, boundsWidth - lineWidth))
        }
        if config.contentWidth > 0, boundsWidth > config.contentWidth + lineWidth {
            return boundsWidth - config.contentWidth - lineWidth
        }
        if config.menuRatio > 0, config.menuRatio < 1 {
            return floor(boundsWidth * config.menuRatio)
        };return 96
    }

    private func layoutButtons(menuWidth: CGFloat) {
        var y: CGFloat = 0
        for (index, button) in buttons.enumerated() {
            let height = config.itemHeight(at: index)
            button.frame = CGRect(x: 0, y: y, width: menuWidth, height: height)
            y += height
        }
        menuScrollView.contentSize = CGSize(width: menuWidth, height: y)
        moveIndicator(to: selectedIndex, animated: false)
    }

    private func moveIndicator(to index: Int, animated: Bool) {
        guard buttons.indices.contains(index) else { return }
        let button = buttons[index]
        let frame = CGRect(x: 0,
                           y: button.frame.midY - config.indicatorHeight / 2,
                           width: config.indicatorWidth,
                           height: min(config.indicatorHeight, button.bounds.height))
        let changes = { self.indicatorView.frame = frame }
        animated ? UIView.animate(withDuration: config.animationDuration, animations: changes) : changes()
        menuScrollView.scrollRectToVisible(button.frame.insetBy(dx: 0, dy: -12), animated: animated)
    }

    private func showContentView(_ contentView: UIView) {
        contentContainerView.subviews.forEach { $0.removeFromSuperview() }
        contentView.frame = contentContainerView.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentContainerView.addSubview(contentView)
    }

    @objc private func menuButtonTapped(_ sender: JobsSwiftLinkageMenuButton) {
        selectMenu(at: sender.tag, animated: true)
    }
}
