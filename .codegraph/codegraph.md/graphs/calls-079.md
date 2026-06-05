# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T1["function:GC_noop6<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:37"]
  S1 -->|calls| T1
  S2["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T2["function:GC_initiate_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:260"]
  S2 -->|calls| T2
  S3["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T3["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  S3 -->|calls| T3
  S4["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T4["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S4 -->|calls| T4
  S5["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T5["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S5 -->|calls| T5
  S6["function:GC_check_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:932"]
  T6["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S6 -->|calls| T6
  S7["function:GC_check_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:932"]
  T7["function:AO_load<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:1938"]
  S7 -->|calls| T7
  S8["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T8["function:GC_check_tls<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:292"]
  S8 -->|calls| T8
  S9["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T9["function:GC_print_address_map<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4930"]
  S9 -->|calls| T9
  S10["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T10["function:GC_set_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:899"]
  S10 -->|calls| T10
  S11["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T11["function:GC_start_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:625"]
  S11 -->|calls| T11
  S12["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T12["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  S12 -->|calls| T12
  S13["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T13["function:GC_traverse_back_graph<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:465"]
  S13 -->|calls| T13
  S14["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T14["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S14 -->|calls| T14
  S15["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T15["function:GC_clear_fl_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:976"]
  S15 -->|calls| T15
  S16["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T16["function:GC_start_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:625"]
  S16 -->|calls| T16
  S17["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T17["function:GC_compute_heap_usage_percent<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1023"]
  S17 -->|calls| T17
  S18["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T18["function:min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:267"]
  S18 -->|calls| T18
  S19["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T19["function:GC_unmap_old<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:403"]
  S19 -->|calls| T19
  S20["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T20["function:GC_print_finalization_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1420"]
  S20 -->|calls| T20
  S21["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T21["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S21 -->|calls| T21
  S22["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  T22["function:GC_print_finalization_stats<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1420"]
  S22 -->|calls| T22
  S23["function:GC_try_to_collect_general<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1179"]
  T23["function:GC_init<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:879"]
  S23 -->|calls| T23
  S24["function:GC_try_to_collect_general<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1179"]
  T24["function:GC_noop6<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:37"]
  S24 -->|calls| T24
  S25["function:GC_try_to_collect_general<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1179"]
  T25["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
