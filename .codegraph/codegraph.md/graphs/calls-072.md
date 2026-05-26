# `calls 符号关系 - 072`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UILabel::byStopAnimatedTextNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:171"]
  T1["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:180"]
  S1 -->|calls| T1
  S2["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:180"]
  T2["method:UIActivityIndicatorView::stop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:65"]
  S2 -->|calls| T2
  S3["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  T3["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S3 -->|calls| T3
  S4["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  T4["method:UILabel::_jobsStopAnimatedNumberTimer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:180"]
  S4 -->|calls| T4
  S5["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  T5["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S5 -->|calls| T5
  S6["method:UILabel::_jobsTickAnimatedNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:186"]
  T6["method:UILabel::_jobsFormatNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:233"]
  S6 -->|calls| T6
  S7["method:UILabel::_jobsDecimalPlaces<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:225"]
  T7["method:StringView::Str<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/utils/StringView.h:64"]
  S7 -->|calls| T7
  S8["method:UILabel::_jobsDecimalPlaces<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+动效数字.swift:225"]
  T8["method:JobsTaskExecutionSequence::prefix<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:75"]
  S8 -->|calls| T8
  S9["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T9["method:JobsMemoryCache::removeAll<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:57"]
  S9 -->|calls| T9
  S10["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T10["method:CALayer::byMask<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:126"]
  S10 -->|calls| T10
  S11["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T11["method:JXSegmentedIndicatorGradientLineView::byEndPoint<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:32"]
  S11 -->|calls| T11
  S12["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T12["method:JXSegmentedIndicatorGradientLineView::byStartPoint<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:26"]
  S12 -->|calls| T12
  S13["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T13["method:JXSegmentedIndicatorGradientLineView::byColors<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorGradientLineView.swift:20"]
  S13 -->|calls| T13
  S14["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T14["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S14 -->|calls| T14
  S15["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T15["method:CALayer::byContentsScale<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:162"]
  S15 -->|calls| T15
  S16["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T16["method:CATextLayer::byAlignmentMode<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:63"]
  S16 -->|calls| T16
  S17["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T17["method:CATextLayer::byFontSize<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:39"]
  S17 -->|calls| T17
  S18["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T18["method:UILabel::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:46"]
  S18 -->|calls| T18
  S19["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T19["method:CATextLayer::byString<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:20"]
  S19 -->|calls| T19
  S20["method:UILabel::jobs_setGradientText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+字体颜色渐变.swift:19"]
  T20["method:UILabel::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S20 -->|calls| T20
  S21["method:UILabel::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+富文本.swift:19"]
  T21["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S21 -->|calls| T21
  S22["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T22["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S22 -->|calls| T22
  S23["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T23["method:JobsTaskExecutionSequence::filter<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:79"]
  S23 -->|calls| T23
  S24["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T24["method:CATextLayer::byWrapped<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:51"]
  S24 -->|calls| T24
  S25["method:UILabel::transformLayer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+方向变换.swift:19"]
  T25["method:CATextLayer::byTruncationMode<br/>JobsByPods/JobsByQuartzCore@Pods/CATextLayer.swift:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
