# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T1["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  S1 -->|calls| T1
  S2["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T2["method:UIImageView::jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:50"]
  S2 -->|calls| T2
  S3["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T3["method:UIImageView::jobs_transition<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:163"]
  S3 -->|calls| T3
  S4["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T4["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:75"]
  S4 -->|calls| T4
  S5["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T5["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:146"]
  S5 -->|calls| T5
  S6["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:146"]
  T6["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:75"]
  S6 -->|calls| T6
  S7["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:146"]
  T7["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:66"]
  S7 -->|calls| T7
  S8["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:146"]
  T8["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:75"]
  S8 -->|calls| T8
  S9["method:UIImageView::jobs_transition<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:163"]
  T9["method:UnityAppController::transitionToViewController:<br/>Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S9 -->|calls| T9
  S10["method:UILabel::byDynamicTextStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:19"]
  T10["method:JobsFont::preferredFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:44"]
  S10 -->|calls| T10
  S11["method:UILabel::byParagraph<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:27"]
  T11["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S11 -->|calls| T11
  S12["method:UILabel::byParagraph<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:27"]
  T12["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S12 -->|calls| T12
  S13["method:UILabel::jobs_height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:58"]
  T13["method:_ASDisplayView::sizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:247"]
  S13 -->|calls| T13
  S14["method:UILabel::jobs_width<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+Tools.swift:63"]
  T14["method:_ASDisplayView::sizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:247"]
  S14 -->|calls| T14
  S15["property:UILabel::jobs_contentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:21"]
  T15["method:UILabel::_jobs_installInsetsSwizzleIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:51"]
  S15 -->|calls| T15
  S16["property:UILabel::jobs_contentInsets<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:21"]
  T16["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S16 -->|calls| T16
  S17["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T17["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S17 -->|calls| T17
  S18["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T18["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  S18 -->|calls| T18
  S19["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T19["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S19 -->|calls| T19
  S20["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T20["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  S20 -->|calls| T20
  S21["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T21["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S21 -->|calls| T21
  S22["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  T22["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  S22 -->|calls| T22
  S23["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  T23["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  S23 -->|calls| T23
  S24["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:101"]
  T24["method:_JobsAnimatedNumberStore::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:73"]
  S24 -->|calls| T24
  S25["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:101"]
  T25["method:_JobsAnimatedNumberStore::byMinimumInterval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:67"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
