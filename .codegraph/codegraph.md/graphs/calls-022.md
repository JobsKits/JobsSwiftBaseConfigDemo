# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIFont::SourceSansPro::Bold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:31"]
  T1["method:UIFont::SourceSansPro::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont+SourceSansPro.swift:35"]
  S1 -->|calls| T1
  S2["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  T2["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  S2 -->|calls| T2
  S3["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  T3["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  S3 -->|calls| T3
  S4["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  T4["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  S4 -->|calls| T4
  S5["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T5["method:Bundle::lang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Bundle/Bundle+language.swift:62"]
  S5 -->|calls| T5
  S6["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T6["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  S6 -->|calls| T6
  S7["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T7["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  S7 -->|calls| T7
  S8["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T8["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  S8 -->|calls| T8
  S9["method:UIFont::App::pick<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:79"]
  T9["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  S9 -->|calls| T9
  S10["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  T10["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S10 -->|calls| T10
  S11["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  T11["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S11 -->|calls| T11
  S12["method:UIFont::App::roboto<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:92"]
  T12["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S12 -->|calls| T12
  S13["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T13["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S13 -->|calls| T13
  S14["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T14["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S14 -->|calls| T14
  S15["method:UIFont::App::mitr<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:100"]
  T15["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S15 -->|calls| T15
  S16["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  T16["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S16 -->|calls| T16
  S17["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  T17["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S17 -->|calls| T17
  S18["method:UIFont::App::sfArabic<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:108"]
  T18["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S18 -->|calls| T18
  S19["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  T19["method:UIFont::App::Regular<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:73"]
  S19 -->|calls| T19
  S20["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  T20["method:UIFont::App::Medium<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:74"]
  S20 -->|calls| T20
  S21["method:UIFont::App::pingFang<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:116"]
  T21["method:UIFont::App::Semibold<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIFont/UIFont.swift:75"]
  S21 -->|calls| T21
  S22["method:UIImage::filled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:47"]
  T22["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S22 -->|calls| T22
  S23["method:UIImage::filled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:47"]
  T23["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S23 -->|calls| T23
  S24["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:19"]
  T24["method:UILabel::_jobs_installInsetsSwizzleIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:51"]
  S24 -->|calls| T24
  S25["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T25["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
