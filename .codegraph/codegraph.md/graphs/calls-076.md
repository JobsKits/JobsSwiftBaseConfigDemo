# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:124"]
  T1["method:UINavigationController::didShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:57"]
  S1 -->|calls| T1
  S2["method:JobsNavigationControllerBlocksProxy::navigationControllerPreferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:133"]
  T2["method:UINavigationController::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:66"]
  S2 -->|calls| T2
  S3["method:JobsNavigationControllerBlocksProxy::navigationControllerSupportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:139"]
  T3["method:UINavigationController::supportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:74"]
  S3 -->|calls| T3
  S4["method:UIPageControl::jobs_setIndicatorImages<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:39"]
  T4["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:88"]
  S4 -->|calls| T4
  S5["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:88"]
  T5["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  S5 -->|calls| T5
  S6["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:88"]
  T6["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  S6 -->|calls| T6
  S7["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:103"]
  T7["method:UIPageControl::jobs_setIndicatorImages<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:39"]
  S7 -->|calls| T7
  S8["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:103"]
  T8["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  S8 -->|calls| T8
  S9["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:103"]
  T9["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  S9 -->|calls| T9
  S10["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:103"]
  T10["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:241"]
  S10 -->|calls| T10
  S11["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:103"]
  T11["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:241"]
  S11 -->|calls| T11
  S12["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:103"]
  T12["method:UIPageControl::jobs_setIndicatorImages<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:39"]
  S12 -->|calls| T12
  S13["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T13["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S13 -->|calls| T13
  S14["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T14["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S14 -->|calls| T14
  S15["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T15["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S15 -->|calls| T15
  S16["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T16["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S16 -->|calls| T16
  S17["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T17["method:UIStackView::byDistribution<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:24"]
  S17 -->|calls| T17
  S18["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T18["method:UIStackView::byAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:30"]
  S18 -->|calls| T18
  S19["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:148"]
  T19["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:18"]
  S19 -->|calls| T19
  S20["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  T20["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S20 -->|calls| T20
  S21["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  T21["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S21 -->|calls| T21
  S22["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  T22["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S22 -->|calls| T22
  S23["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  T23["method:UIView::byRemakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:111"]
  S23 -->|calls| T23
  S24["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  T24["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S24 -->|calls| T24
  S25["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:187"]
  T25["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
