# `calls 符号关系 - 145`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  T1["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S1 -->|calls| T1
  S2["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  T2["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S2 -->|calls| T2
  S3["function:computeStackViolation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  T3["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S3 -->|calls| T3
  S4["function:computeStackViolation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  T4["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S4 -->|calls| T4
  S5["function:useOptimizedFlexing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  T5["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S5 -->|calls| T5
  S6["function:useOptimizedFlexing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  T6["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S6 -->|calls| T6
  S7["function:useOptimizedFlexing<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  T7["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S7 -->|calls| T7
  S8["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T8["function:computeStackViolation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  S8 -->|calls| T8
  S9["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T9["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  S9 -->|calls| T9
  S10["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T10["variable:CGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:39"]
  S10 -->|calls| T10
  S11["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T11["function:flexFactorInViolationDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:342"]
  S11 -->|calls| T11
  S12["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T13["function:layoutFlexibleChildrenAtZeroSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:434"]
  S13 -->|calls| T13
  S14["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T14["variable:CGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.h:39"]
  S14 -->|calls| T14
  S15["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T15["function:flexAdjustmentInViolationDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:413"]
  S15 -->|calls| T15
  S16["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T17["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S17 -->|calls| T17
  S18["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T18["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S18 -->|calls| T18
  S19["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T19["function:crossChildLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S19 -->|calls| T19
  S20["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T20["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S20 -->|calls| T20
  S21["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T21["function:crossDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S21 -->|calls| T21
  S22["function:collectChildrenIntoLines<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T22["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S22 -->|calls| T22
  S23["function:collectChildrenIntoLines<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T23["function:stackDimension<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S23 -->|calls| T23
  S24["function:collectChildrenIntoLines<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T24["function:computeStackViolation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  S24 -->|calls| T24
  S25["function:collectChildrenIntoLines<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T25["method:ASTextDebugOption::clear<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:103"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
