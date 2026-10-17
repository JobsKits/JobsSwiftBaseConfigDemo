# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T1["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T2["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T3["method:UIView::jobsAddKeyframe<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:85"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorBaseVC::runEntrancePop<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:292"]
  T4["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:104"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorBaseVC::toggleVolumePanel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:314"]
  T5["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T6["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T7["method:UIView::byHidden<br/>JobsByPods/JobsNavBar@Pods/JobsNavBarByUIKit.swift:48"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T8["method:UISlider::byValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:21"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T9["method:JobsAppDoorBaseVC::updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:364"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T10["method:CALayer::byTransform<br/>JobsByPods/JobsSwiftDSL@Pods/QuartzCore/CALayer.swift:52"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T11["method:UIListContentConfiguration::byAlpha<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:169"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T12["method:UIBarButtonItem::byHidden<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:117"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorBaseVC::setVolumePanelVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:318"]
  T13["method:UIView::jobsAnimateWithSpring<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+AnimationDSL.swift:49"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorBaseVC::applyVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:358"]
  T14["method:JobsAppDoorBackgroundView::setVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorBackgroundView/JobsAppDoorBackgroundView.swift:91"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorBaseVC::applyVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:358"]
  T15["method:UISlider::byValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UISlider.swift:21"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorBaseVC::applyVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:358"]
  T16["method:JobsAppDoorBaseVC::updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:364"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorBaseVC::updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:364"]
  T17["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorBaseVC::updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:364"]
  T18["method:UILabel::byText<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:93"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorBaseVC::observeKeyboard<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:369"]
  T19["method:JobsAppDoorBaseVC::handleKeyboardOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:207"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorBaseVC::observeKeyboard<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:369"]
  T20["method:JobsAppDoorBaseVC::handleKeyboardOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Controller/JobsAppDoorBaseVC/JobsAppDoorBaseVC.swift:207"]
  S20 -->|calls| T20
  S21["property:JobsAppDoorResource::bundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:13"]
  T21["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorResource::customerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:24"]
  T22["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorResource::customerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:24"]
  T23["method:JobsAppDoorResource::image<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:19"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorResource::videoURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:29"]
  T24["method:ASPhotosFrameworkImageRequestTests::urlForExampleImageRequest<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASPhotosFrameworkImageRequestTests.mm:37"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorResource::countdownText<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:49"]
  T25["method:JobsAppDoorResource::text<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.swift:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
