# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::bySideRefresh<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:171"]
  T1["method:JobsSlot::attach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:100"]
  S1 -->|calls| T1
  S2["method:UIScrollView::switchSideRefresh<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:194"]
  T2["method:JobsSlot::beginRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:185"]
  S2 -->|calls| T2
  S3["method:UIScrollView::switchSideRefresh<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:194"]
  T3["method:JobsSlot::detach<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:107"]
  S3 -->|calls| T3
  S4["method:UIScrollView::byRefreshFeedback<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:215"]
  T4["method:UIScrollView::jobs_playHapticImpact<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:233"]
  S4 -->|calls| T4
  S5["method:UIScrollView::byRefreshFeedback<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:215"]
  T5["method:UIScrollView::jobs_playSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:243"]
  S5 -->|calls| T5
  S6["method:UIScrollView::jobs_playSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:243"]
  T6["method:UIScrollView::jobs_resolveSoundURL<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:269"]
  S6 -->|calls| T6
  S7["method:UIScrollView::jobs_playSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:243"]
  T7["method:UIScrollView::jobs_playSystemSound<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:287"]
  S7 -->|calls| T7
  S8["method:UIScrollView::jobs_resolveSoundURL<br/>JobsByPods/JobsRefresher@Pods/UIScrollView+JobsRefresher.swift:269"]
  T8["enum_member:JobsImageSource::url<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:20"]
  S8 -->|calls| T8
  S9["enum:JobsScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:32"]
  T9["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S9 -->|calls| T9
  S10["enum:JobsScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:32"]
  T10["method:JobsScale::scaleFromBreakpoints<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:119"]
  S10 -->|calls| T10
  S11["enum:JobsScale<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:32"]
  T11["method:JobsScale::clamp<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:134"]
  S11 -->|calls| T11
  S12["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  T12["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:115"]
  S12 -->|calls| T12
  S13["class:BinaryInteger<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:141"]
  T13["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S13 -->|calls| T13
  S14["class:BinaryInteger<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:141"]
  T14["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S14 -->|calls| T14
  S15["class:BinaryInteger<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:141"]
  T15["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S15 -->|calls| T15
  S16["class:BinaryFloatingPoint<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:150"]
  T16["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S16 -->|calls| T16
  S17["class:BinaryFloatingPoint<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:150"]
  T17["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S17 -->|calls| T17
  S18["class:BinaryFloatingPoint<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:150"]
  T18["method:JobsScale::pixelAlign<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:125"]
  S18 -->|calls| T18
  S19["enum:Screen<br/>JobsByPods/JobsScale@Pods/JobsScale.swift:157"]
  T19["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S19 -->|calls| T19
  S20["function:presentAlert<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:27"]
  T20["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S20 -->|calls| T20
  S21["function:presentAlert<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:27"]
  T21["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:91"]
  S21 -->|calls| T21
  S22["function:presentAlert<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:27"]
  T22["method:UIAlertController::makeAlert<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:35"]
  S22 -->|calls| T22
  S23["method:AppLaunchManager::handleLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:46"]
  T23["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  S23 -->|calls| T23
  S24["method:AppLaunchManager::handleLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:46"]
  T24["enum_member:GestureNodeView::State::normal<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:14"]
  S24 -->|calls| T24
  S25["method:LaunchChecker::markAndClassifyThisLaunch<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:77"]
  T25["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
