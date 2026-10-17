# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::handleKeyboardOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:86"]
  T1["method:UIView::jobsAnimateWithOptions<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:33"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::toRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:98"]
  T2["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  T3["method:JobsAppDoorLogoView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:39"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  T4["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  T5["method:JobsAppDoorVC::installPanelLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:147"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  T6["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  T7["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  T8["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::bindForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:127"]
  T9["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::bindForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:127"]
  T10["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::bindForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:127"]
  T11["method:JobsAppDoorBaseVC::finishToHome<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:218"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::bindForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:127"]
  T12["method:JobsAppDoorBaseVC::openCountryCodePicker<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:209"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::bindForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:127"]
  T13["field:JobsAppDoorBaseVC::verificationCodeHandler<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:45"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::installPanelLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:147"]
  T14["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T15["method:JobsAppDoorBaseVC::cancelSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:226"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T16["method:JobsAppDoorFormView::apply<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:238"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T17["method:JobsAppDoorVC::panelTop<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:244"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T18["method:JobsAppDoorVC::panelHeight<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:258"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T19["method:JobsAppDoorVC::installPanelLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:147"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T20["method:JobsAppDoorVC::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:229"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T21["method:JobsAppDoorVC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:201"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  T22["method:UIView::jobsAnimateWithSpring<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:49"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:201"]
  T23["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:201"]
  T24["method:UIView::jobsAnimateWithOptions<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:33"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:201"]
  T25["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
