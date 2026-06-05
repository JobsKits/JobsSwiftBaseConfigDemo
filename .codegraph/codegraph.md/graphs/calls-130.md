# `calls 符号关系 - 130`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T1["function:GC_push_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:875"]
  S1 -->|calls| T1
  S2["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T2["function:GC_do_parallel_mark<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:1226"]
  S2 -->|calls| T2
  S3["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T3["function:alloc_mark_stack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:1309"]
  S3 -->|calls| T3
  S4["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T4["function:GC_get_mark_stack_empty<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:2842"]
  S4 -->|calls| T4
  S5["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T5["function:alloc_mark_stack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:1309"]
  S5 -->|calls| T5
  S6["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T6["function:alloc_mark_stack<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:1309"]
  S6 -->|calls| T6
  S7["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T7["function:GC_push_next_marked<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:2028"]
  S7 -->|calls| T7
  S8["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  T8["function:GC_push_roots<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:875"]
  S8 -->|calls| T8
  S9["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T9["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  S9 -->|calls| T9
  S10["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T10["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  S10 -->|calls| T10
  S11["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T11["function:GC_setup_temporary_fault_handler<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:951"]
  S11 -->|calls| T11
  S12["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T12["function:GC_mark_some_inner<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:319"]
  S12 -->|calls| T12
  S13["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T13["function:GC_reset_fault_handler<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/os_dep.c:959"]
  S13 -->|calls| T13
  S14["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T14["function:GC_cond_register_dynamic_libraries<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark_rts.c:848"]
  S14 -->|calls| T14
  S15["function:GC_mark_some<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:493"]
  T15["function:GC_invalidate_mark_state<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:621"]
  S15 -->|calls| T15
  S16["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T16["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S16 -->|calls| T16
  S17["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T17["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S17 -->|calls| T17
  S18["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T18["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S18 -->|calls| T18
  S19["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T19["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S19 -->|calls| T19
  S20["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T20["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S20 -->|calls| T20
  S21["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T21["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S21 -->|calls| T21
  S22["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T22["function:GC_base<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:414"]
  S22 -->|calls| T22
  S23["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T23["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S23 -->|calls| T23
  S24["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T24["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S24 -->|calls| T24
  S25["function:GC_mark_from<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/mark.c:659"]
  T25["function:GC_log_printf<br/>TODO/Unity/xcode_effectTest/Il2CppOutputProject/IL2CPP/external/bdwgc/misc.c:1815"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
