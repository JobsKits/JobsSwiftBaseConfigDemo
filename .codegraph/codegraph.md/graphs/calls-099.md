# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T1["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S1 -->|calls| T1
  S2["function:GC_generate_random_backtrace_no_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:252"]
  T2["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S2 -->|calls| T2
  S3["function:GC_generate_random_backtrace_no_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:252"]
  T3["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  S3 -->|calls| T3
  S4["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  T4["function:GC_try_to_collect<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1215"]
  S4 -->|calls| T4
  S5["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  T5["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S5 -->|calls| T5
  S6["function:GC_generate_random_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:260"]
  T6["function:GC_generate_random_backtrace_no_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:252"]
  S6 -->|calls| T6
  S7["function:GC_store_debug_info_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:275"]
  T7["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S7 -->|calls| T7
  S8["function:GC_store_debug_info_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:275"]
  T8["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S8 -->|calls| T8
  S9["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  T9["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S9 -->|calls| T9
  S10["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  T10["function:GC_start_debugging_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:479"]
  S10 -->|calls| T10
  S11["function:store_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:302"]
  T11["function:GC_store_debug_info_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:275"]
  S11 -->|calls| T11
  S12["function:GC_check_annotated_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:326"]
  T12["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S12 -->|calls| T12
  S13["function:GC_print_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:367"]
  T13["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S13 -->|calls| T13
  S14["function:GC_print_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:367"]
  T14["function:GC_find_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:42"]
  S14 -->|calls| T14
  S15["function:GC_print_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:367"]
  T15["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S15 -->|calls| T15
  S16["function:GC_print_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:367"]
  T16["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S16 -->|calls| T16
  S17["function:GC_print_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:367"]
  T17["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S17 -->|calls| T17
  S18["function:GC_debug_print_heap_obj_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:433"]
  T18["function:GC_print_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:367"]
  S18 -->|calls| T18
  S19["function:GC_debug_print_heap_obj_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:433"]
  T19["function:GC_default_print_heap_obj_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:57"]
  S19 -->|calls| T19
  S20["function:GC_print_smashed_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:447"]
  T20["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S20 -->|calls| T20
  S21["function:GC_print_smashed_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:447"]
  T21["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S21 -->|calls| T21
  S22["function:GC_print_smashed_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:447"]
  T22["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S22 -->|calls| T22
  S23["function:GC_print_smashed_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:447"]
  T23["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S23 -->|calls| T23
  S24["function:GC_start_debugging_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:479"]
  T24["function:GC_register_displacement_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:36"]
  S24 -->|calls| T24
  S25["function:GC_debug_register_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:496"]
  T25["function:GC_register_displacement_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/obj_map.c:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
