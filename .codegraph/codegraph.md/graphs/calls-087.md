# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:23"]
  T1["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S1 -->|calls| T1
  S2["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:23"]
  T2["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S2 -->|calls| T2
  S3["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:23"]
  T3["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S3 -->|calls| T3
  S4["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:40"]
  T4["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S4 -->|calls| T4
  S5["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:40"]
  T5["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S5 -->|calls| T5
  S6["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:40"]
  T6["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S6 -->|calls| T6
  S7["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:40"]
  T7["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S7 -->|calls| T7
  S8["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T8["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S8 -->|calls| T8
  S9["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T9["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S9 -->|calls| T9
  S10["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T10["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S10 -->|calls| T10
  S11["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T11["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S11 -->|calls| T11
  S12["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T12["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S12 -->|calls| T12
  S13["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T13["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S13 -->|calls| T13
  S14["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T14["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S14 -->|calls| T14
  S15["method:String::qrcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+二维码.swift:75"]
  T15["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S15 -->|calls| T15
  S16["property:String::isValidHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:34"]
  T16["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  S16 -->|calls| T16
  S17["property:String::cor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:39"]
  T17["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  S17 -->|calls| T17
  S18["method:String::cor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:48"]
  T18["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  S18 -->|calls| T18
  S19["method:String::cor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:56"]
  T19["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  S19 -->|calls| T19
  S20["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  T20["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:16"]
  S20 -->|calls| T20
  S21["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  T21["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S21 -->|calls| T21
  S22["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  T22["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S22 -->|calls| T22
  S23["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  T23["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:66"]
  S23 -->|calls| T23
  S24["function:jobsParseHexColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+取色.swift:64"]
  T24["method:ASCornerLayoutSpecSnapshotTests::suffixWithLocation:option:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:169"]
  S24 -->|calls| T24
  S25["property:String::tr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+多语言国际化.swift:18"]
  T25["method:TRAutoRefresh::Marker::pack<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
