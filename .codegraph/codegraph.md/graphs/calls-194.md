# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T1["method:ASDisplayNode::displayNodeRecursiveDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASDisplayNode.mm:3701"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T2["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T3["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T4["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T5["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T6["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T7["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T8["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testDebugDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2088"]
  T9["function:ASDisplayNodeTests::stringContainsPointer<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2084"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::checkNameInDescriptionIsLayerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2123"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::testBounds<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2146"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testDidEnterDisplayIsCalledWhenNodesEnterDisplayRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2158"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testDidExitDisplayIsCalledWhenNodesExitDisplayRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2167"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testDidEnterPreloadIsCalledWhenNodesEnterPreloadRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2177"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testDidExitPreloadIsCalledWhenNodesExitPreloadRange<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2186"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testThatNodeGetsRenderedIfItGoesFromZeroSizeToRealSizeButOnlyOnce<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2198"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenContainerEntersHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2224"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenContainerEntersHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2224"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenContainerEntersHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2224"]
  T19["function:ASHierarchyStateIncludesRasterized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:56"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenContainerEntersHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2224"]
  T20["function:ASHierarchyStateIncludesRasterized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:56"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenAddedToContainerThatIsInHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2242"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenAddedToContainerThatIsInHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2242"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenAddedToContainerThatIsInHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2242"]
  T23["function:ASHierarchyStateIncludesRasterized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:56"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testThatRasterizedNodesGetInterfaceStateUpdatesWhenAddedToContainerThatIsInHierarchy<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2242"]
  T24["function:ASHierarchyStateIncludesRasterized<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:56"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testThatRasterizingWrapperNodesIsNotAllowed<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:2260"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
