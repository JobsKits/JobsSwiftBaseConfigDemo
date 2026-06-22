# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASCollectionPendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:218"]
  T1["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S1 -->|calls| T1
  S2["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  T2["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S2 -->|calls| T2
  S3["method:ASCollectionNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:262"]
  T3["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S3 -->|calls| T3
  S4["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  T4["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S4 -->|calls| T4
  S5["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  T5["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S5 -->|calls| T5
  S6["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T6["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  S6 -->|calls| T6
  S7["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T7["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  S7 -->|calls| T7
  S8["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T8["method:ASCollectionNode::collectionViewClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:248"]
  S8 -->|calls| T8
  S9["method:ASCollectionNode::dealloc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:293"]
  T9["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S9 -->|calls| T9
  S10["method:ASCollectionNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:306"]
  T10["method:ASCollectionNode::didLoad<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:306"]
  S10 -->|calls| T10
  S11["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  T11["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S11 -->|calls| T11
  S12["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  T12["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  S12 -->|calls| T12
  S13["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  T13["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  S13 -->|calls| T13
  S14["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  T14["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  S14 -->|calls| T14
  S15["method:ASCollectionNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:388"]
  T15["method:ASCollectionNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:388"]
  S15 -->|calls| T15
  S16["method:ASCollectionNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:388"]
  T16["function:ASHierarchyStateIncludesRangeManaged<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:51"]
  S16 -->|calls| T16
  S17["method:ASCollectionNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:401"]
  T17["method:ASCollectionNode::didEnterVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:401"]
  S17 -->|calls| T17
  S18["method:ASCollectionNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:407"]
  T18["method:ASCollectionNode::didExitVisibleState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:407"]
  S18 -->|calls| T18
  S19["method:ASCollectionNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:414"]
  T19["method:ASCollectionNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:414"]
  S19 -->|calls| T19
  S20["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  T20["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  S20 -->|calls| T20
  S21["method:ASCollectionNode::setInverted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:437"]
  T21["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S21 -->|calls| T21
  S22["method:ASCollectionNode::inverted<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:448"]
  T22["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S22 -->|calls| T22
  S23["method:ASCollectionNode::setLayoutInspector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:457"]
  T23["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S23 -->|calls| T23
  S24["method:ASCollectionNode::layoutInspector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:467"]
  T24["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S24 -->|calls| T24
  S25["method:ASCollectionNode::setLeadingScreensForBatching:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:476"]
  T25["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
