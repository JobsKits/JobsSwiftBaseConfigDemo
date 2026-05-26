# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:223"]
  T1["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S1 -->|calls| T1
  S2["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:223"]
  T2["method:UITextView::JobsSuperviewHookView::byHost<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:83"]
  S2 -->|calls| T2
  S3["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:223"]
  T3["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:207"]
  S3 -->|calls| T3
  S4["method:UITextView::jobs_installSuperviewHookIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:223"]
  T4["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S4 -->|calls| T4
  S5["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  T5["method:UITextView::jobs_attachHintLabelIfPossible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:202"]
  S5 -->|calls| T5
  S6["method:UITextView::jobs_installTextDidChangeObserverIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:257"]
  T6["method:UITextView::jobs_updateHintLabel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:246"]
  S6 -->|calls| T6
  S7["method:UITextView::jobs_installTextDidChangeObserverIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+输入字数限制显示.swift:257"]
  T7["method:JobsObservable::removeObserver<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable.swift:51"]
  S7 -->|calls| T7
  S8["method:UIToolbar::byItemsAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIToolbar/UIToolbar+DSL.swift:17"]
  T8["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  S8 -->|calls| T8
  S9["method:UIToolbar::byItems<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIToolbar/UIToolbar+DSL.swift:22"]
  T9["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  S9 -->|calls| T9
  S10["method:UIToolbar::byItemsAnimated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIToolbar/UIToolbar+DSL.swift:104"]
  T10["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  S10 -->|calls| T10
  S11["method:UIToolbar::byItems<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIToolbar/UIToolbar+DSL.swift:110"]
  T11["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  S11 -->|calls| T11
  S12["method:UIView::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:240"]
  T12["method:UIView::byCornerRadius<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:240"]
  S12 -->|calls| T12
  S13["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  T13["method:UIView::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:17"]
  S13 -->|calls| T13
  S14["method:UIView::byVisible<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:451"]
  T14["method:UIView::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:23"]
  S14 -->|calls| T14
  S15["method:UIView::byCornerRaduis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:465"]
  T15["method:CAKeyframeAnimation::byPath<br/>JobsByPods/JobsByQuartzCore@Pods/CAKeyframeAnimation.swift:20"]
  S15 -->|calls| T15
  S16["method:UIView::byCornerRaduis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:465"]
  T16["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S16 -->|calls| T16
  S17["method:UIView::byRemoveAllSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:561"]
  T17["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S17 -->|calls| T17
  S18["method:UIView::bySizeThatFits<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:580"]
  T18["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S18 -->|calls| T18
  S19["method:UIView::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:648"]
  T19["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S19 -->|calls| T19
  S20["method:UIView::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:648"]
  T20["method:UIButton.Configuration::byBackgroundPatch<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButtonConfiguration/UIButtonConfiguration.swift:106"]
  S20 -->|calls| T20
  S21["method:UIView::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:648"]
  T21["enum_member:Decimal::RoundingRule::plain<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:37"]
  S21 -->|calls| T21
  S22["method:UIView::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:648"]
  T22["method:UIButton::byBackgroundImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+按钮（背景）图.swift:30"]
  S22 -->|calls| T22
  S23["method:UIView::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:648"]
  T23["method:UIColor::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIColor.swift:365"]
  S23 -->|calls| T23
  S24["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T24["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T25["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
