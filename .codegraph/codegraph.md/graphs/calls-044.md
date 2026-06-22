# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::insertYogaChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:99"]
  T1["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  T2["method:ASButtonNode::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  T3["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::setYogaLayoutInProgress:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:177"]
  T4["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  T5["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  T6["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T7["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T8["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T9["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T10["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T11["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  T12["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  T13["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  T14["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::invalidateCalculatedYogaLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:302"]
  T15["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T16["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T17["function:NSStringFromASSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T18["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T19["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T20["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T21["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T22["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T23["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T24["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T25["function:yogaFloatForCGFloat<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
