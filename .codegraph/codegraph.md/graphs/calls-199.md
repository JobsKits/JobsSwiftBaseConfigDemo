# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:30"]
  T1["method:BaseWebView::acceptsBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:43"]
  S1 -->|calls| T1
  S2["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:30"]
  T2["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  S2 -->|calls| T2
  S3["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T3["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  S3 -->|calls| T3
  S4["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T4["field:BaseWebView::handlers<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:88"]
  S4 -->|calls| T4
  S5["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T5["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:139"]
  S5 -->|calls| T5
  S6["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T6["method:JobsBridgeReplyGate::take<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:196"]
  S6 -->|calls| T6
  S7["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T7["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:139"]
  S7 -->|calls| T7
  S8["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T8["method:JobsBridgeReplyGate::take<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:196"]
  S8 -->|calls| T8
  S9["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  T9["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:139"]
  S9 -->|calls| T9
  S10["method:BaseWebView::jsReturn<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:139"]
  T10["method:WKWebView::jobsEval<br/>JobsByPods/JobsSwiftDSL@Pods/WebKit/WKWebView.swift:92"]
  S10 -->|calls| T10
  S11["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  T11["field:BaseWebView::mobileActionHandlers<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:91"]
  S11 -->|calls| T11
  S12["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  T12["method:JobsBridgeReplyGate::take<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:196"]
  S12 -->|calls| T12
  S13["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  T13["method:WKWebView::jobsEval<br/>JobsByPods/JobsSwiftDSL@Pods/WebKit/WKWebView.swift:92"]
  S13 -->|calls| T13
  S14["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  T14["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S14 -->|calls| T14
  S15["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  T15["method:WKWebView::jobsEval<br/>JobsByPods/JobsSwiftDSL@Pods/WebKit/WKWebView.swift:92"]
  S15 -->|calls| T15
  S16["method:BaseWebView::handleIOSBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:148"]
  T16["method:WKWebView::jobsEval<br/>JobsByPods/JobsSwiftDSL@Pods/WebKit/WKWebView.swift:92"]
  S16 -->|calls| T16
  S17["method:JobsBridgeReplyGate::take<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:196"]
  T17["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S17 -->|calls| T17
  S18["method:BaseWebView::byAllowedHosts<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:18"]
  T18["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S18 -->|calls| T18
  S19["method:BaseWebView::byDisableSelectionAndCallout<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:30"]
  T19["method:BaseWebView::setSelectionDisabled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:431"]
  S19 -->|calls| T19
  S20["method:BaseWebView::byInjectDarkStylePatch<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:37"]
  T20["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:127"]
  S20 -->|calls| T20
  S21["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:65"]
  T21["method:BaseWebView::updateCreationConfiguration<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:151"]
  S21 -->|calls| T21
  S22["method:BaseWebView::byPersistentStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:72"]
  T22["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:65"]
  S22 -->|calls| T22
  S23["method:BaseWebView::byEphemeralStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:78"]
  T23["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:65"]
  S23 -->|calls| T23
  S24["method:BaseWebView::byWebViewConfiguration<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:84"]
  T24["method:BaseWebView::updateCreationConfiguration<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:151"]
  S24 -->|calls| T24
  S25["method:BaseWebView::byBridgeAllowedOrigins<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:91"]
  T25["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
