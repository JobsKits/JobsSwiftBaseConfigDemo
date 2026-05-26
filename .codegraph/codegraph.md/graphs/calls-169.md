# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:networkNormalListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:331"]
  T1["method:JobsNetworkTrafficMonitor::byOnUpdate<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:195"]
  S1 -->|calls| T1
  S2["function:networkNormalListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:331"]
  T2["function:jobs_formatSpeed<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:212"]
  S2 -->|calls| T2
  S3["function:networkNormalListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:331"]
  T3["function:jobs_formatSpeed<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:212"]
  S3 -->|calls| T3
  S4["function:networkNormalListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:331"]
  T4["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S4 -->|calls| T4
  S5["function:networkNormalListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:331"]
  T5["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  S5 -->|calls| T5
  S6["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T6["method:YTKBaseRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:114"]
  S6 -->|calls| T6
  S7["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T7["method:JobsNetworkTrafficMonitor::byOnUpdate<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:195"]
  S7 -->|calls| T7
  S8["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T8["function:jobs_formatSpeed<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:212"]
  S8 -->|calls| T8
  S9["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T9["function:jobs_formatSpeed<br/>JobsByPods/JobsSwiftBaseTools@Pods/🛜网络流量监控/JobsNetWorkTools.swift:212"]
  S9 -->|calls| T9
  S10["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T10["function:jobsMakeParagraphStyle<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:15"]
  S10 -->|calls| T10
  S11["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T11["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S11 -->|calls| T11
  S12["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T12["method:JobsRichRun::color<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:56"]
  S12 -->|calls| T12
  S13["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T13["method:JobsRichRun::font<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:55"]
  S13 -->|calls| T13
  S14["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T14["method:JobsRichRun::color<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:56"]
  S14 -->|calls| T14
  S15["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T15["method:JobsRichRun::font<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:55"]
  S15 -->|calls| T15
  S16["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T16["method:JobsRichRun::color<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:56"]
  S16 -->|calls| T16
  S17["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T17["method:JobsRichRun::font<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:55"]
  S17 -->|calls| T17
  S18["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T18["method:JobsRichRun::color<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:56"]
  S18 -->|calls| T18
  S19["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T19["method:JobsRichRun::font<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:55"]
  S19 -->|calls| T19
  S20["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T20["method:JobsRichRun::color<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:56"]
  S20 -->|calls| T20
  S21["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T21["method:JobsRichRun::font<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:55"]
  S21 -->|calls| T21
  S22["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T22["method:JobsRichRun::color<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:56"]
  S22 -->|calls| T22
  S23["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T23["method:JobsRichRun::font<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:55"]
  S23 -->|calls| T23
  S24["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T24["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S24 -->|calls| T24
  S25["function:networkRichListenerBy<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:348"]
  T25["method:UIView::makeNetworkListener<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:295"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
