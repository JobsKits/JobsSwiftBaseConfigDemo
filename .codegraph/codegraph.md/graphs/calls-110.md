# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMutableAttributedStringBuilder::composedAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:213"]
  T1["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S1 -->|calls| T1
  S2["method:ASMutableAttributedStringBuilder::composedAttributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:213"]
  T2["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S2 -->|calls| T2
  S3["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  T3["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S3 -->|calls| T3
  S4["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  T4["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S4 -->|calls| T4
  S5["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  T5["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  S5 -->|calls| T5
  S6["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  T6["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S6 -->|calls| T6
  S7["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  T7["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  S7 -->|calls| T7
  S8["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  T8["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S8 -->|calls| T8
  S9["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  T9["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S9 -->|calls| T9
  S10["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  T10["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.h:1"]
  T11["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S11 -->|calls| T11
  S12["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T12["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S12 -->|calls| T12
  S13["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  T13["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S13 -->|calls| T13
  S14["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  T14["function:ASGetDescriptionValueString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S14 -->|calls| T14
  S15["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  T15["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  S15 -->|calls| T15
  S16["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  T16["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  S16 -->|calls| T16
  S17["method:ASPINRemoteImageManager::defaultImageCache<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:91"]
  T17["enum_member:JobsResponseSource::cache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsResponseEvent.swift:12"]
  S17 -->|calls| T17
  S18["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  T18["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S18 -->|calls| T18
  S19["method:ASPINRemoteImageDownloader::setSharedImageManagerWithConfiguration:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:129"]
  T19["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  S19 -->|calls| T19
  S20["method:ASPINRemoteImageDownloader::setSharedImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:136"]
  T20["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  S20 -->|calls| T20
  S21["method:ASPINRemoteImageDownloader::setSharedPreconfiguredRemoteImageManager:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:146"]
  T21["method:ASElementMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  S21 -->|calls| T21
  S22["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  T22["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S22 -->|calls| T22
  S23["method:ASPINRemoteImageDownloader::sharedImageManagerSupportsMemoryRemoval<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:196"]
  T23["enum_member:JobsResponseSource::cache<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsResponseEvent.swift:12"]
  S23 -->|calls| T23
  S24["method:ASPINRemoteImageDownloader::sharedImageManagerSupportsMemoryRemoval<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:196"]
  T24["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S24 -->|calls| T24
  S25["method:ASPINRemoteImageDownloader::synchronouslyFetchedCachedImageWithURL:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:215"]
  T25["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
