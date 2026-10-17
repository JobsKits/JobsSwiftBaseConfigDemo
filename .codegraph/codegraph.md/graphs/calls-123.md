# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:65"]
  T1["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S1 -->|calls| T1
  S2["method:UIScrollView::didScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:71"]
  T2["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S2 -->|calls| T2
  S3["method:JobsScrollViewBlocksProxy::scrollViewWillBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:89"]
  T3["field:JobsScrollViewBlocksProxy::willBeginDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:81"]
  S3 -->|calls| T3
  S4["method:JobsScrollViewBlocksProxy::scrollViewDidScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:94"]
  T4["field:JobsScrollViewBlocksProxy::didScroll<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:82"]
  S4 -->|calls| T4
  S5["method:JobsScrollViewBlocksProxy::scrollViewDidEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:99"]
  T5["field:JobsScrollViewBlocksProxy::didEndDragging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:83"]
  S5 -->|calls| T5
  S6["method:JobsScrollViewBlocksProxy::scrollViewWillBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:104"]
  T6["field:JobsScrollViewBlocksProxy::willBeginDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:84"]
  S6 -->|calls| T6
  S7["method:JobsScrollViewBlocksProxy::scrollViewDidEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:109"]
  T7["field:JobsScrollViewBlocksProxy::didEndDecelerating<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:85"]
  S7 -->|calls| T7
  S8["method:JobsScrollViewBlocksProxy::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:114"]
  T8["method:JobsScrollViewBlocksProxy::scrollViewShouldScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:114"]
  S8 -->|calls| T8
  S9["method:JobsScrollViewBlocksProxy::scrollViewDidScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:118"]
  T9["field:JobsScrollViewBlocksProxy::didScrollToTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:87"]
  S9 -->|calls| T9
  S10["method:JobsScrollDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:134"]
  T10["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S10 -->|calls| T10
  S11["method:JobsScrollDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:134"]
  T11["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S11 -->|calls| T11
  S12["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:139"]
  T12["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S12 -->|calls| T12
  S13["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:139"]
  T13["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S13 -->|calls| T13
  S14["method:JobsScrollDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:139"]
  T14["method:ASDelegateProxy::forwardingTargetForSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:206"]
  S14 -->|calls| T14
  S15["method:UIScrollView::jobs_setDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:165"]
  T15["method:UIScrollView::jobs_scrollBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView.swift:151"]
  S15 -->|calls| T15
  S16["method:UITableView::byDequeueReusableCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DequeueReusable.swift:48"]
  T16["method:UITableView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:52"]
  S16 -->|calls| T16
  S17["method:UITableView::byDequeueReusableHeaderFooterView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+DequeueReusable.swift:81"]
  T17["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:33"]
  S17 -->|calls| T17
  S18["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:17"]
  T18["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:230"]
  S18 -->|calls| T18
  S19["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:25"]
  T19["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:230"]
  S19 -->|calls| T19
  S20["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:33"]
  T20["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:230"]
  S20 -->|calls| T20
  S21["method:UITableView::byRegister<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:41"]
  T21["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:230"]
  S21 -->|calls| T21
  S22["method:UITableView::byRegisterCell<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:52"]
  T22["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:230"]
  S22 -->|calls| T22
  S23["method:UITableView::byRegisterCellOnID<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+Register.swift:58"]
  T23["method:UITableView::register<br/>JobsByPods/JobsSwiftAppTools@Pods/JobsSwiftAppTools.swift:230"]
  S23 -->|calls| T23
  S24["method:UITableView::reloadDatas<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:19"]
  T24["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S24 -->|calls| T24
  S25["method:UITableView::reloadDatas<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView+刷新.swift:19"]
  T25["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
