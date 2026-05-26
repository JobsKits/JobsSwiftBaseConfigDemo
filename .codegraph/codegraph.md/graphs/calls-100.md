# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:177"]
  T1["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S1 -->|calls| T1
  S2["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:217"]
  T2["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:254"]
  S2 -->|calls| T2
  S3["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:254"]
  T3["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:254"]
  S3 -->|calls| T3
  S4["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:260"]
  T4["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:260"]
  S4 -->|calls| T4
  S5["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:270"]
  T5["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:270"]
  S5 -->|calls| T5
  S6["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:278"]
  T6["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:278"]
  S6 -->|calls| T6
  S7["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:283"]
  T7["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:283"]
  S7 -->|calls| T7
  S8["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:293"]
  T8["method:UIView::addTapActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:293"]
  S8 -->|calls| T8
  S9["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:311"]
  T9["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S9 -->|calls| T9
  S10["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:311"]
  T10["method:UILongPressGestureRecognizer::byMinDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:130"]
  S10 -->|calls| T10
  S11["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:311"]
  T11["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S11 -->|calls| T11
  S12["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:346"]
  T12["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:381"]
  S12 -->|calls| T12
  S13["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:381"]
  T13["method:UIView::addLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:381"]
  S13 -->|calls| T13
  S14["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:386"]
  T14["method:UIView::addLongPressActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:386"]
  S14 -->|calls| T14
  S15["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:401"]
  T15["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S15 -->|calls| T15
  S16["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:401"]
  T16["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S16 -->|calls| T16
  S17["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:401"]
  T17["method:UIPanGestureRecognizer::byMaxTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:157"]
  S17 -->|calls| T17
  S18["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:401"]
  T18["method:UIPanGestureRecognizer::byMinTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:151"]
  S18 -->|calls| T18
  S19["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:401"]
  T19["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S19 -->|calls| T19
  S20["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:433"]
  T20["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:461"]
  S20 -->|calls| T20
  S21["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:461"]
  T21["method:UIView::addPanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:461"]
  S21 -->|calls| T21
  S22["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:466"]
  T22["method:UIView::addPanActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:466"]
  S22 -->|calls| T22
  S23["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:481"]
  T23["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S23 -->|calls| T23
  S24["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:481"]
  T24["method:UITapGestureRecognizer::byTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:121"]
  S24 -->|calls| T24
  S25["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:481"]
  T25["method:UISwipeGestureRecognizer::byDirection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:166"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
