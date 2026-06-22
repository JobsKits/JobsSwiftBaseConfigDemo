# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBasicImageDownloaderContextTests::testContextSessionCanceled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:63"]
  T1["method:ASBasicImageDownloaderContextTests::randomURL<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:24"]
  S1 -->|calls| T1
  S2["method:ASBasicImageDownloaderContextTests::testContextSessionCanceled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:63"]
  T2["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S2 -->|calls| T2
  S3["method:ASBasicImageDownloaderContextTests::testContextSessionCanceled<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderContextTests.mm:63"]
  T3["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S3 -->|calls| T3
  S4["method:ASBasicImageDownloaderTests::testAsynchronouslyDownloadTheSameURLTwice<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBasicImageDownloaderTests.mm:20"]
  T4["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  S4 -->|calls| T4
  S5["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T6["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S6 -->|calls| T6
  S7["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T7["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S7 -->|calls| T7
  S8["method:ASBatchFetchingTests::testBatchNullState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:31"]
  T8["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S8 -->|calls| T8
  S9["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T10["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S10 -->|calls| T10
  S11["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T11["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S11 -->|calls| T11
  S12["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T12["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S12 -->|calls| T12
  S13["method:ASBatchFetchingTests::testBatchAlreadyFetching<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:45"]
  T13["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S13 -->|calls| T13
  S14["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T15["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S15 -->|calls| T15
  S16["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T16["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S16 -->|calls| T16
  S17["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T17["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S17 -->|calls| T17
  S18["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T18["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S18 -->|calls| T18
  S19["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T19["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S19 -->|calls| T19
  S20["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T20["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S20 -->|calls| T20
  S21["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T21["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S21 -->|calls| T21
  S22["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T22["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S22 -->|calls| T22
  S23["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T23["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S23 -->|calls| T23
  S24["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T24["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S24 -->|calls| T24
  S25["method:ASBatchFetchingTests::testUnsupportedScrollDirections<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:60"]
  T25["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
