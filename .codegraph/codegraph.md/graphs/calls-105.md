# `calls 符号关系 - 105`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::byLockTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:19"]
  T1["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S1 -->|calls| T1
  S2["method:UIButton::byLockTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:19"]
  T2["method:UIView::byTintColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:30"]
  S2 -->|calls| T2
  S3["method:UIButton::byLockImageRenderingOriginal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:39"]
  T3["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S3 -->|calls| T3
  S4["method:UIButton::byLockImageRenderingOriginal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:39"]
  T4["property:UIButton::backgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:109"]
  S4 -->|calls| T4
  S5["method:UIButton::byLockTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:56"]
  T5["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:110"]
  S5 -->|calls| T5
  S6["method:UIButton::byLockTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:56"]
  T6["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S6 -->|calls| T6
  S7["method:UIButton::byLockBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:72"]
  T7["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:110"]
  S7 -->|calls| T7
  S8["method:UIButton::byLockBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:72"]
  T8["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S8 -->|calls| T8
  S9["method:UIButton::byLockBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:72"]
  T9["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S9 -->|calls| T9
  S10["method:UIButton::byLockBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:92"]
  T10["method:UIButton::ensureConfigUpdateHandler<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:110"]
  S10 -->|calls| T10
  S11["method:UIButton::byLockBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:92"]
  T11["method:Configuration::byBackgroundPatch<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:107"]
  S11 -->|calls| T11
  S12["method:UIButton::byLockBorderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+锁定TintColor.swift:92"]
  T12["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:47"]
  S12 -->|calls| T12
  S13["method:UIButton::disableAfterClick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+防止快速连点.swift:18"]
  T13["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S13 -->|calls| T13
  S14["method:UICollectionView::byRegisterCellNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:21"]
  T14["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S14 -->|calls| T14
  S15["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:32"]
  T15["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S15 -->|calls| T15
  S16["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:43"]
  T16["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S16 -->|calls| T16
  S17["method:UICollectionView::byRegisterCellNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:54"]
  T17["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S17 -->|calls| T17
  S18["method:UICollectionView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:64"]
  T18["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S18 -->|calls| T18
  S19["method:UICollectionView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:74"]
  T19["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S19 -->|calls| T19
  S20["method:UICollectionView::byRegisterSupplementaryView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:87"]
  T20["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S20 -->|calls| T20
  S21["method:UICollectionView::byRegisterSupplementaryNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:101"]
  T21["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S21 -->|calls| T21
  S22["method:UICollectionView::byRegisterHeaderView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:112"]
  T22["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S22 -->|calls| T22
  S23["method:UICollectionView::byRegisterHeaderView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:123"]
  T23["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S23 -->|calls| T23
  S24["method:UICollectionView::byRegisterFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:134"]
  T24["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S24 -->|calls| T24
  S25["method:UICollectionView::byRegisterFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:145"]
  T25["method:UICollectionView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:243"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
