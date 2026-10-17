# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T1["method:JobsAudioPlayerEngine::toggle<br/>JobsByPods/JobsAudioRecorder@Pods/Core/JobsAudioPlayerEngine.swift:39"]
  S1 -->|calls| T1
  S2["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T2["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  S2 -->|calls| T2
  S3["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T3["method:UIViewController::jobsDemoActionTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:520"]
  S3 -->|calls| T3
  S4["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T4["method:UIButton::jobs_foregroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:101"]
  S4 -->|calls| T4
  S5["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T5["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  S5 -->|calls| T5
  S6["method:UIViewController::jobsShowDemoActionMenu<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:455"]
  T6["method:UIButton::performTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:181"]
  S6 -->|calls| T6
  S7["method:UIViewController::jobsDemoActionTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:520"]
  T7["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S7 -->|calls| T7
  S8["method:UIViewController::jobsDemoActionTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:520"]
  T8["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S8 -->|calls| T8
  S9["method:UIViewController::jobsDemoActionTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:520"]
  T9["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S9 -->|calls| T9
  S10["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T10["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S10 -->|calls| T10
  S11["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T11["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T12["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S12 -->|calls| T12
  S13["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T13["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S13 -->|calls| T13
  S14["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T14["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S14 -->|calls| T14
  S15["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T15["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S15 -->|calls| T15
  S16["method:UIViewController::jobsAddDemoActionMenuRow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:536"]
  T16["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S16 -->|calls| T16
  S17["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:575"]
  T17["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S17 -->|calls| T17
  S18["method:UIViewController::makeDefaultBackButton<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+GKNavigationBarSwift.swift:575"]
  T18["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S18 -->|calls| T18
  S19["method:UIViewController::bgImageView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+SnapKit.swift:35"]
  T19["method:_ASDisplayView::addSubview:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:229"]
  S19 -->|calls| T19
  S20["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  T20["method:ViewDataProtocol::sendResult<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:42"]
  S20 -->|calls| T20
  S21["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  T21["method:UINavigationController::popViewController<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UINavigationController/UINavigationController+DSL.swift:125"]
  S21 -->|calls| T21
  S22["method:UIViewController::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:59"]
  T22["method:UIViewController::_JobsAppearSwizzler::installIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:104"]
  S22 -->|calls| T22
  S23["method:UIViewController::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:59"]
  T23["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S23 -->|calls| T23
  S24["method:UIViewController::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:59"]
  T24["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  S24 -->|calls| T24
  S25["method:UIViewController::jobs_fireAppearCompletionIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:79"]
  T25["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
