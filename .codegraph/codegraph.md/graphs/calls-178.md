# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1"]
  T1["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  S1 -->|calls| T1
  S2["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1"]
  T2["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S2 -->|calls| T2
  S3["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1"]
  T3["function:GetLastError<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/mono/mono/utils/mono-error-internals.h:322"]
  S3 -->|calls| T3
  S4["file:TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1"]
  T4["function:check_heap_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1578"]
  S4 -->|calls| T4
  S5["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T5["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S5 -->|calls| T5
  S6["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T6["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S6 -->|calls| T6
  S7["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T7["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S7 -->|calls| T7
  S8["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T8["function:GC_set_warn_proc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1882"]
  S8 -->|calls| T8
  S9["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T9["function:set_print_procs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1229"]
  S9 -->|calls| T9
  S10["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T10["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  S10 -->|calls| T10
  S11["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T11["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S11 -->|calls| T11
  S12["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T12["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S12 -->|calls| T12
  S13["function:test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2183"]
  T13["function:check_heap_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1578"]
  S13 -->|calls| T13
  S14["function:thr_run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2215"]
  T14["function:run_one_test<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:1269"]
  S14 -->|calls| T14
  S15["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T15["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S15 -->|calls| T15
  S16["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T16["function:GC_use_threads_discovery<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/darwin_stop_world.c:115"]
  S16 -->|calls| T16
  S17["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T17["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S17 -->|calls| T17
  S18["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T18["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S18 -->|calls| T18
  S19["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T19["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S19 -->|calls| T19
  S20["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T20["function:GC_enable_incremental<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1335"]
  S20 -->|calls| T20
  S21["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T21["function:GC_is_incremental_mode<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:109"]
  S21 -->|calls| T21
  S22["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T22["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S22 -->|calls| T22
  S23["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T23["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S23 -->|calls| T23
  S24["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T24["function:GC_set_min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:254"]
  S24 -->|calls| T24
  S25["function:main<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/tests/test.c:2225"]
  T25["function:GC_get_min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:260"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
