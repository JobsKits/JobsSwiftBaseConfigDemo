# `calls 符号关系 - 101`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:481"]
  T1["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S1 -->|calls| T1
  S2["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:516"]
  T2["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:546"]
  S2 -->|calls| T2
  S3["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:546"]
  T3["method:UIView::addSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:546"]
  S3 -->|calls| T3
  S4["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:551"]
  T4["method:UIView::addSwipeActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:551"]
  S4 -->|calls| T4
  S5["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:562"]
  T5["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S5 -->|calls| T5
  S6["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:562"]
  T6["method:UIPinchGestureRecognizer::byOnScaleChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:230"]
  S6 -->|calls| T6
  S7["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:562"]
  T7["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S7 -->|calls| T7
  S8["method:UIView::addPinchActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:587"]
  T8["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:605"]
  S8 -->|calls| T8
  S9["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:605"]
  T9["method:UIView::addPinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:605"]
  S9 -->|calls| T9
  S10["method:UIView::addPinchActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:610"]
  T10["method:UIView::addPinchActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:610"]
  S10 -->|calls| T10
  S11["method:UIView::addRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:624"]
  T11["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S11 -->|calls| T11
  S12["method:UIView::addRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:624"]
  T12["method:UIRotationGestureRecognizer::byOnRotationChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:194"]
  S12 -->|calls| T12
  S13["method:UIView::addRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:624"]
  T13["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S13 -->|calls| T13
  S14["method:UIView::addRotationActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:648"]
  T14["method:UIView::addRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:666"]
  S14 -->|calls| T14
  S15["method:UIView::addRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:666"]
  T15["method:UIView::addRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:666"]
  S15 -->|calls| T15
  S16["method:UIView::addRotationActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:671"]
  T16["method:UIView::addRotationActionAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:671"]
  S16 -->|calls| T16
  S17["method:UIView::removeAllGestureActions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:689"]
  T17["method:UIView::removeTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:301"]
  S17 -->|calls| T17
  S18["method:UIView::removeAllGestureActions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:689"]
  T18["method:UIView::removeLongPressAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:391"]
  S18 -->|calls| T18
  S19["method:UIView::removeAllGestureActions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:689"]
  T19["method:UIView::removePanAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:470"]
  S19 -->|calls| T19
  S20["method:UIView::removeAllGestureActions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:689"]
  T20["method:UIView::removeSwipeAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:555"]
  S20 -->|calls| T20
  S21["method:UIView::removeAllGestureActions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:689"]
  T21["method:UIView::removePinchAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:614"]
  S21 -->|calls| T21
  S22["method:UIView::removeAllGestureActions<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:689"]
  T22["method:UIView::removeRotationAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:679"]
  S22 -->|calls| T22
  S23["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T23["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S23 -->|calls| T23
  S24["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T24["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S24 -->|calls| T24
  S25["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T25["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
