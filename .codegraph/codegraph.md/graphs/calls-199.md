# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T1["method:_ASDisplayView::accessibilityPerformEscape<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:381"]
  S1 -->|calls| T1
  S2["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T2["method:_ASDisplayView::accessibilityPerformEscape<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:381"]
  S2 -->|calls| T2
  S3["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T3["method:_ASDisplayView::accessibilityPerformMagicTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:385"]
  S3 -->|calls| T3
  S4["method:ASDisplayViewAccessibilityTests::testActionForwarding<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:222"]
  T4["method:_ASDisplayView::accessibilityPerformMagicTap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:385"]
  S4 -->|calls| T4
  S5["method:ASDisplayViewAccessibilityTests::testThatAccessibilityElementsWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:255"]
  T5["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S5 -->|calls| T5
  S6["method:ASDisplayViewAccessibilityTests::testThatAccessibilityElementsWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:255"]
  T6["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S6 -->|calls| T6
  S7["method:ASDisplayViewAccessibilityTests::testThatAccessibilityElementsWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:255"]
  T7["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S7 -->|calls| T7
  S8["method:ASDisplayViewAccessibilityTests::testThatAccessibilityElementsOverrideWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:285"]
  T8["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S8 -->|calls| T8
  S9["method:ASDisplayViewAccessibilityTests::testThatAccessibilityElementsOverrideWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:285"]
  T9["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S9 -->|calls| T9
  S10["method:ASDisplayViewAccessibilityTests::testThatAccessibilityElementsOverrideWorks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:285"]
  T10["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S10 -->|calls| T10
  S11["method:ASDisplayViewAccessibilityTests::testHiddenAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:310"]
  T11["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S11 -->|calls| T11
  S12["method:ASDisplayViewAccessibilityTests::testHiddenAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:310"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayViewAccessibilityTests::testHiddenAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:310"]
  T13["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S13 -->|calls| T13
  S14["method:ASDisplayViewAccessibilityTests::testTransparentAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:338"]
  T14["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S14 -->|calls| T14
  S15["method:ASDisplayViewAccessibilityTests::testTransparentAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:338"]
  T15["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S15 -->|calls| T15
  S16["method:ASDisplayViewAccessibilityTests::testTransparentAccessibilityElements<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:338"]
  T16["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S16 -->|calls| T16
  S17["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T17["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S17 -->|calls| T17
  S18["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T18["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S18 -->|calls| T18
  S19["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T20["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S20 -->|calls| T20
  S21["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T21["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S21 -->|calls| T21
  S22["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindow<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:365"]
  T23["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S23 -->|calls| T23
  S24["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindowButInScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:415"]
  T24["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S24 -->|calls| T24
  S25["method:ASDisplayViewAccessibilityTests::testAccessibilityElementsNotInAppWindowButInScrollView<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayViewAccessibilityTests.mm:415"]
  T25["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
