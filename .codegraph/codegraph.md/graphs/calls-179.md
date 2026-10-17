# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsChargingAnimationView<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:593"]
  T1["method:JobsChargingAnimationView::jobs_setupChargingAnimation<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:719"]
  S1 -->|calls| T1
  S2["class:JobsChargingAnimationView<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:593"]
  T2["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:288"]
  S2 -->|calls| T2
  S3["method:JobsChargingAnimationView::layoutSubviews<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:625"]
  T3["method:JobsChargingAnimationView::jobs_layoutChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:747"]
  S3 -->|calls| T3
  S4["method:JobsChargingAnimationView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:630"]
  T4["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  S4 -->|calls| T4
  S5["method:JobsChargingAnimationView::traitCollectionDidChange<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:635"]
  T5["method:ASDKViewController::traitCollectionDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:324"]
  S5 -->|calls| T5
  S6["method:JobsChargingAnimationView::traitCollectionDidChange<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:635"]
  T6["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  S6 -->|calls| T6
  S7["method:JobsChargingAnimationView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:641"]
  T7["method:JobsChargingAnimationView::jobs_stopChargingTimer<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:820"]
  S7 -->|calls| T7
  S8["method:JobsChargingAnimationView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:641"]
  T8["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  S8 -->|calls| T8
  S9["method:JobsChargingAnimationView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:641"]
  T9["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  S9 -->|calls| T9
  S10["method:JobsChargingAnimationView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:664"]
  T10["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  S10 -->|calls| T10
  S11["method:JobsChargingAnimationView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:664"]
  T11["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  S11 -->|calls| T11
  S12["method:JobsChargingAnimationView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:676"]
  T12["method:JobsTimer::pause<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:170"]
  S12 -->|calls| T12
  S13["method:JobsChargingAnimationView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:684"]
  T13["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  S13 -->|calls| T13
  S14["method:JobsChargingAnimationView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:692"]
  T14["method:JobsChargingAnimationView::jobs_stopChargingTimer<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:820"]
  S14 -->|calls| T14
  S15["method:JobsChargingAnimationView::byStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:692"]
  T15["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  S15 -->|calls| T15
  S16["method:JobsChargingAnimationView::byAdvance<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:703"]
  T16["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  S16 -->|calls| T16
  S17["method:JobsChargingAnimationView::jobs_setupChargingAnimation<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:719"]
  T17["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S17 -->|calls| T17
  S18["method:JobsChargingAnimationView::jobs_setupChargingAnimation<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:719"]
  T18["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  S18 -->|calls| T18
  S19["method:JobsChargingAnimationView::jobs_reduceMotionStatusDidChange<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:731"]
  T19["method:JobsChargingAnimationView::jobs_syncChargingTimerState<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:794"]
  S19 -->|calls| T19
  S20["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  T20["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S20 -->|calls| T20
  S21["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  T21["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S21 -->|calls| T21
  S22["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S22 -->|calls| T22
  S23["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  T23["method:JobsChargingAnimationView::jobs_layoutChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:747"]
  S23 -->|calls| T23
  S24["method:JobsChargingAnimationView::jobs_rebuildChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:735"]
  T24["method:JobsChargingAnimationView::jobs_applyChargingColors<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:767"]
  S24 -->|calls| T24
  S25["method:JobsChargingAnimationView::jobs_layoutChargingSegments<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:747"]
  T25["method:JobsOCCentralLab::beginWithLog:timeout:<br/>SwiftDoc.md/iOS蓝牙开发实战与面试.md/Demo/OC/JobsOCCentralLab.m:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
