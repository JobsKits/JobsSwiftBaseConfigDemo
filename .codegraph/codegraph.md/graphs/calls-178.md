# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T1["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S1 -->|calls| T1
  S2["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T2["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S2 -->|calls| T2
  S3["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  T3["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S3 -->|calls| T3
  S4["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  T4["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S4 -->|calls| T4
  S5["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  T5["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S5 -->|calls| T5
  S6["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  T6["method:ASCornerLayoutSpecSnapshotTests::offsetForOption:location:delta:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:135"]
  S6 -->|calls| T6
  S7["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  T7["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S7 -->|calls| T7
  S8["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  T8["method:ASCornerLayoutSpecSnapshotTests::suffixWithLocation:option:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:169"]
  S8 -->|calls| T8
  S9["method:ASCornerLayoutSpecSnapshotTests::suffixWithLocation:option:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:169"]
  T9["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S9 -->|calls| T9
  S10["method:ASDKViewControllerTests::testThatAutomaticSubnodeManagementScrollViewInsetsAreApplied<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDKViewControllerTests.mm:24"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDKViewControllerTests::testThatAutomaticSubnodeManagementScrollViewInsetsAreApplied<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDKViewControllerTests.mm:24"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDKViewControllerTests::testThatViewControllerFrameIsRightAfterCustomTransitionWithNonextendedEdges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDKViewControllerTests.mm:44"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDKViewControllerTests::testThatViewControllerFrameIsRightAfterCustomTransitionWithNonextendedEdges<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDKViewControllerTests.mm:44"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDimensionTests::testCreatingDimensionUnitAutos<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:21"]
  T14["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S14 -->|calls| T14
  S15["method:ASDimensionTests::testCreatingDimensionUnitAutos<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:21"]
  T15["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S15 -->|calls| T15
  S16["method:ASDimensionTests::testCreatingDimensionUnitAutos<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:21"]
  T16["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S16 -->|calls| T16
  S17["method:ASDimensionTests::testCreatingDimensionUnitAutos<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:21"]
  T17["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S17 -->|calls| T17
  S18["method:ASDimensionTests::testCreatingDimensionUnitAutos<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:21"]
  T18["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S18 -->|calls| T18
  S19["method:ASDimensionTests::testCreatingDimensionUnitFraction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:29"]
  T19["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S19 -->|calls| T19
  S20["method:ASDimensionTests::testCreatingDimensionUnitFraction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:29"]
  T20["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S20 -->|calls| T20
  S21["method:ASDimensionTests::testCreatingDimensionUnitFraction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:29"]
  T21["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S21 -->|calls| T21
  S22["method:ASDimensionTests::testCreatingDimensionUnitPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:35"]
  T22["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S22 -->|calls| T22
  S23["method:ASDimensionTests::testCreatingDimensionUnitPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:35"]
  T23["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S23 -->|calls| T23
  S24["method:ASDimensionTests::testCreatingDimensionUnitPoints<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:35"]
  T24["function:ASDimensionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S24 -->|calls| T24
  S25["method:ASDimensionTests::testIntersectingOverlappingSizeRangesReturnsTheirIntersection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDimensionTests.mm:41"]
  T25["function:ASSizeRangeIntersect<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
