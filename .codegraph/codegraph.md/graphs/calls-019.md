# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T1["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S1 -->|calls| T1
  S2["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T2["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T3["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T4["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T5["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T6["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T7["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T8["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S8 -->|calls| T8
  S9["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T9["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S9 -->|calls| T9
  S10["method:ASDKViewController::initWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:42"]
  T10["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S10 -->|calls| T10
  S11["method:ASDKViewController::initWithNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:55"]
  T11["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S11 -->|calls| T11
  S12["method:ASDKViewController::initWithNode:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:55"]
  T12["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S12 -->|calls| T12
  S13["method:ASDKViewController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:67"]
  T13["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S13 -->|calls| T13
  S14["method:ASDKViewController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:67"]
  T14["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S14 -->|calls| T14
  S15["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  T15["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S15 -->|calls| T15
  S16["method:ASDKViewController::loadView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:108"]
  T16["method:ASDKViewController::loadView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:108"]
  S16 -->|calls| T16
  S17["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T17["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  S17 -->|calls| T17
  S18["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T18["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S18 -->|calls| T18
  S19["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  T19["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  S19 -->|calls| T19
  S20["method:ASDKViewController::_updateNodeFallbackSafeArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:170"]
  T20["function:ASConcatInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:90"]
  S20 -->|calls| T20
  S21["method:ASDKViewController::viewWillAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:182"]
  T21["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S21 -->|calls| T21
  S22["method:ASDKViewController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:207"]
  T22["function:ASLayoutRangeModeForVisibilityDepth<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVisibilityProtocols.mm:12"]
  S22 -->|calls| T22
  S23["method:ASDKViewController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:207"]
  T23["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S23 -->|calls| T23
  S24["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  T24["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S24 -->|calls| T24
  S25["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T25["method:ASDisplayNode::primitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:126"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
