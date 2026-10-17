# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  T1["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S1 -->|calls| T1
  S2["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  T2["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S2 -->|calls| T2
  S3["method:JobsBlockStorageRegression::verifyRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsBlockStorageRegression.swift:69"]
  T3["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:61"]
  S3 -->|calls| T3
  S4["class:ReleaseCapture<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:20"]
  T4["field:ReleaseCapture::onRelease<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:21"]
  S4 -->|calls| T4
  S5["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T5["method:JobsL10nRegression::verifyProviderAndReleaseReentry<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:109"]
  S5 -->|calls| T5
  S6["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T6["method:Bundle::enableLanguageOverride<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:31"]
  S6 -->|calls| T6
  S7["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T7["method:Bundle::setLanguageBundle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:39"]
  S7 -->|calls| T7
  S8["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T8["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:16"]
  S8 -->|calls| T8
  S9["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T9["method:LanguageManager::switchTo<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:58"]
  S9 -->|calls| T9
  S10["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T10["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:16"]
  S10 -->|calls| T10
  S11["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T11["method:LanguageManager::followSystemLanguage<br/>JobsByPods/Jobsl10n@Pods/LanguageManager.swift:68"]
  S11 -->|calls| T11
  S12["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T12["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:48"]
  S12 -->|calls| T12
  S13["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T13["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:48"]
  S13 -->|calls| T13
  S14["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T14["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:194"]
  S14 -->|calls| T14
  S15["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T15["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:194"]
  S15 -->|calls| T15
  S16["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T16["method:TRAutoRefresh::refreshAll<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:137"]
  S16 -->|calls| T16
  S17["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T17["method:TRAutoRefresh::Marker::pack<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:24"]
  S17 -->|calls| T17
  S18["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T18["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:194"]
  S18 -->|calls| T18
  S19["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T19["method:TRAutoRefresh::refreshAll<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:137"]
  S19 -->|calls| T19
  S20["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T20["method:TRAutoRefresh::unbind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:171"]
  S20 -->|calls| T20
  S21["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T21["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:109"]
  S21 -->|calls| T21
  S22["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T22["method:TRAutoRefresh::register<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:109"]
  S22 -->|calls| T22
  S23["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T23["method:TRAutoRefresh::refreshAll<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:137"]
  S23 -->|calls| T23
  S24["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T24["method:TRAutoRefresh::unbind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:171"]
  S24 -->|calls| T24
  S25["method:JobsL10nRegression::main<br/>.github/tests/JobsPodsUpgrade/Core/JobsL10nRegression.swift:39"]
  T25["method:Bundle::clearLanguageBundle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
