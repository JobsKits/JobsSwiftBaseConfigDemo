# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["property:String::tr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+多语言国际化.swift:18"]
  T1["method:TRLang::bundle<br/>JobsByPods/Jobsl10n@Pods/TRLang.swift:47"]
  S1 -->|calls| T1
  S2["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:22"]
  T2["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S2 -->|calls| T2
  S3["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:22"]
  T3["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S3 -->|calls| T3
  S4["method:String::code128BarcodeImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:22"]
  T4["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S4 -->|calls| T4
  S5["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T5["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S5 -->|calls| T5
  S6["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T6["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S6 -->|calls| T6
  S7["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T7["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S7 -->|calls| T7
  S8["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T8["method:ASCollectionView::sizeForElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:679"]
  S8 -->|calls| T8
  S9["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T9["method:JobsFont::monospacedDigitSystemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:33"]
  S9 -->|calls| T9
  S10["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T10["method:ASCollectionView::sizeForElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:679"]
  S10 -->|calls| T10
  S11["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T11["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S11 -->|calls| T11
  S12["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T12["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S12 -->|calls| T12
  S13["method:String::code128ByText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+条形码.swift:49"]
  T13["method:ASHighlightOverlayLayer::drawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:70"]
  S13 -->|calls| T13
  S14["method:String::intValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:19"]
  T14["method:ASCollectionNode::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:892"]
  S14 -->|calls| T14
  S15["method:String::toInt64<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:29"]
  T15["method:ASCollectionNode::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:892"]
  S15 -->|calls| T15
  S16["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:35"]
  T16["method:NumberFormatter::byLocale<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:73"]
  S16 -->|calls| T16
  S17["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:35"]
  T17["method:ASCollectionNode::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:892"]
  S17 -->|calls| T17
  S18["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:44"]
  T18["method:NumberFormatter::byMaximumFractionDigits<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/NumberFormatter/NumberFormatter+DSL.swift:159"]
  S18 -->|calls| T18
  S19["method:String::toDouble<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:44"]
  T19["method:ASCollectionNode::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:892"]
  S19 -->|calls| T19
  S20["method:String::toFloat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:53"]
  T20["method:ASCollectionNode::numberOfItemsInSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:892"]
  S20 -->|calls| T20
  S21["method:String::toBool<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+格式转换.swift:59"]
  T21["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:16"]
  S21 -->|calls| T21
  S22["method:String::_JobsMailProxy::mailComposeController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:27"]
  T22["field:String::_JobsMailProxy::completion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:26"]
  S22 -->|calls| T22
  S23["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  T23["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S23 -->|calls| T23
  S24["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  T24["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S24 -->|calls| T24
  S25["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  T25["type_alias:jobsByVoidBlock<br/>JobsByPods/JobsSwiftBlock@Pods/JobsSwiftBaseBlock.swift:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
