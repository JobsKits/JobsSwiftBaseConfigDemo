# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:push_in_progress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:129"]
  T1["function:GC_add_to_our_memory<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/alloc.c:1251"]
  S1 -->|calls| T1
  S2["function:push_in_progress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:129"]
  T2["function:GC_noop1<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:54"]
  S2 -->|calls| T2
  S3["function:ensure_struct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:209"]
  T3["function:new_back_edges<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:86"]
  S3 -->|calls| T3
  S4["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  T4["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S4 -->|calls| T4
  S5["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  T5["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S5 -->|calls| T5
  S6["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  T6["function:ensure_struct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:209"]
  S6 -->|calls| T6
  S7["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  T7["function:ensure_struct<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:209"]
  S7 -->|calls| T7
  S8["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  T8["function:new_back_edges<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:86"]
  S8 -->|calls| T8
  S9["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  T9["function:GC_err_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1807"]
  S9 -->|calls| T9
  S10["function:GC_apply_to_each_object<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:294"]
  T10["function:GC_apply_to_all_blocks<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/headers.c:328"]
  S10 -->|calls| T10
  S11["function:reset_back_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:299"]
  T11["function:deallocate_back_edges<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:111"]
  S11 -->|calls| T11
  S12["function:reset_back_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:299"]
  T12["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S12 -->|calls| T12
  S13["function:reset_back_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:299"]
  T13["function:deallocate_back_edges<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:111"]
  S13 -->|calls| T13
  S14["function:reset_back_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:299"]
  T14["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S14 -->|calls| T14
  S15["function:add_back_edges<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:335"]
  T15["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S15 -->|calls| T15
  S16["function:add_back_edges<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:335"]
  T16["function:add_edge<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:231"]
  S16 -->|calls| T16
  S17["function:GC_build_back_graph<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:358"]
  T17["function:GC_apply_to_each_object<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:294"]
  S17 -->|calls| T17
  S18["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  T18["function:is_in_progress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:165"]
  S18 -->|calls| T18
  S19["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  T19["function:push_in_progress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:129"]
  S19 -->|calls| T19
  S20["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  T20["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  S20 -->|calls| T20
  S21["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  T21["function:pop_in_progress<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:174"]
  S21 -->|calls| T21
  S22["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  T22["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S22 -->|calls| T22
  S23["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  T23["function:backwards_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:367"]
  S23 -->|calls| T23
  S24["function:update_max_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:417"]
  T24["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S24 -->|calls| T24
  S25["function:update_max_height<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/backgraph.c:417"]
  T25["function:GC_is_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:236"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
