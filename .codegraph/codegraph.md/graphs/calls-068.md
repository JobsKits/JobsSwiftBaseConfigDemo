# `calls 符号关系 - 068`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImageView::byAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:103"]
  T1["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S1 -->|calls| T1
  S2["method:UIImageView::byAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:103"]
  T2["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S2 -->|calls| T2
  S3["method:UIImageView::byAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:103"]
  T3["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S3 -->|calls| T3
  S4["method:UIImageView::byAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:103"]
  T4["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S4 -->|calls| T4
  S5["method:UIImageView::byAsyncImageKF<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+Kingfisher.swift:103"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  T6["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  S6 -->|calls| T6
  S7["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  T7["method:UnityAppController::transitionToViewController:<br/>TODO/Unity/xcode_effectTest/Classes/UI/UnityAppController+ViewHandling.mm:225"]
  S7 -->|calls| T7
  S8["method:UIImageView::byShimmeringAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:64"]
  T8["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  S8 -->|calls| T8
  S9["method:UIImageView::byShimmeringAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:78"]
  T9["method:UIImageView::sd_setImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:26"]
  S9 -->|calls| T9
  S10["method:UIImageView::byShimmeringAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:78"]
  T10["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S10 -->|calls| T10
  S11["method:UIImageView::byShimmeringAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:93"]
  T11["method:UIImageView::byShimmeringAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:93"]
  S11 -->|calls| T11
  S12["method:UIImageView::byAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:105"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:UIImageView::byAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:105"]
  T13["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S13 -->|calls| T13
  S14["method:UIImageView::byAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:105"]
  T14["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S14 -->|calls| T14
  S15["method:UIImageView::byAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:105"]
  T15["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S15 -->|calls| T15
  S16["method:UIImageView::byAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:105"]
  T16["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S16 -->|calls| T16
  S17["method:UIImageView::byAsyncImageSD<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+SDWebImage.swift:105"]
  T17["enum_member:PromiseKitDemoVC::Row::fallback<br/>JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@PromiseKit/PromiseKitDemoVC.swift:30"]
  S17 -->|calls| T17
  S18["method:UIImageView::jobs_runOnMain<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:45"]
  T18["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S18 -->|calls| T18
  S19["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  T19["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:416"]
  S19 -->|calls| T19
  S20["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  T20["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S20 -->|calls| T20
  S21["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  T21["method:UIView::jobs_updateShimmerLayout<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:385"]
  S21 -->|calls| T21
  S22["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  T22["method:UIView::byShimmering<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+自研骨架屏呼吸占位效果Shimmer.swift:416"]
  S22 -->|calls| T22
  S23["method:UIImageView::jobs_cancelSimpleImageTask<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:91"]
  T23["method:JobsTask::cancel<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:202"]
  S23 -->|calls| T23
  S24["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  T24["method:UIImageView::jobs_endShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:86"]
  S24 -->|calls| T24
  S25["method:UIImageView::jobs_handleImageLoadFailure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:100"]
  T25["method:UIImageView::jobs_beginShimmerLoading<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIImageView/UIImageView+自研骨架屏呼吸占位效果Shimmer.swift:76"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
