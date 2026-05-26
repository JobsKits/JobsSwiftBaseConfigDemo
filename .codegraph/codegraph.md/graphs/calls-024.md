# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T1["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S1 -->|calls| T1
  S2["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T2["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  S2 -->|calls| T2
  S3["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T3["method:UIAlertController::_drainPreBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:367"]
  S3 -->|calls| T3
  S4["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T4["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:368"]
  S4 -->|calls| T4
  S5["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T5["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  S5 -->|calls| T5
  S6["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T6["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:368"]
  S6 -->|calls| T6
  S7["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T7["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  S7 -->|calls| T7
  S8["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T8["method:UIAlertController::_drainPreBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:367"]
  S8 -->|calls| T8
  S9["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T9["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:368"]
  S9 -->|calls| T9
  S10["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T10["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  S10 -->|calls| T10
  S11["method:UIAlertController::byPresent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:286"]
  T11["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:368"]
  S11 -->|calls| T11
  S12["method:UIAlertController::_drainPreBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:367"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:UIAlertController::_drainPostBGTasks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:368"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:383"]
  T14["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S14 -->|calls| T14
  S15["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:383"]
  T15["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  S15 -->|calls| T15
  S16["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T16["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:383"]
  S16 -->|calls| T16
  S17["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T17["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S17 -->|calls| T17
  S18["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T18["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:364"]
  S18 -->|calls| T18
  S19["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T19["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S19 -->|calls| T19
  S20["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T20["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  S20 -->|calls| T20
  S21["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T21["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  S21 -->|calls| T21
  S22["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T22["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S22 -->|calls| T22
  S23["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T23["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:691"]
  S23 -->|calls| T23
  S24["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:UIAlertController::bySDBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:396"]
  T25["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:691"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
