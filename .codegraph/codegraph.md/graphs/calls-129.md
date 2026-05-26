# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:231"]
  T1["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S1 -->|calls| T1
  S2["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:231"]
  T2["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S2 -->|calls| T2
  S3["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  T3["method:JobsButton::setupViewsIfNeeded<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:221"]
  S3 -->|calls| T3
  S4["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  T4["method:JobsButton::updateContainerConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:231"]
  S4 -->|calls| T4
  S5["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  T5["method:JobsButton::updateHiddenState<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:250"]
  S5 -->|calls| T5
  S6["method:JobsButton::refreshUI<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:241"]
  T6["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  S6 -->|calls| T6
  S7["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  T7["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:303"]
  S7 -->|calls| T7
  S8["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  T8["method:JobsButton::isVerticalMode<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:317"]
  S8 -->|calls| T8
  S9["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  T9["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S9 -->|calls| T9
  S10["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  T10["method:JobsButton::spacing<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:324"]
  S10 -->|calls| T10
  S11["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  T11["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S11 -->|calls| T11
  S12["method:JobsButton::remakeLayoutConstraints<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:259"]
  T12["method:JobsButton::spacing<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:324"]
  S12 -->|calls| T12
  S13["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:303"]
  T13["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:307"]
  S13 -->|calls| T13
  S14["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:303"]
  T14["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:307"]
  S14 -->|calls| T14
  S15["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:303"]
  T15["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:307"]
  S15 -->|calls| T15
  S16["method:JobsButton::arrangedVisibleViews<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:303"]
  T16["function:JobsButton::arrangedVisibleViews::compact<br/>JobsByPods/JobsInheritance@Pods/JobsButton/JobsButton.swift:307"]
  S16 -->|calls| T16
  S17["method:JobsPaddedLabel::drawText<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:24"]
  T17["method:JobsPaddedLabel::drawText<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:24"]
  S17 -->|calls| T17
  S18["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  T18["method:JobsPaddedLabel::sizeThatFits<br/>JobsByPods/JobsInheritance@Pods/UILabel/JobsPaddedLabel.swift:35"]
  S18 -->|calls| T18
  S19["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T19["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S19 -->|calls| T19
  S20["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T20["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S20 -->|calls| T20
  S21["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T21["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S21 -->|calls| T21
  S22["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T22["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S22 -->|calls| T22
  S23["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T23["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S23 -->|calls| T23
  S24["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T24["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S24 -->|calls| T24
  S25["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T25["method:JobsTextField::setup<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:50"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
