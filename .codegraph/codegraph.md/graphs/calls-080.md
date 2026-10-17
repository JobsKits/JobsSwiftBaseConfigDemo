# `calls 符号关系 - 080`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::byAddDestructive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:126"]
  T1["method:UIAlertController::byAddAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:74"]
  S1 -->|calls| T1
  S2["method:UIAlertController::byPreferredActionTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:138"]
  T2["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S2 -->|calls| T2
  S3["method:JobsTextFieldDelegateProxy::registerKnownImplementations<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:167"]
  T3["method:ASRangeController::registerForNodeDisplayNotificationsForInterfaceStateIfNeeded:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRangeController.mm:434"]
  S3 -->|calls| T3
  S4["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T4["method:UITextField::byTextContentType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:222"]
  S4 -->|calls| T4
  S5["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T5["method:UITextField::byAutocapitalizationType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:161"]
  S5 -->|calls| T5
  S6["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T6["method:UITextField::byAutocorrectionType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:167"]
  S6 -->|calls| T6
  S7["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T7["method:UITextField::byKeyboardType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:137"]
  S7 -->|calls| T7
  S8["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T8["method:UITextField::bySecureTextEntry<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:125"]
  S8 -->|calls| T8
  S9["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T9["method:UITextField::byRightView<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:534"]
  S9 -->|calls| T9
  S10["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T10["method:UITextField::byLeftView<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:527"]
  S10 -->|calls| T10
  S11["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T11["method:UITextField::byReturnKeyType<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:149"]
  S11 -->|calls| T11
  S12["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T12["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S12 -->|calls| T12
  S13["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T13["method:UITextField::byPlaceholder<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:20"]
  S13 -->|calls| T13
  S14["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:176"]
  T14["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S14 -->|calls| T14
  S15["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T15["method:UIAlertController::byAnchor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:249"]
  S15 -->|calls| T15
  S16["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T16["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  S16 -->|calls| T16
  S17["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T17["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  S17 -->|calls| T17
  S18["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T18["method:UIAlertController::_drainPreBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:356"]
  S18 -->|calls| T18
  S19["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T19["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:357"]
  S19 -->|calls| T19
  S20["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T20["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  S20 -->|calls| T20
  S21["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T21["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:357"]
  S21 -->|calls| T21
  S22["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T22["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  S22 -->|calls| T22
  S23["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T23["method:UIAlertController::_drainPreBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:356"]
  S23 -->|calls| T23
  S24["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T24["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:357"]
  S24 -->|calls| T24
  S25["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T25["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
