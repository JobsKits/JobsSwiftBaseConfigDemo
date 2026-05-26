# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsProgressBar::startAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:411"]
  T1["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S1 -->|calls| T1
  S2["method:JobsProgressBar::startAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:411"]
  T2["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S2 -->|calls| T2
  S3["method:JobsProgressBar::startAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:411"]
  T3["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S3 -->|calls| T3
  S4["method:JobsProgressBar::startAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:411"]
  T4["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S4 -->|calls| T4
  S5["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  T5["method:JobsProgressBar::stopThumbRotation<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:699"]
  S5 -->|calls| T5
  S6["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  T6["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S6 -->|calls| T6
  S7["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  T7["method:JobsProgressBar::autoStopIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:404"]
  S7 -->|calls| T7
  S8["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  T8["method:JobsProgressBar::displayProgressValue<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:554"]
  S8 -->|calls| T8
  S9["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  T9["method:JobsProgressBar::updateRotationDirectionByDisplayDelta<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:610"]
  S9 -->|calls| T9
  S10["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  T10["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  S10 -->|calls| T10
  S11["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  T11["method:JobsProgressBar::displayProgressValue<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:554"]
  S11 -->|calls| T11
  S12["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:JobsProgressBar::setDisplayPercent<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:494"]
  T13["method:JobsProgressBar::setDisplayPercent<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:503"]
  S13 -->|calls| T13
  S14["method:JobsProgressBar::setDisplayPercent<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:503"]
  T14["method:JobsProgressBar::autoStopIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:404"]
  S14 -->|calls| T14
  S15["method:JobsProgressBar::setDisplayPercent<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:503"]
  T15["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S15 -->|calls| T15
  S16["method:JobsProgressBar::displayProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:574"]
  T16["method:JobsProgressBar::currentTrackFrame<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:534"]
  S16 -->|calls| T16
  S17["method:JobsProgressBar::displayProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:574"]
  T17["method:JobsProgressBar::displayProgressValue<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:554"]
  S17 -->|calls| T17
  S18["method:JobsProgressBar::updateRotationDirectionByDisplayDelta<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:610"]
  T18["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  S18 -->|calls| T18
  S19["method:JobsProgressBar::setThumbDraggingUI<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:627"]
  T19["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S19 -->|calls| T19
  S20["method:JobsProgressBar::currentRotationZ<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:659"]
  T20["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S20 -->|calls| T20
  S21["method:JobsProgressBar::currentRotationZ<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:659"]
  T21["method:Bag::value<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:70"]
  S21 -->|calls| T21
  S22["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T22["method:JobsProgressBar::currentRotationZ<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:659"]
  S22 -->|calls| T22
  S23["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T23["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S23 -->|calls| T23
  S24["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T24["method:CAAnimation::byTimingFunction<br/>JobsByPods/JobsByQuartzCore@Pods/CAAnimation.swift:13"]
  S24 -->|calls| T24
  S25["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  T25["method:CAMediaTiming::byFillMode<br/>JobsByPods/JobsByQuartzCore@Pods/CAMediaTiming.swift:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
