# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T1["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S1 -->|calls| T1
  S2["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T2["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S2 -->|calls| T2
  S3["method:MJRefreshAutoNormalFooter::customFooter<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshAutoNormalFooter.swift:19"]
  T3["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:190"]
  S3 -->|calls| T3
  S4["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T4["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S4 -->|calls| T4
  S5["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T5["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S5 -->|calls| T5
  S6["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T6["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  S6 -->|calls| T6
  S7["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T7["method:DateFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:35"]
  S7 -->|calls| T7
  S8["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T8["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:48"]
  S8 -->|calls| T8
  S9["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T9["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S9 -->|calls| T9
  S10["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T10["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S10 -->|calls| T10
  S11["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T11["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S11 -->|calls| T11
  S12["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T12["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:17"]
  S12 -->|calls| T12
  S13["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T13["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S13 -->|calls| T13
  S14["method:MJRefreshNormalHeader::customHeader<br/>JobsByPods/JobsBy3rdTools@Pods/MJRefresh/MJRefreshNormalHeader.swift:19"]
  T14["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:180"]
  S14 -->|calls| T14
  S15["class:MetalRenderer<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:24"]
  T15["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  S15 -->|calls| T15
  S16["class:MetalRenderer<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:24"]
  T16["method:MetalRenderer::setupBuffers<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:149"]
  S16 -->|calls| T16
  S17["method:MetalRenderer::attach<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:50"]
  T17["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  S17 -->|calls| T17
  S18["method:MetalRenderer::attach<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:50"]
  T18["method:MetalRenderer::setupBuffers<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:149"]
  S18 -->|calls| T18
  S19["method:MetalRenderer::byAttach<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:59"]
  T19["method:MetalRenderer::attach<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:50"]
  S19 -->|calls| T19
  S20["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T20["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  S20 -->|calls| T20
  S21["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T21["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S21 -->|calls| T21
  S22["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T22["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S22 -->|calls| T22
  S23["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T23["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  S23 -->|calls| T23
  S24["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T24["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S24 -->|calls| T24
  S25["method:MetalRenderer::setupMetal<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:64"]
  T25["method:MetalRenderer::reportRenderingFailure<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:157"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
