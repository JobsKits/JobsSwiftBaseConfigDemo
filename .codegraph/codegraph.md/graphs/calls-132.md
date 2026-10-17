# `calls 符号关系 - 132`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:Array::addDistributeTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:297"]
  T1["method:Array::snapDistribute<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:291"]
  S1 -->|calls| T1
  S2["method:UIView::firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:17"]
  T2["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S2 -->|calls| T2
  S3["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:21"]
  T3["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:21"]
  S3 -->|calls| T3
  S4["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:26"]
  T4["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:26"]
  S4 -->|calls| T4
  S5["method:UIView::_firstAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:34"]
  T5["method:ASThrashDataSource::predicateForDeallocatedHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASThrashUtility.m:270"]
  S5 -->|calls| T5
  S6["function:UIView::keyboardHeight::height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:40"]
  T6["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  S6 -->|calls| T6
  S7["property:UIView::keyboardHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:30"]
  T7["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S7 -->|calls| T7
  S8["property:UIView::keyboardHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:30"]
  T8["function:UIView::keyboardHeight::height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:40"]
  S8 -->|calls| T8
  S9["property:UIView::keyboardHeight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:30"]
  T9["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S9 -->|calls| T9
  S10["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:30"]
  T10["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S10 -->|calls| T10
  S11["method:UIView::bySpinResume<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:80"]
  T11["method:UIView::bySpinStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:30"]
  S11 -->|calls| T11
  S12["method:UIView::shake<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:148"]
  T12["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S12 -->|calls| T12
  S13["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T13["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S13 -->|calls| T13
  S14["method:UIView::doShineAnimation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:160"]
  T14["method:CABasicAnimation::byFromValue<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CABasicAnimation.swift:12"]
  S14 -->|calls| T14
  S15["struct:RTBadgeConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:24"]
  T15["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S15 -->|calls| T15
  S16["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:115"]
  T16["method:RTBadgeConfig::byShadowOffset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:110"]
  S16 -->|calls| T16
  S17["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:115"]
  T17["method:RTBadgeConfig::byShadowOpacity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:105"]
  S17 -->|calls| T17
  S18["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:115"]
  T18["method:RTBadgeConfig::byShadowRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:100"]
  S18 -->|calls| T18
  S19["method:RTBadgeConfig::byShadow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:115"]
  T19["method:RTBadgeConfig::byShadowColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:95"]
  S19 -->|calls| T19
  S20["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T20["method:UIView::ensureRTBadgeContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:225"]
  S20 -->|calls| T20
  S21["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T21["method:CALayer::byBorderWidth<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:206"]
  S21 -->|calls| T21
  S22["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T22["method:RTBadgeConfig::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:60"]
  S22 -->|calls| T22
  S23["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T23["method:CALayer::byZPosition<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:34"]
  S23 -->|calls| T23
  S24["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T24["method:MTLSamplerDescriptor::byBorderColor<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLSamplerDescriptor.swift:43"]
  S24 -->|calls| T24
  S25["method:UIView::byCornerBadge<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:132"]
  T25["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
