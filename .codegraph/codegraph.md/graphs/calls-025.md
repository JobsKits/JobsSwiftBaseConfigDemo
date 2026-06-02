# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsScrollViewBlocksProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:110"]
  T1["method:UIScrollView::didEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:60"]
  S1 -->|calls| T1
  S2["method:JobsScrollViewBlocksProxy::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:115"]
  T2["method:JobsScrollViewBlocksProxy::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:115"]
  S2 -->|calls| T2
  S3["method:JobsScrollViewBlocksProxy::scrollViewDidScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:120"]
  T3["method:UIScrollView::didScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:72"]
  S3 -->|calls| T3
  S4["method:JobsScrollDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:137"]
  T4["method:JobsScrollDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:137"]
  S4 -->|calls| T4
  S5["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:143"]
  T5["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:143"]
  S5 -->|calls| T5
  S6["method:UIScrollView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:171"]
  T6["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:157"]
  S6 -->|calls| T6
  S7["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:17"]
  T7["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S7 -->|calls| T7
  S8["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:25"]
  T8["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S8 -->|calls| T8
  S9["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:33"]
  T9["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S9 -->|calls| T9
  S10["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:41"]
  T10["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S10 -->|calls| T10
  S11["method:UITableView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:52"]
  T11["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S11 -->|calls| T11
  S12["method:UITableView::byRegisterCellOnID<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:58"]
  T12["method:GeneratedPluginRegistrant::registerWithRegistry:<br/>my_flutter/.ios/Flutter/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m:11"]
  S12 -->|calls| T12
  S13["method:UITableView::reloadDatas<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:20"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:UITableView::reloadCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:28"]
  T14["method:UITableView::reloadCells<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:34"]
  S14 -->|calls| T14
  S15["method:UITableView::reloadCells<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:34"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["method:UITableView::reloadSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:50"]
  T16["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S16 -->|calls| T16
  S17["method:UITableView::reloadSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:50"]
  T17["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S17 -->|calls| T17
  S18["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  T19["method:UITableView::reloadSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:60"]
  S19 -->|calls| T19
  S20["class:UITableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+校验.swift:17"]
  T20["method:UITableView::isValid<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+校验.swift:19"]
  S20 -->|calls| T20
  S21["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  T21["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  S21 -->|calls| T21
  S22["method:UITableView::jobs_swizzled_reloadData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+空态数据占位按钮.swift:19"]
  T22["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S22 -->|calls| T22
  S23["method:UITextField::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+富文本.swift:18"]
  T23["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S23 -->|calls| T23
  S24["method:UITextView::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextView/UITextView+富文本.swift:19"]
  T24["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S24 -->|calls| T24
  S25["method:UIView::jobs_existingTopBar<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:22"]
  T25["method:UIView::jobs_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+GKNavigationBarSwift.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
