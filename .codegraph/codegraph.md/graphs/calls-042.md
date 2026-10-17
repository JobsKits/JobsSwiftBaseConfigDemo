# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T1["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S1 -->|calls| T1
  S2["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T2["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S2 -->|calls| T2
  S3["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T3["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S3 -->|calls| T3
  S4["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T4["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S4 -->|calls| T4
  S5["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T5["method:JobsAppDoorFormView::rememberImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:536"]
  S5 -->|calls| T5
  S6["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T6["method:JobsAppDoorFormView::rememberImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:536"]
  S6 -->|calls| T6
  S7["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T7["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S7 -->|calls| T7
  S8["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T8["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S8 -->|calls| T8
  S9["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T9["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S9 -->|calls| T9
  S10["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T10["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S10 -->|calls| T10
  S11["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T11["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S11 -->|calls| T11
  S12["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T12["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S12 -->|calls| T12
  S13["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T13["field:JobsAppDoorFormView::onModeRequest<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:18"]
  S13 -->|calls| T13
  S14["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T14["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:17"]
  S14 -->|calls| T14
  S15["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T15["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S15 -->|calls| T15
  S16["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T16["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S16 -->|calls| T16
  S17["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T17["method:JobsAppDoorFormView::submitTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:493"]
  S17 -->|calls| T17
  S18["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T18["method:JobsAppDoorFormView::submitTitleColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:522"]
  S18 -->|calls| T18
  S19["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T19["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:20"]
  S19 -->|calls| T19
  S20["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T20["method:JobsAppDoorFormView::submitBackgroundColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:526"]
  S20 -->|calls| T20
  S21["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T21["method:JobsAppDoorFormView::submitTapped<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:446"]
  S21 -->|calls| T21
  S22["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T22["method:UIButton::jobsAppDoorAppearance<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/UIButton+JobsAppDoorAppearance/UIButton+JobsAppDoorAppearance.swift:35"]
  S22 -->|calls| T22
  S23["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T23["method:UIButton::sys<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+Init.swift:28"]
  S23 -->|calls| T23
  S24["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T24["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S24 -->|calls| T24
  S25["class:JobsAppDoorFormView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:15"]
  T25["method:JobsAppDoorFormView::homeTitleColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorFormView/JobsAppDoorFormView.swift:532"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
