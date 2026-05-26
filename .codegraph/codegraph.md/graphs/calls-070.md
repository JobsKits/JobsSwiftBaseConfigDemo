# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T1["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S1 -->|calls| T1
  S2["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T2["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S2 -->|calls| T2
  S3["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T3["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S3 -->|calls| T3
  S4["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:313"]
  T4["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:313"]
  S4 -->|calls| T4
  S5["method:UILabel::byJobsAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:217"]
  T5["method:NSObject::_byApplyOptional<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:13"]
  S5 -->|calls| T5
  S6["method:UILabel::byJobsText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:225"]
  T6["method:NSObject::_byApplyOptional<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:13"]
  S6 -->|calls| T6
  S7["method:UILabel::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:239"]
  T7["method:NSObject::_byApplyOptional<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:13"]
  S7 -->|calls| T7
  S8["method:UILabel::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:247"]
  T8["method:NSObject::_byApplyOptional<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:13"]
  S8 -->|calls| T8
  S9["method:UILabel::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:256"]
  T9["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S9 -->|calls| T9
  S10["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:264"]
  T10["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S10 -->|calls| T10
  S11["method:UILabel::byLineBreakMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:272"]
  T11["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S11 -->|calls| T11
  S12["method:UILabel::byIsHighlighted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:298"]
  T12["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S12 -->|calls| T12
  S13["method:UILabel::byEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:306"]
  T13["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S13 -->|calls| T13
  S14["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:314"]
  T14["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S14 -->|calls| T14
  S15["method:UILabel::byBaselineAdjustment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:322"]
  T15["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S15 -->|calls| T15
  S16["method:UILabel::byMinimumScaleFactor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:330"]
  T16["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S16 -->|calls| T16
  S17["method:UILabel::byAllowsDefaultTighteningForTruncation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:338"]
  T17["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S17 -->|calls| T17
  S18["method:UILabel::byPreferredMaxLayoutWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:346"]
  T18["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S18 -->|calls| T18
  S19["method:UILabel::byLineBreakStrategy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:354"]
  T19["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S19 -->|calls| T19
  S20["method:UILabel::byPreferredVibrancy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:363"]
  T20["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S20 -->|calls| T20
  S21["method:UILabel::byShowsExpansionTextWhenTruncated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:372"]
  T21["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S21 -->|calls| T21
  S22["method:UILabel::jobs_height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:63"]
  T22["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S22 -->|calls| T22
  S23["method:UILabel::jobs_width<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:68"]
  T23["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S23 -->|calls| T23
  S24["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:19"]
  T24["method:UILabel::_jobs_installInsetsSwizzleIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:51"]
  S24 -->|calls| T24
  S25["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T25["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
