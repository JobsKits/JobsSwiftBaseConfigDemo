# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_debug_register_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:496"]
  T1["function:GC_register_displacement_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:36"]
  S1 -->|calls| T1
  S2["function:GC_debug_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:527"]
  T2["function:GC_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:345"]
  S2 -->|calls| T2
  S3["function:GC_debug_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:527"]
  T3["function:GC_caller_func_offset<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:510"]
  S3 -->|calls| T3
  S4["function:GC_debug_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:527"]
  T4["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  S4 -->|calls| T4
  S5["function:GC_debug_malloc_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:544"]
  T5["function:GC_malloc_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:245"]
  S5 -->|calls| T5
  S6["function:GC_debug_malloc_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:544"]
  T6["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  S6 -->|calls| T6
  S7["function:GC_debug_malloc_atomic_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:553"]
  T7["function:GC_malloc_atomic_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:250"]
  S7 -->|calls| T7
  S8["function:GC_debug_malloc_atomic_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:553"]
  T8["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  S8 -->|calls| T8
  S9["function:GC_debug_generic_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:564"]
  T9["function:GC_generic_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:239"]
  S9 -->|calls| T9
  S10["function:GC_debug_generic_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:564"]
  T10["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  S10 -->|calls| T10
  S11["function:GC_debug_generic_malloc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:576"]
  T11["function:GC_generic_malloc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:157"]
  S11 -->|calls| T11
  S12["function:GC_debug_generic_malloc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:576"]
  T12["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S12 -->|calls| T12
  S13["function:GC_debug_generic_malloc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:576"]
  T13["function:GC_start_debugging_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:479"]
  S13 -->|calls| T13
  S14["function:GC_debug_generic_malloc_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:576"]
  T14["function:GC_store_debug_info_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:275"]
  S14 -->|calls| T14
  S15["function:GC_debug_generic_malloc_inner_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:594"]
  T15["function:GC_generic_malloc_inner_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:212"]
  S15 -->|calls| T15
  S16["function:GC_debug_generic_malloc_inner_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:594"]
  T16["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S16 -->|calls| T16
  S17["function:GC_debug_generic_malloc_inner_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:594"]
  T17["function:GC_start_debugging_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:479"]
  S17 -->|calls| T17
  S18["function:GC_debug_generic_malloc_inner_ignore_off_page<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:594"]
  T18["function:GC_store_debug_info_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:275"]
  S18 -->|calls| T18
  S19["function:GC_debug_malloc_stubborn<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:615"]
  T19["function:GC_debug_malloc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:527"]
  S19 -->|calls| T19
  S20["function:GC_debug_end_stubborn_change<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:623"]
  T20["function:GC_end_stubborn_change<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mallocx.c:614"]
  S20 -->|calls| T20
  S21["function:GC_debug_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:633"]
  T21["function:GC_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:339"]
  S21 -->|calls| T21
  S22["function:GC_debug_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:633"]
  T22["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  S22 -->|calls| T22
  S23["function:GC_debug_strdup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:642"]
  T23["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S23 -->|calls| T23
  S24["function:GC_debug_strdup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:642"]
  T24["function:GC_debug_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:633"]
  S24 -->|calls| T24
  S25["function:GC_debug_strndup<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:665"]
  T25["function:GC_debug_malloc_atomic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:633"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
