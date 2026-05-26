# `calls 符号关系 - 130`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsTextField<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:19"]
  T1["method:JobsTextField::setup<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:50"]
  S1 -->|calls| T1
  S2["method:JobsTextField::byInsetTop<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:116"]
  T2["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S2 -->|calls| T2
  S3["method:JobsTextField::byInsetLeft<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:123"]
  T3["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S3 -->|calls| T3
  S4["method:JobsTextField::byInsetBottom<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:130"]
  T4["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S4 -->|calls| T4
  S5["method:JobsTextField::byInsetRight<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:137"]
  T5["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S5 -->|calls| T5
  S6["method:JobsTextField::byInsetHorizontal<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:144"]
  T6["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S6 -->|calls| T6
  S7["method:JobsTextField::byInsetVertical<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:152"]
  T7["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S7 -->|calls| T7
  S8["method:JobsTextField::byInsetAll<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:160"]
  T8["method:JobsTextField::updateTextInsets<br/>JobsByPods/JobsInheritance@Pods/UITextField/JobsTextField.swift:59"]
  S8 -->|calls| T8
  S9["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:26"]
  T9["method:BaseVC::viewDidLoad<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:26"]
  S9 -->|calls| T9
  S10["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:32"]
  T10["method:BaseVC::viewDidAppear<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseVC.swift:32"]
  S10 -->|calls| T10
  S11["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T11["method:BaseWebView::registerMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:428"]
  S11 -->|calls| T11
  S12["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T12["method:BaseWebView::registerMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:428"]
  S12 -->|calls| T12
  S13["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T13["method:BaseWebView::registerMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:428"]
  S13 -->|calls| T13
  S14["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T14["method:BaseWebView::registerMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:428"]
  S14 -->|calls| T14
  S15["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T15["method:BaseWebView::registerMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:428"]
  S15 -->|calls| T15
  S16["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T16["method:BaseWebView::registerMobileAction<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:428"]
  S16 -->|calls| T16
  S17["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T17["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S17 -->|calls| T17
  S18["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T18["method:UIView::byNavBarStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+JobsNavBar.swift:127"]
  S18 -->|calls| T18
  S19["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T19["method:BaseWebView::byUserAgentSuffixProvider<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:47"]
  S19 -->|calls| T19
  S20["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T20["method:BaseWebView::byDisableSelectionAndCallout<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:31"]
  S20 -->|calls| T20
  S21["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T21["method:BaseWebView::byAllowedHosts<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+ConfigDSL.swift:19"]
  S21 -->|calls| T21
  S22["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T22["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S22 -->|calls| T22
  S23["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T23["method:WKWebViewConfiguration::byPreferences<br/>JobsByPods/JobsByWebKit@Pods/WKWebViewConfiguration.swift:36"]
  S23 -->|calls| T23
  S24["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T24["method:JobsNavBar.Style::byTitleAlignmentCenter<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:312"]
  S24 -->|calls| T24
  S25["class:BaseWebVC<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:34"]
  T25["method:PDFThumbnailView::byBackgroundColor<br/>JobsByPods/JobsByPDFKit@Pods/PDFThumbnailView.swift:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
