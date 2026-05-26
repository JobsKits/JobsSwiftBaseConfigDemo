# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:VideoTextureManager::updateTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:101"]
  T1["method:VideoTextureManager::createTexture<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:114"]
  S1 -->|calls| T1
  S2["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  T2["method:PlayerCenterImpl::play<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:35"]
  S2 -->|calls| T2
  S3["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  T3["method:PNPlayerDemoVC::videoPlaybackStateChanged<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:168"]
  S3 -->|calls| T3
  S4["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  T4["method:JobsLiveFloatPlayer::pause<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:77"]
  S4 -->|calls| T4
  S5["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  T5["method:PNPlayerDemoVC::videoPlaybackStateChanged<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:168"]
  S5 -->|calls| T5
  S6["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  T6["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  S6 -->|calls| T6
  S7["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  T7["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  S7 -->|calls| T7
  S8["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  T8["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S8 -->|calls| T8
  S9["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  T9["method:PNPlayerDemoVC::videoDidUpdateTime<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PNPlayer/Demo@PNPlayer.swift:164"]
  S9 -->|calls| T9
  S10["class:VideoTextureManager<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:18"]
  T10["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S10 -->|calls| T10
  S11["method:UIImageView::bySDLocalGIF<br/>JobsByPods/JobsBy3rdTools@Pods/SDWebImage/SDWebImage.swift:18"]
  T11["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  S11 -->|calls| T11
  S12["class:SphereTagCloudView<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:21"]
  T12["method:SphereTagCloudView::stop<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:120"]
  S12 -->|calls| T12
  S13["class:SphereTagCloudView<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:21"]
  T13["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:73"]
  S13 -->|calls| T13
  S14["class:SphereTagCloudView<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:21"]
  T14["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:73"]
  S14 -->|calls| T14
  S15["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:73"]
  T15["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  S15 -->|calls| T15
  S16["method:SphereTagCloudView::commonInit<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:73"]
  T16["method:SphereTagCloudView::start<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:113"]
  S16 -->|calls| T16
  S17["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  T18["method:SphereTagCloudView::addItem<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:93"]
  S18 -->|calls| T18
  S19["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  T19["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:258"]
  S19 -->|calls| T19
  S20["method:SphereTagCloudView::start<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:113"]
  T20["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  S20 -->|calls| T20
  S21["method:SphereTagCloudView::redistribute<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:126"]
  T21["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:258"]
  S21 -->|calls| T21
  S22["method:SphereTagCloudView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:131"]
  T22["method:SphereTagCloudView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:131"]
  S22 -->|calls| T22
  S23["method:SphereTagCloudView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:131"]
  T23["method:SphereTagCloudView::distributeIfNeeded<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:258"]
  S23 -->|calls| T23
  S24["method:SphereTagCloudView::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:131"]
  T24["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:305"]
  S24 -->|calls| T24
  S25["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T25["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
