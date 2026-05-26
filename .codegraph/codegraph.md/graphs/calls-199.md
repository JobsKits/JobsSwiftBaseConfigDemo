# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T1["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S1 -->|calls| T1
  S2["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T2["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S2 -->|calls| T2
  S3["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T3["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S3 -->|calls| T3
  S4["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T4["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S4 -->|calls| T4
  S5["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T5["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S5 -->|calls| T5
  S6["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T6["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S6 -->|calls| T6
  S7["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T9["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S9 -->|calls| T9
  S10["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T10["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S10 -->|calls| T10
  S11["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T11["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S11 -->|calls| T11
  S12["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T14["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S14 -->|calls| T14
  S15["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T15["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S15 -->|calls| T15
  S16["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T16["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S16 -->|calls| T16
  S17["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T17["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S17 -->|calls| T17
  S18["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T18["method:LocationProxy::requestWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:192"]
  S18 -->|calls| T18
  S19["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T19["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S19 -->|calls| T19
  S20["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T20["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S20 -->|calls| T20
  S21["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T21["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S21 -->|calls| T21
  S22["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T22["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S22 -->|calls| T22
  S23["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T24["method:BluetoothProxy::request<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:231"]
  S24 -->|calls| T24
  S25["method:PermissionCenter::ensureBluetooth<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:159"]
  T25["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
