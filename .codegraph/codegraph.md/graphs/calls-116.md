# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UILabel::underline<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+富文本.swift:56"]
  T1["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S1 -->|calls| T1
  S2["method:UILabel::underline<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+富文本.swift:56"]
  T2["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S2 -->|calls| T2
  S3["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T3["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:70"]
  S3 -->|calls| T3
  S4["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T4["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S4 -->|calls| T4
  S5["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T5["method:CATextLayer::byString<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATextLayer.swift:18"]
  S5 -->|calls| T5
  S6["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T6["method:CATextLayer::byFontSize<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATextLayer.swift:37"]
  S6 -->|calls| T6
  S7["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T7["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S7 -->|calls| T7
  S8["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T8["method:AttributeContainer::byForegroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:33"]
  S8 -->|calls| T8
  S9["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T9["method:CATextLayer::byString<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATextLayer.swift:18"]
  S9 -->|calls| T9
  S10["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T10["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S10 -->|calls| T10
  S11["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T11["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S11 -->|calls| T11
  S12["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T12["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:20"]
  S12 -->|calls| T12
  S13["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T13["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:40"]
  S13 -->|calls| T13
  S14["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T14["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S14 -->|calls| T14
  S15["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T15["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:20"]
  S15 -->|calls| T15
  S16["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T16["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:40"]
  S16 -->|calls| T16
  S17["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T17["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S17 -->|calls| T17
  S18["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T18["method:EKAttributes::byPosition<br/>JobsByPods/JobsBy3rdTools@Pods/EKAttributes/EKAttributes.swift:20"]
  S18 -->|calls| T18
  S19["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T19["method:CALayer::byAnchorPoint<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:40"]
  S19 -->|calls| T19
  S20["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T20["method:UIView::byAddSublayer<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:465"]
  S20 -->|calls| T20
  S21["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T21["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S21 -->|calls| T21
  S22["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:18"]
  T22["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S22 -->|calls| T22
  S23["method:UILabel::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:18"]
  T23["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S23 -->|calls| T23
  S24["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:42"]
  T24["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S24 -->|calls| T24
  S25["method:UILabel::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+点击事件.swift:42"]
  T25["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
