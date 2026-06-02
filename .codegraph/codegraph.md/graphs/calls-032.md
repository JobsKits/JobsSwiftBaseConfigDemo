# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:55"]
  T1["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S1 -->|calls| T1
  S2["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:55"]
  T2["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:173"]
  S2 -->|calls| T2
  S3["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:55"]
  T3["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S3 -->|calls| T3
  S4["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:71"]
  T4["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S4 -->|calls| T4
  S5["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:71"]
  T5["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:173"]
  S5 -->|calls| T5
  S6["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:71"]
  T6["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S6 -->|calls| T6
  S7["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T7["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S7 -->|calls| T7
  S8["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T8["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S8 -->|calls| T8
  S9["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T9["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S9 -->|calls| T9
  S10["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T10["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S10 -->|calls| T10
  S11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S11 -->|calls| T11
  S12["class:UIApplication<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:27"]
  T12["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:42"]
  S12 -->|calls| T12
  S13["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  T13["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:138"]
  S13 -->|calls| T13
  S14["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  T14["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:138"]
  S14 -->|calls| T14
  S15["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  T15["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:159"]
  S15 -->|calls| T15
  S16["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  T16["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:159"]
  S16 -->|calls| T16
  S17["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:173"]
  T17["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  S17 -->|calls| T17
  S18["class:UIWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIWindowScene.swift:15"]
  T18["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S18 -->|calls| T18
  S19["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  T19["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  S19 -->|calls| T19
  S20["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  T20["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  S20 -->|calls| T20
  S21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:118"]
  T21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessImageViewTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:90"]
  S21 -->|calls| T21
  S22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  T22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonForegroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:96"]
  S22 -->|calls| T22
  S23["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  T24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonBackgroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:110"]
  S24 -->|calls| T24
  S25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  T25["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
