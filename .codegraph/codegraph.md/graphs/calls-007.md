# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsChaCha20Poly1305Box::encrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:15"]
  T1["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:84"]
  S1 -->|calls| T1
  S2["method:JobsChaCha20Poly1305Box::decrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:43"]
  T2["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:116"]
  S2 -->|calls| T2
  S3["function:aesCBCEncrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:84"]
  T3["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S3 -->|calls| T3
  S4["function:aesCBCDecrypt<br/>JobsByPods/JobsCryptoKit@Pods/JobsCryptoKit@对称加解密/ChaChaPoly.swift:116"]
  T4["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetBtnImage<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:43"]
  T5["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsImageTools@Pods/JobsImageCacheCleanerByUIKit.swift:35"]
  S5 -->|calls| T5
  S6["method:BaseWebView::handlePullToRefresh<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+PullToRefresh.swift:20"]
  T6["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  S6 -->|calls| T6
  S7["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T7["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S7 -->|calls| T7
  S8["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T8["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S8 -->|calls| T8
  S9["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T9["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S9 -->|calls| T9
  S10["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T10["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S10 -->|calls| T10
  S11["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T11["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  S11 -->|calls| T11
  S12["method:BaseWebView::toJSONLiteral<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:27"]
  T12["method:BaseWebView::quote<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:19"]
  S12 -->|calls| T12
  S13["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  T13["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S13 -->|calls| T13
  S14["method:BaseWebView::decodeJSResult<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:57"]
  T14["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S14 -->|calls| T14
  S15["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T15["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S15 -->|calls| T15
  S16["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T16["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
  S16 -->|calls| T16
  S17["method:BaseWebView::makeNoCache<br/>JobsByPods/JobsInheritance@Pods/UIWebView/BaseWebView/BaseWebView+Utils.swift:113"]
  T17["method:EmptyHeaderHook::headers<br/>JobsByPods/JobsNetworking@Pods/RequestConfig/JobsHooks.swift:17"]
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
  S22["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T22["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S22 -->|calls| T22
  S23["method:JobsMakeLocalNotification::triggerLocalNotification<br/>JobsByPods/JobsLocalNotification@Pods/JobsMakeLocalNotification.swift:14"]
  T23["method:JobsLogger::log<br/>JobsByPods/JobsNetworking@Pods/Support/JobsLogger.swift:37"]
  S23 -->|calls| T23
  S24["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  T24["method:JobsSwiftMessageToast::show<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarTools.swift:18"]
  S24 -->|calls| T24
  S25["method:JobsAgent::promise<br/>JobsByPods/JobsNetworking@Pods/Adapters/PromiseKit/JobsAgent+PromiseKit.swift:14"]
  T25["method:JobsDefaultAgent::send<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:46"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
