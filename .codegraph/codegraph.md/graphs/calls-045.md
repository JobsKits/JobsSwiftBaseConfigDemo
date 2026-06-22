# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T1["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T3["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T4["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T5["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  T6["function:ASLockSequence<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASLocking.h:103"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  T7["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T8["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S8 -->|calls| T8
  S9["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T10["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S10 -->|calls| T10
  S11["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T11["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S11 -->|calls| T11
  S12["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T12["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S12 -->|calls| T12
  S13["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T13["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S13 -->|calls| T13
  S14["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T14["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S14 -->|calls| T14
  S15["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T15["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S15 -->|calls| T15
  S16["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T16["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S16 -->|calls| T16
  S17["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T17["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T18["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T19["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T20["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T21["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T22["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T23["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T24["function:ASScreenScale<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T25["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
