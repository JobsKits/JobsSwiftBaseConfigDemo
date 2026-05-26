# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T1["method:UITextView::jobs_adjustTextInsetForHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:234"]
  S1 -->|calls| T1
  S2["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T2["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  S2 -->|calls| T2
  S3["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T3["method:UITextView::jobs_installTextDidChangeObserverIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:257"]
  S3 -->|calls| T3
  S4["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T4["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:223"]
  S4 -->|calls| T4
  S5["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T5["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  S5 -->|calls| T5
  S6["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T6["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S6 -->|calls| T6
  S7["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T7["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  S7 -->|calls| T7
  S8["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T8["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  S8 -->|calls| T8
  S9["method:UITextView::jobs_refreshHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:56"]
  T9["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  S9 -->|calls| T9
  S10["class:UITextView::JobsDeinitBox<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:74"]
  T10["method:HKLocalRecordVC::cleanup<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@HaishinKit/HaishinKit@本地录制到系统相册.swift:197"]
  S10 -->|calls| T10
  S11["method:UITextView::JobsSuperviewHookView::didMoveToSuperview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:89"]
  T11["method:UITextView::JobsSuperviewHookView::didMoveToSuperview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:89"]
  S11 -->|calls| T11
  S12["method:UITextView::JobsSuperviewHookView::didMoveToSuperview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:89"]
  T12["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  S12 -->|calls| T12
  S13["method:UITextView::JobsSuperviewHookView::didMoveToSuperview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:89"]
  T13["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  S13 -->|calls| T13
  S14["method:UITextView::JobsSuperviewHookView::didMoveToWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:95"]
  T14["method:UITextView::JobsSuperviewHookView::didMoveToWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:95"]
  S14 -->|calls| T14
  S15["method:UITextView::JobsSuperviewHookView::didMoveToWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:95"]
  T15["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  S15 -->|calls| T15
  S16["method:UITextView::JobsSuperviewHookView::didMoveToWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:95"]
  T16["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  S16 -->|calls| T16
  S17["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T17["method:UIView::byZPosition<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:80"]
  S17 -->|calls| T17
  S18["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T18["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S18 -->|calls| T18
  S19["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T19["method:UITextView::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:38"]
  S19 -->|calls| T19
  S20["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T20["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S20 -->|calls| T20
  S21["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T21["method:UITextView::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:26"]
  S21 -->|calls| T21
  S22["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T22["method:UITextView::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:32"]
  S22 -->|calls| T22
  S23["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  T23["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S23 -->|calls| T23
  S24["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  T24["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S24 -->|calls| T24
  S25["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  T25["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
