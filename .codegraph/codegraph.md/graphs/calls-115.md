# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:101"]
  T1["method:_JobsAnimatedNumberStore::byDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:55"]
  S1 -->|calls| T1
  S2["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:101"]
  T2["method:_JobsAnimatedNumberStore::byStep<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:43"]
  S2 -->|calls| T2
  S3["method:UILabel::byAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:101"]
  T3["method:_JobsAnimatedNumberStore::byStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:49"]
  S3 -->|calls| T3
  S4["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T4["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  S4 -->|calls| T4
  S5["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T5["method:UILabel::_jobsParseNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:221"]
  S5 -->|calls| T5
  S6["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T6["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S6 -->|calls| T6
  S7["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T7["method:UILabel::_jobsParseNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:221"]
  S7 -->|calls| T7
  S8["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T8["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S8 -->|calls| T8
  S9["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T9["method:UILabel::_jobsDecimalPlaces<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:227"]
  S9 -->|calls| T9
  S10["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T10["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  S10 -->|calls| T10
  S11["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T11["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S11 -->|calls| T11
  S12["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T12["method:UILabel::_jobsFormatNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:234"]
  S12 -->|calls| T12
  S13["method:UILabel::byStartAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:116"]
  T13["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:192"]
  S13 -->|calls| T13
  S14["method:UILabel::byStopAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:178"]
  T14["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  S14 -->|calls| T14
  S15["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  T15["method:JobsButtonNumberAnimRunner::stop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:569"]
  S15 -->|calls| T15
  S16["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:192"]
  T16["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S16 -->|calls| T16
  S17["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:192"]
  T17["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  S17 -->|calls| T17
  S18["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:192"]
  T18["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S18 -->|calls| T18
  S19["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:192"]
  T19["method:UILabel::_jobsFormatNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:234"]
  S19 -->|calls| T19
  S20["method:UILabel::_jobsDecimalPlaces<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:227"]
  T20["method:ASTextRange::rangeWithRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:86"]
  S20 -->|calls| T20
  S21["method:UILabel::_jobsDecimalPlaces<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:227"]
  T21["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:66"]
  S21 -->|calls| T21
  S22["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T22["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S22 -->|calls| T22
  S23["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T23["method:CATextLayer::byString<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CATextLayer.swift:18"]
  S23 -->|calls| T23
  S24["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T24["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S24 -->|calls| T24
  S25["method:UILabel::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+富文本.swift:18"]
  T25["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
