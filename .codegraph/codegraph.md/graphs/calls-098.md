# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_stop_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:567"]
  T1["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S1 -->|calls| T1
  S2["function:GC_thread_resume<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:678"]
  T2["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S2 -->|calls| T2
  S3["function:GC_start_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:703"]
  T3["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S3 -->|calls| T3
  S4["function:GC_start_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:703"]
  T4["function:GC_mprotect_resume<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4131"]
  S4 -->|calls| T4
  S5["function:GC_start_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:703"]
  T5["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S5 -->|calls| T5
  S6["function:GC_start_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:703"]
  T6["function:GC_thread_resume<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:678"]
  S6 -->|calls| T6
  S7["function:GC_start_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:703"]
  T7["function:GC_thread_resume<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:678"]
  S7 -->|calls| T7
  S8["function:GC_start_world<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:703"]
  T8["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S8 -->|calls| T8
  S9["function:GC_has_other_debug_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:36"]
  T9["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S9 -->|calls| T9
  S10["function:GC_store_back_pointer<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:90"]
  T10["function:AO_store<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2039"]
  S10 -->|calls| T10
  S11["function:GC_marked_for_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:102"]
  T11["function:GC_store_back_pointer<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:90"]
  S11 -->|calls| T11
  S12["function:GC_get_back_ptr_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:113"]
  T12["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S12 -->|calls| T12
  S13["function:GC_get_back_ptr_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:113"]
  T13["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S13 -->|calls| T13
  S14["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:193"]
  T14["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S14 -->|calls| T14
  S15["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:193"]
  T15["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S15 -->|calls| T15
  S16["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T16["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S16 -->|calls| T16
  S17["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T17["function:GC_get_back_ptr_info<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:113"]
  S17 -->|calls| T17
  S18["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T18["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S18 -->|calls| T18
  S19["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T19["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S19 -->|calls| T19
  S20["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T20["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S20 -->|calls| T20
  S21["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T21["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S21 -->|calls| T21
  S22["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T22["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S22 -->|calls| T22
  S23["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T23["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S23 -->|calls| T23
  S24["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T24["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S24 -->|calls| T24
  S25["function:GC_print_backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/dbg_mlc.c:205"]
  T25["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
