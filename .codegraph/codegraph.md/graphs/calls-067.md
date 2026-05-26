# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::filled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:47"]
  T1["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S1 -->|calls| T1
  S2["method:UIImage::filled<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:47"]
  T2["function:jobsSolidBlue<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseDebug.swift:63"]
  S2 -->|calls| T2
  S3["method:UIImage::rotated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:66"]
  T3["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S3 -->|calls| T3
  S4["method:UIImage::rotated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:66"]
  T4["method:SphereTagCloudView::rotate<br/>JobsByPods/JobsBy3rdTools@Pods/SphereTagCloudView.swift:278"]
  S4 -->|calls| T4
  S5["method:UIImage::rotated<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage+Cor.swift:66"]
  T5["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S5 -->|calls| T5
  S6["class:UIImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:17"]
  T6["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S6 -->|calls| T6
  S7["method:UIImage::grayScale<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:71"]
  T7["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S7 -->|calls| T7
  S8["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:115"]
  T8["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S8 -->|calls| T8
  S9["method:UIImage::overlayed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:168"]
  T9["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S9 -->|calls| T9
  S10["method:UIImage::overlayed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:168"]
  T10["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S10 -->|calls| T10
  S11["method:UIImage::compressed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:192"]
  T11["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S11 -->|calls| T11
  S12["method:UIImagePickerController::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:21"]
  T12["method:UIImagePickerController::jobs_imagePickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:71"]
  S12 -->|calls| T12
  S13["method:UIImagePickerController::didFinishPickingMediaWithInfo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:29"]
  T13["method:UIImagePickerController::jobs_imagePickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:71"]
  S13 -->|calls| T13
  S14["method:UIImagePickerController::didCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:37"]
  T14["method:UIImagePickerController::jobs_imagePickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:71"]
  S14 -->|calls| T14
  S15["method:JobsImagePickerBlocksProxy::imagePickerController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:53"]
  T15["method:UIImagePickerController::didFinishPickingMediaWithInfo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:29"]
  S15 -->|calls| T15
  S16["method:JobsImagePickerBlocksProxy::imagePickerControllerDidCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:59"]
  T16["method:UIImagePickerController::didCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:37"]
  S16 -->|calls| T16
  S17["method:UIImageView::byHighlighted<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+DSL.swift:107"]
  T17["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S17 -->|calls| T17
  S18["method:UIImageView::byAnimationDuration<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+DSL.swift:127"]
  T18["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S18 -->|calls| T18
  S19["method:UIImageView::byAnimationRepeatCount<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+DSL.swift:135"]
  T19["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S19 -->|calls| T19
  S20["method:UIImageView::byPreferredImageDynamicRange<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+DSL.swift:156"]
  T20["method:NSObject::_byApplyValue<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+Builder.swift:23"]
  S20 -->|calls| T20
  S21["method:UIImageView::byShimmeringAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:62"]
  T21["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:27"]
  S21 -->|calls| T21
  S22["method:UIImageView::byShimmeringAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:76"]
  T22["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:27"]
  S22 -->|calls| T22
  S23["method:UIImageView::byShimmeringAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:76"]
  T23["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S23 -->|calls| T23
  S24["method:UIImageView::byShimmeringAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:91"]
  T24["method:UIImageView::byShimmeringAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:91"]
  S24 -->|calls| T24
  S25["method:UIImageView::byAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:103"]
  T25["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
