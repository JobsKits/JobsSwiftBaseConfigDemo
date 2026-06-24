# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T1["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S1 -->|calls| T1
  S2["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T2["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S2 -->|calls| T2
  S3["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T3["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S3 -->|calls| T3
  S4["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T4["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S4 -->|calls| T4
  S5["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T5["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S5 -->|calls| T5
  S6["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T6["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S6 -->|calls| T6
  S7["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T7["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S7 -->|calls| T7
  S8["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T8["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S8 -->|calls| T8
  S9["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T9["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S9 -->|calls| T9
  S10["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T10["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S10 -->|calls| T10
  S11["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T11["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S11 -->|calls| T11
  S12["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T12["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S12 -->|calls| T12
  S13["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T13["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S13 -->|calls| T13
  S14["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T14["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S14 -->|calls| T14
  S15["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T15["method:ASRangeController::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  S15 -->|calls| T15
  S16["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T16["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S16 -->|calls| T16
  S17["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T17["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S17 -->|calls| T17
  S18["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T18["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S18 -->|calls| T18
  S19["method:ASRangeController::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  T19["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S19 -->|calls| T19
  S20["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T20["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S20 -->|calls| T20
  S21["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T21["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S21 -->|calls| T21
  S22["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T22["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S22 -->|calls| T22
  S23["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T23["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S23 -->|calls| T23
  S24["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  T24["function:ASRecursiveUnfairLockWillRelease<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:27"]
  S24 -->|calls| T24
  S25["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T25["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
