# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:dense_hashtable::operator==<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1068"]
  T1["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S1 -->|calls| T1
  S2["method:dense_hashtable::serialize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1112"]
  T2["method:dense_hashtable::squash_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:373"]
  S2 -->|calls| T2
  S3["method:dense_hashtable::serialize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1112"]
  T3["method:dense_hashtable::test_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:475"]
  S3 -->|calls| T3
  S4["method:dense_hashtable::unserialize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1141"]
  T4["method:sh_hashtable_settings::use_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:287"]
  S4 -->|calls| T4
  S5["method:dense_hashtable::unserialize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1141"]
  T5["method:dense_hashtable::clear<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:799"]
  S5 -->|calls| T5
  S6["method:dense_hashtable::unserialize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1141"]
  T6["method:dense_hashtable::clear_to_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:776"]
  S6 -->|calls| T6
  S7["method:dense_hashtable::KeyInfo::set_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1260"]
  T7["method:SetKey::operator()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:123"]
  S7 -->|calls| T7
  S8["method:dense_hashtable::hash<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1273"]
  T8["method:sh_hashtable_settings::hash<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:242"]
  S8 -->|calls| T8
  S9["method:dense_hashtable::equals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1276"]
  T9["method:dense_hashtable::KeyInfo::equals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1263"]
  S9 -->|calls| T9
  S10["method:dense_hashtable::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1279"]
  T10["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S10 -->|calls| T10
  S11["method:dense_hashtable::set_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1282"]
  T11["method:dense_hashtable::KeyInfo::set_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1260"]
  S11 -->|calls| T11
  S12["function:read_data_internal<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:110"]
  T12["function:read_data_internal_for_istream<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:105"]
  S12 -->|calls| T12
  S13["function:write_data_internal<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:121"]
  T13["function:write_data_internal_for_ostream<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:116"]
  S13 -->|calls| T13
  S14["function:read_data<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:147"]
  T14["function:read_data_internal<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:131"]
  S14 -->|calls| T14
  S15["function:write_data<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:152"]
  T15["function:write_data_internal<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:139"]
  S15 -->|calls| T15
  S16["function:read_bigendian_number<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:162"]
  T16["function:read_data<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:147"]
  S16 -->|calls| T16
  S17["function:write_bigendian_number<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:176"]
  T17["function:write_data<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:152"]
  S17 -->|calls| T17
  S18["method:pod_serializer::operator()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:196"]
  T18["function:read_data<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:147"]
  S18 -->|calls| T18
  S19["method:pod_serializer::operator()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:201"]
  T19["function:write_data<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:152"]
  S19 -->|calls| T19
  S20["method:sh_hashtable_settings::sh_hashtable_settings<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:228"]
  T20["method:sh_hashtable_settings::set_enlarge_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:250"]
  S20 -->|calls| T20
  S21["method:sh_hashtable_settings::sh_hashtable_settings<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:228"]
  T21["method:sh_hashtable_settings::set_shrink_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:256"]
  S21 -->|calls| T21
  S22["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  T22["method:sh_hashtable_settings::set_enlarge_threshold<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:263"]
  S22 -->|calls| T22
  S23["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  T23["method:sh_hashtable_settings::enlarge_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:273"]
  S23 -->|calls| T23
  S24["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  T24["method:sh_hashtable_settings::set_shrink_threshold<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:269"]
  S24 -->|calls| T24
  S25["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  T25["method:sh_hashtable_settings::shrink_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:276"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
