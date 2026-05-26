# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:WKUserContentController::byAddUserScripts<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:26"]
  T1["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S1 -->|calls| T1
  S2["method:WKUserContentController::bySetHandler<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:72"]
  T2["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S2 -->|calls| T2
  S3["method:WKUserContentController::bySetHandler<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:82"]
  T3["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S3 -->|calls| T3
  S4["method:WKUserContentController::byAddHandler<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:94"]
  T4["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S4 -->|calls| T4
  S5["method:WKUserContentController::byAddHandler<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:103"]
  T5["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S5 -->|calls| T5
  S6["method:WKUserContentController::byAddContentRuleList<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:170"]
  T6["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S6 -->|calls| T6
  S7["method:WKUserContentController::byRemoveContentRuleList<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:177"]
  T7["method:JobsMemoryCache::remove<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:52"]
  S7 -->|calls| T7
  S8["method:WKWebView::loadURL<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:27"]
  T8["method:JobsSimpleImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:22"]
  S8 -->|calls| T8
  S9["method:WKWebView::loadRequest<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:35"]
  T9["method:JobsSimpleImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:22"]
  S9 -->|calls| T9
  S10["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:105"]
  T11["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S11 -->|calls| T11
  S12["method:WKWebViewConfiguration::make<br/>JobsByPods/JobsByWebKit@Pods/WKWebViewConfiguration.swift:21"]
  T12["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S12 -->|calls| T12
  S13["class:JobsCountdownBinder<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:19"]
  T13["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S13 -->|calls| T13
  S14["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T14["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:95"]
  S14 -->|calls| T14
  S15["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T15["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:101"]
  S15 -->|calls| T15
  S16["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T16["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S16 -->|calls| T16
  S17["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T17["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S17 -->|calls| T17
  S18["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T18["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S18 -->|calls| T18
  S19["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T19["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S19 -->|calls| T19
  S20["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T20["method:BRBasePicker::byTitle<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:26"]
  S20 -->|calls| T20
  S21["method:JobsCountdownBinder::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:34"]
  T21["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:101"]
  S21 -->|calls| T21
  S22["method:JobsCountdownBinder::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:95"]
  T22["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S22 -->|calls| T22
  S23["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:101"]
  T23["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S23 -->|calls| T23
  S24["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:101"]
  T24["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S24 -->|calls| T24
  S25["method:JobsCountdownBinder::applyUI<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBinder.swift:101"]
  T25["method:UIButton::bySubTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Subtitle.swift:214"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
