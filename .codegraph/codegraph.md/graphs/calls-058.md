# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T1["method:UIButton.Configuration::byTitleAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:284"]
  S1 -->|calls| T1
  S2["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T2["method:UIButton.Configuration::byTitlePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:276"]
  S2 -->|calls| T2
  S3["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T3["method:UIButton.Configuration::byImagePadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:182"]
  S3 -->|calls| T3
  S4["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T4["method:UIButton.Configuration::byImagePlacement<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:174"]
  S4 -->|calls| T4
  S5["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T5["method:UIButton.Configuration::byPreferredSymbolConfigurationForImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:160"]
  S5 -->|calls| T5
  S6["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T6["method:UIButton.Configuration::byImageColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:152"]
  S6 -->|calls| T6
  S7["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T7["method:UIButton.Configuration::bySubtitleTextAttributesTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:268"]
  S7 -->|calls| T7
  S8["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T8["method:UIButton.Configuration::byAttributedSubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:252"]
  S8 -->|calls| T8
  S9["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T9["method:UIButton.Configuration::bySubtitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:244"]
  S9 -->|calls| T9
  S10["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T10["method:UIButton.Configuration::byTitleTextAttributesTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:236"]
  S10 -->|calls| T10
  S11["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T11["method:UIButton.Configuration::byAttributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:220"]
  S11 -->|calls| T11
  S12["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T12["method:UIButton.Configuration::byMacIdiomStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:97"]
  S12 -->|calls| T12
  S13["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T13["method:UIButton.Configuration::byButtonSize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:89"]
  S13 -->|calls| T13
  S14["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T14["method:UIButton.Configuration::byBaseBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:124"]
  S14 -->|calls| T14
  S15["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T15["method:UIButton.Configuration::byBaseForegroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:116"]
  S15 -->|calls| T15
  S16["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T16["method:UIButton.Configuration::byIndicatorColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:331"]
  S16 -->|calls| T16
  S17["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T17["method:UIButton.Configuration::byIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:322"]
  S17 -->|calls| T17
  S18["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T18["method:UIButton.Configuration::bySymbolContentTransition<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:340"]
  S18 -->|calls| T18
  S19["method:UICollectionView::byReloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+DSL.swift:373"]
  T19["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S19 -->|calls| T19
  S20["method:UICollectionView::byRegisterCellNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:20"]
  T20["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S20 -->|calls| T20
  S21["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:31"]
  T21["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S21 -->|calls| T21
  S22["method:UICollectionView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:42"]
  T22["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S22 -->|calls| T22
  S23["method:UICollectionView::byRegisterCellNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:53"]
  T23["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S23 -->|calls| T23
  S24["method:UICollectionView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:63"]
  T24["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S24 -->|calls| T24
  S25["method:UICollectionView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:73"]
  T25["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
