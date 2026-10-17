# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:470"]
  T1["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:353"]
  S1 -->|calls| T1
  S2["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:470"]
  T2["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S2 -->|calls| T2
  S3["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:470"]
  T3["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  S3 -->|calls| T3
  S4["method:UIAlertController::byCardBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:470"]
  T4["method:MTLSamplerDescriptor::byBorderColor<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLSamplerDescriptor.swift:43"]
  S4 -->|calls| T4
  S5["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T5["method:UIAlertController::_enqueueBGTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:353"]
  S5 -->|calls| T5
  S6["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T6["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S6 -->|calls| T6
  S7["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T7["method:UIAlertController::_withAlertCard<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:635"]
  S7 -->|calls| T7
  S8["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T8["method:UIAlertController::textField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:143"]
  S8 -->|calls| T8
  S9["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T9["method:UIAlertController::_findTextFieldBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:683"]
  S9 -->|calls| T9
  S10["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T10["method:UIBarItem::byTag<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:54"]
  S10 -->|calls| T10
  S11["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T11["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:47"]
  S11 -->|calls| T11
  S12["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T12["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S12 -->|calls| T12
  S13["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T13["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S13 -->|calls| T13
  S14["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T14["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S14 -->|calls| T14
  S15["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T15["method:UIView::byMasksToBounds<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:18"]
  S15 -->|calls| T15
  S16["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T16["method:RTBadgeConfig::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:75"]
  S16 -->|calls| T16
  S17["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T17["method:MTLSamplerDescriptor::byBorderColor<br/>JobsByPods/JobsSwiftDSL@Pods/MetalKit/MTLSamplerDescriptor.swift:43"]
  S17 -->|calls| T17
  S18["method:UIAlertController::byTextFieldOuterBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:488"]
  T18["method:UIView::byBorderWidth<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:102"]
  S18 -->|calls| T18
  S19["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:527"]
  T19["method:UIView::_allSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:16"]
  S19 -->|calls| T19
  S20["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:527"]
  T20["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S20 -->|calls| T20
  S21["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:527"]
  T21["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S21 -->|calls| T21
  S22["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  T22["method:UIView::_allSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:16"]
  S22 -->|calls| T22
  S23["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  T23["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S23 -->|calls| T23
  S24["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  T24["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S24 -->|calls| T24
  S25["method:UIAlertController::_findAlertCardView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:556"]
  T25["method:UIAlertController::_findAnyActionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:527"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
