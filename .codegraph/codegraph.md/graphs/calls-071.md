# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T1["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S1 -->|calls| T1
  S2["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T2["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S2 -->|calls| T2
  S3["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T3["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S3 -->|calls| T3
  S4["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T4["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S4 -->|calls| T4
  S5["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T5["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S5 -->|calls| T5
  S6["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T6["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S6 -->|calls| T6
  S7["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T7["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S7 -->|calls| T7
  S8["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T8["method:MTLRenderPipelineDescriptor::byLabel<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLRenderPipelineDescriptor.swift:18"]
  S8 -->|calls| T8
  S9["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T9["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  S9 -->|calls| T9
  S10["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T10["method:MTLDepthStencilDescriptor::byLabel<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLDepthStencilDescriptor.swift:17"]
  S10 -->|calls| T10
  S11["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T11["method:MTLSamplerDescriptor::byLabel<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLSamplerDescriptor.swift:17"]
  S11 -->|calls| T11
  S12["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T12["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  S12 -->|calls| T12
  S13["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T13["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S13 -->|calls| T13
  S14["method:MetalRenderer::setupBuffers<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:149"]
  T14["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  S14 -->|calls| T14
  S15["method:MetalRenderer::setupBuffers<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:149"]
  T15["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S15 -->|calls| T15
  S16["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  T16["field:MetalRenderer::renderingFailureHandler<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:38"]
  S16 -->|calls| T16
  S17["method:MetalRenderer::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:172"]
  T17["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:63"]
  S17 -->|calls| T17
  S18["method:MetalRenderer::playVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:176"]
  T18["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:208"]
  S18 -->|calls| T18
  S19["method:MetalRenderer::pauseVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:180"]
  T19["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:215"]
  S19 -->|calls| T19
  S20["method:MetalRenderer::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:184"]
  T20["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:220"]
  S20 -->|calls| T20
  S21["method:MetalRenderer::bySeekToTime<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:188"]
  T21["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:228"]
  S21 -->|calls| T21
  S22["method:MetalRenderer::byVideoTextureManagerDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:194"]
  T22["method:VideoTextureManagerDelegate::videoPlaybackDidFail<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:20"]
  S22 -->|calls| T22
  S23["method:MetalRenderer::handlePan<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:203"]
  T23["method:CameraController::handlePan<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/CameraController.swift:27"]
  S23 -->|calls| T23
  S24["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:213"]
  T24["method:MetalRenderer::updateUniforms<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:246"]
  S24 -->|calls| T24
  S25["method:MetalRenderer::updateUniforms<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:246"]
  T25["method:_ASDisplayLayer::setContents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:85"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
