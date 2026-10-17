# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobs_cancelAllTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:133"]
  T1["method:JobsNotiTokenBag::cancelAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:104"]
  S1 -->|calls| T1
  S2["method:NSObject::jobs_cancelTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:137"]
  T2["method:JobsNotiTokenBag::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:110"]
  S2 -->|calls| T2
  S3["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:163"]
  T3["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:145"]
  S3 -->|calls| T3
  S4["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:163"]
  T4["method:NSObject::jobs_store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:129"]
  S4 -->|calls| T4
  S5["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:176"]
  T5["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:145"]
  S5 -->|calls| T5
  S6["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:176"]
  T6["method:NSObject::jobs_store<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:129"]
  S6 -->|calls| T6
  S7["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:216"]
  T7["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:216"]
  S7 -->|calls| T7
  S8["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:221"]
  T8["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:221"]
  S8 -->|calls| T8
  S9["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:226"]
  T9["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:226"]
  S9 -->|calls| T9
  S10["method:NSObject::post<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:231"]
  T10["function:onMainImmediateOrAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:245"]
  S10 -->|calls| T10
  S11["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:250"]
  T11["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:163"]
  S11 -->|calls| T11
  S12["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:262"]
  T12["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:163"]
  S12 -->|calls| T12
  S13["method:NSObject::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:274"]
  T13["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:163"]
  S13 -->|calls| T13
  S14["method:NSObject::onNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:286"]
  T14["method:NotificationCenter::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:163"]
  S14 -->|calls| T14
  S15["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:297"]
  T15["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:145"]
  S15 -->|calls| T15
  S16["method:NSObject::onObject<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:309"]
  T16["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:145"]
  S16 -->|calls| T16
  S17["method:NSObject::on<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:321"]
  T17["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:145"]
  S17 -->|calls| T17
  S18["method:NSObject::onNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:333"]
  T18["method:NotificationCenter::_onBase<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:145"]
  S18 -->|calls| T18
  S19["method:NSObject::removeAllNotifications<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:365"]
  T19["method:NSObject::jobs_cancelAllTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:133"]
  S19 -->|calls| T19
  S20["method:NSObject::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:372"]
  T20["method:NSObject::jobs_cancelTokens<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:137"]
  S20 -->|calls| T20
  S21["method:String::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:383"]
  T21["method:Name::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:397"]
  S21 -->|calls| T21
  S22["method:Name::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:397"]
  T22["method:JobsNotificationToken::removeNotification<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:410"]
  S22 -->|calls| T22
  S23["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:87"]
  T23["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:64"]
  S23 -->|calls| T23
  S24["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:94"]
  T24["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:74"]
  S24 -->|calls| T24
  S25["method:UIAlertController::byAddDestructive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:120"]
  T25["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
