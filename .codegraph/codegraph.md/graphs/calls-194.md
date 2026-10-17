# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:219"]
  T1["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:229"]
  S1 -->|calls| T1
  S2["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:229"]
  T2["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S2 -->|calls| T2
  S3["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:229"]
  T3["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S3 -->|calls| T3
  S4["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:229"]
  T4["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S4 -->|calls| T4
  S5["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:229"]
  T5["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S5 -->|calls| T5
  S6["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  T6["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:219"]
  S6 -->|calls| T6
  S7["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  T7["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:229"]
  S7 -->|calls| T7
  S8["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  T8["method:JobsButton::updateHiddenState<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:248"]
  S8 -->|calls| T8
  S9["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:239"]
  T9["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  S9 -->|calls| T9
  S10["method:JobsButton::updateHiddenState<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:248"]
  T10["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S10 -->|calls| T10
  S11["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  T11["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:301"]
  S11 -->|calls| T11
  S12["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  T12["method:JobsButton::isVerticalMode<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:318"]
  S12 -->|calls| T12
  S13["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  T13["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S13 -->|calls| T13
  S14["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  T14["method:JobsButton::spacing<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:327"]
  S14 -->|calls| T14
  S15["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  T15["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S15 -->|calls| T15
  S16["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:257"]
  T16["method:JobsButton::spacing<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:327"]
  S16 -->|calls| T16
  S17["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:301"]
  T17["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:305"]
  S17 -->|calls| T17
  S18["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:301"]
  T18["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:305"]
  S18 -->|calls| T18
  S19["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:301"]
  T19["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:305"]
  S19 -->|calls| T19
  S20["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:301"]
  T20["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:305"]
  S20 -->|calls| T20
  S21["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  T21["method:_ASDisplayView::sizeThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayView.mm:247"]
  S21 -->|calls| T21
  S22["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T22["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S22 -->|calls| T22
  S23["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T23["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S23 -->|calls| T23
  S24["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T24["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S24 -->|calls| T24
  S25["property:JobsTextField::insetTop<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:35"]
  T25["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
