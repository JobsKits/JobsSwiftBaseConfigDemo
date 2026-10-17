# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:278"]
  T1["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:357"]
  S1 -->|calls| T1
  S2["method:UIAlertController::_drainPreBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:356"]
  T2["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S2 -->|calls| T2
  S3["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:357"]
  T3["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S3 -->|calls| T3
  S4["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:372"]
  T4["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S4 -->|calls| T4
  S5["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:372"]
  T5["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  S5 -->|calls| T5
  S6["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T6["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:372"]
  S6 -->|calls| T6
  S7["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T7["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S7 -->|calls| T7
  S8["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T8["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:353"]
  S8 -->|calls| T8
  S9["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T9["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S9 -->|calls| T9
  S10["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T10["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  S10 -->|calls| T10
  S11["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T11["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:585"]
  S11 -->|calls| T11
  S12["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T12["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S12 -->|calls| T12
  S13["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T13["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:673"]
  S13 -->|calls| T13
  S14["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T14["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S14 -->|calls| T14
  S15["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:385"]
  T15["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:673"]
  S15 -->|calls| T15
  S16["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T16["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:372"]
  S16 -->|calls| T16
  S17["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T17["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S17 -->|calls| T17
  S18["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T18["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:353"]
  S18 -->|calls| T18
  S19["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T19["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S19 -->|calls| T19
  S20["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T20["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  S20 -->|calls| T20
  S21["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T21["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:585"]
  S21 -->|calls| T21
  S22["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T22["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S22 -->|calls| T22
  S23["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T23["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:673"]
  S23 -->|calls| T23
  S24["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:424"]
  T25["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:673"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
