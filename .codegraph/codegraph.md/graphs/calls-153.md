# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T1["method:JobsProgressBar::updateDragGestureEnabled<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:526"]
  S1 -->|calls| T1
  S2["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T2["method:UIView::byAddTo<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:30"]
  S2 -->|calls| T2
  S3["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T3["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:24"]
  S3 -->|calls| T3
  S4["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T4["method:UIView::byBackgroundColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S4 -->|calls| T4
  S5["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T5["method:UIView::byAddTo<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:30"]
  S5 -->|calls| T5
  S6["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T6["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:24"]
  S6 -->|calls| T6
  S7["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T7["method:UIView::byBackgroundColor<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S7 -->|calls| T7
  S8["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T8["method:UIView::byAddTo<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:30"]
  S8 -->|calls| T8
  S9["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T9["method:UIView::byClipsToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:51"]
  S9 -->|calls| T9
  S10["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T10["method:UIView::byHidden<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:64"]
  S10 -->|calls| T10
  S11["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T11["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S11 -->|calls| T11
  S12["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T12["method:CALayer::byBorderWidth<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:207"]
  S12 -->|calls| T12
  S13["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T13["method:CALayer::byBorderColor<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:213"]
  S13 -->|calls| T13
  S14["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T14["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:24"]
  S14 -->|calls| T14
  S15["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T15["method:CALayer::byOpacity<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:226"]
  S15 -->|calls| T15
  S16["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T16["method:UIPanGestureRecognizer::byMaxTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:157"]
  S16 -->|calls| T16
  S17["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T17["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S17 -->|calls| T17
  S18["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T18["method:JobsProgressBar::stopAutoProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:451"]
  S18 -->|calls| T18
  S19["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T19["method:JobsProgressBar::displayProgress<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:574"]
  S19 -->|calls| T19
  S20["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T20["method:JobsProgressBar::rawProgressValue<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:564"]
  S20 -->|calls| T20
  S21["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T21["method:JobsProgressBar::axisSpeed<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:590"]
  S21 -->|calls| T21
  S22["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T22["method:JobsProgressBar::rotationDuration<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:599"]
  S22 -->|calls| T22
  S23["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T23["method:JobsProgressBar::setThumbDraggingUI<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:627"]
  S23 -->|calls| T23
  S24["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T24["method:JobsProgressBar::displayProgressValue<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:554"]
  S24 -->|calls| T24
  S25["class:JobsProgressBar<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:26"]
  T25["method:JobsProgressBar::updateRotationDirectionByDisplayDelta<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBar.swift:610"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
