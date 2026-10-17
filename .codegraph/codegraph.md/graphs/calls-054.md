# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAudioRecordButton::touchDown<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:68"]
  T1["field:JobsAudioRecordButton::onBegin<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:20"]
  S1 -->|calls| T1
  S2["method:JobsAudioRecordButton::touchDown<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:68"]
  T2["method:UIView::byFusePressStart<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:513"]
  S2 -->|calls| T2
  S3["method:JobsAudioRecordButton::touchDown<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:68"]
  T3["method:JobsAudioRecordButton::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:124"]
  S3 -->|calls| T3
  S4["method:JobsAudioRecordButton::touchDown<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:68"]
  T4["method:JobsSwiftTimerCountdown::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:142"]
  S4 -->|calls| T4
  S5["method:JobsAudioRecordButton::touchUpInside<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:105"]
  T5["method:JobsAudioRecordButton::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:124"]
  S5 -->|calls| T5
  S6["method:JobsAudioRecordButton::didMoveToWindow<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:107"]
  T6["method:JobsAudioRecordButton::cancelRecording<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:113"]
  S6 -->|calls| T6
  S7["method:JobsAudioRecordButton::cancelRecording<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:113"]
  T7["method:JobsAudioRecordButton::touchCancelled<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:117"]
  S7 -->|calls| T7
  S8["method:JobsAudioRecordButton::touchCancelled<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:117"]
  T8["method:JobsAudioRecordButton::resetVisuals<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:142"]
  S8 -->|calls| T8
  S9["method:JobsAudioRecordButton::touchCancelled<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:117"]
  T9["field:JobsAudioRecordButton::onCancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:22"]
  S9 -->|calls| T9
  S10["method:JobsAudioRecordButton::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:124"]
  T10["method:JobsAudioRecordButton::resetVisuals<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:142"]
  S10 -->|calls| T10
  S11["method:JobsAudioRecordButton::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:124"]
  T11["field:JobsAudioRecordButton::onCancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:22"]
  S11 -->|calls| T11
  S12["method:JobsAudioRecordButton::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:124"]
  T12["field:JobsAudioRecordButton::onTooShort<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:23"]
  S12 -->|calls| T12
  S13["method:JobsAudioRecordButton::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:124"]
  T13["field:JobsAudioRecordButton::onFinish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:21"]
  S13 -->|calls| T13
  S14["class:JobsAudioRecordButton<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:17"]
  T14["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:201"]
  S14 -->|calls| T14
  S15["method:JobsAudioRecordButton::resetVisuals<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:142"]
  T15["method:JobsSwiftTimerCountdown::cancel<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimerCountdown.swift:201"]
  S15 -->|calls| T15
  S16["method:JobsAudioRecordButton::resetVisuals<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordButton.swift:142"]
  T16["method:UIView::byFusePressStop<br/>JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.swift:524"]
  S16 -->|calls| T16
  S17["property:JobsAudioRecorderEngine::delegate<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:19"]
  T17["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S17 -->|calls| T17
  S18["property:JobsAudioRecorderEngine::delegate<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:19"]
  T18["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S18 -->|calls| T18
  S19["property:JobsAudioRecorderEngine::mode<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:25"]
  T19["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S19 -->|calls| T19
  S20["property:JobsAudioRecorderEngine::currentURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:26"]
  T20["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S20 -->|calls| T20
  S21["property:JobsAudioRecorderEngine::isRecording<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:27"]
  T21["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S21 -->|calls| T21
  S22["property:JobsAudioRecorderEngine::currentTime<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:28"]
  T22["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S22 -->|calls| T22
  S23["class:JobsAudioRecorderEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:16"]
  T23["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  S23 -->|calls| T23
  S24["class:JobsAudioRecorderEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:16"]
  T24["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S24 -->|calls| T24
  S25["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T25["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
