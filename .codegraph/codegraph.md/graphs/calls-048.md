# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T1["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:61"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T2["method:UITextField::onReturn<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:542"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T3["method:UITextField::byOnInput<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:22"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T4["method:UITextField::bySecureTextEntry<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:125"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T5["method:UITextField::byKeyboardType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:137"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T6["method:UITextField::byReturnKeyType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:149"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T7["method:UITextField::byClearButtonMode<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:234"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T8["method:UITextField::byAutocapitalizationType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:161"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T9["method:UITextField::byAutocorrectionType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:167"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T10["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:59"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T11["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T12["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T13["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:30"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T14["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:21"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T15["method:JobsTextField::byPlaceholder<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:97"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T16["method:JobsAppDoorInputView::placeholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:223"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T17["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T18["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T19["method:JobsAppDoorInputView::keyboardType<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:279"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T20["method:JobsAppDoorInputView::isSecureField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:290"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T21["field:JobsAppDoorInputView::onTextChanged<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:21"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T22["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T23["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T24["method:JobsAppDoorInputView::accessoryWidth<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:301"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputView::setupView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:80"]
  T25["method:JobsAppDoorInputView::configureAccessory<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputView/JobsAppDoorInputView.swift:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
