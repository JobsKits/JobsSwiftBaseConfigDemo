# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsButtonNumberAnimRunner::resolveValuesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:599"]
  T1["function:JobsButtonNumberAnimRunner::resolveValuesIfNeeded::nonEmpty<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:600"]
  S1 -->|calls| T1
  S2["method:JobsButtonNumberAnimRunner::titleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:626"]
  T2["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S2 -->|calls| T2
  S3["method:JobsButtonNumberAnimRunner::titleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:630"]
  T3["method:UIButton::StateProxy::titleColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:1076"]
  S3 -->|calls| T3
  S4["method:JobsButtonNumberAnimRunner::subTitleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:634"]
  T4["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S4 -->|calls| T4
  S5["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T5["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:780"]
  S5 -->|calls| T5
  S6["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T6["method:UIBarItem::byTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarItem.swift:26"]
  S6 -->|calls| T6
  S7["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T7["method:UIButton::byTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:733"]
  S7 -->|calls| T7
  S8["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T8["method:UIButton::bySubTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+Subtitle.swift:206"]
  S8 -->|calls| T8
  S9["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T9["method:JobsButtonNumberAnimRunner::buildAttributedIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:717"]
  S9 -->|calls| T9
  S10["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T10["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:730"]
  S10 -->|calls| T10
  S11["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T11["method:JobsButtonNumberAnimRunner::titleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:626"]
  S11 -->|calls| T11
  S12["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T12["method:JobsButtonNumberAnimRunner::titleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:630"]
  S12 -->|calls| T12
  S13["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T13["method:JobsButtonNumberAnimRunner::subTitleBaseFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:634"]
  S13 -->|calls| T13
  S14["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T14["method:JobsButtonNumberAnimRunner::subTitleBaseColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:638"]
  S14 -->|calls| T14
  S15["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T15["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S15 -->|calls| T15
  S16["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T16["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S16 -->|calls| T16
  S17["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T17["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S17 -->|calls| T17
  S18["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T18["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S18 -->|calls| T18
  S19["method:JobsButtonNumberAnimRunner::applyNumber<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:644"]
  T19["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:730"]
  S19 -->|calls| T19
  S20["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:730"]
  T20["method:UIButton::byAttributedTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:753"]
  S20 -->|calls| T20
  S21["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:730"]
  T21["method:UIButton::byConfiguration<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+DSL.swift:47"]
  S21 -->|calls| T21
  S22["method:JobsButtonNumberAnimRunner::writeAttributed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:730"]
  T22["method:UIButton::byAttributedSubTitle<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButton/UIButton+Subtitle.swift:233"]
  S22 -->|calls| T22
  S23["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:780"]
  T23["method:JobsNumberFormatter::roundToDecimals<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:810"]
  S23 -->|calls| T23
  S24["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:780"]
  T24["method:JobsNumberFormatter::toFixedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:816"]
  S24 -->|calls| T24
  S25["method:JobsNumberFormatter::format<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:780"]
  T25["method:JobsNumberFormatter::groupDigits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+动效数字标题.swift:820"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
