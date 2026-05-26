# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PHPickerViewController::byPresent<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:119"]
  T1["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S1 -->|calls| T1
  S2["method:CAGradientLayer::byInsert<br/>JobsByPods/JobsByQuartzCore@Pods/CAGradientLayer.swift:81"]
  T2["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S2 -->|calls| T2
  S3["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T3["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S3 -->|calls| T3
  S4["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T4["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S4 -->|calls| T4
  S5["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T5["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S5 -->|calls| T5
  S6["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T6["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S6 -->|calls| T6
  S7["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T7["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S7 -->|calls| T7
  S8["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T8["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S8 -->|calls| T8
  S9["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T9["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S9 -->|calls| T9
  S10["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T10["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S10 -->|calls| T10
  S11["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T11["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S11 -->|calls| T11
  S12["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T12["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S12 -->|calls| T12
  S13["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T13["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S13 -->|calls| T13
  S14["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T14["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S14 -->|calls| T14
  S15["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T15["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S15 -->|calls| T15
  S16["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T16["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S16 -->|calls| T16
  S17["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T17["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S17 -->|calls| T17
  S18["method:CATransform3D::jobs_isAlmostEqual<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:114"]
  T18["function:CATransform3D::jobs_isAlmostEqual::eq<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:115"]
  S18 -->|calls| T18
  S19["method:CATransform3D::jobs_cardFlipY<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:125"]
  T19["method:CATransform3D::byRotateY<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:78"]
  S19 -->|calls| T19
  S20["method:CATransform3D::jobs_cardFlipY<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:125"]
  T20["method:CATransform3D::byPerspective<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:94"]
  S20 -->|calls| T20
  S21["method:CATransform3D::jobs_cardFlipY<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:125"]
  T21["method:CATransform3D::jobs<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:20"]
  S21 -->|calls| T21
  S22["method:CATransform3D::jobs_pushIn<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:131"]
  T22["method:CATransform3D::byScale<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:67"]
  S22 -->|calls| T22
  S23["method:CATransform3D::jobs_pushIn<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:131"]
  T23["method:CATransform3D::byTranslate<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:62"]
  S23 -->|calls| T23
  S24["method:CATransform3D::jobs_pushIn<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:131"]
  T24["method:CATransform3D::byPerspective<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:94"]
  S24 -->|calls| T24
  S25["method:CATransform3D::jobs_pushIn<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:131"]
  T25["method:CATransform3D::jobs<br/>JobsByPods/JobsByQuartzCore@Pods/CATransform3D.swift:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
