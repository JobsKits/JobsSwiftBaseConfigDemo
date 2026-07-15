# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T1["method:ASTextKitRenderer::isScaled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:162"]
  S1 -->|calls| T1
  S2["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T2["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S2 -->|calls| T2
  S3["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T3["method:ASTextKitTailTruncater::truncate<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitTailTruncater.mm:151"]
  S3 -->|calls| T3
  S4["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T4["property:ASTextKitRenderer::truncater<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:49"]
  S4 -->|calls| T4
  S5["method:ASTextKitRenderer::_calculateSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:108"]
  T5["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S5 -->|calls| T5
  S6["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T6["property:ASTextKitRenderer::shadower<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:53"]
  S6 -->|calls| T6
  S7["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T7["property:ASTextKitRenderer::shadower<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.h:53"]
  S7 -->|calls| T7
  S8["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T8["method:ASTextKitRenderer::isScaled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:162"]
  S8 -->|calls| T8
  S9["method:ASTextKitRenderer::drawInContext:bounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:193"]
  T9["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S9 -->|calls| T9
  S10["method:ASTextKitRenderer::lineCount<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitRenderer.mm:250"]
  T10["method:ASCollectionLayoutState::context<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:114"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T11["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T12["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T13["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.h:1"]
  T14["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["method:ASTextKitShadower::shadowerWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:37"]
  T15["method:ASTextKitShadower::initWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:59"]
  S15 -->|calls| T15
  S16["method:ASTextKitShadower::shadowerWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:37"]
  T16["method:ASTextKitShadower::initWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:59"]
  S16 -->|calls| T16
  S17["method:ASTextKitShadower::initWithShadowOffset:shadowColor:shadowOpacity:shadowRadius:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:59"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASTextKitShadower::setShadowInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:83"]
  T18["method:ASTextKitShadower::_shouldDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:78"]
  S18 -->|calls| T18
  S19["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  T19["method:ASTextKitShadower::_shouldDrawShadow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:78"]
  S19 -->|calls| T19
  S20["method:ASTextKitShadower::insetSizeWithConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:129"]
  T20["function:_insetSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:16"]
  S20 -->|calls| T20
  S21["method:ASTextKitShadower::insetSizeWithConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:129"]
  T21["function:_invertInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:23"]
  S21 -->|calls| T21
  S22["method:ASTextKitShadower::insetSizeWithConstrainedSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:129"]
  T22["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S22 -->|calls| T22
  S23["method:ASTextKitShadower::insetRectWithConstrainedRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:134"]
  T23["function:_invertInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:23"]
  S23 -->|calls| T23
  S24["method:ASTextKitShadower::insetRectWithConstrainedRect:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:134"]
  T24["method:ASTextKitShadower::shadowPadding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:106"]
  S24 -->|calls| T24
  S25["method:ASTextKitShadower::outsetSizeWithInsetSize:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:139"]
  T25["function:_insetSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextKit/ASTextKitShadower.mm:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
