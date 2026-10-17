# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::jobs_prepareNavRightButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:386"]
  T1["method:UIViewController::jobs_prepareNavRightButtonSizeIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:367"]
  S1 -->|calls| T1
  S2["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  T2["method:UIBarButtonItem::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:127"]
  S2 -->|calls| T2
  S3["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  T3["method:UIViewController::jobs_prepareNavRightButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:386"]
  S3 -->|calls| T3
  S4["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  T4["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S4 -->|calls| T4
  S5["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  T5["method:UIViewController::jobsUpdateDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:413"]
  S5 -->|calls| T5
  S6["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  T6["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobsEnsureDemoThemeButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:391"]
  T7["method:UIViewController::jobsUpdateDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:413"]
  S7 -->|calls| T7
  S8["method:UIViewController::jobsUpdateDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:413"]
  T8["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:426"]
  S8 -->|calls| T8
  S9["method:UIViewController::jobsUpdateDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:413"]
  T9["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:426"]
  T10["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:447"]
  S10 -->|calls| T10
  S11["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:426"]
  T11["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:426"]
  T12["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S12 -->|calls| T12
  S13["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:426"]
  T13["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:164"]
  S13 -->|calls| T13
  S14["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:426"]
  T14["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:184"]
  S14 -->|calls| T14
  S15["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:447"]
  T15["method:UIViewController::jobsDemoBusinessButtons<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:447"]
  S15 -->|calls| T15
  S16["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T16["method:UIView::byRemoveFromSuperview<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:581"]
  S16 -->|calls| T16
  S17["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T17["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S17 -->|calls| T17
  S18["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T18["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S18 -->|calls| T18
  S19["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T19["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S19 -->|calls| T19
  S20["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T20["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S20 -->|calls| T20
  S21["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T21["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:178"]
  S21 -->|calls| T21
  S22["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T22["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  S22 -->|calls| T22
  S23["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T23["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  S23 -->|calls| T23
  S24["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T24["method:JobsThemeCenter::resolvedImage<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsTheme.swift:243"]
  S24 -->|calls| T24
  S25["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T25["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
