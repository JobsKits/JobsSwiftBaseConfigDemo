# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  T1["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S1 -->|calls| T1
  S2["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  T2["method:UIView::jobs_updateFuseProgress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:281"]
  S2 -->|calls| T2
  S3["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  T3["method:JobsTimer::onTick<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:237"]
  S3 -->|calls| T3
  S4["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  T4["method:JobsButtonNumberAnimRunner::stop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:610"]
  S4 -->|calls| T4
  S5["method:JobsPressFuseDriver::endPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:94"]
  T5["method:JobsTimer::stop<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:219"]
  S5 -->|calls| T5
  S6["method:JobsPressFuseDriver::endPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:94"]
  T6["method:UIView::jobs_cancelFuseCountdown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:208"]
  S6 -->|calls| T6
  S7["method:UIButton::jobs_enablePressFuseCountUp<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:132"]
  T7["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  S7 -->|calls| T7
  S8["method:UIButton::jobs_disablePressFuseCountUp<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:175"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["method:UIButton::jobs_disablePressFuseCountUp<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:175"]
  T9["method:JobsPressFuseDriver::endPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:94"]
  S9 -->|calls| T9
  S10["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  T11["method:JobsPressFuseDriver::begin<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:42"]
  S11 -->|calls| T11
  S12["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:UIButton::jobs_onPressFuse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:194"]
  T13["method:JobsPressFuseDriver::endPress<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+长按外圈Layer自增UI效果.swift:94"]
  S13 -->|calls| T13
  S14["method:UIButton::disableAfterClick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+防止快速连点.swift:16"]
  T14["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S14 -->|calls| T14
  S15["method:UIBackgroundConfiguration::by<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:180"]
  T15["enum_member:HTTPMethod::patch<br/>JobsByPods/JobsNetworking@Pods/Support/HTTPMethod.swift:15"]
  S15 -->|calls| T15
  S16["method:UIButton.Configuration::byBackgroundPatch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:106"]
  T16["enum_member:HTTPMethod::patch<br/>JobsByPods/JobsNetworking@Pods/Support/HTTPMethod.swift:15"]
  S16 -->|calls| T16
  S17["method:UIButton.Configuration::byBaseForegroundCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:132"]
  T17["method:UIButton.Configuration::byBaseForegroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:116"]
  S17 -->|calls| T17
  S18["method:UIButton.Configuration::byBaseBackgroundCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:138"]
  T18["method:UIButton.Configuration::byBaseBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:124"]
  S18 -->|calls| T18
  S19["method:UIButton.Configuration::byPreferredSymbolConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:168"]
  T19["method:UIButton.Configuration::byPreferredSymbolConfigurationForImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:160"]
  S19 -->|calls| T19
  S20["method:UIButton.Configuration::byShowsActivity<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:198"]
  T20["method:UIButton.Configuration::byShowsActivityIndicator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:190"]
  S20 -->|calls| T20
  S21["method:UIButton.Configuration::byTitleTextAttributesTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:236"]
  T21["method:UIButton.Configuration::byTitleTextAttributesTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:236"]
  S21 -->|calls| T21
  S22["method:UIButton.Configuration::bySubtitleTextAttributesTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:268"]
  T22["method:UIButton.Configuration::bySubtitleTextAttributesTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:268"]
  S22 -->|calls| T22
  S23["method:UIButton.Configuration::byAutoUpdateForSelection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:316"]
  T23["method:UIButton.Configuration::byAutomaticallyUpdateForSelection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:308"]
  S23 -->|calls| T23
  S24["method:UIButton.Configuration::by<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:359"]
  T24["enum_member:HTTPMethod::patch<br/>JobsByPods/JobsNetworking@Pods/Support/HTTPMethod.swift:15"]
  S24 -->|calls| T24
  S25["method:UIButton.Configuration::byForcePlainKeepingContent<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:367"]
  T25["method:UIButton.Configuration::byActivityIndicatorColorTransformer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:204"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
