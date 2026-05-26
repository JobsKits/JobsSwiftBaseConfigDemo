# `calls 符号关系 - 139`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:327"]
  T1["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S1 -->|calls| T1
  S2["method:BaseWebView::callJS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:333"]
  T2["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S2 -->|calls| T2
  S3["method:BaseWebView::evalAsyncRaw<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:344"]
  T3["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S3 -->|calls| T3
  S4["method:BaseWebView::evalAsyncRaw<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:344"]
  T4["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S4 -->|calls| T4
  S5["method:BaseWebView::evalAsync<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:379"]
  T5["method:BaseWebView::evalAsyncRaw<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:344"]
  S5 -->|calls| T5
  S6["method:BaseWebView::evalAsync<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:379"]
  T6["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  S6 -->|calls| T6
  S7["method:BaseWebView::setCookies<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:391"]
  T7["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S7 -->|calls| T7
  S8["method:BaseWebView::setSelectionDisabled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:404"]
  T8["method:WKWebView::jobsEval<br/>JobsByPods/JobsByWebKit@Pods/WKWebView.swift:94"]
  S8 -->|calls| T8
  S9["method:BaseWebView::useMobileBridge<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:420"]
  T9["method:BaseWebView::injectMinimalMobileShimIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:152"]
  S9 -->|calls| T9
  S10["method:BaseWebView::unregisterMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:434"]
  T10["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S10 -->|calls| T10
  S11["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T11["method:JobsTaskCenter::add<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenter.swift:34"]
  S11 -->|calls| T11
  S12["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T12["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S12 -->|calls| T12
  S13["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T13["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S13 -->|calls| T13
  S14["class:RedPacketRainView<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:20"]
  T14["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S14 -->|calls| T14
  S15["class:RedPacketRainView<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:20"]
  T15["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S15 -->|calls| T15
  S16["class:RedPacketRainView<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:20"]
  T16["method:RedPacketRainView::commonInit<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:70"]
  S16 -->|calls| T16
  S17["class:RedPacketRainView<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:20"]
  T17["method:RedPacketRainView::commonInit<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:70"]
  S17 -->|calls| T17
  S18["method:RedPacketRainView::start<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:75"]
  T18["method:RedPacketRainView::buildTimerIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:121"]
  S18 -->|calls| T18
  S19["method:RedPacketRainView::start<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:75"]
  T19["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  S19 -->|calls| T19
  S20["method:RedPacketRainView::start<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:75"]
  T20["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  S20 -->|calls| T20
  S21["method:RedPacketRainView::pause<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:83"]
  T21["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S21 -->|calls| T21
  S22["method:RedPacketRainView::pause<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:83"]
  T22["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:141"]
  S22 -->|calls| T22
  S23["method:RedPacketRainView::resume<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:90"]
  T23["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S23 -->|calls| T23
  S24["method:RedPacketRainView::resume<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:90"]
  T24["method:JobsTimer::resume<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S24 -->|calls| T24
  S25["method:RedPacketRainView::stop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:98"]
  T25["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
