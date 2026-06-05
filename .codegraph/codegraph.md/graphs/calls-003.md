# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:String<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:17"]
  T1["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:37"]
  S1 -->|calls| T1
  S2["method:String::svg<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:28"]
  T2["method:String::svgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+SVG.swift:37"]
  S2 -->|calls| T2
  S3["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  T3["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:77"]
  S3 -->|calls| T3
  S4["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:40"]
  T4["method:UIButton::jobs_invokeLongPressBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:83"]
  S4 -->|calls| T4
  S5["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T5["method:UIButton::jobs_invokeTapBlocks<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:77"]
  S5 -->|calls| T5
  S6["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T6["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S6 -->|calls| T6
  S7["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  T7["method:_JobsButtonTapSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:29"]
  S7 -->|calls| T7
  S8["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:120"]
  T8["method:_JobsButtonLongPressSleeve::invoke<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:40"]
  S8 -->|calls| T8
  S9["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  T9["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:176"]
  S9 -->|calls| T9
  S10["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  T10["method:UIButton::_jobsHandleAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:176"]
  S10 -->|calls| T10
  S11["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:165"]
  T11["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  S11 -->|calls| T11
  S12["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  T12["method:UIButton::_bindTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:152"]
  S12 -->|calls| T12
  S13["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:190"]
  T13["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S13 -->|calls| T13
  S14["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:190"]
  T14["method:UIButton::jobs_addTapClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:165"]
  S14 -->|calls| T14
  S15["method:UIButton::onTapAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:203"]
  T15["method:UIButton::jobs_ensureTapHandlerInstalled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:87"]
  S15 -->|calls| T15
  S16["method:UIButton::onLongPressAppend<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:246"]
  T16["method:UIButton::jobs_ensureLongPressRecognizer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:120"]
  S16 -->|calls| T16
  S17["method:UIButton::jobs_enablePressFuseCountUp<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:132"]
  T17["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  S17 -->|calls| T17
  S18["method:UIButton::jobs_disablePressFuseCountUp<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:175"]
  T18["method:JobsPressFuseDriver::endPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:94"]
  S18 -->|calls| T18
  S19["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  T19["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S19 -->|calls| T19
  S20["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  T20["method:JobsPressFuseDriver::endPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:94"]
  S20 -->|calls| T20
  S21["method:UIFont::DINAlternate::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:18"]
  T21["method:UIFont::DINAlternate::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:22"]
  S21 -->|calls| T21
  S22["method:UIFont::DINPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:30"]
  T22["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S22 -->|calls| T22
  S23["method:UIFont::DINPro::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:34"]
  T23["method:UIFont::DINPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DIN.swift:38"]
  S23 -->|calls| T23
  S24["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T24["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S24 -->|calls| T24
  S25["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  T25["method:UIFont::DSDigital::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+DSDigital.swift:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
