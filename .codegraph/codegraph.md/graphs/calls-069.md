# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T1["method:UIImageView::jobs_cancelSimpleImageTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:91"]
  S1 -->|calls| T1
  S2["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T2["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S2 -->|calls| T2
  S3["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T3["method:JobsSimpleImageLoader::cachedImage<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:18"]
  S3 -->|calls| T3
  S4["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T4["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S4 -->|calls| T4
  S5["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T5["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  S5 -->|calls| T5
  S6["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T6["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S6 -->|calls| T6
  S7["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T7["method:JobsSimpleImageLoader::load<br/>JobsByPods/JobsImageTools@Pods/JobsSimpleImageLoader.swift:22"]
  S7 -->|calls| T7
  S8["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T8["method:UIImageView::jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:45"]
  S8 -->|calls| T8
  S9["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T9["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S9 -->|calls| T9
  S10["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:117"]
  T10["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S10 -->|calls| T10
  S11["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:163"]
  T11["method:UIImageView::jobs_setImageSimple<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:163"]
  S11 -->|calls| T11
  S12["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T12["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  S12 -->|calls| T12
  S13["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T13["method:UIImageView::jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:45"]
  S13 -->|calls| T13
  S14["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T14["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S14 -->|calls| T14
  S15["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T15["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S15 -->|calls| T15
  S16["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T16["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S16 -->|calls| T16
  S17["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T17["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S17 -->|calls| T17
  S18["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:182"]
  T18["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S18 -->|calls| T18
  S19["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:231"]
  T19["method:UIImageView::kf_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:231"]
  S19 -->|calls| T19
  S20["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T20["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  S20 -->|calls| T20
  S21["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T21["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  S21 -->|calls| T21
  S22["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T22["method:UIImageView::jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:45"]
  S22 -->|calls| T22
  S23["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T23["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S23 -->|calls| T23
  S24["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T24["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S24 -->|calls| T24
  S25["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:253"]
  T25["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
