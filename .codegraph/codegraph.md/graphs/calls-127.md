# `calls 符号关系 - 127`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  S1 -->|calls| T1
  S2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  S2 -->|calls| T2
  S3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  S3 -->|calls| T3
  S4["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T4["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  S4 -->|calls| T4
  S5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  S5 -->|calls| T5
  S6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  S6 -->|calls| T6
  S7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  S7 -->|calls| T7
  S8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  S8 -->|calls| T8
  S9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  S9 -->|calls| T9
  S10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  S10 -->|calls| T10
  S11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  S11 -->|calls| T11
  S12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  T13["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  S13 -->|calls| T13
  S14["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:331"]
  T14["method:JobsImageCacheCleaner::clearSDWebImageCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:43"]
  S14 -->|calls| T14
  S15["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:331"]
  T15["method:JobsImageCacheCleaner::clearKingfisherCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:30"]
  S15 -->|calls| T15
  S16["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:331"]
  T16["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  S16 -->|calls| T16
  S17["class:UIView<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:351"]
  T17["enum:JobsImageLoaderKind<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:22"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:43"]
  T18["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:35"]
  S18 -->|calls| T18
  S19["method:JobsSimpleImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:22"]
  T19["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  S19 -->|calls| T19
  S20["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T20["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S20 -->|calls| T20
  S21["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T21["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S21 -->|calls| T21
  S22["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T22["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S22 -->|calls| T22
  S23["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T23["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S23 -->|calls| T23
  S24["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T24["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S24 -->|calls| T24
  S25["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T25["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
