# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  T1["method:JobsAudioSessionCoordinator::release<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:46"]
  S1 -->|calls| T1
  S2["method:JobsAudioPlayerEngine::audioPlayerDidFinishPlaying<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:76"]
  T2["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S2 -->|calls| T2
  S3["method:JobsAudioPlayerEngine::audioPlayerDidFinishPlaying<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:76"]
  T3["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  S3 -->|calls| T3
  S4["method:JobsAudioPlayerEngine::audioPlayerDidFinishPlaying<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:76"]
  T4["property:JobsAudioPlayerEngine::onError<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:15"]
  S4 -->|calls| T4
  S5["method:JobsAudioPlayerEngine::audioPlayerDidFinishPlaying<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:76"]
  T5["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S5 -->|calls| T5
  S6["method:JobsAudioPlayerEngine::audioPlayerDecodeErrorDidOccur<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:87"]
  T6["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S6 -->|calls| T6
  S7["method:JobsAudioPlayerEngine::audioPlayerDecodeErrorDidOccur<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:87"]
  T7["method:JobsAudioPlayerEngine::stop<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:66"]
  S7 -->|calls| T7
  S8["method:JobsAudioPlayerEngine::audioPlayerDecodeErrorDidOccur<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:87"]
  T8["property:JobsAudioPlayerEngine::onError<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:15"]
  S8 -->|calls| T8
  S9["class:JobsAudioPlayerEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:10"]
  T9["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S9 -->|calls| T9
  S10["class:JobsAudioPlayerEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:10"]
  T10["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S10 -->|calls| T10
  S11["class:JobsAudioPlayerEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:10"]
  T11["method:JobsAudioSessionCoordinator::release<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:46"]
  S11 -->|calls| T11
  S12["class:JobsAudioRecordButton<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:17"]
  T12["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  S12 -->|calls| T12
  S13["class:JobsAudioRecordButton<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:17"]
  T13["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  S13 -->|calls| T13
  S14["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  T14["method:CAShapeLayer::byLineCap<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:82"]
  S14 -->|calls| T14
  S15["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  T15["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S15 -->|calls| T15
  S16["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  T16["method:AttributeContainer::byStrokeColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:89"]
  S16 -->|calls| T16
  S17["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  T17["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S17 -->|calls| T17
  S18["method:JobsAudioRecordButton::commonInit<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:42"]
  T18["method:CAShapeLayer::byFillColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:22"]
  S18 -->|calls| T18
  S19["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T19["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S19 -->|calls| T19
  S20["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T20["method:CALayer::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:22"]
  S20 -->|calls| T20
  S21["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T21["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S21 -->|calls| T21
  S22["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T22["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S22 -->|calls| T22
  S23["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T23["method:CAShapeLayer::byPath<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:16"]
  S23 -->|calls| T23
  S24["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T24["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S24 -->|calls| T24
  S25["method:JobsAudioRecordButton::layoutSubviews<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:59"]
  T25["method:UIView::byFuseOuterRingLayoutIfNeeded<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:370"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
