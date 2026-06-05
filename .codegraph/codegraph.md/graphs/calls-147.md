# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_read_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3789"]
  T1["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S1 -->|calls| T1
  S2["function:GC_read_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3789"]
  T2["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S2 -->|calls| T2
  S3["function:GC_read_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3789"]
  T3["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S3 -->|calls| T3
  S4["function:GC_read_dirty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3789"]
  T4["function:GC_or_pages<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2906"]
  S4 -->|calls| T4
  S5["function:GC_mprotect_stop<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4126"]
  T5["function:GC_mprotect_thread_notify<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4083"]
  S5 -->|calls| T5
  S6["function:GC_mprotect_resume<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4131"]
  T6["function:GC_mprotect_thread_notify<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4083"]
  S6 -->|calls| T6
  S7["function:GC_mprotect_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4141"]
  T7["function:GC_darwin_register_mach_handler_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:433"]
  S7 -->|calls| T7
  S8["function:GC_mprotect_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4141"]
  T8["function:GC_mprotect_thread_reply<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4108"]
  S8 -->|calls| T8
  S9["function:GC_mprotect_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4141"]
  T9["function:GC_mprotect_thread_reply<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4108"]
  S9 -->|calls| T9
  S10["function:GC_mprotect_thread<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4141"]
  T10["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S10 -->|calls| T10
  S11["function:catch_exception_raise<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4457"]
  T11["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S11 -->|calls| T11
  S12["function:catch_exception_raise<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4457"]
  T12["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S12 -->|calls| T12
  S13["function:catch_exception_raise<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4457"]
  T13["function:is_header_found_async<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3257"]
  S13 -->|calls| T13
  S14["function:catch_exception_raise<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4457"]
  T14["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S14 -->|calls| T14
  S15["function:catch_exception_raise<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4457"]
  T15["function:async_set_pht_entry_from_index<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:3107"]
  S15 -->|calls| T15
  S16["function:catch_exception_raise<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4457"]
  T16["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S16 -->|calls| T16
  S17["function:GC_save_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4677"]
  T17["function:backtrace<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:370"]
  S17 -->|calls| T17
  S18["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T18["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S18 -->|calls| T18
  S19["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T19["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S19 -->|calls| T19
  S20["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T20["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S20 -->|calls| T20
  S21["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T21["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S21 -->|calls| T21
  S22["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T22["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S22 -->|calls| T22
  S23["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T23["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S23 -->|calls| T23
  S24["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T24["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S24 -->|calls| T24
  S25["function:GC_print_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4765"]
  T25["function:backtrace_symbols<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/extra/msvc_dbg.c:375"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
