# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorFormView::title<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:473"]
  T1["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorFormView::titleFont<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:487"]
  T2["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorFormView::titleFont<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:487"]
  T3["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorFormView::submitTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:493"]
  T4["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorFormView::submitTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:493"]
  T5["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorFormView::submitTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:493"]
  T6["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorFormView::verticalModeTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:507"]
  T7["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorFormView::verticalModeTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:507"]
  T8["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorFormView::verticalModeTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:507"]
  T9["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorFormView::rememberImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:536"]
  T10["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S10 -->|calls| T10
  S11["class:JobsAppDoorInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:16"]
  T11["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S11 -->|calls| T11
  S12["class:JobsAppDoorInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:16"]
  T12["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S12 -->|calls| T12
  S13["class:JobsAppDoorInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:16"]
  T13["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S13 -->|calls| T13
  S14["class:JobsAppDoorInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:16"]
  T14["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputView::setCountry<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:60"]
  T15["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputView::validateGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:65"]
  T16["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputView::validateGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:65"]
  T17["method:JobsSwiftGraphicCaptchaView::validateInput<br/>JobsByPods/JobsSwiftGraphicCaptcha@Pods/Core/JobsSwiftGraphicCaptchaView/JobsSwiftGraphicCaptchaView.swift:126"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputView::startVerificationCountdown<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:74"]
  T18["method:UIButton::countdownStart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:90"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T19["method:UIView::byClipsToBounds<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:67"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T20["method:BRPickerTheme::byCornerRadius<br/>JobsByPods/BRPickerViewSwift@Pods/Theme/BRPickerTheme.swift:78"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T21["method:CALayer::byBorderWidth<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:206"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T22["method:MTLSamplerDescriptor::byBorderColor<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLSamplerDescriptor.swift:43"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T23["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T24["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T25["method:JobsAppDoorInputView::iconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:246"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
