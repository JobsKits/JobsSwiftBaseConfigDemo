# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T1["method:BMPlayer::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:25"]
  S1 -->|calls| T1
  S2["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T2["method:UIGestureRecognizer::byDelaysTouchesBegan<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:51"]
  S2 -->|calls| T2
  S3["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T3["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S3 -->|calls| T3
  S4["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T4["method:UIPanGestureRecognizer::byMaxTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:157"]
  S4 -->|calls| T4
  S5["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T5["method:UIPanGestureRecognizer::byMinTouches<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:151"]
  S5 -->|calls| T5
  S6["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T6["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S6 -->|calls| T6
  S7["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T7["method:SphereTagCloudView::onPan<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:173"]
  S7 -->|calls| T7
  S8["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T8["method:UIView::jobs_addGesture<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:599"]
  S8 -->|calls| T8
  S9["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T9["method:BMPlayer::byDelegate<br/>JobsByPods/JobsBy3rdTools@Pods/BMPlayer+DSL.swift:25"]
  S9 -->|calls| T9
  S10["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T10["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+DSL.swift:45"]
  S10 -->|calls| T10
  S11["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T11["method:GKNavigationBarConfigure::byScale<br/>JobsByPods/JobsBy3rdTools@Pods/GKNavigationBarSwift+DSL.swift:235"]
  S11 -->|calls| T11
  S12["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T12["method:UIGestureRecognizer::byConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIGestureRecognizer/UIGestureRecognizer+Block.swift:26"]
  S12 -->|calls| T12
  S13["method:SphereTagCloudView::setupGestures<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:138"]
  T13["method:SphereTagCloudView::onPinch<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:211"]
  S13 -->|calls| T13
  S14["method:SphereTagCloudView::onPan<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:173"]
  T14["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:278"]
  S14 -->|calls| T14
  S15["method:SphereTagCloudView::onPan<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:173"]
  T15["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:305"]
  S15 -->|calls| T15
  S16["method:SphereTagCloudView::onPinch<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:211"]
  T16["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:305"]
  S16 -->|calls| T16
  S17["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  T17["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:278"]
  S17 -->|calls| T17
  S18["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  T18["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:278"]
  S18 -->|calls| T18
  S19["method:SphereTagCloudView::tick<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:224"]
  T19["method:SphereTagCloudView::renderAll<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:305"]
  S19 -->|calls| T19
  S20["method:SphereTagCloudView::byItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:409"]
  T20["method:SphereTagCloudView::setItems<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:81"]
  S20 -->|calls| T20
  S21["method:YTKBaseRequest::byCompletion<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:83"]
  T21["function:BRDatePicker::makeDate::s<br/>JobsByPods/BRPickerViewSwift@Pods/Picker/BRDatePicker.swift:117"]
  S21 -->|calls| T21
  S22["method:YTKBaseRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:114"]
  T22["enum_member:HTTPResponseCode::success<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:297"]
  S22 -->|calls| T22
  S23["method:YTKBaseRequest::byStart<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBaseRequest+DSL.swift:114"]
  T23["method:JobsClockView::start<br/>JobsByPods/JobsBy3rdTools@Pods/JobsClock.swift:205"]
  S23 -->|calls| T23
  S24["method:YTKBatchRequest::byAddAccessory<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBatchRequest+DSL.swift:28"]
  T24["method:String::add<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/String/String+通用工具.swift:21"]
  S24 -->|calls| T24
  S25["method:YTKBatchRequest::byAccessories<br/>JobsByPods/JobsBy3rdTools@Pods/YTKNetwork/YTKBatchRequest+DSL.swift:34"]
  T25["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
