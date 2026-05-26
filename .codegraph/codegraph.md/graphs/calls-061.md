# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:236"]
  T1["method:UICollectionView::didSelectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:60"]
  S1 -->|calls| T1
  S2["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:242"]
  T2["method:UICollectionView::didDeselectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:68"]
  S2 -->|calls| T2
  S3["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:248"]
  T3["method:UICollectionView::willDisplayCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:76"]
  S3 -->|calls| T3
  S4["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:255"]
  T4["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:85"]
  S4 -->|calls| T4
  S5["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:287"]
  T5["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  S5 -->|calls| T5
  S6["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:296"]
  T6["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:105"]
  S6 -->|calls| T6
  S7["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:305"]
  T7["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:115"]
  S7 -->|calls| T7
  S8["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:314"]
  T8["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:125"]
  S8 -->|calls| T8
  S9["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:323"]
  T9["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:135"]
  S9 -->|calls| T9
  S10["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:332"]
  T10["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:145"]
  S10 -->|calls| T10
  S11["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  T11["method:UICollectionView::prefetchItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:155"]
  S11 -->|calls| T11
  S12["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:354"]
  T12["method:UICollectionView::cancelPrefetchingForItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:165"]
  S12 -->|calls| T12
  S13["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  T13["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  S13 -->|calls| T13
  S14["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  T14["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  S14 -->|calls| T14
  S15["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  T15["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  S15 -->|calls| T15
  S16["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:394"]
  T16["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  S16 -->|calls| T16
  S17["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:394"]
  T17["method:JobsCollectionViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:387"]
  S17 -->|calls| T17
  S18["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:394"]
  T18["method:JobsCollectionViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:394"]
  S18 -->|calls| T18
  S19["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:400"]
  T19["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:400"]
  S19 -->|calls| T19
  S20["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:400"]
  T20["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:400"]
  S20 -->|calls| T20
  S21["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:400"]
  T21["method:JobsCollectionViewDelegateMux::conforms<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:400"]
  S21 -->|calls| T21
  S22["class:UICollectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:408"]
  T22["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:428"]
  S22 -->|calls| T22
  S23["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:428"]
  T23["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:428"]
  S23 -->|calls| T23
  S24["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:428"]
  T24["method:UICollectionView::jobs_setDelegate_swizzled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:428"]
  S24 -->|calls| T24
  S25["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  T25["method:UICollectionView::jobs_enableDelegateHardDefense<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:424"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
