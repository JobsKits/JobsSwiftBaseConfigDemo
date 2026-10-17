# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T1["method:UIButton::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:873"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T2["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T3["method:JobsAppDoorInputView::passwordImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:274"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T4["method:UITextField::byToggleSecureTextEntry<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:131"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T5["method:JobsAppDoorInputView::passwordImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:274"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T6["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T7["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T8["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T9["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T10["field:JobsAppDoorInputView::onCountryCodeRequest<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:22"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T11["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T12["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T13["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T14["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T15["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T16["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T17["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T18["method:JobsAppDoorResource::countdownText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:49"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T19["method:JobsAppDoorResource::countdownText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:49"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T20["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T21["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T22["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T23["field:JobsAppDoorInputView::onVerificationCodeRequest<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:23"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T24["method:UIButton::countdownStart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:90"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T25["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
