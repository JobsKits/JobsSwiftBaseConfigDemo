# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::SFProText::Thin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:23"]
  T1["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S1 -->|calls| T1
  S2["method:UIFont::SFProText::Light<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:27"]
  T2["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S2 -->|calls| T2
  S3["method:UIFont::SFProText::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:31"]
  T3["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S3 -->|calls| T3
  S4["method:UIFont::SFProText::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:35"]
  T4["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S4 -->|calls| T4
  S5["method:UIFont::SFProText::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:39"]
  T5["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S5 -->|calls| T5
  S6["method:UIFont::SFProText::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:43"]
  T6["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S6 -->|calls| T6
  S7["method:UIFont::SFProDisplay::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:83"]
  T7["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S7 -->|calls| T7
  S8["method:UIFont::SFProDisplay::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:87"]
  T8["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S8 -->|calls| T8
  S9["method:UIFont::SFProDisplay::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:91"]
  T9["method:UIFont::SFProText::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:71"]
  S9 -->|calls| T9
  S10["method:UIFont::SFProDisplay::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:95"]
  T10["method:UIFont::SFProDisplay::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SFPro.swift:117"]
  S10 -->|calls| T10
  S11["method:UIFont::SourceSansPro::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:19"]
  T11["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S11 -->|calls| T11
  S12["method:UIFont::SourceSansPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:23"]
  T12["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S12 -->|calls| T12
  S13["method:UIFont::SourceSansPro::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:27"]
  T13["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S13 -->|calls| T13
  S14["method:UIFont::SourceSansPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:31"]
  T14["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S14 -->|calls| T14
  S15["method:UITableView::reloadCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:28"]
  T15["method:UITableView::reloadCells<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:34"]
  S15 -->|calls| T15
  S16["method:UITableView::reloadSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:50"]
  T16["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S16 -->|calls| T16
  S17["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  T17["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S17 -->|calls| T17
  S18["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T18["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S18 -->|calls| T18
  S19["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T19["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S19 -->|calls| T19
  S20["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  T20["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S20 -->|calls| T20
  S21["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  T21["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  S21 -->|calls| T21
  S22["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  T22["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  S22 -->|calls| T22
  S23["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:64"]
  T23["method:UIAlertAction::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32"]
  S23 -->|calls| T23
  S24["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T24["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:87"]
  S24 -->|calls| T24
  S25["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:18"]
  T25["function:randomBytes<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:161"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
