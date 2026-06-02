# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  T1["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S1 -->|calls| T1
  S2["method:JobsLog::toJSONStringFromObject<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:313"]
  T2["method:JobsLog::decodeUnicodeEscapes<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:259"]
  S2 -->|calls| T2
  S3["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T3["method:JobsLog::unwrapOptional<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:324"]
  S3 -->|calls| T3
  S4["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T4["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S4 -->|calls| T4
  S5["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T5["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S5 -->|calls| T5
  S6["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T6["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S6 -->|calls| T6
  S7["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T7["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S7 -->|calls| T7
  S8["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T8["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S8 -->|calls| T8
  S9["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T9["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S9 -->|calls| T9
  S10["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T10["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S10 -->|calls| T10
  S11["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T11["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S11 -->|calls| T11
  S12["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T12["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S12 -->|calls| T12
  S13["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T13["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S13 -->|calls| T13
  S14["function:log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:421"]
  T14["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S14 -->|calls| T14
  S15["class:DecodableDefault.Wrapper<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:33"]
  T15["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S15 -->|calls| T15
  S16["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T16["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  S16 -->|calls| T16
  S17["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T17["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  S17 -->|calls| T17
  S18["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T18["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  S18 -->|calls| T18
  S19["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T19["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  S19 -->|calls| T19
  S20["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T20["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  S20 -->|calls| T20
  S21["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T21["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S21 -->|calls| T21
  S22["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T22["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S22 -->|calls| T22
  S23["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T23["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S23 -->|calls| T23
  S24["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T24["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S24 -->|calls| T24
  S25["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T25["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
