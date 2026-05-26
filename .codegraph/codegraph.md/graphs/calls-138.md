# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T1["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S1 -->|calls| T1
  S2["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T2["method:BaseWebView::setupKVO<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:229"]
  S2 -->|calls| T2
  S3["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T3["method:BaseWebView::applyRuntimeToggles<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:252"]
  S3 -->|calls| T3
  S4["method:BaseWebView::commonInit<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:169"]
  T4["method:BaseWebView::useMobileBridge<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:420"]
  S4 -->|calls| T4
  S5["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T6["method:BaseWebView::cleanupNow<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:196"]
  S6 -->|calls| T6
  S7["method:BaseWebView::cleanupNow<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:196"]
  T7["method:WKWebView::byNavigationDelegate<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:64"]
  S7 -->|calls| T7
  S8["method:BaseWebView::cleanupNow<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:196"]
  T8["method:WKWebView::byUIDelegate<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:70"]
  S8 -->|calls| T8
  S9["method:BaseWebView::setupKVO<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:229"]
  T9["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S9 -->|calls| T9
  S10["method:BaseWebView::setupKVO<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:229"]
  T10["method:FTDashboardView::setProgress<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:105"]
  S10 -->|calls| T10
  S11["method:BaseWebView::applyRuntimeToggles<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:252"]
  T11["method:BaseWebView::injectDarkCSSIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:124"]
  S11 -->|calls| T11
  S12["method:BaseWebView::applyRuntimeToggles<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:252"]
  T12["method:BaseWebView::setSelectionDisabled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:404"]
  S12 -->|calls| T12
  S13["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:261"]
  T13["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S13 -->|calls| T13
  S14["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:261"]
  T14["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S14 -->|calls| T14
  S15["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:273"]
  T15["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S15 -->|calls| T15
  S16["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:273"]
  T16["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S16 -->|calls| T16
  S17["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:282"]
  T17["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S17 -->|calls| T17
  S18["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:282"]
  T18["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S18 -->|calls| T18
  S19["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:294"]
  T19["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S19 -->|calls| T19
  S20["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:294"]
  T20["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S20 -->|calls| T20
  S21["method:BaseWebView::loadBundleHTMLBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:308"]
  T21["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:294"]
  S21 -->|calls| T21
  S22["method:BaseWebView::loadBundleHTMLBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:308"]
  T22["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:294"]
  S22 -->|calls| T22
  S23["method:BaseWebView::off<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:325"]
  T23["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S23 -->|calls| T23
  S24["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:327"]
  T24["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S24 -->|calls| T24
  S25["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:327"]
  T25["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
