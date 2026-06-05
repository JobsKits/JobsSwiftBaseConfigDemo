# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:229"]
  T1["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S1 -->|calls| T1
  S2["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T2["function:sort_heap_sects<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:283"]
  S2 -->|calls| T2
  S3["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T3["function:GC_parse_map_entry<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:273"]
  S3 -->|calls| T3
  S4["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T4["function:GC_segment_is_thread_stack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:822"]
  S4 -->|calls| T4
  S5["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T5["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S5 -->|calls| T5
  S6["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T6["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S6 -->|calls| T6
  S7["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T7["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S7 -->|calls| T7
  S8["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  T8["function:GC_remove_roots_subregion<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:385"]
  S8 -->|calls| T8
  S9["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:400"]
  T9["function:GC_get_maps<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:171"]
  S9 -->|calls| T9
  S10["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:400"]
  T10["function:GC_register_map_entries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:308"]
  S10 -->|calls| T10
  S11["function:GC_register_dynlib_callback<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:481"]
  T11["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S11 -->|calls| T11
  S12["function:GC_register_dynlib_callback<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:481"]
  T12["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S12 -->|calls| T12
  S13["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:585"]
  T13["function:GC_exclude_static_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:544"]
  S13 -->|calls| T13
  S14["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:585"]
  T14["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S14 -->|calls| T14
  S15["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:585"]
  T15["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S15 -->|calls| T15
  S16["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:585"]
  T16["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S16 -->|calls| T16
  S17["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:585"]
  T17["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S17 -->|calls| T17
  S18["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:753"]
  T18["function:GC_FirstDLOpenedLinkMap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:706"]
  S18 -->|calls| T18
  S19["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:753"]
  T19["function:ElfW<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:167"]
  S19 -->|calls| T19
  S20["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:753"]
  T20["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S20 -->|calls| T20
  S21["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:812"]
  T21["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S21 -->|calls| T21
  S22["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:812"]
  T22["function:GC_roots_present<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:128"]
  S22 -->|calls| T22
  S23["function:GC_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:812"]
  T23["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S23 -->|calls| T23
  S24["function:GC_cond_add_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:935"]
  T24["function:GC_get_next_stack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/win32_threads.c:1774"]
  S24 -->|calls| T24
  S25["function:GC_cond_add_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dyn_load.c:935"]
  T25["function:GC_add_roots_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:169"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
