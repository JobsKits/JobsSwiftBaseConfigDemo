# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsFuseBubbleRunner::emit<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:65"]
  T1["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S1 -->|calls| T1
  S2["method:JobsFuseBubbleRunner::emit<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:65"]
  T2["field:JobsFuseBubbleRunner::emitBlock<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:23"]
  S2 -->|calls| T2
  S3["method:UIView::byFuseBubbleStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:120"]
  T3["method:UIView::byFuseBubbleStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:152"]
  S3 -->|calls| T3
  S4["method:UIView::byFuseBubbleStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:120"]
  T4["method:JobsFuseBubbleRunner::start<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:45"]
  S4 -->|calls| T4
  S5["method:UIView::byFuseBubbleStop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:152"]
  T5["method:JobsFuseBubbleRunner::stop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:60"]
  S5 -->|calls| T5
  S6["enum:JobsFuseSoundStore<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:23"]
  T6["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S6 -->|calls| T6
  S7["method:JobsFuseSoundStore::soundID<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:27"]
  T7["method:JobsFuseSoundStore::soundURL<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:40"]
  S7 -->|calls| T7
  S8["method:JobsFuseSoundStore::soundID<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:27"]
  T8["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S8 -->|calls| T8
  S9["method:JobsFuseSoundStore::soundID<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:27"]
  T9["variable:JobsFuseSoundStore::soundIDs<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:25"]
  S9 -->|calls| T9
  S10["method:JobsFuseSoundStore::soundID<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:27"]
  T10["variable:JobsFuseSoundStore::soundIDs<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:25"]
  S10 -->|calls| T10
  S11["method:JobsFuseSoundStore::soundURL<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:40"]
  T11["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S11 -->|calls| T11
  S12["method:JobsFuseSoundStore::soundURL<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:40"]
  T12["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S12 -->|calls| T12
  S13["struct:JobsFuseOuterRingConfig<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:60"]
  T13["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S13 -->|calls| T13
  S14["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T14["method:UIView::byFuseOuterRingStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:274"]
  S14 -->|calls| T14
  S15["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T15["method:CALayer::byOpacity<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:225"]
  S15 -->|calls| T15
  S16["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T16["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S16 -->|calls| T16
  S17["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T17["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S17 -->|calls| T17
  S18["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T18["method:CAShapeLayer::byLineJoin<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:88"]
  S18 -->|calls| T18
  S19["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T19["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:82"]
  S19 -->|calls| T19
  S20["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T20["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S20 -->|calls| T20
  S21["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T21["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S21 -->|calls| T21
  S22["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T22["method:JobsProgressBar::byFillColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:935"]
  S22 -->|calls| T22
  S23["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T23["method:CALayer::byContentsScale<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:161"]
  S23 -->|calls| T23
  S24["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T24["method:CAShapeLayer::byStrokeEnd<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:58"]
  S24 -->|calls| T24
  S25["method:UIView::byFuseOuterRingStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:189"]
  T25["method:CAShapeLayer::byStrokeStart<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
