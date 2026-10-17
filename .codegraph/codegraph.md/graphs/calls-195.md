# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["property:JobsTextField::insetLeft<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:36"]
  T1["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S1 -->|calls| T1
  S2["property:JobsTextField::insetBottom<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:37"]
  T2["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S2 -->|calls| T2
  S3["property:JobsTextField::insetRight<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:38"]
  T3["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S3 -->|calls| T3
  S4["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T4["method:JobsTextField::setup<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:50"]
  S4 -->|calls| T4
  S5["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T5["method:JobsTextField::setup<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:50"]
  S5 -->|calls| T5
  S6["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  T6["method:PhotoTableViewCell::updateConstraints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/ASDKgram/Sample/PhotoTableViewCell.m:307"]
  S6 -->|calls| T6
  S7["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  T7["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S7 -->|calls| T7
  S8["property:JobsTextField::text<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:73"]
  T8["method:UITextField::byText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:38"]
  S8 -->|calls| T8
  S9["property:JobsTextField::placeholder<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:78"]
  T9["method:UITextField::byPlaceholder<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:20"]
  S9 -->|calls| T9
  S10["property:JobsTextField::delegate<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:83"]
  T10["method:UITextField::byDelegate<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITextField/UITextField+DSL.swift:270"]
  S10 -->|calls| T10
  S11["method:JobsTextField::byInsetTop<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:115"]
  T11["method:UIEdgeInsets::byTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIEdgeInsets.swift:15"]
  S11 -->|calls| T11
  S12["method:JobsTextField::byInsetTop<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:115"]
  T12["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S12 -->|calls| T12
  S13["method:JobsTextField::byInsetLeft<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:122"]
  T13["method:UIEdgeInsets::byLeft<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIEdgeInsets.swift:21"]
  S13 -->|calls| T13
  S14["method:JobsTextField::byInsetLeft<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:122"]
  T14["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S14 -->|calls| T14
  S15["method:JobsTextField::byInsetBottom<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:129"]
  T15["method:UIEdgeInsets::byBottom<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIEdgeInsets.swift:27"]
  S15 -->|calls| T15
  S16["method:JobsTextField::byInsetBottom<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:129"]
  T16["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S16 -->|calls| T16
  S17["method:JobsTextField::byInsetRight<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:136"]
  T17["method:UIEdgeInsets::byRight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIEdgeInsets.swift:33"]
  S17 -->|calls| T17
  S18["method:JobsTextField::byInsetRight<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:136"]
  T18["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S18 -->|calls| T18
  S19["method:JobsTextField::byInsetHorizontal<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:143"]
  T19["method:UIEdgeInsets::byHorizontal<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIEdgeInsets.swift:39"]
  S19 -->|calls| T19
  S20["method:JobsTextField::byInsetHorizontal<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:143"]
  T20["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S20 -->|calls| T20
  S21["method:JobsTextField::byInsetVertical<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:150"]
  T21["method:UIEdgeInsets::byVertical<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIEdgeInsets.swift:46"]
  S21 -->|calls| T21
  S22["method:JobsTextField::byInsetVertical<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:150"]
  T22["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S22 -->|calls| T22
  S23["method:JobsTextField::byInsetAll<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:157"]
  T23["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S23 -->|calls| T23
  S24["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:28"]
  T24["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/PDFKit/PDFThumbnailView.swift:32"]
  S24 -->|calls| T24
  S25["method:BaseVC::viewWillAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:34"]
  T25["method:ASDKViewController::viewWillAppear:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDKViewController.mm:182"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
