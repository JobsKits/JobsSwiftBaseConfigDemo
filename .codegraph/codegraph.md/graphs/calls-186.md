# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNodeSnapshotTests::testBackgroundDynamicColor<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:105"]
  T1["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S1 -->|calls| T1
  S2["method:ASDisplayNodeSnapshotTests::testBackgroundDynamicColorLayerBacked<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeSnapshotTests.mm:122"]
  T2["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S2 -->|calls| T2
  S3["method:ASTestDisplayNode::setInterfaceState:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:125"]
  T3["function:ASCATransactionQueueWait<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTestsHelper.mm:57"]
  S3 -->|calls| T3
  S4["method:ASTestDisplayNode::didEnterDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:136"]
  T4["method:ASTestDisplayNode::didEnterDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:136"]
  S4 -->|calls| T4
  S5["method:ASTestDisplayNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:142"]
  T5["method:ASTestDisplayNode::didExitDisplayState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:142"]
  S5 -->|calls| T5
  S6["method:ASTestDisplayNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:148"]
  T6["method:ASTestDisplayNode::didEnterPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:148"]
  S6 -->|calls| T6
  S7["method:ASTestDisplayNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:155"]
  T7["method:ASTestDisplayNode::didExitPreloadState<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:155"]
  S7 -->|calls| T7
  S8["method:ASTestDisplayNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:168"]
  T8["method:ASTestDisplayNode::displayDidFinish<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:168"]
  S8 -->|calls| T8
  S9["method:UIResponderNodeTestView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:258"]
  T9["method:UIResponderNodeTestView::resignFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:258"]
  S9 -->|calls| T9
  S10["method:UIResponderNodeTestDisplayViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:287"]
  T10["method:UIResponderNodeTestDisplayViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:287"]
  S10 -->|calls| T10
  S11["method:UIResponderNodeTestViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:294"]
  T11["method:UIResponderNodeTestViewCallingSuper::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:294"]
  S11 -->|calls| T11
  S12["method:ASDisplayNodeTests::testOverriddenNodeFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:305"]
  T12["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S12 -->|calls| T12
  S13["method:ASDisplayNodeTests::testOverriddenNodeFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:305"]
  T13["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S13 -->|calls| T13
  S14["method:ASDisplayNodeTests::testOverriddenNodeFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:305"]
  T14["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S14 -->|calls| T14
  S15["method:ASDisplayNodeTests::testOverriddenDisplayViewFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:312"]
  T15["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S15 -->|calls| T15
  S16["method:ASDisplayNodeTests::testOverriddenDisplayViewFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:312"]
  T16["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S16 -->|calls| T16
  S17["method:ASDisplayNodeTests::testOverriddenViewFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:326"]
  T17["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTests::testOverriddenViewFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:326"]
  T18["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S18 -->|calls| T18
  S19["method:ASDisplayNodeTests::testDefaultFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:340"]
  T19["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S19 -->|calls| T19
  S20["method:ASDisplayNodeTests::testDefaultFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:340"]
  T20["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S20 -->|calls| T20
  S21["method:ASDisplayNodeTests::testDefaultFirstResponderBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:340"]
  T21["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S21 -->|calls| T21
  S22["method:ASDisplayNodeTests::testResponderMethodsBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:347"]
  T22["method:ASTestSection::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASCollectionModernDataSourceTests.mm:360"]
  S22 -->|calls| T22
  S23["method:ASDisplayNodeTests::testResponderMethodsBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:347"]
  T23["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTests::testResponderMethodsBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:347"]
  T24["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S24 -->|calls| T24
  S25["method:ASDisplayNodeTests::testResponderMethodsBehavior<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:347"]
  T25["method:ASTestWindow::firstResponder<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Tests/ASDisplayNodeTests.mm:229"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
