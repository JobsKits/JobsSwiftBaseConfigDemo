# `calls 符号关系 - 162`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBatchFetchingTests::testVerticalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:92"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASBatchFetchingTests::testVerticalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:92"]
  T2["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S2 -->|calls| T2
  S3["method:ASBatchFetchingTests::testVerticalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:92"]
  T3["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S3 -->|calls| T3
  S4["method:ASBatchFetchingTests::testVerticalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:92"]
  T4["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S4 -->|calls| T4
  S5["method:ASBatchFetchingTests::testVerticalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:108"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASBatchFetchingTests::testVerticalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:108"]
  T6["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S6 -->|calls| T6
  S7["method:ASBatchFetchingTests::testVerticalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:108"]
  T7["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S7 -->|calls| T7
  S8["method:ASBatchFetchingTests::testVerticalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:108"]
  T8["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S8 -->|calls| T8
  S9["method:ASBatchFetchingTests::testVerticalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:124"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASBatchFetchingTests::testVerticalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:124"]
  T10["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S10 -->|calls| T10
  S11["method:ASBatchFetchingTests::testVerticalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:124"]
  T11["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S11 -->|calls| T11
  S12["method:ASBatchFetchingTests::testVerticalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:124"]
  T12["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S12 -->|calls| T12
  S13["method:ASBatchFetchingTests::testHorizontalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:140"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASBatchFetchingTests::testHorizontalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:140"]
  T14["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S14 -->|calls| T14
  S15["method:ASBatchFetchingTests::testHorizontalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:140"]
  T15["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S15 -->|calls| T15
  S16["method:ASBatchFetchingTests::testHorizontalScrollToExactLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:140"]
  T16["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S16 -->|calls| T16
  S17["method:ASBatchFetchingTests::testHorizontalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:156"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASBatchFetchingTests::testHorizontalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:156"]
  T18["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S18 -->|calls| T18
  S19["method:ASBatchFetchingTests::testHorizontalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:156"]
  T19["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S19 -->|calls| T19
  S20["method:ASBatchFetchingTests::testHorizontalScrollToLessThanLeading<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:156"]
  T20["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S20 -->|calls| T20
  S21["method:ASBatchFetchingTests::testHorizontalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:172"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASBatchFetchingTests::testHorizontalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:172"]
  T22["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S22 -->|calls| T22
  S23["method:ASBatchFetchingTests::testHorizontalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:172"]
  T23["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S23 -->|calls| T23
  S24["method:ASBatchFetchingTests::testHorizontalScrollingPastContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:172"]
  T24["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S24 -->|calls| T24
  S25["method:ASBatchFetchingTests::testVerticalScrollingSmallContentSize<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASBatchFetchingTests.mm:189"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
