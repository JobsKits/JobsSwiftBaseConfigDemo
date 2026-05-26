# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T1["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  S1 -->|calls| T1
  S2["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T2["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S2 -->|calls| T2
  S3["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T3["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S3 -->|calls| T3
  S4["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T4["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S4 -->|calls| T4
  S5["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T5["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S5 -->|calls| T5
  S6["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T6["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S6 -->|calls| T6
  S7["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T7["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S7 -->|calls| T7
  S8["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T8["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S8 -->|calls| T8
  S9["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T9["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S9 -->|calls| T9
  S10["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  T10["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S10 -->|calls| T10
  S11["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T11["method:UIResponder::jobsCurrentFirstResponder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:20"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T12["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T13["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  S13 -->|calls| T13
  S14["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T14["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S14 -->|calls| T14
  S15["class:JobsAnyNotificationToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:89"]
  T15["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S15 -->|calls| T15
  S16["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  T16["method:CrashLogCenter::append<br/>JobsByPods/JobsSwiftTools@Pods/CrashLogCenter.swift:104"]
  S16 -->|calls| T16
  S17["method:JobsNotiTokenBag::cancelAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:104"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:JobsNotiTokenBag::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:110"]
  T18["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S18 -->|calls| T18
  S19["method:JobsNotiTokenBag::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:110"]
  T19["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S19 -->|calls| T19
  S20["class:JobsNotiTokenBag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:96"]
  T20["method:JobsNotiTokenBag::cancelAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:104"]
  S20 -->|calls| T20
  S21["method:NSObject::jobs_store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:130"]
  T21["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  S21 -->|calls| T21
  S22["method:NSObject::jobs_cancelAllTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:134"]
  T22["method:JobsNotiTokenBag::cancelAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:104"]
  S22 -->|calls| T22
  S23["method:NSObject::jobs_cancelTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:138"]
  T23["method:JobsNotiTokenBag::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:110"]
  S23 -->|calls| T23
  S24["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  T24["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S24 -->|calls| T24
  S25["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  T25["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
