# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T1["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S1 -->|calls| T1
  S2["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T2["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S2 -->|calls| T2
  S3["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T3["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S3 -->|calls| T3
  S4["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T4["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S4 -->|calls| T4
  S5["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T5["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S5 -->|calls| T5
  S6["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T6["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S6 -->|calls| T6
  S7["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T7["variable:copy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S7 -->|calls| T7
  S8["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T8["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S8 -->|calls| T8
  S9["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T9["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S9 -->|calls| T9
  S10["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T10["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  S10 -->|calls| T10
  S11["method:ASRangeController::scheduledNodesDidDisplay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:452"]
  T11["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S11 -->|calls| T11
  S12["method:ASRangeController::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:516"]
  T12["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S12 -->|calls| T12
  S13["method:ASRangeController::clearPreloadedData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:527"]
  T13["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S13 -->|calls| T13
  S14["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  T14["method:ASRangeController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  S14 -->|calls| T14
  S15["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  T15["method:ASRangeController::registerSharedApplicationNotifications<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:551"]
  S15 -->|calls| T15
  S16["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T16["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S16 -->|calls| T16
  S17["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T17["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S17 -->|calls| T17
  S18["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T18["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S18 -->|calls| T18
  S19["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T19["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S19 -->|calls| T19
  S20["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T20["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S20 -->|calls| T20
  S21["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T21["method:ASWeakSet::allObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S21 -->|calls| T21
  S22["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T22["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S22 -->|calls| T22
  S23["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T23["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S23 -->|calls| T23
  S24["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T24["method:ASRangeController::interfaceState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S24 -->|calls| T24
  S25["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T25["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
