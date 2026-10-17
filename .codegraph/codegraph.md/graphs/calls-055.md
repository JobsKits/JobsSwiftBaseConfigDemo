# `calls 符号关系 - 055`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T1["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S1 -->|calls| T1
  S2["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T2["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S2 -->|calls| T2
  S3["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T3["method:JobsAudioSessionCoordinator::acquire<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:24"]
  S3 -->|calls| T3
  S4["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T4["method:JobsAudioRecordingStore::preparedURL<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecordingStore.swift:31"]
  S4 -->|calls| T4
  S5["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T5["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S5 -->|calls| T5
  S6["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T6["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S6 -->|calls| T6
  S7["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T7["method:JobsSceneCoordinator::record<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@SceneDelegate/JobsSceneCoordinator/JobsSceneCoordinator.swift:88"]
  S7 -->|calls| T7
  S8["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T8["method:JobsSceneCoordinator::record<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@SceneDelegate/JobsSceneCoordinator/JobsSceneCoordinator.swift:88"]
  S8 -->|calls| T8
  S9["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T9["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S9 -->|calls| T9
  S10["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T10["method:JobsAudioRecorderDemoVC::audioRecorderEngineDidStart<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsAudioRecorder/JobsAudioRecorderDemoVC.swift:283"]
  S10 -->|calls| T10
  S11["method:JobsAudioRecorderEngine::start<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:57"]
  T11["method:JobsAudioSessionCoordinator::release<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:46"]
  S11 -->|calls| T11
  S12["method:JobsAudioRecorderEngine::stopAndSave<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:100"]
  T12["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S12 -->|calls| T12
  S13["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  T13["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S13 -->|calls| T13
  S14["method:JobsAudioRecorderEngine::cancel<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:109"]
  T14["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  S14 -->|calls| T14
  S15["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  T15["type_alias:NSError<br/>Unity/xcode_effectTest/Classes/Unity/UnityForwardDecls.h:34"]
  S15 -->|calls| T15
  S16["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  T16["method:JobsAudioSessionCoordinator::release<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:46"]
  S16 -->|calls| T16
  S17["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  T17["method:JobsAudioRecorderDemoVC::audioRecorderEngine<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@JobsAudioRecorder/JobsAudioRecorderDemoVC.swift:284"]
  S17 -->|calls| T17
  S18["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  T18["method:JobsAudioRecorderEngine::failure<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:119"]
  S18 -->|calls| T18
  S19["class:JobsAudioRecorderEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:16"]
  T19["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S19 -->|calls| T19
  S20["class:JobsAudioRecorderEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:16"]
  T20["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S20 -->|calls| T20
  S21["class:JobsAudioRecorderEngine<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:16"]
  T21["method:JobsAudioSessionCoordinator::release<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:46"]
  S21 -->|calls| T21
  S22["method:JobsAudioRecorderEngine::audioRecorderDidFinishRecording<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:147"]
  T22["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S22 -->|calls| T22
  S23["method:JobsAudioRecorderEngine::audioRecorderDidFinishRecording<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:147"]
  T23["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  S23 -->|calls| T23
  S24["method:JobsAudioRecorderEngine::audioRecorderEncodeErrorDidOccur<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:151"]
  T24["function:jobsAudioOnMain<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioSessionCoordinator.swift:11"]
  S24 -->|calls| T24
  S25["method:JobsAudioRecorderEngine::audioRecorderEncodeErrorDidOccur<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:151"]
  T25["method:JobsAudioRecorderEngine::finish<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioRecorderEngine.swift:123"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
