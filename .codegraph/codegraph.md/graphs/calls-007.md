# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T1["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T2["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  T3["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  S3 -->|calls| T3
  S4["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  T4["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S4 -->|calls| T4
  S5["method:_ASCollectionPendingState::tuningParametersForRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:208"]
  T5["method:_ASCollectionPendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:218"]
  S5 -->|calls| T5
  S6["method:_ASCollectionPendingState::setTuningParameters:forRangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:213"]
  T6["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S6 -->|calls| T6
  S7["method:_ASCollectionPendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:218"]
  T7["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S7 -->|calls| T7
  S8["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  T8["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S8 -->|calls| T8
  S9["method:ASCollectionNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:262"]
  T9["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S9 -->|calls| T9
  S10["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  T10["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S10 -->|calls| T10
  S11["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  T11["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S11 -->|calls| T11
  S12["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T12["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  S12 -->|calls| T12
  S13["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T13["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  S13 -->|calls| T13
  S14["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T14["method:ASCollectionNode::collectionViewClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:248"]
  S14 -->|calls| T14
  S15["method:ASCollectionNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:293"]
  T15["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S15 -->|calls| T15
  S16["method:ASCollectionNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:306"]
  T16["method:ASCollectionNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:306"]
  S16 -->|calls| T16
  S17["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  T17["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S17 -->|calls| T17
  S18["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  T18["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  S18 -->|calls| T18
  S19["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  T19["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  S19 -->|calls| T19
  S20["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  T20["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  S20 -->|calls| T20
  S21["method:ASCollectionNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:388"]
  T21["method:ASCollectionNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:388"]
  S21 -->|calls| T21
  S22["method:ASCollectionNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:388"]
  T22["function:ASHierarchyStateIncludesRangeManaged<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:51"]
  S22 -->|calls| T22
  S23["method:ASCollectionNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:401"]
  T23["method:ASCollectionNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:401"]
  S23 -->|calls| T23
  S24["method:ASCollectionNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:407"]
  T24["method:ASCollectionNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:407"]
  S24 -->|calls| T24
  S25["method:ASCollectionNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:414"]
  T25["method:ASCollectionNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:414"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
