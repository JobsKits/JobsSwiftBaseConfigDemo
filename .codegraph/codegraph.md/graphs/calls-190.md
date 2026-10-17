# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  T1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonBackgroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:104"]
  S1 -->|calls| T1
  S2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  T2["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S2 -->|calls| T2
  S3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  T3["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:69"]
  S3 -->|calls| T3
  S4["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:152"]
  T4["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:69"]
  S4 -->|calls| T4
  S5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:183"]
  T5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessImageViewTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:88"]
  S5 -->|calls| T5
  S6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:183"]
  T6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_pointToPixel<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:80"]
  S6 -->|calls| T6
  S7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  T7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonForegroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:92"]
  S7 -->|calls| T7
  S8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  T8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_pointToPixel<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:80"]
  S8 -->|calls| T8
  S9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  T9["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S9 -->|calls| T9
  S10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:198"]
  T10["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:55"]
  S10 -->|calls| T10
  S11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  T11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonBackgroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:104"]
  S11 -->|calls| T11
  S12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  T12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_pointToPixel<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:80"]
  S12 -->|calls| T12
  S13["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:222"]
  T14["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:69"]
  S14 -->|calls| T14
  S15["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithJobsImageLoader<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:247"]
  T15["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessImageViewTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:88"]
  S15 -->|calls| T15
  S16["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithJobsImageLoader<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:247"]
  T16["method:JobsImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:136"]
  S16 -->|calls| T16
  S17["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithJobsImageLoader<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:247"]
  T17["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S17 -->|calls| T17
  S18["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithJobsImageLoader<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:247"]
  T18["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S18 -->|calls| T18
  S19["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T19["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithJobsImageLoader<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:247"]
  S19 -->|calls| T19
  S20["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T20["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:183"]
  S20 -->|calls| T20
  S21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:111"]
  S21 -->|calls| T21
  S22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:111"]
  S22 -->|calls| T22
  S23["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T23["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:183"]
  S23 -->|calls| T23
  S24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:183"]
  S24 -->|calls| T24
  S25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:275"]
  T25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
