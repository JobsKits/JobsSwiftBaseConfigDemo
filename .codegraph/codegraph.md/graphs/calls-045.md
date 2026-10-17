# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T1["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T2["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T3["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T4["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T5["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T6["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T7["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorFormView::installLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:284"]
  T8["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorFormView::rebuildFields<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:350"]
  T9["method:JobsAppDoorFormView::fieldsForMode<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:394"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorFormView::rebuildFields<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:350"]
  T10["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorFormView::rebuildFields<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:350"]
  T11["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorFormView::rebuildFields<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:350"]
  T12["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T13["field:JobsAppDoorFormView::configureGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:19"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T14["field:JobsAppDoorFormView::previous<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:23"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T15["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T16["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T17["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T18["field:JobsAppDoorFormView::onCountryCodeRequest<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:34"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorFormView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:366"]
  T19["field:JobsAppDoorFormView::onVerificationCodeRequest<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:35"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T20["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T21["method:UIButton::byTitleAlignment<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:84"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T22["method:UIButton::byImagePlacement<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:489"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T23["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T24["method:JobsAppDoorFormView::verticalModeTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:507"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T25["method:JobsAppDoorFormView::railTitleColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:514"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
