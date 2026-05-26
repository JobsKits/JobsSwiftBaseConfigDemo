# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:75"]
  T1["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S1 -->|calls| T1
  S2["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:75"]
  T2["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S2 -->|calls| T2
  S3["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:82"]
  T3["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S3 -->|calls| T3
  S4["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:82"]
  T4["method:JobsCor::dynamic13<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:27"]
  S4 -->|calls| T4
  S5["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:87"]
  T5["method:JobsCor::dynamic15<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:35"]
  S5 -->|calls| T5
  S6["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:87"]
  T6["method:JobsCor::dynamic15<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:35"]
  S6 -->|calls| T6
  S7["class:JobsCor<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:87"]
  T7["method:JobsCor::dynamic15<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseCor.swift:35"]
  S7 -->|calls| T7
  S8["function:debugOnly<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:19"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["function:debugOnly<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:28"]
  T9["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S9 -->|calls| T9
  S10["function:debugOnly<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:38"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["function:debugOnly<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:50"]
  T11["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S11 -->|calls| T11
  S12["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  T12["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S12 -->|calls| T12
  S13["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T13["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S13 -->|calls| T13
  S14["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T14["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S14 -->|calls| T14
  S15["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T15["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S15 -->|calls| T15
  S16["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T16["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S16 -->|calls| T16
  S17["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T17["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S17 -->|calls| T17
  S18["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T18["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S18 -->|calls| T18
  S19["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  T19["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:422"]
  S19 -->|calls| T19
  S20["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:350"]
  T20["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:422"]
  S20 -->|calls| T20
  S21["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:364"]
  T21["method:UITextViewDemoVC::sync<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@输入文本.swift:422"]
  S21 -->|calls| T21
  S22["method:JobsTextInputObserver::textFieldShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:31"]
  T22["method:JobsTextInputObserver::textFieldShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:31"]
  S22 -->|calls| T22
  S23["method:JobsTextInputObserver::textFieldDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:36"]
  T23["method:JobsTextInputObserver::textFieldDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:36"]
  S23 -->|calls| T23
  S24["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:41"]
  T24["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:41"]
  S24 -->|calls| T24
  S25["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:46"]
  T25["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
