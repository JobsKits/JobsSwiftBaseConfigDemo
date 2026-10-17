# `calls 符号关系 - 046`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T1["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorFormView::refreshRailAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:417"]
  T2["method:JobsAppDoorFormView::railBackgroundColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:518"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T3["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T4["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T5["method:JobsBluetoothMockTransport::byEnabled<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothMockTransport/JobsBluetoothMockTransport.swift:26"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T6["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T7["method:JobsAppDoorFormView::submitTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:493"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T8["method:JobsAppDoorFormView::submitTitleColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:522"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T9["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorFormView::refreshSubmitState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:432"]
  T10["method:JobsAppDoorFormView::submitBackgroundColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:526"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorFormView::submitTapped<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:446"]
  T11["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorFormView::submitTapped<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:446"]
  T12["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorFormView::submitTapped<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:446"]
  T13["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorFormView::submitTapped<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:446"]
  T14["field:JobsAppDoorFormView::onSubmit<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:32"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T15["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T16["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T17["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T18["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T19["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T20["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T21["method:JobsAppDoorInputView::validateGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:65"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T22["field:JobsAppDoorFormView::inputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:39"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorFormView::validationMessage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:456"]
  T23["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorFormView::title<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:473"]
  T24["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorFormView::title<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:473"]
  T25["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
