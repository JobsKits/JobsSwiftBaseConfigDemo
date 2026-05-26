# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionView::didEndDisplayingCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:85"]
  T1["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S1 -->|calls| T1
  S2["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  T2["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S2 -->|calls| T2
  S3["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  T3["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S3 -->|calls| T3
  S4["method:UICollectionView::sizeForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:95"]
  T4["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S4 -->|calls| T4
  S5["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:105"]
  T5["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S5 -->|calls| T5
  S6["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:105"]
  T6["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S6 -->|calls| T6
  S7["method:UICollectionView::insetForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:105"]
  T7["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S7 -->|calls| T7
  S8["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:115"]
  T8["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S8 -->|calls| T8
  S9["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:115"]
  T9["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S9 -->|calls| T9
  S10["method:UICollectionView::minimumLineSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:115"]
  T10["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S10 -->|calls| T10
  S11["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:125"]
  T11["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S11 -->|calls| T11
  S12["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:125"]
  T12["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S12 -->|calls| T12
  S13["method:UICollectionView::minimumInteritemSpacingForSectionAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:125"]
  T13["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S13 -->|calls| T13
  S14["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:135"]
  T14["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S14 -->|calls| T14
  S15["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:135"]
  T15["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S15 -->|calls| T15
  S16["method:UICollectionView::referenceSizeForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:135"]
  T16["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S16 -->|calls| T16
  S17["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:145"]
  T17["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S17 -->|calls| T17
  S18["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:145"]
  T18["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S18 -->|calls| T18
  S19["method:UICollectionView::referenceSizeForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:145"]
  T19["method:UICollectionView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:441"]
  S19 -->|calls| T19
  S20["method:UICollectionView::prefetchItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:155"]
  T20["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S20 -->|calls| T20
  S21["method:UICollectionView::cancelPrefetchingForItemsAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:165"]
  T21["method:UICollectionView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:365"]
  S21 -->|calls| T21
  S22["method:JobsCollectionViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:195"]
  T22["method:JobsCollectionViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:195"]
  S22 -->|calls| T22
  S23["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:200"]
  T23["method:UICollectionView::numberOfItemsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:35"]
  S23 -->|calls| T23
  S24["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:205"]
  T24["method:UICollectionView::cellForItemAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:43"]
  S24 -->|calls| T24
  S25["method:JobsCollectionViewBlocksProxy::collectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:211"]
  T25["method:UICollectionView::viewForSupplementaryElementOfKind<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView.swift:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
