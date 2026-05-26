# `calls 符号关系 - 145`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T1["method:JobsNavBar::relayoutTitleConstraints<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:204"]
  S1 -->|calls| T1
  S2["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T2["method:JobsNavBar::rebuildBackButton<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:218"]
  S2 -->|calls| T2
  S3["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T3["method:JobsNavBar::rebuildBackButton<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:218"]
  S3 -->|calls| T3
  S4["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T4["method:JobsNavBar::refreshTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:194"]
  S4 -->|calls| T4
  S5["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T5["method:UIView::byAddTo<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:39"]
  S5 -->|calls| T5
  S6["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T6["method:UIView::byAddTo<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:39"]
  S6 -->|calls| T6
  S7["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T7["method:JobsNavBar.Style::byBackgroundColor<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:297"]
  S7 -->|calls| T7
  S8["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T8["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:66"]
  S8 -->|calls| T8
  S9["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T9["method:UIView::byAddTo<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:39"]
  S9 -->|calls| T9
  S10["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T10["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S10 -->|calls| T10
  S11["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T11["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S11 -->|calls| T11
  S12["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T12["method:UIView::byAddTo<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:39"]
  S12 -->|calls| T12
  S13["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T13["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S13 -->|calls| T13
  S14["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T14["method:JobsNavBar::applyStyle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:185"]
  S14 -->|calls| T14
  S15["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T15["method:JobsNavBar::relayoutTitleConstraints<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:204"]
  S15 -->|calls| T15
  S16["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T16["method:JobsNavBar::showLoadingTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:42"]
  S16 -->|calls| T16
  S17["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T17["method:JobsNavBar::applyStyle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:185"]
  S17 -->|calls| T17
  S18["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T18["method:JobsNavBar::relayoutTitleConstraints<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:204"]
  S18 -->|calls| T18
  S19["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T19["method:JobsNavBar::showLoadingTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:42"]
  S19 -->|calls| T19
  S20["method:JobsNavBar::jobsNavBarRefresh<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:136"]
  T20["method:JobsNavBar::rebuildBackButton<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:218"]
  S20 -->|calls| T20
  S21["method:JobsNavBar::jobsNavBarRefresh<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:136"]
  T21["method:JobsNavBar::refreshTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:194"]
  S21 -->|calls| T21
  S22["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T22["method:JobsNavBar::_jobsMakeTitleAttr<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:145"]
  S22 -->|calls| T22
  S23["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T23["method:JobsNavBar::_jobsMakeTitleAttr<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:145"]
  S23 -->|calls| T23
  S24["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T24["method:JobsNavBar::_jobsMakeTitleAttr<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:145"]
  S24 -->|calls| T24
  S25["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T25["method:JobsNavBar::_jobsMakeTitleAttr<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:145"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
