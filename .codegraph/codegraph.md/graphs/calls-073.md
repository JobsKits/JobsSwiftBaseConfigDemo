# `calls 符号关系 - 073`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextView::tr_setAttributedText<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:87"]
  T1["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S1 -->|calls| T1
  S2["method:UIBarButtonItem::tr_setTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:96"]
  T2["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S2 -->|calls| T2
  S3["method:UINavigationItem::tr_setTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:106"]
  T3["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S3 -->|calls| T3
  S4["method:UINavigationItem::tr_setTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:106"]
  T4["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S4 -->|calls| T4
  S5["method:UINavigationItem::tr_setPrompt<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:118"]
  T5["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S5 -->|calls| T5
  S6["method:UINavigationItem::tr_setPrompt<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:118"]
  T6["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S6 -->|calls| T6
  S7["method:UINavigationItem::tr_setBackButtonTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:130"]
  T7["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S7 -->|calls| T7
  S8["method:UINavigationItem::tr_setBackButtonTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:130"]
  T8["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S8 -->|calls| T8
  S9["method:UITabBarItem::tr_setTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:144"]
  T9["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S9 -->|calls| T9
  S10["method:UITabBarItem::tr_setTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:144"]
  T10["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S10 -->|calls| T10
  S11["method:UISegmentedControl::tr_setTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:158"]
  T11["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S11 -->|calls| T11
  S12["method:UISearchBar::tr_setPlaceholder<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:167"]
  T12["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S12 -->|calls| T12
  S13["method:UISearchBar::tr_setPlaceholder<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:167"]
  T13["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S13 -->|calls| T13
  S14["method:UISearchBar::tr_setPrompt<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:179"]
  T14["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S14 -->|calls| T14
  S15["method:UISearchBar::tr_setPrompt<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:179"]
  T15["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S15 -->|calls| T15
  S16["method:UIAlertController::tr_setAlertTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:194"]
  T16["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S16 -->|calls| T16
  S17["method:UIAlertController::tr_setAlertTitle<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:194"]
  T17["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S17 -->|calls| T17
  S18["method:UIAlertController::tr_setMessage<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:206"]
  T18["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S18 -->|calls| T18
  S19["method:UIAlertController::tr_setMessage<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:206"]
  T19["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S19 -->|calls| T19
  S20["method:UIView::tr_setA11yLabel<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:221"]
  T20["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S20 -->|calls| T20
  S21["method:UIView::tr_setA11yLabel<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:221"]
  T21["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S21 -->|calls| T21
  S22["method:UIView::tr_setA11yHint<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:233"]
  T22["method:TRBind::consumeMarkerIfNeeded<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:152"]
  S22 -->|calls| T22
  S23["method:UIView::tr_setA11yHint<br/>JobsByPods/Jobsl10n@Pods/Foundation&UIKit/UIKit+多语言国际化.swift:233"]
  T23["method:TRBind::bind<br/>JobsByPods/Jobsl10n@Pods/TRAutoRefresh.swift:135"]
  S23 -->|calls| T23
  S24["function:resolveLanguageCode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:18"]
  T24["function:loadLanguageMode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:27"]
  S24 -->|calls| T24
  S25["function:loadLanguageMode<br/>JobsByPods/Jobsl10n@Pods/Jobsl10n.swift:27"]
  T25["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
