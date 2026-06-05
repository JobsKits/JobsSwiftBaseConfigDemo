# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T1["function:GC_delete_gc_thread_no_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:688"]
  S1 -->|calls| T1
  S2["function:GC_DllMain<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:2971"]
  T2["function:GC_deinit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1399"]
  S2 -->|calls| T2
  S3["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3041"]
  T3["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S3 -->|calls| T3
  S4["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3041"]
  T4["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S4 -->|calls| T4
  S5["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3041"]
  T5["function:GC_lookup_thread_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:553"]
  S5 -->|calls| T5
  S6["function:GC_init_parallel<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3041"]
  T6["function:GC_init_thread_local<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:94"]
  S6 -->|calls| T6
  S7["function:GC_mark_thread_local_free_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3092"]
  T7["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S7 -->|calls| T7
  S8["function:GC_mark_thread_local_free_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3092"]
  T8["function:GC_mark_thread_local_fls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:262"]
  S8 -->|calls| T8
  S9["function:GC_check_tls<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3112"]
  T9["function:GC_check_tls_for<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/thread_local_alloc.c:287"]
  S9 -->|calls| T9
  S10["function:GC_check_tls<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:3112"]
  T10["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  S10 -->|calls| T10
  S11["method:SetKey::operator()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:123"]
  T11["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S11 -->|calls| T11
  S12["method:DefaultValue::operator()<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:133"]
  T12["method:atomic_common::T<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/baselib/Include/Cpp/Atomic.h:340"]
  S12 -->|calls| T12
  S13["function:hash_function<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:180"]
  T13["function:hash_funct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:179"]
  S13 -->|calls| T13
  S14["function:dense_hash_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:193"]
  T14["function:set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:297"]
  S14 -->|calls| T14
  S15["function:clear_no_resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:210"]
  T15["method:dense_hashtable::clear_no_resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:812"]
  S15 -->|calls| T15
  S16["function:load_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:224"]
  T16["function:size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:215"]
  S16 -->|calls| T16
  S17["function:load_factor<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:224"]
  T17["function:bucket_count<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:218"]
  S17 -->|calls| T17
  S18["function:rehash<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:254"]
  T18["function:resize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:253"]
  S18 -->|calls| T18
  S19["function:insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:289"]
  T19["function:insert<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:289"]
  S19 -->|calls| T19
  S20["function:set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:297"]
  T20["method:dense_hashtable::set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:496"]
  S20 -->|calls| T20
  S21["function:set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:297"]
  T21["type_alias:value_type<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:147"]
  S21 -->|calls| T21
  S22["function:set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:297"]
  T22["type_alias:data_type<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:145"]
  S22 -->|calls| T22
  S23["function:empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_map.h:300"]
  T23["method:dense_hashtable::empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/internal/densehashtable.h:513"]
  S23 -->|calls| T23
  S24["function:hash_function<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:167"]
  T24["function:hash_funct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:166"]
  S24 -->|calls| T24
  S25["function:dense_hash_set<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:180"]
  T25["function:set_empty_key<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/google/sparsehash/dense_hash_set.h:273"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
