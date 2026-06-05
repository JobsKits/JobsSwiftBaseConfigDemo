# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:dense_hashtable::empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:522"]
  T1["method:dense_hashtable::size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:520"]
  S1 -->|calls| T1
  S2["method:dense_hashtable::max_bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:524"]
  T2["method:dense_hashtable::max_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:521"]
  S2 -->|calls| T2
  S3["method:dense_hashtable::bucket_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:528"]
  T3["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:331"]
  S3 -->|calls| T3
  S4["method:dense_hashtable::bucket_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:528"]
  T4["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:334"]
  S4 -->|calls| T4
  S5["class:dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:260"]
  T5["type_alias:dense_hashtable_iterator::size_type<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:161"]
  S5 -->|calls| T5
  S6["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T6["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S6 -->|calls| T6
  S7["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T7["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S7 -->|calls| T7
  S8["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T8["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S8 -->|calls| T8
  S9["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T9["method:sh_hashtable_settings::shrink_threshold<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:266"]
  S9 -->|calls| T9
  S10["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T10["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S10 -->|calls| T10
  S11["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T11["method:sh_hashtable_settings::shrink_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:253"]
  S11 -->|calls| T11
  S12["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T12["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S12 -->|calls| T12
  S13["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T13["method:dense_hashtable::swap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:758"]
  S13 -->|calls| T13
  S14["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  T14["method:sh_hashtable_settings::set_consider_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:283"]
  S14 -->|calls| T14
  S15["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T15["method:sh_hashtable_settings::consider_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:280"]
  S15 -->|calls| T15
  S16["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T16["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  S16 -->|calls| T16
  S17["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T17["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S17 -->|calls| T17
  S18["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T18["method:sh_hashtable_settings::enlarge_threshold<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:260"]
  S18 -->|calls| T18
  S19["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T19["method:sh_hashtable_settings::min_buckets<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:329"]
  S19 -->|calls| T19
  S20["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T20["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S20 -->|calls| T20
  S21["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T21["method:sh_hashtable_settings::min_buckets<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:329"]
  S21 -->|calls| T21
  S22["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T22["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S22 -->|calls| T22
  S23["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T23["method:sh_hashtable_settings::min_buckets<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:329"]
  S23 -->|calls| T23
  S24["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T24["method:sh_hashtable_settings::shrink_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:276"]
  S24 -->|calls| T24
  S25["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  T25["method:dense_hashtable::swap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:758"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
