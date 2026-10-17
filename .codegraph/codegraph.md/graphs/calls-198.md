# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  T1["variable:frames<br/>Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/mini/debugger-engine.c:1854"]
  S1 -->|calls| T1
  S2["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  T2["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S2 -->|calls| T2
  S3["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:201"]
  T3["field:JobsTabBarCtrl::buttons<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:66"]
  S3 -->|calls| T3
  S4["method:JobsTabBarCtrl::layoutPages<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:256"]
  T4["method:UIScrollView::byContentSize<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:19"]
  S4 -->|calls| T4
  S5["method:JobsTabBarCtrl::layoutPages<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:256"]
  T5["method:ASLayoutSpec::setChildren:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:106"]
  S5 -->|calls| T5
  S6["method:JobsTabBarCtrl::layoutPages<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:256"]
  T6["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S6 -->|calls| T6
  S7["method:JobsTabBarCtrl::layoutPages<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:256"]
  T7["method:UIScrollView::byContentSize<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:19"]
  S7 -->|calls| T7
  S8["method:JobsTabBarCtrl::handleTap<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:271"]
  T8["method:JobsTabBarCtrl::select<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:152"]
  S8 -->|calls| T8
  S9["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:279"]
  T9["method:JobsTabBarCtrl::syncContentOffset<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:285"]
  S9 -->|calls| T9
  S10["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:279"]
  T10["method:JobsTabBarCtrl::scrollTabBarToVisible<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:291"]
  S10 -->|calls| T10
  S11["method:JobsTabBarCtrl::syncContentOffset<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:285"]
  T11["method:ASCollectionNode::setContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:723"]
  S11 -->|calls| T11
  S12["method:JobsTabBarCtrl::scrollTabBarToVisible<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:291"]
  T12["field:JobsTabBarCtrl::buttons<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:66"]
  S12 -->|calls| T12
  S13["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T13["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S13 -->|calls| T13
  S14["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T14["method:UIScrollView::byShowsVerticalScrollIndicator<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:25"]
  S14 -->|calls| T14
  S15["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T15["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S15 -->|calls| T15
  S16["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T16["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S16 -->|calls| T16
  S17["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T17["method:UIScrollView::byShowsVerticalScrollIndicator<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:25"]
  S17 -->|calls| T17
  S18["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T18["method:UIScrollView::byAlwaysBounceVertical<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:43"]
  S18 -->|calls| T18
  S19["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  T19["method:JobsTabBarCtrl::suppressVertical<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:308"]
  S19 -->|calls| T19
  S20["method:JobsTabBarCtrl::scrollViewDidEndDecelerating<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:336"]
  T20["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:279"]
  S20 -->|calls| T20
  S21["method:JobsTabBarCtrl::scrollViewDidEndScrollingAnimation<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:345"]
  T21["method:JobsTabBarCtrl::applySelectionState<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:279"]
  S21 -->|calls| T21
  S22["method:JobsTabBarCtrl::byDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:417"]
  T22["method:JobsTabBarCtrl::setDataSource<br/>JobsByPods/JobsInheritance@Pods/UIViewController/JobsTabBarCtrl.swift:109"]
  S22 -->|calls| T22
  S23["struct:AnyDecodable<br/>JobsByPods/JobsInheritance@Pods/UIWebView/AnyDecodable.swift:11"]
  T23["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S23 -->|calls| T23
  S24["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:19"]
  T24["method:BaseWebView::acceptsBridgeMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:43"]
  S24 -->|calls| T24
  S25["method:BaseWebView::userContentController<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:19"]
  T25["method:BaseWebView::handleScriptMessage<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Bridge.swift:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
