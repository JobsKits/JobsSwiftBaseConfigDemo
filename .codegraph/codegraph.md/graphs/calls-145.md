# `calls 符号关系 - 145`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobs_fgOverlayRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:543"]
  T1["method:UIButton::jobs_effectiveContentRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:599"]
  S1 -->|calls| T1
  S2["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:613"]
  T2["method:UIButton::jobs_fgOverlayRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:543"]
  S2 -->|calls| T2
  S3["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:613"]
  T3["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  S3 -->|calls| T3
  S4["method:UIButton::jobs_fgOverlay_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:634"]
  T4["method:UIButton::jobs_fgOverlay_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:634"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_fgOverlay_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:634"]
  T5["method:UIButton::jobs_layoutFGOverlayIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:613"]
  S5 -->|calls| T5
  S6["method:UIButton::_jobs_startForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:644"]
  T6["method:UIView::jobs_startShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:360"]
  S6 -->|calls| T6
  S7["method:UIButton::_jobs_stopForegroundShimmerOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:649"]
  T7["method:UIView::jobs_stopShimmer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:386"]
  S7 -->|calls| T7
  S8["property:UIViewController::jobsIsStandaloneDemoPage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:41"]
  T8["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S8 -->|calls| T8
  S9["function:UIViewController::jobsIsStandaloneDemoPage::isDemoRoot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:48"]
  T9["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S9 -->|calls| T9
  S10["property:UIViewController::jobsIsStandaloneDemoPage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:41"]
  T10["function:UIViewController::jobsIsStandaloneDemoPage::isDemoRoot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:48"]
  S10 -->|calls| T10
  S11["property:UIViewController::jobsIsStandaloneDemoPage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:41"]
  T11["function:UIViewController::jobsIsStandaloneDemoPage::isDemoRoot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:48"]
  S11 -->|calls| T11
  S12["property:UIViewController::jobsIsStandaloneDemoPage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:41"]
  T12["function:UIViewController::jobsIsStandaloneDemoPage::isDemoRoot<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:48"]
  S12 -->|calls| T12
  S13["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T13["method:UIBarButtonItem::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:127"]
  S13 -->|calls| T13
  S14["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T14["method:UIButton::byClearConfigurationBackground<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:423"]
  S14 -->|calls| T14
  S15["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T15["method:UIButton::custom<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:33"]
  S15 -->|calls| T15
  S16["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T16["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  S16 -->|calls| T16
  S17["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T17["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  S17 -->|calls| T17
  S18["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T18["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  S18 -->|calls| T18
  S19["property:UIViewController::jobsDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:72"]
  T19["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  S19 -->|calls| T19
  S20["property:UIViewController::jobsDemoThemeBarButtonItem<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:107"]
  T20["method:UIBarButtonItem::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:73"]
  S20 -->|calls| T20
  S21["property:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:124"]
  T21["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  S21 -->|calls| T21
  S22["property:UIViewController::jobsDemoActionMenuOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:142"]
  T22["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  S22 -->|calls| T22
  S23["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T23["method:JobsThemeCenter::unbind<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:278"]
  S23 -->|calls| T23
  S24["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T24["method:UIBarButtonItem::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:127"]
  S24 -->|calls| T24
  S25["method:UIViewController::jobsUpdateDemoTriggerPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:160"]
  T25["method:NSTextAttachment::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/NSTextAttachment.swift:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
