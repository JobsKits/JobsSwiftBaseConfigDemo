# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:clear_no_resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:197"]
  T1["method:dense_hashtable::clear_no_resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:812"]
  S1 -->|calls| T1
  S2["function:load_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:211"]
  T2["function:size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:202"]
  S2 -->|calls| T2
  S3["function:load_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:211"]
  T3["function:bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:205"]
  S3 -->|calls| T3
  S4["function:rehash<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:241"]
  T4["function:resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:240"]
  S4 -->|calls| T4
  S5["function:insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:265"]
  T5["function:insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:265"]
  S5 -->|calls| T5
  S6["function:set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:273"]
  T6["method:dense_hashtable::set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:496"]
  S6 -->|calls| T6
  S7["function:empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:274"]
  T7["method:dense_hashtable::empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:513"]
  S7 -->|calls| T7
  S8["method:dense_hashtable_iterator::dense_hashtable_iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:166"]
  T8["method:dense_hashtable_iterator::advance_past_empty_and_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:181"]
  S8 -->|calls| T8
  S9["method:dense_hashtable_iterator::& operator++()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:185"]
  T9["method:dense_hashtable_iterator::advance_past_empty_and_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:181"]
  S9 -->|calls| T9
  S10["method:dense_hashtable_const_iterator::dense_hashtable_const_iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:219"]
  T10["method:dense_hashtable_const_iterator::advance_past_empty_and_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:239"]
  S10 -->|calls| T10
  S11["method:dense_hashtable_const_iterator::& operator++()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:243"]
  T11["method:dense_hashtable_const_iterator::advance_past_empty_and_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:239"]
  S11 -->|calls| T11
  S12["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:311"]
  T12["type_alias:dense_hashtable::iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:277"]
  S12 -->|calls| T12
  S13["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:313"]
  T13["type_alias:dense_hashtable::iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:277"]
  S13 -->|calls| T13
  S14["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:315"]
  T14["type_alias:dense_hashtable::const_iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:281"]
  S14 -->|calls| T14
  S15["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:317"]
  T15["type_alias:dense_hashtable::const_iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:281"]
  S15 -->|calls| T15
  S16["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:322"]
  T16["type_alias:dense_hashtable::local_iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:286"]
  S16 -->|calls| T16
  S17["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:325"]
  T17["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:322"]
  S17 -->|calls| T17
  S18["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:325"]
  T18["method:dense_hashtable::test_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:475"]
  S18 -->|calls| T18
  S19["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:325"]
  T19["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:412"]
  S19 -->|calls| T19
  S20["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:331"]
  T20["type_alias:dense_hashtable::const_local_iterator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:287"]
  S20 -->|calls| T20
  S21["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:334"]
  T21["method:dense_hashtable::begin<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:331"]
  S21 -->|calls| T21
  S22["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:334"]
  T22["method:dense_hashtable::test_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:475"]
  S22 -->|calls| T22
  S23["method:dense_hashtable::end<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:334"]
  T23["method:dense_hashtable::test_deleted<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:412"]
  S23 -->|calls| T23
  S24["method:dense_hashtable::get_allocator<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:344"]
  T24["type_alias:dense_hashtable::allocator_type<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:269"]
  S24 -->|calls| T24
  S25["method:dense_hashtable::num_table_copies<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:349"]
  T25["method:sh_hashtable_settings::num_ht_copies<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/hashtable-common.h:301"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
