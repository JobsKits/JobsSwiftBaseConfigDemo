# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::didScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:42"]
  T1["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S1 -->|calls| T1
  S2["method:UIScrollView::didEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:48"]
  T2["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S2 -->|calls| T2
  S3["method:UIScrollView::willBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:54"]
  T3["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S3 -->|calls| T3
  S4["method:UIScrollView::didEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:60"]
  T4["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S4 -->|calls| T4
  S5["method:UIScrollView::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:66"]
  T5["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S5 -->|calls| T5
  S6["method:UIScrollView::didScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:72"]
  T6["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S6 -->|calls| T6
  S7["method:JobsScrollViewBlocksProxy::scrollViewWillBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:90"]
  T7["method:UIScrollView::willBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:36"]
  S7 -->|calls| T7
  S8["method:JobsScrollViewBlocksProxy::scrollViewDidScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:95"]
  T8["method:UIScrollView::didScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:42"]
  S8 -->|calls| T8
  S9["method:JobsScrollViewBlocksProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:100"]
  T9["method:UIScrollView::didEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:48"]
  S9 -->|calls| T9
  S10["method:JobsScrollViewBlocksProxy::scrollViewWillBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:105"]
  T10["method:UIScrollView::willBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:54"]
  S10 -->|calls| T10
  S11["method:JobsScrollViewBlocksProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:110"]
  T11["method:UIScrollView::didEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:60"]
  S11 -->|calls| T11
  S12["method:JobsScrollViewBlocksProxy::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:115"]
  T12["method:JobsScrollViewBlocksProxy::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:115"]
  S12 -->|calls| T12
  S13["method:JobsScrollViewBlocksProxy::scrollViewDidScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:120"]
  T13["method:UIScrollView::didScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:72"]
  S13 -->|calls| T13
  S14["method:JobsScrollDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:137"]
  T14["method:JobsScrollDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:137"]
  S14 -->|calls| T14
  S15["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:143"]
  T15["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:143"]
  S15 -->|calls| T15
  S16["method:UIScrollView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:171"]
  T16["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S16 -->|calls| T16
  S17["method:UITableView::hiddenSeparator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:533"]
  T17["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S17 -->|calls| T17
  S18["method:UITableView::sectionConner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:537"]
  T18["method:UICollectionViewCell::byBackgroundView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:36"]
  S18 -->|calls| T18
  S19["method:UITableView::sectionConner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:537"]
  T19["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S19 -->|calls| T19
  S20["method:UITableView::sectionConner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:537"]
  T20["method:UIView::byInsertSublayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:427"]
  S20 -->|calls| T20
  S21["method:UITableView::sectionConner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:537"]
  T21["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsByQuartzCore@Pods/CAShapeLayer.swift:23"]
  S21 -->|calls| T21
  S22["method:UITableView::sectionConner<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:537"]
  T22["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsByQuartzCore@Pods/CAKeyframeAnimation.swift:20"]
  S22 -->|calls| T22
  S23["method:UITableView::byReloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DSL.swift:627"]
  T23["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S23 -->|calls| T23
  S24["method:UITableView::byDequeueReusableCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DequeueReusable.swift:47"]
  T24["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S24 -->|calls| T24
  S25["method:UITableView::byDequeueReusableCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DequeueReusable.swift:47"]
  T25["method:UITableView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
