//
//  Demo@Alamofire.swift
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

import Combine
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsSwiftBaseDefines
import JobsInheritance
import Alamofire
import SnapKit
import GKNavigationBarSwift

final class AFDemoVC: BaseVC {
    // live 或 stubbed；live 演示真实请求
    private lazy var api = AFService(mode: .live) { [weak self] text in
        DispatchQueue.main.async { self?.appendRawLog(text) }
    }

    private var bag = Set<AnyCancellable>()
    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(true)
            .byKeyboardDismissMode(.onDrag)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
                } else {
                    make.edges.equalTo(self.view.safeAreaLayoutGuide)
                }
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(self.scrollView.contentLayoutGuide)
                make.width.equalTo(self.scrollView.frameLayoutGuide)
            }
    }()
    // ================= 回显区 =================
    private lazy var resultView: UITextView = {
        UITextView()
            .byEditable(false)
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(true)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(8)
            .byMasksToBounds(true)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnClear.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(220)
                make.bottom.equalToSuperview().inset(12)
            }
    }()
    // ================= 按钮们（调用写在 onTap 里） =================
    private lazy var btnZen: UIButton = {
        UIButton.sys()
            .byTitle("GET /zen (AF)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "GET /zen → 请求中…".tr)
                api.request(.ghZen) { [weak self] res in
                    guard let self else { return }
                    switch res {
                    case .success(let data):
                        let text = String(data: data, encoding: .utf8) ?? ""
                        show(title: "GET /zen ✅", body: text)
                    case .failure(let e):
                        show(title: "GET /zen ❌", body: "\(e)")
                    }
                }
            }
            .byAddTo(contentView) { make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnUser: UIButton = {
        UIButton.sys()
            .byTitle("GET /users/apple", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemIndigo)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "GET /users/apple → 请求中…".tr)
                api.request(.ghUser(username: "apple")) { [weak self] res in
                    guard let self else { return }
                    switch res {
                    case .success(let data):
                        do {
                            let user = try JSONDecoder().decode(GHUser.self, from: data)
                            show(
                                title: "GET /users/apple ✅",
                                body: "login=\(user.login), id=\(user.id)\navatar=\(user.avatar_url)"
                            )
                        } catch {
                            show(title: "解析失败 ❌".tr, body: "\(error)")
                        }
                    case .failure(let e):
                        show(title: "GET /users/apple ❌", body: "\(e)")
                    }
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnZen.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnLogin: UIButton = {
        UIButton.sys()
            .byTitle("POST /login (ReqRes)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemGreen)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "POST /api/login → 请求中…".tr)
                api.request(.login(email: "eve.holt@reqres.in", password: "cityslicka")) { [weak self] res in
                    guard let self else { return }
                    switch res {
                    case .success(let data):
                        show(title: "POST /login ✅", body: self.prettyJSON(data))
                    case .failure(let e):
                        show(title: "POST /login ❌", body: "\(e)")
                    }
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnUser.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnUpload: UIButton = {
        UIButton.sys()
            .byTitle("UPLOAD /post (httpbin)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemOrange)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "UPLOAD /post → 上传中…（看进度）".tr)
                let fake = Data(repeating: 0xFF, count: 200_000)
                api.uploadAvatar(.uploadAvatar(fake), imageData: fake, progress: { [weak self] p in
                    self?.show(title: "⬆️ 上传进度".tr, body: String(format: "%.1f%%", p * 100))
                }, jobsByVoidBlock: { [weak self] r in
                    guard let self else { return }
                    switch r {
                    case .success(let data):
                        show(title: "UPLOAD ✅", body: self.prettyJSON(data))
                    case .failure(let e):
                        show(title: "UPLOAD ❌", body: "\(e)")
                    }
                })
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnLogin.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnDownloadPNG: UIButton = {
        UIButton.sys()
            .byTitle("DOWNLOAD /image/png", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemPink)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "DOWNLOAD /image/png → 下载中…".tr)
                api.download(.downloadPNG, progress: { [weak self] p in
                    self?.show(title: "⬇️ PNG 进度".tr, body: String(format: "%.1f%%", p * 100))
                }, jobsByVoidBlock: { [weak self] r in
                    guard let self else { return }
                    switch r {
                    case .success(let url):
                        show(title: "DOWNLOAD PNG ✅", body: "保存至：\(url.path)")
                    case .failure(let e):
                        show(title: "DOWNLOAD PNG ❌", body: "\(e)")
                    }
                })
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnUpload.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnDownloadBytes: UIButton = {
        UIButton.sys()
            .byTitle("DOWNLOAD /bytes/524288", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemTeal)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "DOWNLOAD /bytes/524288 → 下载中…".tr)
                api.download(.downloadBytes(size: 524_288), progress: { [weak self] p in
                    self?.show(title: "⬇️ BYTES 进度".tr, body: String(format: "%.1f%%", p * 100))
                }, jobsByVoidBlock: { [weak self] r in
                    guard let self else { return }
                    switch r {
                    case .success(let url):
                        show(title: "DOWNLOAD BYTES ✅", body: "保存至：\(url.path)")
                    case .failure(let e):
                        show(title: "DOWNLOAD BYTES ❌", body: "\(e)")
                    }
                })
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnDownloadPNG.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnCombineZen: UIButton = {
        UIButton.sys()
            .byTitle("Combine GET /zen (AF)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemPurple)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                guard #available(iOS 13.0, *) else {
                    self.show(title: "Combine 未可用".tr, body: "系统版本过低")
                    return
                }
                show(title: "Combine GET /zen → 请求中…".tr)
                api.publisherString(.ghZen)
                    .sink { [weak self] comp in
                        guard let self else { return }
                        if case let .failure(err) = comp {
                            show(title: "Combine /zen ❌", body: "\(err)")
                        }
                    } receiveValue: { [weak self] text in
                        self?.show(title: "Combine /zen ✅", body: text)
                    }
                    .store(in: &self.bag)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnDownloadBytes.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnAsyncSearch: UIButton = {
        UIButton.sys()
            .byTitle("async/await /search/users", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBrown)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                #if compiler(>=5.5) && canImport(_Concurrency)
                if #available(iOS 13.0, *) {
                    show(title: "async /search/users → 请求中…".tr)
                    Task { [weak self] in
                        guard let self else { return }
                        do {
                            let data = try await self.api.session
                                .request(AFRoute.ghSearchUsers(q: "jobs", page: 1))
                                .serializingData().value
                            show(title: "async /search/users ✅", body: self.prettyJSON(data))
                        } catch {
                            show(title: "async /search/users ❌", body: "\(error)")
                        }
                    }
                } else {
                    show(title: "async/await 不可用".tr, body: "iOS < 13")
                }
                #else
                show(title: "当前工具链不支持 async/await".tr, body: "请使用 Swift 5.5+")
                #endif
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnCombineZen.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnStub: UIButton = {
        UIButton.sys()
            .byTitle("Stub: sampleData (AF)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.darkGray)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
                show(title: "Stub 示例（URLProtocol）".tr)
                let stub = AFService(mode: .stubbed) { [weak self] t in self?.appendRawLog(t) }
                stub.request(.ghZen) { [weak self] r in
                    guard let self else { return }
                    switch r {
                    case .success(let data):
                        show(title: "Stub /zen ✅", body: String(data: data, encoding: .utf8))
                    case .failure(let e):
                        show(title: "Stub /zen ❌", body: "\(e)")
                    }
                }
            }
            .byAddTo(contentView) { [unowned self] make in
                // ⚠️ 改为跟在 async/await 按钮后面
                make.top.equalTo(self.btnAsyncSearch.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btnClear: UIButton = {
        UIButton.sys()
            .byTitle("清空输出".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemRed)
            .byContentEdgeInsets(.init(top: 8, left: 12, bottom: 8, right: 12))
            .onTap { [weak self] _ in
                guard let self else { return }
                clear()
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.btnStub.snp.bottom).offset(8)
                make.right.equalToSuperview().inset(24)
                make.height.equalTo(36)
            }
    }()

    private func clear() {
        DispatchQueue.main.async { [weak self] in
            self?.resultView.byText("")
        }
    }

    // ================= 生命周期 =================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "Alamofire 全量用法 Demo".tr)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        btnZen.byVisible(YES)
        btnUser.byVisible(YES)
        btnLogin.byVisible(YES)
        btnUpload.byVisible(YES)
        btnDownloadPNG.byVisible(YES)
        btnDownloadBytes.byVisible(YES)
        btnCombineZen.byVisible(YES)
        btnAsyncSearch.byVisible(YES)   // ← 新增
        btnStub.byVisible(YES)
        btnClear.byVisible(YES)
        resultView.byVisible(YES)
        show(title: "准备就绪 ✅".tr, body: "按钮触发请求；日志与结果会回显在此。")
    }
    // ================= 工具 =================
    private func show(title: String, body: String? = nil) {
        let header = "【\(title)】\n"
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if let b = body, !b.isEmpty {
                self.resultView.byText(header + b + "\n\n" + (self.resultView.text ?? ""))
            } else {
                self.resultView.byText(header + (self.resultView.text ?? ""))
            }
        }
    }

    private func appendRawLog(_ text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.resultView.byText(text + "\n\n" + (self.resultView.text ?? ""))
        }
    }

    private func prettyJSON(_ data: Data) -> String {
        guard
            let obj = try? JSONSerialization.jsonObject(with: data),
            let pretty = try? JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted]),
            let s = String(data: pretty, encoding: .utf8)
        else { return String(data: data, encoding: .utf8) ?? "(\(data.count) bytes)" };return s
    }
}
