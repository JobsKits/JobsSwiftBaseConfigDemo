# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T2["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S2 -->|calls| T2
  S3["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T3["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S3 -->|calls| T3
  S4["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T4["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S4 -->|calls| T4
  S5["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T5["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S5 -->|calls| T5
  S6["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T6["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S6 -->|calls| T6
  S7["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T8["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S8 -->|calls| T8
  S9["method:PermissionCenter::ensurePhotoLibrary<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:70"]
  T9["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S9 -->|calls| T9
  S10["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T11["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S11 -->|calls| T11
  S12["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T12["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S12 -->|calls| T12
  S13["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T13["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S13 -->|calls| T13
  S14["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T14["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S14 -->|calls| T14
  S15["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T16["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S16 -->|calls| T16
  S17["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T17["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S17 -->|calls| T17
  S18["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T18["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S18 -->|calls| T18
  S19["method:PermissionCenter::ensureMicrophone<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:103"]
  T19["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S19 -->|calls| T19
  S20["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T20["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S20 -->|calls| T20
  S21["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T21["method:LocationProxy::requestWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:192"]
  S21 -->|calls| T21
  S22["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T22["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S22 -->|calls| T22
  S23["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T23["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S23 -->|calls| T23
  S24["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T24["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S24 -->|calls| T24
  S25["method:PermissionCenter::ensureLocationWhenInUse<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:136"]
  T25["method:PermissionCenter::showNoPermissionToast<br/>JobsByPods/JobsSwiftTools@Pods/PermissionCenter.swift:181"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
