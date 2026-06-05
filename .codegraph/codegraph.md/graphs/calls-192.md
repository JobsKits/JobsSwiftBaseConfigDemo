# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:dense_hashtable::squash_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:373"]
  T1["method:dense_hashtable::swap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:758"]
  S1 -->|calls| T1
  S2["method:dense_hashtable::test_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:384"]
  T2["method:dense_hashtable::KeyInfo::equals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1263"]
  S2 -->|calls| T2
  S3["method:dense_hashtable::set_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:390"]
  T3["method:sh_hashtable_settings::use_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:287"]
  S3 -->|calls| T3
  S4["method:dense_hashtable::set_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:390"]
  T4["method:dense_hashtable::KeyInfo::equals<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1263"]
  S4 -->|calls| T4
  S5["method:dense_hashtable::set_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:390"]
  T5["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S5 -->|calls| T5
  S6["method:dense_hashtable::set_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:390"]
  T6["method:dense_hashtable::squash_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:373"]
  S6 -->|calls| T6
  S7["method:dense_hashtable::set_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:390"]
  T7["method:sh_hashtable_settings::set_use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:297"]
  S7 -->|calls| T7
  S8["method:dense_hashtable::clear_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:400"]
  T8["method:dense_hashtable::squash_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:373"]
  S8 -->|calls| T8
  S9["method:dense_hashtable::clear_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:400"]
  T9["method:sh_hashtable_settings::set_use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:297"]
  S9 -->|calls| T9
  S10["method:dense_hashtable::deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:404"]
  T10["method:sh_hashtable_settings::use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:294"]
  S10 -->|calls| T10
  S11["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:412"]
  T11["method:sh_hashtable_settings::use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:294"]
  S11 -->|calls| T11
  S12["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:412"]
  T12["method:dense_hashtable::test_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:384"]
  S12 -->|calls| T12
  S13["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:412"]
  T13["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S13 -->|calls| T13
  S14["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:417"]
  T14["method:sh_hashtable_settings::use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:294"]
  S14 -->|calls| T14
  S15["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:417"]
  T15["method:dense_hashtable::test_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:384"]
  S15 -->|calls| T15
  S16["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:417"]
  T16["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S16 -->|calls| T16
  S17["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:422"]
  T17["method:sh_hashtable_settings::use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:294"]
  S17 -->|calls| T17
  S18["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:422"]
  T18["method:dense_hashtable::test_deleted_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:384"]
  S18 -->|calls| T18
  S19["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:422"]
  T19["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S19 -->|calls| T19
  S20["method:dense_hashtable::check_use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:429"]
  T20["method:sh_hashtable_settings::use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:294"]
  S20 -->|calls| T20
  S21["method:dense_hashtable::set_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:435"]
  T21["method:dense_hashtable::check_use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:429"]
  S21 -->|calls| T21
  S22["method:dense_hashtable::set_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:435"]
  T22["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:422"]
  S22 -->|calls| T22
  S23["method:dense_hashtable::set_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:435"]
  T23["method:dense_hashtable::KeyInfo::set_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1260"]
  S23 -->|calls| T23
  S24["method:dense_hashtable::clear_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:443"]
  T24["method:dense_hashtable::check_use_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:429"]
  S24 -->|calls| T24
  S25["method:dense_hashtable::clear_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:443"]
  T25["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:422"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
