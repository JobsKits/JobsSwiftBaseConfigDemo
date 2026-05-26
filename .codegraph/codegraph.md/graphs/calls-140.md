# `calls 符号关系 - 140`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:RedPacketRainView::stop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:98"]
  T1["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S1 -->|calls| T1
  S2["method:RedPacketRainView::stop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:98"]
  T2["method:RedPacketRainView::clearAllPackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:301"]
  S2 -->|calls| T2
  S3["method:RedPacketRainView::stop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:98"]
  T3["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S3 -->|calls| T3
  S4["method:RedPacketRainView::reset<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:116"]
  T4["method:RedPacketRainView::stop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:98"]
  S4 -->|calls| T4
  S5["method:RedPacketRainView::buildTimerIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:121"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:RedPacketRainView::buildTimerIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:121"]
  T6["method:RedPacketRainView::spawnPacketIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:169"]
  S6 -->|calls| T6
  S7["method:RedPacketRainView::buildTimerIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:121"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:RedPacketRainView::buildTimerIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:121"]
  T8["method:RedPacketRainView::updatePackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:255"]
  S8 -->|calls| T8
  S9["method:RedPacketRainView::spawnPacketIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:169"]
  T9["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:29"]
  S9 -->|calls| T9
  S10["method:RedPacketRainView::spawnPacketIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:169"]
  T10["function:makeDefaultIconImage<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨配置.swift:54"]
  S10 -->|calls| T10
  S11["method:RedPacketRainView::spawnPacketIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:169"]
  T11["method:UIView::playTapBounce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+动画.swift:102"]
  S11 -->|calls| T11
  S12["method:RedPacketRainView::spawnPacketIfNeeded<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:169"]
  T12["method:RedPacketRainView::removePacket<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:307"]
  S12 -->|calls| T12
  S13["method:RedPacketRainView::updatePackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:255"]
  T13["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S13 -->|calls| T13
  S14["method:RedPacketRainView::updatePackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:255"]
  T14["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S14 -->|calls| T14
  S15["method:RedPacketRainView::updatePackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:255"]
  T15["method:RedPacketRainView::removePacket<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:307"]
  S15 -->|calls| T15
  S16["method:RedPacketRainView::updatePackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:255"]
  T16["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S16 -->|calls| T16
  S17["method:RedPacketRainView::clearAllPackets<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:301"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:RedPacketRainView::removePacket<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:307"]
  T18["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S18 -->|calls| T18
  S19["method:RedPacketRainView::byStart<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:338"]
  T19["method:RedPacketRainView::start<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:75"]
  S19 -->|calls| T19
  S20["method:RedPacketRainView::byPause<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:344"]
  T20["method:RedPacketRainView::pause<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:83"]
  S20 -->|calls| T20
  S21["method:RedPacketRainView::byResume<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:350"]
  T21["method:RedPacketRainView::resume<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:90"]
  S21 -->|calls| T21
  S22["method:RedPacketRainView::byStop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:356"]
  T22["method:RedPacketRainView::stop<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:98"]
  S22 -->|calls| T22
  S23["method:RedPacketRainView::byReset<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:362"]
  T23["method:RedPacketRainView::reset<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨视图.swift:116"]
  S23 -->|calls| T23
  S24["function:makeDefaultIconImage<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/红包雨配置.swift:54"]
  T24["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S24 -->|calls| T24
  S25["class:JobsMarqueeView<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:32"]
  T25["method:JobsMarqueeView::handleScrollModeChanged<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:373"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
