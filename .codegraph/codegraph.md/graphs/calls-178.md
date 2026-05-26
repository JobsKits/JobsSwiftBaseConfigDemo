# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  T1["method:UserDefaults::bool<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:20"]
  S1 -->|calls| T1
  S2["method:UserDefaults::setInt<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:25"]
  T2["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S2 -->|calls| T2
  S3["method:UserDefaults::int<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:28"]
  T3["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S3 -->|calls| T3
  S4["method:UserDefaults::setDouble<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:33"]
  T4["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S4 -->|calls| T4
  S5["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  T5["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S5 -->|calls| T5
  S6["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  T6["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  S6 -->|calls| T6
  S7["method:UserDefaults::setFloat<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:41"]
  T7["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S7 -->|calls| T7
  S8["method:UserDefaults::float<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:44"]
  T8["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S8 -->|calls| T8
  S9["method:UserDefaults::float<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:44"]
  T9["method:UserDefaults::float<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:44"]
  S9 -->|calls| T9
  S10["method:UserDefaults::setString<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:49"]
  T10["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S10 -->|calls| T10
  S11["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  T11["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S11 -->|calls| T11
  S12["method:UserDefaults::setUInt8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:56"]
  T12["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S12 -->|calls| T12
  S13["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  T13["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S13 -->|calls| T13
  S14["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  T14["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S14 -->|calls| T14
  S15["method:UserDefaults::setUInt16<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:63"]
  T15["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S15 -->|calls| T15
  S16["method:UserDefaults::uint16<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:66"]
  T16["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S16 -->|calls| T16
  S17["method:UserDefaults::uint16<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:66"]
  T17["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S17 -->|calls| T17
  S18["method:UserDefaults::setUInt32<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:70"]
  T18["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S18 -->|calls| T18
  S19["method:UserDefaults::uint32<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:73"]
  T19["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S19 -->|calls| T19
  S20["method:UserDefaults::setUInt64<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:78"]
  T20["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S20 -->|calls| T20
  S21["method:UserDefaults::uint64<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:81"]
  T21["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S21 -->|calls| T21
  S22["method:UserDefaults::setDate<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:86"]
  T22["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S22 -->|calls| T22
  S23["method:UserDefaults::date<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:89"]
  T23["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  S23 -->|calls| T23
  S24["method:UserDefaults::setData<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:93"]
  T24["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S24 -->|calls| T24
  S25["method:UserDefaults::getData<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:96"]
  T25["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
