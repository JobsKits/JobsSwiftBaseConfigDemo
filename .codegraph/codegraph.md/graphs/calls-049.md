# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  T1["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S1 -->|calls| T1
  S2["method:UserDefaults::setUInt8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:56"]
  T2["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S2 -->|calls| T2
  S3["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  T3["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S3 -->|calls| T3
  S4["method:UserDefaults::uint8<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:59"]
  T4["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S4 -->|calls| T4
  S5["method:UserDefaults::setUInt16<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:63"]
  T5["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S5 -->|calls| T5
  S6["method:UserDefaults::uint16<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:66"]
  T6["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S6 -->|calls| T6
  S7["method:UserDefaults::uint16<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:66"]
  T7["function:contains<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/metadata/w32file-unix-glob.c:214"]
  S7 -->|calls| T7
  S8["method:UserDefaults::setUInt32<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:70"]
  T8["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S8 -->|calls| T8
  S9["method:UserDefaults::uint32<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:73"]
  T9["enum_member:JSONValue::object<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:964"]
  S9 -->|calls| T9
  S10["method:UserDefaults::setUInt64<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:78"]
  T10["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S10 -->|calls| T10
  S11["method:UserDefaults::uint64<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:81"]
  T11["method:UserDefaults::string<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:52"]
  S11 -->|calls| T11
  S12["method:UserDefaults::setDate<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:86"]
  T12["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S12 -->|calls| T12
  S13["method:UserDefaults::date<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:89"]
  T13["method:UserDefaults::double<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:36"]
  S13 -->|calls| T13
  S14["method:UserDefaults::setData<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:93"]
  T14["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S14 -->|calls| T14
  S15["method:UserDefaults::getData<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:96"]
  T15["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S15 -->|calls| T15
  S16["method:UserDefaults::setCodable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:100"]
  T16["method:JobsMemoryCache::set<br/>JobsByPods/JobsNetworking@Pods/Cache/JobsCacheStore.swift:47"]
  S16 -->|calls| T16
  S17["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  T17["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S17 -->|calls| T17
  S18["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  T18["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S18 -->|calls| T18
  S19["method:UserDefaults::setArray<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:111"]
  T19["method:UserDefaults::setCodable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:100"]
  S19 -->|calls| T19
  S20["method:UserDefaults::array<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:114"]
  T20["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  S20 -->|calls| T20
  S21["method:UserDefaults::setDictionary<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:118"]
  T21["method:UserDefaults::setCodable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:100"]
  S21 -->|calls| T21
  S22["method:UserDefaults::dictionary<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:121"]
  T22["method:UserDefaults::codable<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:106"]
  S22 -->|calls| T22
  S23["method:UserDefaults::load<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:128"]
  T23["enum_member:APIResponse::CodingKeys::data<br/>JobsByPods/JobsNetworking@Pods/Core/APIResponse.swift:26"]
  S23 -->|calls| T23
  S24["method:UserDefaults::load<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:128"]
  T24["method:KeyedDecodingContainer::decode<br/>JobsByPods/JobsSwiftTools@Pods/ModelDefaultValue.swift:41"]
  S24 -->|calls| T24
  S25["method:UserDefaults::save<br/>JobsByPods/JobsSwiftFoundation@Pods/UserDefaults.swift:138"]
  T25["method:JSONValue::encode<br/>JobsByPods/JobsSwiftBaseDefines@Pods/JobsBaseEnumDefs.swift:992"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
