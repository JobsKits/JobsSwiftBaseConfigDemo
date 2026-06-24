# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  T1["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S1 -->|calls| T1
  S2["method:ASAbsoluteLayoutSpecSnapshotTests::testWithChildren:sizeRange:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASAbsoluteLayoutSpecSnapshotTests.mm:54"]
  T2["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S2 -->|calls| T2
  S3["method:ASBackgroundLayoutSpecSnapshotTests::testBackground<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBackgroundLayoutSpecSnapshotTests.mm:23"]
  T3["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S3 -->|calls| T3
  S4["method:ASBackgroundLayoutSpecSnapshotTests::testBackground<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBackgroundLayoutSpecSnapshotTests.mm:23"]
  T4["function:ASDisplayNodeWithBackgroundColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.h:31"]
  S4 -->|calls| T4
  S5["method:ASBackgroundLayoutSpecSnapshotTests::testBackground<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBackgroundLayoutSpecSnapshotTests.mm:23"]
  T5["method:ASLayoutSpecSnapshotTestCase::testLayoutSpec:sizeRange:subnodes:identifier:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASLayoutSpecSnapshotTestsHelper.mm:29"]
  S5 -->|calls| T5
  S6["method:ASBasicImageDownloaderContextTests::testContextCreation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:30"]
  T6["method:ASBasicImageDownloaderContextTests::randomURL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:24"]
  S6 -->|calls| T6
  S7["method:ASBasicImageDownloaderContextTests::testContextInvalidation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:38"]
  T7["method:ASBasicImageDownloaderContextTests::randomURL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:24"]
  S7 -->|calls| T7
  S8["method:ASBasicImageDownloaderContextTests::testContextInvalidation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:38"]
  T8["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S8 -->|calls| T8
  S9["method:ASBasicImageDownloaderContextTests::testContextInvalidation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:38"]
  T9["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S9 -->|calls| T9
  S10["method:ASBasicImageDownloaderContextTests::testContextSessionCanceled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:63"]
  T10["method:ASBasicImageDownloaderContextTests::randomURL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:24"]
  S10 -->|calls| T10
  S11["method:ASBasicImageDownloaderContextTests::testContextSessionCanceled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:63"]
  T11["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S11 -->|calls| T11
  S12["method:ASBasicImageDownloaderContextTests::testContextSessionCanceled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:63"]
  T12["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S12 -->|calls| T12
  S13["method:ASBasicImageDownloaderTests::testAsynchronouslyDownloadTheSameURLTwice<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderTests.mm:20"]
  T13["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  S13 -->|calls| T13
  S14["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T15["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S15 -->|calls| T15
  S16["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T16["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S16 -->|calls| T16
  S17["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T17["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S17 -->|calls| T17
  S18["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T19["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S19 -->|calls| T19
  S20["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T20["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S20 -->|calls| T20
  S21["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T21["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S21 -->|calls| T21
  S22["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T22["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S22 -->|calls| T22
  S23["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T24["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S24 -->|calls| T24
  S25["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T25["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
