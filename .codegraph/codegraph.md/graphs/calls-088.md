# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:41"]
  T1["method:UITextField::jobs_placeholderLabel_byRuntime<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:59"]
  S1 -->|calls| T1
  S2["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:41"]
  T2["method:UILabel::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S2 -->|calls| T2
  S3["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:41"]
  T3["method:UITextField::jobs_applyAttributedPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:67"]
  S3 -->|calls| T3
  S4["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:50"]
  T4["method:UITextField::jobs_placeholderLabel_byRuntime<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:59"]
  S4 -->|calls| T4
  S5["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:50"]
  T5["method:UILabel::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:46"]
  S5 -->|calls| T5
  S6["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:50"]
  T6["method:UITextField::jobs_applyAttributedPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:67"]
  S6 -->|calls| T6
  S7["method:UITextField::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+富文本.swift:18"]
  T7["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S7 -->|calls| T7
  S8["method:UITextField::byOnInput<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:21"]
  T8["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:108"]
  S8 -->|calls| T8
  S9["method:UITextField::byBeginEditing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:43"]
  T9["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:108"]
  S9 -->|calls| T9
  S10["method:UITextField::byEndEditing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:55"]
  T10["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:108"]
  S10 -->|calls| T10
  S11["method:UITextFieldDelegateProxy::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:76"]
  T11["method:UITextFieldDelegateProxy::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:76"]
  S11 -->|calls| T11
  S12["method:UITextFieldDelegateProxy::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:81"]
  T12["method:UITextFieldDelegateProxy::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:81"]
  S12 -->|calls| T12
  S13["method:UITextFieldDelegateProxy::textFieldShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:88"]
  T13["method:UITextFieldDelegateProxy::textFieldShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:88"]
  S13 -->|calls| T13
  S14["method:UITextFieldDelegateProxy::textFieldShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:88"]
  T14["method:UITextFieldDelegateProxy::textFieldShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:88"]
  S14 -->|calls| T14
  S15["method:UITextField::onShouldClear<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:118"]
  T15["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:108"]
  S15 -->|calls| T15
  S16["method:UITextView::byLineFragmentPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:179"]
  T16["method:UITextView::byTextContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:363"]
  S16 -->|calls| T16
  S17["method:UITextView::byLineFragmentPadding<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:349"]
  T17["method:UITextView::byTextContainer<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:363"]
  S17 -->|calls| T17
  S18["method:UITextView::byRoundedBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:374"]
  T18["method:UIButton::byMasksToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:446"]
  S18 -->|calls| T18
  S19["method:UITextView::byRoundedBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:374"]
  T19["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:65"]
  S19 -->|calls| T19
  S20["method:UITextView::byRoundedBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:374"]
  T20["method:UIView::byBorderWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:86"]
  S20 -->|calls| T20
  S21["method:UITextView::byRoundedBorder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:374"]
  T21["method:CALayer::byBorderColor<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:213"]
  S21 -->|calls| T21
  S22["method:UITextView::byBezelLike<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:389"]
  T22["method:UIButton::byMasksToBounds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:446"]
  S22 -->|calls| T22
  S23["method:UITextView::byBezelLike<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:389"]
  T23["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:65"]
  S23 -->|calls| T23
  S24["method:UITextView::byBezelLike<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:389"]
  T24["method:UIView::byBorderWidth<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:86"]
  S24 -->|calls| T24
  S25["method:UITextView::byBezelLike<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+DSL.swift:389"]
  T25["method:CALayer::byBorderColor<br/>JobsByPods/JobsByQuartzCore@Pods/CALayer.swift:213"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
