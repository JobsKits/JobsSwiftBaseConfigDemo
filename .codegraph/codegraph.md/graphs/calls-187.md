# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsIconfont::iconFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:109"]
  T1["method:JobsIconfont::registerFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:318"]
  S1 -->|calls| T1
  S2["method:JobsIconfont::iconFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:109"]
  T2["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S2 -->|calls| T2
  S3["method:JobsIconfont::textFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:115"]
  T3["method:JobsIconfont::registerFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:318"]
  S3 -->|calls| T3
  S4["method:JobsIconfont::textFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:115"]
  T4["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S4 -->|calls| T4
  S5["method:JobsIconfont::iconImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:121"]
  T5["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S5 -->|calls| T5
  S6["method:JobsIconfont::iconImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:121"]
  T6["method:JobsIconfont::iconFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:109"]
  S6 -->|calls| T6
  S7["method:JobsIconfont::iconImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:121"]
  T7["method:JobsSwiftCalendar::boundingRect<br/>JobsByPods/JobsSwiftCalendar@Pods/Core/JobsSwiftCalendar/JobsSwiftCalendar.swift:171"]
  S7 -->|calls| T7
  S8["method:JobsIconfont::iconImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:121"]
  T8["method:ASHighlightOverlayLayer::drawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:70"]
  S8 -->|calls| T8
  S9["method:JobsIconfont::placeholderImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:158"]
  T9["method:JobsIconfont::iconImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:121"]
  S9 -->|calls| T9
  S10["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T10["method:JobsIconfont::placeholderImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:158"]
  S10 -->|calls| T10
  S11["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T11["method:JobsIconfontLoadToken::cancel<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:81"]
  S11 -->|calls| T11
  S12["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T12["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S12 -->|calls| T12
  S13["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T13["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S13 -->|calls| T13
  S14["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T14["enum:JobsIconfontLoader<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:59"]
  S14 -->|calls| T14
  S15["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T15["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S15 -->|calls| T15
  S16["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  T16["method:JobsImageLoadToken::cancel<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:88"]
  S16 -->|calls| T16
  S17["method:JobsIconfont::cancelLoad<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:226"]
  T17["method:JobsIconfontLoadToken::cancel<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:81"]
  S17 -->|calls| T17
  S18["method:JobsIconfont::clearImageCache<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:232"]
  T18["method:JobsImageLoader::clearMemoryCache<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:165"]
  S18 -->|calls| T18
  S19["method:JobsIconfont::clearImageCache<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:232"]
  T19["method:JobsImageCacheCleaner::clearSDWebImageCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:43"]
  S19 -->|calls| T19
  S20["method:JobsIconfont::clearImageCache<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:232"]
  T20["method:JobsImageCacheCleaner::clearKingfisherCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:30"]
  S20 -->|calls| T20
  S21["method:UIImageView::byJobsIconfont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:246"]
  T21["method:JobsIconfont::load<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:166"]
  S21 -->|calls| T21
  S22["method:UIImageView::byCancelJobsIconfontLoad<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:263"]
  T22["method:JobsIconfont::cancelLoad<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:226"]
  S22 -->|calls| T22
  S23["method:UILabel::byJobsIconfont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:271"]
  T23["method:JobsIconfont::iconFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:109"]
  S23 -->|calls| T23
  S24["method:UILabel::byJobsIconfontText<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:283"]
  T24["method:JobsIconfont::textFont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:115"]
  S24 -->|calls| T24
  S25["method:UIButton::byJobsIconfont<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:291"]
  T25["method:JobsIconfont::iconImage<br/>JobsByPods/JobsIconfont@Pods/Core/JobsIconfont.swift:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
