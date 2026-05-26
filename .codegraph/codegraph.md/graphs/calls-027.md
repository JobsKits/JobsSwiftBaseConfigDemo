# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  T1["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:135"]
  S1 -->|calls| T1
  S2["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  T2["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:171"]
  S2 -->|calls| T2
  S3["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:55"]
  T3["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S3 -->|calls| T3
  S4["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:71"]
  T4["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:135"]
  S4 -->|calls| T4
  S5["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:71"]
  T5["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:171"]
  S5 -->|calls| T5
  S6["method:UIApplication::jobsTopMostVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:71"]
  T6["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S6 -->|calls| T6
  S7["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  T7["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S7 -->|calls| T7
  S8["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  T8["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S8 -->|calls| T8
  S9["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  T9["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S9 -->|calls| T9
  S10["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  T10["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S10 -->|calls| T10
  S11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  T11["method:UIApplication::_jobsVisibleVC<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:86"]
  S11 -->|calls| T11
  S12["class:UIApplication<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:27"]
  T12["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:42"]
  S12 -->|calls| T12
  S13["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:135"]
  T13["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:136"]
  S13 -->|calls| T13
  S14["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:135"]
  T14["function:UIApplication::bestWindowScene::rank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:136"]
  S14 -->|calls| T14
  S15["method:UIApplication::bestWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:149"]
  T15["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:157"]
  S15 -->|calls| T15
  S16["method:UIApplication::bestWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:149"]
  T16["function:UIApplication::bestWindow::windowRank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:157"]
  S16 -->|calls| T16
  S17["method:UIApplication::bestRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:171"]
  T17["method:UIApplication::bestWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:149"]
  S17 -->|calls| T17
  S18["method:UIBarItem::byMergeTitleTextAttributes<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:120"]
  T18["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S18 -->|calls| T18
  S19["method:UIBarItem::byCopyTitleTextAttributes<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:130"]
  T19["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S19 -->|calls| T19
  S20["class:UIColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:15"]
  T20["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:17"]
  S20 -->|calls| T20
  S21["class:UIColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:15"]
  T21["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S21 -->|calls| T21
  S22["class:UIColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:15"]
  T22["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S22 -->|calls| T22
  S23["class:UIColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:15"]
  T23["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  S23 -->|calls| T23
  S24["method:UIColor::hex<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:254"]
  T24["method:UIColor::hexAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:258"]
  S24 -->|calls| T24
  S25["method:UIColor::getRGBDelta<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:286"]
  T25["method:UIColor::getRGB<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:265"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
