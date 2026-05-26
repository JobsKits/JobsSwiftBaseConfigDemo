# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  T1["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S1 -->|calls| T1
  S2["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  T2["method:UIAccessibilityIdentification::byAccessibilityIdentifier<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseProtocolDefs.swift:26"]
  S2 -->|calls| T2
  S3["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  T3["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S3 -->|calls| T3
  S4["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  T4["method:UIView::byClipsToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:51"]
  S4 -->|calls| T4
  S5["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  T5["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S5 -->|calls| T5
  S6["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  T6["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  S6 -->|calls| T6
  S7["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  T7["method:UIAlertController::_hideBackdropAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:680"]
  S7 -->|calls| T7
  S8["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:629"]
  T8["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:601"]
  S8 -->|calls| T8
  S9["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  T9["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  S9 -->|calls| T9
  S10["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:653"]
  T10["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  S10 -->|calls| T10
  S11["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:669"]
  T11["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  S11 -->|calls| T11
  S12["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:669"]
  T12["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:571"]
  S12 -->|calls| T12
  S13["function:UIAlertController::_hideBackdropAll::hideEffect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:682"]
  T13["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S13 -->|calls| T13
  S14["method:UIAlertController::_hideBackdropAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:680"]
  T14["function:UIAlertController::_hideBackdropAll::hideEffect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:682"]
  S14 -->|calls| T14
  S15["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:691"]
  T15["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S15 -->|calls| T15
  S16["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:701"]
  T16["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:703"]
  S16 -->|calls| T16
  S17["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:701"]
  T17["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:703"]
  S17 -->|calls| T17
  S18["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:701"]
  T18["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:703"]
  S18 -->|calls| T18
  S19["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:701"]
  T19["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:703"]
  S19 -->|calls| T19
  S20["method:UIAlertController::_lowestCommonAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:721"]
  T20["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S20 -->|calls| T20
  S21["method:UIAlertController::_lowestCommonAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:721"]
  T21["function:UIAlertController::_lowestCommonAncestor::chain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:722"]
  S21 -->|calls| T21
  S22["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  T22["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:135"]
  S22 -->|calls| T22
  S23["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  T23["method:UIApplication::bestWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:149"]
  S23 -->|calls| T23
  S24["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:42"]
  T24["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:135"]
  S24 -->|calls| T24
  S25["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:42"]
  T25["method:UIApplication::bestWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:149"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
