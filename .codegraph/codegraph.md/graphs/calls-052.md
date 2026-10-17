# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  T1["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:191"]
  S1 -->|calls| T1
  S2["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  T2["method:ASCollectionNode::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1163"]
  S2 -->|calls| T2
  S3["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:191"]
  T3["method:ASHighlightOverlayLayer::drawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:70"]
  S3 -->|calls| T3
  S4["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:191"]
  T4["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:243"]
  S4 -->|calls| T4
  S5["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:243"]
  T5["method:ASTextLine::lineWithCTLine:position:vertical:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:17"]
  S5 -->|calls| T5
  S6["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:243"]
  T6["method:ASTextLine::lineWithCTLine:position:vertical:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:17"]
  S6 -->|calls| T6
  S7["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:243"]
  T7["method:ASTextLine::lineWithCTLine:position:vertical:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:17"]
  S7 -->|calls| T7
  S8["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:243"]
  T8["method:ASCollectionView::sizeForElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:679"]
  S8 -->|calls| T8
  S9["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:243"]
  T9["method:JobsCoreTextScrollLayer::draw<br/>JobsByPods/JobsSwiftUILabelScrolling@Pods/Core/JobsCoreTextScrollLayer/JobsCoreTextScrollLayer.swift:86"]
  S9 -->|calls| T9
  S10["file:JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:1"]
  T10["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  S10 -->|calls| T10
  S11["property:JobsAudioPlayerEngine::playingURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:13"]
  T11["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S11 -->|calls| T11
  S12["property:JobsAudioPlayerEngine::onError<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:15"]
  T12["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S12 -->|calls| T12
  S13["property:JobsAudioPlayerEngine::onError<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:15"]
  T13["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S13 -->|calls| T13
  S14["class:JobsAudioPlayerEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:10"]
  T14["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  S14 -->|calls| T14
  S15["class:JobsAudioPlayerEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:10"]
  T15["property:JobsAudioPlayerEngine::onError<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:15"]
  S15 -->|calls| T15
  S16["class:JobsAudioPlayerEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:10"]
  T16["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S16 -->|calls| T16
  S17["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T17["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S17 -->|calls| T17
  S18["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T18["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  S18 -->|calls| T18
  S19["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T19["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  S19 -->|calls| T19
  S20["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T20["method:JobsAudioSessionCoordinator::acquire<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:24"]
  S20 -->|calls| T20
  S21["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T21["method:PlayerCenterImpl::play<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/PlayerCenter.swift:37"]
  S21 -->|calls| T21
  S22["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T22["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  S22 -->|calls| T22
  S23["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T23["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S23 -->|calls| T23
  S24["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  T24["method:JobsAudioSessionCoordinator::release<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:46"]
  S24 -->|calls| T24
  S25["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  T25["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
