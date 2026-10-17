# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T1["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S1 -->|calls| T1
  S2["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T2["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S2 -->|calls| T2
  S3["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T3["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S3 -->|calls| T3
  S4["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T4["method:UIWindow::jobsMake<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIWindow/UIWindow.swift:31"]
  S4 -->|calls| T4
  S5["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T5["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:19"]
  S5 -->|calls| T5
  S6["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T6["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S6 -->|calls| T6
  S7["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T7["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S7 -->|calls| T7
  S8["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T8["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S8 -->|calls| T8
  S9["property:JobsImageRotator::interval<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:21"]
  T9["method:JobsImageRotator::start<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:59"]
  S9 -->|calls| T9
  S10["property:JobsImageRotator::interval<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:21"]
  T10["method:JobsImageRotator::pause<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:79"]
  S10 -->|calls| T10
  S11["class:JobsImageRotator<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:17"]
  T11["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S11 -->|calls| T11
  S12["method:JobsImageRotator::start<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:59"]
  T12["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S12 -->|calls| T12
  S13["method:JobsImageRotator::start<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:59"]
  T13["method:JobsImageRotator::rotateOneTick<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:110"]
  S13 -->|calls| T13
  S14["method:JobsImageRotator::pause<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:79"]
  T14["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S14 -->|calls| T14
  S15["method:JobsImageRotator::resume<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:88"]
  T15["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:217"]
  S15 -->|calls| T15
  S16["method:JobsImageRotator::stop<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:97"]
  T16["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S16 -->|calls| T16
  S17["method:JobsImageRotator::rotateOneTick<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:110"]
  T17["method:JobsImageRotator::stop<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:97"]
  S17 -->|calls| T17
  S18["method:JobsImageCacheCleaner::clearKingfisherCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:30"]
  T18["method:JobsImageLoader::clearMemoryCache<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:165"]
  S18 -->|calls| T18
  S19["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  T19["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  S19 -->|calls| T19
  S20["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  T20["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  S20 -->|calls| T20
  S21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:111"]
  T21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessImageViewTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:88"]
  S21 -->|calls| T21
  S22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  T22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonForegroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:92"]
  S22 -->|calls| T22
  S23["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  T24["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:55"]
  S24 -->|calls| T24
  S25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  T25["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
