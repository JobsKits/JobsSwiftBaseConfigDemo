# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_register_finalizer_ignore_self<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:843"]
  T1["function:GC_register_finalizer_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:699"]
  S1 -->|calls| T1
  S2["function:GC_register_finalizer_no_order<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:851"]
  T2["function:GC_register_finalizer_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:699"]
  S2 -->|calls| T2
  S3["function:GC_register_finalizer_unreachable<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:862"]
  T3["function:GC_register_finalizer_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:699"]
  S3 -->|calls| T3
  S4["function:GC_dump_finalization_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:873"]
  T4["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S4 -->|calls| T4
  S5["function:GC_dump_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:894"]
  T5["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S5 -->|calls| T5
  S6["function:GC_dump_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:894"]
  T6["function:GC_dump_finalization_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:873"]
  S6 -->|calls| T6
  S7["function:GC_dump_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:894"]
  T7["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S7 -->|calls| T7
  S8["function:GC_dump_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:894"]
  T8["function:GC_dump_finalization_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:873"]
  S8 -->|calls| T8
  S9["function:GC_dump_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:894"]
  T9["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S9 -->|calls| T9
  S10["function:GC_dump_finalization<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:894"]
  T10["function:GC_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1791"]
  S10 -->|calls| T10
  S11["function:GC_make_disappearing_links_disappear<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:991"]
  T11["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S11 -->|calls| T11
  S12["function:GC_make_disappearing_links_disappear<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:991"]
  T12["function:GC_clear_mark_bit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:212"]
  S12 -->|calls| T12
  S13["function:GC_remove_dangling_disappearing_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1008"]
  T13["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S13 -->|calls| T13
  S14["function:GC_remove_dangling_disappearing_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1008"]
  T14["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S14 -->|calls| T14
  S15["function:GC_remove_dangling_disappearing_links<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1008"]
  T15["function:GC_clear_mark_bit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:212"]
  S15 -->|calls| T15
  S16["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T16["function:GC_mark_togglerefs<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:390"]
  S16 -->|calls| T16
  S17["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T17["function:GC_make_disappearing_links_disappear<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:991"]
  S17 -->|calls| T17
  S18["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T18["function:GC_size<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:466"]
  S18 -->|calls| T18
  S19["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T19["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S19 -->|calls| T19
  S20["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T20["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S20 -->|calls| T20
  S21["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T21["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S21 -->|calls| T21
  S22["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T22["function:GC_set_mark_bit<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:200"]
  S22 -->|calls| T22
  S23["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T23["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S23 -->|calls| T23
  S24["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T24["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S24 -->|calls| T24
  S25["function:GC_finalize<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/finalize.c:1027"]
  T25["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
