# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:192"]
  T1["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:163"]
  S1 -->|calls| T1
  S2["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:192"]
  T2["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:223"]
  S2 -->|calls| T2
  S3["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:192"]
  T3["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:241"]
  S3 -->|calls| T3
  S4["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:192"]
  T4["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:223"]
  S4 -->|calls| T4
  S5["method:JobsCountdownBtnCtrl::onTickMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:192"]
  T5["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:241"]
  S5 -->|calls| T5
  S6["method:JobsCountdownBtnCtrl::applyRender<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:223"]
  T6["method:ASTextNodeDrawParameter::rendererForBounds:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTextNode.mm:193"]
  S6 -->|calls| T6
  S7["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:241"]
  T7["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:163"]
  S7 -->|calls| T7
  S8["method:JobsCountdownBtnCtrl::finishMainActor<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:241"]
  T8["method:JobsCountdownBtnCtrl::stop<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:163"]
  S8 -->|calls| T8
  S9["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:63"]
  T9["method:UIButton::onTap<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:184"]
  S9 -->|calls| T9
  S10["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:63"]
  T10["field:JobsCountdownBtnConfig::onTapWhileRunning<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnConfig.swift:66"]
  S10 -->|calls| T10
  S11["method:UIButton::byCountdownOnTapAuto<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:63"]
  T11["method:JobsCountdownBtnCtrl::start<br/>JobsByPods/JobsCountdownButton@Pods/JobsCountdownBtnCtrl.swift:124"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsStopCountdown<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:83"]
  T12["method:JobsLabelScrollController::stop<br/>JobsByPods/JobsSwiftUILabelScrolling@Pods/Core/JobsLabelScrollController/JobsLabelScrollController.swift:107"]
  S12 -->|calls| T12
  S13["method:UIButton::countdownStart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:90"]
  T13["method:JobsLabelScrollController::start<br/>JobsByPods/JobsSwiftUILabelScrolling@Pods/Core/JobsLabelScrollController/JobsLabelScrollController.swift:69"]
  S13 -->|calls| T13
  S14["method:UIButton::countdownStop<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:97"]
  T14["method:JobsLabelScrollController::stop<br/>JobsByPods/JobsSwiftUILabelScrolling@Pods/Core/JobsLabelScrollController/JobsLabelScrollController.swift:107"]
  S14 -->|calls| T14
  S15["method:UIButton::countdownRestart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:103"]
  T15["method:JobsLabelScrollController::stop<br/>JobsByPods/JobsSwiftUILabelScrolling@Pods/Core/JobsLabelScrollController/JobsLabelScrollController.swift:107"]
  S15 -->|calls| T15
  S16["method:UIButton::countdownRestart<br/>JobsByPods/JobsCountdownButton@Pods/UIButton+倒计时.swift:103"]
  T16["method:JobsLabelScrollController::start<br/>JobsByPods/JobsSwiftUILabelScrolling@Pods/Core/JobsLabelScrollController/JobsLabelScrollController.swift:69"]
  S16 -->|calls| T16
  S17["method:AESCBC::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:14"]
  T17["method:AESCBC::crypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:24"]
  S17 -->|calls| T17
  S18["method:AESCBC::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:18"]
  T18["method:AESCBC::crypt<br/>JobsByPods/JobsCryptoKit@Pods/AESCBC.swift:24"]
  S18 -->|calls| T18
  S19["property:Data::hexString<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:25"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["class:Data<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:24"]
  T20["method:ASEditableTextNode::indexOfAccessibilityElement:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:875"]
  S20 -->|calls| T20
  S21["class:Data<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:24"]
  T21["field:Data::hex<br/>JobsByPods/JobsCryptoKit@Pods/BaseCrypto.swift:30"]
  S21 -->|calls| T21
  S22["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:14"]
  T22["function:makeSymmetricKey<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:106"]
  S22 -->|calls| T22
  S23["method:JobsAES::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:14"]
  T23["method:JobsAES::encryptAuthenticatedCBC<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:48"]
  S23 -->|calls| T23
  S24["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T24["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:82"]
  S24 -->|calls| T24
  S25["method:JobsAES::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:23"]
  T25["method:JobsAES::utf8<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/AESGCM.swift:70"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
