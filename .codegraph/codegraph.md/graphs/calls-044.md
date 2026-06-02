# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T1["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S1 -->|calls| T1
  S2["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T2["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S2 -->|calls| T2
  S3["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T3["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S3 -->|calls| T3
  S4["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T4["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S4 -->|calls| T4
  S5["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T5["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S5 -->|calls| T5
  S6["enum:JSONValue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:958"]
  T6["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S6 -->|calls| T6
  S7["method:JobsTextInputObserver::textFieldShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:31"]
  T7["method:JobsTextInputObserver::textFieldShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:31"]
  S7 -->|calls| T7
  S8["method:JobsTextInputObserver::textFieldDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:36"]
  T8["method:JobsTextInputObserver::textFieldDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:36"]
  S8 -->|calls| T8
  S9["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:41"]
  T9["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:41"]
  S9 -->|calls| T9
  S10["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:46"]
  T10["method:JobsTextInputObserver::textFieldDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:41"]
  S10 -->|calls| T10
  S11["method:JobsTextInputObserver::textFieldShouldReturn<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:51"]
  T11["method:JobsTextInputObserver::textFieldShouldReturn<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:51"]
  S11 -->|calls| T11
  S12["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T12["function:JobsTextInputObserver::textField::limitedFlag<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:71"]
  S12 -->|calls| T12
  S13["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T13["function:JobsTextInputObserver::textField::limitedFlag<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:71"]
  S13 -->|calls| T13
  S14["method:JobsTextInputObserver::textField<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:56"]
  T14["function:JobsTextInputObserver::textField::limitedFlag<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:71"]
  S14 -->|calls| T14
  S15["method:JobsTextInputObserver::textViewShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:94"]
  T15["method:JobsTextInputObserver::textViewShouldBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:94"]
  S15 -->|calls| T15
  S16["method:JobsTextInputObserver::textViewDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:99"]
  T16["method:JobsTextInputObserver::textViewDidBeginEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:99"]
  S16 -->|calls| T16
  S17["method:JobsTextInputObserver::textViewDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:104"]
  T17["method:JobsTextInputObserver::textViewDidEndEditing<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:104"]
  S17 -->|calls| T17
  S18["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  T18["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  S18 -->|calls| T18
  S19["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  T19["method:JobsTextInputObserver::textView<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseObserver.swift:109"]
  S19 -->|calls| T19
  S20["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  T20["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  S20 -->|calls| T20
  S21["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  T21["method:ViewDataProtocol::byData<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:76"]
  S21 -->|calls| T21
  S22["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  T22["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  S22 -->|calls| T22
  S23["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  T23["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:82"]
  S23 -->|calls| T23
  S24["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:88"]
  T24["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:88"]
  S24 -->|calls| T24
  S25["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:114"]
  T25["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
