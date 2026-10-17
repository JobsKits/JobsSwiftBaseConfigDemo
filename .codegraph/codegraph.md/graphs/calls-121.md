# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T1["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:342"]
  S1 -->|calls| T1
  S2["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T2["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:342"]
  S2 -->|calls| T2
  S3["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T3["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S3 -->|calls| T3
  S4["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T4["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S4 -->|calls| T4
  S5["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T5["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S5 -->|calls| T5
  S6["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T6["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S6 -->|calls| T6
  S7["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T7["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S7 -->|calls| T7
  S8["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  T8["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S8 -->|calls| T8
  S9["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T9["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S9 -->|calls| T9
  S10["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T10["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  S10 -->|calls| T10
  S11["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T11["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S11 -->|calls| T11
  S12["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T12["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S12 -->|calls| T12
  S13["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T13["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S13 -->|calls| T13
  S14["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T14["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  S14 -->|calls| T14
  S15["method:UIScrollView::_jobs_ensureEmptyButtonIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:228"]
  T15["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  S15 -->|calls| T15
  S16["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  T16["method:UIView::byMakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:105"]
  S16 -->|calls| T16
  S17["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  T17["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S17 -->|calls| T17
  S18["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  T18["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S18 -->|calls| T18
  S19["method:UIScrollView::_jobs_defaultEmptyButtonConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:263"]
  T19["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S19 -->|calls| T19
  S20["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:274"]
  T20["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  S20 -->|calls| T20
  S21["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:274"]
  T21["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  S21 -->|calls| T21
  S22["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:274"]
  T22["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  S22 -->|calls| T22
  S23["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:274"]
  T23["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  S23 -->|calls| T23
  S24["method:UIScrollView::_jobs_autoEnsureEmptyButtonThenEval<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:274"]
  T24["method:UIScrollView::byReloadEmptyViewAuto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:188"]
  S24 -->|calls| T24
  S25["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T25["method:UIView::byBringToFront<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:557"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
