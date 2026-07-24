# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T1["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S1 -->|calls| T1
  S2["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T2["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S2 -->|calls| T2
  S3["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T3["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S3 -->|calls| T3
  S4["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T4["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S4 -->|calls| T4
  S5["method:ASMutableAttributedStringBuilder::composedAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:213"]
  T5["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S5 -->|calls| T5
  S6["method:ASMutableAttributedStringBuilder::composedAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:213"]
  T6["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S6 -->|calls| T6
  S7["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  T7["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S7 -->|calls| T7
  S8["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  T8["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S8 -->|calls| T8
  S9["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  T9["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  S9 -->|calls| T9
  S10["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  T10["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S10 -->|calls| T10
  S11["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  T11["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  S11 -->|calls| T11
  S12["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  T12["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S12 -->|calls| T12
  S13["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  T13["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S13 -->|calls| T13
  S14["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  T14["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.h:1"]
  T15["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S15 -->|calls| T15
  S16["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T16["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S16 -->|calls| T16
  S17["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  T17["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S17 -->|calls| T17
  S18["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  T18["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S18 -->|calls| T18
  S19["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  T19["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  S19 -->|calls| T19
  S20["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  T20["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  S20 -->|calls| T20
  S21["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  T21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S21 -->|calls| T21
  S22["method:ASPINRemoteImageDownloader::setSharedImageManagerWithConfiguration:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:129"]
  T22["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  S22 -->|calls| T22
  S23["method:ASPINRemoteImageDownloader::setSharedImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:136"]
  T23["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  S23 -->|calls| T23
  S24["method:ASPINRemoteImageDownloader::setSharedPreconfiguredRemoteImageManager:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:146"]
  T24["method:ASElementMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  S24 -->|calls| T24
  S25["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  T25["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
