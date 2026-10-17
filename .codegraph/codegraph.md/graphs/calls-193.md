# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T1["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S1 -->|calls| T1
  S2["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T2["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S2 -->|calls| T2
  S3["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T3["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S3 -->|calls| T3
  S4["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T4["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S4 -->|calls| T4
  S5["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T5["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S5 -->|calls| T5
  S6["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T6["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S6 -->|calls| T6
  S7["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T7["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S7 -->|calls| T7
  S8["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T8["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S8 -->|calls| T8
  S9["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T9["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S9 -->|calls| T9
  S10["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T10["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S10 -->|calls| T10
  S11["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T11["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S11 -->|calls| T11
  S12["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T12["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  S12 -->|calls| T12
  S13["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T13["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  S13 -->|calls| T13
  S14["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  T14["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:219"]
  S14 -->|calls| T14
  S15["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  T15["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S15 -->|calls| T15
  S16["method:JobsButton::byMode<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:100"]
  T16["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S16 -->|calls| T16
  S17["method:JobsButton::byLayout<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:133"]
  T17["method:JobsButton::byRefreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:180"]
  S17 -->|calls| T17
  S18["method:JobsButton::byForegroundImage<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:140"]
  T18["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S18 -->|calls| T18
  S19["method:JobsButton::byForegroundImage<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:140"]
  T19["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S19 -->|calls| T19
  S20["method:JobsButton::byTitleLabel<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:154"]
  T20["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S20 -->|calls| T20
  S21["method:JobsButton::bySubTitleLabel<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:161"]
  T21["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S21 -->|calls| T21
  S22["method:JobsButton::byRefreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:180"]
  T22["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  S22 -->|calls| T22
  S23["method:JobsButton::byForegroundImageView<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:186"]
  T23["method:JobsButton::byRefreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:180"]
  S23 -->|calls| T23
  S24["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:219"]
  T24["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S24 -->|calls| T24
  S25["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:219"]
  T25["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
