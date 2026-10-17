# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T1["method:UIView::byCornerRadius<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:33"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  T2["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  T3["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  T4["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  T5["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  T6["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  T7["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  T8["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputView::iconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:246"]
  T9["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputView::passwordImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:274"]
  T10["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S10 -->|calls| T10
  S11["class:JobsAppDoorLogoView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:18"]
  T11["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S11 -->|calls| T11
  S12["class:JobsAppDoorLogoView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:18"]
  T12["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S12 -->|calls| T12
  S13["class:JobsAppDoorLogoView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:18"]
  T13["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorLogoView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:39"]
  T14["method:UIView::byContentMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:211"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorLogoView::configure<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoView/JobsAppDoorLogoView.swift:39"]
  T15["method:UIView::byContentMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:211"]
  S15 -->|calls| T15
  S16["method:UIButton::byJobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:13"]
  T16["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T17["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T18["method:UIButton::byTitleColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:803"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T19["method:UIButton::byTitleFont<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:759"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T20["method:UIButton::byConfiguration<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:47"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T21["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T22["method:UIView::byCornerRadius<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:33"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T23["method:UIView::byBorderColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:90"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T24["method:UIView::byBorderWidth<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:102"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  T25["method:UIView::byClipsToBounds<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:67"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
