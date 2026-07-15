# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h:1"]
  T1["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.h:1"]
  T2["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["method:ASListTestObject::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.m:12"]
  T3["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S3 -->|calls| T3
  S4["method:ASListTestObject::copyWithZone:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.m:21"]
  T4["method:ASListTestObject::initWithKey:value:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestObject.m:12"]
  S4 -->|calls| T4
  S5["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  T5["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S5 -->|calls| T5
  S6["method:ASListTestSection::nodeBlockForItemAtIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:50"]
  T6["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S6 -->|calls| T6
  S7["method:ASListTestSupplementarySource::nodeBlockForSupplementaryElementOfKind:atIndex:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSupplementarySource.m:23"]
  T7["method:ASListTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/SubspecWorkspaces/ASDKListKit/ASDKListKitTests/ASListTestSection.m:13"]
  S7 -->|calls| T7
  S8["method:ASAbsoluteLayoutSpecSnapshotTests::testSizingBehaviour<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:20"]
  T8["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  S8 -->|calls| T8
  S9["method:ASAbsoluteLayoutSpecSnapshotTests::testSizingBehaviour<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:20"]
  T9["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  S9 -->|calls| T9
  S10["method:ASAbsoluteLayoutSpecSnapshotTests::testSizingBehaviour<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:20"]
  T10["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  S10 -->|calls| T10
  S11["method:ASAbsoluteLayoutSpecSnapshotTests::testChildrenMeasuredWithAutoMaxSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:31"]
  T11["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S11 -->|calls| T11
  S12["method:ASAbsoluteLayoutSpecSnapshotTests::testChildrenMeasuredWithAutoMaxSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:31"]
  T12["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S12 -->|calls| T12
  S13["method:ASAbsoluteLayoutSpecSnapshotTests::testChildrenMeasuredWithAutoMaxSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:31"]
  T13["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  S13 -->|calls| T13
  S14["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  T14["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S14 -->|calls| T14
  S15["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  T15["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S15 -->|calls| T15
  S16["method:ASAbsoluteLayoutSpecSnapshotTests::testWithSizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:43"]
  T16["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  S16 -->|calls| T16
  S17["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  T17["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S17 -->|calls| T17
  S18["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  T18["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S18 -->|calls| T18
  S19["method:ASBackgroundLayoutSpecSnapshotTests::testBackground<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBackgroundLayoutSpecSnapshotTests.mm:23"]
  T19["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S19 -->|calls| T19
  S20["method:ASBackgroundLayoutSpecSnapshotTests::testBackground<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBackgroundLayoutSpecSnapshotTests.mm:23"]
  T20["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S20 -->|calls| T20
  S21["method:ASBackgroundLayoutSpecSnapshotTests::testBackground<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBackgroundLayoutSpecSnapshotTests.mm:23"]
  T21["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S21 -->|calls| T21
  S22["method:ASBasicImageDownloaderContextTests::testContextCreation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:30"]
  T22["method:ASBasicImageDownloaderContextTests::randomURL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:24"]
  S22 -->|calls| T22
  S23["method:ASBasicImageDownloaderContextTests::testContextInvalidation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:38"]
  T23["method:ASBasicImageDownloaderContextTests::randomURL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:24"]
  S23 -->|calls| T23
  S24["method:ASBasicImageDownloaderContextTests::testContextInvalidation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:38"]
  T24["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S24 -->|calls| T24
  S25["method:ASBasicImageDownloaderContextTests::testContextInvalidation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:38"]
  T25["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
