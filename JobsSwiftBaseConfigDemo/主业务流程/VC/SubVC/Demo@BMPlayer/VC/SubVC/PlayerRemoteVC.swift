//
//  PlayerRemoteVC.swift
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

import AVFoundation
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsTextTools
import JobsBy3rdTools
import JobsSwiftBaseTools
import JobsSwiftAppTools
import SnapKit
import GKNavigationBarSwift

#if canImport(BMPlayer)
import BMPlayer
final class PlayerRemoteVC: BaseVC {
    private struct SignalSource {
        let name: String
        let detail: String
        let url: URL

        var buttonTitle: String { "\(name)\n\(detail)" }
    }

    /// 2026-07-17：直播源来自 iptv-org 公开 China / Pakistan 播放列表，已验证 manifest 和媒体分片。
    /// 中国频道优先展示；Apple / Mux 项是直播上游波动时的 HLS 测试兜底。
    private let signalSources: [SignalSource] = [
        SignalSource(
            name: "CCTV-4 中文国际",
            detail: "🇨🇳 美洲线路 · 中文综合",
            url: "https://global.cgtn.cicc.media.caton.cloud/master/cgtn-america.m3u8".url!
        ),
        SignalSource(
            name: "CCTV-4 中文国际",
            detail: "🇨🇳 欧洲线路 · 中文综合",
            url: "https://dash2.antik.sk/live/test_cctv_tizen/playlist.m3u8".url!
        ),
        SignalSource(
            name: "CCTV+ 1",
            detail: "🇨🇳 央视新闻素材直播",
            url: "https://cd-live-stream.news.cctvplus.com/live/smil:CHANNEL1.smil/playlist.m3u8".url!
        ),
        SignalSource(
            name: "广州综合",
            detail: "🇨🇳 广州广播电视台",
            url: "https://tencentplaybusiness.gztv.com/live/zonghes.m3u8".url!
        ),
        SignalSource(
            name: "河北卫视",
            detail: "🇨🇳 综合直播",
            url: "https://event.pull.hebtv.com/live/live101.m3u8".url!
        ),
        SignalSource(
            name: "吉林都市",
            detail: "🇨🇳 都市生活直播",
            url: "https://lsfb.avap.jilintv.cn/zqvk7vpj/channel/7e8474e6daea44ccaa5aa2300191439e/index.m3u8".url!
        ),
        SignalSource(
            name: "浙江国际",
            detail: "🇨🇳 中文国际直播",
            url: "https://ali-m-l.cztv.com/channels/lantian/channel10/1080p.m3u8".url!
        ),
        SignalSource(
            name: "CGTN",
            detail: "🇨🇳 中国国际电视台 · 英语",
            url: "https://amg00405-rakutentv-cgtn-rakuten-i9tar.amagi.tv/master.m3u8".url!
        ),
        SignalSource(
            name: "Dunya News",
            detail: "🇵🇰 新闻直播",
            url: "https://imob.dunyanews.tv/livehd/ngrp:dunyalivehd_2_all/playlist.m3u8".url!
        ),
        SignalSource(
            name: "Lahore News",
            detail: "🇵🇰 新闻直播",
            url: "https://vcdn.dunyanews.tv/lahorelive/ngrp:lnews_1_all/playlist.m3u8".url!
        ),
        SignalSource(
            name: "News One",
            detail: "🇵🇰 新闻直播",
            url: "https://vodzong.mjunoon.tv:8087/streamtest/NEWS1-128/playlist.m3u8".url!
        ),
        SignalSource(
            name: "ABN Urdu",
            detail: "🇵🇰 乌尔都语直播",
            url: "https://mediaserver.abnvideos.com/streams/abnurdu.m3u8".url!
        ),
        SignalSource(
            name: "Zindagi TV",
            detail: "🇵🇰 综合直播",
            url: "https://5ad386ff92705.streamlock.net/live_transcoder/ngrp:zindagitv.stream_all/chunklist.m3u8".url!
        ),
        SignalSource(
            name: "PK Sports HD",
            detail: "🇵🇰 体育直播",
            url: "https://lbgo.bozztv.com/ssh101/ssh101/pksportshd/playlist.m3u8".url!
        ),
        SignalSource(
            name: "Sky News Urdu",
            detail: "🇵🇰 乌尔都语新闻直播",
            url: "https://lbgo.bozztv.com/ssh101/ssh101/skynews/playlist.m3u8".url!
        ),
        SignalSource(
            name: "Apple Bip Bop",
            detail: "Apple 官方 HLS 测试流",
            url: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8".url!
        ),
        SignalSource(
            name: "Mux Big Buck Bunny",
            detail: "Mux HLS 测试流",
            url: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8".url!
        ),
        SignalSource(
            name: "Mux Test 001",
            detail: "Mux HLS 测试流",
            url: "https://test-streams.mux.dev/test_001/stream.m3u8".url!
        )
    ]
    private var selectedSourceIndex = 0
    private var sourceButtons: [UIButton] = []

    deinit {
        JobsNetworkTrafficMonitorStop()  /// 停止网络实时监听
        JobsCancelWaitNetworkDataReady() /// 停止网络数据源监听
    }

    /// 播放器
    private lazy var player: BMPlayer = { [unowned self] in
        BMPlayer()
            .byResource(makeResource(for: signalSources[selectedSourceIndex]), definitionIndex: 0, autoPlay: true)
            .byVideoGravity(.resizeAspect)      // 需要铺满可改 .resizeAspectFill
            .byPanGestureEnabled(true)
            .onPlayStateChanged { [weak self] state in
                self?.updatePlaybackStatus(state)
            }
            .byBack { [weak self] isFull in
                guard let self else { return }
                if !isFull { goBack(nil) }
            }
            .byAddTo(view) { [unowned self] make in
                if self.view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
                }
                make.left.right.equalToSuperview()
                make.height.equalTo(self.view.snp.width).multipliedBy(9.0 / 16.0)
            }
    }()
    private lazy var statusLabel: UILabel = { [unowned self] in
        UILabel.jobsMake { _ in }
            .byText(statusText("正在准备播放"))
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byNumberOfLines(0)
            .byAddTo(view) { make in
                make.top.equalTo(self.player.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
            }
    }()
    private lazy var sourceScrollView: UIScrollView = { [unowned self] in
        UIScrollView.jobsMake { _ in }
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(true)
            .byContentInsetAdjustmentBehavior(.never)
            .byAddTo(view) { make in
                make.top.equalTo(self.statusLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
    }()
    private lazy var sourceStack: UIStackView = { [unowned self] in
        UIStackView.jobsMake { _ in }
            .byAxis(.vertical)
            .byAlignment(.fill)
            .bySpacing(10)
            .byDistribution(.fill)
            .byAddTo(sourceScrollView) { make in
                make.top.equalTo(self.sourceScrollView.contentLayoutGuide.snp.top).offset(4)
                make.left.equalTo(self.sourceScrollView.contentLayoutGuide.snp.left).offset(16)
                make.right.equalTo(self.sourceScrollView.contentLayoutGuide.snp.right).inset(16)
                make.bottom.equalTo(self.sourceScrollView.contentLayoutGuide.snp.bottom).inset(16)
                make.width.equalTo(self.sourceScrollView.frameLayoutGuide.snp.width).offset(-32)
            }
    }()

    override func loadView() {
        super.loadView()
        jobsWaitNetworkDataReady(
            onWiFiReady: {
                print("✅ Wi-Fi 已有真实流量")
            },
            onCellularReady: {
                print("✅ 蜂窝已实际可用，可以走后续逻辑")
                // 比如这里再去重试接口、发起播放等
            }
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        networkRichListenerBy(view)
        jobsSetupGKNav(title: "网络多信号源".tr)
        player.byVisible(YES)
        statusLabel.byVisible(YES)
        sourceScrollView.byVisible(YES)
        sourceStack.byVisible(YES)
        buildSourceButtons()
        updateSourceButtons()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            player.byPause()          // 阻断后续 autoPlay
        }
    }
}

extension PlayerRemoteVC {
    private func makeResource(for source: SignalSource) -> BMPlayerResource {
        BMPlayerResource(
            name: source.name,
            definitions: [
                BMPlayerResourceDefinition(
                    url: source.url,
                    definition: "默认"
                )
            ],
            cover: nil,
            subtitles: nil
        )
    }

    private func buildSourceButtons() {
        sourceButtons = signalSources.enumerated().map { index, source in
            UIButton.sys()
                .byTitle(source.buttonTitle, for: .normal)
                .byTitle("✓ \(source.buttonTitle)", for: .selected)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byTitleColor(JobsCor.label, for: .normal)
                .byTitleColor(JobsCor.white, for: .selected)
                .byBackgroundColor(JobsCor.secondarySystemBackground, for: .normal)
                .byBackgroundColor(JobsCor.systemBlue, for: .selected)
                .byContentHorizontalAlignment(.leading)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14))
                .byNumberOfLines(2)
                .byCornerRadius(10)
                .onTap { [weak self] _ in
                    self?.switchSource(to: index)
                }
        }
        sourceStack.byAddArrangedSubviews(sourceButtons)
    }

    private func switchSource(to index: Int) {
        guard signalSources.indices.contains(index) else { return }
        selectedSourceIndex = index
        updateSourceButtons()
        statusLabel.byText(statusText("正在切换，请稍候"))
        player.byResource(makeResource(for: signalSources[index]), definitionIndex: 0, autoPlay: true)
    }

    private func updateSourceButtons() {
        for (index, button) in sourceButtons.enumerated() {
            button.bySelected(index == selectedSourceIndex)
        }
    }

    private func updatePlaybackStatus(_ state: BMPlayerState) {
        let message: String
        switch state {
        /// 处理 .notSetURL 分支
        case .notSetURL: message = "正在准备播放"
        /// 处理 .readyToPlay 分支
        case .readyToPlay: message = "已就绪"
        /// 处理 .buffering 分支
        case .buffering: message = "缓冲中"
        /// 处理 .bufferFinished 分支
        case .bufferFinished: message = "正在播放"
        /// 处理 .playedToTheEnd 分支
        case .playedToTheEnd: message = "播放完成，可重新点击该信号源"
        /// 处理 .error 分支
        case .error: message = "播放失败，请切换其他信号源或重新点击当前源"
        }
        statusLabel.byText(statusText(message))
    }

    private func statusText(_ message: String) -> String {
        let source = signalSources[selectedSourceIndex]
        return "当前信号：\(source.name) · \(message)\n直播源可能因地区或上游调整失效，点击下方按钮可切换，重复点击可重试。"
    }
}
#endif
