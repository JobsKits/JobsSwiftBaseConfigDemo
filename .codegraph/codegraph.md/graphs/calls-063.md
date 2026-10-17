# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:199"]
  T1["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:199"]
  S1 -->|calls| T1
  S2["method:_JXScrollDelegateProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:199"]
  T2["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:165"]
  S2 -->|calls| T2
  S3["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:207"]
  T3["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:207"]
  S3 -->|calls| T3
  S4["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:207"]
  T4["method:JXSegmentedListContainerView::jx_reportIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:165"]
  S4 -->|calls| T4
  S5["method:_JXScrollDelegateProxy::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:207"]
  T5["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:193"]
  S5 -->|calls| T5
  S6["method:JXSegmentedView::byReload<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:96"]
  T6["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  S6 -->|calls| T6
  S7["method:JobsSegmentedViewDelegateProxy::segmentedView<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:110"]
  T7["field:JobsSegmentedViewDelegateProxy::didSelected<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:104"]
  S7 -->|calls| T7
  S8["method:JobsSegmentedViewDelegateProxy::segmentedView<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:114"]
  T8["field:JobsSegmentedViewDelegateProxy::didClickSelected<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:105"]
  S8 -->|calls| T8
  S9["method:JobsSegmentedViewDelegateProxy::segmentedView<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:118"]
  T9["field:JobsSegmentedViewDelegateProxy::didScrollSelected<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:106"]
  S9 -->|calls| T9
  S10["method:JobsSegmentedViewDelegateProxy::segmentedView<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:122"]
  T10["field:JobsSegmentedViewDelegateProxy::scrolling<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:107"]
  S10 -->|calls| T10
  S11["method:JobsSegmentedViewDelegateProxy::segmentedView<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:129"]
  T11["field:JobsSegmentedViewDelegateProxy::canClick<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:108"]
  S11 -->|calls| T11
  S12["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:25"]
  T12["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S12 -->|calls| T12
  S13["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:25"]
  T13["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S13 -->|calls| T13
  S14["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:25"]
  T14["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S14 -->|calls| T14
  S15["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:25"]
  T15["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  S15 -->|calls| T15
  S16["class:JobsClockView<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:25"]
  T16["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  S16 -->|calls| T16
  S17["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T17["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  S17 -->|calls| T17
  S18["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T18["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:138"]
  S18 -->|calls| T18
  S19["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T19["method:JobsClockView::layoutHandLayers<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:201"]
  S19 -->|calls| T19
  S20["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:100"]
  T20["method:JobsClockView::updateHands<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:254"]
  S20 -->|calls| T20
  S21["method:JobsClockView::traitCollectionDidChange<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  T21["method:ASDKViewController::traitCollectionDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:324"]
  S21 -->|calls| T21
  S22["method:JobsClockView::traitCollectionDidChange<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:109"]
  T22["method:JobsClockView::applyTheme<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:126"]
  S22 -->|calls| T22
  S23["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  T23["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S23 -->|calls| T23
  S24["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  T24["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S24 -->|calls| T24
  S25["method:JobsClockView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:118"]
  T25["method:CALayer::byHidden<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
