# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NumberFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter.swift:14"]
  T1["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S1 -->|calls| T1
  S2["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:66"]
  T2["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S2 -->|calls| T2
  S3["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:77"]
  T3["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S3 -->|calls| T3
  S4["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:91"]
  T4["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:77"]
  S4 -->|calls| T4
  S5["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:98"]
  T5["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:77"]
  S5 -->|calls| T5
  S6["method:UIAlertController::byAddCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:105"]
  T6["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S6 -->|calls| T6
  S7["method:UIAlertController::byAddCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:114"]
  T7["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S7 -->|calls| T7
  S8["method:UIAlertController::byAddDestructive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:126"]
  T8["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:77"]
  S8 -->|calls| T8
  S9["method:UIAlertController::byAddDestructive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:132"]
  T9["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:77"]
  S9 -->|calls| T9
  S10["method:UIAlertController::textField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:150"]
  T10["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S10 -->|calls| T10
  S11["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:155"]
  T11["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S11 -->|calls| T11
  S12["method:JobsTextFieldDelegateProxy::registerKnownImplementations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T12["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S12 -->|calls| T12
  S13["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T13["method:UITextField::byTextContentType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:202"]
  S13 -->|calls| T13
  S14["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T14["method:UITextField::byAutocapitalizationType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:141"]
  S14 -->|calls| T14
  S15["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T15["method:UITextField::byAutocorrectionType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:147"]
  S15 -->|calls| T15
  S16["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T16["method:UITextField::byKeyboardType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:117"]
  S16 -->|calls| T16
  S17["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T17["method:UITextField::bySecureTextEntry<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:111"]
  S17 -->|calls| T17
  S18["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T18["method:UITextField::byRightView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:511"]
  S18 -->|calls| T18
  S19["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T19["method:UITextField::byLeftView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:504"]
  S19 -->|calls| T19
  S20["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T20["method:UITextField::byTextContentType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:202"]
  S20 -->|calls| T20
  S21["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T21["method:UITextField::byReturnKeyType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:129"]
  S21 -->|calls| T21
  S22["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T22["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:97"]
  S22 -->|calls| T22
  S23["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:185"]
  T23["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S23 -->|calls| T23
  S24["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T24["method:UIAlertController::byAnchor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:261"]
  S24 -->|calls| T24
  S25["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T25["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
