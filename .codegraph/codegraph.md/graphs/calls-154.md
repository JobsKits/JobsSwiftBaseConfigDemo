# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T1["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S1 -->|calls| T1
  S2["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T2["method:JobsProgressBar::stopThumbRotation<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:699"]
  S2 -->|calls| T2
  S3["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T3["method:JobsProgressBar::updateRotationDirectionByDisplayDelta<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:610"]
  S3 -->|calls| T3
  S4["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T4["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S4 -->|calls| T4
  S5["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T5["method:JobsProgressBar::updateRotationDirectionByDisplayDelta<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:610"]
  S5 -->|calls| T5
  S6["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T6["method:JobsProgressBar::setProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:462"]
  S6 -->|calls| T6
  S7["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T7["method:JobsProgressBar::setThumbDraggingUI<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:627"]
  S7 -->|calls| T7
  S8["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T8["method:JobsProgressBar::spinDownAndStop<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:706"]
  S8 -->|calls| T8
  S9["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T9["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S9 -->|calls| T9
  S10["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T10["method:JobsProgressBar::commonInit<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:302"]
  S10 -->|calls| T10
  S11["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T11["method:JobsProgressBar::commonInit<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:302"]
  S11 -->|calls| T11
  S12["method:JobsProgressBar::commonInit<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:302"]
  T12["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S12 -->|calls| T12
  S13["method:JobsProgressBar::commonInit<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:302"]
  T13["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  S13 -->|calls| T13
  S14["method:JobsProgressBar::commonInit<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:302"]
  T14["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S14 -->|calls| T14
  S15["method:JobsProgressBar::commonInit<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:302"]
  T15["method:JobsProgressBar::updateDragGestureEnabled<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:526"]
  S15 -->|calls| T15
  S16["method:JobsProgressBar::layoutSubviews<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:322"]
  T16["method:JobsProgressBar::layoutSubviews<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:322"]
  S16 -->|calls| T16
  S17["method:JobsProgressBar::layoutSubviews<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:322"]
  T17["method:JobsProgressBar::layoutForCurrentState<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:327"]
  S17 -->|calls| T17
  S18["method:JobsProgressBar::layoutForCurrentState<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:327"]
  T18["method:JobsProgressBar::updateProgressLabelText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1051"]
  S18 -->|calls| T18
  S19["method:JobsProgressBar::layoutForCurrentState<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:327"]
  T19["method:JobsProgressBar::layoutThumb<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:742"]
  S19 -->|calls| T19
  S20["method:JobsProgressBar::layoutForCurrentState<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:327"]
  T20["method:JobsProgressBar::layoutProgressLabelForHorizontal<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1056"]
  S20 -->|calls| T20
  S21["method:JobsProgressBar::layoutForCurrentState<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:327"]
  T21["method:JobsProgressBar::layoutThumb<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:742"]
  S21 -->|calls| T21
  S22["method:JobsProgressBar::layoutForCurrentState<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:327"]
  T22["method:JobsProgressBar::layoutProgressLabelForVertical<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:1098"]
  S22 -->|calls| T22
  S23["method:JobsProgressBar::autoStopIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:404"]
  T23["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S23 -->|calls| T23
  S24["method:JobsProgressBar::startAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:411"]
  T24["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S24 -->|calls| T24
  S25["method:JobsProgressBar::startAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:411"]
  T25["method:JobsProgressBar::startThumbRotationIfNeeded<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:669"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
