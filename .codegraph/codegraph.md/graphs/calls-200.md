# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseWebView::downloadDidFinish<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:28"]
  T1["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:360"]
  S1 -->|calls| T1
  S2["method:BaseWebView::download<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:33"]
  T2["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:360"]
  S2 -->|calls| T2
  S3["method:DocumentPickerDelegateProxy::documentPicker<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:48"]
  T3["field:DocumentPickerDelegateProxy::onFinish<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:42"]
  S3 -->|calls| T3
  S4["method:DocumentPickerDelegateProxy::documentPickerWasCancelled<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:52"]
  T4["field:DocumentPickerDelegateProxy::onFinish<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Download.swift:42"]
  S4 -->|calls| T4
  S5["method:BaseWebView::useMobileBridgeBy<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+MobileBridge.swift:94"]
  T5["method:BaseWebView::useMobileBridge<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:446"]
  S5 -->|calls| T5
  S6["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:19"]
  T6["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S6 -->|calls| T6
  S7["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:25"]
  T7["method:BaseWebView::emitEvent<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:360"]
  S7 -->|calls| T7
  S8["method:BaseWebView::webViewWebContentProcessDidTerminate<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:42"]
  T8["method:JobsSwiftLinkageMenuView::reload<br/>JobsByPods/JobsSwiftLinkageMenuView@Pods/JobsSwiftLinkageMenuView.swift:183"]
  S8 -->|calls| T8
  S9["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T9["enum_member:TextFormatStrategy::lowercased<br/>JobsByPods/JobsSwiftBaseTools@Pods/TextInputStrategies.swift:16"]
  S9 -->|calls| T9
  S10["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T10["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  S10 -->|calls| T10
  S11["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T11["field:AnyDecodable::value<br/>JobsByPods/JobsInheritance@Pods/UIWebView/AnyDecodable.swift:12"]
  S11 -->|calls| T11
  S12["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T12["method:JobsMarkdownView::load<br/>JobsByPods/JobsSwiftMarkdown@Pods/Core/JobsMarkdownView.swift:89"]
  S12 -->|calls| T12
  S13["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T13["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:116"]
  S13 -->|calls| T13
  S14["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T14["method:BaseWebView::presentSafari<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:144"]
  S14 -->|calls| T14
  S15["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T15["field:BaseWebView::urlRewriter<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:47"]
  S15 -->|calls| T15
  S16["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T16["method:JobsMarkdownView::load<br/>JobsByPods/JobsSwiftMarkdown@Pods/Core/JobsMarkdownView.swift:89"]
  S16 -->|calls| T16
  S17["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T17["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:116"]
  S17 -->|calls| T17
  S18["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T18["method:BaseWebView::normalizeSuffix<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:104"]
  S18 -->|calls| T18
  S19["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T19["field:BaseWebView::uaSuffixProvider<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView.swift:104"]
  S19 -->|calls| T19
  S20["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T20["method:WKWebView::byCustomUserAgent<br/>JobsByPods/JobsSwiftDSL@Pods/WebKit/WKWebView.swift:49"]
  S20 -->|calls| T20
  S21["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T21["method:JobsMarkdownView::load<br/>JobsByPods/JobsSwiftMarkdown@Pods/Core/JobsMarkdownView.swift:89"]
  S21 -->|calls| T21
  S22["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T22["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:116"]
  S22 -->|calls| T22
  S23["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T23["method:JobsMarkdownView::load<br/>JobsByPods/JobsSwiftMarkdown@Pods/Core/JobsMarkdownView.swift:89"]
  S23 -->|calls| T23
  S24["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T24["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:116"]
  S24 -->|calls| T24
  S25["method:BaseWebView::webView<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Navigation.swift:47"]
  T25["method:String::open<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+系统功能调用.swift:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
