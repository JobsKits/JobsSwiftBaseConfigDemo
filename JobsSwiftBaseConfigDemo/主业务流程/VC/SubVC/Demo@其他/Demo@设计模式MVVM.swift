//
//  Demo@设计模式MVVM.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

// MARK: - MVVMDemo.swift

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsInheritance

// ========== Model ==========
struct MVVMUser: Decodable { let id: String; let name: String }

// ========== Repository ==========
protocol MVVMUserRepository { func users() async throws -> [MVVMUser] }

final class MVVMMockUserRepo: MVVMUserRepository {
    func users() async throws -> [MVVMUser] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return [.init(id: "1", name: "Alice"),
                .init(id: "2", name: "Bob"),
                .init(id: "3", name: "Charlie")]
    }
}

// ========== ViewState ==========
enum MVVMUserListState {
    case loading
    case content([MVVMUser])
    case error(String)
}
// ========== Builder ==========
enum MVVMBuilder {
    @MainActor
    static func build() -> UIViewController {
        let vm = MVVMUserListViewModel(repo: MVVMMockUserRepo())
        return MVVMUserListVC(vm: vm)
    }
}
// ========== ViewModel ==========
@MainActor
final class MVVMUserListViewModel {
    private let repo: MVVMUserRepository
    var onStateChange: ((MVVMUserListState) -> Void)?

    init(repo: MVVMUserRepository) { self.repo = repo }

    func load() {
        onStateChange?(.loading)
        Task { [weak self] in
            guard let self else { return }
            do {
                let list = try await repo.users()
                onStateChange?(.content(list))
            } catch {
                onStateChange?(.error(error.localizedDescription))
            }
        }
    }
}
// ========== ViewController ==========
final class MVVMUserListVC: BaseVC, UITableViewDataSource, UITableViewDelegate {
    private let vm: MVVMUserListViewModel
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var data: [MVVMUser] = []
    private lazy var errorAlertController: UIAlertController = {
        let alertController = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        return alertController
    }()

    init(vm: MVVMUserListViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users (MVVM)"
        view.byBackgroundColor(JobsCor.systemBackground)
        tableView
            .byDataSource(self)
            .byDelegate(self)
            .byBackgroundColor(JobsCor.systemBackground)
        tableView.byAddTo(view); tableView.byFrame(view.bounds)
        vm.onStateChange = { [weak self] state in
            guard let self else { return }
            switch state {
            /// 处理 .loading 分支
            case .loading:
                self.navigationItem.prompt = "Loading..."
            /// 处理 .content 分支
            case .content(let list):
                self.navigationItem.prompt = nil
                self.data = list
                self.tableView.reloadData()
            /// 处理 .error 分支
            case .error(let msg):
                self.navigationItem.prompt = nil
                self.errorAlertController.message = msg
                if self.presentedViewController !== self.errorAlertController {
                    self.present(self.errorAlertController, animated: true)
                }
            }
        }
        vm.load()
    }

    // UITableView
    func tableView(_ tv: UITableView, numberOfRowsInSection section: Int) -> Int { data.count }
    func tableView(_ tv: UITableView, cellForRowAt ip: IndexPath) -> UITableViewCell {
        let c = tv.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let u = data[ip.row]
        c.textLabel?.byText(u.name)
        c.detailTextLabel?.byText("ID: \(u.id)")
        return c
            .byTitleCor(JobsCor.label)
            .byDetailTitleCor(JobsCor.secondaryLabel)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
    }
    func tableView(_ tv: UITableView, didSelectRowAt ip: IndexPath) {
        let u = data[ip.row]
        let vc = BaseVC()
        vc.view.byBackgroundColor(JobsCor.systemBackground)
        vc.title = "Detail \(u.name)"
        navigationController?.pushViewController(vc, animated: true)
    }
}
