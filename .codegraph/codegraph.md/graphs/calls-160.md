# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  T1["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S1 -->|calls| T1
  S2["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  T2["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  S2 -->|calls| T2
  S3["method:ModifiedContent::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:44"]
  T3["method:Modifier::modify<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:72"]
  S3 -->|calls| T3
  S4["method:Optional::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:150"]
  T4["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  S4 -->|calls| T4
  S5["class:LayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:158"]
  T5["method:Optional::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:150"]
  S5 -->|calls| T5
  S6["class:AnyLayoutSpec<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:170"]
  T6["method:Optional::tss_make<br/>JobsByPods/ManualBySwiftPods@Pods/TextureSwiftSupport/Sources/LayoutSpecBuilders/SpecBuilder.swift:150"]
  S6 -->|calls| T6
  S7["method:ASListKitTestAdapterDataSource::listAdapter:sectionControllerForObject:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTestAdapterDataSource.m:18"]
  T7["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S7 -->|calls| T7
  S8["function:setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m:29"]
  T8["function:setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m:29"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListKitTests.m:1"]
  T9["method:ASCollectionModernDataSourceTests::tearDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:73"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h:1"]
  T10["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h:1"]
  T11["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["method:ASListTestObject::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.m:12"]
  T12["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S12 -->|calls| T12
  S13["method:ASListTestObject::copyWithZone:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.m:21"]
  T13["method:ASListTestObject::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.m:12"]
  S13 -->|calls| T13
  S14["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  T14["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S14 -->|calls| T14
  S15["method:ASListTestSection::nodeBlockForItemAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:50"]
  T15["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S15 -->|calls| T15
  S16["method:ASListTestSupplementarySource::nodeBlockForSupplementaryElementOfKind:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSupplementarySource.m:23"]
  T16["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S16 -->|calls| T16
  S17["method:ASAbsoluteLayoutSpecSnapshotTests::testSizingBehaviour<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:20"]
  T17["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  S17 -->|calls| T17
  S18["method:ASAbsoluteLayoutSpecSnapshotTests::testSizingBehaviour<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:20"]
  T18["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  S18 -->|calls| T18
  S19["method:ASAbsoluteLayoutSpecSnapshotTests::testSizingBehaviour<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:20"]
  T19["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  S19 -->|calls| T19
  S20["method:ASAbsoluteLayoutSpecSnapshotTests::testChildrenMeasuredWithAutoMaxSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:31"]
  T20["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S20 -->|calls| T20
  S21["method:ASAbsoluteLayoutSpecSnapshotTests::testChildrenMeasuredWithAutoMaxSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:31"]
  T21["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S21 -->|calls| T21
  S22["method:ASAbsoluteLayoutSpecSnapshotTests::testChildrenMeasuredWithAutoMaxSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:31"]
  T22["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  S22 -->|calls| T22
  S23["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  T23["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S23 -->|calls| T23
  S24["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  T24["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S24 -->|calls| T24
  S25["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  T25["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
