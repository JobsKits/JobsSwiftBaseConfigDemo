# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextView::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+富文本.swift:19"]
  T1["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S1 -->|calls| T1
  S2["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T2["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:182"]
  S2 -->|calls| T2
  S3["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T3["method:UITextView::jobs_adjustTextInsetForHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:226"]
  S3 -->|calls| T3
  S4["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T4["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  S4 -->|calls| T4
  S5["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T5["method:UITextView::jobs_installTextDidChangeObserverIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:249"]
  S5 -->|calls| T5
  S6["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T6["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:215"]
  S6 -->|calls| T6
  S7["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T7["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  S7 -->|calls| T7
  S8["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T8["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S8 -->|calls| T8
  S9["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T9["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  S9 -->|calls| T9
  S10["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:23"]
  T10["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  S10 -->|calls| T10
  S11["method:UITextView::jobs_refreshHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:57"]
  T11["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  S11 -->|calls| T11
  S12["class:UITextView::JobsDeinitBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:73"]
  T12["field:UITextView::JobsDeinitBox::cleanup<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:74"]
  S12 -->|calls| T12
  S13["method:UITextView::JobsSuperviewHookView::didMoveToSuperview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:86"]
  T13["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  S13 -->|calls| T13
  S14["method:UITextView::JobsSuperviewHookView::didMoveToSuperview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:86"]
  T14["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  S14 -->|calls| T14
  S15["method:UITextView::JobsSuperviewHookView::didMoveToWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:91"]
  T15["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  S15 -->|calls| T15
  S16["method:UITextView::JobsSuperviewHookView::didMoveToWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:91"]
  T16["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  S16 -->|calls| T16
  S17["property:UITextView::jobs_originalTextInset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:134"]
  T17["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S17 -->|calls| T17
  S18["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:182"]
  T18["method:JobsFont::monospacedDigitSystemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:33"]
  S18 -->|calls| T18
  S19["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  T19["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S19 -->|calls| T19
  S20["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  T20["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S20 -->|calls| T20
  S21["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:215"]
  T21["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S21 -->|calls| T21
  S22["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  T22["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:197"]
  S22 -->|calls| T22
  S23["method:UITextView::jobs_installTextDidChangeObserverIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:249"]
  T23["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:238"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:21"]
  T24["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:34"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:21"]
  T25["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
