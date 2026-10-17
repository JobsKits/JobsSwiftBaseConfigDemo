# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:100"]
  T1["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:232"]
  S1 -->|calls| T1
  S2["method:UIPageControl::jobs_setIndicatorImageURLs<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:100"]
  T2["method:UIPageControl::jobs_setIndicatorImages<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:38"]
  S2 -->|calls| T2
  S3["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:141"]
  T3["method:UIView::byUserInteractionEnabled<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:223"]
  S3 -->|calls| T3
  S4["method:UIPageControl::jobs_ensureOverlay<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:141"]
  T4["method:UIStackView::byAxis<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:17"]
  S4 -->|calls| T4
  S5["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:180"]
  T5["method:UIStackView::bySpacing<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIStackView.swift:35"]
  S5 -->|calls| T5
  S6["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:180"]
  T6["method:UIView::byRemakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:112"]
  S6 -->|calls| T6
  S7["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:180"]
  T7["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S7 -->|calls| T7
  S8["method:UIPageControl::jobs_renderOverlayDots<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:180"]
  T8["field:JobsBluetoothCommand::priority<br/>JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothCommand/JobsBluetoothCommand.swift:16"]
  S8 -->|calls| T8
  S9["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:232"]
  T9["method:ASButtonNode::imageForState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:390"]
  S9 -->|calls| T9
  S10["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:232"]
  T10["method:UIBezierPath::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBezierPath/UIBezierPath.swift:27"]
  S10 -->|calls| T10
  S11["method:UIPageControl::jobs_circleDotImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:232"]
  T11["method:UIImage::draw<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S11 -->|calls| T11
  S12["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:242"]
  T12["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S12 -->|calls| T12
  S13["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:242"]
  T13["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S13 -->|calls| T13
  S14["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:242"]
  T14["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S14 -->|calls| T14
  S15["method:UIPageControl::jobs_loadImage<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:242"]
  T15["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S15 -->|calls| T15
  S16["method:UIScrollView::pullDown<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:25"]
  T16["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:503"]
  S16 -->|calls| T16
  S17["method:UIScrollView::pullDownWithJobsAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:41"]
  T17["method:UIView::byAddSubviewRetSub<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:503"]
  S17 -->|calls| T17
  S18["method:UIScrollView::pullDownAutoIfExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:57"]
  T18["method:JobsRefreshCache::isExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:449"]
  S18 -->|calls| T18
  S19["method:UIScrollView::pullDownAutoIfExpired<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:57"]
  T19["function:onMainSync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:336"]
  S19 -->|calls| T19
  S20["method:UIScrollView::pullDownStop<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:67"]
  T20["method:JobsRefreshCache::setDate<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:429"]
  S20 -->|calls| T20
  S21["method:UIScrollView::pullDownStart<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:77"]
  T21["function:onMainAsync<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseMain.swift:124"]
  S21 -->|calls| T21
  S22["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T22["method:UIView::byBackgroundColor<br/>JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:733"]
  S22 -->|calls| T22
  S23["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T23["method:UILabel::byFont<br/>JobsByPods/JobsProgressBar@Pods/JobsProgressBarByUIKit.swift:81"]
  S23 -->|calls| T23
  S24["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T24["method:JobsFont::systemFont<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseFont.swift:16"]
  S24 -->|calls| T24
  S25["class:JobsHeaderAnimator<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:156"]
  T25["field:RTBadgeConfig::offset<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+右上角角标.swift:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
