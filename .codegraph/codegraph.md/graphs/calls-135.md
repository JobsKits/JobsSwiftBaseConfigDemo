# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:48"]
  T1["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S1 -->|calls| T1
  S2["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:149"]
  T2["method:YTKBaseRequest::byCompletion<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:83"]
  S2 -->|calls| T2
  S3["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:149"]
  T3["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  S3 -->|calls| T3
  S4["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:149"]
  T4["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+传值回调.swift:29"]
  S4 -->|calls| T4
  S5["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:149"]
  T5["method:BaseWebVC::byData<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:148"]
  S5 -->|calls| T5
  S6["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:149"]
  T6["method:PHPickerViewController::byModalPresentationStyle<br/>JobsByPods/JobsByPhotosUI@Pods/PHPickerViewController.swift:36"]
  S6 -->|calls| T6
  S7["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T7["method:MVVMUserListViewModel::load<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@其他/Demo@设计模式MVVM.swift:54"]
  S7 -->|calls| T7
  S8["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T8["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S8 -->|calls| T8
  S9["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T9["method:BRiOS12SafePickerReload::reload<br/>JobsByPods/BRPickerViewSwift@Pods/Extensions/BRiOS12SafePickerReload.swift:14"]
  S9 -->|calls| T9
  S10["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T10["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S10 -->|calls| T10
  S11["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T11["method:JobsSlot::endRefreshing<br/>JobsByPods/JobsRefresher@Pods/JobsRefreshProxy.swift:228"]
  S11 -->|calls| T11
  S12["method:BaseWebView::injectDarkCSSIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:124"]
  T12["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:130"]
  S12 -->|calls| T12
  S13["method:BaseWebView::injectDarkCSS<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:130"]
  T13["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S13 -->|calls| T13
  S14["method:BaseWebView::injectMinimalMobileShimIfNeeded<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:152"]
  T14["method:BaseWebView::injectMinimalMobileShim<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Scripts.swift:158"]
  S14 -->|calls| T14
  S15["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:26"]
  T15["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  S15 -->|calls| T15
  S16["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:26"]
  T16["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+传值回调.swift:29"]
  S16 -->|calls| T16
  S17["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:26"]
  T17["method:BaseWebVC::byData<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:148"]
  S17 -->|calls| T17
  S18["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:26"]
  T18["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:91"]
  S18 -->|calls| T18
  S19["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:26"]
  T19["method:UIAlertController::makeAlert<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:35"]
  S19 -->|calls| T19
  S20["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:39"]
  T20["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  S20 -->|calls| T20
  S21["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:39"]
  T21["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+传值回调.swift:29"]
  S21 -->|calls| T21
  S22["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:39"]
  T22["method:BaseWebVC::byData<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:148"]
  S22 -->|calls| T22
  S23["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:39"]
  T23["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:91"]
  S23 -->|calls| T23
  S24["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:39"]
  T24["method:UIAlertController::byAddCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:105"]
  S24 -->|calls| T24
  S25["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:39"]
  T25["method:UIAlertController::makeAlert<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
