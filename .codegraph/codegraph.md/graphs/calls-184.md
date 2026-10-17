# `calls 符号关系 - 184`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:88"]
  T1["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S1 -->|calls| T1
  S2["method:GestureUnlockView::showError<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:106"]
  T2["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:293"]
  S2 -->|calls| T2
  S3["method:GestureUnlockView::showSelected<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:110"]
  T3["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:293"]
  S3 -->|calls| T3
  S4["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:116"]
  T4["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:88"]
  S4 -->|calls| T4
  S5["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:116"]
  T5["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S5 -->|calls| T5
  S6["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:116"]
  T6["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:58"]
  S6 -->|calls| T6
  S7["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:116"]
  T7["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S7 -->|calls| T7
  S8["method:GestureUnlockView::layoutNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:131"]
  T8["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S8 -->|calls| T8
  S9["method:GestureUnlockView::layoutNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:131"]
  T9["field:GestureUnlockView::nodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:50"]
  S9 -->|calls| T9
  S10["method:GestureUnlockView::layoutNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:131"]
  T10["field:GestureUnlockView::nodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:50"]
  S10 -->|calls| T10
  S11["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:152"]
  T11["field:JobsSwiftCommentModel::location<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentModel/JobsSwiftCommentModel.swift:19"]
  S11 -->|calls| T11
  S12["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:152"]
  T12["method:GestureUnlockDemoVC::gestureUnlockViewDidBeginInput<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/Demo@九宫格手势解锁.swift:138"]
  S12 -->|calls| T12
  S13["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:152"]
  T13["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S13 -->|calls| T13
  S14["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:152"]
  T14["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:88"]
  S14 -->|calls| T14
  S15["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:152"]
  T15["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:191"]
  S15 -->|calls| T15
  S16["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:152"]
  T16["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  S16 -->|calls| T16
  S17["method:GestureUnlockView::touchesMoved<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:163"]
  T17["field:JobsSwiftCommentModel::location<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentModel/JobsSwiftCommentModel.swift:19"]
  S17 -->|calls| T17
  S18["method:GestureUnlockView::touchesMoved<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:163"]
  T18["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:191"]
  S18 -->|calls| T18
  S19["method:GestureUnlockView::touchesMoved<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:163"]
  T19["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  S19 -->|calls| T19
  S20["method:GestureUnlockView::touchesEnded<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  T20["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:266"]
  S20 -->|calls| T20
  S21["method:GestureUnlockView::touchesEnded<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  T21["method:GestureUnlockView::isValidPattern<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:100"]
  S21 -->|calls| T21
  S22["method:GestureUnlockView::touchesEnded<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  T22["method:GestureUnlockDemoVC::gestureUnlockView<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@九宫格手势解锁/Demo@九宫格手势解锁.swift:141"]
  S22 -->|calls| T22
  S23["method:GestureUnlockView::touchesEnded<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  T23["field:GestureUnlockView::onComplete<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:31"]
  S23 -->|calls| T23
  S24["method:GestureUnlockView::touchesCancelled<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:185"]
  T24["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:88"]
  S24 -->|calls| T24
  S25["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:191"]
  T25["method:GestureUnlockView::hitNodeIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:196"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
