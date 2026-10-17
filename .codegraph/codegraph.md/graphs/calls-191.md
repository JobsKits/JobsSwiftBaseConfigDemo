# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  S1 -->|calls| T1
  S2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  S2 -->|calls| T2
  S3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  S3 -->|calls| T3
  S4["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T4["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  S4 -->|calls| T4
  S5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  S5 -->|calls| T5
  S6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  S6 -->|calls| T6
  S7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  S7 -->|calls| T7
  S8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:123"]
  S8 -->|calls| T8
  S9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  S9 -->|calls| T9
  S10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  S10 -->|calls| T10
  S11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  S11 -->|calls| T11
  S12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  S12 -->|calls| T12
  S13["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T13["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  S13 -->|calls| T13
  S14["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T14["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  S14 -->|calls| T14
  S15["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T15["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  S15 -->|calls| T15
  S16["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T16["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  S16 -->|calls| T16
  S17["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  T17["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  S17 -->|calls| T17
  S18["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:388"]
  T18["method:JobsImageCacheCleaner::clearSDWebImageCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:43"]
  S18 -->|calls| T18
  S19["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:388"]
  T19["method:JobsImageCacheCleaner::clearKingfisherCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:30"]
  S19 -->|calls| T19
  S20["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:388"]
  T20["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  S20 -->|calls| T20
  S21["property:UIView::jobs_imageLoaderKind<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:427"]
  T21["enum:JobsImageLoaderKind<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:21"]
  S21 -->|calls| T21
  S22["method:UIImageView::jobs_kfSetImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:490"]
  T22["method:ASButtonNode::setImage:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:414"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:55"]
  T23["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:69"]
  T24["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASImageNode.mm:590"]
  S24 -->|calls| T24
  S25["method:JobsImageLoadToken::cancel<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:88"]
  T25["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
