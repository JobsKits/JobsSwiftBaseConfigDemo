# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobs_invokeLongPressBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:82"]
  T1["property:UIButton::jobsLongPressBlock<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:62"]
  S1 -->|calls| T1
  S2["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:86"]
  T2["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:76"]
  S2 -->|calls| T2
  S3["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:86"]
  T3["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:164"]
  S3 -->|calls| T3
  S4["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:86"]
  T4["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:28"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:117"]
  T5["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:110"]
  S5 -->|calls| T5
  S6["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:117"]
  T6["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S6 -->|calls| T6
  S7["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:117"]
  T7["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:39"]
  S7 -->|calls| T7
  S8["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:146"]
  T8["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S8 -->|calls| T8
  S9["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:146"]
  T9["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S9 -->|calls| T9
  S10["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:159"]
  T10["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:146"]
  S10 -->|calls| T10
  S11["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:164"]
  T11["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:146"]
  S11 -->|calls| T11
  S12["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  T12["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S12 -->|calls| T12
  S13["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:184"]
  T13["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:164"]
  S13 -->|calls| T13
  S14["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:184"]
  T14["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:159"]
  S14 -->|calls| T14
  S15["method:UIButton::onTapAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:197"]
  T15["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:86"]
  S15 -->|calls| T15
  S16["method:UIButton::onLongPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:206"]
  T16["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:117"]
  S16 -->|calls| T16
  S17["method:UIButton::onLongPressAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:217"]
  T17["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:117"]
  S17 -->|calls| T17
  S18["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  T18["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  S18 -->|calls| T18
  S19["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T19["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S19 -->|calls| T19
  S20["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T20["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S20 -->|calls| T20
  S21["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T21["property:UIButton::title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:43"]
  S21 -->|calls| T21
  S22["method:UIButton::jobs_title<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:47"]
  T22["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S22 -->|calls| T22
  S23["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:57"]
  T23["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S23 -->|calls| T23
  S24["method:UIButton::jobs_attributedTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:57"]
  T24["method:ASButtonNode::attributedTitleForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:333"]
  S24 -->|calls| T24
  S25["property:UIButton::subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:67"]
  T25["method:UIButton::jobs_subTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+获取UI.swift:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
