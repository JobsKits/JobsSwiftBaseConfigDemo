# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:WRAP_DLFUNC(dlopen)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gc_dlopen.c:70"]
  T1["function:disable_gc_for_dlopen<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gc_dlopen.c:44"]
  S1 -->|calls| T1
  S2["function:WRAP_DLFUNC(dlopen)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gc_dlopen.c:70"]
  T2["function:GC_enable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1977"]
  S2 -->|calls| T2
  S3["function:GC_init_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:67"]
  T3["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S3 -->|calls| T3
  S4["function:GC_init_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:67"]
  T4["function:GC_new_free_list_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2001"]
  S4 -->|calls| T4
  S5["function:GC_init_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:67"]
  T5["function:GC_new_kind_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2022"]
  S5 -->|calls| T5
  S6["function:GC_init_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:67"]
  T6["function:GC_new_kind_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2022"]
  S6 -->|calls| T6
  S7["function:GC_init_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:67"]
  T7["function:GC_new_kind_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2022"]
  S7 -->|calls| T7
  S8["function:GC_init_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:67"]
  T8["function:GC_new_free_list_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:2001"]
  S8 -->|calls| T8
  S9["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:1"]
  T9["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S9 -->|calls| T9
  S10["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:1"]
  T10["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S10 -->|calls| T10
  S11["function:GC_debug_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:205"]
  T11["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S11 -->|calls| T11
  S12["function:GC_debug_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:205"]
  T12["function:GC_generic_malloc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:157"]
  S12 -->|calls| T12
  S13["function:GC_debug_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:205"]
  T13["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S13 -->|calls| T13
  S14["function:GC_debug_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:205"]
  T14["function:GC_start_debugging_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:479"]
  S14 -->|calls| T14
  S15["function:GC_debug_gcj_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:205"]
  T15["function:GC_store_debug_info_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:275"]
  S15 -->|calls| T15
  S16["function:GC_gcj_malloc_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:236"]
  T16["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S16 -->|calls| T16
  S17["function:GC_gcj_malloc_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:236"]
  T17["function:maybe_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/gcj_mlc.c:137"]
  S17 -->|calls| T17
  S18["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  T18["function:GC_add_to_our_memory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1251"]
  S18 -->|calls| T18
  S19["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  T19["function:GC_add_to_our_memory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1251"]
  S19 -->|calls| T19
  S20["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  T20["function:GC_add_to_our_memory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1251"]
  S20 -->|calls| T20
  S21["function:alloc_hdr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:174"]
  T21["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S21 -->|calls| T21
  S22["function:GC_init_headers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:199"]
  T22["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S22 -->|calls| T22
  S23["function:GC_init_headers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:199"]
  T23["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S23 -->|calls| T23
  S24["function:get_index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:219"]
  T24["function:GC_scratch_alloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:124"]
  S24 -->|calls| T24
  S25["function:GC_install_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:274"]
  T25["function:get_index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:219"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
