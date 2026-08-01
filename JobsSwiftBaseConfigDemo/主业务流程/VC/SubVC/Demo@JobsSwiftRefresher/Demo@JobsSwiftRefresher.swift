//
//  Demo@JobsSwiftRefresher.swift
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

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsSwiftBaseDefines
import JobsSwiftRefresher
import JobsFuseAnimation
import SnapKit
import GKNavigationBarSwift
import ImageIO
import UniformTypeIdentifiers
/// 上：横向侧拉（Left/Right）
/// 下：纵向下拉/上拉（Header/Footer）

final class JobsSwiftRefresherDemoVC: BaseVC {
    private let topHeight: CGFloat = 150
    private let animatorTitles = [
        "今日头条",
        "抖音双球",
        "单图",
        "多图定时轮播",
        "GIF",
        "Lottie",
        "系统菊花"
    ]
    private let animatorDetails = [
        "蝴蝶结与尖角轮廓连续形变",
        "红绿双球交叉换位",
        "一张 UIImage 静态展示",
        "多张 UIImage 由 JobsTimer 定时换帧",
        "运行时生成 GIF Data 并循环播放",
        "下拉进度驱动 Lottie，刷新态循环播放",
        "UIActivityIndicatorView 系统动画"
    ]
    private let instructions = [
        "JobsSwiftRefresher 负责 Header、Footer、Left、Right 的刷新状态机；JobsFuseAnimation 只提供可热插拔的表现插件。",
        "点选 Header 动画后会原位替换，并自动模拟一次刷新，无需手动下拉。",
        "页面首次进入也会自动模拟一次 Header 刷新。",
        "上方横向列表演示左/右侧刷新；下方列表演示 Header/Footer。"
    ]
    private var hItems = 18              // 顶部横向卡片数量
    private var rows = 20                // 底部纵向行数
    private var selectedAnimatorIndex = 0
    private var refreshCount = 0
    private var didAutoStart = false
    private lazy var animators = jobs_makeAnimators()

    private lazy var hLayout: UICollectionViewFlowLayout = {
        UICollectionViewFlowLayout()
            .byScrollDirection(.horizontal)
            .byMinimumLineSpacing(12)
            .byMinimumInteritemSpacing(12)
            .bySectionInset(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
            .byItemSize(CGSize(width: 120, height: 156))
    }()

    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: hLayout)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(HCell.self)
            .byBackgroundView(nil)
            .byShowsHorizontalScrollIndicator(false)
            .byAlwaysBounceHorizontal(true)// 即使不满一屏也允许左右拉
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.height.equalTo(topHeight)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
//            .showRefreshHeaderInfo(NO)   // 竖向Header + 横向Left
//            .showRefreshFooterInfo(YES)  // 竖向Footer + 横向Right
            .setLeftLottie(.custom(.init(animationName: "9squares_AlBoardman")))
            .setRightLottie(.inherit)     // 继承全局（没有全局就回退菊花）
            .enableRefreshHaptics(true)
            .setRefreshSound("Sound.wav")
            // 左侧拉：比如“上一页/回退”
            .bySideRefresh(with: JobsDefaultLeftRefresher(),
                           container: self,
                           at: .left,
                           trigger: 70) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 900_000_000)
                    // 模拟“刷新完成”：减少一个 item 并刷新
                    self.hItems = max(8, self.hItems - 1)
                    self.collectionView.byReloadData()
                    self.collectionView.switchSideRefresh(.left, to: .normal)
                }
           }
           // 右侧拉：比如“下一页/加载更多卡片”
           .bySideRefresh(with: JobsDefaultRightRefresher(),
                          container: self,
                          at: .right,
                          trigger: 70) { [weak self] in
               guard let self else { return }
               onMainAsync(self) { vc in
                   try? await Task.sleep(nanoseconds: 900_000_000)
                   self.hItems += 3
                   self.collectionView.byReloadData()
                   self.collectionView.switchSideRefresh(.right, to: .normal)
               }
           }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byRowHeight(68)
            .byEstimatedRowHeight(68)
            .byDataSource(self)
            .byDelegate(self)
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(collectionView.snp.bottom)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(instructionsTextView.snp.top).offset(-10)
            }
            .showRefreshHeaderInfo(YES)   // 竖向Header + 横向Left
            .showRefreshFooterInfo(NO)  // 竖向Footer + 横向Right
            .setHeaderLottie(.custom(.init(animationName: "LottieLogo1")))
            .setFooterLottie(.disabled) // 强制 footer 回退菊花（即使全局配置了）
            .enableRefreshHaptics(true)
            .setRefreshSound("Sound.wav")
            // 下拉刷新 Header
            .byRefreshHeader(animator: animators[0],
                             container: self,
                             height: 72,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    self.rows = 20
                    self.refreshCount += 1
                    self.tableView.byReloadData()
                    self.tableView.switchRefreshHeader(to: .normal)
                    self.tableView.switchRefreshFooter(to: .normal) // 复位“无更多”
                    self.jobs_updateInstructionsText()
                }
            }
            // 上拉加载 Footer
            .byRefreshFooter(component: JobsDefaultFooter(),
                             container: self,
                             trigger: 66) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { vc in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    if self.rows < 60 {
                        self.rows += 20
                        self.tableView.byReloadData()
                        self.tableView.switchRefreshFooter(to: .normal)
                    } else {
                        self.tableView.switchRefreshFooter(to: .noMoreData)
                    }
                }
            }
    }()

    private lazy var instructionsTextView: UITextView = {
        UITextView()
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.label)
            .byEditable(false)
            .bySelectable(false)
            .byScrollEnabled(true)
            .byTextContainerInset(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
            .byLineFragmentPadding(0)
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byCornerRadius(12)
            .byClipsToBounds(true)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
                make.height.equalTo(176)
            }
    }()
}
// MARK: - Life Cycle
extension JobsSwiftRefresherDemoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsSwiftRefresher".tr)
        view.byBackgroundColor(JobsCor.systemBackground)
        collectionView.byVisible(YES)
        instructionsTextView.byVisible(YES)
        tableView.byVisible(YES)
        jobs_updateInstructionsText()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !didAutoStart else { return }
        didAutoStart = true
        tableView.switchRefreshHeader(to: .refreshing)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tableView.switchRefreshHeader(to: .normal)
    }
}
// MARK: - UITableViewDataSource
extension JobsSwiftRefresherDemoVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 2 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? animatorTitles.count : rows
    }

    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Header 动画插件（点选后自动刷新）".tr : "纵向刷新内容".tr
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let reuseIdentifier = "AnimatorCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ??
                UITableViewCell.make(style: .subtitle, reuseIdentifier: reuseIdentifier)
            return cell
                .byText(animatorTitles[indexPath.row].tr)
                .bySecondaryText(animatorDetails[indexPath.row].tr)
                .byTitleCor(JobsCor.label)
                .byDetailTitleCor(JobsCor.secondaryLabel)
                .bySelectionStyle(.default)
                .byAccessoryType(indexPath.row == selectedAnimatorIndex ? .checkmark : .none)
                .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
        }
        let reuseIdentifier = "ContentCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ??
            UITableViewCell.make(style: .default, reuseIdentifier: reuseIdentifier)
        return cell
            .byText("Row \(indexPath.row)")
            .byTitleCor(JobsCor.label)
            .bySelectionStyle(.none)
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
    }
}
// MARK: - UITableViewDelegate
extension JobsSwiftRefresherDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.byDeselectRow(indexPath)
        guard indexPath.section == 0 else { return }
        jobs_selectAnimator(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 68 : 52
    }
}
// MARK: - UICollectionViewDataSource
extension JobsSwiftRefresherDemoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int { hItems }
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView
            .byDequeueCell(HCell.self, for: indexPath)
            .byData(indexPath.item)
            .onResult { _ in
            }
    }
}
// MARK: - UICollectionViewDelegateFlowLayout (可选扩展)
extension JobsSwiftRefresherDemoVC: UICollectionViewDelegateFlowLayout { }

private extension JobsSwiftRefresherDemoVC {
    func jobs_selectAnimator(at index: Int) {
        guard animators.indices.contains(index) else { return }
        selectedAnimatorIndex = index
        tableView
            .byReplaceRefreshAnimator(animators[index], at: .header)
            .byReloadData()
            .switchRefreshHeader(to: .refreshing)
    }

    func jobs_updateInstructionsText() {
        instructionsTextView.byText(
            (["说明｜已完成 \(refreshCount) 次 Header 刷新"] + instructions)
                .joined(separator: "\n\n")
                .tr
        )
    }

    func jobs_makeAnimators() -> [JobsRefreshAnimatorProtocol] {
        let frames = jobs_makeRefreshFrames()
        let firstFrame = frames.first ?? UIImage(named: "菊花加载") ?? UIImage.make()
        return [
            JobsTodayNewsRefreshView(
                config: JobsTodayNewsRefreshConfig(
                    lineWidth: 2,
                    triangleWidth: 18,
                    triangleHeight: 19,
                    centerGap: 1,
                    cycleDuration: 0.65
                )
            ),
            JobsDouyinRefreshView(
                config: JobsDouyinRefreshConfig(
                    dotDiameter: 16,
                    horizontalTravel: 30,
                    jumpHeight: 10,
                    cycleDuration: 0.84
                )
            ),
            JobsImageRefreshView(image: firstFrame),
            JobsImageRefreshView(images: frames, frameInterval: 0.12),
            JobsGIFRefreshView(gifData: jobs_makeGIFData(frames: frames)),
            JobsLottieRefreshView(
                animationNamed: "9squares_AlBoardman",
                indicatorSize: CGSize(width: 34, height: 34)
            ),
            JobsSystemRefreshView()
        ]
    }

    func jobs_makeRefreshFrames() -> [UIImage] {
        let names = [
            "arrow.up",
            "arrow.right",
            "arrow.down",
            "arrow.left"
        ]
        let colors = [
            JobsCor.systemRed,
            JobsCor.systemOrange,
            JobsCor.systemBlue,
            JobsCor.systemGreen
        ]
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 28, weight: .semibold)
        return zip(names, colors).compactMap { name, color in
            UIImage(systemName: name, withConfiguration: symbolConfiguration)?
                .withTintColor(color, renderingMode: .alwaysOriginal)
        }
    }

    func jobs_makeGIFData(frames: [UIImage]) -> Data {
        let data = NSMutableData()
        guard !frames.isEmpty,
              let destination = CGImageDestinationCreateWithData(
                data,
                UTType.gif.identifier as CFString,
                frames.count,
                nil
              ) else { return Data() }
        let gifProperties: [CFString: Any] = [
            kCGImagePropertyGIFLoopCount: 0
        ]
        CGImageDestinationSetProperties(destination, [
            kCGImagePropertyGIFDictionary: gifProperties
        ] as CFDictionary)
        let frameProperties: [CFString: Any] = [
            kCGImagePropertyGIFDelayTime: 0.12
        ]
        frames.forEach { frame in
            guard let cgImage = frame.cgImage else { return }
            CGImageDestinationAddImage(destination, cgImage, [
                kCGImagePropertyGIFDictionary: frameProperties
            ] as CFDictionary)
        }
        guard CGImageDestinationFinalize(destination) else { return Data() };return data as Data
    }
}
