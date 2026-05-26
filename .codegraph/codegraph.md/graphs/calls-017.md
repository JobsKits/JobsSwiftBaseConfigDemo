# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:YTKBatchRequest::byAccessories<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBatchRequest+DSL.swift:34"]
  T1["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S1 -->|calls| T1
  S2["method:YTKBatchRequest::byCompletion<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBatchRequest+DSL.swift:55"]
  T2["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S2 -->|calls| T2
  S3["method:YTKBatchRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBatchRequest+DSL.swift:67"]
  T3["enum_member:HTTPResponseCode::success<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:297"]
  S3 -->|calls| T3
  S4["method:YTKBatchRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBatchRequest+DSL.swift:67"]
  T4["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  S4 -->|calls| T4
  S5["method:JobsChainDelegateProxy::chainRequestFinished<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:20"]
  T5["method:JobsChainDelegateProxy::chainRequestFinished<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:20"]
  S5 -->|calls| T5
  S6["method:JobsChainDelegateProxy::chainRequestFailed<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:26"]
  T6["method:JobsChainDelegateProxy::chainRequestFailed<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:26"]
  S6 -->|calls| T6
  S7["method:YTKChainRequest::byAddAccessory<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:62"]
  T7["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S7 -->|calls| T7
  S8["method:YTKChainRequest::byAccessories<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:68"]
  T8["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S8 -->|calls| T8
  S9["method:YTKChainRequest::byAccessories<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:68"]
  T9["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S9 -->|calls| T9
  S10["method:YTKChainRequest::byAdd<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:75"]
  T10["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S10 -->|calls| T10
  S11["method:YTKChainRequest::byAdd<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:75"]
  T11["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S11 -->|calls| T11
  S12["method:YTKChainRequest::byAdd<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:87"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:YTKChainRequest::byAdd<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:87"]
  T13["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S13 -->|calls| T13
  S14["method:YTKChainRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKChainRequest+DSL.swift:121"]
  T14["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  S14 -->|calls| T14
  S15["class:IrregularButton<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:15"]
  T15["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:34"]
  S15 -->|calls| T15
  S16["class:IrregularButton<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:15"]
  T16["method:IrregularButton::setup<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:34"]
  S16 -->|calls| T16
  S17["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:50"]
  T17["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:50"]
  S17 -->|calls| T17
  S18["method:IrregularButton::layoutSubviews<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:50"]
  T18["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:68"]
  S18 -->|calls| T18
  S19["method:IrregularButton::point<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:63"]
  T19["method:IrregularButton::point<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:63"]
  S19 -->|calls| T19
  S20["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:68"]
  T20["method:IrregularButton::scaled<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:79"]
  S20 -->|calls| T20
  S21["method:IrregularButton::buildPath<br/>JobsByPods/JobsBy3rdTools@Pods/不规则形状的按钮.swift:68"]
  T21["method:UIButton::close<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:38"]
  S21 -->|calls| T21
  S22["method:PDFView::byGoBack<br/>JobsByPods/JobsByPDFKit@Pods/PDFView.swift:145"]
  T22["method:UIViewController::goBack<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIViewController/UIViewController+传值回调.swift:48"]
  S22 -->|calls| T22
  S23["method:PDFView::byGoTo<br/>JobsByPods/JobsByPDFKit@Pods/PDFView.swift:155"]
  T23["method:FeedModel::page<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@BMPlayer/Model/FeedModel.swift:56"]
  S23 -->|calls| T23
  S24["method:PHPickerViewController::byAddTo<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:96"]
  T24["method:JobsSlot::layout<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:113"]
  S24 -->|calls| T24
  S25["method:PHPickerViewController::byPresent<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:109"]
  T25["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
