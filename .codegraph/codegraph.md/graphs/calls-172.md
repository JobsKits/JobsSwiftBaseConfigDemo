# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTextInputObserver::textFieldShouldReturn<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:51"]
  T1["method:JobsTextInputObserver::textFieldShouldReturn<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:51"]
  S1 -->|calls| T1
  S2["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T2["function:JobsTextInputObserver::textField::limitedFlag<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:71"]
  S2 -->|calls| T2
  S3["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T3["method:UIAlertController::textField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:150"]
  S3 -->|calls| T3
  S4["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T4["function:JobsTextInputObserver::textField::limitedFlag<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:71"]
  S4 -->|calls| T4
  S5["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T5["method:UIAlertController::textField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:150"]
  S5 -->|calls| T5
  S6["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T6["function:JobsTextInputObserver::textField::limitedFlag<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:71"]
  S6 -->|calls| T6
  S7["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T7["method:UIAlertController::textField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:150"]
  S7 -->|calls| T7
  S8["method:JobsTextInputObserver::textViewShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:94"]
  T8["method:JobsTextInputObserver::textViewShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:94"]
  S8 -->|calls| T8
  S9["method:JobsTextInputObserver::textViewDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:99"]
  T9["method:JobsTextInputObserver::textViewDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:99"]
  S9 -->|calls| T9
  S10["method:JobsTextInputObserver::textViewDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:104"]
  T10["method:JobsTextInputObserver::textViewDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:104"]
  S10 -->|calls| T10
  S11["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  T11["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  S11 -->|calls| T11
  S12["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  T12["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  S12 -->|calls| T12
  S13["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  T13["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  S13 -->|calls| T13
  S14["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  T14["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  S14 -->|calls| T14
  S15["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  T15["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  S15 -->|calls| T15
  S16["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  T16["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  S16 -->|calls| T16
  S17["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:88"]
  T17["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:88"]
  S17 -->|calls| T17
  S18["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:114"]
  T18["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:114"]
  S18 -->|calls| T18
  S19["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:16"]
  T19["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S19 -->|calls| T19
  S20["function:jobsGetMainWindow<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:51"]
  T20["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:16"]
  S20 -->|calls| T20
  S21["function:jobsGetMainWindow<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:51"]
  T21["function:jobsGetMainWindowAfter13<br/>JobsByPods/JobsSwiftBaseTools@Pods/Inlines.swift:33"]
  S21 -->|calls| T21
  S22["method:JobsSafePushSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:38"]
  T22["method:UINavigationController::pushViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:114"]
  S22 -->|calls| T22
  S23["method:JobsSafePushSwizzler::enable<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:38"]
  T23["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  S23 -->|calls| T23
  S24["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T24["method:UINavigationController::_canPushNow<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:28"]
  S24 -->|calls| T24
  S25["method:UINavigationController::jobs_pushViewController_swizzled<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:53"]
  T25["method:UINavigationController::_beginPushGate<br/>JobsByPods/JobsSwiftBaseTools@Pods/JobsSafeTransitions.swift:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
