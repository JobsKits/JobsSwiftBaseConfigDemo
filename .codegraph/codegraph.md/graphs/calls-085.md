# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableView::heightForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:183"]
  T1["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:233"]
  S1 -->|calls| T1
  S2["method:UITableView::viewForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:192"]
  T2["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S2 -->|calls| T2
  S3["method:UITableView::viewForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:192"]
  T3["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S3 -->|calls| T3
  S4["method:UITableView::viewForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:192"]
  T4["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:233"]
  S4 -->|calls| T4
  S5["method:UITableView::viewForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:201"]
  T5["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S5 -->|calls| T5
  S6["method:UITableView::viewForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:201"]
  T6["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S6 -->|calls| T6
  S7["method:UITableView::viewForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:201"]
  T7["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:233"]
  S7 -->|calls| T7
  S8["method:UITableView::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:210"]
  T8["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S8 -->|calls| T8
  S9["method:UITableView::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:210"]
  T9["method:UITableView::jobs_blocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:219"]
  S9 -->|calls| T9
  S10["method:UITableView::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:210"]
  T10["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:233"]
  S10 -->|calls| T10
  S11["method:UITableView::jobs_installDelegateMuxIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:233"]
  T11["method:UITableView::jobs_swizzleSetDelegateIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:257"]
  S11 -->|calls| T11
  S12["method:UITableView::jobs_swizzleSetDelegateIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:257"]
  T12["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:276"]
  S12 -->|calls| T12
  S13["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:276"]
  T13["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:276"]
  S13 -->|calls| T13
  S14["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:276"]
  T14["method:UITableView::jobs_setDelegate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:276"]
  S14 -->|calls| T14
  S15["method:JobsTableViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:317"]
  T15["method:JobsTableViewBlocksProxy::numberOfSections<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:317"]
  S15 -->|calls| T15
  S16["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:321"]
  T16["method:UITableView::numberOfRowsInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:57"]
  S16 -->|calls| T16
  S17["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:325"]
  T17["method:UITableView::cellForRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:65"]
  S17 -->|calls| T17
  S18["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:329"]
  T18["method:UITableView::titleForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:73"]
  S18 -->|calls| T18
  S19["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:333"]
  T19["method:UITableView::titleForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:81"]
  S19 -->|calls| T19
  S20["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:337"]
  T20["method:UITableView::canEditRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:89"]
  S20 -->|calls| T20
  S21["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:341"]
  T21["method:UITableView::canMoveRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:97"]
  S21 -->|calls| T21
  S22["method:JobsTableViewBlocksProxy::sectionIndexTitles<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:345"]
  T22["method:JobsTableViewBlocksProxy::sectionIndexTitles<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:345"]
  S22 -->|calls| T22
  S23["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:349"]
  T23["method:UITableView::sectionForSectionIndexTitle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:111"]
  S23 -->|calls| T23
  S24["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:355"]
  T24["method:UITableView::commitEditingStyle<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:119"]
  S24 -->|calls| T24
  S25["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:361"]
  T25["method:UITableView::moveRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:128"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
