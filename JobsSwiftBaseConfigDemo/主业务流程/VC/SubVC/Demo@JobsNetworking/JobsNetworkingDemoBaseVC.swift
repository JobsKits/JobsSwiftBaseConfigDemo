//
//  JobsNetworkingDemoBaseVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 31/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsByUIKit
import JobsBy3rdTools
import JobsNetworking
import JobsInheritance
import JobsSwiftBaseDefines
// MARK: - 统一的 UI 骨架：TextView + Button（SnapKit）
class JobsNetworkingDemoBaseVC: BaseVC {
    
    lazy var runButton: UIButton = {
        UIButton.sys()
            /// 背景色
            .byBackgroundColor(.systemGreen, for: .normal)
            /// 普通字符串@设置主标题
            .byTitle("点我运行".tr)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byAddTo(view) { [unowned self] make in
                make.centerX.equalTo(view)
                make.size.mas_equalTo(CGSizeMake(200.w, 44.h))
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    
    lazy var textView: UITextView = {
        UITextView()
            .byFont(.systemFont(ofSize: 16))
            .byKeyboardType(.default)
            .byEditable(NO)
            .bySelectable(true)
            .byBackgroundColor(.secondarySystemBackground)
            .byTextContainerInset(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
            .byRoundedBorder(color: .systemGray4, width: 1, radius: 8)
            .byPlaceHolder("这里显示请求结果".tr)
            .byPlaceHolderCor(.blue)
            .byPlaceHolderFont(.boldSystemFont(ofSize: 15))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(runButton.mas_bottom).offset(12)
                make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
                make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
                make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            }
            .byClipsToBounds(YES)
            .byCornerRadius(8.h)
        }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    func append(_ s: String) {
        jobsRunOnMain {
            self.textView.byText((self.textView.text ?? "") + s)
            self.textView.scrollRangeToVisible(NSRange(location: max(0, self.textView.text.count - 1), length: 1))
        }
    }
}

struct DemoAuthHook: JobsHeaderHook {
    func headers(for request: JobsRequest) -> [String : String] {
        [
            "Authorization": "Bearer xxx"
        ]
    }
}
