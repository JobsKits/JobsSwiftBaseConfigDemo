# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationBar::byLegacyTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:207"]
  T1["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S1 -->|calls| T1
  S2["method:UINavigationBar::byLegacyTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:218"]
  T2["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S2 -->|calls| T2
  S3["method:UINavigationBar::byLegacyLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:229"]
  T3["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S3 -->|calls| T3
  S4["method:UINavigationBar::byLegacyLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:241"]
  T4["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S4 -->|calls| T4
  S5["method:UINavigationBar::byItems<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:342"]
  T5["method:ASCollectionSectionController::setItems:animated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/ASDKgram/Sample/ASCollectionSectionController.m:42"]
  S5 -->|calls| T5
  S6["method:UINavigationController::byNavTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:20"]
  T6["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S6 -->|calls| T6
  S7["method:UINavigationController::animationControllerForOperation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:28"]
  T7["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S7 -->|calls| T7
  S8["method:UINavigationController::interactionControllerForAnimationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:39"]
  T8["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S8 -->|calls| T8
  S9["method:UINavigationController::willShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:48"]
  T9["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S9 -->|calls| T9
  S10["method:UINavigationController::didShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:57"]
  T10["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S10 -->|calls| T10
  S11["method:UINavigationController::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:66"]
  T11["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S11 -->|calls| T11
  S12["method:UINavigationController::supportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:74"]
  T12["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:143"]
  S12 -->|calls| T12
  S13["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:92"]
  T13["field:JobsNavigationControllerBlocksProxy::animationControllerForOperation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:86"]
  S13 -->|calls| T13
  S14["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:108"]
  T14["field:JobsNavigationControllerBlocksProxy::interactionControllerForAnimationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:103"]
  S14 -->|calls| T14
  S15["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:114"]
  T15["field:JobsNavigationControllerBlocksProxy::willShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:113"]
  S15 -->|calls| T15
  S16["method:JobsNavigationControllerBlocksProxy::navigationController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:122"]
  T16["field:JobsNavigationControllerBlocksProxy::didShow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:121"]
  S16 -->|calls| T16
  S17["method:JobsNavigationControllerBlocksProxy::navigationControllerPreferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:131"]
  T17["field:JobsNavigationControllerBlocksProxy::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:130"]
  S17 -->|calls| T17
  S18["method:JobsNavigationControllerBlocksProxy::navigationControllerSupportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:136"]
  T18["field:JobsNavigationControllerBlocksProxy::supportedInterfaceOrientations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:135"]
  S18 -->|calls| T18
  S19["method:UIPageControl::jobs_setIndicatorImages<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:38"]
  T19["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:86"]
  S19 -->|calls| T19
  S20["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:86"]
  T20["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:141"]
  S20 -->|calls| T20
  S21["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:86"]
  T21["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:180"]
  S21 -->|calls| T21
  S22["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:100"]
  T22["method:UIPageControl::jobs_setIndicatorImages<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:38"]
  S22 -->|calls| T22
  S23["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:100"]
  T23["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:242"]
  S23 -->|calls| T23
  S24["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:100"]
  T24["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:242"]
  S24 -->|calls| T24
  S25["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:100"]
  T25["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:232"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
