//
//  JobsEmptyView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/10.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit

class JobsEmptyView: UIView {
    var onTapRetry: jobsByVoidBlock?
    private lazy var tapGR: UITapGestureRecognizer = {
        UITapGestureRecognizer
            .byConfig { [weak self] _ in
                self?.onTapRetry?()
            }
            .byTaps(1)
            .byTouches(1)
            .byCancelsTouchesInView(true)
            .byEnabled(true)
            .byName("EmptyView.TapRetry")
    }()

    private lazy var label: UILabel = {
        UILabel()
            .byText("暂无数据，点击重试".tr)
            .byTextColor(.lightGray)
            .byTextAlignment(.center)
            .byFont(.systemFont(ofSize: 16))
            .byAddTo(self) { [unowned self] make in
                make.center.equalToSuperview()
            }
    }()
    required init?(coder: NSCoder) { fatalError() }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        label.byVisible(YES)
        jobs_addGesture(tapGR)
    }
}
/// DSL
extension JobsEmptyView{
    // ✅ DSL：外部只写 Void，内部自动 return self（满足 () -> EmptyView）
    @discardableResult
    func byOnTapRetry(_ block: @escaping jobsByVoidBlock) -> Self {
        onTapRetry = { [weak self] in
            guard self != nil else { return }
            block()
        };return self
    }
}
