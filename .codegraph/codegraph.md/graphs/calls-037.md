# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T1["method:JobsAppDoorStyle2VC::cardTop<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:198"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T2["method:JobsSwiftCommentCell::update<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentCell/JobsSwiftCommentCell.swift:49"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T3["field:JobsAppDoorStyle2VC::centerXConstraints<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:18"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T4["method:JobsSwiftCommentCell::update<br/>JobsByPods/JobsSwiftComment@Pods/Core/JobsSwiftCommentCell/JobsSwiftCommentCell.swift:49"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T5["field:JobsAppDoorStyle2VC::centerXConstraints<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:18"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T6["method:JobsAppDoorStyle2VC::installCustomerServiceConstraint<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:158"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T7["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T8["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T9["method:UIView::jobsAnimateWithSpring<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:49"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorStyle2VC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:113"]
  T10["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorStyle2VC::installCustomerServiceConstraint<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:158"]
  T11["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorStyle2VC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:167"]
  T12["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorStyle2VC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:167"]
  T13["method:UIView::jobsAnimateWithOptions<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:33"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorStyle2VC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/JobsAppDoorStyle2VC.swift:167"]
  T14["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S14 -->|calls| T14
  S15["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T15["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S15 -->|calls| T15
  S16["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T16["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S16 -->|calls| T16
  S17["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T17["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S17 -->|calls| T17
  S18["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T18["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S18 -->|calls| T18
  S19["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T19["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S19 -->|calls| T19
  S20["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T20["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S20 -->|calls| T20
  S21["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T21["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S21 -->|calls| T21
  S22["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T22["method:JobsAppDoorResource::customerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:24"]
  S22 -->|calls| T22
  S23["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T23["field:JobsAppDoorBaseVC::customerServiceHandler<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:44"]
  S23 -->|calls| T23
  S24["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T24["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S24 -->|calls| T24
  S25["class:JobsAppDoorBaseVC<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:24"]
  T25["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
