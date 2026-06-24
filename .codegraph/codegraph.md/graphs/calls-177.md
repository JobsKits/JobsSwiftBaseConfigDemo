# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASControlNodeTests::testActionsAreCalledInTheSameOrderAsTheyWereAdded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:206"]
  T1["method:ASActionController::secondAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:31"]
  S1 -->|calls| T1
  S2["method:ASControlNodeTests::testActionsAreCalledInTheSameOrderAsTheyWereAdded<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:206"]
  T2["method:ASActionController::thirdAction<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASControlNodeTests.mm:32"]
  S2 -->|calls| T2
  S3["method:ASCornerLayoutSpecSnapshotTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:38"]
  T3["method:ASCornerLayoutSpecSnapshotTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:38"]
  S3 -->|calls| T3
  S4["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T4["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S4 -->|calls| T4
  S5["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T5["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S5 -->|calls| T5
  S6["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T6["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S6 -->|calls| T6
  S7["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T7["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S7 -->|calls| T7
  S8["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T8["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S8 -->|calls| T8
  S9["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T9["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S9 -->|calls| T9
  S10["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T10["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S10 -->|calls| T10
  S11["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocations<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:56"]
  T11["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S11 -->|calls| T11
  S12["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T12["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S12 -->|calls| T12
  S13["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T13["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S13 -->|calls| T13
  S14["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T14["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S14 -->|calls| T14
  S15["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T15["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S15 -->|calls| T15
  S16["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T16["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S16 -->|calls| T16
  S17["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T17["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S17 -->|calls| T17
  S18["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T18["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S18 -->|calls| T18
  S19["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithInnerOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:73"]
  T19["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S19 -->|calls| T19
  S20["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T20["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S20 -->|calls| T20
  S21["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T21["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S21 -->|calls| T21
  S22["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T22["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S22 -->|calls| T22
  S23["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T23["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S23 -->|calls| T23
  S24["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T24["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S24 -->|calls| T24
  S25["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecForAllLocationsWithOuterOffset<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:90"]
  T25["method:ASCornerLayoutSpecSnapshotTests::testCornerSpecWithLocation:offsetOption:wrapsCorner:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCornerLayoutSpecSnapshotTests.mm:107"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
