//
//  JXSegmentedTitleDataSource.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
#if canImport(JXSegmentedView)
import JXSegmentedView
// MARK: - 动态配置适配器（必须继承 NSObject）
public final class JobsSegmentedTitleClosureConfiguration: NSObject, JXSegmentedTitleDynamicConfiguration {
    public var numberOfLines: ((Int) -> Int)?
    public var normalColor:   ((Int) -> UIColor)?
    public var selectedColor: ((Int) -> UIColor)?
    public var normalFont:    ((Int) -> UIFont)?
    public var selectedFont:  ((Int) -> UIFont?)?

    public func titleNumberOfLines(at index: Int) -> Int {
        numberOfLines?(index) ?? 1
    }
    public func titleNormalColor(at index: Int) -> UIColor {
        normalColor?(index) ?? .black
    }
    public func titleSelectedColor(at index: Int) -> UIColor {
        selectedColor?(index) ?? .red
    }
    public func titleNormalFont(at index: Int) -> UIFont {
        normalFont?(index) ?? .systemFont(ofSize: 15)
    }
    public func titleSelectedFont(at index: Int) -> UIFont? {
        selectedFont?(index)
    }
}
// MARK: - 配置强引用（因为 dataSource.configuration 是 weak）
private var _jobs_cfg_holder_key: UInt8 = 0
private extension JXSegmentedTitleDataSource {
    var jobs_cfg_holder: AnyObject? {
        get { objc_getAssociatedObject(self, &_jobs_cfg_holder_key) as AnyObject? }
        set { objc_setAssociatedObject(self, &_jobs_cfg_holder_key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}
// MARK: - TitleDataSource 链式 DSL
public extension JXSegmentedTitleDataSource {
    // MARK: - Titles
    @discardableResult
    func byTitles(_ value: [String]) -> Self {
        titles = value
        return self
    }
    // MARK: - Lines
    @discardableResult
    func byTitleNumberOfLines(_ lines: Int) -> Self {
        titleNumberOfLines = lines
        return self
    }
    // MARK: - Colors
    @discardableResult
    func byTitleNormalColor(_ color: UIColor) -> Self {
        titleNormalColor = color
        return self
    }

    @discardableResult
    func byTitleSelectedColor(_ color: UIColor) -> Self {
        titleSelectedColor = color
        return self
    }

    @discardableResult
    func byTitleColors(normal: UIColor, selected: UIColor) -> Self {
        titleNormalColor = normal
        titleSelectedColor = selected
        return self
    }
    // MARK: - Fonts
    @discardableResult
    func byTitleNormalFont(_ font: UIFont) -> Self {
        titleNormalFont = font
        return self
    }

    @discardableResult
    func byTitleSelectedFont(_ font: UIFont?) -> Self {
        titleSelectedFont = font
        return self
    }

    @discardableResult
    func byTitleFonts(normal: UIFont, selected: UIFont?) -> Self {
        titleNormalFont = normal
        titleSelectedFont = selected
        return self
    }
    // MARK: - Effects
    @discardableResult
    func byTitleColorGradientEnabled(_ enabled: Bool = true) -> Self {
        isTitleColorGradientEnabled = enabled
        return self
    }
    /// ⚠️ 开启 zoom 时，官方建议 normalFont 与 selectedFont 一致（否则可能视觉不稳）
    @discardableResult
    func byZoomEnabled(
        _ enabled: Bool = true,
        scale: CGFloat? = nil
    ) -> Self {
        isTitleZoomEnabled = enabled
        if let scale {
            titleSelectedZoomScale = scale
        };return self
    }
    /// strokeWidth: 负数越小越粗（例如 -2）
    @discardableResult
    func byStrokeEnabled(
        _ enabled: Bool = true,
        selectedWidth: CGFloat? = nil
    ) -> Self {
        isTitleStrokeWidthEnabled = enabled
        if let selectedWidth {
            titleSelectedStrokeWidth = selectedWidth
        };return self
    }

    @discardableResult
    func byMaskEnabled(_ enabled: Bool = true) -> Self {
        isTitleMaskEnabled = enabled
        return self
    }
    // MARK: - Width Cache
    @discardableResult
    func byWidthForTitle(_ block: @escaping (String) -> CGFloat) -> Self {
        widthForTitleClosure = block
        return self
    }
    /// 动态配置（按 index 定制），自动处理 weak 的强引
    @discardableResult
    func byDynamicConfiguration(_ build: (JobsSegmentedTitleClosureConfiguration) -> Void) -> Self {
        let cfg = JobsSegmentedTitleClosureConfiguration()
        build(cfg)
        configuration = cfg          // weak
        jobs_cfg_holder = cfg        // strong
        return self
    }
    /// 便捷绑定到 segmentedView
    @discardableResult
    func byAttach(to segmentedView: JXSegmentedView,
                  indicators: [JXSegmentedIndicatorProtocol]? = nil) -> Self {
        segmentedView.dataSource = self
        if let ins = indicators { segmentedView.indicators = ins }
        segmentedView.reloadData()
        return self
    }
}

#endif

