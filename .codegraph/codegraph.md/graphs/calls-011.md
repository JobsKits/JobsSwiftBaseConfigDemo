# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+多语言国际化.swift:17"]
  T1["method:TRAutoRefresh::Marker::pack<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:24"]
  S1 -->|calls| T1
  S2["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+多语言国际化.swift:17"]
  T2["method:TRLang::bundle<br/>JobsByPods/Jobsl10n@Pods/TRLang.swift:16"]
  S2 -->|calls| T2
  S3["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:20"]
  T3["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S3 -->|calls| T3
  S4["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:20"]
  T4["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S4 -->|calls| T4
  S5["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T5["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S5 -->|calls| T5
  S6["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T6["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S6 -->|calls| T6
  S7["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T7["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S7 -->|calls| T7
  S8["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T8["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:82"]
  S8 -->|calls| T8
  S9["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T9["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S9 -->|calls| T9
  S10["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T10["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S10 -->|calls| T10
  S11["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T11["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S11 -->|calls| T11
  S12["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T12["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S12 -->|calls| T12
  S13["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T14["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S14 -->|calls| T14
  S15["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T15["method:String::sanitizePhone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:104"]
  S15 -->|calls| T15
  S16["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T16["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S16 -->|calls| T16
  S17["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T17["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S17 -->|calls| T17
  S18["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T18["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S18 -->|calls| T18
  S19["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T19["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  S19 -->|calls| T19
  S20["method:String::call<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:70"]
  T20["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S20 -->|calls| T20
  S21["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T21["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  S21 -->|calls| T21
  S22["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T22["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  S22 -->|calls| T22
  S23["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T23["method:String::_parseEmails<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:119"]
  S23 -->|calls| T23
  S24["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T24["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S24 -->|calls| T24
  S25["method:String::mail<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:117"]
  T25["method:String::_makeMailtoURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:125"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
