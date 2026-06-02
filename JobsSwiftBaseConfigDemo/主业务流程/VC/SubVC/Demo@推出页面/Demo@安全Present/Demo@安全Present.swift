//
//  Demo@安全Present.swift
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
import JobsInheritance
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsScale
// MARK: - Demo@安全Present
final class SafetyPresentDemoVC: BaseVC {
    /// 半屏高度（可按需改）
    private let halfHeight: CGFloat = 320
    private lazy var stack: UIStackView = {
        UIStackView()
            .byAxis(.vertical)
            .bySpacing(20)
            .byAlignment(.center)
            .byAddArrangedSubviews(
                [
                    UIButton(type: .system)
                        .byTitle("系统 present (连点不会重复)".tr)
                        .onTap { [weak self] sender in
                            guard let self else { return }
                            // present(DemoDetailVC(), animated: true, byCompletion: nil)
                            DemoDetailVC()
                                .byData(3.14)// 基本数据类型
                                .onResult { name in
                                    print("回来了 \(String(describing: name))")
                                }
                                .byPresent(self)
                                .byCompletion{
                                    print("结束")
                                }
                        },
                    UILabel()
                        .byText("👆 点击绿色区域也会触发 presentSafely".tr)
                        .byTextAlignment(.center)
                        .byTextColor(.secondaryLabel)
                        .byFont(.systemFont(ofSize: 14)),
                    UIButton(type: .system)
                        .byTitle("自定义高度 present (320)")
                        .onTap { _ in
                            /// 自定义高度 present：.custom + UIPresentationController
                            /// .custom 之后，系统不会给装手势 → 需要自己加 pan + 交互式转场（上面已给补丁）。
                            /// 想省事且 iOS 15+ → 用 .pageSheet + detents，系统自带手势。
                            HalfSheetDemoVC()
                                .byModalPresentationStyle(.custom)
                                .byTransitioningDelegate(self)
                                .byData(["大树".tr,"小草".tr,"太阳".tr])
                                .onResult { id in
                                    print("回来了 \(String(describing: id))")
                                }
                                .byPresent(self)           // 自带防重入，连点不重复
                                .byCompletion{
                                    print("结束")
                                }
                        }
                ]
            )
            .byAddTo(view) { [unowned self] make in
                make.center.equalToSuperview()
            }
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "🧱 Safety Present Demo"
        )
        stack.byVisible(YES)
        // 2️⃣ 从 UIView 内触发 presentSafely
        DemoInnerPresentView()
            .byBackgroundColor(.systemGreen.withAlphaComponent(0.2))
            .byCornerRadius(8)
            .byAddTo(stack) { make in
                make.width.equalTo(260.w)
                make.height.equalTo(60.h)
            }
    }
}
// MARK: - UIViewControllerTransitioningDelegate
extension SafetyPresentDemoVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return HalfSheetPresentationController(
            presentedViewController: presented,
            presenting: presenting,
            height: halfHeight
        )
    }
}
