# `calls 符号关系 - 136`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T1["method:BRBasePicker::byPresent<br/>JobsByPods/BRPickerViewSwift@Pods/Core/BRBasePicker.swift:132"]
  S1 -->|calls| T1
  S2["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T2["method:ViewDataProtocol::onResult<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+传值回调.swift:29"]
  S2 -->|calls| T2
  S3["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T3["method:BaseWebVC::byData<br/>JobsByPods/JobsInheritance@Pods/UIViewController/BaseWebVC.swift:148"]
  S3 -->|calls| T3
  S4["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T4["method:UIAlertController::byAddOK<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:91"]
  S4 -->|calls| T4
  S5["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T5["method:UIAlertController::byAddCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:105"]
  S5 -->|calls| T5
  S6["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T6["method:UIAlertController::byAddTextField<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:155"]
  S6 -->|calls| T6
  S7["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:53"]
  T7["method:UIAlertController::makeAlert<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:35"]
  S7 -->|calls| T7
  S8["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+UIDelegate.swift:71"]
  T8["method:BRPickerPanel::present<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerPanel.swift:90"]
  S8 -->|calls| T8
  S9["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T9["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S9 -->|calls| T9
  S10["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T10["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S10 -->|calls| T10
  S11["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T11["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S11 -->|calls| T11
  S12["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T12["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S12 -->|calls| T12
  S13["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T13["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S13 -->|calls| T13
  S14["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T14["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S14 -->|calls| T14
  S15["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T15["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S15 -->|calls| T15
  S16["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  T16["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S16 -->|calls| T16
  S17["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  T17["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S17 -->|calls| T17
  S18["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T18["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S18 -->|calls| T18
  S19["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T19["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S19 -->|calls| T19
  S20["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T20["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S20 -->|calls| T20
  S21["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T21["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S21 -->|calls| T21
  S22["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T22["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S22 -->|calls| T22
  S23["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T23["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S23 -->|calls| T23
  S24["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T24["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S24 -->|calls| T24
  S25["class:BaseWebView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:30"]
  T25["method:BMPlayer::byAddTo<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:83"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
