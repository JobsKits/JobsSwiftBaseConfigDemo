# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:121"]
  T1["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:93"]
  S1 -->|calls| T1
  S2["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:121"]
  T2["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S2 -->|calls| T2
  S3["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T3["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S3 -->|calls| T3
  S4["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T4["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S4 -->|calls| T4
  S5["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T5["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S5 -->|calls| T5
  S6["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T6["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S6 -->|calls| T6
  S7["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T7["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S7 -->|calls| T7
  S8["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T8["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S8 -->|calls| T8
  S9["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  T9["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:126"]
  S9 -->|calls| T9
  S10["method:NSObject::jobsValueVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:47"]
  T10["property:NSObject::jobsVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:61"]
  S10 -->|calls| T10
  S11["method:NSObject::jobsValueAnyVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:96"]
  T11["property:NSObject::jobsAnyVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:110"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsValueAnyArgsVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:146"]
  T12["property:NSObject::jobsAnyArgsVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:164"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsValueAnyArgsVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:150"]
  T13["property:NSObject::jobsAnyArgsVoidCallback<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+万物回调.swift:164"]
  S13 -->|calls| T13
  S14["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T14["method:UIResponder::jobsCurrentFirstResponder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:20"]
  S14 -->|calls| T14
  S15["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T15["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T16["method:UIResponder::jobsNearestVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIResponder.swift:30"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsDismissKeyboard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+软键盘退出.swift:17"]
  T17["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  S17 -->|calls| T17
  S18["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  T18["field:JobsAnyNotificationToken::_cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:90"]
  S18 -->|calls| T18
  S19["class:JobsAnyNotificationToken<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:89"]
  T19["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S19 -->|calls| T19
  S20["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  T20["field:JobsNotiTokenBag::tokensByName<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:98"]
  S20 -->|calls| T20
  S21["method:JobsNotiTokenBag::cancelAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:104"]
  T21["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S21 -->|calls| T21
  S22["method:JobsNotiTokenBag::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:110"]
  T22["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S22 -->|calls| T22
  S23["method:JobsNotiTokenBag::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:110"]
  T23["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S23 -->|calls| T23
  S24["class:JobsNotiTokenBag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:96"]
  T24["method:JobsNotiTokenBag::cancelAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:104"]
  S24 -->|calls| T24
  S25["method:NSObject::jobs_store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:129"]
  T25["method:JobsNotiTokenBag::store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:100"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
