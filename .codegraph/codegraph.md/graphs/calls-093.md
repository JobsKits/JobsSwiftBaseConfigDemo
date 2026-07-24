# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T1["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  S1 -->|calls| T1
  S2["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T2["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  S2 -->|calls| T2
  S3["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T3["function:ASPageCoordinateGetX<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S3 -->|calls| T3
  S4["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T4["function:ASPageCoordinateGetY<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S4 -->|calls| T4
  S5["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T5["function:ASPageCoordinateGetX<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S5 -->|calls| T5
  S6["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T6["function:ASPageCoordinateGetY<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S6 -->|calls| T6
  S7["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T7["function:ASPageCoordinateMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:11"]
  S7 -->|calls| T7
  S8["method:NSMapTable::pageTableWithLayoutAttributes:contentSize:pageSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:109"]
  T8["method:NSMapTable::pageTableForStrongObjectPointers<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:89"]
  S8 -->|calls| T8
  S9["method:NSMapTable::pageTableWithLayoutAttributes:contentSize:pageSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:109"]
  T9["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S9 -->|calls| T9
  S10["method:NSMapTable::pageTableWithLayoutAttributes:contentSize:pageSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:109"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:NSMapTable::setObject:forPage:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPageTable.mm:135"]
  T11["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S11 -->|calls| T11
  S12["method:ASPhotosFrameworkImageRequest::initWithAssetIdentifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPhotosFrameworkImageRequest.mm:41"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASRangeController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  T13["method:ASRangeController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  S13 -->|calls| T13
  S14["method:ASRangeController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  T14["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S14 -->|calls| T14
  S15["method:ASRangeController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  T15["method:ASRangeController::addRangeControllerToRangeDebugOverlay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:259"]
  S15 -->|calls| T15
  S16["method:ASRangeController::rangeModeForInterfaceState:currentRangeMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:107"]
  T16["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S16 -->|calls| T16
  S17["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  T17["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S17 -->|calls| T17
  S18["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  T18["method:ASRangeController::updateRanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S18 -->|calls| T18
  S19["method:ASRangeController::updateRanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  T19["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  S19 -->|calls| T19
  S20["method:ASRangeController::updateCurrentRangeWithMode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:157"]
  T20["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S20 -->|calls| T20
  S21["method:ASRangeController::setLayoutController:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:167"]
  T21["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S21 -->|calls| T21
  S22["method:ASRangeController::setDataSource:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:175"]
  T22["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S22 -->|calls| T22
  S23["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T23["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S23 -->|calls| T23
  S24["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T24["function:ASViewToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S24 -->|calls| T24
  S25["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T25["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
