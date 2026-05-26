# `calls 符号关系 - 144`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T1["method:UIButton::byUpdateConfig<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+DSL.swift:854"]
  S1 -->|calls| T1
  S2["method:JobsMarqueeView::cloneButton<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:558"]
  T2["method:UIButton::addAction<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIButton/UIButton+点按事件.swift:170"]
  S2 -->|calls| T2
  S3["method:JobsMarqueeView::scrollViewWillBeginDragging<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:701"]
  T3["method:JobsMarqueeView::pause<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:341"]
  S3 -->|calls| T3
  S4["method:JobsMarqueeView::scrollViewDidScroll<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:710"]
  T4["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  S4 -->|calls| T4
  S5["method:JobsMarqueeView::scrollViewDidEndDragging<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:717"]
  T5["method:JobsMarqueeView::finishUserInteraction<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:730"]
  S5 -->|calls| T5
  S6["method:JobsMarqueeView::scrollViewDidEndDecelerating<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:725"]
  T6["method:JobsMarqueeView::finishUserInteraction<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:730"]
  S6 -->|calls| T6
  S7["method:JobsMarqueeView::finishUserInteraction<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:730"]
  T7["method:JobsMarqueeView::snapToNearestPageIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:297"]
  S7 -->|calls| T7
  S8["method:JobsMarqueeView::finishUserInteraction<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:730"]
  T8["method:JobsMarqueeView::ensureAutoScrollRunning<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:352"]
  S8 -->|calls| T8
  S9["method:JobsMarqueeView::installDefaultPageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:777"]
  T9["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  S9 -->|calls| T9
  S10["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T10["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S10 -->|calls| T10
  S11["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T11["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S11 -->|calls| T11
  S12["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T12["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S12 -->|calls| T12
  S13["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T13["method:Plan::offset<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:507"]
  S13 -->|calls| T13
  S14["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T14["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S14 -->|calls| T14
  S15["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T15["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S15 -->|calls| T15
  S16["method:JobsMarqueeView::updatePageControlConstraintsIfNeeded<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:781"]
  T16["enum_member:JobsTaskType::priority<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskCenterDefine.swift:285"]
  S16 -->|calls| T16
  S17["method:JobsMarqueeView::updatePageControlPages<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:813"]
  T17["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:88"]
  S17 -->|calls| T17
  S18["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  T18["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:88"]
  S18 -->|calls| T18
  S19["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  T19["method:Decimal::round<br/>JobsByPods/JobsSwiftFoundation@Pods/Decimal.swift:57"]
  S19 -->|calls| T19
  S20["method:JobsMarqueeView::updatePageControlCurrentPage<br/>JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.swift:822"]
  T20["method:UIPageControl::jobs_applyIndicatorImagesIfNeeded<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIPageControl/UIPageControl+网络背景图.swift:88"]
  S20 -->|calls| T20
  S21["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T21["method:JobsNavBar::_jobsMakeTitleAttr<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:145"]
  S21 -->|calls| T21
  S22["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T22["method:JobsNavBar::rebuildBackButton<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:218"]
  S22 -->|calls| T22
  S23["method:JobsNavBar::showLoadingTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:42"]
  T23["method:JobsNavBar::_jobsMakeTitleAttr<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:145"]
  S23 -->|calls| T23
  S24["method:JobsNavBar::showLoadingTitle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:42"]
  T24["method:UILabel::byAttributedString<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UILabel/UILabel+DSL.swift:85"]
  S24 -->|calls| T24
  S25["class:JobsNavBar<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:20"]
  T25["method:JobsNavBar::applyStyle<br/>JobsByPods/JobsNavBar@Pods/JobsNavBar.swift:185"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
