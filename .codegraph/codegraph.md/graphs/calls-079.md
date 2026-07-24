# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T1["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T2["function:ASLockingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T3["function:ASPointsOfInterestLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:58"]
  S3 -->|calls| T3
  S4["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  T4["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S4 -->|calls| T4
  S5["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  T5["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S5 -->|calls| T5
  S6["function:ASCollectionLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  T6["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S6 -->|calls| T6
  S7["function:ASDisplayLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  T7["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S7 -->|calls| T7
  S8["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  T8["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S8 -->|calls| T8
  S9["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  T9["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S9 -->|calls| T9
  S10["function:ASLockingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  T10["function:ASLoggingIsEnabled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S10 -->|calls| T10
  S11["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T11["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  S11 -->|calls| T11
  S12["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T12["method:ASControlNode::enableHitTestDebug<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:57"]
  S12 -->|calls| T12
  S13["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T13["property:ASDisplayNode::hitTestSlop<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.h:484"]
  S13 -->|calls| T13
  S14["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T14["function:ASLayerToDisplayNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S14 -->|calls| T14
  S15["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T15["method:ASControlNode::setEdgesOfIntersectionForChildRect:parentRect:rectEdge:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:160"]
  S15 -->|calls| T15
  S16["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T16["method:ASControlNode::setEdgesOfIntersectionForChildRect:parentRect:rectEdge:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:160"]
  S16 -->|calls| T16
  S17["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T17["method:ASControlNode::debugHighlightOverlay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:512"]
  S17 -->|calls| T17
  S18["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T18["function:ASGraphicsCreateImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S18 -->|calls| T18
  S19["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T19["method:ASControlNode::drawEdgeIfClippedWithEdges:color:borderWidth:imgRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:179"]
  S19 -->|calls| T19
  S20["method:ASControlNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T20["method:ASControlNode::drawEdgeIfClippedWithEdges:color:borderWidth:imgRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:179"]
  S20 -->|calls| T20
  S21["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  T22["method:_ASRangeDebugOverlayView::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:314"]
  S22 -->|calls| T22
  S23["method:ASRangeController::addRangeControllerToRangeDebugOverlay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:259"]
  T23["method:_ASRangeDebugOverlayView::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:314"]
  S23 -->|calls| T23
  S24["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  T24["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  S24 -->|calls| T24
  S25["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  T25["method:_ASRangeDebugOverlayView::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:314"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
