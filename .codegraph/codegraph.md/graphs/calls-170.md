# `calls 符号关系 - 170`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:foldTransformByBOOL<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:422"]
  T1["function:foldTransform<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:455"]
  S1 -->|calls| T1
  S2["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  T2["method:UITextFieldDelegateProxy::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:81"]
  S2 -->|calls| T2
  S3["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  T3["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  S3 -->|calls| T3
  S4["method:JobsCor::dynamic15<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:35"]
  T4["method:JobsCor::resolveUIColor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:18"]
  S4 -->|calls| T4
  S5["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T5["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S5 -->|calls| T5
  S6["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T6["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S6 -->|calls| T6
  S7["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T7["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S7 -->|calls| T7
  S8["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T8["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S8 -->|calls| T8
  S9["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:44"]
  T9["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S9 -->|calls| T9
  S10["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T10["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S10 -->|calls| T10
  S11["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T11["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S11 -->|calls| T11
  S12["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T12["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S12 -->|calls| T12
  S13["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T13["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S13 -->|calls| T13
  S14["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T14["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S14 -->|calls| T14
  S15["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T15["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S15 -->|calls| T15
  S16["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T16["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S16 -->|calls| T16
  S17["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:52"]
  T17["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S17 -->|calls| T17
  S18["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:65"]
  T18["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S18 -->|calls| T18
  S19["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:65"]
  T19["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S19 -->|calls| T19
  S20["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:65"]
  T20["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S20 -->|calls| T20
  S21["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:65"]
  T21["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S21 -->|calls| T21
  S22["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:65"]
  T22["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S22 -->|calls| T22
  S23["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:65"]
  T23["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S23 -->|calls| T23
  S24["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:75"]
  T24["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S24 -->|calls| T24
  S25["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:75"]
  T25["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
