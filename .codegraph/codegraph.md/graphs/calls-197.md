# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  T1["method:UIImagePickerController::bySourceType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:23"]
  S1 -->|calls| T1
  S2["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T2["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  S2 -->|calls| T2
  S3["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T3["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  S3 -->|calls| T3
  S4["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T4["function:MediaPickerService::recordVideo::supportsVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:100"]
  S4 -->|calls| T4
  S5["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T5["function:MediaPickerService::recordVideo::supportsVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:100"]
  S5 -->|calls| T5
  S6["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T6["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S6 -->|calls| T6
  S7["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T8["method:UIImagePickerController::byCameraCaptureMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:90"]
  S8 -->|calls| T8
  S9["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T9["method:UIImagePickerController::byVideoMaximumDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:48"]
  S9 -->|calls| T9
  S10["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T10["method:UIImagePickerController::byVideoQuality<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:55"]
  S10 -->|calls| T10
  S11["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T11["method:UIImagePickerController::byCameraDevice<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:97"]
  S11 -->|calls| T11
  S12["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T12["method:UIImagePickerController::bySourceType<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+DSL.swift:23"]
  S12 -->|calls| T12
  S13["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T13["function:attachProxy<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:241"]
  S13 -->|calls| T13
  S14["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  T14["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S14 -->|calls| T14
  S15["method:CameraProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:154"]
  T15["enum_member:JobsLogLevel::info<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:13"]
  S15 -->|calls| T15
  S16["method:CameraProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:154"]
  T16["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S16 -->|calls| T16
  S17["method:CameraProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:154"]
  T17["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S17 -->|calls| T17
  S18["method:CameraProxy::imagePickerControllerDidCancel<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:161"]
  T18["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S18 -->|calls| T18
  S19["method:PHPickerProxy::picker<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:172"]
  T19["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S19 -->|calls| T19
  S20["method:PHPickerProxy::picker<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:172"]
  T20["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S20 -->|calls| T20
  S21["method:PHPickerProxy::picker<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:172"]
  T21["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S21 -->|calls| T21
  S22["method:LegacyLibraryProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:209"]
  T22["enum_member:JobsLogLevel::info<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:13"]
  S22 -->|calls| T22
  S23["method:LegacyLibraryProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:209"]
  T23["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S23 -->|calls| T23
  S24["method:LegacyLibraryProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:209"]
  T24["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S24 -->|calls| T24
  S25["method:LegacyLibraryProxy::imagePickerControllerDidCancel<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:216"]
  T25["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
