# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T1["method:_InsetLabel::drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:312"]
  S1 -->|calls| T1
  S2["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T2["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  S2 -->|calls| T2
  S3["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T3["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S3 -->|calls| T3
  S4["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T4["method:_InsetLabel::textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:322"]
  S4 -->|calls| T4
  S5["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T5["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  S5 -->|calls| T5
  S6["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T6["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S6 -->|calls| T6
  S7["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  T7["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  S7 -->|calls| T7
  S8["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  T8["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  S8 -->|calls| T8
  S9["method:_JobsAnimatedNumberStore::byTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:36"]
  T9["method:JobsLottieConfig::configure<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshEnums.swift:115"]
  S9 -->|calls| T9
  S10["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:94"]
  T10["method:_JobsAnimatedNumberStore::byCompletion<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:66"]
  S10 -->|calls| T10
  S11["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:94"]
  T11["method:_JobsAnimatedNumberStore::byFPS<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:60"]
  S11 -->|calls| T11
  S12["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:94"]
  T12["method:_JobsAnimatedNumberStore::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:54"]
  S12 -->|calls| T12
  S13["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:94"]
  T13["method:_JobsAnimatedNumberStore::byStep<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:42"]
  S13 -->|calls| T13
  S14["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:94"]
  T14["method:_JobsAnimatedNumberStore::byStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:48"]
  S14 -->|calls| T14
  S15["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T15["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:180"]
  S15 -->|calls| T15
  S16["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T16["method:UILabel::_jobsParseNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:219"]
  S16 -->|calls| T16
  S17["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T17["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S17 -->|calls| T17
  S18["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T18["method:UILabel::_jobsParseNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:219"]
  S18 -->|calls| T18
  S19["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T19["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S19 -->|calls| T19
  S20["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T20["method:UILabel::_jobsDecimalPlaces<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:225"]
  S20 -->|calls| T20
  S21["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T21["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:115"]
  S21 -->|calls| T21
  S22["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T22["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S22 -->|calls| T22
  S23["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T23["method:UILabel::_jobsFormatNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:233"]
  S23 -->|calls| T23
  S24["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T24["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  S24 -->|calls| T24
  S25["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:109"]
  T25["method:JobsTimer::start<br/>JobsByPods/JobsSwiftTimer@Pods/JobsSwiftTimer.swift:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
