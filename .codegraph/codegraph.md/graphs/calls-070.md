# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T1["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S1 -->|calls| T1
  S2["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T2["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S2 -->|calls| T2
  S3["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T3["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S3 -->|calls| T3
  S4["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T4["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S4 -->|calls| T4
  S5["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T5["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S5 -->|calls| T5
  S6["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T6["method:UIImage::asdk_animatedImageData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:19"]
  S6 -->|calls| T6
  S7["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T7["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S7 -->|calls| T7
  S8["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T8["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S8 -->|calls| T8
  S9["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T9["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S9 -->|calls| T9
  S10["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T10["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S10 -->|calls| T10
  S11["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T11["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S11 -->|calls| T11
  S12["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T12["method:UIImage::asdk_animatedImageData<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:19"]
  S12 -->|calls| T12
  S13["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T13["function:ASImageLoadingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S13 -->|calls| T13
  S14["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T14["method:UIImage::asdk_image<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S14 -->|calls| T14
  S15["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T15["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S15 -->|calls| T15
  S16["method:ASNetworkImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:910"]
  T16["method:ASNetworkImageNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNetworkImageNode.mm:910"]
  S16 -->|calls| T16
  S17["method:ASNodeController::loadNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:22"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASNodeController::node<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:28"]
  T18["method:ASNodeController::loadNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:22"]
  S18 -->|calls| T18
  S19["method:ASNodeController::lockPair<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:96"]
  T19["function:ASLockSequence<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:103"]
  S19 -->|calls| T19
  S20["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  T20["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S20 -->|calls| T20
  S21["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  T21["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S21 -->|calls| T21
  S22["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T22["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  S22 -->|calls| T22
  S23["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T23["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S23 -->|calls| T23
  S24["method:ASPagerFlowLayout::targetContentOffsetForProposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:37"]
  T24["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  S24 -->|calls| T24
  S25["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  T25["method:ASPagerFlowLayout::_dataSourceIsEmpty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASPagerFlowLayout.mm:66"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
