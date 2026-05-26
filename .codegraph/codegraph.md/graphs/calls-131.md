# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T1["method:JobsNavBar.Style::byHairlineHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:307"]
  S1 -->|calls| T1
  S2["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T2["method:UIButton::byTapSound<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+声音.swift:44"]
  S2 -->|calls| T2
  S3["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T3["method:JXSegmentedView::byContentEdgeInsets<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedView.swift:79"]
  S3 -->|calls| T3
  S4["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T4["method:BRPickerTheme::byTitleColor<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:71"]
  S4 -->|calls| T4
  S5["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T5["method:GKNavigationBarConfigure::byTitleFont<br/>JobsByPods/JobsBy3rdTools@Pods/GKNavigationBarSwift+DSL.swift:119"]
  S5 -->|calls| T5
  S6["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T6["method:BRBasePicker::byTitle<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:26"]
  S6 -->|calls| T6
  S7["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T7["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:19"]
  S7 -->|calls| T7
  S8["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T8["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S8 -->|calls| T8
  S9["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T9["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S9 -->|calls| T9
  S10["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T10["method:UIView::jobs_hasVisibleTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:45"]
  S10 -->|calls| T10
  S11["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T11["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S11 -->|calls| T11
  S12["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T12["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S12 -->|calls| T12
  S13["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T13["method:Dictionary::stringValue<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Dictionary.swift:23"]
  S13 -->|calls| T13
  S14["method:BaseWebVC::loadView<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:136"]
  T14["method:BaseWebVC::loadView<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:136"]
  S14 -->|calls| T14
  S15["method:BaseWebVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:141"]
  T15["method:BaseWebVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:141"]
  S15 -->|calls| T15
  S16["method:BaseWebVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:141"]
  T16["method:BaseWebView::loadBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:261"]
  S16 -->|calls| T16
  S17["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T17["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S17 -->|calls| T17
  S18["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T18["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S18 -->|calls| T18
  S19["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T19["method:UIView::byClipsToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:51"]
  S19 -->|calls| T19
  S20["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T20["method:UIScrollView::byAlwaysBounceHorizontal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:49"]
  S20 -->|calls| T20
  S21["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T21["method:UIScrollView::byShowsHorizontalScrollIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:31"]
  S21 -->|calls| T21
  S22["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T22["method:UIScrollView::byAlwaysBounceHorizontal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:49"]
  S22 -->|calls| T22
  S23["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T23["method:UIScrollView::byDirectionalLockEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:67"]
  S23 -->|calls| T23
  S24["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T24["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S24 -->|calls| T24
  S25["class:JobsTabBarCtrl<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:20"]
  T25["method:JXSegmentedIndicatorBaseView::byScrollEnabled<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorBaseView.swift:62"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
