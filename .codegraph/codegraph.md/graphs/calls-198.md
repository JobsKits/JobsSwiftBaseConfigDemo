# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:LegacyLibraryProxy::imagePickerControllerDidCancel<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:216"]
  T1["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S1 -->|calls| T1
  S2["method:VideoCameraProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:229"]
  T2["enum_member:JobsLogLevel::info<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:13"]
  S2 -->|calls| T2
  S3["method:VideoCameraProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:229"]
  T3["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S3 -->|calls| T3
  S4["method:VideoCameraProxy::imagePickerController<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:229"]
  T4["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S4 -->|calls| T4
  S5["method:VideoCameraProxy::imagePickerControllerDidCancel<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:235"]
  T5["method:BRPickerPanel::dismiss<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:119"]
  S5 -->|calls| T5
  S6["method:NSObject::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:250"]
  T6["method:MediaPickerService::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:29"]
  S6 -->|calls| T6
  S7["method:NSObject::pickFromCamera<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:250"]
  T7["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S7 -->|calls| T7
  S8["method:NSObject::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:257"]
  T8["method:MediaPickerService::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:49"]
  S8 -->|calls| T8
  S9["method:NSObject::pickFromPhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:257"]
  T9["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S9 -->|calls| T9
  S10["method:NSObject::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:266"]
  T10["method:MediaPickerService::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:77"]
  S10 -->|calls| T10
  S11["method:NSObject::recordVideo<br/>JobsByPods/JobsSwiftTools@Pods/MediaPickerService.swift:266"]
  T11["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  S11 -->|calls| T11
  S12["class:DecodableDefault.Wrapper<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:33"]
  T12["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S12 -->|calls| T12
  S13["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T13["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  S13 -->|calls| T13
  S14["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T14["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  S14 -->|calls| T14
  S15["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T15["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  S15 -->|calls| T15
  S16["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T16["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  S16 -->|calls| T16
  S17["method:PermissionCenter::ensure<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:42"]
  T17["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  S17 -->|calls| T17
  S18["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T19["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S19 -->|calls| T19
  S20["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T20["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S20 -->|calls| T20
  S21["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T21["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S21 -->|calls| T21
  S22["method:PermissionCenter::ensureCamera<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:54"]
  T22["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S22 -->|calls| T22
  S23["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T25["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
