# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:73"]
  T1["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S1 -->|calls| T1
  S2["method:UICollectionView::byRegisterSupplementaryView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:86"]
  T2["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S2 -->|calls| T2
  S3["method:UICollectionView::byRegisterSupplementaryNib<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:100"]
  T3["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S3 -->|calls| T3
  S4["method:UICollectionView::byRegisterHeaderView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:111"]
  T4["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S4 -->|calls| T4
  S5["method:UICollectionView::byRegisterHeaderView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:122"]
  T5["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S5 -->|calls| T5
  S6["method:UICollectionView::byRegisterFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:133"]
  T6["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S6 -->|calls| T6
  S7["method:UICollectionView::byRegisterFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+Register.swift:144"]
  T7["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S7 -->|calls| T7
  S8["class:UICollectionView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+校验.swift:15"]
  T8["method:UICollectionView::isValid<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionView/UICollectionView+校验.swift:17"]
  S8 -->|calls| T8
  S9["method:UIFont::DINAlternate::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:18"]
  T9["method:UIFont::DINAlternate::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:22"]
  S9 -->|calls| T9
  S10["method:UIFont::DINPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:30"]
  T10["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S10 -->|calls| T10
  S11["method:UIFont::DINPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:34"]
  T11["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S11 -->|calls| T11
  S12["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T12["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S12 -->|calls| T12
  S13["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T13["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S13 -->|calls| T13
  S14["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T14["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S14 -->|calls| T14
  S15["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T15["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S15 -->|calls| T15
  S16["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T16["method:UIFont::DSDigital::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:32"]
  S16 -->|calls| T16
  S17["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T17["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S17 -->|calls| T17
  S18["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T18["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  S18 -->|calls| T18
  S19["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T19["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  S19 -->|calls| T19
  S20["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T20["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  S20 -->|calls| T20
  S21["method:UIFont::FZZCHJW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:19"]
  T21["method:UIFont::FZZCHJW::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+FZZCHJW.swift:32"]
  S21 -->|calls| T21
  S22["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T22["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S22 -->|calls| T22
  S23["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T23["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  S23 -->|calls| T23
  S24["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T24["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  S24 -->|calls| T24
  S25["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  T25["method:UIFont::HYNuoMiTuanW::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+HYNuoMiTuanW.swift:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
