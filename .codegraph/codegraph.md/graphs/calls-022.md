# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  T1["method:NSObject::jobs_store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:130"]
  S1 -->|calls| T1
  S2["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:179"]
  T2["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  S2 -->|calls| T2
  S3["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:179"]
  T3["method:NSObject::jobs_store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:130"]
  S3 -->|calls| T3
  S4["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:219"]
  T4["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:219"]
  S4 -->|calls| T4
  S5["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:224"]
  T5["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:224"]
  S5 -->|calls| T5
  S6["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:229"]
  T6["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:229"]
  S6 -->|calls| T6
  S7["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:234"]
  T7["function:onMainImmediateOrAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:245"]
  S7 -->|calls| T7
  S8["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:234"]
  T8["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:234"]
  S8 -->|calls| T8
  S9["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:253"]
  T9["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  S9 -->|calls| T9
  S10["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:265"]
  T10["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  S10 -->|calls| T10
  S11["method:NSObject::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:277"]
  T11["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  S11 -->|calls| T11
  S12["method:NSObject::onNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:289"]
  T12["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:166"]
  S12 -->|calls| T12
  S13["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:300"]
  T13["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  S13 -->|calls| T13
  S14["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:312"]
  T14["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  S14 -->|calls| T14
  S15["method:NSObject::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:324"]
  T15["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  S15 -->|calls| T15
  S16["method:NSObject::onNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:336"]
  T16["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:146"]
  S16 -->|calls| T16
  S17["method:NSObject::removeAllNotifications<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:368"]
  T17["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S17 -->|calls| T17
  S18["method:NSObject::removeAllNotifications<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:368"]
  T18["method:NSObject::jobs_cancelAllTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:134"]
  S18 -->|calls| T18
  S19["method:NSObject::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:375"]
  T19["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S19 -->|calls| T19
  S20["method:NSObject::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:375"]
  T20["method:NSObject::jobs_cancelTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:138"]
  S20 -->|calls| T20
  S21["method:String::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:386"]
  T21["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S21 -->|calls| T21
  S22["method:String::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:386"]
  T22["method:Notification.Name::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:400"]
  S22 -->|calls| T22
  S23["method:Notification.Name::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:400"]
  T23["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S23 -->|calls| T23
  S24["method:Notification.Name::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:400"]
  T24["method:JobsNotificationToken::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:413"]
  S24 -->|calls| T24
  S25["method:JobsNotificationToken::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:413"]
  T25["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
