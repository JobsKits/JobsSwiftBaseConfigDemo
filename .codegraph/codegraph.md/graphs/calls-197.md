# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:99"]
  T1["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:28"]
  S1 -->|calls| T1
  S2["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:99"]
  T2["method:JobsTabBarCtrl::setupUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:167"]
  S2 -->|calls| T2
  S3["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:104"]
  T3["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  S3 -->|calls| T3
  S4["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T4["method:ASCollectionView::willMoveToWindow:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2414"]
  S4 -->|calls| T4
  S5["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T5["method:JobsTabBarCtrl::handleTap<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:271"]
  S5 -->|calls| T5
  S6["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T6["method:JobsTabBarCtrl::embedIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:297"]
  S6 -->|calls| T6
  S7["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T7["field:JobsTabBarCtrl::controllers<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:67"]
  S7 -->|calls| T7
  S8["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T8["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S8 -->|calls| T8
  S9["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T9["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  S9 -->|calls| T9
  S10["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T10["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  S10 -->|calls| T10
  S11["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T11["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:279"]
  S11 -->|calls| T11
  S12["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  T12["method:JobsTabBarCtrl::onButtonsBuilt<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:408"]
  S12 -->|calls| T12
  S13["method:JobsTabBarCtrl::select<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:152"]
  T13["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:279"]
  S13 -->|calls| T13
  S14["method:JobsTabBarCtrl::setupUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:167"]
  T14["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/PDFKit/PDFThumbnailView.swift:32"]
  S14 -->|calls| T14
  S15["method:JobsTabBarCtrl::setupUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:167"]
  T15["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S15 -->|calls| T15
  S16["method:JobsTabBarCtrl::setupUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:167"]
  T16["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S16 -->|calls| T16
  S17["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  T17["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S17 -->|calls| T17
  S18["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  T18["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S18 -->|calls| T18
  S19["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  T19["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  S19 -->|calls| T19
  S20["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  T20["method:JobsTabBarCtrl::onButtonsLayouted<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:412"]
  S20 -->|calls| T20
  S21["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  T21["method:JobsTabBarCtrl::layoutPages<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:256"]
  S21 -->|calls| T21
  S22["method:JobsTabBarCtrl::layoutUI<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:174"]
  T22["method:JobsTabBarCtrl::syncContentOffset<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:285"]
  S22 -->|calls| T22
  S23["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  T23["field:JobsTabBarCtrl::buttons<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:66"]
  S23 -->|calls| T23
  S24["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  T24["variable:frames<br/>Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/mini/debugger-engine.c:1854"]
  S24 -->|calls| T24
  S25["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  T25["variable:frames<br/>Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/mini/debugger-engine.c:1854"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
