# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:26"]
  T1["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  S1 -->|calls| T1
  S2["method:String::cor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:46"]
  T2["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  S2 -->|calls| T2
  S3["method:String::cor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:54"]
  T3["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  S3 -->|calls| T3
  S4["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  T4["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S4 -->|calls| T4
  S5["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  T5["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S5 -->|calls| T5
  S6["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  T6["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S6 -->|calls| T6
  S7["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  T7["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S7 -->|calls| T7
  S8["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:62"]
  T8["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S8 -->|calls| T8
  S9["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+多语言国际化.swift:17"]
  T9["method:TRAutoRefresh::Marker::pack<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:24"]
  S9 -->|calls| T9
  S10["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+多语言国际化.swift:17"]
  T10["method:TRLang::bundle<br/>JobsByPods/Jobsl10n@Pods/TRLang.swift:16"]
  S10 -->|calls| T10
  S11["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:20"]
  T11["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S11 -->|calls| T11
  S12["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:20"]
  T12["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S12 -->|calls| T12
  S13["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T13["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S13 -->|calls| T13
  S14["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T14["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S14 -->|calls| T14
  S15["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T15["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S15 -->|calls| T15
  S16["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T16["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S16 -->|calls| T16
  S17["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T17["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S17 -->|calls| T17
  S18["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:51"]
  T18["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S18 -->|calls| T18
  S19["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:33"]
  T19["method:NumberFormatter::byGroupingSeparator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:109"]
  S19 -->|calls| T19
  S20["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:33"]
  T20["method:DateFormatter::byLocale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:57"]
  S20 -->|calls| T20
  S21["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:42"]
  T21["method:NumberFormatter::byMinimumFractionDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:153"]
  S21 -->|calls| T21
  S22["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:42"]
  T22["method:NumberFormatter::byMaximumFractionDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:159"]
  S22 -->|calls| T22
  S23["method:String::toBool<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:57"]
  T23["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S23 -->|calls| T23
  S24["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T24["method:String::makeURL<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:82"]
  S24 -->|calls| T24
  S25["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:44"]
  T25["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
