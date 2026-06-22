# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  T1["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S1 -->|calls| T1
  S2["method:ASDKViewController::loadView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:108"]
  T2["method:ASDKViewController::loadView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:108"]
  S2 -->|calls| T2
  S3["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T3["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  S3 -->|calls| T3
  S4["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T4["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S4 -->|calls| T4
  S5["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  T5["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  S5 -->|calls| T5
  S6["method:ASDKViewController::_updateNodeFallbackSafeArea<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:170"]
  T6["function:ASConcatInsets<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:90"]
  S6 -->|calls| T6
  S7["method:ASDKViewController::viewWillAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:182"]
  T7["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S7 -->|calls| T7
  S8["method:ASDKViewController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:207"]
  T8["function:ASLayoutRangeModeForVisibilityDepth<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASVisibilityProtocols.mm:12"]
  S8 -->|calls| T8
  S9["method:ASDKViewController::visibilityDepthDidChange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:207"]
  T9["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S9 -->|calls| T9
  S10["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T11["method:ASDisplayNode::primitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:126"]
  S11 -->|calls| T11
  S12["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T12["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S12 -->|calls| T12
  S13["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T13["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S13 -->|calls| T13
  S14["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T14["function:ASNodeLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S14 -->|calls| T14
  S15["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T15["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  S15 -->|calls| T15
  S16["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T16["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S16 -->|calls| T16
  S17["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T17["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S17 -->|calls| T17
  S18["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T18["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  S18 -->|calls| T18
  S19["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T19["method:Mutex::Mutex<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S19 -->|calls| T19
  S20["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T20["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S20 -->|calls| T20
  S21["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T21["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  S21 -->|calls| T21
  S22["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T22["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S22 -->|calls| T22
  S23["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  T23["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  S23 -->|calls| T23
  S24["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  T24["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  S24 -->|calls| T24
  S25["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  T25["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
