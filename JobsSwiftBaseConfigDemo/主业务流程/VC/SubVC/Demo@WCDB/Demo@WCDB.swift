//
//  Demo@WCDB.swift
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
import JobsInheritance
import GKNavigationBarSwift
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsTextTools
#if !canImport(FMDB) && canImport(WCDB)
final class WCDBDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 16
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byFont(.systemFont(ofSize: 14))
            .byBgCor(.systemCyan)
            .byText("WCDB Demo\nDB: \(DemoDB.shared.dbPath)")
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()
    private lazy var insertBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("Insert One Row")
            .onTap { [weak self] sender in
                guard let self else { return }
                do {
                    let short = String(UUID().uuidString.prefix(8))
                    let rowID = try DemoDB.shared.insert("hello-\(short)")

                    hintLabel.byText("WCDB Demo\nDB: \(DemoDB.shared.dbPath)\n✅ inserted rowID=\(rowID)")
                } catch {
                    hintLabel.byText("❌ insert error: \(error)")
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.hintLabel.snp.bottom).offset(20)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(50)
            }
    }()

    private lazy var queryBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("Query Latest 20")
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.isSelected.toggle()
                do {
                    let list = try DemoDB.shared.fetchLatest(limit: 20)
                    // 5) 用的时候，用 .byVisible(YES) 来唤起
                    player.byVisible(YES)
                    // 逆序显示成“从旧到新”
                    let lines = list.reversed().map { m -> String in
                        let id = m.identifier ?? -1
                        let text = m.content ?? ""
                        let t = m.createdAt?.description ?? "-"
                        return "\(id) | \(t) | \(text)"
                    }
                    resultTextView.text = lines.joined(separator: "\n")
                } catch {
                    player.byVisible(YES)
                    resultTextView.text = "❌ query error: \(error)"
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.insertBtn.snp.bottom).offset(12)
                make.left.right.height.equalTo(self.insertBtn)
            }
    }()

    private lazy var clearBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("Clear Table")
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.isSelected.toggle()
                do {
                    try DemoDB.shared.clear()
                    player.byVisible(YES)
                    resultTextView.text = "✅ cleared"
                } catch {
                    player.byVisible(YES)
                    resultTextView.text = "❌ clear error: \(error)"
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.queryBtn.snp.bottom).offset(12)
                make.left.right.height.equalTo(self.insertBtn)
            }
    }()
    // 5) 用 .byVisible(YES) 唤起
    private lazy var player: UIView = {
        UIView()
            .byBackgroundColor(UIColor(white: 0.96, alpha: 1))
            .byCornerRadius(12)
            .byVisible(NO)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.clearBtn.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(16)
            }
    }()

    private lazy var resultTextView: UITextView = {
        UITextView()
            .byEditable(NO)
            .byFont(.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byAddTo(player) { make in
                make.edges.equalToSuperview().inset(12)
            }
    }()

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "腾讯数据库WCDB@演示DEMO"
        )
        hintLabel.byVisible(YES)
        insertBtn.byVisible(YES)
        queryBtn.byVisible(YES)
        clearBtn.byVisible(YES)
        player.byVisible(YES)
        resultTextView.byVisible(YES)
    }
}
#endif
