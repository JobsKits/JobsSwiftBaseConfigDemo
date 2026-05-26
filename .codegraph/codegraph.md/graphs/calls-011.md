# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T1["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S1 -->|calls| T1
  S2["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T2["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S2 -->|calls| T2
  S3["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T3["method:CALayer::byHidden<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:65"]
  S3 -->|calls| T3
  S4["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T4["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S4 -->|calls| T4
  S5["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T5["method:FTDashboardView::makeTicksPath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:212"]
  S5 -->|calls| T5
  S6["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T6["method:FTDashboardView::makeNeedleBasePath<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:237"]
  S6 -->|calls| T6
  S7["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  T7["method:FTDashboardView::needleAngle<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:251"]
  S7 -->|calls| T7
  S8["method:FTDashboardView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:256"]
  T8["method:FTDashboardView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:256"]
  S8 -->|calls| T8
  S9["method:FTDashboardView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:256"]
  T9["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:145"]
  S9 -->|calls| T9
  S10["method:FTDashboardView::byProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:266"]
  T10["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:105"]
  S10 -->|calls| T10
  S11["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T11["import:BMPlayer<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:17"]
  S11 -->|calls| T11
  S12["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T12["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S12 -->|calls| T12
  S13["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T13["method:UIView::bySuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:267"]
  S13 -->|calls| T13
  S14["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T14["method:BMPlayer::byBack<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:31"]
  S14 -->|calls| T14
  S15["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T15["method:BMPlayer::byVideoGravity<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:37"]
  S15 -->|calls| T15
  S16["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T16["method:BMPlayer::byResource<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:67"]
  S16 -->|calls| T16
  S17["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T17["method:JobsLiveFloatPlayer::hide<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:72"]
  S17 -->|calls| T17
  S18["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T18["method:UIView.SuspendConfig::byContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:71"]
  S18 -->|calls| T18
  S19["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:26"]
  T19["method:NSObject::keepScreenOn<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+屏幕常亮.swift:22"]
  S19 -->|calls| T19
  S20["method:JobsLiveFloatPlayer::hide<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:72"]
  T20["method:UIView::unsuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:132"]
  S20 -->|calls| T20
  S21["method:JobsLiveFloatPlayer::pause<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:77"]
  T21["method:BMPlayer::byPause<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:100"]
  S21 -->|calls| T21
  S22["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:18"]
  T22["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S22 -->|calls| T22
  S23["class:MetalRenderer<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:21"]
  T23["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  S23 -->|calls| T23
  S24["class:MetalRenderer<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:21"]
  T24["method:MetalRenderer::setupBuffers<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:142"]
  S24 -->|calls| T24
  S25["method:MetalRenderer::attach<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:44"]
  T25["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
