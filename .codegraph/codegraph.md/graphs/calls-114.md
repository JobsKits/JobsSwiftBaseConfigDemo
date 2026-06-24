# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASStackLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:127"]
  T1["function:ASLayoutLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S1 -->|calls| T1
  S2["method:ASStackLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:127"]
  T2["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S2 -->|calls| T2
  S3["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  T3["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S3 -->|calls| T3
  S4["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  T4["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S4 -->|calls| T4
  S5["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  T5["function:alignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:58"]
  S5 -->|calls| T5
  S6["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  T6["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S6 -->|calls| T6
  S7["method:ASStackLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:181"]
  T7["method:ASStackLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:181"]
  S7 -->|calls| T7
  S8["method:ASStackLayoutSpec::asciiArtString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:211"]
  T8["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  T9["function:init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::yogaSpacerNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:23"]
  T10["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::yogaVerticalStack<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:30"]
  T11["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::yogaHorizontalStack<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:37"]
  T12["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S12 -->|calls| T12
  S13["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T13["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S13 -->|calls| T13
  S14["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T14["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S14 -->|calls| T14
  S15["function:yogaDimensionToPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  T15["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S15 -->|calls| T15
  S16["function:yogaDimensionToPercent<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:132"]
  T16["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S16 -->|calls| T16
  S17["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  T17["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S17 -->|calls| T17
  S18["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T18["function:cgFloatForYogaFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S18 -->|calls| T18
  S19["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T19["function:cgFloatForYogaFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S19 -->|calls| T19
  S20["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T20["function:yogaDimensionToPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S20 -->|calls| T20
  S21["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T21["function:yogaDimensionToPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S21 -->|calls| T21
  S22["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T22["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S22 -->|calls| T22
  S23["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T23["method:ASCollectionView::canBatchFetch<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionView.mm:1829"]
  S23 -->|calls| T23
  S24["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T24["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S24 -->|calls| T24
  S25["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T25["method:ASBatchContext::isFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
