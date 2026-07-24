# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::setTintColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:810"]
  T1["method:ASDisplayNode::tintColorDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:832"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::setTintColor:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:810"]
  T2["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  T3["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::insetsLayoutMarginsFromSafeArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1011"]
  T4["method:ASDisplayNode::_locked_insetsLayoutMarginsFromSafeArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1090"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::setInsetsLayoutMarginsFromSafeArea:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1018"]
  T5["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1051"]
  T6["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::setAccessibilityLabel:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1140"]
  T7["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::asyncdisplaykit_asyncTransactionContainerState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1404"]
  T8["method:CALayer::asyncdisplaykit_asyncTransactionContainerState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionContainer.mm:29"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::asyncdisplaykit_cancelAsyncTransactions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1410"]
  T9["method:CALayer::asyncdisplaykit_cancelAsyncTransactions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionContainer.mm:34"]
  S9 -->|calls| T9
  S10["struct:ASDisplayNodeLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNodeLayout.h:18"]
  T10["method:ASButtonNode::layout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTipState::initWithNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNodeTipState.mm:17"]
  T11["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S11 -->|calls| T11
  S12["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  T12["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S12 -->|calls| T12
  S13["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  T13["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  S13 -->|calls| T13
  S14["method:ASIGListAdapterBasedDataSource::overridesForSupplementarySourceClass:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:363"]
  T14["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S14 -->|calls| T14
  S15["method:ASIGListAdapterBasedDataSource::overridesForSectionControllerClass:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:382"]
  T15["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S15 -->|calls| T15
  S16["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T16["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S16 -->|calls| T16
  S17["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T17["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S17 -->|calls| T17
  S18["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T18["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S18 -->|calls| T18
  S19["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T19["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S19 -->|calls| T19
  S20["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T20["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S20 -->|calls| T20
  S21["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T21["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T25["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
