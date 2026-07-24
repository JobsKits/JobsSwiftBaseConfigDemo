# `calls 符号关系 - 181`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayLayerTests::checkSuspendResume:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:533"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["method:_ASDisplayLayerTests::checkSuspendResume:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:533"]
  T2["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S2 -->|calls| T2
  S3["method:_ASDisplayLayerTests::checkSuspendResume:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:533"]
  T3["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  S3 -->|calls| T3
  S4["method:_ASDisplayLayerTests::checkSuspendResume:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:533"]
  T4["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S4 -->|calls| T4
  S5["method:_ASDisplayLayerTests::checkSuspendResume:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:533"]
  T5["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S5 -->|calls| T5
  S6["method:_ASDisplayLayerTests::checkSuspendResume:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:533"]
  T6["method:_ASDisplayLayerTests::waitForLayer:asyncDisplayCount:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:269"]
  S6 -->|calls| T6
  S7["method:_ASDisplayLayerTests::testSetPosition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:598"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:_ASDisplayLayerTests::testSetPosition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:598"]
  T8["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S8 -->|calls| T8
  S9["method:_ASDisplayLayerTests::testSetPosition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:598"]
  T9["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S9 -->|calls| T9
  S10["method:_ASDisplayLayerTests::testSetPosition<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:598"]
  T10["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S10 -->|calls| T10
  S11["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T12["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S12 -->|calls| T12
  S13["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T13["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S13 -->|calls| T13
  S14["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T14["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S14 -->|calls| T14
  S15["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T15["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S15 -->|calls| T15
  S16["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T16["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S16 -->|calls| T16
  S17["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T17["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S17 -->|calls| T17
  S18["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T18["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S18 -->|calls| T18
  S19["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T19["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S19 -->|calls| T19
  S20["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T20["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S20 -->|calls| T20
  S21["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T21["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S21 -->|calls| T21
  S22["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T22["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S22 -->|calls| T22
  S23["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T23["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S23 -->|calls| T23
  S24["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T24["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S24 -->|calls| T24
  S25["method:_ASDisplayLayerTests::testSetTransform<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:621"]
  T25["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
