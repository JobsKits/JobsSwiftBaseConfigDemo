# `calls 符号关系 - 073`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T1["method:CATextLayer::byAlignmentMode<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:63"]
  S1 -->|calls| T1
  S2["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T2["method:CALayer::byContentsScale<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:162"]
  S2 -->|calls| T2
  S3["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T3["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S3 -->|calls| T3
  S4["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T4["method:CATextLayer::byString<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:20"]
  S4 -->|calls| T4
  S5["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T5["method:CATextLayer::byFontSize<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:39"]
  S5 -->|calls| T5
  S6["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T6["method:UILabel::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:46"]
  S6 -->|calls| T6
  S7["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T7["method:AttributeContainer::byForegroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:34"]
  S7 -->|calls| T7
  S8["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T8["method:CATextLayer::byString<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:20"]
  S8 -->|calls| T8
  S9["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T9["method:CALayer::byFrame<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:23"]
  S9 -->|calls| T9
  S10["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T10["method:UIView::byTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:116"]
  S10 -->|calls| T10
  S11["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T11["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:19"]
  S11 -->|calls| T11
  S12["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T12["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:41"]
  S12 -->|calls| T12
  S13["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T13["method:UIView::byTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:116"]
  S13 -->|calls| T13
  S14["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T14["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:19"]
  S14 -->|calls| T14
  S15["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T15["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:41"]
  S15 -->|calls| T15
  S16["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T16["method:UIView::byTransform<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:116"]
  S16 -->|calls| T16
  S17["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T17["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:19"]
  S17 -->|calls| T17
  S18["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T18["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:41"]
  S18 -->|calls| T18
  S19["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T19["method:UIView::byAddSublayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:445"]
  S19 -->|calls| T19
  S20["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T20["method:UILabel::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S20 -->|calls| T20
  S21["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T21["method:UIGestureRecognizer::byName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:84"]
  S21 -->|calls| T21
  S22["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T22["method:UILabel::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:157"]
  S22 -->|calls| T22
  S23["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T23["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S23 -->|calls| T23
  S24["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T24["method:UITapGestureRecognizer::byTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:121"]
  S24 -->|calls| T24
  S25["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:17"]
  T25["method:UITapGestureRecognizer::byTaps<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:115"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
