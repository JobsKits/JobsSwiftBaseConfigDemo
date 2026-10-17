# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T1["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:110"]
  S1 -->|calls| T1
  S2["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T2["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:120"]
  S2 -->|calls| T2
  S3["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:90"]
  T3["method:UIFont::Roboto::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:16"]
  S3 -->|calls| T3
  S4["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:90"]
  T4["method:UIFont::Roboto::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:19"]
  S4 -->|calls| T4
  S5["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:90"]
  T5["method:UIFont::Roboto::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Roboto.swift:22"]
  S5 -->|calls| T5
  S6["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T6["method:UIFont::Mitr::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:16"]
  S6 -->|calls| T6
  S7["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T7["method:UIFont::Mitr::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:19"]
  S7 -->|calls| T7
  S8["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T8["method:UIFont::Mitr::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+Mitr.swift:22"]
  S8 -->|calls| T8
  S9["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:110"]
  T9["method:UIFont::SFArabic::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:16"]
  S9 -->|calls| T9
  S10["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:110"]
  T10["method:UIFont::SFArabic::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:19"]
  S10 -->|calls| T10
  S11["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:110"]
  T11["method:UIFont::SFArabic::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFArabic.swift:22"]
  S11 -->|calls| T11
  S12["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:120"]
  T12["method:UIFont::PingFangSC::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:26"]
  S12 -->|calls| T12
  S13["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:120"]
  T13["method:UIFont::PingFangSC::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:29"]
  S13 -->|calls| T13
  S14["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:120"]
  T14["method:UIFont::PingFangSC::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+PingFangSC.swift:32"]
  S14 -->|calls| T14
  S15["method:UIImage::jobs_solidColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:18"]
  T15["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S15 -->|calls| T15
  S16["method:UIImage::filled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:44"]
  T16["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S16 -->|calls| T16
  S17["method:UIImage::filled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:44"]
  T17["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S17 -->|calls| T17
  S18["method:UIImage::rotated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:58"]
  T18["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S18 -->|calls| T18
  S19["method:UIImage::rotated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:58"]
  T19["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S19 -->|calls| T19
  S20["class:UIImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:18"]
  T20["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S20 -->|calls| T20
  S21["class:UIImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:18"]
  T21["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S21 -->|calls| T21
  S22["method:UIImage::grayScale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:90"]
  T22["method:ASHighlightOverlayLayer::drawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:70"]
  S22 -->|calls| T22
  S23["method:UIImage::squareCropped<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:123"]
  T23["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S23 -->|calls| T23
  S24["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  T24["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S24 -->|calls| T24
  S25["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  T25["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
