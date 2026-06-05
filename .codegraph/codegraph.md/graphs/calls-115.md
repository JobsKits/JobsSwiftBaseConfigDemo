# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h:1"]
  T1["function:GC_generic_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:239"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h:1"]
  T2["function:GC_generic_malloc_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:196"]
  S2 -->|calls| T2
  S3["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h:1"]
  T3["function:GC_generic_malloc_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:351"]
  S3 -->|calls| T3
  S4["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h:1"]
  T4["function:GC_generic_or_special_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:61"]
  S4 -->|calls| T4
  S5["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_mark.h:1"]
  T5["function:GC_debug_generic_or_special_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:884"]
  S5 -->|calls| T5
  S6["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_typed.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_typed.h:1"]
  T6["function:GC_malloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:591"]
  S6 -->|calls| T6
  S7["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_typed.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_typed.h:1"]
  T7["function:GC_malloc_explicitly_typed_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:615"]
  S7 -->|calls| T7
  S8["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_typed.h<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/gc_typed.h:1"]
  T8["function:GC_calloc_explicitly_typed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/typd_mlc.c:651"]
  S8 -->|calls| T8
  S9["function:GC_aux_template<dummy>::GC_out_of_line_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:149"]
  T9["function:GC_incr_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:258"]
  S9 -->|calls| T9
  S10["function:GC_aux_template<dummy>::GC_out_of_line_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:149"]
  T10["function:GC_incr_bytes_freed<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:264"]
  S10 -->|calls| T10
  S11["method:single_client_gc_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:178"]
  T11["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S11 -->|calls| T11
  S12["method:single_client_gc_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:178"]
  T12["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:154"]
  S12 -->|calls| T12
  S13["method:single_client_gc_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:194"]
  T13["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S13 -->|calls| T13
  S14["method:single_client_gc_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:194"]
  T14["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:178"]
  S14 -->|calls| T14
  S15["method:single_client_gc_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:210"]
  T15["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S15 -->|calls| T15
  S16["method:single_client_gc_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:210"]
  T16["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S16 -->|calls| T16
  S17["method:single_client_gc_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:225"]
  T17["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S17 -->|calls| T17
  S18["method:single_client_gc_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:225"]
  T18["function:GC_round_up<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:104"]
  S18 -->|calls| T18
  S19["method:single_client_traceable_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:246"]
  T19["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S19 -->|calls| T19
  S20["method:single_client_traceable_alloc_template::allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:246"]
  T20["function:GC_malloc_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:173"]
  S20 -->|calls| T20
  S21["method:single_client_traceable_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:263"]
  T21["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S21 -->|calls| T21
  S22["method:single_client_traceable_alloc_template::ptr_free_allocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:263"]
  T22["function:GC_malloc_atomic_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:422"]
  S22 -->|calls| T22
  S23["method:single_client_traceable_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:280"]
  T23["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S23 -->|calls| T23
  S24["method:single_client_traceable_alloc_template::deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:280"]
  T24["function:GC_round_up_uncollectable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:110"]
  S24 -->|calls| T24
  S25["method:single_client_traceable_alloc_template::ptr_free_deallocate<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/include/new_gc_alloc.h:294"]
  T25["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/libil2cpp/gc/WriteBarrierValidation.cpp:150"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
