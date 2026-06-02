# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:16"]
  T1["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S1 -->|calls| T1
  S2["function:jobsGetMainWindow<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:51"]
  T2["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:16"]
  S2 -->|calls| T2
  S3["function:jobsGetMainWindow<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:51"]
  T3["function:jobsGetMainWindowAfter13<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:33"]
  S3 -->|calls| T3
  S4["method:JobsSafePushSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:38"]
  T4["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  S4 -->|calls| T4
  S5["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T5["method:UINavigationController::_canPushNow<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:28"]
  S5 -->|calls| T5
  S6["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T6["method:UINavigationController::_beginPushGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:26"]
  S6 -->|calls| T6
  S7["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T7["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S7 -->|calls| T7
  S8["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T8["method:UINavigationController::_endPushGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:27"]
  S8 -->|calls| T8
  S9["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T9["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  S9 -->|calls| T9
  S10["method:JobsSafePresentSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:91"]
  T10["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S10 -->|calls| T10
  S11["method:JobsSafePresentSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:91"]
  T11["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T12["method:UIViewController::_canPresentNow<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:81"]
  S12 -->|calls| T12
  S13["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T13["method:UIViewController::_beginPresentGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:79"]
  S13 -->|calls| T13
  S14["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T14["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S14 -->|calls| T14
  S15["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T15["method:UIViewController::_endPresentGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:80"]
  S15 -->|calls| T15
  S16["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T16["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  S16 -->|calls| T16
  S17["class:KeyboardObserver<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:19"]
  T17["method:KeyboardObserver::onShow<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:41"]
  S17 -->|calls| T17
  S18["class:KeyboardObserver<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:19"]
  T18["method:KeyboardObserver::onHide<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:46"]
  S18 -->|calls| T18
  S19["function:codingPathStrings<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:77"]
  T19["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S19 -->|calls| T19
  S20["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  T20["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S20 -->|calls| T20
  S21["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T21["function:codingPathStrings<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:77"]
  S21 -->|calls| T21
  S22["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T22["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S22 -->|calls| T22
  S23["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T23["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S23 -->|calls| T23
  S24["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T24["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  S24 -->|calls| T24
  S25["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T25["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
