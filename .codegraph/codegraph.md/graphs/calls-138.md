# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:343"]
  T1["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:310"]
  S1 -->|calls| T1
  S2["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:374"]
  T2["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:374"]
  S2 -->|calls| T2
  S3["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:374"]
  T3["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S3 -->|calls| T3
  S4["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:379"]
  T4["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:379"]
  S4 -->|calls| T4
  S5["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:379"]
  T5["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S5 -->|calls| T5
  S6["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:394"]
  T6["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S6 -->|calls| T6
  S7["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:394"]
  T7["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S7 -->|calls| T7
  S8["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:394"]
  T8["field:UIView::_GestureActionBox::action<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:173"]
  S8 -->|calls| T8
  S9["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:424"]
  T9["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S9 -->|calls| T9
  S10["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:424"]
  T10["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:394"]
  S10 -->|calls| T10
  S11["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:451"]
  T11["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:451"]
  S11 -->|calls| T11
  S12["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:451"]
  T12["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S12 -->|calls| T12
  S13["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:456"]
  T13["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:456"]
  S13 -->|calls| T13
  S14["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:456"]
  T14["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S14 -->|calls| T14
  S15["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:471"]
  T15["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S15 -->|calls| T15
  S16["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:471"]
  T16["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S16 -->|calls| T16
  S17["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:471"]
  T17["field:UIView::_GestureActionBox::action<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:173"]
  S17 -->|calls| T17
  S18["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:503"]
  T18["method:UISwipeGestureRecognizer::byDirection<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:146"]
  S18 -->|calls| T18
  S19["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:503"]
  T19["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S19 -->|calls| T19
  S20["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:503"]
  T20["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:471"]
  S20 -->|calls| T20
  S21["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:530"]
  T21["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:530"]
  S21 -->|calls| T21
  S22["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:530"]
  T22["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S22 -->|calls| T22
  S23["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:535"]
  T23["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:535"]
  S23 -->|calls| T23
  S24["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:535"]
  T24["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S24 -->|calls| T24
  S25["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:546"]
  T25["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
