# `calls 符号关系 - 077`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:241"]
  T1["method:UIButton::StateProxy::image<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:1030"]
  S1 -->|calls| T1
  S2["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:241"]
  T2["method:MetalRenderer::draw<br/>JobsByPods/JobsBy3rdTools@Pods/PNPlayer/MetalRenderer.swift:169"]
  S2 -->|calls| T2
  S3["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  T3["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S3 -->|calls| T3
  S4["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  T4["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S4 -->|calls| T4
  S5["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  T5["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S5 -->|calls| T5
  S6["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  T6["method:JobsLiveFloatPlayer::resume<br/>JobsByPods/JobsBy3rdTools@Pods/JobsLiveFloatPlayer.swift:81"]
  S6 -->|calls| T6
  S7["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:251"]
  T7["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S7 -->|calls| T7
  S8["method:UIScrollView::byContentInsetTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:538"]
  T8["method:UIScrollView::byIndicatorInsetTop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:567"]
  S8 -->|calls| T8
  S9["method:UIScrollView::byContentInsetLeft<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:545"]
  T9["method:UIScrollView::byIndicatorInsetLeft<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:580"]
  S9 -->|calls| T9
  S10["method:UIScrollView::byContentInsetBottom<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:552"]
  T10["method:UIScrollView::byIndicatorInsetBottom<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:593"]
  S10 -->|calls| T10
  S11["method:UIScrollView::byContentInsetRight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:559"]
  T11["method:UIScrollView::byIndicatorInsetRight<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+DSL.swift:606"]
  S11 -->|calls| T11
  S12["method:UIScrollView::pullDown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:24"]
  T12["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S12 -->|calls| T12
  S13["method:UIScrollView::pullDownWithJobsAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:40"]
  T13["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+DSL.swift:483"]
  S13 -->|calls| T13
  S14["method:UIScrollView::pullDownAutoIfExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:56"]
  T14["method:JobsRefreshCache::isExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:446"]
  S14 -->|calls| T14
  S15["method:UIScrollView::pullDownAutoIfExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:56"]
  T15["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S15 -->|calls| T15
  S16["method:UIScrollView::pullDownStop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:66"]
  T16["method:JobsRefreshCache::setDate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:426"]
  S16 -->|calls| T16
  S17["method:UIScrollView::pullDownStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:76"]
  T17["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S17 -->|calls| T17
  S18["method:UIScrollView::pullUpWithJobsAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:105"]
  T18["method:UIView::byAddTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:60"]
  S18 -->|calls| T18
  S19["method:UIScrollView::pullUpWithJobsAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:105"]
  T19["method:UIView::byFrame<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:113"]
  S19 -->|calls| T19
  S20["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T20["method:UIBarAppearance::byBackgroundColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46"]
  S20 -->|calls| T20
  S21["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T21["method:UILabel::byCompressionResistance<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:122"]
  S21 -->|calls| T21
  S22["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T22["method:UILabel::byHugging<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:107"]
  S22 -->|calls| T22
  S23["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T23["method:UIListContentConfiguration::byTextAlignment<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:188"]
  S23 -->|calls| T23
  S24["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T24["method:UIListContentConfiguration::byTextColor<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIListContentConfiguration.swift:178"]
  S24 -->|calls| T24
  S25["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T25["method:AttributeContainer::byFont<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIKitAttributes.swift:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
