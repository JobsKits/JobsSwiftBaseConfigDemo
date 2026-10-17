# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T1["method:JobsCallbackable::jobs_callback<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:61"]
  S1 -->|calls| T1
  S2["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T2["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S2 -->|calls| T2
  S3["method:JobsSwiftBlockRegression::verifyCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:68"]
  T3["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S3 -->|calls| T3
  S4["method:JobsSwiftBlockRegression::verifyPureSwiftCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:99"]
  T4["method:JobsCallbackable::jobsBy<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:55"]
  S4 -->|calls| T4
  S5["method:JobsSwiftBlockRegression::verifyPureSwiftCallbacks<br/>.github/tests/JobsSwiftBlockRegression.swift:99"]
  T5["method:JobsCallbackable::jobsCall<br/>JobsByPods/JobsSwiftBlock@Pods/JobsCallbackable.swift:77"]
  S5 -->|calls| T5
  S6["method:JobsSimulatorSelection::select<br/>.github/tests/SimulatorRuntime/select_simulator.rb:18"]
  T6["method:JobsSimulatorSelection::version<br/>.github/tests/SimulatorRuntime/select_simulator.rb:11"]
  S6 -->|calls| T6
  S7["method:JobsSimulatorSelection::select<br/>.github/tests/SimulatorRuntime/select_simulator.rb:18"]
  T7["method:JobsSimulatorSelection::version<br/>.github/tests/SimulatorRuntime/select_simulator.rb:11"]
  S7 -->|calls| T7
  S8["class:Human<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:19"]
  T8["type_alias:Human::EntityBindingType<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:20"]
  S8 -->|calls| T8
  S9["method:HumanBinding::collect<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:107"]
  T9["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASTableView.mm:155"]
  S9 -->|calls| T9
  S10["method:HumanBinding::createEntity<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:116"]
  T10["method:UnityWebRequestUploadStream::read:maxLength:<br/>Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:317"]
  S10 -->|calls| T10
  S11["method:HumanBinding::createEntity<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:116"]
  T11["method:UnityWebRequestUploadStream::read:maxLength:<br/>Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:317"]
  S11 -->|calls| T11
  S12["method:HumanBinding::createEntity<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:116"]
  T12["method:UnityWebRequestUploadStream::read:maxLength:<br/>Unity/xcode_effectTest/Classes/Unity/UnityWebRequest.mm:317"]
  S12 -->|calls| T12
  S13["function:cModel<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:136"]
  T13["method:Human::buildEntity<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:27"]
  S13 -->|calls| T13
  S14["class:Store<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:143"]
  T14["function:cModel<br/>Generated/EntityInfo-JobsSwiftBaseConfigDemo.generated.swift:136"]
  S14 -->|calls| T14
  S15["method:BRSlideAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:23"]
  T15["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S15 -->|calls| T15
  S16["method:BRSlideAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:23"]
  T16["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S16 -->|calls| T16
  S17["method:BRSlideAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:23"]
  T17["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S17 -->|calls| T17
  S18["method:BRSlideAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:23"]
  T18["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S18 -->|calls| T18
  S19["method:BRSlideAnimation::animateOut<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:31"]
  T19["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S19 -->|calls| T19
  S20["method:BRSlideAnimation::animateOut<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:31"]
  T20["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S20 -->|calls| T20
  S21["method:BRSpringAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:41"]
  T21["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S21 -->|calls| T21
  S22["method:BRSpringAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:41"]
  T22["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S22 -->|calls| T22
  S23["method:BRSpringAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:41"]
  T23["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S23 -->|calls| T23
  S24["method:BRSpringAnimation::animateIn<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:41"]
  T24["method:UIView::byAlpha<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:54"]
  S24 -->|calls| T24
  S25["method:BRSpringAnimation::animateOut<br/>JobsByPods/BRPickerViewSwift@Pods/Animation/BRPanelAnimation.swift:53"]
  T25["method:UIView::byFrame<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+修改位置大小.swift:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
