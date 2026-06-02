# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T1["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  S1 -->|calls| T1
  S2["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T2["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S2 -->|calls| T2
  S3["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T3["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  S3 -->|calls| T3
  S4["class:UILabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:38"]
  T4["function:_jobs_swizzle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:92"]
  S4 -->|calls| T4
  S5["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  T5["method:UILabel::_jobs_drawText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:64"]
  S5 -->|calls| T5
  S6["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  T6["method:UILabel::_jobs_textRect<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+内边距.swift:71"]
  S6 -->|calls| T6
  S7["method:UILabel::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+富文本.swift:19"]
  T7["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S7 -->|calls| T7
  S8["method:UINavigationBar::byLegacyTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:220"]
  T8["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S8 -->|calls| T8
  S9["method:UINavigationBar::byLegacyTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:231"]
  T9["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S9 -->|calls| T9
  S10["method:UINavigationBar::byLegacyLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:242"]
  T10["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S10 -->|calls| T10
  S11["method:UINavigationBar::byLegacyLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBar.swift:254"]
  T11["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S11 -->|calls| T11
  S12["method:UINavigationBarAppearance::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:20"]
  T12["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S12 -->|calls| T12
  S13["method:UINavigationBarAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:29"]
  T13["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S13 -->|calls| T13
  S14["method:UINavigationBarAppearance::byLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:50"]
  T14["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S14 -->|calls| T14
  S15["method:UINavigationBarAppearance::byLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:59"]
  T15["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S15 -->|calls| T15
  S16["method:UINavigationBarAppearance::bySubtitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:80"]
  T16["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S16 -->|calls| T16
  S17["method:UINavigationBarAppearance::bySubtitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:89"]
  T17["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S17 -->|calls| T17
  S18["method:UINavigationBarAppearance::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:110"]
  T18["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S18 -->|calls| T18
  S19["method:UINavigationBarAppearance::byTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:120"]
  T19["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S19 -->|calls| T19
  S20["method:UINavigationBarAppearance::byLargeTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:142"]
  T20["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S20 -->|calls| T20
  S21["method:UINavigationBarAppearance::byLargeTitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:152"]
  T21["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S21 -->|calls| T21
  S22["method:UINavigationBarAppearance::bySubtitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:175"]
  T22["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S22 -->|calls| T22
  S23["method:UINavigationBarAppearance::bySubtitleColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationBar/UINavigationBarAppearance.swift:186"]
  T23["method:Bag::removeValue<br/>TODO/TaskCenterComponent/Schedule/Bag.swift:75"]
  S23 -->|calls| T23
  S24["method:UINavigationController::byNavTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:20"]
  T24["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S24 -->|calls| T24
  S25["method:UINavigationController::animationControllerForOperation<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:28"]
  T25["method:UINavigationController::jobs_navBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UINavigationController/UINavigationController.swift:147"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
