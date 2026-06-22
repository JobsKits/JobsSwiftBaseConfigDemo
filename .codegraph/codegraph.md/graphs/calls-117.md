# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSIndexSet::as_indexesByMapping:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:17"]
  T1["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S1 -->|calls| T1
  S2["method:NSIndexSet::as_indexesByMapping:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:17"]
  T2["variable:block<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S2 -->|calls| T2
  S3["method:NSIndexSet::as_intersectionWithIndexes:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:31"]
  T3["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S3 -->|calls| T3
  S4["method:NSIndexSet::as_indexSetFromIndexPaths:inSection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:42"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:NSIndexSet::as_sectionsFromIndexPaths:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:82"]
  T5["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S5 -->|calls| T5
  S6["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:16"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:16"]
  T7["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  T8["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  T9["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::attributeTextInRange:withTextKitLineHeight:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:37"]
  T10["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  T11["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S11 -->|calls| T11
  S12["method:ASAsyncTransactionOperation::initWithOperationCompletionBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:34"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["function:ASAsyncTransactionQueue::GroupImpl<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:106"]
  T13["function:ASAsyncTransactionQueue::GroupImpl<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:106"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T14["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T15["property:ASWeakSet::empty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.h:22"]
  S15 -->|calls| T15
  S16["function:pushOperation<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:201"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["function:schedule<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T17["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S17 -->|calls| T17
  S18["function:schedule<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T18["property:ASWeakSet::empty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.h:22"]
  S18 -->|calls| T18
  S19["function:schedule<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T19["method:ASNodeController::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S19 -->|calls| T19
  S20["function:schedule<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T20["method:ASNodeController::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S20 -->|calls| T20
  S21["function:schedule<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T21["property:ASWeakSet::empty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.h:22"]
  S21 -->|calls| T21
  S22["function:schedule<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T22["property:ASWeakSet::empty<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.h:22"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T23["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T24["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T25["method:JobsTask::wait<br/>JobsByPods/JobsSwiftTaskCenter@Pods/JobsTask.swift:378"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
