# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T1["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  S1 -->|calls| T1
  S2["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T2["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S2 -->|calls| T2
  S3["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T3["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S3 -->|calls| T3
  S4["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T4["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S4 -->|calls| T4
  S5["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T5["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S5 -->|calls| T5
  S6["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T6["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S6 -->|calls| T6
  S7["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T7["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S7 -->|calls| T7
  S8["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T8["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S8 -->|calls| T8
  S9["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T9["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S9 -->|calls| T9
  S10["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T10["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S10 -->|calls| T10
  S11["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T11["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S11 -->|calls| T11
  S12["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T12["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S12 -->|calls| T12
  S13["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T13["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S13 -->|calls| T13
  S14["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T14["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  S14 -->|calls| T14
  S15["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T15["function:NSObject::topViewController::next<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:53"]
  S15 -->|calls| T15
  S16["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:46"]
  T16["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  S16 -->|calls| T16
  S17["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  T17["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S17 -->|calls| T17
  S18["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  T18["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S18 -->|calls| T18
  S19["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  T19["function:legacyKeyWindowPreiOS13<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIWindowScene.swift:26"]
  S19 -->|calls| T19
  S20["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T20["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:422"]
  S20 -->|calls| T20
  S21["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T21["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  S21 -->|calls| T21
  S22["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T22["method:NSObject::activeKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:92"]
  S22 -->|calls| T22
  S23["method:NSObject::topNavController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:106"]
  T23["method:NSObject::visibleViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:129"]
  S23 -->|calls| T23
  S24["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T24["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:422"]
  S24 -->|calls| T24
  S25["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  T25["method:NSObject::topViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:123"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
