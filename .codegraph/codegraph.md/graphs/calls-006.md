# `calls 符号关系 - 006`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::SFProDisplay::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:87"]
  T1["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S1 -->|calls| T1
  S2["method:UIFont::SFProDisplay::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:91"]
  T2["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S2 -->|calls| T2
  S3["method:UIFont::SFProDisplay::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:95"]
  T3["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:117"]
  S3 -->|calls| T3
  S4["method:UIFont::SourceSansPro::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:19"]
  T4["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S4 -->|calls| T4
  S5["method:UIFont::SourceSansPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:23"]
  T5["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S5 -->|calls| T5
  S6["method:UIFont::SourceSansPro::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:27"]
  T6["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S6 -->|calls| T6
  S7["method:UIFont::SourceSansPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:31"]
  T7["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S7 -->|calls| T7
  S8["method:UITableView::reloadCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:28"]
  T8["method:UITableView::reloadCells<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:34"]
  S8 -->|calls| T8
  S9["method:UITableView::reloadSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:50"]
  T9["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S9 -->|calls| T9
  S10["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  T10["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S10 -->|calls| T10
  S11["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T11["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S11 -->|calls| T11
  S12["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T12["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S12 -->|calls| T12
  S13["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  T13["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S13 -->|calls| T13
  S14["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  T14["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  S14 -->|calls| T14
  S15["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  T15["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  S15 -->|calls| T15
  S16["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:64"]
  T16["method:UIAlertAction::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32"]
  S16 -->|calls| T16
  S17["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T17["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S17 -->|calls| T17
  S18["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T18["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:161"]
  S18 -->|calls| T18
  S19["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T19["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  S19 -->|calls| T19
  S20["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T20["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S20 -->|calls| T20
  S21["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:46"]
  T21["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:128"]
  S21 -->|calls| T21
  S22["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  T22["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S22 -->|calls| T22
  S23["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:95"]
  T23["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S23 -->|calls| T23
  S24["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:128"]
  T24["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S24 -->|calls| T24
  S25["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:15"]
  T25["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:148"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
