# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T1["function:_defaultAvoidTruncationCharacterSet<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:24"]
  S1 -->|calls| T1
  S2["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T2["method:ASTextKitTailTruncater::initWithContext:truncationAttributedString:avoidTailTruncationSet:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:24"]
  S2 -->|calls| T2
  S3["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T3["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S3 -->|calls| T3
  S4["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T4["method:ASTextKitFontSizeAdjuster::initWithContext:constrainedSize:textKitAttributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:41"]
  S4 -->|calls| T4
  S5["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T5["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S5 -->|calls| T5
  S6["method:ASTextKitRenderer::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:44"]
  T6["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  S6 -->|calls| T6
  S7["method:ASTextKitRenderer::stringDrawingContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:85"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T8["method:ASTextKitFontSizeAdjuster::scaleFactor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitFontSizeAdjuster.mm:152"]
  S8 -->|calls| T8
  S9["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T9["property:ASTextKitRenderer::fontSizeAdjuster<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:51"]
  S9 -->|calls| T9
  S10["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T10["method:ASTextKitRenderer::isScaled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:162"]
  S10 -->|calls| T10
  S11["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T11["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S11 -->|calls| T11
  S12["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T12["method:ASTextKitTailTruncater::truncate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:151"]
  S12 -->|calls| T12
  S13["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T13["property:ASTextKitRenderer::truncater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:49"]
  S13 -->|calls| T13
  S14["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T14["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S14 -->|calls| T14
  S15["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T15["property:ASTextKitRenderer::shadower<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:53"]
  S15 -->|calls| T15
  S16["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T16["property:ASTextKitRenderer::shadower<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:53"]
  S16 -->|calls| T16
  S17["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T17["method:ASTextKitRenderer::isScaled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:162"]
  S17 -->|calls| T17
  S18["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T18["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S18 -->|calls| T18
  S19["method:ASTextKitRenderer::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:250"]
  T19["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T21["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["method:ASTextKitShadower::shadowerWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:37"]
  T24["method:ASTextKitShadower::initWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:59"]
  S24 -->|calls| T24
  S25["method:ASTextKitShadower::shadowerWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:37"]
  T25["method:ASTextKitShadower::initWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
