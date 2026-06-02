# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::byPersistentStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:73"]
  T1["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:66"]
  S1 -->|calls| T1
  S2["method:BaseWebView::byEphemeralStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:78"]
  T2["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:66"]
  S2 -->|calls| T2
  S3["method:DocumentPickerDelegateProxy::documentPicker<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:50"]
  T3["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  S3 -->|calls| T3
  S4["method:DocumentPickerDelegateProxy::documentPickerWasCancelled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:54"]
  T4["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  S4 -->|calls| T4
  S5["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T5["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S5 -->|calls| T5
  S6["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T6["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S6 -->|calls| T6
  S7["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T7["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S7 -->|calls| T7
  S8["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["method:BaseWebView::injectDarkCSSIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:124"]
  T9["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:130"]
  S9 -->|calls| T9
  S10["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:130"]
  T10["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S10 -->|calls| T10
  S11["method:BaseWebView::injectMinimalMobileShimIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:152"]
  T11["method:BaseWebView::injectMinimalMobileShim<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:158"]
  S11 -->|calls| T11
  S12["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T12["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S12 -->|calls| T12
  S13["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T13["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S13 -->|calls| T13
  S14["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T14["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S14 -->|calls| T14
  S15["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T15["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S15 -->|calls| T15
  S16["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T16["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S16 -->|calls| T16
  S17["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T17["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S17 -->|calls| T17
  S18["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T18["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S18 -->|calls| T18
  S19["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  T19["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S19 -->|calls| T19
  S20["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  T20["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S20 -->|calls| T20
  S21["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T21["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S21 -->|calls| T21
  S22["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T22["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S22 -->|calls| T22
  S23["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T23["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S23 -->|calls| T23
  S24["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T24["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S24 -->|calls| T24
  S25["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T25["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
