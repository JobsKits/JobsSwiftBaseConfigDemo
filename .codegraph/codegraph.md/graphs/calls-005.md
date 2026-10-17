# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T1["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S1 -->|calls| T1
  S2["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T2["function:JobsPatchRegression::main::patch<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:23"]
  S2 -->|calls| T2
  S3["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T3["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S3 -->|calls| T3
  S4["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T4["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S4 -->|calls| T4
  S5["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T5["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S5 -->|calls| T5
  S6["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T6["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S6 -->|calls| T6
  S7["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T7["function:JobsPatchRegression::main::patch<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:23"]
  S7 -->|calls| T7
  S8["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T8["method:JobsSwiftPatchMgr::rollbackPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:129"]
  S8 -->|calls| T8
  S9["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T9["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S9 -->|calls| T9
  S10["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T10["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S10 -->|calls| T10
  S11["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T11["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S11 -->|calls| T11
  S12["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T12["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S12 -->|calls| T12
  S13["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T13["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S13 -->|calls| T13
  S14["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T14["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S14 -->|calls| T14
  S15["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T15["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S15 -->|calls| T15
  S16["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T16["method:JobsSwiftPatchMgr::installPayloadPatch<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:78"]
  S16 -->|calls| T16
  S17["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T17["function:JobsPatchRegression::main::patch<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:23"]
  S17 -->|calls| T17
  S18["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T18["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S18 -->|calls| T18
  S19["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T19["method:JobsSwiftPatchMgr::rollbackAllPatches<br/>JobsByPods/JobsSwiftPatch@Pods/JobsSwiftPatch.swift:152"]
  S19 -->|calls| T19
  S20["method:JobsPatchRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:20"]
  T20["method:PatchBase::payload<br/>.github/tests/JobsPodsUpgrade/Core/JobsPatchRegression.swift:11"]
  S20 -->|calls| T20
  S21["property:Locked::value<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:17"]
  T21["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S21 -->|calls| T21
  S22["method:Locked::update<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:22"]
  T22["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S22 -->|calls| T22
  S23["method:Locked::update<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:22"]
  T23["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S23 -->|calls| T23
  S24["function:JobsWorkerTaskRegression::main::installDisposer<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:46"]
  T24["method:JobsWorker::setDisposer<br/>JobsByPods/JobsSwiftWorker@Pods/JobsWorker.swift:34"]
  S24 -->|calls| T24
  S25["method:JobsWorkerTaskRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:41"]
  T25["function:JobsWorkerTaskRegression::main::installDisposer<br/>.github/tests/JobsPodsUpgrade/Core/JobsWorkerTaskRegression.swift:46"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
