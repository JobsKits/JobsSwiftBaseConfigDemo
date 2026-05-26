# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T1["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S1 -->|calls| T1
  S2["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T2["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S2 -->|calls| T2
  S3["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T3["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S3 -->|calls| T3
  S4["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T4["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S4 -->|calls| T4
  S5["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T5["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S5 -->|calls| T5
  S6["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T6["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S6 -->|calls| T6
  S7["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  T7["method:JobsLog::toJSONReady<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:334"]
  S7 -->|calls| T7
  S8["function:log<br/>JobsByPods/JobsSwiftTools@Pods/JobsSwiftTools.swift:421"]
  T8["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S8 -->|calls| T8
  S9["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T9["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  S9 -->|calls| T9
  S10["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T11["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S11 -->|calls| T11
  S12["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T12["function:attachProxy<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:241"]
  S12 -->|calls| T12
  S13["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T13["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S13 -->|calls| T13
  S14["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T14["method:BMPlayer::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:25"]
  S14 -->|calls| T14
  S15["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T15["method:UIImagePickerController::byAllowsEditing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:35"]
  S15 -->|calls| T15
  S16["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  T16["method:UIImagePickerController::bySourceType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:23"]
  S16 -->|calls| T16
  S17["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T17["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  S17 -->|calls| T17
  S18["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T19["function:attachProxy<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:241"]
  S19 -->|calls| T19
  S20["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T20["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S20 -->|calls| T20
  S21["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T21["method:BMPlayer::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:25"]
  S21 -->|calls| T21
  S22["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T22["function:attachProxy<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:241"]
  S22 -->|calls| T22
  S23["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T23["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S23 -->|calls| T23
  S24["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T24["method:BMPlayer::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:25"]
  S24 -->|calls| T24
  S25["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T25["method:UIImagePickerController::byAllowsEditing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
