# `calls 符号关系 - 143`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1021"]
  T1["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:710"]
  S1 -->|calls| T1
  S2["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1021"]
  T2["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S2 -->|calls| T2
  S3["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1021"]
  T3["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S3 -->|calls| T3
  S4["method:UIView::removeRotationActionMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1021"]
  T4["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:713"]
  S4 -->|calls| T4
  S5["method:UIView::removeAllRotationActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1029"]
  T5["method:UIView::_grMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:710"]
  S5 -->|calls| T5
  S6["method:UIView::removeAllRotationActionsMulti<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:1029"]
  T6["method:UIView::_setGrMap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+手势（支持叠加不覆盖）.swift:713"]
  S6 -->|calls| T6
  S7["method:UIView::onJobsTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:39"]
  T7["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S7 -->|calls| T7
  S8["method:UIView::onJobsChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:45"]
  T8["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S8 -->|calls| T8
  S9["method:UIView::onJobsEvent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:51"]
  T9["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  S9 -->|calls| T9
  S10["method:UIView::addJobsAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:58"]
  T10["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S10 -->|calls| T10
  S11["method:UIView::_jobs_handleViewTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:88"]
  T11["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:28"]
  S11 -->|calls| T11
  S12["method:UIView::_jobs_handleViewTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:88"]
  T12["property:UIView::jobsHandlers<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:25"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_shimmer_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  T13["method:UIView::jobs_shimmer_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S13 -->|calls| T13
  S14["method:UIView::jobs_shimmer_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  T14["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  S14 -->|calls| T14
  S15["method:UIView::jobs_withoutImplicitAnimations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:131"]
  T15["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S15 -->|calls| T15
  S16["property:UIView::jobs_originalCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:150"]
  T16["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S16 -->|calls| T16
  S17["property:UIView::jobs_lastAnimationWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:167"]
  T17["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:241"]
  T18["method:CALayer::byName<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:303"]
  S18 -->|calls| T18
  S19["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:241"]
  T19["method:CALayer::byAddSublayer<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:89"]
  S19 -->|calls| T19
  S20["method:UIView::jobs_prepareShimmerLayerIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:241"]
  T20["method:CALayer::byAddSublayer<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:89"]
  S20 -->|calls| T20
  S21["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  T21["method:UIColor::jobsResolvedColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Others@SDK/UIColor.swift:335"]
  S21 -->|calls| T21
  S22["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  T22["method:UIColor::jobsResolvedColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Others@SDK/UIColor.swift:335"]
  S22 -->|calls| T22
  S23["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  T23["method:JXSegmentedIndicatorGradientLineView::byLocations<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:36"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_updateShimmerColors<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:276"]
  T24["method:CAGradientLayer::byColors<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAGradientLayer.swift:19"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_startShimmerAnimationIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:300"]
  T25["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:13"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
