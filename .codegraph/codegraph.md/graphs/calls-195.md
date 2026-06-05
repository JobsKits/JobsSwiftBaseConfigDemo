# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T1["method:dense_hashtable::clear_to_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:776"]
  S1 -->|calls| T1
  S2["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T2["method:sh_hashtable_settings::min_buckets<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:329"]
  S2 -->|calls| T2
  S3["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T3["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S3 -->|calls| T3
  S4["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T4["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S4 -->|calls| T4
  S5["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T5["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S5 -->|calls| T5
  S6["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T6["method:dense_hashtable::hash<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1273"]
  S6 -->|calls| T6
  S7["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T7["method:dense_hashtable::KeyInfo::get_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:1257"]
  S7 -->|calls| T7
  S8["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T8["method:dense_hashtable::test_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:483"]
  S8 -->|calls| T8
  S9["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T9["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S9 -->|calls| T9
  S10["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T10["method:dense_hashtable::set_value<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:356"]
  S10 -->|calls| T10
  S11["method:dense_hashtable::copy_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:638"]
  T11["method:sh_hashtable_settings::inc_num_ht_copies<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:304"]
  S11 -->|calls| T11
  S12["method:dense_hashtable::resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:667"]
  T12["method:sh_hashtable_settings::consider_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:280"]
  S12 -->|calls| T12
  S13["method:dense_hashtable::resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:667"]
  T13["method:dense_hashtable::maybe_shrink<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:539"]
  S13 -->|calls| T13
  S14["method:dense_hashtable::resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:667"]
  T14["method:dense_hashtable::resize_delta<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:571"]
  S14 -->|calls| T14
  S15["method:dense_hashtable::get_resizing_parameters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:678"]
  T15["method:sh_hashtable_settings::shrink_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:253"]
  S15 -->|calls| T15
  S16["method:dense_hashtable::get_resizing_parameters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:678"]
  T16["method:sh_hashtable_settings::enlarge_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:247"]
  S16 -->|calls| T16
  S17["method:dense_hashtable::set_resizing_parameters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:682"]
  T17["method:sh_hashtable_settings::set_resizing_parameters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:318"]
  S17 -->|calls| T17
  S18["method:dense_hashtable::set_resizing_parameters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:682"]
  T18["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  S18 -->|calls| T18
  S19["method:dense_hashtable::set_resizing_parameters<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:682"]
  T19["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S19 -->|calls| T19
  S20["method:dense_hashtable::dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:691"]
  T20["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  S20 -->|calls| T20
  S21["method:dense_hashtable::dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:691"]
  T21["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S21 -->|calls| T21
  S22["method:dense_hashtable::dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:713"]
  T22["method:sh_hashtable_settings::min_buckets<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:329"]
  S22 -->|calls| T22
  S23["method:dense_hashtable::dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:713"]
  T23["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  S23 -->|calls| T23
  S24["method:dense_hashtable::dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:713"]
  T24["method:dense_hashtable::bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:523"]
  S24 -->|calls| T24
  S25["method:dense_hashtable::dense_hashtable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:713"]
  T25["method:sh_hashtable_settings::reset_thresholds<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:309"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
