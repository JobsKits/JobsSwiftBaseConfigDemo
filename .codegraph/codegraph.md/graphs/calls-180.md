# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayLayerTestLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:97"]
  T1["method:_ASDisplayLayerTestLayer::display<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:97"]
  S1 -->|calls| T1
  S2["method:_ASDisplayLayerTestLayer::cancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:105"]
  T2["method:_ASDisplayLayerTestLayer::cancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:105"]
  S2 -->|calls| T2
  S3["method:_ASDisplayLayerTestDelegate::displayWithParameters:isCancelled:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:212"]
  T3["function:bogusImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:20"]
  S3 -->|calls| T3
  S4["method:_ASDisplayLayerTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:240"]
  T4["method:_ASDisplayLayerTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:240"]
  S4 -->|calls| T4
  S5["method:_ASDisplayLayerTests::setUp<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:240"]
  T5["function:bogusImage<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:20"]
  S5 -->|calls| T5
  S6["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  T6["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S6 -->|calls| T6
  S7["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  T7["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  S7 -->|calls| T7
  S8["method:_ASDisplayLayerTests::waitForLayer:asyncDisplayCount:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:269"]
  T8["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  S8 -->|calls| T8
  S9["method:_ASDisplayLayerTests::waitForAsyncDelegate:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:278"]
  T9["function:ASDisplayNodeRunRunLoopUntilBlockIsTrue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:25"]
  S9 -->|calls| T9
  S10["method:_ASDisplayLayerTests::checkDelegateDisplay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:285"]
  T10["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S10 -->|calls| T10
  S11["method:_ASDisplayLayerTests::checkDelegateDisplay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:285"]
  T11["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S11 -->|calls| T11
  S12["method:_ASDisplayLayerTests::checkDelegateDisplay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:285"]
  T12["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S12 -->|calls| T12
  S13["method:_ASDisplayLayerTests::checkDelegateDisplay:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:285"]
  T13["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  S13 -->|calls| T13
  S14["method:_ASDisplayLayerTests::checkDelegateDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:329"]
  T14["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S14 -->|calls| T14
  S15["method:_ASDisplayLayerTests::checkDelegateDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:329"]
  T15["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S15 -->|calls| T15
  S16["method:_ASDisplayLayerTests::checkDelegateDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:329"]
  T16["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S16 -->|calls| T16
  S17["method:_ASDisplayLayerTests::checkDelegateDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:329"]
  T17["method:_ASDisplayLayerTests::waitForLayer:asyncDisplayCount:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:269"]
  S17 -->|calls| T17
  S18["method:_ASDisplayLayerTests::checkDelegateDisplayAndDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:376"]
  T18["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S18 -->|calls| T18
  S19["method:_ASDisplayLayerTests::checkDelegateDisplayAndDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:376"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["method:_ASDisplayLayerTests::checkDelegateDisplayAndDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:376"]
  T20["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S20 -->|calls| T20
  S21["method:_ASDisplayLayerTests::checkDelegateDisplayAndDrawInContext:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:376"]
  T21["method:_ASDisplayLayerTests::waitForDisplayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:259"]
  S21 -->|calls| T21
  S22["method:_ASDisplayLayerTests::testCancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:423"]
  T22["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S22 -->|calls| T22
  S23["method:_ASDisplayLayerTests::testCancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:423"]
  T23["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S23 -->|calls| T23
  S24["method:_ASDisplayLayerTests::testCancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:423"]
  T24["method:_ASDisplayLayer::cancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:196"]
  S24 -->|calls| T24
  S25["method:_ASDisplayLayerTests::testCancelAsyncDisplay<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayLayerTests.mm:423"]
  T25["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
