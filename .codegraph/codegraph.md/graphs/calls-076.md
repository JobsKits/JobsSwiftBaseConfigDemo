# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:69"]
  T1["method:UIBezierPath::byAddLine<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:22"]
  S1 -->|calls| T1
  S2["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:69"]
  T2["method:UIBezierPath::byClose<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIBezierPath/UIBezierPath+DSL.swift:43"]
  S2 -->|calls| T2
  S3["method:IrregularButton::scaled<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:79"]
  T3["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S3 -->|calls| T3
  S4["method:IrregularButton::byStroke<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:94"]
  T4["method:FTDashboardView::byLineWidth<br/>JobsByPods/JobsBy3rdTools@Pods/JobsInstrumentPanelView.swift:375"]
  S4 -->|calls| T4
  S5["method:IrregularButton::byStroke<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:94"]
  T5["method:CAShapeLayer::byStrokeColor<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CAShapeLayer.swift:34"]
  S5 -->|calls| T5
  S6["method:Bundle::jobs_enableLanguageHook<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:19"]
  T6["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:27"]
  S6 -->|calls| T6
  S7["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:27"]
  T7["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:27"]
  S7 -->|calls| T7
  S8["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:27"]
  T8["method:Bundle::jobs_localizedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:27"]
  S8 -->|calls| T8
  S9["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:58"]
  T9["method:Bundle::mapLanguageIdentifier<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:63"]
  S9 -->|calls| T9
  S10["method:Bundle::mapLanguageIdentifier<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:63"]
  T10["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S10 -->|calls| T10
  S11["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:43"]
  T11["method:DateFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:35"]
  S11 -->|calls| T11
  S12["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:43"]
  T12["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:17"]
  S12 -->|calls| T12
  S13["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:43"]
  T13["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:59"]
  S13 -->|calls| T13
  S14["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:43"]
  T14["method:BRSystemDatePicker::byLocale<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRSystemDatePickers.swift:28"]
  S14 -->|calls| T14
  S15["method:DateFormatter::jobs_fullPrinter<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:43"]
  T15["method:DateFormatter::byCalendar<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:65"]
  S15 -->|calls| T15
  S16["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:57"]
  T16["method:DateFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:35"]
  S16 -->|calls| T16
  S17["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:57"]
  T17["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:17"]
  S17 -->|calls| T17
  S18["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:57"]
  T18["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:59"]
  S18 -->|calls| T18
  S19["method:DateFormatter::jobs_iso8601Millis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:57"]
  T19["method:DateFormatter::byLocale<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:53"]
  S19 -->|calls| T19
  S20["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:66"]
  T20["method:DateFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:35"]
  S20 -->|calls| T20
  S21["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:66"]
  T21["method:DateFormatter::byDateFormat<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:17"]
  S21 -->|calls| T21
  S22["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:66"]
  T22["method:DateFormatter::byTimeZone<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:59"]
  S22 -->|calls| T22
  S23["method:DateFormatter::jobs_rfc3339<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:66"]
  T23["method:DateFormatter::byLocale<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:53"]
  S23 -->|calls| T23
  S24["method:DateFormatter::jobs_localizedYMD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:75"]
  T24["method:DateFormatter::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:35"]
  S24 -->|calls| T24
  S25["method:DateFormatter::jobs_localizedYMD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/DateFormatter/DateFormatter+预置.swift:75"]
  T25["method:DateFormatter::byLocalizedTemplate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/DateFormatter/DateFormatter+DSL.swift:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
