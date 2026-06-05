# `calls 符号关系 - 158`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_n_set_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:519"]
  T1["function:set_bits<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:507"]
  S1 -->|calls| T1
  S2["function:GC_n_set_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:519"]
  T2["function:set_bits<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:507"]
  S2 -->|calls| T2
  S3["function:GC_print_block_descr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:546"]
  T3["function:GC_n_set_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:519"]
  S3 -->|calls| T3
  S4["function:GC_print_block_descr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:546"]
  T4["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S4 -->|calls| T4
  S5["function:GC_print_block_descr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:546"]
  T5["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S5 -->|calls| T5
  S6["function:GC_print_block_list<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:569"]
  T6["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S6 -->|calls| T6
  S7["function:GC_print_block_list<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:569"]
  T7["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S7 -->|calls| T7
  S8["function:GC_print_block_list<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:569"]
  T8["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S8 -->|calls| T8
  S9["function:GC_print_free_list<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:586"]
  T9["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S9 -->|calls| T9
  S10["function:GC_start_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:625"]
  T10["function:GC_clear_fl_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:610"]
  S10 -->|calls| T10
  S11["function:GC_start_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:625"]
  T11["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S11 -->|calls| T11
  S12["function:GC_start_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:625"]
  T12["function:GC_reclaim_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:713"]
  S12 -->|calls| T12
  S13["function:GC_start_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:625"]
  T13["function:GC_reclaim_unconditionally_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:767"]
  S13 -->|calls| T13
  S14["function:GC_continue_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:686"]
  T14["function:GC_reclaim_small_nonempty_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:340"]
  S14 -->|calls| T14
  S15["function:GC_reclaim_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:713"]
  T15["function:GC_reclaim_small_nonempty_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:340"]
  S15 -->|calls| T15
  S16["function:GC_reclaim_all<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:713"]
  T16["function:GC_verbose_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1842"]
  S16 -->|calls| T16
  S17["function:GC_reclaim_unconditionally_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:767"]
  T17["function:GC_reclaim_small_nonempty_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:340"]
  S17 -->|calls| T17
  S18["function:GC_do_enumerate_reachable_objects<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:801"]
  T18["function:GC_block_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:131"]
  S18 -->|calls| T18
  S19["function:GC_enumerate_reachable_objects_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:827"]
  T19["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S19 -->|calls| T19
  S20["function:GC_setspecific<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:51"]
  T20["function:AO_store_release<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/libatomic_ops/src/atomic_ops/generalize-small.h:2054"]
  S20 -->|calls| T20
  S21["function:GC_remove_specific_after_fork<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:82"]
  T21["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S21 -->|calls| T21
  S22["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  T22["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S22 -->|calls| T22
  S23["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  T23["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S23 -->|calls| T23
  S24["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  T24["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S24 -->|calls| T24
  S25["function:GC_check_tsd_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/specific.c:162"]
  T25["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
