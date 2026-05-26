# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CATransition::make<br/>JobsByPods/JobsByQuartzCore@Pods/CATransition.swift:14"]
  T1["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S1 -->|calls| T1
  S2["method:Bundle::jobs_enableLanguageHook<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:20"]
  T2["method:JobsLanguageOverrideBundle::localizedString<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/Bundle+多语言国际化.swift:14"]
  S2 -->|calls| T2
  S3["method:Bundle::jobs_enableLanguageHook<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:20"]
  T3["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S3 -->|calls| T3
  S4["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  T4["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S4 -->|calls| T4
  S5["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  T5["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:28"]
  S5 -->|calls| T5
  S6["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  T6["method:Bundle::mapLanguageIdentifier<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:67"]
  S6 -->|calls| T6
  S7["method:Bundle::mapLanguageIdentifier<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:67"]
  T7["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S7 -->|calls| T7
  S8["method:DateFormatter::byRelativeDateFormatting<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:100"]
  T8["method:DateFormatter::byDoesRelativeDateFormatting<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:94"]
  S8 -->|calls| T8
  S9["method:DateFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:252"]
  T9["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S9 -->|calls| T9
  S10["method:DateFormatter::parse<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:256"]
  T10["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:430"]
  S10 -->|calls| T10
  S11["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:33"]
  T11["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S11 -->|calls| T11
  S12["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:33"]
  T12["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S12 -->|calls| T12
  S13["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:33"]
  T13["method:DateFormatter::byLocale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:57"]
  S13 -->|calls| T13
  S14["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:33"]
  T14["method:DateFormatter::byCalendar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:69"]
  S14 -->|calls| T14
  S15["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:45"]
  T15["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S15 -->|calls| T15
  S16["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:45"]
  T16["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S16 -->|calls| T16
  S17["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:45"]
  T17["method:DateFormatter::byLocale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:57"]
  S17 -->|calls| T17
  S18["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:52"]
  T18["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:18"]
  S18 -->|calls| T18
  S19["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:52"]
  T19["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:63"]
  S19 -->|calls| T19
  S20["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:52"]
  T20["method:DateFormatter::byLocale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:57"]
  S20 -->|calls| T20
  S21["method:DateFormatter::jobs_localizedYMD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:59"]
  T21["method:DateFormatter::byLocalizedTemplate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:24"]
  S21 -->|calls| T21
  S22["method:DateFormatter::jobs_localizedYMD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:59"]
  T22["method:DateFormatter::byLocale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:57"]
  S22 -->|calls| T22
  S23["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  T23["function:NSObject::activeRootViewController::rank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:24"]
  S23 -->|calls| T23
  S24["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  T24["function:NSObject::activeRootViewController::rank<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:24"]
  S24 -->|calls| T24
  S25["method:NSObject::activeRootViewController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+UI.swift:18"]
  T25["method:JobsTaskExecutionSequence::first<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
