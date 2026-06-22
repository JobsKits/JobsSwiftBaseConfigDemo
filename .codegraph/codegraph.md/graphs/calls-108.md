# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T1["method:ASMutableAttributedStringBuilder::string<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:234"]
  S1 -->|calls| T1
  S2["method:ASIntegerMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T2["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S2 -->|calls| T2
  S3["method:ASIntegerMap::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T3["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S3 -->|calls| T3
  S4["method:ASMainSerialQueue::performBlockOnMainThread:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:32"]
  T4["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  S4 -->|calls| T4
  S5["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T5["property:ASWeakSet::empty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.h:22"]
  S5 -->|calls| T5
  S6["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T6["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S6 -->|calls| T6
  S7["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T7["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S7 -->|calls| T7
  S8["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T8["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S8 -->|calls| T8
  S9["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T9["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S9 -->|calls| T9
  S10["method:ASMainSerialQueue::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  T10["method:ASMainSerialQueue::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  S10 -->|calls| T10
  S11["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T11["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S11 -->|calls| T11
  S12["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T12["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S12 -->|calls| T12
  S13["method:ASMutableAttributedStringBuilder::initWithString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:34"]
  T13["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S13 -->|calls| T13
  S14["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  T14["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S14 -->|calls| T14
  S15["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  T15["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S15 -->|calls| T15
  S16["method:ASMutableAttributedStringBuilder::initWithAttributedString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:54"]
  T16["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S16 -->|calls| T16
  S17["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  T17["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S17 -->|calls| T17
  S18["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  T18["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S18 -->|calls| T18
  S19["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T19["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S19 -->|calls| T19
  S20["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T20["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S20 -->|calls| T20
  S21["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T21["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S21 -->|calls| T21
  S22["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T22["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  S22 -->|calls| T22
  S23["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T23["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S23 -->|calls| T23
  S24["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  T24["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S24 -->|calls| T24
  S25["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  T25["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
