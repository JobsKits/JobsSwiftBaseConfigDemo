# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_post_incr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:268"]
  T1["function:GC_same_obj<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:39"]
  S1 -->|calls| T1
  S2["function:GC_post_incr<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:268"]
  T2["function:GC_is_valid_displacement<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/ptr_chck.c:117"]
  S2 -->|calls| T2
  S3["function:GC_add_leaked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:53"]
  T3["function:GC_set_mark_bit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:200"]
  S3 -->|calls| T3
  S4["function:GC_print_all_errors<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:70"]
  T4["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S4 -->|calls| T4
  S5["function:GC_print_all_errors<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:70"]
  T5["function:GC_free<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/malloc.c:562"]
  S5 -->|calls| T5
  S6["function:GC_reclaim_clear<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:149"]
  T6["function:GC_find_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:42"]
  S6 -->|calls| T6
  S7["function:GC_reclaim_check<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:277"]
  T7["function:GC_add_leaked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:53"]
  S7 -->|calls| T7
  S8["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  T8["function:GC_find_header<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:42"]
  S8 -->|calls| T8
  S9["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  T9["function:GC_remove_protection<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2931"]
  S9 -->|calls| T9
  S10["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  T10["function:GC_disclaim_and_reclaim<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:225"]
  S10 -->|calls| T10
  S11["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  T11["function:GC_reclaim_clear<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:149"]
  S11 -->|calls| T11
  S12["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  T12["function:GC_reclaim_uninit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:196"]
  S12 -->|calls| T12
  S13["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  T13["function:GC_set_hdr_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:163"]
  S13 -->|calls| T13
  S14["function:GC_reclaim_small_nonempty_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:340"]
  T14["function:GC_reclaim_check<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:277"]
  S14 -->|calls| T14
  S15["function:GC_reclaim_small_nonempty_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:340"]
  T15["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  S15 -->|calls| T15
  S16["function:GC_disclaim_and_reclaim_or_free_small_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:359"]
  T16["function:GC_reclaim_generic<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:309"]
  S16 -->|calls| T16
  S17["function:GC_disclaim_and_reclaim_or_free_small_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:359"]
  T17["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  S17 -->|calls| T17
  S18["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T18["function:GC_add_leaked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:53"]
  S18 -->|calls| T18
  S19["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T19["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  S19 -->|calls| T19
  S20["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T20["function:GC_block_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:131"]
  S20 -->|calls| T20
  S21["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T21["function:GC_reclaim_small_nonempty_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:340"]
  S21 -->|calls| T21
  S22["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T22["function:GC_disclaim_and_reclaim_or_free_small_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:359"]
  S22 -->|calls| T22
  S23["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T23["function:GC_freehblk<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/allchblk.c:872"]
  S23 -->|calls| T23
  S24["function:GC_reclaim_block<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:387"]
  T24["function:GC_block_nearly_full<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:136"]
  S24 -->|calls| T24
  S25["function:GC_n_set_marks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:519"]
  T25["function:set_bits<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/reclaim.c:507"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
