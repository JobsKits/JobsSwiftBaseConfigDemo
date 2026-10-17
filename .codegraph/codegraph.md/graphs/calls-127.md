# `calls 符号关系 - 127`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTableViewBlocksProxy::tableView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:393"]
  T1["field:JobsTableViewBlocksProxy::accessoryButtonTappedForRowWith<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:306"]
  S1 -->|calls| T1
  S2["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:403"]
  T2["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S2 -->|calls| T2
  S3["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:403"]
  T3["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S3 -->|calls| T3
  S4["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:409"]
  T4["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:403"]
  S4 -->|calls| T4
  S5["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:409"]
  T5["method:JobsTableViewDelegateMux::responds<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:403"]
  S5 -->|calls| T5
  S6["method:JobsTableViewDelegateMux::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableView/UITableView.swift:409"]
  T6["method:ASDelegateProxy::forwardingTargetForSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:206"]
  S6 -->|calls| T6
  S7["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:19"]
  T7["method:NSTextAttachment::byImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/NSTextAttachment.swift:39"]
  S7 -->|calls| T7
  S8["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:19"]
  T8["method:UITableViewCell::bySecondaryJobsText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UITableViewCell/UITableViewCell+DSL.swift:239"]
  S8 -->|calls| T8
  S9["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:19"]
  T9["method:UILabel::byJobsText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:26"]
  S9 -->|calls| T9
  S10["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:19"]
  T10["method:UILabel::byJobsAttributedText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:19"]
  S10 -->|calls| T10
  S11["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:19"]
  T11["method:UILabel::byJobsAttributedText<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:19"]
  S11 -->|calls| T11
  S12["method:ViewDataProtocol::byData<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITableViewCell/UITableViewCell+数据渲染.swift:19"]
  T12["method:JXSegmentedIndicatorImageView::byImage<br/>JobsByPods/JobsBy3rdTools@Pods/JXSegmentedView/JXSegmentedIndicator/JXSegmentedIndicatorImageView.swift:18"]
  S12 -->|calls| T12
  S13["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:21"]
  T13["method:UITextField::jobs_placeholderLabel_byRuntime<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:39"]
  S13 -->|calls| T13
  S14["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:21"]
  T14["method:UILabel::byTextColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UILabel/UILabel+DSL.swift:39"]
  S14 -->|calls| T14
  S15["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:21"]
  T15["method:UITextField::jobs_applyAttributedPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:47"]
  S15 -->|calls| T15
  S16["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:30"]
  T16["method:UITextField::jobs_placeholderLabel_byRuntime<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:39"]
  S16 -->|calls| T16
  S17["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:30"]
  T17["method:UILabel::byFont<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:81"]
  S17 -->|calls| T17
  S18["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:30"]
  T18["method:UITextField::jobs_applyAttributedPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:47"]
  S18 -->|calls| T18
  S19["method:UITextField::jobs_applyAttributedPlaceholder<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+Placeholder.swift:47"]
  T19["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S19 -->|calls| T19
  S20["method:UITextField::richTextBy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+富文本.swift:18"]
  T20["method:JobsRichText::make<br/>JobsByPods/JobsTextTools@Pods/JobsRichText.swift:65"]
  S20 -->|calls| T20
  S21["method:UITextField::byOnInput<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:22"]
  T21["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:99"]
  S21 -->|calls| T21
  S22["method:UITextField::byBeginEditing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:42"]
  T22["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:99"]
  S22 -->|calls| T22
  S23["method:UITextField::byEndEditing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:52"]
  T23["method:UITextField::installDelegateProxyIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:99"]
  S23 -->|calls| T23
  S24["method:UITextFieldDelegateProxy::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:71"]
  T24["method:ASDelegateProxy::respondsToSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:196"]
  S24 -->|calls| T24
  S25["method:UITextFieldDelegateProxy::forwardingTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UITextField/UITextField+监听.swift:71"]
  T25["method:ASDelegateProxy::forwardingTargetForSelector:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:206"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
