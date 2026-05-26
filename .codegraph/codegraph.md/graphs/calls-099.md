# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T1["method:UIPanGestureRecognizer::byMaxTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:157"]
  S1 -->|calls| T1
  S2["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T2["method:UIPanGestureRecognizer::byMinTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:151"]
  S2 -->|calls| T2
  S3["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T3["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S3 -->|calls| T3
  S4["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T4["method:UIView::_clampFrameWithinContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:395"]
  S4 -->|calls| T4
  S5["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T5["method:UIView::_effectiveDocking<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:329"]
  S5 -->|calls| T5
  S6["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T6["method:UIView::_snapOrigin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:343"]
  S6 -->|calls| T6
  S7["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  T7["method:UIView::_enableSimultaneousPanWithLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:297"]
  S7 -->|calls| T7
  S8["method:UIView::bySuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:267"]
  T8["method:UIView::suspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:165"]
  S8 -->|calls| T8
  S9["method:UIView::bySuspend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:267"]
  T9["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S9 -->|calls| T9
  S10["method:UIView::_enableSimultaneousPanWithLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:297"]
  T10["method:UIView::_suspendGestureDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:288"]
  S10 -->|calls| T10
  S11["method:UIView::_enableSimultaneousPanWithLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:297"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:UIView::_snapOrigin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:343"]
  T12["method:UIView::_availableBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:404"]
  S12 -->|calls| T12
  S13["method:UIView::_snapOrigin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:343"]
  T13["method:UIView::_clamped<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:384"]
  S13 -->|calls| T13
  S14["method:UIView::_clampFrameWithinContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:395"]
  T14["method:UIView::_availableBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:404"]
  S14 -->|calls| T14
  S15["method:UIView::_clampFrameWithinContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:395"]
  T15["method:UIView::_clamped<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:384"]
  S15 -->|calls| T15
  S16["method:UIView::_fallbackWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:410"]
  T16["method:UIView::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:17"]
  S16 -->|calls| T16
  S17["method:UIView::_fallbackWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:410"]
  T17["method:UIWindow::byWindowLevel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:44"]
  S17 -->|calls| T17
  S18["method:UIView::_fallbackWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:410"]
  T18["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S18 -->|calls| T18
  S19["method:UIView::_fallbackWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:410"]
  T19["method:UIView::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:17"]
  S19 -->|calls| T19
  S20["method:UIView::_fallbackWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+悬浮.swift:410"]
  T20["method:UIWindow::byWindowLevel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIWindow/UIWindow+DSL.swift:44"]
  S20 -->|calls| T20
  S21["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:177"]
  T21["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S21 -->|calls| T21
  S22["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:177"]
  T22["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S22 -->|calls| T22
  S23["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:177"]
  T23["method:UIAlertAction::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:19"]
  S23 -->|calls| T23
  S24["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:177"]
  T24["method:UIGestureRecognizer::byRequiresExclusiveTouchType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:77"]
  S24 -->|calls| T24
  S25["method:UIView::addTapAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:177"]
  T25["method:UITapGestureRecognizer::byTaps<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:115"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
