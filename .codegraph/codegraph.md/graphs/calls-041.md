# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsAppDoorBackgroundView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:15"]
  T1["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S1 -->|calls| T1
  S2["class:JobsAppDoorBackgroundView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:15"]
  T2["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S2 -->|calls| T2
  S3["class:JobsAppDoorBackgroundView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:15"]
  T3["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S3 -->|calls| T3
  S4["class:JobsAppDoorBackgroundView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:15"]
  T4["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorBackgroundView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:59"]
  T5["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorBackgroundView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:59"]
  T6["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorBackgroundView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:59"]
  T7["method:JobsAppDoorBackgroundView::stopVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:122"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorBackgroundView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:59"]
  T8["method:JobsAppDoorResource::videoURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:29"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorBackgroundView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:59"]
  T9["method:JobsAppDoorBackgroundView::stopVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:122"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorBackgroundView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:59"]
  T10["method:JobsAppDoorBackgroundView::prepareVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:100"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorBackgroundView::play<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:79"]
  T11["method:VideoPlayer::playToView:<br/>Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:200"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorBackgroundView::prepareVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:100"]
  T12["method:JobsAppDoorBackgroundView::stopVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:122"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorBackgroundView::prepareVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:100"]
  T13["method:ASVideoPlayerNode::seekToTime:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVideoPlayerNode.mm:717"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorBackgroundView::prepareVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:100"]
  T14["method:VideoPlayer::playToView:<br/>Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:200"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorBackgroundView::prepareVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:100"]
  T15["method:VideoPlayer::playToView:<br/>Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:200"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorBackgroundView::stopVideo<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:122"]
  T16["method:JobsLiveFloatPlayer::pause<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:78"]
  S16 -->|calls| T16
  S17["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T17["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S17 -->|calls| T17
  S18["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T18["field:JobsAppDoorFormView::configureGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:19"]
  S18 -->|calls| T18
  S19["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T19["field:JobsAppDoorFormView::previous<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:23"]
  S19 -->|calls| T19
  S20["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T20["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  S20 -->|calls| T20
  S21["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T21["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  S21 -->|calls| T21
  S22["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T22["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S22 -->|calls| T22
  S23["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T23["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S23 -->|calls| T23
  S24["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T24["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S24 -->|calls| T24
  S25["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T25["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
