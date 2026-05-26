# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::lottieReplace<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Lottie.swift:132"]
  T1["method:VideoPlayer::playToView:<br/>TODO/Unity/xcode_effectTest/Classes/Unity/VideoPlayer.mm:201"]
  S1 -->|calls| T1
  S2["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T2["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S2 -->|calls| T2
  S3["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T3["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S3 -->|calls| T3
  S4["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T4["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S4 -->|calls| T4
  S5["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T5["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  S5 -->|calls| T5
  S6["class:Reactive<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Rx.swift:21"]
  T6["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S6 -->|calls| T6
  S7["method:UIView::byAdd<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:45"]
  T7["method:UIView::byAddConstraintsClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:38"]
  S7 -->|calls| T7
  S8["method:UIView::byMakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:104"]
  T8["method:UIView::byAddConstraintsClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:38"]
  S8 -->|calls| T8
  S9["method:UIView::byRemakeConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:111"]
  T9["method:UIView::byAddConstraintsClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:38"]
  S9 -->|calls| T9
  S10["method:UIView::byUpdateConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:118"]
  T10["method:UIView::byAddConstraintsClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:38"]
  S10 -->|calls| T10
  S11["method:UIView::byRemoveConstraints<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:125"]
  T11["method:UIView::byAddConstraintsClosure<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:38"]
  S11 -->|calls| T11
  S12["method:Array::addTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:290"]
  T12["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S12 -->|calls| T12
  S13["method:Array::snapDistribute<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:297"]
  T13["method:UIView::snap_distribute<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:177"]
  S13 -->|calls| T13
  S14["method:Array::addDistributeTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:303"]
  T14["method:Array::addTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:290"]
  S14 -->|calls| T14
  S15["method:Array::addDistributeTo<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:303"]
  T15["method:Array::snapDistribute<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SnapKit.swift:297"]
  S15 -->|calls| T15
  S16["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  T16["method:UIView::_firstSubview<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:22"]
  S16 -->|calls| T16
  S17["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  T17["method:UIView::_recursiveSubviews<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+Subview.swift:28"]
  S17 -->|calls| T17
  S18["method:UIView::height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:40"]
  T18["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIApplication.swift:33"]
  S18 -->|calls| T18
  S19["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T19["method:JobsTaskExecutionSequence::map<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:85"]
  S19 -->|calls| T19
  S20["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T20["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S20 -->|calls| T20
  S21["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T21["method:UIView::height<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:40"]
  S21 -->|calls| T21
  S22["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T22["method:JobsDefaultAgent::observe<br/>JobsByPods/JobsNetworking@Pods/Agent/JobsDefaultAgent.swift:55"]
  S22 -->|calls| T22
  S23["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T23["method:JobsObservable::distinctUntilChanged<br/>JobsByPods/JobsSwiftWorker@Pods/JobsObservable+Transform.swift:32"]
  S23 -->|calls| T23
  S24["class:UIView<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+keyboard.swift:23"]
  T24["method:Plan::merge<br/>TODO/TaskCenterComponent/Schedule/Plan.swift:223"]
  S24 -->|calls| T24
  S25["method:UIView::bySize<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+修改位置大小.swift:341"]
  T25["method:JobsSkeletonPulse::make<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIView/UIView+SkeletonView.swift:126"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
