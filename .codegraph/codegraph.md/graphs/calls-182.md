# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:single_client_gc_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:178"]
  T1["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S1 -->|calls| T1
  S2["method:single_client_gc_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:178"]
  T2["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:154"]
  S2 -->|calls| T2
  S3["method:single_client_gc_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:194"]
  T3["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S3 -->|calls| T3
  S4["method:single_client_gc_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:194"]
  T4["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:178"]
  S4 -->|calls| T4
  S5["method:single_client_gc_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:210"]
  T5["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S5 -->|calls| T5
  S6["method:single_client_gc_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:210"]
  T6["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S6 -->|calls| T6
  S7["method:single_client_gc_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:225"]
  T7["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S7 -->|calls| T7
  S8["method:single_client_gc_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:225"]
  T8["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S8 -->|calls| T8
  S9["method:single_client_traceable_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:246"]
  T9["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S9 -->|calls| T9
  S10["method:single_client_traceable_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:246"]
  T10["function:GC_malloc_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:173"]
  S10 -->|calls| T10
  S11["method:single_client_traceable_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:263"]
  T11["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S11 -->|calls| T11
  S12["method:single_client_traceable_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:263"]
  T12["function:GC_malloc_atomic_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:422"]
  S12 -->|calls| T12
  S13["method:single_client_traceable_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:280"]
  T13["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S13 -->|calls| T13
  S14["method:single_client_traceable_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:280"]
  T14["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S14 -->|calls| T14
  S15["method:single_client_traceable_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:294"]
  T15["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S15 -->|calls| T15
  S16["method:single_client_traceable_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:294"]
  T16["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S16 -->|calls| T16
  S17["method:gc_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:315"]
  T17["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:154"]
  S17 -->|calls| T17
  S18["method:gc_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:316"]
  T18["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:178"]
  S18 -->|calls| T18
  S19["method:traceable_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:327"]
  T19["function:GC_malloc_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:173"]
  S19 -->|calls| T19
  S20["method:traceable_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:328"]
  T20["function:GC_malloc_atomic_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:422"]
  S20 -->|calls| T20
  S21["method:traceable_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:330"]
  T21["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S21 -->|calls| T21
  S22["method:traceable_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:331"]
  T22["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S22 -->|calls| T22
  S23["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/darwin_stop_world.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/darwin_stop_world.h:1"]
  T23["function:GC_is_mach_marker<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:327"]
  S23 -->|calls| T23
  S24["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_pmark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_pmark.h:1"]
  T24["function:AO_char_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:378"]
  S24 -->|calls| T24
  S25["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_pmark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/private/gc_pmark.h:1"]
  T25["function:AO_char_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:479"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
