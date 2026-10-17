# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T1["method:JobsTodayNewsRefreshView::jobs_leftPointPath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:313"]
  S1 -->|calls| T1
  S2["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T2["method:JobsTodayNewsRefreshView::jobs_rectanglePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:327"]
  S2 -->|calls| T2
  S3["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T3["method:JobsTodayNewsRefreshView::jobs_rectanglePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:327"]
  S3 -->|calls| T3
  S4["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T4["method:JobsTodayNewsRefreshView::jobs_rightPointPath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:342"]
  S4 -->|calls| T4
  S5["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T5["method:JobsTodayNewsRefreshView::jobs_bowtiePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:299"]
  S5 -->|calls| T5
  S6["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T6["method:JobsTodayNewsRefreshView::jobs_bowtiePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:299"]
  S6 -->|calls| T6
  S7["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T7["method:CAKeyframeAnimation::byTimingFunctions<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:31"]
  S7 -->|calls| T7
  S8["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T8["method:CAKeyframeAnimation::byKeyTimes<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:25"]
  S8 -->|calls| T8
  S9["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T9["method:CAKeyframeAnimation::byValues<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:13"]
  S9 -->|calls| T9
  S10["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T10["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S10 -->|calls| T10
  S11["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  T11["method:CAKeyframeAnimation::byCalculationMode<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAKeyframeAnimation.swift:37"]
  S11 -->|calls| T11
  S12["method:JobsTodayNewsRefreshView::jobs_bowtiePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:299"]
  T12["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  S12 -->|calls| T12
  S13["method:JobsTodayNewsRefreshView::jobs_leftPointPath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:313"]
  T13["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  S13 -->|calls| T13
  S14["method:JobsTodayNewsRefreshView::jobs_rectanglePath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:327"]
  T14["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  S14 -->|calls| T14
  S15["method:JobsTodayNewsRefreshView::jobs_rightPointPath<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:342"]
  T15["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  S15 -->|calls| T15
  S16["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  T16["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:17"]
  S16 -->|calls| T16
  S17["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  T17["method:UIBezierPath::byMove<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:16"]
  S17 -->|calls| T17
  S18["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  T18["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S18 -->|calls| T18
  S19["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  T19["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S19 -->|calls| T19
  S20["method:JobsTodayNewsRefreshView::jobs_path<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:358"]
  T20["method:UIBezierPath::byClose<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:43"]
  S20 -->|calls| T20
  S21["method:JobsFuseBubbleRunner::start<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:45"]
  T21["method:JobsFuseBubbleRunner::stop<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:60"]
  S21 -->|calls| T21
  S22["method:JobsFuseBubbleRunner::start<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:45"]
  T22["method:JobsFuseBubbleRunner::emit<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:65"]
  S22 -->|calls| T22
  S23["method:JobsFuseBubbleRunner::start<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:45"]
  T23["method:JobsFuseBubbleRunner::emit<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:65"]
  S23 -->|calls| T23
  S24["method:JobsFuseBubbleRunner::start<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:45"]
  T24["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S24 -->|calls| T24
  S25["method:JobsFuseBubbleRunner::emit<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:65"]
  T25["field:JobsFuseBubbleRunner::bubbleProvider<br/>JobsByPods/JobsFuseAnimation@Pods/Core/UIView+JobsFuseBubbleAnimation/UIView+JobsFuseBubbleAnimation.swift:22"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
