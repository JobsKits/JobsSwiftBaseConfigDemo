//
//  Demo@设计模式VIPER.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

// MARK: - VIPERDemo.swift

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsInheritance

// ========== Entity ==========
struct VIPERUser: Decodable { let id: String; let name: String }

// ========== Contracts ==========
@MainActor
protocol VIPERUserListView: AnyObject { func render(_ state: VIPERUserListState) }

@MainActor
protocol VIPERUserListPresenting: AnyObject {
    func onViewDidLoad()
    func onSelect(id: String)
}

// 业务用例可不在主线程
protocol VIPERUserListInteracting: AnyObject {
    func fetchUsers() async throws -> [VIPERUser]
}

@MainActor
protocol VIPERUserListRouting: AnyObject {
    func toDetail(userID: String, from: UIViewController)
}

// ========== ViewState ==========
struct VIPERUserListState {
    enum Phase { case loading, content([Row]), error(String) }
    struct Row { let id: String; let title: String; let subtitle: String }
    let phase: Phase
}

// ========== Interactor ==========
protocol VIPERUserRepository { func users() async throws -> [VIPERUser] }

final class VIPERMockRepo: VIPERUserRepository {
    func users() async throws -> [VIPERUser] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return [.init(id: "1", name: "Alice"),
                .init(id: "2", name: "Bob"),
                .init(id: "3", name: "Charlie")]
    }
}

final class VIPERUserListInteractor: VIPERUserListInteracting {
    private let repo: VIPERUserRepository
    init(repo: VIPERUserRepository) { self.repo = repo }
    func fetchUsers() async throws -> [VIPERUser] { try await repo.users() }
}

// ========== Presenter ==========
@MainActor
final class VIPERUserListPresenter: VIPERUserListPresenting {
    private weak var view: VIPERUserListView?
    private let interactor: VIPERUserListInteracting
    private let router: VIPERUserListRouting

    init(view: VIPERUserListView, interactor: VIPERUserListInteracting, router: VIPERUserListRouting) {
        self.view = view; self.interactor = interactor; self.router = router
    }

    func onViewDidLoad() { load() }

    private func load() {
        view?.render(.init(phase: .loading))
        Task { [weak self] in
            guard let self else { return }
            do {
                let users = try await interactor.fetchUsers()
                let rows: [VIPERUserListState.Row] = users.map {
                    VIPERUserListState.Row(id: $0.id, title: $0.name, subtitle: "ID: \($0.id)")
                }
                self.view?.render(.init(phase: .content(rows)))
            } catch {
                self.view?.render(.init(phase: .error(error.localizedDescription)))
            }
        }
    }

    func onSelect(id: String) {
        guard let vc = view as? UIViewController else { return }
        router.toDetail(userID: id, from: vc)
    }
}

// ========== View ==========
final class VIPERUserListVC: BaseVC, VIPERUserListView, UITableViewDataSource, UITableViewDelegate {
    private let presenter: VIPERUserListPresenting
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var rows: [VIPERUserListState.Row] = []
    private lazy var errorAlertController: UIAlertController = {
        let alertController = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        return alertController
    }()

    init(presenter: VIPERUserListPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users (VIPER)"
        view.byBackgroundColor(JobsCor.systemBackground)
        tableView.byDataSource(self).byDelegate(self)
        tableView.byAddTo(view); tableView.byFrame(view.bounds)
        presenter.onViewDidLoad()
    }

    func render(_ state: VIPERUserListState) {
        switch state.phase {
        /// 处理 .loading 分支
        case .loading:
            navigationItem.prompt = "Loading..."
        /// 处理 .content 分支
        case .content(let rows):
            navigationItem.prompt = nil
            self.rows = rows
            tableView.reloadData()
        /// 处理 .error 分支
        case .error(let msg):
            navigationItem.prompt = nil
            errorAlertController.message = msg
            if presentedViewController !== errorAlertController {
                present(errorAlertController, animated: true)
            }
        }
    }

    // UITableView
    func tableView(_ tv: UITableView, numberOfRowsInSection section: Int) -> Int { rows.count }
    func tableView(_ tv: UITableView, cellForRowAt ip: IndexPath) -> UITableViewCell {
        let c = tv.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let r = rows[ip.row]
        c.textLabel?.byText(r.title)
        c.detailTextLabel?.byText(r.subtitle)
        return c
    }
    func tableView(_ tv: UITableView, didSelectRowAt ip: IndexPath) {
        presenter.onSelect(id: rows[ip.row].id)
    }
}

// ========== Router & Builder ==========
@MainActor
final class VIPERUserListRouter: VIPERUserListRouting {
    func toDetail(userID: String, from: UIViewController) {
        let vc = BaseVC()
        vc.view.byBackgroundColor(JobsCor.systemBackground)
        vc.title = "Detail \(userID)"
        from.navigationController?.pushViewController(vc, animated: true)
    }
}

enum VIPERBuilder {
    @MainActor
    static func build() -> UIViewController {
        let repo = VIPERMockRepo()
        let interactor = VIPERUserListInteractor(repo: repo)
        let placeholder = _ViewHolder()
        let router = VIPERUserListRouter()
        let presenter = VIPERUserListPresenter(view: placeholder, interactor: interactor, router: router)
        let vc = VIPERUserListVC(presenter: presenter)
        placeholder.bind(vc)
        return vc
    }

    // Presenter init 时的弱引用占位（需在主线程，因为遵守 @MainActor 的 View 协议）
    @MainActor
    private final class _ViewHolder: VIPERUserListView {
        private weak var real: VIPERUserListView?
        func bind(_ real: VIPERUserListView) { self.real = real }
        func render(_ state: VIPERUserListState) { real?.render(state) }
    }
}
