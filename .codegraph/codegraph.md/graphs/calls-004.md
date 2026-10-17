# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T1["method:UserDefaults::uint32<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:67"]
  S1 -->|calls| T1
  S2["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T2["method:Array::addBy<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:25"]
  S2 -->|calls| T2
  S3["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T3["method:Array::Builder::addBy<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:46"]
  S3 -->|calls| T3
  S4["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T4["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S4 -->|calls| T4
  S5["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T5["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S5 -->|calls| T5
  S6["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T6["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S6 -->|calls| T6
  S7["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T7["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S7 -->|calls| T7
  S8["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T8["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S8 -->|calls| T8
  S9["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T9["method:SnowflakeSwift::IDC<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:105"]
  S9 -->|calls| T9
  S10["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T10["method:SnowflakeSwift::machine<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:109"]
  S10 -->|calls| T10
  S11["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T11["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S11 -->|calls| T11
  S12["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T12["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S12 -->|calls| T12
  S13["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T13["method:JobsNumericRegression::installReporter<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:153"]
  S13 -->|calls| T13
  S14["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T14["method:JobsNumericRegression::installFormatterCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:159"]
  S14 -->|calls| T14
  S15["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T15["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S15 -->|calls| T15
  S16["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T16["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S16 -->|calls| T16
  S17["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T17["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S17 -->|calls| T17
  S18["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T18["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S18 -->|calls| T18
  S19["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T19["method:ClockResults::record<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:41"]
  S19 -->|calls| T19
  S20["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T20["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S20 -->|calls| T20
  S21["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T21["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S21 -->|calls| T21
  S22["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T22["method:ClockResults::record<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:41"]
  S22 -->|calls| T22
  S23["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T23["method:SnowflakeSwift::nextID<br/>JobsByPods/JobsSwiftBaseTools@Pods/SnowflakeSwift.swift:70"]
  S23 -->|calls| T23
  S24["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T24["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S24 -->|calls| T24
  S25["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  T25["method:ASBridgedPropertiesTests::waitForMainDispatchQueueToFlush<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:247"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
