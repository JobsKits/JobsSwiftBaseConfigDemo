# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  T1["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S1 -->|calls| T1
  S2["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  T2["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S2 -->|calls| T2
  S3["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  T3["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S3 -->|calls| T3
  S4["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  T4["method:UIView::byContentMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:211"]
  S4 -->|calls| T4
  S5["method:JobsLottieRefreshView::jobs_setupLottieRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsLottieRefreshView/JobsLottieRefreshView.swift:155"]
  T5["method:LottieAnimationView::byBackgroundBehavior<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:153"]
  S5 -->|calls| T5
  S6["class:JobsSystemRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:18"]
  T6["method:UIActivityIndicatorView::byHidesWhenStopped<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:28"]
  S6 -->|calls| T6
  S7["class:JobsSystemRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:18"]
  T7["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S7 -->|calls| T7
  S8["class:JobsSystemRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:18"]
  T8["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S8 -->|calls| T8
  S9["class:JobsSystemRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:18"]
  T9["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S9 -->|calls| T9
  S10["class:JobsSystemRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:18"]
  T10["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S10 -->|calls| T10
  S11["method:JobsSystemRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:69"]
  T11["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S11 -->|calls| T11
  S12["method:JobsSystemRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:69"]
  T12["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S12 -->|calls| T12
  S13["method:JobsSystemRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:69"]
  T13["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S13 -->|calls| T13
  S14["method:JobsSystemRefreshView::refreshAnimatorApply<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsSystemRefreshView/JobsSystemRefreshView.swift:69"]
  T14["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S14 -->|calls| T14
  S15["class:JobsTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:19"]
  T15["method:JobsTodayNewsRefreshView::jobs_setupTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:167"]
  S15 -->|calls| T15
  S16["class:JobsTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:19"]
  T16["method:JobsTodayNewsRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:70"]
  S16 -->|calls| T16
  S17["class:JobsTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:19"]
  T17["method:JobsTodayNewsRefreshView::jobs_setupTodayNewsRefreshView<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:167"]
  S17 -->|calls| T17
  S18["method:JobsTodayNewsRefreshView::layoutSubviews<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:54"]
  T18["method:JobsTodayNewsRefreshView::jobs_layoutMark<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:225"]
  S18 -->|calls| T18
  S19["method:JobsTodayNewsRefreshView::layoutSubviews<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:54"]
  T19["method:JobsTodayNewsRefreshView::jobs_installAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:269"]
  S19 -->|calls| T19
  S20["method:JobsTodayNewsRefreshView::didMoveToWindow<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:64"]
  T20["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  S20 -->|calls| T20
  S21["method:JobsTodayNewsRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:70"]
  T21["method:JobsTodayNewsRefreshView::jobs_removeAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:386"]
  S21 -->|calls| T21
  S22["method:JobsTodayNewsRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:70"]
  T22["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  S22 -->|calls| T22
  S23["method:JobsTodayNewsRefreshView::byStart<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:92"]
  T23["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  S23 -->|calls| T23
  S24["method:JobsTodayNewsRefreshView::byPause<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:100"]
  T24["method:JobsTodayNewsRefreshView::jobs_pauseAnimations<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:367"]
  S24 -->|calls| T24
  S25["method:JobsTodayNewsRefreshView::byResume<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:108"]
  T25["method:JobsTodayNewsRefreshView::jobs_syncAnimationState<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsTodayNewsRefreshView/JobsTodayNewsRefreshView.swift:204"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
