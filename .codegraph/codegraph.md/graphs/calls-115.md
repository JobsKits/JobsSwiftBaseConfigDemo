# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:Mutex::try_lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T1["method:Mutex::DidLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S1 -->|calls| T1
  S2["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T2["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  S2 -->|calls| T2
  S3["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T3["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  S3 -->|calls| T3
  S4["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T4["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  S4 -->|calls| T4
  S5["method:Mutex::lock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T5["method:Mutex::DidLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S5 -->|calls| T5
  S6["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T6["method:Mutex::WillUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:248"]
  S6 -->|calls| T6
  S7["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T7["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  S7 -->|calls| T7
  S8["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T8["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  S8 -->|calls| T8
  S9["method:Mutex::unlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T9["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  S9 -->|calls| T9
  S10["method:Mutex::WillUnlock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:248"]
  T10["function:ASLockingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S10 -->|calls| T10
  S11["method:Mutex::DidLock<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASThread.h:261"]
  T11["function:ASLockingLog<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T12["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T13["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T14["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T15["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T16["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T17["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T18["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T19["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T20["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T21["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T22["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T23["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T24["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T25["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
