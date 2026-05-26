# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T1["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S1 -->|calls| T1
  S2["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T2["method:UIAlertAction::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:19"]
  S2 -->|calls| T2
  S3["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T3["method:UIGestureRecognizer::byRequiresExclusiveTouchType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:77"]
  S3 -->|calls| T3
  S4["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T4["method:UITapGestureRecognizer::byTaps<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:115"]
  S4 -->|calls| T4
  S5["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T5["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S5 -->|calls| T5
  S6["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T6["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S6 -->|calls| T6
  S7["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:738"]
  T7["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S7 -->|calls| T7
  S8["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:769"]
  T8["method:UIView::addTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:769"]
  S8 -->|calls| T8
  S9["method:UIView::removeTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:785"]
  T9["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S9 -->|calls| T9
  S10["method:UIView::removeTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:785"]
  T10["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S10 -->|calls| T10
  S11["method:UIView::removeTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:785"]
  T11["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S11 -->|calls| T11
  S12["method:UIView::removeTapActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:785"]
  T12["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S12 -->|calls| T12
  S13["method:UIView::removeAllTapActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:793"]
  T13["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S13 -->|calls| T13
  S14["method:UIView::removeAllTapActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:793"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:UIView::removeAllTapActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:793"]
  T15["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S15 -->|calls| T15
  S16["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T16["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S16 -->|calls| T16
  S17["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T17["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S17 -->|calls| T17
  S18["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T18["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S18 -->|calls| T18
  S19["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T19["method:UILongPressGestureRecognizer::byMinDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:130"]
  S19 -->|calls| T19
  S20["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T20["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S20 -->|calls| T20
  S21["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T21["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S21 -->|calls| T21
  S22["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:800"]
  T22["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S22 -->|calls| T22
  S23["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:829"]
  T23["method:UIView::addLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:829"]
  S23 -->|calls| T23
  S24["method:UIView::removeLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:845"]
  T24["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S24 -->|calls| T24
  S25["method:UIView::removeLongPressActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:845"]
  T25["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
