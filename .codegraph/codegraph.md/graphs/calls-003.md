# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsL10nRegression::installBindingCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:101"]
  T1["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:109"]
  S1 -->|calls| T1
  S2["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T2["method:LanguageManager::switchTo<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:58"]
  S2 -->|calls| T2
  S3["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T3["method:LanguageManager::followSystemLanguage<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:68"]
  S3 -->|calls| T3
  S4["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T4["method:JobsL10nRegression::installProviderCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:88"]
  S4 -->|calls| T4
  S5["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T5["method:JobsL10nRegression::installProviderCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:88"]
  S5 -->|calls| T5
  S6["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T6["method:JobsL10nRegression::installBindingCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:101"]
  S6 -->|calls| T6
  S7["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T7["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:109"]
  S7 -->|calls| T7
  S8["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T8["method:JobsL10nRegression::installBindingCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:101"]
  S8 -->|calls| T8
  S9["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T9["method:TRAutoRefresh::unbind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:171"]
  S9 -->|calls| T9
  S10["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T10["method:JobsL10nRegression::installBindingCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:101"]
  S10 -->|calls| T10
  S11["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  T11["method:TRAutoRefresh::refreshAll<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:137"]
  S11 -->|calls| T11
  S12["method:MarkdownProbe::userContentController<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:57"]
  T12["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S12 -->|calls| T12
  S13["method:MarkdownProbe::userContentController<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:57"]
  T13["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S13 -->|calls| T13
  S14["method:MarkdownProbe::userContentController<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:57"]
  T14["function:body<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S14 -->|calls| T14
  S15["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T15["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S15 -->|calls| T15
  S16["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T16["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S16 -->|calls| T16
  S17["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T17["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  S17 -->|calls| T17
  S18["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T18["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  S18 -->|calls| T18
  S19["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T19["method:ASTextContainer::encodeWithCoder:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:167"]
  S19 -->|calls| T19
  S20["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T20["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  S20 -->|calls| T20
  S21["method:JobsMarkdownWebKitRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsMarkdownWebKitRegression.swift:69"]
  T21["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:158"]
  S21 -->|calls| T21
  S22["class:NumericReleaseCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:13"]
  T22["field:NumericReleaseCapture::onRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:14"]
  S22 -->|calls| T22
  S23["method:ClockResults::record<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:41"]
  T23["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S23 -->|calls| T23
  S24["property:ClockResults::rejectsRollback<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:50"]
  T24["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S24 -->|calls| T24
  S25["method:JobsNumericRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:70"]
  T25["method:JobsNumericRegression::verifyStorageAndClockReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsNumericRegression.swift:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
