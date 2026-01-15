//
//  DemoInnerPresentView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/18/25.
//
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import SnapKit
import JobsByUIKit
// MARK: - UIResponder 内触发 presentVC 示例（保持不变）
final class DemoInnerPresentView: UIView {
    private lazy var label : UILabel = {
        UILabel()
            .byText("👉 点我 (View 内触发 presentSafely)")
            .byTextAlignment(.center)
            .byTextColor(.systemGreen)
            .byFont(.systemFont(ofSize: 15, weight: .medium))
            .byAddTo(self) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.byVisible(YES)

        addGestureRecognizer(
            UITapGestureRecognizer
                .byConfig { gr in
                    print("Tap 触发 on: \(String(describing: gr.view))")
                    // 这里仍然使用项目里的 presentVC() / presentSafely()（定义在 UIResponder 的扩展中）
                    DemoDetailVC()
                        .byData("Jobs")// 字符串
                        .onResult { name in
                            print("回来了 \(String(describing: name))")
                        }
                        .byPresent(self)
                }
        )
    }
}
