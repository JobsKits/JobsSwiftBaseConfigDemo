# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FTDashboardView::updateDragGestureEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:256"]
  T1["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S1 -->|calls| T1
  S2["method:FTDashboardView::updateDragGestureEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:256"]
  T2["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:39"]
  S2 -->|calls| T2
  S3["method:FTDashboardView::handlePan<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:263"]
  T3["method:FTDashboardView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:275"]
  S3 -->|calls| T3
  S4["method:FTDashboardView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:275"]
  T4["method:FTDashboardView::normalizedAngle<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:299"]
  S4 -->|calls| T4
  S5["method:FTDashboardView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:275"]
  T5["method:FTDashboardView::normalizedAngle<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:299"]
  S5 -->|calls| T5
  S6["method:FTDashboardView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:275"]
  T6["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  S6 -->|calls| T6
  S7["method:FTDashboardView::updateProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:275"]
  T7["field:FTDashboardView::progressChangedAction<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:52"]
  S7 -->|calls| T7
  S8["method:FTDashboardView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:305"]
  T8["method:FTDashboardView::layoutLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:157"]
  S8 -->|calls| T8
  S9["method:FTDashboardView::byProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:315"]
  T9["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:119"]
  S9 -->|calls| T9
  S10["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T10["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S10 -->|calls| T10
  S11["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T11["method:UIView::bySuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:269"]
  S11 -->|calls| T11
  S12["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T12["method:BMPlayer::byBack<br/>JobsByPods/JobsSwiftDSL@Pods/ThirdParty/BMPlayer+DSL.swift:30"]
  S12 -->|calls| T12
  S13["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T13["method:BMPlayer::byVideoGravity<br/>JobsByPods/JobsSwiftDSL@Pods/ThirdParty/BMPlayer+DSL.swift:36"]
  S13 -->|calls| T13
  S14["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T14["method:BMPlayer::byResource<br/>JobsByPods/JobsSwiftDSL@Pods/ThirdParty/BMPlayer+DSL.swift:66"]
  S14 -->|calls| T14
  S15["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T15["method:JobsLiveFloatPlayer::hide<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:73"]
  S15 -->|calls| T15
  S16["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T16["method:SuspendConfig::byContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:72"]
  S16 -->|calls| T16
  S17["method:JobsLiveFloatPlayer::showRemoteLive<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:27"]
  T17["method:NSObject::keepScreenOn<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+屏幕常亮.swift:22"]
  S17 -->|calls| T17
  S18["method:JobsLiveFloatPlayer::hide<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:73"]
  T18["method:UIView::unsuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:133"]
  S18 -->|calls| T18
  S19["method:JobsLiveFloatPlayer::pause<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:78"]
  T19["method:BMPlayer::byPause<br/>JobsByPods/JobsSwiftDSL@Pods/ThirdParty/BMPlayer+DSL.swift:97"]
  S19 -->|calls| T19
  S20["method:UIImageView::byKfLocalGIF<br/>JobsByPods/JobsBy3rdTools@Pods/Kingfisher/Kingfisher.swift:17"]
  T20["method:ASButtonNode::setImage:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:414"]
  S20 -->|calls| T20
  S21["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T21["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S21 -->|calls| T21
  S22["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T22["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S22 -->|calls| T22
  S23["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T23["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S23 -->|calls| T23
  S24["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T24["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S24 -->|calls| T24
  S25["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T25["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
