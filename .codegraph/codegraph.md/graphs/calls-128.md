# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T1["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S1 -->|calls| T1
  S2["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T2["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S2 -->|calls| T2
  S3["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T3["method:UIView::byClipsToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:51"]
  S3 -->|calls| T3
  S4["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T4["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S4 -->|calls| T4
  S5["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T5["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S5 -->|calls| T5
  S6["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T6["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S6 -->|calls| T6
  S7["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T7["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S7 -->|calls| T7
  S8["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T8["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S8 -->|calls| T8
  S9["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T9["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S9 -->|calls| T9
  S10["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T10["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S10 -->|calls| T10
  S11["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T11["method:CATextLayer::byFont<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:26"]
  S11 -->|calls| T11
  S12["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T12["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S12 -->|calls| T12
  S13["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T13["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S13 -->|calls| T13
  S14["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T14["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  S14 -->|calls| T14
  S15["class:JobsButton<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:19"]
  T15["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  S15 -->|calls| T15
  S16["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  T16["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:221"]
  S16 -->|calls| T16
  S17["method:JobsButton::commonInit<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:92"]
  T17["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S17 -->|calls| T17
  S18["method:JobsButton::byMode<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:101"]
  T18["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S18 -->|calls| T18
  S19["method:JobsButton::byLayout<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:134"]
  T19["method:JobsButton::byRefreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:181"]
  S19 -->|calls| T19
  S20["method:JobsButton::byForegroundImage<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:141"]
  T20["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S20 -->|calls| T20
  S21["method:JobsButton::byTitleLabel<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:155"]
  T21["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S21 -->|calls| T21
  S22["method:JobsButton::bySubTitleLabel<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:162"]
  T22["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S22 -->|calls| T22
  S23["method:JobsButton::byRefreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:181"]
  T23["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  S23 -->|calls| T23
  S24["method:JobsButton::byForegroundImageView<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:187"]
  T24["method:JobsButton::byRefreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:181"]
  S24 -->|calls| T24
  S25["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:221"]
  T25["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:231"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
