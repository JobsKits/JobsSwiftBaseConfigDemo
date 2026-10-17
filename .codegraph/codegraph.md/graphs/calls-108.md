# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:293"]
  T1["field:JobsCollectionViewBlocksProxy::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:260"]
  S1 -->|calls| T1
  S2["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:301"]
  T2["field:JobsCollectionViewBlocksProxy::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:264"]
  S2 -->|calls| T2
  S3["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:309"]
  T3["field:JobsCollectionViewBlocksProxy::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:268"]
  S3 -->|calls| T3
  S4["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:317"]
  T4["field:JobsCollectionViewBlocksProxy::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:272"]
  S4 -->|calls| T4
  S5["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:333"]
  T5["field:JobsCollectionViewBlocksProxy::prefetchItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:326"]
  S5 -->|calls| T5
  S6["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:338"]
  T6["field:JobsCollectionViewBlocksProxy::cancelPrefetchingForItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:329"]
  S6 -->|calls| T6
  S7["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:370"]
  T7["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S7 -->|calls| T7
  S8["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:370"]
  T8["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S8 -->|calls| T8
  S9["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:370"]
  T9["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S9 -->|calls| T9
  S10["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:376"]
  T10["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:370"]
  S10 -->|calls| T10
  S11["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:376"]
  T11["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:370"]
  S11 -->|calls| T11
  S12["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:376"]
  T12["method:ASDelegateProxy::forwardingTargetForSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:206"]
  S12 -->|calls| T12
  S13["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:381"]
  T13["method:ASDelegateProxy::conformsToProtocol:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:186"]
  S13 -->|calls| T13
  S14["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:381"]
  T14["method:ASDelegateProxy::conformsToProtocol:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:186"]
  S14 -->|calls| T14
  S15["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:381"]
  T15["method:ASDelegateProxy::conformsToProtocol:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:186"]
  S15 -->|calls| T15
  S16["class:UICollectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:388"]
  T16["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:405"]
  S16 -->|calls| T16
  S17["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:405"]
  T17["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:405"]
  S17 -->|calls| T17
  S18["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:405"]
  T18["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:405"]
  S18 -->|calls| T18
  S19["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  T19["method:UICollectionView::jobs_enableDelegateHardDefense<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:401"]
  S19 -->|calls| T19
  S20["method:UICollectionViewCell::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:78"]
  T20["method:UnityAppController::transitionToViewController:<br/>Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S20 -->|calls| T20
  S21["method:UICollectionViewCell::byHighlighted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:92"]
  T21["method:UnityAppController::transitionToViewController:<br/>Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S21 -->|calls| T21
  S22["method:UICollectionViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:106"]
  T22["method:ASCollectionNode::cellForItemAtIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:952"]
  S22 -->|calls| T22
  S23["method:UICollectionViewCell::byListContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:140"]
  T23["method:UICollectionViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:106"]
  S23 -->|calls| T23
  S24["method:UICollectionViewCell::byListBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:154"]
  T24["method:UICollectionViewCell::byBackgroundConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:120"]
  S24 -->|calls| T24
  S25["method:UICollectionViewCell::byListBackground<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:154"]
  T25["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
