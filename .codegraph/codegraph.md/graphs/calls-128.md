# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextFieldDelegateProxy::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:75"]
  T1["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S1 -->|calls| T1
  S2["method:UITextFieldDelegateProxy::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:75"]
  T2["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S2 -->|calls| T2
  S3["method:UITextFieldDelegateProxy::textFieldShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:81"]
  T3["field:UITextFieldDelegateProxy::shouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:69"]
  S3 -->|calls| T3
  S4["method:UITextField::onShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:109"]
  T4["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:99"]
  S4 -->|calls| T4
  S5["method:UITextView::byPlaceHolder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:24"]
  T5["method:UIListContentConfiguration::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:99"]
  S5 -->|calls| T5
  S6["method:UITextView::byPlaceHolder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:24"]
  T6["method:UILabel::byAttributedString<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:21"]
  S6 -->|calls| T6
  S7["method:UITextView::byPlaceHolder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:24"]
  T7["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S7 -->|calls| T7
  S8["method:UITextView::byPlaceHolderCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:31"]
  T8["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S8 -->|calls| T8
  S9["method:UITextView::byPlaceHolderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:37"]
  T9["method:UILabel::byFont<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:81"]
  S9 -->|calls| T9
  S10["method:UITextView::byPlaceHolderAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:43"]
  T10["method:UILabel::byAttributedString<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:21"]
  S10 -->|calls| T10
  S11["method:UITextView::byPlaceHolderAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:43"]
  T11["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S11 -->|calls| T11
  S12["method:UITextView::byPlaceHolderAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:43"]
  T12["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S12 -->|calls| T12
  S13["property:UITextView::by_placeholderLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:50"]
  T13["method:UITextView::by_swizzleLayoutSubviewsOnce<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:104"]
  S13 -->|calls| T13
  S14["property:UITextView::by_placeholderLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:50"]
  T14["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:26"]
  S14 -->|calls| T14
  S15["property:UITextView::by_placeholderLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:50"]
  T15["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  S15 -->|calls| T15
  S16["property:UITextView::by_placeholderLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:50"]
  T16["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S16 -->|calls| T16
  S17["property:UITextView::by_placeholderLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:50"]
  T17["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S17 -->|calls| T17
  S18["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  T18["method:UIView::byRemakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:112"]
  S18 -->|calls| T18
  S19["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  T19["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S19 -->|calls| T19
  S20["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  T20["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S20 -->|calls| T20
  S21["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  T21["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S21 -->|calls| T21
  S22["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  T22["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S22 -->|calls| T22
  S23["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:120"]
  T23["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:120"]
  S23 -->|calls| T23
  S24["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:120"]
  T24["method:UITextView::by_makeOrUpdatePlaceholderConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:94"]
  S24 -->|calls| T24
  S25["method:UITextView::by_layoutSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:120"]
  T25["method:UITextView::by_updatePlaceholderVisibility<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+Placeholder.swift:89"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
