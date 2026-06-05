# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T1["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S1 -->|calls| T1
  S2["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T2["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S2 -->|calls| T2
  S3["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T3["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S3 -->|calls| T3
  S4["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T4["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S4 -->|calls| T4
  S5["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T5["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S5 -->|calls| T5
  S6["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T6["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  S6 -->|calls| T6
  S7["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  T7["function:legacyKeyWindowPreiOS13<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIWindowScene.swift:26"]
  S7 -->|calls| T7
  S8["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T8["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  S8 -->|calls| T8
  S9["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T9["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  S9 -->|calls| T9
  S10["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T10["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S10 -->|calls| T10
  S11["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T11["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  S11 -->|calls| T11
  S12["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T12["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  S12 -->|calls| T12
  S13["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T13["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S13 -->|calls| T13
  S14["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T14["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S14 -->|calls| T14
  S15["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T15["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S15 -->|calls| T15
  S16["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T16["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S16 -->|calls| T16
  S17["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T17["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S17 -->|calls| T17
  S18["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T18["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S18 -->|calls| T18
  S19["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T19["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S19 -->|calls| T19
  S20["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T20["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S20 -->|calls| T20
  S21["method:AttributeContainer::byUIKit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:195"]
  T21["enum_member:HTTPMethod::patch<br/>JobsByPods/JobsNetworking@Pods/Support/HTTPMethod.swift:15"]
  S21 -->|calls| T21
  S22["method:UISegmentedControl::insertSegmentByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:34"]
  T22["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:40"]
  S22 -->|calls| T22
  S23["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:40"]
  T23["method:UISegmentedControl::insertSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:40"]
  S23 -->|calls| T23
  S24["method:UISegmentedControl::removeSegmentByAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:46"]
  T24["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:52"]
  S24 -->|calls| T24
  S25["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:52"]
  T25["method:UISegmentedControl::removeSegment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISegmentedControl.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
