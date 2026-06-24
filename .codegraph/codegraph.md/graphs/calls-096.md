# `calls 符号关系 - 096`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T1["function:ASScrollDirectionInvertHorizontally<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:39"]
  S1 -->|calls| T1
  S2["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T2["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S2 -->|calls| T2
  S3["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T3["function:ASScrollDirectionInvertVertically<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:48"]
  S3 -->|calls| T3
  S4["method:ASTableLayoutController::initWithTableView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:22"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T5["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S5 -->|calls| T5
  S6["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T6["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S6 -->|calls| T6
  S7["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T7["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S7 -->|calls| T7
  S8["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T8["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S8 -->|calls| T8
  S9["method:Mutex::SetDebugNameWithObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:120"]
  T9["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S9 -->|calls| T9
  S10["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T10["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S10 -->|calls| T10
  S11["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T11["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S11 -->|calls| T11
  S12["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T12["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  S12 -->|calls| T12
  S13["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T13["method:Mutex::DidLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S13 -->|calls| T13
  S14["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T14["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  S14 -->|calls| T14
  S15["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T15["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  S15 -->|calls| T15
  S16["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T16["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  S16 -->|calls| T16
  S17["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T17["method:Mutex::DidLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S17 -->|calls| T17
  S18["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T18["method:Mutex::WillUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:248"]
  S18 -->|calls| T18
  S19["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T19["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  S19 -->|calls| T19
  S20["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T20["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  S20 -->|calls| T20
  S21["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T21["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  S21 -->|calls| T21
  S22["method:Mutex::WillUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:248"]
  T22["function:ASLockingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S22 -->|calls| T22
  S23["method:Mutex::DidLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:261"]
  T23["function:ASLockingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T24["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T25["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
