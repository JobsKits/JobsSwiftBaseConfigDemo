# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  S1 -->|calls| T1
  S2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S2 -->|calls| T2
  S3["method:JobsImageCacheCleaner::_forceRedownloadImagesMain<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:72"]
  T3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  S3 -->|calls| T3
  S4["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:331"]
  T4["method:JobsImageCacheCleaner::clearSDWebImageCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:43"]
  S4 -->|calls| T4
  S5["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:331"]
  T5["method:JobsImageCacheCleaner::clearKingfisherCache<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:30"]
  S5 -->|calls| T5
  S6["method:JobsImageCacheCleaner::clearAllCachesAndForceRedownload<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:331"]
  T6["method:JobsImageCacheCleaner::forceRedownloadImages<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:58"]
  S6 -->|calls| T6
  S7["class:UIView<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:351"]
  T7["enum:JobsImageLoaderKind<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:22"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:43"]
  T8["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:35"]
  S8 -->|calls| T8
  S9["method:JobsSimpleImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:22"]
  T9["method:JobsTask::resume<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:178"]
  S9 -->|calls| T9
  S10["method:JobsPaddedLabel::drawText<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:24"]
  T10["method:JobsPaddedLabel::drawText<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:24"]
  S10 -->|calls| T10
  S11["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  T11["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S11 -->|calls| T11
  S12["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:26"]
  T12["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:26"]
  S12 -->|calls| T12
  S13["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:32"]
  T13["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:32"]
  S13 -->|calls| T13
  S14["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:20"]
  T14["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  S14 -->|calls| T14
  S15["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:31"]
  T15["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  S15 -->|calls| T15
  S16["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  T16["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  S16 -->|calls| T16
  S17["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  T17["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  S17 -->|calls| T17
  S18["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  T18["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  S18 -->|calls| T18
  S19["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  T19["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S19 -->|calls| T19
  S20["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T20["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S20 -->|calls| T20
  S21["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T21["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S21 -->|calls| T21
  S22["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T22["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S22 -->|calls| T22
  S23["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T23["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S23 -->|calls| T23
  S24["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T24["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S24 -->|calls| T24
  S25["method:BaseWebView::byInjectDarkStylePatch<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:38"]
  T25["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:130"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
