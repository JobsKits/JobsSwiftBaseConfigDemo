# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:104"]
  T1["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S1 -->|calls| T1
  S2["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:113"]
  T2["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S2 -->|calls| T2
  S3["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:113"]
  T3["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S3 -->|calls| T3
  S4["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:113"]
  T4["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S4 -->|calls| T4
  S5["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:122"]
  T5["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S5 -->|calls| T5
  S6["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:122"]
  T6["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S6 -->|calls| T6
  S7["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:122"]
  T7["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S7 -->|calls| T7
  S8["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:131"]
  T8["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S8 -->|calls| T8
  S9["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:131"]
  T9["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S9 -->|calls| T9
  S10["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:131"]
  T10["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S10 -->|calls| T10
  S11["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:140"]
  T11["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S11 -->|calls| T11
  S12["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:140"]
  T12["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S12 -->|calls| T12
  S13["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:140"]
  T13["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:417"]
  S13 -->|calls| T13
  S14["method:UICollectionView::prefetchItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:149"]
  T14["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S14 -->|calls| T14
  S15["method:UICollectionView::cancelPrefetchingForItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:159"]
  T15["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:349"]
  S15 -->|calls| T15
  S16["method:JobsCollectionViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:189"]
  T16["method:JobsCollectionViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:189"]
  S16 -->|calls| T16
  S17["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:193"]
  T17["field:JobsCollectionViewBlocksProxy::numberOfItemsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:178"]
  S17 -->|calls| T17
  S18["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:197"]
  T18["field:JobsCollectionViewBlocksProxy::cellForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:181"]
  S18 -->|calls| T18
  S19["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:202"]
  T19["field:JobsCollectionViewBlocksProxy::viewForSupplementaryElementOfKind<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:184"]
  S19 -->|calls| T19
  S20["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:226"]
  T20["field:JobsCollectionViewBlocksProxy::didSelectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:211"]
  S20 -->|calls| T20
  S21["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:232"]
  T21["field:JobsCollectionViewBlocksProxy::didDeselectItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:214"]
  S21 -->|calls| T21
  S22["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:238"]
  T22["field:JobsCollectionViewBlocksProxy::willDisplayCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:217"]
  S22 -->|calls| T22
  S23["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:245"]
  T23["field:JobsCollectionViewBlocksProxy::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:221"]
  S23 -->|calls| T23
  S24["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:277"]
  T24["field:JobsCollectionViewBlocksProxy::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:252"]
  S24 -->|calls| T24
  S25["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:285"]
  T25["field:JobsCollectionViewBlocksProxy::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:256"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
