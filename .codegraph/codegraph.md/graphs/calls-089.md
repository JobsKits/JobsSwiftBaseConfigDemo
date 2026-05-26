# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextView::byBezelLike<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:389"]
  T1["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S1 -->|calls| T1
  S2["method:UITextView::byPlaceHolder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:24"]
  T2["method:UITextView::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:20"]
  S2 -->|calls| T2
  S3["method:UITextView::byPlaceHolder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:24"]
  T3["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S3 -->|calls| T3
  S4["method:UITextView::byPlaceHolder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:24"]
  T4["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S4 -->|calls| T4
  S5["method:UITextView::byPlaceHolderCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:31"]
  T5["method:UILabel::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S5 -->|calls| T5
  S6["method:UITextView::byPlaceHolderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:37"]
  T6["method:UILabel::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:46"]
  S6 -->|calls| T6
  S7["method:UITextView::byPlaceHolderAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:43"]
  T7["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S7 -->|calls| T7
  S8["method:UITextView::byPlaceHolderAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:43"]
  T8["method:UILabel::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:33"]
  S8 -->|calls| T8
  S9["method:UITextView::byPlaceHolderAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:43"]
  T9["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S9 -->|calls| T9
  S10["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T10["method:UITextView::by_swizzleLayoutSubviewsOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:104"]
  S10 -->|calls| T10
  S11["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T11["method:UIView::bySendToBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:543"]
  S11 -->|calls| T11
  S12["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T12["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S12 -->|calls| T12
  S13["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T13["method:UITextView::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:26"]
  S13 -->|calls| T13
  S14["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T14["method:UITextView::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:32"]
  S14 -->|calls| T14
  S15["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T15["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S15 -->|calls| T15
  S16["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T16["method:UIButton::byNumberOfLines<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:53"]
  S16 -->|calls| T16
  S17["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T17["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  S17 -->|calls| T17
  S18["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T18["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S18 -->|calls| T18
  S19["class:UITextView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:22"]
  T19["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S19 -->|calls| T19
  S20["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  T20["method:UIView::byRemakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:111"]
  S20 -->|calls| T20
  S21["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:123"]
  T21["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:123"]
  S21 -->|calls| T21
  S22["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:123"]
  T22["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  S22 -->|calls| T22
  S23["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:123"]
  T23["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S23 -->|calls| T23
  S24["method:UITextView::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+富文本.swift:19"]
  T24["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S24 -->|calls| T24
  S25["method:UITextView::byHintLimit<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:22"]
  T25["method:UITextView::jobs_installHintLabelIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:187"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
