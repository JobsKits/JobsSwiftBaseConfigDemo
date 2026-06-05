# `calls 符号关系 - 078`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T1["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S1 -->|calls| T1
  S2["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T2["function:GC_promote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:137"]
  S2 -->|calls| T2
  S3["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T3["function:GC_wait_for_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:2245"]
  S3 -->|calls| T3
  S4["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T4["function:GC_reclaim_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:713"]
  S4 -->|calls| T4
  S5["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T5["function:GC_invalidate_mark_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:621"]
  S5 -->|calls| T5
  S6["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T6["function:GC_clear_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:250"]
  S6 -->|calls| T6
  S7["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T7["function:GC_save_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4677"]
  S7 -->|calls| T7
  S8["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T8["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  S8 -->|calls| T8
  S9["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T9["function:GC_invalidate_mark_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:621"]
  S9 -->|calls| T9
  S10["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T10["function:GC_unpromote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:170"]
  S10 -->|calls| T10
  S11["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T11["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  S11 -->|calls| T11
  S12["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T12["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S12 -->|calls| T12
  S13["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T13["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  S13 -->|calls| T13
  S14["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T14["function:GC_save_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4677"]
  S14 -->|calls| T14
  S15["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T15["function:GC_wait_for_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:2245"]
  S15 -->|calls| T15
  S16["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T16["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  S16 -->|calls| T16
  S17["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T17["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  S17 -->|calls| T17
  S18["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T18["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  S18 -->|calls| T18
  S19["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  T19["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  S19 -->|calls| T19
  S20["function:GC_collect_a_little<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:712"]
  T20["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  S20 -->|calls| T20
  S21["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T21["function:GC_add_current_malloc_heap<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:1823"]
  S21 -->|calls| T21
  S22["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T22["function:GC_cond_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:848"]
  S22 -->|calls| T22
  S23["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T23["function:GC_process_togglerefs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:333"]
  S23 -->|calls| T23
  S24["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T24["function:GC_build_back_graph<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:358"]
  S24 -->|calls| T24
  S25["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  T25["function:GC_clear_a_few_frames<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:357"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
