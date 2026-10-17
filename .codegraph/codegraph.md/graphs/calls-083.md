# `calls 符号关系 - 083`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  T1["method:UIAlertController::_lowestCommonAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:700"]
  S1 -->|calls| T1
  S2["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  T2["method:UIView::_firstAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:34"]
  S2 -->|calls| T2
  S3["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:585"]
  T3["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S3 -->|calls| T3
  S4["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  T4["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  S4 -->|calls| T4
  S5["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  T5["method:UIAlertController::_hideBackdropAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:662"]
  S5 -->|calls| T5
  S6["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  T6["method:UIAlertController::_ensureBGImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:585"]
  S6 -->|calls| T6
  S7["method:UIAlertController::_installLocalBGIfPending<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:610"]
  T7["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S7 -->|calls| T7
  S8["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  T8["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  S8 -->|calls| T8
  S9["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  T9["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  S9 -->|calls| T9
  S10["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  T10["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S10 -->|calls| T10
  S11["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  T11["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S11 -->|calls| T11
  S12["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:651"]
  T12["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  S12 -->|calls| T12
  S13["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:651"]
  T13["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  S13 -->|calls| T13
  S14["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:651"]
  T14["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S14 -->|calls| T14
  S15["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:651"]
  T15["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S15 -->|calls| T15
  S16["method:UIAlertController::_hideBackdropAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:662"]
  T16["function:UIAlertController::_hideBackdropAll::hideEffect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:664"]
  S16 -->|calls| T16
  S17["method:UIAlertController::_hideBackdropAll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:662"]
  T17["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S17 -->|calls| T17
  S18["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:673"]
  T18["method:UnityAppController::transitionToViewController:<br/>Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S18 -->|calls| T18
  S19["method:UIAlertController::_crossfade<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:673"]
  T19["method:UIImageView::byImage<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIImageView/UIImageView+DSL.swift:19"]
  S19 -->|calls| T19
  S20["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:683"]
  T20["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:685"]
  S20 -->|calls| T20
  S21["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:683"]
  T21["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:685"]
  S21 -->|calls| T21
  S22["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:683"]
  T22["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:685"]
  S22 -->|calls| T22
  S23["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:683"]
  T23["function:UIAlertController::_findTextFieldBox::looksLikeBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:685"]
  S23 -->|calls| T23
  S24["method:UIAlertController::_lowestCommonAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:700"]
  T24["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S24 -->|calls| T24
  S25["method:UIAlertController::_lowestCommonAncestor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:700"]
  T25["function:UIAlertController::_lowestCommonAncestor::chain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:701"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
