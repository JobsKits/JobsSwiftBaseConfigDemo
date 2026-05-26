# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T1["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S1 -->|calls| T1
  S2["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T2["method:UINavigationController::_endPushGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:27"]
  S2 -->|calls| T2
  S3["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T3["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  S3 -->|calls| T3
  S4["method:JobsSafePresentSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:91"]
  T4["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S4 -->|calls| T4
  S5["method:JobsSafePresentSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:91"]
  T5["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  S5 -->|calls| T5
  S6["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T6["method:UIViewController::_canPresentNow<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:81"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T7["method:UIViewController::_beginPresentGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:79"]
  S7 -->|calls| T7
  S8["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T8["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S8 -->|calls| T8
  S9["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T9["method:UIViewController::_endPresentGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:80"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  T10["method:UIViewController::jobs_present_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:106"]
  S10 -->|calls| T10
  S11["class:KeyboardObserver<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:19"]
  T11["method:KeyboardObserver::onShow<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:41"]
  S11 -->|calls| T11
  S12["class:KeyboardObserver<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:19"]
  T12["method:KeyboardObserver::onHide<br/>JobsByPods/JobsSwiftBaseTools@Pods/KeyboardObserver.swift:46"]
  S12 -->|calls| T12
  S13["function:codingPathStrings<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:77"]
  T13["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S13 -->|calls| T13
  S14["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  T14["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S14 -->|calls| T14
  S15["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T15["function:codingPathStrings<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:77"]
  S15 -->|calls| T15
  S16["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T16["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S16 -->|calls| T16
  S17["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T17["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S17 -->|calls| T17
  S18["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T18["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  S18 -->|calls| T18
  S19["struct:SafeCodable<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:95"]
  T19["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S19 -->|calls| T19
  S20["struct:SafeCodableOptional<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:147"]
  T20["function:codingPathStrings<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:77"]
  S20 -->|calls| T20
  S21["struct:SafeCodableOptional<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:147"]
  T21["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S21 -->|calls| T21
  S22["struct:SafeCodableOptional<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:147"]
  T22["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  S22 -->|calls| T22
  S23["struct:SafeCodableOptional<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:147"]
  T23["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S23 -->|calls| T23
  S24["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T24["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S24 -->|calls| T24
  S25["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T25["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
