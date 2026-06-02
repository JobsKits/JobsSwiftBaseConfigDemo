# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:GestureUnlockView::touchesBegan<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:135"]
  T1["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S1 -->|calls| T1
  S2["method:GestureUnlockView::touchesMoved<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:146"]
  T2["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  S2 -->|calls| T2
  S3["method:GestureUnlockView::touchesMoved<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:146"]
  T3["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S3 -->|calls| T3
  S4["method:GestureUnlockView::touchesEnded<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:153"]
  T4["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S4 -->|calls| T4
  S5["method:GestureUnlockView::touchesCancelled<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:163"]
  T5["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S5 -->|calls| T5
  S6["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  T6["method:GestureUnlockView::hitNodeIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:175"]
  S6 -->|calls| T6
  S7["method:GestureUnlockView::trySelectNode<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:170"]
  T7["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:186"]
  S7 -->|calls| T7
  S8["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:186"]
  T8["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S8 -->|calls| T8
  S9["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:186"]
  T9["method:GestureUnlockView::interpolatedIndices<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:215"]
  S9 -->|calls| T9
  S10["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:186"]
  T10["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S10 -->|calls| T10
  S11["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:186"]
  T11["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:199"]
  S11 -->|calls| T11
  S12["method:GestureUnlockView::appendNodeIndexWithInterpolation<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:186"]
  T12["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:199"]
  S12 -->|calls| T12
  S13["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:199"]
  T13["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S13 -->|calls| T13
  S14["method:GestureUnlockView::selectIndex<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:199"]
  T14["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  S14 -->|calls| T14
  S15["method:GestureUnlockView::interpolatedIndices<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:215"]
  T15["method:GestureUnlockView::gcd<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:240"]
  S15 -->|calls| T15
  S16["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  T16["method:JobsTaskExecutionSequence::dropFirst<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTaskExecutionSequence.swift:91"]
  S16 -->|calls| T16
  S17["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  T17["method:GestureUnlockView::updateLinePath<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:252"]
  S17 -->|calls| T17
  S18["method:GestureUnlockView::setVisualState<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureUnlockView.swift:278"]
  T18["method:GestureNodeView::apply<br/>JobsByPods/JobsGestureUnlock@Pods/高仿Android手势开锁🔒/GestureNodeView.swift:54"]
  S18 -->|calls| T18
  S19["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  T19["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:36"]
  S19 -->|calls| T19
  S20["function:jobsGetMainWindow<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:17"]
  T20["function:jobsGetMainWindowAfter13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:53"]
  S20 -->|calls| T20
  S21["function:jobsGetMainWindowBefore13<br/>JobsByPods/JobsGetWindow@Pods/Inlines.swift:36"]
  T21["method:AlamofireClient::perform<br/>JobsByPods/JobsNetworking@Pods/Agent/HTTPClient.swift:76"]
  S21 -->|calls| T21
  S22["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  T22["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S22 -->|calls| T22
  S23["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:33"]
  T23["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  S23 -->|calls| T23
  S24["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:42"]
  T24["method:UIApplication::bestWindowScene<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:137"]
  S24 -->|calls| T24
  S25["method:UIApplication::jobsKeyWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:42"]
  T25["method:UIApplication::bestWindow<br/>JobsByPods/JobsGetWindow@Pods/UIApplication.swift:151"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
