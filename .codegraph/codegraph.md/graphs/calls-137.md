# `calls 符号关系 - 137`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T1["method:BaseWebView::nearestViewController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:105"]
  S1 -->|calls| T1
  S2["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T2["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S2 -->|calls| T2
  S3["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T3["method:WKWebViewConfiguration::byUserContentController<br/>JobsByPods/JobsByWebKit@Pods/WKWebViewConfiguration.swift:42"]
  S3 -->|calls| T3
  S4["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T4["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:66"]
  S4 -->|calls| T4
  S5["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T5["method:WKWebViewConfiguration::byAllowsInlineMediaPlayback<br/>JobsByPods/JobsByWebKit@Pods/WKWebViewConfiguration.swift:129"]
  S5 -->|calls| T5
  S6["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T6["method:WKUserContentController::byAddUserScript<br/>JobsByPods/JobsByWebKit@Pods/WKUserContentController.swift:20"]
  S6 -->|calls| T6
  S7["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T7["method:BaseWebView::makeBridgeUserScript<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:19"]
  S7 -->|calls| T7
  S8["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T8["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S8 -->|calls| T8
  S9["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T9["method:WKWebView::byScrollView<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:21"]
  S9 -->|calls| T9
  S10["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T10["method:JXSegmentedTitleDataSource::byConfiguration<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedDataSource/JXSegmentedTitleDataSource.swift:195"]
  S10 -->|calls| T10
  S11["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T11["method:WKWebView::byCustomUserAgent<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:51"]
  S11 -->|calls| T11
  S12["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T12["method:WKWebView::byInspectable<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:42"]
  S12 -->|calls| T12
  S13["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T13["method:WKWebView::byUIDelegate<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:70"]
  S13 -->|calls| T13
  S14["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T14["method:WKWebView::byNavigationDelegate<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:64"]
  S14 -->|calls| T14
  S15["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T15["method:WKWebViewConfiguration::byApplicationNameForUserAgent<br/>JobsByPods/JobsByWebKit@Pods/WKWebViewConfiguration.swift:69"]
  S15 -->|calls| T15
  S16["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T16["method:UIScrollView::byRefreshControl<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:103"]
  S16 -->|calls| T16
  S17["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T17["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S17 -->|calls| T17
  S18["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T18["method:UIView::onJobsChange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+统一点击事件.swift:45"]
  S18 -->|calls| T18
  S19["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T19["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  S19 -->|calls| T19
  S20["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T20["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  S20 -->|calls| T20
  S21["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T21["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  S21 -->|calls| T21
  S22["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T22["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S22 -->|calls| T22
  S23["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T23["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S23 -->|calls| T23
  S24["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T24["method:BaseWebView::registerMessageHandlers<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:213"]
  S24 -->|calls| T24
  S25["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T25["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
