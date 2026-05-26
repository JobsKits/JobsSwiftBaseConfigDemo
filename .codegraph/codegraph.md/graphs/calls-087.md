# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITableViewCell::byAttributedSecondaryText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:225"]
  T1["method:UITableViewCell::byDetailAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:219"]
  S1 -->|calls| T1
  S2["method:UITableViewCell::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:235"]
  T2["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S2 -->|calls| T2
  S3["method:UITableViewCell::byTextConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:245"]
  T3["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S3 -->|calls| T3
  S4["method:UITableViewCell::byBackgroundConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:253"]
  T4["method:Array::build<br/>JobsByPods/JobsSwiftStandardLibrary@Pods/容器/Array.swift:51"]
  S4 -->|calls| T4
  S5["method:UITableViewCell::bySelectedBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:264"]
  T5["method:UITableViewCell::byBackgroundConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:253"]
  S5 -->|calls| T5
  S6["method:UITableViewCell::bySelectedBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:264"]
  T6["method:MessageCell::setSelected<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/临时项目页面/经典的消息页面/MessageCell.swift:71"]
  S6 -->|calls| T6
  S7["method:UITableViewCell::bySelectedBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:264"]
  T7["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S7 -->|calls| T7
  S8["method:UITableViewCell::byTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:286"]
  T8["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S8 -->|calls| T8
  S9["method:UITableViewCell::byDetailTitleFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:299"]
  T9["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S9 -->|calls| T9
  S10["method:UITableViewCell::byTitleCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:311"]
  T10["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S10 -->|calls| T10
  S11["method:UITableViewCell::byDetailTitleCor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:323"]
  T11["method:UITableViewCell::byContentConfiguration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:136"]
  S11 -->|calls| T11
  S12["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:18"]
  T12["method:UITableViewCell::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:235"]
  S12 -->|calls| T12
  S13["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:18"]
  T13["method:UITableViewCell::bySecondaryJobsText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:183"]
  S13 -->|calls| T13
  S14["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:18"]
  T14["method:UITableViewCell::byJobsText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:165"]
  S14 -->|calls| T14
  S15["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:18"]
  T15["method:UILabel::byJobsAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:19"]
  S15 -->|calls| T15
  S16["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:18"]
  T16["method:UILabel::byJobsAttributedText<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:19"]
  S16 -->|calls| T16
  S17["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:18"]
  T17["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:19"]
  S17 -->|calls| T17
  S18["method:UITextField::onReturn<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:519"]
  T18["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S18 -->|calls| T18
  S19["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T19["method:UITextField::byLeftView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:504"]
  S19 -->|calls| T19
  S20["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T20["method:UIView::byAddSubviewRetSuper<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:477"]
  S20 -->|calls| T20
  S21["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T21["method:UIView::byAutoresizingMask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:161"]
  S21 -->|calls| T21
  S22["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T22["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S22 -->|calls| T22
  S23["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T23["method:UIView::byContentMode<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:195"]
  S23 -->|calls| T23
  S24["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T24["method:UIAlertController::byTintColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60"]
  S24 -->|calls| T24
  S25["method:UITextField::byLeftIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+DSL.swift:564"]
  T25["method:NSTextAttachment::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/NSTextAttachment.swift:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
