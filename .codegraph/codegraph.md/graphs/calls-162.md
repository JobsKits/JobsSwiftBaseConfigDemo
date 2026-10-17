# `calls 符号关系 - 162`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsDebugOverlayWindow::hitTest<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:33"]
  T1["method:JobsDebugButtonVC::containsButton<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugButtonVC/JobsDebugButtonVC.swift:110"]
  S1 -->|calls| T1
  S2["method:JobsDebugOverlayWindow::hitTest<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugOverlayWindow/JobsDebugOverlayWindow.swift:33"]
  T2["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:251"]
  S2 -->|calls| T2
  S3["method:JobsDebugPanel::byEnvironments<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:37"]
  T3["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:48"]
  S3 -->|calls| T3
  S4["method:JobsDebugPanel::byEnvironments<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:37"]
  T4["method:JobsDebugPanel::apply<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:257"]
  S4 -->|calls| T4
  S5["method:JobsDebugPanel::byEnvironmentDidChange<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:50"]
  T5["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S5 -->|calls| T5
  S6["method:JobsDebugPanel::byStart<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:65"]
  T6["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  S6 -->|calls| T6
  S7["method:JobsDebugPanel::byStart<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:65"]
  T7["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S7 -->|calls| T7
  S8["method:JobsDebugPanel::byStart<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:65"]
  T8["method:JobsDebugPanel::refreshWindows<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:263"]
  S8 -->|calls| T8
  S9["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:101"]
  T9["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:101"]
  S9 -->|calls| T9
  S10["method:JobsDebugPanel::toggle<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:108"]
  T10["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  S10 -->|calls| T10
  S11["method:JobsDebugPanel::toggle<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:108"]
  T11["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:101"]
  S11 -->|calls| T11
  S12["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T12["method:JobsDebugPanel::containsController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:165"]
  S12 -->|calls| T12
  S13["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T13["method:UIViewController::byDismiss<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:253"]
  S13 -->|calls| T13
  S14["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T14["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  S14 -->|calls| T14
  S15["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T15["method:NSMapTable::removeObjectForPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:141"]
  S15 -->|calls| T15
  S16["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T16["method:UIViewController::byDismiss<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:253"]
  S16 -->|calls| T16
  S17["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T17["method:UINavigationController::popToViewControllerByAnimated<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:131"]
  S17 -->|calls| T17
  S18["method:JobsDebugPanel::closeIfOpen<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:115"]
  T18["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  S18 -->|calls| T18
  S19["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  T20["method:JobsDebugPanel::containsController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:165"]
  S20 -->|calls| T20
  S21["method:JobsDebugPanel::refreshFloatingButtonAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:151"]
  T21["method:JobsDebugButtonVC::updateAccessibility<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugButtonVC/JobsDebugButtonVC.swift:68"]
  S21 -->|calls| T21
  S22["method:JobsDebugPanel::containsController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:165"]
  T22["method:JobsDebugPanel::containsController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:165"]
  S22 -->|calls| T22
  S23["method:JobsDebugPanel::containsController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:165"]
  T23["method:JobsDebugPanel::containsController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:165"]
  S23 -->|calls| T23
  S24["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T24["method:JobsDebugPanel::topController<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:313"]
  S24 -->|calls| T24
  S25["method:JobsDebugPanel::open<br/>JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanel/JobsDebugPanel.swift:179"]
  T25["method:UIViewController::byDismiss<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIViewController/UIViewController+DSL.swift:253"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
