# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T1["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T2["variable:property<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T3["method:ASTextRange::end<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S3 -->|calls| T3
  S4["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  T4["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S4 -->|calls| T4
  S5["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  T5["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S5 -->|calls| T5
  S6["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T6["function:AS_NSStringFromUIUserInterfaceSizeClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:125"]
  S6 -->|calls| T6
  S7["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T7["function:AS_NSStringFromUIUserInterfaceSizeClass<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:125"]
  S7 -->|calls| T7
  S8["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T8["function:AS_NSStringFromUIUserInterfaceIdiom<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:97"]
  S8 -->|calls| T8
  S9["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T9["function:AS_NSStringFromUIForceTouchCapability<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:113"]
  S9 -->|calls| T9
  S10["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T10["function:AS_NSStringFromUIUserInterfaceStyle<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:163"]
  S10 -->|calls| T10
  S11["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T11["function:AS_NSStringFromUITraitEnvironmentLayoutDirection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:150"]
  S11 -->|calls| T11
  S12["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T12["function:AS_NSStringFromUIDisplayGamut<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:137"]
  S12 -->|calls| T12
  S13["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T13["function:AS_NSStringFromUITraitEnvironmentUserInterfaceLevel<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:177"]
  S13 -->|calls| T13
  S14["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T14["function:AS_NSStringFromUITraitEnvironmentAccessibilityContrast<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:191"]
  S14 -->|calls| T14
  S15["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T15["function:AS_NSStringFromUITraitEnvironmentLegibilityWeight<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:204"]
  S15 -->|calls| T15
  S16["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  T16["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S16 -->|calls| T16
  S17["method:ASTraitCollection::traitCollectionWithASPrimitiveTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:248"]
  T17["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S17 -->|calls| T17
  S18["method:ASTraitCollection::hash<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:314"]
  T18["function:ASHashBytes<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S18 -->|calls| T18
  S19["method:ASTraitCollection::isEqualToTraitCollection:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:325"]
  T19["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S19 -->|calls| T19
  S20["method:ASWeakProxy::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakProxy.mm:50"]
  T20["function:ASObjectDescriptionMake<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S20 -->|calls| T20
  S21["method:ASWeakSet::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:18"]
  T21["method:ASWeakSet::init<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:18"]
  S21 -->|calls| T21
  S22["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  T22["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S22 -->|calls| T22
  S23["method:ASWeakSet::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:79"]
  T23["method:ASWeakSet::description<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/ASWeakSet.mm:79"]
  S23 -->|calls| T23
  S24["function:asdk_diffWithArray:insertions:deletions:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:19"]
  T24["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S24 -->|calls| T24
  S25["function:asdk_diffWithArray:insertions:deletions:compareBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:24"]
  T25["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualBySwiftPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
