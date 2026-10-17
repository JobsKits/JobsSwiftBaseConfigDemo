# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:BRPickerToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:16"]
  T1["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S1 -->|calls| T1
  S2["class:BRPickerToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:16"]
  T2["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S2 -->|calls| T2
  S3["class:BRPickerToolbar<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:16"]
  T3["method:UILabel::byTextAlignment<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:31"]
  S3 -->|calls| T3
  S4["method:BRPickerToolbar::tapCancel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:48"]
  T4["field:BRPickerToolbar::onCancel<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:21"]
  S4 -->|calls| T4
  S5["method:BRPickerToolbar::tapConfirm<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:49"]
  T5["field:BRPickerToolbar::onConfirm<br/>JobsByPods/BRPickerViewSwift@Pods/UI/BRPickerToolbar.swift:22"]
  S5 -->|calls| T5
  S6["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T6["method:JobsNSObjectMaking::jobsMake<br/>JobsByPods/JobsSwiftBlock@Pods/NSObject+Make.swift:17"]
  S6 -->|calls| T6
  S7["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T7["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S7 -->|calls| T7
  S8["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T8["field:JobsFuseConfig::inset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+外圈Layer导火索倒计时效果.swift:32"]
  S8 -->|calls| T8
  S9["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T9["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S9 -->|calls| T9
  S10["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T10["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S10 -->|calls| T10
  S11["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T11["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S11 -->|calls| T11
  S12["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T12["method:JobsAppDoorVC::verticalTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:214"]
  S12 -->|calls| T12
  S13["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T13["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S13 -->|calls| T13
  S14["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T14["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S14 -->|calls| T14
  S15["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T15["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S15 -->|calls| T15
  S16["class:JobsAppDoorVC<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:14"]
  T16["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::submissionStateDidChange<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:66"]
  T17["method:JobsAppDoorFormView::applySubmissionState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:226"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:70"]
  T18["method:JobsAppDoorBaseVC::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:176"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:70"]
  T19["method:JobsAppDoorVC::setupLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:108"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:70"]
  T20["method:JobsAppDoorVC::bindForm<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:127"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:70"]
  T21["method:JobsAppDoorVC::switchMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:179"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::viewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:79"]
  T22["method:JobsAppDoorBaseVC::viewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:192"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::viewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:79"]
  T23["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::handleKeyboardOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:86"]
  T24["method:JobsAppDoorVC::panelTop<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:244"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::handleKeyboardOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:86"]
  T25["method:JobsAppDoorVC::updateLogoVisibility<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/JobsAppDoorVC.swift:201"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
