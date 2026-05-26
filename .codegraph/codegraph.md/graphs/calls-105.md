# `calls 符号关系 - 105`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::removeAllPinchActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1010"]
  T1["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S1 -->|calls| T1
  S2["method:UIView::removeAllPinchActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1010"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S2 -->|calls| T2
  S3["method:UIView::removeAllPinchActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1010"]
  T3["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S3 -->|calls| T3
  S4["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1016"]
  T4["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S4 -->|calls| T4
  S5["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1016"]
  T5["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S5 -->|calls| T5
  S6["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1016"]
  T6["method:UIView::_gestureHandleRotate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:675"]
  S6 -->|calls| T6
  S7["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1016"]
  T7["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S7 -->|calls| T7
  S8["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1016"]
  T8["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S8 -->|calls| T8
  S9["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1039"]
  T9["method:UIView::addRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1039"]
  S9 -->|calls| T9
  S10["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1045"]
  T10["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S10 -->|calls| T10
  S11["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1045"]
  T11["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S11 -->|calls| T11
  S12["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1045"]
  T12["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S12 -->|calls| T12
  S13["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1045"]
  T13["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S13 -->|calls| T13
  S14["method:UIView::removeAllRotationActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1053"]
  T14["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:726"]
  S14 -->|calls| T14
  S15["method:UIView::removeAllRotationActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1053"]
  T15["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S15 -->|calls| T15
  S16["method:UIView::removeAllRotationActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1053"]
  T16["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:729"]
  S16 -->|calls| T16
  S17["method:UIView::onJobsTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:39"]
  T17["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S17 -->|calls| T17
  S18["method:UIView::onJobsChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:45"]
  T18["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S18 -->|calls| T18
  S19["method:UIView::onJobsEvent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:51"]
  T19["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S19 -->|calls| T19
  S20["method:UIView::_jobs_handleViewTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:88"]
  T20["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  S20 -->|calls| T20
  S21["method:UIView::jobs_shimmer_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  T21["method:UIView::jobs_shimmer_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S21 -->|calls| T21
  S22["method:UIView::jobs_shimmer_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  T22["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_withoutImplicitAnimations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:131"]
  T23["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:227"]
  T24["method:UIView::byAddSublayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:445"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:227"]
  T25["method:JXSegmentedIndicatorGradientLineView::byEndPoint<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
