# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T1["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S1 -->|calls| T1
  S2["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T2["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S2 -->|calls| T2
  S3["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T3["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S3 -->|calls| T3
  S4["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T4["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S4 -->|calls| T4
  S5["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T5["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S5 -->|calls| T5
  S6["method:UIScrollView::_jobs_attachEmptyButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:295"]
  T6["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S6 -->|calls| T6
  S7["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:342"]
  T7["method:RxDataSourcesDemoVC::tableView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@RxDataSources/VC/Demo@RxDataSources.swift:284"]
  S7 -->|calls| T7
  S8["method:UIScrollView::_jobs_isEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位按钮.swift:353"]
  T8["method:RxDataSourcesDemoVC::collectionView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@RxDataSources/VC/Demo@RxDataSources.swift:289"]
  S8 -->|calls| T8
  S9["method:UIScrollView::byEmptyViewLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:82"]
  T9["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S9 -->|calls| T9
  S10["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T10["method:UIView::byBringToFront<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:557"]
  S10 -->|calls| T10
  S11["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T11["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S11 -->|calls| T11
  S12["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T12["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S12 -->|calls| T12
  S13["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T13["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S13 -->|calls| T13
  S14["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T14["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S14 -->|calls| T14
  S15["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T15["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S15 -->|calls| T15
  S16["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T16["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S16 -->|calls| T16
  S17["method:UIScrollView::_jobs_attachEmptyView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+空态数据占位视图.swift:118"]
  T17["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S17 -->|calls| T17
  S18["method:UIScrollView::byScrollTargetWeak<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:18"]
  T18["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S18 -->|calls| T18
  S19["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:26"]
  T19["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S19 -->|calls| T19
  S20["method:UIScrollView::byScrollTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:26"]
  T20["method:UIScrollView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:165"]
  S20 -->|calls| T20
  S21["method:UIScrollView::willBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:35"]
  T21["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S21 -->|calls| T21
  S22["method:UIScrollView::didScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:41"]
  T22["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S22 -->|calls| T22
  S23["method:UIScrollView::didEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:47"]
  T23["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S23 -->|calls| T23
  S24["method:UIScrollView::willBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:53"]
  T24["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S24 -->|calls| T24
  S25["method:UIScrollView::didEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:59"]
  T25["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
