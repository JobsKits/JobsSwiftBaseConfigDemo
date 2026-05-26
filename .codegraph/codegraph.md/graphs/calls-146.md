# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T2["method:JobsNavBar::refreshTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:194"]
  S2 -->|calls| T2
  S3["method:JobsNavBar::bind<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:155"]
  T3["method:JobsNavBar::refreshTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:194"]
  S3 -->|calls| T3
  S4["method:JobsNavBar::applyStyle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:185"]
  T4["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S4 -->|calls| T4
  S5["method:JobsNavBar::applyStyle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:185"]
  T5["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:66"]
  S5 -->|calls| T5
  S6["method:JobsNavBar::refreshTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:194"]
  T6["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S6 -->|calls| T6
  S7["method:JobsNavBar::refreshTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:194"]
  T7["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S7 -->|calls| T7
  S8["method:JobsNavBar::relayoutTitleConstraints<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:204"]
  T8["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S8 -->|calls| T8
  S9["method:JobsNavBar::relayoutTitleConstraints<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:204"]
  T9["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S9 -->|calls| T9
  S10["method:JobsNavBar::rebuildBackButton<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:218"]
  T10["method:JobsNavBar::backTapped<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:263"]
  S10 -->|calls| T10
  S11["method:JobsNavBar::backTapped<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:263"]
  T11["function:debugOnly<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:19"]
  S11 -->|calls| T11
  S12["method:JobsNavBar::backTapped<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:263"]
  T12["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  S12 -->|calls| T12
  S13["method:JobsNavBar::safeAreaInsetsDidChange<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:279"]
  T13["method:JobsNavBar::safeAreaInsetsDidChange<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:279"]
  S13 -->|calls| T13
  S14["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:66"]
  T14["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S14 -->|calls| T14
  S15["method:UIView::byVisible<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:66"]
  T15["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:60"]
  S15 -->|calls| T15
  S16["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:76"]
  T16["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:89"]
  S16 -->|calls| T16
  S17["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:76"]
  T17["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:89"]
  S17 -->|calls| T17
  S18["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:84"]
  T18["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:76"]
  S18 -->|calls| T18
  S19["method:UIButton::onTap<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:94"]
  T19["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S19 -->|calls| T19
  S20["method:UIButton::onTap<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:94"]
  T20["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:84"]
  S20 -->|calls| T20
  S21["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  T21["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  S21 -->|calls| T21
  S22["method:JobsAgent::promise<br/>JobsByPods/JobsNetworking@Pods/Adapters/PromiseKit/JobsAgent+PromiseKit.swift:14"]
  T22["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S22 -->|calls| T22
  S23["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T23["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S23 -->|calls| T23
  S24["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T24["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S24 -->|calls| T24
  S25["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  T25["method:UnityURLRequest::requestForTask:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
