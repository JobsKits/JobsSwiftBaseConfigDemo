# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:368"]
  T1["method:UITableView::willDisplay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:137"]
  S1 -->|calls| T1
  S2["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:374"]
  T2["method:UITableView::didSelectRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:147"]
  S2 -->|calls| T2
  S3["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:378"]
  T3["method:UITableView::didDeselectRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:156"]
  S3 -->|calls| T3
  S4["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:382"]
  T4["method:UITableView::heightForRowAt<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:165"]
  S4 -->|calls| T4
  S5["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:386"]
  T5["method:UITableView::heightForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:174"]
  S5 -->|calls| T5
  S6["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:390"]
  T6["method:UITableView::heightForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:183"]
  S6 -->|calls| T6
  S7["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:394"]
  T7["method:UITableView::viewForHeaderInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:192"]
  S7 -->|calls| T7
  S8["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:398"]
  T8["method:UITableView::viewForFooterInSection<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:201"]
  S8 -->|calls| T8
  S9["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:402"]
  T9["method:UITableView::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:210"]
  S9 -->|calls| T9
  S10["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  T10["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  S10 -->|calls| T10
  S11["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  T11["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  S11 -->|calls| T11
  S12["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  T12["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  S12 -->|calls| T12
  S13["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:419"]
  T13["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  S13 -->|calls| T13
  S14["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:419"]
  T14["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:412"]
  S14 -->|calls| T14
  S15["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:419"]
  T15["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:419"]
  S15 -->|calls| T15
  S16["method:UITableViewCell::bySelected<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:29"]
  T16["method:MessageCell::setSelected<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/临时项目页面/经典的消息页面/MessageCell.swift:71"]
  S16 -->|calls| T16
  S17["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  T17["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S17 -->|calls| T17
  S18["method:UITableViewCell::byJobsAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:155"]
  T18["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S18 -->|calls| T18
  S19["method:UITableViewCell::byJobsText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:165"]
  T19["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S19 -->|calls| T19
  S20["method:UITableViewCell::byText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:174"]
  T20["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S20 -->|calls| T20
  S21["method:UITableViewCell::bySecondaryJobsText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:183"]
  T21["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S21 -->|calls| T21
  S22["method:UITableViewCell::byAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:193"]
  T22["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S22 -->|calls| T22
  S23["method:UITableViewCell::bySecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:203"]
  T23["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S23 -->|calls| T23
  S24["method:UITableViewCell::bySecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:203"]
  T24["method:UITableViewCell::byDetailText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:213"]
  S24 -->|calls| T24
  S25["method:UITableViewCell::byAttributedSecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:225"]
  T25["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
