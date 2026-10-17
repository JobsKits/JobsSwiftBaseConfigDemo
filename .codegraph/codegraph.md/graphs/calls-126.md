# `calls 符号关系 - 126`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableView::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:202"]
  T1["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:210"]
  S1 -->|calls| T1
  S2["method:UITableView::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:202"]
  T2["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:224"]
  S2 -->|calls| T2
  S3["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:224"]
  T3["method:UITableView::jobs_swizzleSetDelegateIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:248"]
  S3 -->|calls| T3
  S4["method:UITableView::jobs_swizzleSetDelegateIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:248"]
  T4["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:267"]
  S4 -->|calls| T4
  S5["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:267"]
  T5["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:267"]
  S5 -->|calls| T5
  S6["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:267"]
  T6["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:267"]
  S6 -->|calls| T6
  S7["method:JobsTableViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:308"]
  T7["method:JobsTableViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:308"]
  S7 -->|calls| T7
  S8["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:312"]
  T8["field:JobsTableViewBlocksProxy::numberOfRowsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:287"]
  S8 -->|calls| T8
  S9["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:316"]
  T9["field:JobsTableViewBlocksProxy::cellForRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:288"]
  S9 -->|calls| T9
  S10["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:320"]
  T10["field:JobsTableViewBlocksProxy::titleForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:289"]
  S10 -->|calls| T10
  S11["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:324"]
  T11["field:JobsTableViewBlocksProxy::titleForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:290"]
  S11 -->|calls| T11
  S12["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:328"]
  T12["field:JobsTableViewBlocksProxy::canEditRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:291"]
  S12 -->|calls| T12
  S13["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:332"]
  T13["field:JobsTableViewBlocksProxy::canMoveRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:292"]
  S13 -->|calls| T13
  S14["method:JobsTableViewBlocksProxy::sectionIndexTitles<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:336"]
  T14["method:JobsTableViewBlocksProxy::sectionIndexTitles<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:336"]
  S14 -->|calls| T14
  S15["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:340"]
  T15["field:JobsTableViewBlocksProxy::sectionForSectionIndexTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:294"]
  S15 -->|calls| T15
  S16["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:346"]
  T16["field:JobsTableViewBlocksProxy::commitEditingStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:295"]
  S16 -->|calls| T16
  S17["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:352"]
  T17["field:JobsTableViewBlocksProxy::moveRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:296"]
  S17 -->|calls| T17
  S18["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:359"]
  T18["field:JobsTableViewBlocksProxy::willDisplay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:298"]
  S18 -->|calls| T18
  S19["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:365"]
  T19["field:JobsTableViewBlocksProxy::didSelectRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:299"]
  S19 -->|calls| T19
  S20["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:369"]
  T20["field:JobsTableViewBlocksProxy::didDeselectRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:300"]
  S20 -->|calls| T20
  S21["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:373"]
  T21["field:JobsTableViewBlocksProxy::heightForRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:301"]
  S21 -->|calls| T21
  S22["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:377"]
  T22["field:JobsTableViewBlocksProxy::heightForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:302"]
  S22 -->|calls| T22
  S23["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:381"]
  T23["field:JobsTableViewBlocksProxy::heightForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:303"]
  S23 -->|calls| T23
  S24["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:385"]
  T24["field:JobsTableViewBlocksProxy::viewForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:304"]
  S24 -->|calls| T24
  S25["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:389"]
  T25["field:JobsTableViewBlocksProxy::viewForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:305"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
