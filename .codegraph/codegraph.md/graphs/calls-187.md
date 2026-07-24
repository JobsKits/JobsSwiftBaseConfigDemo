# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeTests::testResponderMethodsBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:347"]
  T1["method:ASEditableTextNode::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:511"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeTests::testResponderMethodsBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:347"]
  T2["method:ASTestWindow::firstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:229"]
  S2 -->|calls| T2
  S3["method:ASDisplayNodeTests::testResponderOverrrideCanBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:367"]
  T3["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S3 -->|calls| T3
  S4["method:ASDisplayNodeTests::testResponderOverrrideCanBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:367"]
  T4["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S4 -->|calls| T4
  S5["method:ASDisplayNodeTests::testResponderOverrrideCanBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:367"]
  T5["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S5 -->|calls| T5
  S6["method:ASDisplayNodeTests::testResponderOverrrideCanBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:367"]
  T6["method:ASTestWindow::firstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:229"]
  S6 -->|calls| T6
  S7["method:ASDisplayNodeTests::testUnsupportedResponderSetupWillThrow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:382"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayNodeTests::testUnsupportedResponderSetupWillThrow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:382"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayNodeTests::testUnsupportedResponderSetupWillThrow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:382"]
  T9["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S9 -->|calls| T9
  S10["method:ASDisplayNodeTests::testUnsupportedResponderSetupWillThrow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:382"]
  T10["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S10 -->|calls| T10
  S11["method:ASDisplayNodeTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:391"]
  T11["method:ASDisplayNodeTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:391"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testViewCreatedOffThreadCanBeRealizedOnThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:397"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testNodeCreatedOffThreadWithExistingView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:408"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testNodeCreatedOffThreadWithLazyView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:425"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testNodeCreatedOffThreadWithLazyView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:425"]
  T15["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testNodeCreatedWithLazyAsyncView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:444"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testNodeCreatedWithLazyAsyncView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:444"]
  T17["function:ASCollectionViewTests::testThatDeletingAndReloadingTheSameItemThrowsAnException::XCTAssertThrows<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionViewTests.mm:473"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testNodeCreatedWithLazyAsyncView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:444"]
  T18["method:ASCollectionNode::view<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::checkDefaultPropertyValuesWithLayerBacking:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:530"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::checkDefaultPropertyValuesWithLayerBacking:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:530"]
  T20["method:ASDisplayNodeTests::checkValuesMatchDefaults:isLayerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:455"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::checkDefaultPropertyValuesWithLayerBacking:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:530"]
  T21["method:ASDisplayNodeTests::checkValuesMatchDefaults:isLayerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:455"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::checkValuesMatchSetValues:isLayerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:576"]
  T22["method:ASDisplayNodeTests::bogusImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:558"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::checkSimpleBridgePropertiesSetPropagate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:647"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::checkSimpleBridgePropertiesSetPropagate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:647"]
  T24["method:ASDisplayNodeTests::bogusImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:558"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::checkSimpleBridgePropertiesSetPropagate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:647"]
  T25["method:ASDisplayNodeTests::checkValuesMatchSetValues:isLayerBacked:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:576"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
