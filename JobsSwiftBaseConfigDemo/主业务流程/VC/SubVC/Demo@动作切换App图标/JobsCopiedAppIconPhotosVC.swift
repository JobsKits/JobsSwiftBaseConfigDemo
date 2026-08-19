//
//  JobsCopiedAppIconPhotosVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

final class JobsCopiedAppIconPhotosVC: BaseVC {
    var onSelectionChanged: ((JobsCopiedAppIconPhoto?) -> Void)?

    private let photoStore = JobsCopiedAppIconPhotoStore.shared
    private var photos: [JobsCopiedAppIconPhoto] = []
    private var selectedPhotoIDs: Set<UUID> = []
    private var isEditingPhotos = false {
        didSet { applyEditingState() }
    }

    private lazy var editButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.plain()
                    .byBaseForegroundColor(JobsCor.label)
                    .byContentInsets(.zero)
            )
            .byImage("pencil".sysImg, for: .normal)
            .byImage("checkmark".sysImg, for: .selected)
            .byPreferredSymbolConfiguration(
                UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold),
                forImageIn: .normal
            )
            .byPreferredSymbolConfiguration(
                UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold),
                forImageIn: .selected
            )
            .onTap { [weak self] _ in
                self?.isEditingPhotos.toggle()
            }
            .byAdd { make in
                make.size.equalTo(CGSize(width: 36, height: 44))
            }
    }()

    private lazy var deleteButton: UIButton = {
        UIButton.sys()
            .byTitle("全部删除".tr)
            .byTitleColor(JobsCor.systemRed)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.isEditingPhotos ? self.confirmDeleteSelectedPhotos() : self.confirmDeleteAllPhotos()
            }
            .byAdd { make in
                make.size.equalTo(CGSize(width: 86, height: 44))
            }
    }()

    private lazy var emptyStateLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("还没有照片副本\n请返回上页，从相册选择并复制一张照片。".tr)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(JobsCopiedAppIconPhotoCell.self)
            .byRowHeight(96)
            .byAllowsMultipleSelectionDuringEditing(YES)
            .byNoSectionHeaderTopPadding()
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        configureNavigationBar()
        tableView.byVisible(YES)
        reloadPhotos()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadPhotos()
    }
}

private extension JobsCopiedAppIconPhotosVC {
    func configureNavigationBar() {
        jobsSetupGKNav(title: "已复制的照片".tr, rightButtons: [deleteButton])
        if let backItem = gk_navLeftBarButtonItem {
            gk_navLeftBarButtonItem = nil
            gk_navLeftBarButtonItems = [
                backItem,
                UIBarButtonItem.make(customView: editButton)
            ]
        }
    }

    func reloadPhotos() {
        photos = photoStore.photos
        selectedPhotoIDs = selectedPhotoIDs.intersection(Set(photos.map(\.id)))
        tableView
            .byBackgroundView(photos.isEmpty ? emptyStateLabel : nil)
            .byReloadData()
        updateNavigationButtons()
    }

    func applyEditingState() {
        guard isViewLoaded else { return }
        selectedPhotoIDs.removeAll()
        tableView.byEditing(isEditingPhotos)
        editButton.bySelected(isEditingPhotos)
        updateNavigationButtons()
    }

    func updateNavigationButtons() {
        let title = isEditingPhotos ? "删除（\(selectedPhotoIDs.count)）".tr : "全部删除".tr
        let enabled = isEditingPhotos ? !selectedPhotoIDs.isEmpty : !photos.isEmpty
        editButton
            .byEnabled(!photos.isEmpty || isEditingPhotos)
            .byAlpha((!photos.isEmpty || isEditingPhotos) ? 1 : 0.35)
        deleteButton
            .byTitle(title)
            .byEnabled(enabled)
            .byAlpha(enabled ? 1 : 0.35)
    }

    func confirmDeleteSelectedPhotos() {
        guard !selectedPhotoIDs.isEmpty else { return }
        UIAlertController
            .makeAlert("删除所选照片？".tr, "将从 App 私有目录永久删除 \(selectedPhotoIDs.count) 张照片副本。".tr)
            .byAddCancel()
            .byAddDestructive("删除".tr) { [weak self] _ in
                self?.deleteSelectedPhotos()
            }
            .byPresent(self)
    }

    func confirmDeleteAllPhotos() {
        guard !photos.isEmpty else { return }
        UIAlertController
            .makeAlert("全部删除？".tr, "将从 App 私有目录永久删除全部 \(photos.count) 张照片副本。".tr)
            .byAddCancel()
            .byAddDestructive("全部删除".tr) { [weak self] _ in
                self?.deleteAllPhotos()
            }
            .byPresent(self)
    }

    func deleteSelectedPhotos() {
        do {
            try photoStore.delete(photoIDs: selectedPhotoIDs)
            isEditingPhotos = false
            reloadPhotos()
            onSelectionChanged?(photoStore.selectedPhoto)
        } catch {
            showDeletionError(error)
        }
    }

    func deleteAllPhotos() {
        do {
            try photoStore.deleteAll()
            isEditingPhotos = false
            reloadPhotos()
            onSelectionChanged?(nil)
        } catch {
            showDeletionError(error)
        }
    }

    func showDeletionError(_ error: Error) {
        UIAlertController
            .makeAlert("删除失败".tr, error.localizedDescription)
            .byAddOK()
            .byPresent(self)
    }
}

extension JobsCopiedAppIconPhotosVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = photos[indexPath.row]
        return tableView
            .byDequeueReusableCell(withType: JobsCopiedAppIconPhotoCell.self, for: indexPath)
            .byPhoto(
                photo,
                image: photoStore.image(for: photo),
                isCurrent: photo.id == photoStore.selectedPhotoID
            )
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard photos.indices.contains(indexPath.row) else { return }
        let photo = photos[indexPath.row]
        if isEditingPhotos {
            selectedPhotoIDs.insert(photo.id)
            updateNavigationButtons()
        } else {
            tableView.byDeselectRow(indexPath)
            photoStore.select(photo)
            tableView.byReloadData()
            onSelectionChanged?(photo)
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard isEditingPhotos, photos.indices.contains(indexPath.row) else { return }
        selectedPhotoIDs.remove(photos[indexPath.row].id)
        updateNavigationButtons()
    }

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }

    func tableView(_ tableView: UITableView,
                   shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
}
