# `calls 符号关系 - 125`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  T1["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S1 -->|calls| T1
  S2["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  T2["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  S2 -->|calls| T2
  S3["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:42"]
  T3["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S3 -->|calls| T3
  S4["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:42"]
  T4["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  S4 -->|calls| T4
  S5["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:55"]
  T5["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S5 -->|calls| T5
  S6["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:55"]
  T6["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:173"]
  S6 -->|calls| T6
  S7["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:55"]
  T7["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S7 -->|calls| T7
  S8["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:71"]
  T8["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S8 -->|calls| T8
  S9["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:71"]
  T9["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:173"]
  S9 -->|calls| T9
  S10["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:71"]
  T10["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S10 -->|calls| T10
  S11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S11 -->|calls| T11
  S12["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T12["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S12 -->|calls| T12
  S13["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T13["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S13 -->|calls| T13
  S14["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T14["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S14 -->|calls| T14
  S15["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  T15["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:86"]
  S15 -->|calls| T15
  S16["class:UIApplication<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:27"]
  T16["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:42"]
  S16 -->|calls| T16
  S17["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  T17["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:138"]
  S17 -->|calls| T17
  S18["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  T18["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:138"]
  S18 -->|calls| T18
  S19["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  T19["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:159"]
  S19 -->|calls| T19
  S20["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  T20["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:159"]
  S20 -->|calls| T20
  S21["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:173"]
  T21["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  S21 -->|calls| T21
  S22["class:UIWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIWindowScene.swift:15"]
  T22["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S22 -->|calls| T22
  S23["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  T23["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  S23 -->|calls| T23
  S24["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  T24["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  S24 -->|calls| T24
  S25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:118"]
  T25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessImageViewTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:90"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
