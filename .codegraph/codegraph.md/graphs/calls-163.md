# `calls 符号关系 - 163`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T1["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  S1 -->|calls| T1
  S2["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T2["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  S2 -->|calls| T2
  S3["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T3["method:UINavigationController::popToViewControllerByAnimated<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:131"]
  S3 -->|calls| T3
  S4["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T4["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  S4 -->|calls| T4
  S5["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T5["method:UINavigationController::pushViewControllerByAnimated<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:107"]
  S5 -->|calls| T5
  S6["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T6["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  S6 -->|calls| T6
  S7["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T7["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S7 -->|calls| T7
  S8["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T8["method:UIViewController::byModalPresentationStyle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:40"]
  S8 -->|calls| T8
  S9["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T9["method:UINavigationController::byViewControllers<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:23"]
  S9 -->|calls| T9
  S10["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T10["method:UIViewController::jobsDebugFollowTheme<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugNavigationRootVC/JobsDebugNavigationRootVC.swift:15"]
  S10 -->|calls| T10
  S11["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T11["method:UINavigationController::pushViewControllerByAnimated<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:107"]
  S11 -->|calls| T11
  S12["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T12["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  S12 -->|calls| T12
  S13["method:JobsDebugPanel::select<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:249"]
  T13["method:JobsDebugPanel::apply<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:257"]
  S13 -->|calls| T13
  S14["method:JobsDebugPanel::apply<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:257"]
  T14["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:84"]
  S14 -->|calls| T14
  S15["method:JobsDebugPanel::apply<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:257"]
  T15["field:JobsDebugPanel::environmentDidChange<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:25"]
  S15 -->|calls| T15
  S16["method:JobsDebugPanel::apply<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:257"]
  T16["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:193"]
  S16 -->|calls| T16
  S17["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T17["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S17 -->|calls| T17
  S18["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T18["field:JobsDebugPanel::overlayWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:26"]
  S18 -->|calls| T18
  S19["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T19["function:AS::filter<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASLayoutSpecUtilities.h:49"]
  S19 -->|calls| T19
  S20["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T20["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S20 -->|calls| T20
  S21["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T21["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S21 -->|calls| T21
  S22["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T22["field:JobsDebugPanel::overlayWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:26"]
  S22 -->|calls| T22
  S23["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T23["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S23 -->|calls| T23
  S24["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T24["method:JobsDebugOverlayWindow::byHostWindow<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:23"]
  S24 -->|calls| T24
  S25["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T25["method:UIWindow::byRootViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIWindow/UIWindow+DSL.swift:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
