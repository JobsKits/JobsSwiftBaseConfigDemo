# `calls 符号关系 - 077`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_allochblk_nth<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:686"]
  T1["function:GC_remove_protection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2931"]
  S1 -->|calls| T1
  S2["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T2["function:GC_remove_counts<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:316"]
  S2 -->|calls| T2
  S3["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T3["function:GC_free_block_ending_at<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:333"]
  S3 -->|calls| T3
  S4["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T4["function:GC_remove_from_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:327"]
  S4 -->|calls| T4
  S5["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T5["function:GC_remove_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:307"]
  S5 -->|calls| T5
  S6["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T6["function:GC_remove_from_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:327"]
  S6 -->|calls| T6
  S7["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T7["function:GC_remove_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:307"]
  S7 -->|calls| T7
  S8["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  T8["function:GC_add_to_fl<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:362"]
  S8 -->|calls| T8
  S9["function:min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:267"]
  T9["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S9 -->|calls| T9
  S10["function:min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:267"]
  T10["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S10 -->|calls| T10
  S11["function:min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:267"]
  T11["function:GC_approx_sp<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:484"]
  S11 -->|calls| T11
  S12["function:GC_start_incremental_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:377"]
  T12["function:GC_collect_a_little<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:712"]
  S12 -->|calls| T12
  S13["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:387"]
  T13["function:min_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:267"]
  S13 -->|calls| T13
  S14["function:(void)<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:387"]
  T14["function:GC_adj_bytes_allocd<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:316"]
  S14 -->|calls| T14
  S15["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T15["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  S15 -->|calls| T15
  S16["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T16["function:GC_wait_for_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/pthread_support.c:2245"]
  S16 -->|calls| T16
  S17["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T17["function:GC_promote_black_lists<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/blacklst.c:137"]
  S17 -->|calls| T17
  S18["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T18["function:GC_reclaim_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:713"]
  S18 -->|calls| T18
  S19["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T19["function:GC_notify_full_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:429"]
  S19 -->|calls| T19
  S20["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T20["function:GC_clear_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:250"]
  S20 -->|calls| T20
  S21["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T21["function:GC_stopped_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:754"]
  S21 -->|calls| T21
  S22["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T22["function:GC_save_callers<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:4677"]
  S22 -->|calls| T22
  S23["function:GC_maybe_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:446"]
  T23["function:GC_finish_collection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1033"]
  S23 -->|calls| T23
  S24["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T24["function:GC_collect_a_little_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:659"]
  S24 -->|calls| T24
  S25["function:GC_try_to_collect_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:524"]
  T25["function:GC_notify_full_gc<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:429"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
