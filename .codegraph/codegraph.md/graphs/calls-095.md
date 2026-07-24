# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T1["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S1 -->|calls| T1
  S2["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T2["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S2 -->|calls| T2
  S3["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T3["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S3 -->|calls| T3
  S4["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T4["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S4 -->|calls| T4
  S5["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T5["method:ASRangeController::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  S5 -->|calls| T5
  S6["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T6["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S6 -->|calls| T6
  S7["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T7["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S7 -->|calls| T7
  S8["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T8["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S8 -->|calls| T8
  S9["method:ASRangeController::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  T9["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S9 -->|calls| T9
  S10["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T10["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S10 -->|calls| T10
  S11["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T11["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S11 -->|calls| T11
  S12["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T12["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S12 -->|calls| T12
  S13["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T13["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S13 -->|calls| T13
  S14["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  T14["function:ASRecursiveUnfairLockWillRelease<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:27"]
  S14 -->|calls| T14
  S15["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T15["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S15 -->|calls| T15
  S16["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T16["function:ASScrollDirectionInvertHorizontally<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:39"]
  S16 -->|calls| T16
  S17["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T17["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S17 -->|calls| T17
  S18["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T18["function:ASScrollDirectionInvertVertically<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:48"]
  S18 -->|calls| T18
  S19["method:ASTableLayoutController::initWithTableView:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:22"]
  T19["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S19 -->|calls| T19
  S20["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T20["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S20 -->|calls| T20
  S21["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T21["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S21 -->|calls| T21
  S22["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T22["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S22 -->|calls| T22
  S23["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T23["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S23 -->|calls| T23
  S24["method:Mutex::SetDebugNameWithObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:120"]
  T24["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S24 -->|calls| T24
  S25["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T25["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
