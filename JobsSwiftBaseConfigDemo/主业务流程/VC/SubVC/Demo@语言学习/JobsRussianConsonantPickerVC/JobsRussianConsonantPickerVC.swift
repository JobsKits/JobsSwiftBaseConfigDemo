//
//  JobsRussianConsonantPickerVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//

import UIKit
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class JobsRussianConsonantPickerVC: BaseVC {
    var selected = "б"
    var onSelect: ((String) -> Void)?
    private lazy var titleLabel = UILabel.jobsMake {
        JobsLanguageLearningStyle.bindText($0, key: .textPrimary)
    }.byText("选择辅音")
        .byFont(JobsFont.systemFont(ofSize: 22, weight: .semibold))
        
    private lazy var closeButton = JobsLanguageLearningStyle.button("关闭").onTap { [weak self] _ in self?.dismiss(animated: true) }
    private lazy var scroll = UIScrollView.jobsMake { _ in }
    private lazy var content = UIView.jobsMake { _ in }
    private lazy var buttons = JobsRussianLesson.consonants.map { letter in
        JobsLanguageLearningStyle.button(letter.uppercased() + " " + letter, size: 22)
            .onTap { [weak self] _ in
                self?.onSelect?(letter)
                self?.dismiss(animated: true)
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: "选择辅音")
        titleLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(gk_navigationBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        closeButton.byAddTo(view) { [unowned self] make in
            make.centerY.equalTo(titleLabel)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        scroll.byAddTo(view) { [unowned self] make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        content.byAddTo(scroll) { [unowned self] make in
            make.edges.equalTo(scroll.contentLayoutGuide)
            make.width.equalTo(scroll.frameLayoutGuide)
            make.height.equalTo(6 * 64)
        }
        for (index, button) in buttons.enumerated() {
            JobsLanguageLearningStyle.paint(button, selected: JobsRussianLesson.consonants[index] == selected)
            button.byAddTo(content) { [unowned self] make in
                make.width.equalTo(content).multipliedBy(0.25).offset(-6)
                make.height.equalTo(56)
                make.top.equalToSuperview().offset(index / 4 * 64)
                if index % 4 == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(buttons[index - 1].snp.right).offset(8)
                }
            }
        }
    }
}
