# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:220"]
  T1["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:208"]
  S1 -->|calls| T1
  S2["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:228"]
  T2["method:ASVideoPlayerNode::seekToTime:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:717"]
  S2 -->|calls| T2
  S3["class:SphereTagCloudView<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:23"]
  T3["method:SphereTagCloudView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:120"]
  S3 -->|calls| T3
  S4["class:SphereTagCloudView<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:23"]
  T4["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:75"]
  S4 -->|calls| T4
  S5["class:SphereTagCloudView<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:23"]
  T5["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:75"]
  S5 -->|calls| T5
  S6["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:75"]
  T6["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  S6 -->|calls| T6
  S7["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:75"]
  T7["method:SphereTagCloudView::start<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:113"]
  S7 -->|calls| T7
  S8["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:83"]
  T8["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S8 -->|calls| T8
  S9["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:83"]
  T9["method:SphereTagCloudView::addItem<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:94"]
  S9 -->|calls| T9
  S10["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:83"]
  T10["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:255"]
  S10 -->|calls| T10
  S11["method:SphereTagCloudView::addItem<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:94"]
  T11["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S11 -->|calls| T11
  S12["method:SphereTagCloudView::start<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:113"]
  T12["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  S12 -->|calls| T12
  S13["method:SphereTagCloudView::redistribute<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:126"]
  T13["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:255"]
  S13 -->|calls| T13
  S14["method:SphereTagCloudView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:131"]
  T14["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:255"]
  S14 -->|calls| T14
  S15["method:SphereTagCloudView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:131"]
  T15["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  S15 -->|calls| T15
  S16["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T16["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S16 -->|calls| T16
  S17["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T17["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S17 -->|calls| T17
  S18["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T18["method:SphereTagCloudView::onPan<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:173"]
  S18 -->|calls| T18
  S19["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T19["method:UIView::jobs_addGesture<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:624"]
  S19 -->|calls| T19
  S20["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T20["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S20 -->|calls| T20
  S21["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T21["method:SphereTagCloudView::onPinch<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:208"]
  S21 -->|calls| T21
  S22["method:SphereTagCloudView::onPan<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:173"]
  T22["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:271"]
  S22 -->|calls| T22
  S23["method:SphereTagCloudView::onPan<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:173"]
  T23["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  S23 -->|calls| T23
  S24["method:SphereTagCloudView::onPinch<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:208"]
  T24["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:294"]
  S24 -->|calls| T24
  S25["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  T25["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:271"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
