# `calls 符号关系 - 134`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::byEphemeralStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:78"]
  T1["method:BaseWebView::byWebsiteDataStore<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:66"]
  S1 -->|calls| T1
  S2["method:BaseWebView::downloadDidFinish<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:29"]
  T2["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:327"]
  S2 -->|calls| T2
  S3["method:BaseWebView::download<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:34"]
  T3["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:327"]
  S3 -->|calls| T3
  S4["method:DocumentPickerDelegateProxy::documentPicker<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:50"]
  T4["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  S4 -->|calls| T4
  S5["method:DocumentPickerDelegateProxy::documentPickerWasCancelled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:54"]
  T5["method:JobsTimer::onFinish<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:243"]
  S5 -->|calls| T5
  S6["method:BaseWebView::useMobileBridgeBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+MobileBridge.swift:98"]
  T6["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S6 -->|calls| T6
  S7["method:BaseWebView::useMobileBridgeBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+MobileBridge.swift:98"]
  T7["method:BaseWebView::useMobileBridge<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:420"]
  S7 -->|calls| T7
  S8["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:25"]
  T8["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:327"]
  S8 -->|calls| T8
  S9["method:BaseWebView::webViewWebContentProcessDidTerminate<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:43"]
  T9["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S9 -->|calls| T9
  S10["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T10["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S10 -->|calls| T10
  S11["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T11["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S11 -->|calls| T11
  S12["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T12["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S12 -->|calls| T12
  S13["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T13["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S13 -->|calls| T13
  S14["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T14["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S14 -->|calls| T14
  S15["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T15["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S15 -->|calls| T15
  S16["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T16["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:149"]
  S16 -->|calls| T16
  S17["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T17["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S17 -->|calls| T17
  S18["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T18["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S18 -->|calls| T18
  S19["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T19["method:BaseWebView::normalizeSuffix<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:100"]
  S19 -->|calls| T19
  S20["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T20["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S20 -->|calls| T20
  S21["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T21["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S21 -->|calls| T21
  S22["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T22["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S22 -->|calls| T22
  S23["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T23["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S23 -->|calls| T23
  S24["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T24["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S24 -->|calls| T24
  S25["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T25["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
