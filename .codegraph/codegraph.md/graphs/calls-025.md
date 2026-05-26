# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T1["method:UIAlertController::byBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:383"]
  S1 -->|calls| T1
  S2["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T2["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S2 -->|calls| T2
  S3["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T3["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:364"]
  S3 -->|calls| T3
  S4["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T4["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S4 -->|calls| T4
  S5["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T5["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  S5 -->|calls| T5
  S6["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T6["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  S6 -->|calls| T6
  S7["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T7["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S7 -->|calls| T7
  S8["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T8["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:691"]
  S8 -->|calls| T8
  S9["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T9["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S9 -->|calls| T9
  S10["method:UIAlertController::byKFBgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:438"]
  T10["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:691"]
  S10 -->|calls| T10
  S11["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:485"]
  T11["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:364"]
  S11 -->|calls| T11
  S12["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:485"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:485"]
  T13["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  S13 -->|calls| T13
  S14["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:502"]
  T14["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:364"]
  S14 -->|calls| T14
  S15["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:502"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:502"]
  T16["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  S16 -->|calls| T16
  S17["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:502"]
  T17["method:UIAlertController::textField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:150"]
  S17 -->|calls| T17
  S18["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:502"]
  T18["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:701"]
  S18 -->|calls| T18
  S19["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:541"]
  T19["method:UIView::_allSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:17"]
  S19 -->|calls| T19
  S20["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:541"]
  T20["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S20 -->|calls| T20
  S21["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  T21["method:UIView::_allSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:17"]
  S21 -->|calls| T21
  S22["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  T22["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S22 -->|calls| T22
  S23["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  T23["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:541"]
  S23 -->|calls| T23
  S24["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  T24["method:UIAlertController::_lowestCommonAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:721"]
  S24 -->|calls| T24
  S25["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  T25["method:UIView::_firstAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
