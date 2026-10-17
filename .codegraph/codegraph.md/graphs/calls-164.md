# `calls 符号关系 - 164`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T1["method:JobsDebugOverlayWindow::make<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:14"]
  S1 -->|calls| T1
  S2["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T2["field:JobsDebugPanel::overlayWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:26"]
  S2 -->|calls| T2
  S3["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T3["field:JobsDebugPanel::overlayWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:26"]
  S3 -->|calls| T3
  S4["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T4["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S4 -->|calls| T4
  S5["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T5["method:JobsDebugOverlayWindow::byHostWindow<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:23"]
  S5 -->|calls| T5
  S6["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T6["field:JobsDebugPanel::overlayWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:26"]
  S6 -->|calls| T6
  S7["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T7["method:UIWindow::byRootViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIWindow/UIWindow+DSL.swift:38"]
  S7 -->|calls| T7
  S8["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T8["method:JobsDebugOverlayWindow::make<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:19"]
  S8 -->|calls| T8
  S9["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  T9["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  S9 -->|calls| T9
  S10["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  T10["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  S10 -->|calls| T10
  S11["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  T11["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  S11 -->|calls| T11
  S12["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  T12["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  S12 -->|calls| T12
  S13["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  T13["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  S13 -->|calls| T13
  S14["enum:JobsDebugPanelResource<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanelResource/JobsDebugPanelResource.swift:12"]
  T14["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S14 -->|calls| T14
  S15["enum:JobsDebugPanelResource<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanelResource/JobsDebugPanelResource.swift:12"]
  T15["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:27"]
  S15 -->|calls| T15
  S16["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T16["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S16 -->|calls| T16
  S17["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T17["method:NSObject::jobsValueVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:47"]
  S17 -->|calls| T17
  S18["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T18["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S18 -->|calls| T18
  S19["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T19["method:JobsFont::preferredFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:44"]
  S19 -->|calls| T19
  S20["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T20["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S20 -->|calls| T20
  S21["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T21["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S21 -->|calls| T21
  S22["class:JobsEmptyView<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:20"]
  T22["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S22 -->|calls| T22
  S23["method:JobsEmptyView::accessibilityActivate<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:57"]
  T23["method:NSObject::jobsValueVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:47"]
  S23 -->|calls| T23
  S24["method:JobsEmptyView::byOnTapRetry<br/>JobsByPods/JobsEmptyView@Pods/JobsEmptyView.swift:64"]
  T24["method:NSObject::jobsByVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:37"]
  S24 -->|calls| T24
  S25["class:JobsDouyinRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:18"]
  T25["method:JobsDouyinRefreshView::jobs_setupDouyinRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsDouyinRefreshView/JobsDouyinRefreshView.swift:167"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
