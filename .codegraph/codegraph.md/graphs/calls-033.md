# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T1["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S1 -->|calls| T1
  S2["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T2["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S2 -->|calls| T2
  S3["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T3["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S3 -->|calls| T3
  S4["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T4["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S4 -->|calls| T4
  S5["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T5["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S5 -->|calls| T5
  S6["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T6["method:String::sanitizePhone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:104"]
  S6 -->|calls| T6
  S7["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T7["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S7 -->|calls| T7
  S8["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T8["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S8 -->|calls| T8
  S9["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T9["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S9 -->|calls| T9
  S10["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T10["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S10 -->|calls| T10
  S11["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T11["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S11 -->|calls| T11
  S12["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T12["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  S12 -->|calls| T12
  S13["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T13["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  S13 -->|calls| T13
  S14["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T14["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  S14 -->|calls| T14
  S15["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T15["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S15 -->|calls| T15
  S16["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T16["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S16 -->|calls| T16
  S17["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T17["method:String::_makeMailtoURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:125"]
  S17 -->|calls| T17
  S18["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T18["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S18 -->|calls| T18
  S19["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T19["method:String::bundleMediaURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:35"]
  S19 -->|calls| T19
  S20["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T20["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S20 -->|calls| T20
  S21["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T21["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S21 -->|calls| T21
  S22["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T22["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S22 -->|calls| T22
  S23["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:26"]
  T23["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S23 -->|calls| T23
  S24["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:99"]
  T24["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S24 -->|calls| T24
  S25["method:String::sysImg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+获取资源.swift:104"]
  T25["method:JobsSymbolWeight::toSymbolWeight<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:1028"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
