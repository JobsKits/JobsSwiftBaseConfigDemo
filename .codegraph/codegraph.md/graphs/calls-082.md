# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T1["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S1 -->|calls| T1
  S2["method:ASTableView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1855"]
  T2["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S2 -->|calls| T2
  S3["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T3["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S3 -->|calls| T3
  S4["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T4["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:709"]
  S4 -->|calls| T4
  S5["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T5["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S5 -->|calls| T5
  S6["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T6["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S6 -->|calls| T6
  S7["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T7["method:ASTableNode::deselectRowAtIndexPath:animated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableNode.mm:599"]
  S7 -->|calls| T7
  S8["method:ASTableView::nodeDidInvalidateSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1940"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T9["method:ASTableView::beginUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:686"]
  S9 -->|calls| T9
  S10["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T10["method:ASTableView::endUpdates<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:698"]
  S10 -->|calls| T10
  S11["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T11["method:ASRangeController::updateRanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S11 -->|calls| T11
  S12["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T12["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S12 -->|calls| T12
  S13["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T13["method:ASRangeController::updateRanges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S13 -->|calls| T13
  S14["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T14["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S14 -->|calls| T14
  S15["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:2040"]
  T15["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:739"]
  S15 -->|calls| T15
  S16["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:2040"]
  T16["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:2040"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T17["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T18["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T19["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T21["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T22["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T23["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T25["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
