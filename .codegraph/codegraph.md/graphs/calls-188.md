# `calls 符号关系 - 188`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["property:JobsIconfont::resourceBundle<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:307"]
  T1["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S1 -->|calls| T1
  S2["property:JobsIconfont::resourceBundle<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:307"]
  T2["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S2 -->|calls| T2
  S3["method:JobsIconfont::registerFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:318"]
  T3["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S3 -->|calls| T3
  S4["method:JobsIconfont::registerFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:318"]
  T4["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S4 -->|calls| T4
  S5["class:JobsClockIconView<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:17"]
  T5["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S5 -->|calls| T5
  S6["class:JobsClockIconView<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:17"]
  T6["method:JobsClockIconView::commonInit<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:114"]
  S6 -->|calls| T6
  S7["class:JobsClockIconView<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:17"]
  T7["method:JobsClockIconView::commonInit<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:114"]
  S7 -->|calls| T7
  S8["method:JobsClockIconView::layoutSubviews<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:66"]
  T8["method:UIView::byCenter<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:117"]
  S8 -->|calls| T8
  S9["method:JobsClockIconView::layoutSubviews<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:66"]
  T9["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  S9 -->|calls| T9
  S10["method:JobsClockIconView::tintColorDidChange<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:74"]
  T10["method:JobsClockIconView::applyTintColor<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:138"]
  S10 -->|calls| T10
  S11["method:JobsClockIconView::start<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:79"]
  T11["method:JobsImageRotator::start<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:59"]
  S11 -->|calls| T11
  S12["method:JobsClockIconView::pause<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:88"]
  T12["method:JobsImageRotator::pause<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:79"]
  S12 -->|calls| T12
  S13["method:JobsClockIconView::resume<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:96"]
  T13["method:JobsImageRotator::resume<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:88"]
  S13 -->|calls| T13
  S14["method:JobsClockIconView::stop<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:104"]
  T14["method:JobsImageRotator::stop<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsImageRotator/JobsImageRotator.swift:97"]
  S14 -->|calls| T14
  S15["method:JobsClockIconView::commonInit<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:114"]
  T15["method:CAShapeLayer::byLineJoin<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:88"]
  S15 -->|calls| T15
  S16["method:JobsClockIconView::commonInit<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:114"]
  T16["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:82"]
  S16 -->|calls| T16
  S17["method:JobsClockIconView::commonInit<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:114"]
  T17["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S17 -->|calls| T17
  S18["method:JobsClockIconView::commonInit<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:114"]
  T18["method:JobsClockIconView::applyTintColor<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:138"]
  S18 -->|calls| T18
  S19["method:JobsClockIconView::applyTintColor<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:138"]
  T19["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S19 -->|calls| T19
  S20["method:JobsClockIconView::applyTintColor<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:138"]
  T20["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S20 -->|calls| T20
  S21["method:JobsClockIconView::applyTintColor<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:138"]
  T21["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S21 -->|calls| T21
  S22["method:JobsClockIconView::applyTintColor<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:138"]
  T22["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S22 -->|calls| T22
  S23["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T23["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S23 -->|calls| T23
  S24["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T24["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S24 -->|calls| T24
  S25["method:JobsClockIconView::layoutIcon<br/>JobsByPods/JobsImageRotation@Pods/Core/JobsClockIconView/JobsClockIconView.swift:146"]
  T25["method:UIWindow::jobsMake<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIWindow/UIWindow.swift:31"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
