# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T1["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T2["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T3["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T4["method:JobsAppDoorLogoView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:39"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T5["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T6["method:JobsAppDoorStyle2VC::installCustomerServiceConstraint<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:158"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorStyle2VC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:61"]
  T7["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T8["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T9["field:JobsAppDoorStyle2VC::centerXConstraints<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:18"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T10["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T11["field:JobsAppDoorStyle2VC::topConstraints<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:19"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T12["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T13["method:JobsAppDoorStyle2VC::cardTop<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:198"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T14["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorStyle2VC::install<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:79"]
  T15["method:JobsAppDoorStyle2VC::cardHeight<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:212"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorStyle2VC::makeForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:88"]
  T16["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorStyle2VC::makeForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:88"]
  T17["method:JobsAppDoorBaseVC::dispatchSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:258"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorStyle2VC::makeForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:88"]
  T18["method:JobsAppDoorBaseVC::finishToHome<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:218"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorStyle2VC::makeForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:88"]
  T19["method:JobsAppDoorBaseVC::openCountryCodePicker<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:209"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorStyle2VC::makeForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:88"]
  T20["field:JobsAppDoorBaseVC::verificationCodeHandler<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:45"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T21["method:JobsAppDoorBaseVC::cancelSubmission<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:226"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T22["method:JobsAppDoorStyle2VC::form<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:180"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T23["method:JobsAppDoorStyle2VC::form<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:180"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T24["method:JobsSwiftCommentCell::update<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentCell/JobsSwiftCommentCell.swift:49"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T25["field:JobsAppDoorStyle2VC::topConstraints<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
