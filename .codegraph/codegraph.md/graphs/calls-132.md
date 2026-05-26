# `calls 符号关系 - 132`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T1["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S1 -->|calls| T1
  S2["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T2["method:JobsTextField::byDelegate<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:104"]
  S2 -->|calls| T2
  S3["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T3["method:UIScrollView::byShowsVerticalScrollIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:25"]
  S3 -->|calls| T3
  S4["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T4["method:UIScrollView::byShowsHorizontalScrollIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:31"]
  S4 -->|calls| T4
  S5["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T5["method:JXSegmentedListContainerView::byBounces<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:51"]
  S5 -->|calls| T5
  S6["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T6["method:JXSegmentedListContainerView::byPagingEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedListContainerView.swift:46"]
  S6 -->|calls| T6
  S7["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:98"]
  T7["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:98"]
  S7 -->|calls| T7
  S8["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:98"]
  T8["method:JobsTabBarCtrl::setupUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:170"]
  S8 -->|calls| T8
  S9["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:103"]
  T9["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:103"]
  S9 -->|calls| T9
  S10["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:103"]
  T10["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:177"]
  S10 -->|calls| T10
  S11["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T11["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S11 -->|calls| T11
  S12["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T13["method:JobsTabBarCtrl::handleTap<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:280"]
  S13 -->|calls| T13
  S14["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T14["method:JobsTabBarCtrl::embedIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:306"]
  S14 -->|calls| T14
  S15["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T15["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:318"]
  S15 -->|calls| T15
  S16["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T16["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:288"]
  S16 -->|calls| T16
  S17["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:108"]
  T17["method:JobsTabBarCtrl::onButtonsBuilt<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:414"]
  S17 -->|calls| T17
  S18["method:JobsTabBarCtrl::select<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:155"]
  T18["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:288"]
  S18 -->|calls| T18
  S19["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:177"]
  T19["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:206"]
  S19 -->|calls| T19
  S20["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:177"]
  T20["method:JobsTabBarCtrl::onButtonsLayouted<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:418"]
  S20 -->|calls| T20
  S21["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:177"]
  T21["method:JobsTabBarCtrl::layoutPages<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:265"]
  S21 -->|calls| T21
  S22["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:177"]
  T22["method:JobsTabBarCtrl::syncContentOffset<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:294"]
  S22 -->|calls| T22
  S23["method:JobsTabBarCtrl::handleTap<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:280"]
  T23["method:JobsTabBarCtrl::select<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:155"]
  S23 -->|calls| T23
  S24["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:288"]
  T24["method:JobsTabBarCtrl::syncContentOffset<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:294"]
  S24 -->|calls| T24
  S25["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:288"]
  T25["method:JobsTabBarCtrl::scrollTabBarToVisible<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:300"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
