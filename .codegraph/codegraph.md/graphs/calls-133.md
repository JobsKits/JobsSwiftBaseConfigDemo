# `calls 符号关系 - 133`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:318"]
  T1["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S1 -->|calls| T1
  S2["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:318"]
  T2["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:318"]
  S2 -->|calls| T2
  S3["method:JobsTabBarCtrl::scrollViewDidEndDecelerating<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:342"]
  T3["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S3 -->|calls| T3
  S4["method:JobsTabBarCtrl::scrollViewDidEndDecelerating<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:342"]
  T4["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:288"]
  S4 -->|calls| T4
  S5["method:JobsTabBarCtrl::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:351"]
  T5["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S5 -->|calls| T5
  S6["method:JobsTabBarCtrl::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:351"]
  T6["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:288"]
  S6 -->|calls| T6
  S7["method:JobsTabBarCtrl::byDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:423"]
  T7["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  S7 -->|calls| T7
  S8["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:20"]
  T8["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  S8 -->|calls| T8
  S9["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:31"]
  T9["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  S9 -->|calls| T9
  S10["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  T10["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  S10 -->|calls| T10
  S11["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  T11["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  S11 -->|calls| T11
  S12["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:42"]
  T12["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  S12 -->|calls| T12
  S13["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  T13["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S13 -->|calls| T13
  S14["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:96"]
  T14["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S14 -->|calls| T14
  S15["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T15["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S15 -->|calls| T15
  S16["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T16["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S16 -->|calls| T16
  S17["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T17["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S17 -->|calls| T17
  S18["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T19["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S19 -->|calls| T19
  S20["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T20["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S20 -->|calls| T20
  S21["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T21["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S21 -->|calls| T21
  S22["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:106"]
  T22["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S22 -->|calls| T22
  S23["method:BaseWebView::byDisableSelectionAndCallout<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:31"]
  T23["method:BaseWebView::setSelectionDisabled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:404"]
  S23 -->|calls| T23
  S24["method:BaseWebView::byInjectDarkStylePatch<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:38"]
  T24["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:130"]
  S24 -->|calls| T24
  S25["method:BaseWebView::byPersistentStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:73"]
  T25["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:66"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
