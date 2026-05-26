# `calls 符号关系 - 126`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  T1["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonForegroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:96"]
  S1 -->|calls| T1
  S2["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  T2["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S2 -->|calls| T2
  S3["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  T3["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:94"]
  S3 -->|calls| T3
  S4["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  T4["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:94"]
  S4 -->|calls| T4
  S5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  T5["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonBackgroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:110"]
  S5 -->|calls| T5
  S6["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  T6["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S6 -->|calls| T6
  S7["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  T7["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:107"]
  S7 -->|calls| T7
  S8["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisherBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:154"]
  T8["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:107"]
  S8 -->|calls| T8
  S9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:179"]
  T9["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessImageViewTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:90"]
  S9 -->|calls| T9
  S10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:179"]
  T10["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_pointToPixel<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:81"]
  S10 -->|calls| T10
  S11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  T11["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonForegroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:96"]
  S11 -->|calls| T11
  S12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  T12["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_pointToPixel<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:81"]
  S12 -->|calls| T12
  S13["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  T14["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:94"]
  S14 -->|calls| T14
  S15["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  T15["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_guessButtonBackgroundTargetSize<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:110"]
  S15 -->|calls| T15
  S16["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  T16["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_pointToPixel<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:81"]
  S16 -->|calls| T16
  S17["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  T17["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S17 -->|calls| T17
  S18["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImageBackground<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:219"]
  T18["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:107"]
  S18 -->|calls| T18
  S19["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T19["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  S19 -->|calls| T19
  S20["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T20["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  S20 -->|calls| T20
  S21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T21["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  S21 -->|calls| T21
  S22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T22["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  S22 -->|calls| T22
  S23["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T23["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  S23 -->|calls| T23
  S24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T24["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithKingfisher<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:131"]
  S24 -->|calls| T24
  S25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::walk<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:242"]
  T25["function:JobsImageCacheCleaner::_forceRedownloadImagesMain::_reloadWithSDWebImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleaner.swift:197"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
