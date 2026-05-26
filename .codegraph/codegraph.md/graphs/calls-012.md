# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T1["method:MTLRenderPipelineDescriptor::byDepthPixelFormat<br/>JobsByPods/MetalKit@Pods/MTLRenderPipelineDescriptor.swift:44"]
  S1 -->|calls| T1
  S2["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T2["method:MTLRenderPipelineDescriptor::byColorAttachment<br/>JobsByPods/MetalKit@Pods/MTLRenderPipelineDescriptor.swift:55"]
  S2 -->|calls| T2
  S3["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T3["method:MTLRenderPipelineDescriptor::byRasterSampleCount<br/>JobsByPods/MetalKit@Pods/MTLRenderPipelineDescriptor.swift:32"]
  S3 -->|calls| T3
  S4["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T4["method:MTLRenderPipelineDescriptor::byVertexDescriptor<br/>JobsByPods/MetalKit@Pods/MTLRenderPipelineDescriptor.swift:28"]
  S4 -->|calls| T4
  S5["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T5["method:MTLRenderPipelineDescriptor::byFragmentFunction<br/>JobsByPods/MetalKit@Pods/MTLRenderPipelineDescriptor.swift:25"]
  S5 -->|calls| T5
  S6["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T6["method:MTLRenderPipelineDescriptor::byVertexFunction<br/>JobsByPods/MetalKit@Pods/MTLRenderPipelineDescriptor.swift:22"]
  S6 -->|calls| T6
  S7["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T7["method:MTLDepthStencilDescriptor::byLabel<br/>JobsByPods/MetalKit@Pods/MTLDepthStencilDescriptor.swift:18"]
  S7 -->|calls| T7
  S8["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T8["method:MTLDepthStencilDescriptor::byDepthWriteEnabled<br/>JobsByPods/MetalKit@Pods/MTLDepthStencilDescriptor.swift:24"]
  S8 -->|calls| T8
  S9["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T9["method:MTLDepthStencilDescriptor::byDepthCompare<br/>JobsByPods/MetalKit@Pods/MTLDepthStencilDescriptor.swift:21"]
  S9 -->|calls| T9
  S10["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T10["method:MTLDepthStencilDescriptor::byLabel<br/>JobsByPods/MetalKit@Pods/MTLDepthStencilDescriptor.swift:18"]
  S10 -->|calls| T10
  S11["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T11["method:MTLSamplerDescriptor::byMaxAnisotropy<br/>JobsByPods/MetalKit@Pods/MTLSamplerDescriptor.swift:30"]
  S11 -->|calls| T11
  S12["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T12["method:MTLSamplerDescriptor::byTAddressMode<br/>JobsByPods/MetalKit@Pods/MTLSamplerDescriptor.swift:38"]
  S12 -->|calls| T12
  S13["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T13["method:MTLSamplerDescriptor::bySAddressMode<br/>JobsByPods/MetalKit@Pods/MTLSamplerDescriptor.swift:35"]
  S13 -->|calls| T13
  S14["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T14["method:MTLSamplerDescriptor::byMipFilter<br/>JobsByPods/MetalKit@Pods/MTLSamplerDescriptor.swift:27"]
  S14 -->|calls| T14
  S15["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T15["method:MTLSamplerDescriptor::byMagFilter<br/>JobsByPods/MetalKit@Pods/MTLSamplerDescriptor.swift:24"]
  S15 -->|calls| T15
  S16["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T16["method:MTLSamplerDescriptor::byMinFilter<br/>JobsByPods/MetalKit@Pods/MTLSamplerDescriptor.swift:21"]
  S16 -->|calls| T16
  S17["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:52"]
  T17["method:MTLDepthStencilDescriptor::byLabel<br/>JobsByPods/MetalKit@Pods/MTLDepthStencilDescriptor.swift:18"]
  S17 -->|calls| T17
  S18["method:MetalRenderer::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:146"]
  T18["method:VideoTextureManager::loadVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:54"]
  S18 -->|calls| T18
  S19["method:MetalRenderer::playVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:147"]
  T19["method:VideoTextureManager::play<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:138"]
  S19 -->|calls| T19
  S20["method:MetalRenderer::pauseVideo<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:148"]
  T20["method:VideoTextureManager::pause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:143"]
  S20 -->|calls| T20
  S21["method:MetalRenderer::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:149"]
  T21["method:VideoTextureManager::togglePlayPause<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:148"]
  S21 -->|calls| T21
  S22["method:MetalRenderer::bySeekToTime<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:151"]
  T22["method:VideoTextureManager::seek<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/VideoTextureManager.swift:156"]
  S22 -->|calls| T22
  S23["method:MetalRenderer::handlePan<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:159"]
  T23["method:CameraController::handlePan<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/CameraController.swift:23"]
  S23 -->|calls| T23
  S24["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  T24["method:MetalRenderer::updateUniforms<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:206"]
  S24 -->|calls| T24
  S25["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  T25["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
