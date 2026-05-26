# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T1["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S1 -->|calls| T1
  S2["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T2["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  S2 -->|calls| T2
  S3["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T3["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S3 -->|calls| T3
  S4["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T4["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  S4 -->|calls| T4
  S5["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T5["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S5 -->|calls| T5
  S6["function:coerce<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:196"]
  T6["function:fromBool<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:376"]
  S6 -->|calls| T6
  S7["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T7["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S7 -->|calls| T7
  S8["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T8["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S8 -->|calls| T8
  S9["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T9["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S9 -->|calls| T9
  S10["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T10["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S10 -->|calls| T10
  S11["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T11["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S11 -->|calls| T11
  S12["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T12["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S12 -->|calls| T12
  S13["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T13["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S13 -->|calls| T13
  S14["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T14["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S14 -->|calls| T14
  S15["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T15["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S15 -->|calls| T15
  S16["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T16["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S16 -->|calls| T16
  S17["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T17["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S17 -->|calls| T17
  S18["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T18["method:JobsRefreshCache::date<br/>JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIScrollView/UIScrollView+ESPullToRefresh.swift:430"]
  S18 -->|calls| T18
  S19["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T19["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S19 -->|calls| T19
  S20["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T20["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S20 -->|calls| T20
  S21["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T21["function:fromDouble<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:339"]
  S21 -->|calls| T21
  S22["function:fromString<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:224"]
  T22["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S22 -->|calls| T22
  S23["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  T23["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S23 -->|calls| T23
  S24["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  T24["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S24 -->|calls| T24
  S25["function:fromInt<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:308"]
  T25["function:report<br/>JobsByPods/JobsSwiftBaseTools@Pods/SafeCodable.swift:82"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
