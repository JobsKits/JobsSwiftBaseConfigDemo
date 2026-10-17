# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ControlledClient::complete<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:322"]
  T1["field:ControlledClient::prepared<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:306"]
  S1 -->|calls| T1
  S2["method:ControlledClient::complete<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:322"]
  T2["method:OrderedDictionary::removeValue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:193"]
  S2 -->|calls| T2
  S3["property:LockedEvents::values<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:346"]
  T3["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S3 -->|calls| T3
  S4["method:LockedEvents::append<br/>.github/tests/JobsPodsUpgrade/Network/NetworkRegression.swift:351"]
  T4["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S4 -->|calls| T4
  S5["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T5["method:JobsSwiftWebSocketClient::connect<br/>JobsByPods/JobsSwiftWebSocket@Pods/Core/JobsSwiftWebSocketClient/JobsSwiftWebSocketClient.swift:189"]
  S5 -->|calls| T5
  S6["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T6["method:WebSocketRegression::wait<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:53"]
  S6 -->|calls| T6
  S7["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T7["method:JobsSwiftWebSocketClient::send<br/>JobsByPods/JobsSwiftWebSocket@Pods/Core/JobsSwiftWebSocketClient/JobsSwiftWebSocketClient.swift:220"]
  S7 -->|calls| T7
  S8["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T8["method:WebSocketRegression::wait<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:53"]
  S8 -->|calls| T8
  S9["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T9["method:JobsSwiftWebSocketClient::connect<br/>JobsByPods/JobsSwiftWebSocket@Pods/Core/JobsSwiftWebSocketClient/JobsSwiftWebSocketClient.swift:189"]
  S9 -->|calls| T9
  S10["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T10["method:WebSocketRegression::wait<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:53"]
  S10 -->|calls| T10
  S11["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T11["method:JobsSwiftWebSocketClient::disconnect<br/>JobsByPods/JobsSwiftWebSocket@Pods/Core/JobsSwiftWebSocketClient/JobsSwiftWebSocketClient.swift:208"]
  S11 -->|calls| T11
  S12["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T12["method:JobsSwiftWebSocketClient::connect<br/>JobsByPods/JobsSwiftWebSocket@Pods/Core/JobsSwiftWebSocketClient/JobsSwiftWebSocketClient.swift:189"]
  S12 -->|calls| T12
  S13["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T13["method:WebSocketRegression::wait<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:53"]
  S13 -->|calls| T13
  S14["method:WebSocketRegression::main<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:12"]
  T14["method:WebSocketRegression::wait<br/>.github/tests/JobsPodsUpgrade/Network/WebSocketRegression.swift:53"]
  S14 -->|calls| T14
  S15["method:JobsUIKitRegression::testGrayPatternAndStrictHexConversion<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:24"]
  T15["method:UIColor::jobsRGBComponents<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Others@SDK/UIColor.swift:258"]
  S15 -->|calls| T15
  S16["method:JobsUIKitRegression::testGrayPatternAndStrictHexConversion<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:24"]
  T16["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S16 -->|calls| T16
  S17["method:JobsUIKitRegression::testGrayPatternAndStrictHexConversion<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:24"]
  T17["method:UIColor::jobsRGBComponents<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/Others@SDK/UIColor.swift:258"]
  S17 -->|calls| T17
  S18["method:JobsUIKitRegression::testEmptyContainerVisibleControllerTerminates<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:44"]
  T18["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  S18 -->|calls| T18
  S19["method:JobsUIKitRegression::testEmptyContainerVisibleControllerTerminates<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:44"]
  T19["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:25"]
  S19 -->|calls| T19
  S20["method:JobsUIKitRegression::testEmptyContainerVisibleControllerTerminates<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:44"]
  T20["function:jobsGetMainWindowAfter13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:37"]
  S20 -->|calls| T20
  S21["method:JobsUIKitRegression::testEmptyContainerVisibleControllerTerminates<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:44"]
  T21["function:legacyKeyWindowPreiOS13<br/>JobsByPods/JobsGetWindow@Pods/UIWindowScene.swift:25"]
  S21 -->|calls| T21
  S22["method:JobsUIKitRegression::testEmptyContainerVisibleControllerTerminates<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:44"]
  T22["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  S22 -->|calls| T22
  S23["method:JobsUIKitRegression::testEmptyContainerVisibleControllerTerminates<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:44"]
  T23["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:53"]
  S23 -->|calls| T23
  S24["method:JobsUIKitRegression::testPickerTaskCancellationReturnsTerminalResult<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:64"]
  T24["method:BRBasePicker::awaitResult<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:136"]
  S24 -->|calls| T24
  S25["method:JobsUIKitRegression::testPickerTaskCancellationReturnsTerminalResult<br/>.github/tests/JobsPodsUpgrade/UI/JobsUIKitRegression.swift:64"]
  T25["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:196"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
