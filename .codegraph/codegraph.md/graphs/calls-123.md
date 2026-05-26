# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:SlideToUnlockView::setup<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:174"]
  T1["method:SlideToUnlockView::updateSkeletonState<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:235"]
  S1 -->|calls| T1
  S2["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:186"]
  T2["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:186"]
  S2 -->|calls| T2
  S3["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:186"]
  T3["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:209"]
  S3 -->|calls| T3
  S4["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:186"]
  T4["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:244"]
  S4 -->|calls| T4
  S5["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:209"]
  T5["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:244"]
  S5 -->|calls| T5
  S6["method:SlideToUnlockView::updateSkeletonState<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:235"]
  T6["method:SlideToUnlockView::updateShimmerMask<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:244"]
  S6 -->|calls| T6
  S7["method:SlideToUnlockView::completeUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:290"]
  T7["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:209"]
  S7 -->|calls| T7
  S8["method:SlideToUnlockView::completeUnlock<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:290"]
  T8["method:SlideToUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:299"]
  S8 -->|calls| T8
  S9["method:SlideToUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:299"]
  T9["method:SlideToUnlockView::updateLayoutForProgress<br/>JobsByPods/JobsGestureUnlock@Pods/Apple滑动开锁🔒.swift:209"]
  S9 -->|calls| T9
  S10["class:GestureNodeView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:11"]
  T10["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S10 -->|calls| T10
  S11["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:45"]
  T11["method:GestureNodeView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:45"]
  S11 -->|calls| T11
  S12["class:GestureUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:16"]
  T12["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  S12 -->|calls| T12
  S13["class:GestureUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:16"]
  T13["method:GestureUnlockView::commonInit<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:52"]
  S13 -->|calls| T13
  S14["class:GestureUnlockView<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:16"]
  T14["method:GestureUnlockView::commonInit<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:52"]
  S14 -->|calls| T14
  S15["method:GestureUnlockView::commonInit<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:52"]
  T15["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  S15 -->|calls| T15
  S16["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  T16["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  S16 -->|calls| T16
  S17["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  T17["method:GestureUnlockView::layoutNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:111"]
  S17 -->|calls| T17
  S18["method:GestureUnlockView::layoutSubviews<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:64"]
  T18["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S18 -->|calls| T18
  S19["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  T19["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S19 -->|calls| T19
  S20["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  T20["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S20 -->|calls| T20
  S21["method:GestureUnlockView::reset<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:72"]
  T21["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S21 -->|calls| T21
  S22["method:GestureUnlockView::showError<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:85"]
  T22["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S22 -->|calls| T22
  S23["method:GestureUnlockView::showSelected<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:89"]
  T23["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S23 -->|calls| T23
  S24["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  T24["method:JobsTaskExecutionSequence::forEach<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:115"]
  S24 -->|calls| T24
  S25["method:GestureUnlockView::rebuildNodes<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:95"]
  T25["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
