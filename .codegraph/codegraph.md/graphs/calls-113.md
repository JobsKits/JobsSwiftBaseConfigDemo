# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  T1["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S1 -->|calls| T1
  S2["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  T2["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S2 -->|calls| T2
  S3["method:UIImage::rounded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:151"]
  T3["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:32"]
  S3 -->|calls| T3
  S4["method:UIImage::circleIcon<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:186"]
  T4["method:UIImage::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:20"]
  S4 -->|calls| T4
  S5["method:UIImage::overlayed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:196"]
  T5["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S5 -->|calls| T5
  S6["method:UIImage::overlayed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:196"]
  T6["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S6 -->|calls| T6
  S7["method:UIImage::compressed<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImage/UIImage.swift:215"]
  T7["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S7 -->|calls| T7
  S8["method:UIImagePickerController::byTarget<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:21"]
  T8["method:UIImagePickerController::jobs_imagePickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:70"]
  S8 -->|calls| T8
  S9["method:UIImagePickerController::didFinishPickingMediaWithInfo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:29"]
  T9["method:UIImagePickerController::jobs_imagePickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:70"]
  S9 -->|calls| T9
  S10["method:UIImagePickerController::didCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:37"]
  T10["method:UIImagePickerController::jobs_imagePickerBlocksProxy<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:70"]
  S10 -->|calls| T10
  S11["method:JobsImagePickerBlocksProxy::imagePickerController<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:53"]
  T11["field:JobsImagePickerBlocksProxy::didFinishPickingMediaWithInfo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:48"]
  S11 -->|calls| T11
  S12["method:JobsImagePickerBlocksProxy::imagePickerControllerDidCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:59"]
  T12["field:JobsImagePickerBlocksProxy::didCancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImagePickerController/UIImagePickerController+Proxy.swift:52"]
  S12 -->|calls| T12
  S13["method:UIImageView::jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:50"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:66"]
  T14["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:438"]
  S14 -->|calls| T14
  S15["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:66"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:66"]
  T16["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:407"]
  S16 -->|calls| T16
  S17["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:75"]
  T17["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:438"]
  S17 -->|calls| T17
  S18["method:UIImageView::jobs_cancelImageLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:80"]
  T18["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S18 -->|calls| T18
  S19["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T19["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S19 -->|calls| T19
  S20["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T20["method:JobsAnyNotificationToken::cancel<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/NSObject/NSObject+通知.swift:92"]
  S20 -->|calls| T20
  S21["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T21["enum:JobsImageSource<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:31"]
  S21 -->|calls| T21
  S22["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T22["method:UIImageView::jobs_cancelImageLoad<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:80"]
  S22 -->|calls| T22
  S23["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T23["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:146"]
  S23 -->|calls| T23
  S24["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T24["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:66"]
  S24 -->|calls| T24
  S25["method:UIImageView::jobs_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:88"]
  T25["method:UIImageView::jobs_targetSizeForImageLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
